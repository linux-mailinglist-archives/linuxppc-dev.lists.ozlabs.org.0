Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A943073ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 11:41:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRH8X6ZYNzDrdh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 21:41:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRH6Z3qYvzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 21:40:06 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-22-Mh8XAN6PMv-tzehDTK-v6g-1; Thu, 28 Jan 2021 10:38:18 +0000
X-MC-Unique: Mh8XAN6PMv-tzehDTK-v6g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 28 Jan 2021 10:38:16 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 28 Jan 2021 10:38:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Christopher M. Riedl'" <cmr@codefail.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Topic: [PATCH v4 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Thread-Index: AQHW9SvhJlSFmYQ9tkmGvwf2LRQAGqo811Mw
Date: Thu, 28 Jan 2021 10:38:16 +0000
Message-ID: <6a6ce1a53fcf4669a9848114d3460fef@AcuMS.aculab.com>
References: <20210128040424.12720-1-cmr@codefail.de>
 <20210128040424.12720-3-cmr@codefail.de>
In-Reply-To: <20210128040424.12720-3-cmr@codefail.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christopher M. Riedl
> Sent: 28 January 2021 04:04
>=20
> Reuse the "safe" implementation from signal.c except for calling
> unsafe_copy_from_user() to copy into a local buffer.
>=20
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index 2559a681536e..c18402d625f1 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struct =
*task, void __user *from);
>  =09=09=09=09&buf[i], label);\
>  } while (0)
>=20
> +#define unsafe_copy_fpr_from_user(task, from, label)=09do {=09=09\
> +=09struct task_struct *__t =3D task;=09=09=09=09=09\
> +=09u64 __user *__f =3D (u64 __user *)from;=09=09=09=09\
> +=09u64 buf[ELF_NFPREG];=09=09=09=09=09=09\

How big is that buffer?
Isn't is likely to be reasonably large compared to a reasonable
kernel stack frame.
Especially since this isn't even a leaf function.

> +=09int i;=09=09=09=09=09=09=09=09\
> +=09=09=09=09=09=09=09=09=09\
> +=09unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),=09\

That really ought to be sizeof(buf).

=09David


> +=09=09=09=09label);=09=09=09=09=09\
> +=09for (i =3D 0; i < ELF_NFPREG - 1; i++)=09=09=09=09\
> +=09=09__t->thread.TS_FPR(i) =3D buf[i];=09=09=09=09\
> +=09__t->thread.fp_state.fpscr =3D buf[i];=09=09=09=09\
> +} while (0)
> +
> +#define unsafe_copy_vsx_from_user(task, from, label)=09do {=09=09\
> +=09struct task_struct *__t =3D task;=09=09=09=09=09\
> +=09u64 __user *__f =3D (u64 __user *)from;=09=09=09=09\
> +=09u64 buf[ELF_NVSRHALFREG];=09=09=09=09=09\
> +=09int i;=09=09=09=09=09=09=09=09\
> +=09=09=09=09=09=09=09=09=09\
> +=09unsafe_copy_from_user(buf, __f,=09=09=09=09=09\
> +=09=09=09=09ELF_NVSRHALFREG * sizeof(double),=09\
> +=09=09=09=09label);=09=09=09=09=09\
> +=09for (i =3D 0; i < ELF_NVSRHALFREG ; i++)=09=09=09=09\
> +=09=09__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] =3D buf[i];=09\
> +} while (0)
> +
> +
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  #define unsafe_copy_ckfpr_to_user(to, task, label)=09do {=09=09\
>  =09struct task_struct *__t =3D task;=09=09=09=09=09\
> @@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_struct=
 *task, void __user *from);
>  =09unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,=09\
>  =09=09=09    ELF_NFPREG * sizeof(double), label)
>=20
> +#define unsafe_copy_fpr_from_user(task, from, label)=09=09=09\
> +=09unsafe_copy_from_user((task)->thread.fp_state.fpr, from,=09\
> +=09=09=09    ELF_NFPREG * sizeof(double), label)
> +
>  static inline unsigned long
>  copy_fpr_to_user(void __user *to, struct task_struct *task)
>  {
> @@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, void _=
_user *from)
>  #else
>  #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
>=20
> +#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
> +
>  static inline unsigned long
>  copy_fpr_to_user(void __user *to, struct task_struct *task)
>  {
> --
> 2.26.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


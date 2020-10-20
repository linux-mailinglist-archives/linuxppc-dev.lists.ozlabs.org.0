Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C8293340
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 04:40:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdC45qXRzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 13:40:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFd97656lzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 13:38:34 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUhXf-00091K-4B; Mon, 19 Oct 2020 19:38:31 -0700
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 1A766A70;
 Tue, 20 Oct 2020 02:38:25 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 04AF660047;
 Mon, 19 Oct 2020 22:38:25 -0400 (EDT)
Received: from localhost (unknown [10.20.151.241])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id C2C6160045;
 Tue, 20 Oct 2020 02:38:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 19 Oct 2020 21:01:21 -0500
Message-Id: <C6HCJAJH1QOC.1U5G1AHURT3NJ@geist>
In-Reply-To: <5e15b794-e33e-a871-3296-df1154b7d408@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhVIYEIrI1+IPiB
 u3xbjzdyyUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kwi4BXSuOO65HxJws2e+QTrd8
 cnMVGQoZ8W9SqygcY4DfgwIv96ey3i8S2kDiV4NFL0mKUVqHu+m9KLsR0ilyGUGlz8CJSOMrvzx9
 TVg3RkUfEwfhAQRayU9yh7uUCyW4p8jZ4AoGBlDR94YkH0RjFRfL4EkKxU9ObJV0pa6ww8AiiPMZ
 yTxq5Zj1313L44OSS1ueBonkNzcqLq2LIe51i/Dk3+iNqiYKhZaJO2iXygjDQWjOmI87Lh7Y8XsC
 bZWVvRkWzsAgaWolxIxCj2GHto6atsxaFkWS/KO9ggVt7y11v0HCq9Ij3WgoQoezM+scaWWR7drM
 d0qbJIo1RVCXie2VXGdtLyog7ui50fJvZPWymVBEglNuNDdi9xAbizrH5OsVdOhXIGZEKBBVfrNX
 IVS7yrN4xA/q5McvR31SN9iB8Wsvf3buc8teJ1RiHNMvIwZgYFwjw1mzO+UJiTlJpdvpo2UgV9PP
 0GtOSQCD3Wp6EipRzMVZ5LqwTx7Vvn9SWQRihqWRcCaa7yMGNcHiKrDnA3wXPkA2INjAw9EFTL7j
 9F/zRLt6ogdwVndq1MMDmdLMVjKL1rrZibSGL3heGOgLajiYZlmwZdifT41pqqED3WbML0pHvwic
 IIZgSSF9KjOelVZXLMA29DfEruL6DYsEMysPur9wmiDBurOy6iTDrd0x+3YQnB0RHLi/vQmrViIQ
 n70lBYH88dpo7a4LbTlCkrnRSCw5DxM8/gaaExwqRf2mnYGPQXhTkxZo1zKSctgzcDoFd+96Xw4Q
 UNtTnTj+sNQbfmTcbCI4bP4Q2wTKDIqtF9zdULrTh6VP35X/OeA38wHfD4EgRY6r4dAy/Ob9MbqY
 98fRJO0WnyWriaVOP34VGRo5L8M2MA2Zvy07Qp3F8cjyBYzOHeaMieHYbzkjHv8L1XCo8f/lClCd
 nQEV4c33O1R/KGaKK9RjaKoDpQVQQrINKHxdrweiF9kFyBNoYrJRVwuktqDPF7HQoew=
X-Report-Abuse-To: spam@se5.registrar-servers.com
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

On Fri Oct 16, 2020 at 10:48 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > Reuse the "safe" implementation from signal.c except for calling
> > unsafe_copy_from_user() to copy into a local buffer. Unlike the
> > unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
> > cannot use unsafe_get_user() directly to bypass the local buffer since
> > doing so significantly reduces signal handling performance.
>
> Why can't the functions use unsafe_get_user(), why does it significantly
> reduces signal handling
> performance ? How much significant ? I would expect that not going
> through an intermediate memory
> area would be more efficient
>

Here is a comparison, 'unsafe-signal64-regs' avoids the intermediate buffer=
:

	|                      | hash   | radix  |
	| -------------------- | ------ | ------ |
	| linuxppc/next        | 289014 | 158408 |
	| unsafe-signal64      | 298506 | 253053 |
	| unsafe-signal64-regs | 254898 | 220831 |

I have not figured out the 'why' yet. As you mentioned in your series,
technically calling __copy_tofrom_user() is overkill for these
operations. The only obvious difference between unsafe_put_user() and
unsafe_get_user() is that we don't have asm-goto for the 'get' variant.
Instead we wrap with unsafe_op_wrap() which inserts a conditional and
then goto to the label.

Implemenations:

	#define unsafe_copy_fpr_from_user(task, from, label)   do {            \
	       struct task_struct *__t =3D task;                                 \
	       u64 __user *buf =3D (u64 __user *)from;                           \
	       int i;                                                          \
									       \
	       for (i =3D 0; i < ELF_NFPREG - 1; i++)                            \
		       unsafe_get_user(__t->thread.TS_FPR(i), &buf[i], label); \
	       unsafe_get_user(__t->thread.fp_state.fpscr, &buf[i], label);    \
	} while (0)

	#define unsafe_copy_vsx_from_user(task, from, label)   do {            \
	       struct task_struct *__t =3D task;                                 \
	       u64 __user *buf =3D (u64 __user *)from;                           \
	       int i;                                                          \
									       \
	       for (i =3D 0; i < ELF_NVSRHALFREG ; i++)                          \
		       unsafe_get_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET], \
				       &buf[i], label);                        \
	} while (0)

> Christophe
>
>
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
> >   1 file changed, 33 insertions(+)
> >=20
> > diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.=
h
> > index 2559a681536e..e9aaeac0da37 100644
> > --- a/arch/powerpc/kernel/signal.h
> > +++ b/arch/powerpc/kernel/signal.h
> > @@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struc=
t *task, void __user *from);
> >   				&buf[i], label);\
> >   } while (0)
> >  =20
> > +#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
> > +	struct task_struct *__t =3D task;					\
> > +	u64 __user *__f =3D (u64 __user *)from;				\
> > +	u64 buf[ELF_NFPREG];						\
> > +	int i;								\
> > +									\
> > +	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
> > +				label);					\
> > +	for (i =3D 0; i < ELF_NFPREG - 1; i++)				\
> > +		__t->thread.TS_FPR(i) =3D buf[i];				\
> > +	__t->thread.fp_state.fpscr =3D buf[i];				\
> > +} while (0)
> > +
> > +#define unsafe_copy_vsx_from_user(task, from, label)	do {		\
> > +	struct task_struct *__t =3D task;					\
> > +	u64 __user *__f =3D (u64 __user *)from;				\
> > +	u64 buf[ELF_NVSRHALFREG];					\
> > +	int i;								\
> > +									\
> > +	unsafe_copy_from_user(buf, __f,					\
> > +				ELF_NVSRHALFREG * sizeof(double),	\
> > +				label);					\
> > +	for (i =3D 0; i < ELF_NVSRHALFREG ; i++)				\
> > +		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] =3D buf[i];	\
> > +} while (0)
> > +
> > +
> >   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> >   #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
> >   	struct task_struct *__t =3D task;					\
> > @@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_stru=
ct *task, void __user *from);
> >   	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
> >   			    ELF_NFPREG * sizeof(double), label)
> >  =20
> > +#define unsafe_copy_fpr_from_user(task, from, label)		\
> > +	unsafe_copy_from_user((task)->thread.fp_state.fpr, from	\
> > +			    ELF_NFPREG * sizeof(double), label)
> > +
> >   static inline unsigned long
> >   copy_fpr_to_user(void __user *to, struct task_struct *task)
> >   {
> > @@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, void=
 __user *from)
> >   #else
> >   #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
> >  =20
> > +#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
> > +
> >   static inline unsigned long
> >   copy_fpr_to_user(void __user *to, struct task_struct *task)
> >   {
> >=20


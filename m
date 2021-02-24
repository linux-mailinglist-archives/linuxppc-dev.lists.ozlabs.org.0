Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3D8324373
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 19:01:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm3dZ1253z3cl4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 05:01:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm3dF2ZVDz30JZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:01:21 +1100 (AEDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 0FF4B81339
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 13:01:15 -0500 (EST)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 225F160059;
 Wed, 24 Feb 2021 13:01:09 -0500 (EST)
Received: from localhost (unknown [10.20.151.209])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id CEE096005C;
 Wed, 24 Feb 2021 18:01:08 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Feb 2021 12:01:08 -0600
Message-Id: <C9HYHCHCYY6L.1A8D3C1LZRWIY@oc8246131445.ibm.com>
Subject: Re: [PATCH v6 01/10] powerpc/uaccess: Add unsafe_copy_from_user
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210221012401.22328-1-cmr@codefail.de>
 <20210221012401.22328-2-cmr@codefail.de>
 <3393c40b-6f5f-3683-d03b-aa19bd25d655@csgroup.eu>
In-Reply-To: <3393c40b-6f5f-3683-d03b-aa19bd25d655@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Feb 23, 2021 at 11:15 AM CST, Christophe Leroy wrote:
>
>
> Le 21/02/2021 =C3=A0 02:23, Christopher M. Riedl a =C3=A9crit :
> > Just wrap __copy_tofrom_user() for the usual 'unsafe' pattern which
> > accepts a label to goto on error.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > Reviewed-by: Daniel Axtens <dja@axtens.net>
> > ---
> >   arch/powerpc/include/asm/uaccess.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/=
asm/uaccess.h
> > index 78e2a3990eab..33b2de642120 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -487,6 +487,9 @@ user_write_access_begin(const void __user *ptr, siz=
e_t len)
> >   #define unsafe_put_user(x, p, e) \
> >   	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
> >  =20
> > +#define unsafe_copy_from_user(d, s, l, e) \
> > +	unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
> > +
>
> Could we perform same as unsafe_copy_to_user() instead of calling an
> external function which is
> banned in principle inside uaccess blocks ?

Yup, with your patch to move the barrier_nospec() into the allowance
helpers this makes sense now. I just tried it and performance does not
change significantly w/ either radix or hash translation. I will include
this change in the next spin - thanks!

>
>
> >   #define unsafe_copy_to_user(d, s, l, e) \
> >   do {									\
> >   	u8 __user *_dst =3D (u8 __user *)(d);				\
> >=20


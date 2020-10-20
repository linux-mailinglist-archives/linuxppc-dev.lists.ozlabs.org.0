Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14907293370
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 05:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdp22tGszDqW2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:07:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdmB0wxpzDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 14:05:30 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUhxi-00067D-6l; Mon, 19 Oct 2020 20:05:26 -0700
Received: from MTA-08-1.privateemail.com (unknown [10.20.147.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id A3EFDA70;
 Tue, 20 Oct 2020 03:05:21 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 8B0E660033;
 Mon, 19 Oct 2020 23:05:21 -0400 (EDT)
Received: from localhost (unknown [10.20.151.230])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 55D2360038;
 Tue, 20 Oct 2020 03:05:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 1/8] powerpc/uaccess: Add unsafe_copy_from_user
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 19 Oct 2020 22:00:34 -0500
Message-Id: <C6HDSMS3AF6G.3PBYFJCUSLSU9@geist>
In-Reply-To: <5dc712e9-4d08-b436-3137-d1ac100f2bfb@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00309361389008)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhV8lRyGjPodVtr
 arCvdWg9SETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kwi4BXSuOO65HxJws2e+QTrd8
 cnMVGQoZ8W9SqygcY4DfgwIv96ey3i8S2kDiV4NFL0mKUVqHu+m9KLsR0ilyGUGlz8CJSOMrvzx9
 TVg3RkWOn6XK259X7SOmnMPYdg4vp8jZ4AoGBlDR94YkH0RjFRfL4EkKxU9ObJV0pa6ww8AiiPMZ
 yTxq5Zj1313L44OSS1ueBonkNzcqLq2LIe51i/Dk3+iNqiYKhZaJO2iXygjDQWjOmI87Lh7Y8XsC
 bZWVvRkWzsAgaWolxIxCj2GHto6atsxaFkWS/KO9ggVt7y11v0HCq9Ij3WgoQoezM+scaWWR7drM
 d0qbJIo1RVCXie2VXGdtLyog7ui50fJvZPWymVBEglNuNDdi9xAbizrHQe+bc+r9MxWEuItVKVsO
 chW6PYU7vZf9hpAifuf5iKzfX8TdqEXkwxwMjsp2mNAp/RfNE82Z0j/SGVOKzpZStLLrEkdjWooj
 rxhIwxLjxK3LgKffTIgl7nuGO/IJU1342OUMeHyTpNN0eXybX/w7/4a+Zyc1sUYlckMDbruAhxcr
 zyR3yXPdggqRch5qYBgdiEv3LcyF4PeZ2Kcbyk5JAhlo/0kffLsdHm0fM6lr9GPVD+jIDbIGKQ3C
 QWARR0256cR0wOIgRm2hJfLmYEHLuNO6UlGm0ycQh0Ylbt1+Ear3Y80OmAux3oN13+ztUzne3jdp
 YBMFjVxNUx8bpJ4bPiG/x2hyPJvsEORuxUz9b6ETMFFQ36qcvKwKb8V+SJ+wS9Hvsn4SH71MrSE3
 CryoJlz1pRXWhjh9fdbl44I0Df2OsG3EZZg2uoCaGUazTdO7HUifxNxi/vr+xe0awpy3/ac9nHrO
 TNZtkVLPUrmUqzE1N30qb7V+5A0U/gKkK9k9/8Rp6VG8MMj91VO6Xp0YgpWAX6frP3SxSkEBDMTz
 FORFgwmpUOXPcPeresbPjCmptaly/uPaPGs4IuAYIIDnnqEO+NQBOd/FKlhsdD5U1GS+QVH2BVkH
 vSrZKgwA8kr3
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

On Fri Oct 16, 2020 at 10:17 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > Implement raw_copy_from_user_allowed() which assumes that userspace rea=
d
> > access is open. Use this new function to implement raw_copy_from_user()=
.
> > Finally, wrap the new function to follow the usual "unsafe_" convention
> > of taking a label argument. The new raw_copy_from_user_allowed() calls
> > __copy_tofrom_user() internally, but this is still safe to call in user
> > access blocks formed with user_*_access_begin()/user_*_access_end()
> > since asm functions are not instrumented for tracing.
>
> Would objtool accept that if it was implemented on powerpc ?
>
> __copy_tofrom_user() is a function which is optimised for larger memory
> copies (using dcbz, etc ...)
> Do we need such an optimisation for unsafe_copy_from_user() ? Or can we
> do a simple loop as done for
> unsafe_copy_to_user() instead ?

I tried using a simple loop based on your unsafe_copy_to_user()
implementation. Similar to the copy_{vsx,fpr}_from_user() results there
is a hit to signal handling performance. The results with the loop are
in the 'unsafe-signal64-copy' column:

	|                      | hash   | radix  |
	| -------------------- | ------ | ------ |
	| linuxppc/next        | 289014 | 158408 |
	| unsafe-signal64      | 298506 | 253053 |
	| unsafe-signal64-copy | 197029 | 177002 |

Similar to the copy_{vsx,fpr}_from_user() patch I don't fully understand
why this performs so badly yet.

Implementation:

	unsafe_copy_from_user(d, s, l, e) \
	do {                                                                   \
	       u8 *_dst =3D (u8 *)(d);                                           \
	       const u8 __user *_src =3D (u8 __user*)(s);                         =
       \
	       size_t _len =3D (l);                                              \
	       int _i;                                                         \
									       \
	       for (_i =3D 0; _i < (_len & ~(sizeof(long) - 1)); _i +=3D sizeof(lo=
ng))             \
		       unsafe_get_user(*(long*)(_dst + _i), (long __user *)(_src + _i), e=
);    \
	       if (IS_ENABLED(CONFIG_PPC64) && (_len & 4)) {                   \
		       unsafe_get_user(*(u32*)(_dst + _i), (u32 __user *)(_src + _i), e);=
      \
		       _i +=3D 4;                                                \
	       }                                                               \
	       if (_len & 2) {                                                 \
		       unsafe_get_user(*(u16*)(_dst + _i), (u16 __user *)(_src + _i), e);=
      \
		       _i +=3D 2;                                                \
	       }                                                               \
	       if (_len & 1)                                                   \
		       unsafe_get_user(*(u8*)(_dst + _i), (u8 __user *)(_src + _i), e);  =
      \
	} while (0)

>
> Christophe
>
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
> >   1 file changed, 19 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/=
asm/uaccess.h
> > index 26781b044932..66940b4eb692 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -418,38 +418,45 @@ raw_copy_in_user(void __user *to, const void __us=
er *from, unsigned long n)
> >   }
> >   #endif /* __powerpc64__ */
> >  =20
> > -static inline unsigned long raw_copy_from_user(void *to,
> > -		const void __user *from, unsigned long n)
> > +static inline unsigned long
> > +raw_copy_from_user_allowed(void *to, const void __user *from, unsigned=
 long n)
> >   {
> > -	unsigned long ret;
> >   	if (__builtin_constant_p(n) && (n <=3D 8)) {
> > -		ret =3D 1;
> > +		unsigned long ret =3D 1;
> >  =20
> >   		switch (n) {
> >   		case 1:
> >   			barrier_nospec();
> > -			__get_user_size(*(u8 *)to, from, 1, ret);
> > +			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
> >   			break;
> >   		case 2:
> >   			barrier_nospec();
> > -			__get_user_size(*(u16 *)to, from, 2, ret);
> > +			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
> >   			break;
> >   		case 4:
> >   			barrier_nospec();
> > -			__get_user_size(*(u32 *)to, from, 4, ret);
> > +			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
> >   			break;
> >   		case 8:
> >   			barrier_nospec();
> > -			__get_user_size(*(u64 *)to, from, 8, ret);
> > +			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
> >   			break;
> >   		}
> >   		if (ret =3D=3D 0)
> >   			return 0;
> >   	}
> >  =20
> > +	return __copy_tofrom_user((__force void __user *)to, from, n);
> > +}
> > +
> > +static inline unsigned long
> > +raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> > +{
> > +	unsigned long ret;
> > +
> >   	barrier_nospec();
> >   	allow_read_from_user(from, n);
> > -	ret =3D __copy_tofrom_user((__force void __user *)to, from, n);
> > +	ret =3D raw_copy_from_user_allowed(to, from, n);
> >   	prevent_read_from_user(from, n);
> >   	return ret;
> >   }
> > @@ -571,6 +578,9 @@ user_write_access_begin(const void __user *ptr, siz=
e_t len)
> >   #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x,=
 p), e)
> >   #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
> >  =20
> > +#define unsafe_copy_from_user(d, s, l, e) \
> > +	unsafe_op_wrap(raw_copy_from_user_allowed(d, s, l), e)
> > +
> >   #define unsafe_copy_to_user(d, s, l, e) \
> >   do {									\
> >   	u8 __user *_dst =3D (u8 __user *)(d);				\
> >=20


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F52F9425
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 18:28:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJhhV2VR7zDqTL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 04:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJhfy0K7gzDrcH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 04:26:49 +1100 (AEDT)
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com
 [68.65.122.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id CDC7B800C6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 12:26:46 -0500 (EST)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 27B9760090;
 Sun, 17 Jan 2021 12:26:43 -0500 (EST)
Received: from localhost (unknown [10.20.151.227])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id E892F6008F;
 Sun, 17 Jan 2021 17:26:42 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v3 1/8] powerpc/uaccess: Add unsafe_copy_from_user
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Sun, 17 Jan 2021 11:19:18 -0600
Message-Id: <C8LLSM3UC598.L4E2VMGJOI06@geist>
In-Reply-To: <eb4f68f4-f606-007d-6552-8a46cb9912b4@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jan 11, 2021 at 7:22 AM CST, Christophe Leroy wrote:
>
>
> Le 09/01/2021 =C3=A0 04:25, Christopher M. Riedl a =C3=A9crit :
> > Implement raw_copy_from_user_allowed() which assumes that userspace rea=
d
> > access is open. Use this new function to implement raw_copy_from_user()=
.
> > Finally, wrap the new function to follow the usual "unsafe_" convention
> > of taking a label argument.
>
> I think there is no point implementing raw_copy_from_user_allowed(), see
> https://github.com/linuxppc/linux/commit/4b842e4e25b1 and
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8c74fc9ce8131cabb=
10b3e95dc0e430f396ee83e.1610369143.git.christophe.leroy@csgroup.eu/
>
> You should simply do:
>
> #define unsafe_copy_from_user(d, s, l, e) \
> unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
>

I gave this a try and the signal ops decreased by ~8K. Now, to be
honest, I am not sure what an "acceptable" benchmark number here
actually is - so maybe this is ok? Same loss with both radix and hash:

	|                                      | hash   | radix  |
	| ------------------------------------ | ------ | ------ |
	| linuxppc/next                        | 118693 | 133296 |
	| linuxppc/next w/o KUAP+KUEP          | 228911 | 228654 |
	| unsafe-signal64                      | 200480 | 234067 |
	| unsafe-signal64 (__copy_tofrom_user) | 192467 | 225119 |

To put this into perspective, prior to KUAP and uaccess flush, signal
performance in this benchmark was ~290K on hash.

>
> Christophe
>
> >=20
> > The new raw_copy_from_user_allowed() calls non-inline __copy_tofrom_use=
r()
> > internally. This is still safe to call inside user access blocks formed
> > with user_*_access_begin()/user_*_access_end() since asm functions are =
not
> > instrumented for tracing.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/include/asm/uaccess.h | 28 +++++++++++++++++++---------
> >   1 file changed, 19 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/=
asm/uaccess.h
> > index 501c9a79038c..698f3a6d6ae5 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -403,38 +403,45 @@ raw_copy_in_user(void __user *to, const void __us=
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
> > @@ -542,6 +549,9 @@ user_write_access_begin(const void __user *ptr, siz=
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


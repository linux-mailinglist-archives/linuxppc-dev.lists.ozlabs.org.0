Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1436E11A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 23:42:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVsYG6nhRz30Ds
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 07:42:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzOjGkJG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IzOjGkJG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVsXr1G15z2xYZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 07:42:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 867026109E;
 Wed, 28 Apr 2021 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619646121;
 bh=/FqzLyiQG2TidUZeI8wOLrCqqNWXPY9fDvUK5Ou+J9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IzOjGkJGZZuNZqMtVxcYh6/GsOckaascVKZeMTOxQculdz5GnxPqljv9kJDIW5Zsr
 /691JfquDatnK0+x6CgFGyRtJYoDjq05QjyqcBYAOXPRs/gVXWf92UmIxbNDkhcbZ/
 yl74brMI8bWDjTQ5beBbP9xaWY/YX6KQzDmt/V6SpCqtDhNEct7n8DPqzHqKQWME+4
 hpOZPSvU4bTReDjuQMKS3g+k3EjiN38GyqqHxyiJ4P3czBxqTfJJ2IIvG0fIRLT6JP
 gF0F6F2oXbDFu7RYV+jVWHlhMlObB7ZBcrGU7tFc3bsHBaaqCFVRGTBMUpvvqRYrfP
 yURNSuw3GSBbQ==
Date: Wed, 28 Apr 2021 14:41:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Avoid clang uninitialized warning in
 __get_user_size_allowed
Message-ID: <YInWpCO/bFzcmawv@archlinux-ax161>
References: <20210426203518.981550-1-nathan@kernel.org>
 <32a0f305-031b-e4da-345d-0f03b2b42189@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a0f305-031b-e4da-345d-0f03b2b42189@csgroup.eu>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 27, 2021 at 07:05:12AM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/04/2021 à 22:35, Nathan Chancellor a écrit :
> > Commit 9975f852ce1b ("powerpc/uaccess: Remove calls to __get_user_bad()
> > and __put_user_bad()") switch to BUILD_BUG() in the default case, which
> > leaves x uninitialized. This will not be an issue because the build will
> > be broken in that case but clang does static analysis before it realizes
> > the default case will be done so it warns about x being uninitialized
> > (trimmed for brevity):
> > 
> >   In file included from mm/mprotect.c:13:
> >   In file included from ./include/linux/hugetlb.h:28:
> >   In file included from ./include/linux/mempolicy.h:16:
> >   ./include/linux/pagemap.h:772:16: warning: variable '__gu_val' is used
> >   uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
> >                   if (unlikely(__get_user(c, uaddr) != 0))
> >                                ^~~~~~~~~~~~~~~~~~~~
> >   ./arch/powerpc/include/asm/uaccess.h:266:2: note: expanded from macro '__get_user'
> >           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   ./arch/powerpc/include/asm/uaccess.h:235:2: note: expanded from macro
> >   '__get_user_size_allowed'
> >          default: BUILD_BUG();                                   \
> >          ^~~~~~~
> > 
> > Commit 5cd29b1fd3e8 ("powerpc/uaccess: Use asm goto for get_user when
> > compiler supports it") added an initialization for x because of the same
> > reason. Do the same thing here so there is no warning across all
> > versions of clang.
> 
> Ah yes, I tested with Clang 11 which has CONFIG_CC_HAS_ASM_GOTO_OUTPUT,
> that's the reason why I hit that warning only in the
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT branch.
> 
> But regardless, is that normal that Clang warns that on a never taken branch ? That's puzzling.

It seems to be related to the fact that the value of sizeof is assigned
to a variable. At this point in the pipeline, clang does not realize
that the default branch is never taken because __gu_size has not
actually been evaluated. If you stuck a numeric constant in there, it
would not fire.

A simple example: https://godbolt.org/z/jbrqEbh1j

It is possible that could be improved in clang but I am not sure.

> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1359
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks for taking a look!

Cheers,
Nathan

> > ---
> >   arch/powerpc/include/asm/uaccess.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> > index a4e791bcd3fe..a09e4240c5b1 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -232,7 +232,7 @@ do {								\
> >   	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
> >   	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
> >   	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
> > -	default: BUILD_BUG();					\
> > +	default: x = 0; BUILD_BUG();				\
> >   	}							\
> >   } while (0)
> > 
> > base-commit: ee6b25fa7c037e42cc5f3b5c024b2a779edab6dd
> > 

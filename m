Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 445893FE992
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 08:55:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0Wsd1KLsz2yP9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 16:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=J7gbN5uh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1fe5bfb7fcaf9fee4071+6584+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=J7gbN5uh; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Wrz1pH8z2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 16:55:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Mh8OchEd6FmGVIr9IY/rauTsPqFSK4QQAj2HctJHOu4=; b=J7gbN5uh8SlTASWpJ8YSA/TxVp
 lRefSwd0KAjIrpx1kPoz69y1TgfsjptLpjnJhJjVCNoq4eLwgV/iU4LLKroQEzsRRIV4Inn2yRl/L
 ugMpGLIjN2S0kQE2XT2wxm/typgyWvsbF/YlAETUK69H3vZiuvlp7aT2oykWDvWdisTh0/3ZuIcY4
 5rMX90ZC0EhcOVMDYtEHLqQqREiPJU16Zdvr3/93rVTJWGzem6aYyq49AUGjQ9ect9XpVT9rgFoDY
 vEZu9ETLADTmtAa37kANnFDsc3RABHwM9ZwGKcS7nb5m1bNvbQHXEBEvtSg04DtDQeHPmUa076fxh
 gNSWBQ6Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mLgc3-003BxP-Er; Thu, 02 Sep 2021 06:54:28 +0000
Date: Thu, 2 Sep 2021 07:54:15 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
Message-ID: <YTB1F7o15FrxmmP1@infradead.org>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 23, 2021 at 03:35:53PM +0000, Christophe Leroy wrote:
> In the same spirit as commit fb05121fd6a2 ("signal: Add
> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
> copy_siginfo_to_user() in order to use it within user access blocks.
> 
> For that, also add an 'unsafe' version of clear_user().

I'm a little worried about all these unsafe helper in powerpc and the
ever increasing scope of the unsafe sections.  Can you at least at
powerpc support to objtool to verify them?  objtool verifications has
helped to find quite a few bugs in unsafe sections on x86.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/signal.h  | 15 +++++++++++++++
>  include/linux/uaccess.h |  1 +
>  kernel/signal.c         |  5 -----
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/signal.h b/include/linux/signal.h
> index 3454c7ff0778..659bd43daf10 100644
> --- a/include/linux/signal.h
> +++ b/include/linux/signal.h
> @@ -35,6 +35,21 @@ static inline void copy_siginfo_to_external(siginfo_t *to,
>  int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from);
>  int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from);
>  
> +static __always_inline char __user *si_expansion(const siginfo_t __user *info)
> +{
> +	return ((char __user *)info) + sizeof(struct kernel_siginfo);
> +}
> +
> +#define unsafe_copy_siginfo_to_user(to, from, label) do {		\
> +	siginfo_t __user *__ucs_to = to;				\
> +	const kernel_siginfo_t *__ucs_from = from;			\
> +	char __user *__ucs_expansion = si_expansion(__ucs_to);		\
> +									\
> +	unsafe_copy_to_user(__ucs_to, __ucs_from,			\
> +			    sizeof(struct kernel_siginfo), label);	\
> +	unsafe_clear_user(__ucs_expansion, SI_EXPANSION_SIZE, label);	\
> +} while (0)
> +
>  enum siginfo_layout {
>  	SIL_KILL,
>  	SIL_TIMER,
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index c05e903cef02..37073caac474 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -398,6 +398,7 @@ long strnlen_user_nofault(const void __user *unsafe_addr, long count);
>  #define unsafe_put_user(x,p,e) unsafe_op_wrap(__put_user(x,p),e)
>  #define unsafe_copy_to_user(d,s,l,e) unsafe_op_wrap(__copy_to_user(d,s,l),e)
>  #define unsafe_copy_from_user(d,s,l,e) unsafe_op_wrap(__copy_from_user(d,s,l),e)
> +#define unsafe_clear_user(d, l, e) unsafe_op_wrap(__clear_user(d, l), e)
>  static inline unsigned long user_access_save(void) { return 0UL; }
>  static inline void user_access_restore(unsigned long flags) { }
>  #endif
> diff --git a/kernel/signal.c b/kernel/signal.c
> index a3229add4455..83b5971e4304 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3261,11 +3261,6 @@ enum siginfo_layout siginfo_layout(unsigned sig, int si_code)
>  	return layout;
>  }
>  
> -static inline char __user *si_expansion(const siginfo_t __user *info)
> -{
> -	return ((char __user *)info) + sizeof(struct kernel_siginfo);
> -}
> -
>  int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from)
>  {
>  	char __user *expansion = si_expansion(to);
> -- 
> 2.25.0
> 
---end quoted text---

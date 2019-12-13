Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FA11E5A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 15:35:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZCr90RZMzDr9K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 01:35:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4Em0CQg"; 
 dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZChk4ZWzzDr99
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 01:28:54 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id q9so6588008wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 06:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6QLZHSUqVyecs2iharIBnV+waYycsRrF0PppbO8VMdc=;
 b=X4Em0CQg7XPS3z8XGXcRnzQcQadSqmHsHNxwILAXvTkGF1A0285lgDVyCcfmeLJMPj
 +Tk9WJ2x/6XiFUCTHg0b8xn10ROMgVaTjQnbg+3qy3Gv3aep3BkV8hyVg4Rj0h75Z/oD
 35XebvEWDrOknx7OGqgYUi4qMIv+qa9zC1voRXNBH6drGXWrKcVy9HlcS2r/HuYmNAI9
 OLcCG+k1GSnn6YvMkJcBCrtfY6FidTIooBhHPKYhYtE5D3BJoBZLsrfJHapK+8InoSks
 f0UPKA4o/9sHfTcTLWVTfcOsu/7MQOC8y9flklApuHnQ61tarND+8sgZ2yf0UyGiQP7W
 Yp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6QLZHSUqVyecs2iharIBnV+waYycsRrF0PppbO8VMdc=;
 b=igpkXef3XUVYwfedPvgV4TigZJYYBgr71AMjBGp52OxsEmNY3vvc0CKISiVCz+FnaJ
 ZRP+jwz8qn3aIyOdOGSKSYLuY/DcCa0REmFPVz+WJyntBgqCQdMdyn2zjA+tENhGeb+X
 vMIpAwRxbyc7ViWTFjNDW63Z5lhBGj+uEE+xtitNhxjjYi0kjzDQ5SCX0dgFJhb0XaLE
 PHTtk4cB3j1KCV5Vwkj9X/nMyGORcY9k81iwpmo3CVEGUteTRcUFi26r11p3ZZDz++pB
 j4hbjWOPCL591elp9HllQOmJiz6jF0adrYappCQBy7o6hCvzgZtYxuTAOjD6JUQrHCGw
 8Z0w==
X-Gm-Message-State: APjAAAXQMUvgDgJ3bkAa06zd0e+BS82u9sC141UySy45zmWDSRL6PHp6
 wuIwnNKbozPiS1uPcwvQNvw=
X-Google-Smtp-Source: APXvYqwcogMDfRsO+0kr7L/xFj6Up/8vQMcepDErEiyPT73ffpPLdwealTjrhoiMySzSoGv/hvLbhQ==
X-Received: by 2002:a1c:980e:: with SMTP id a14mr9520966wme.76.1576247330116; 
 Fri, 13 Dec 2019 06:28:50 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:60b0:6ca6:1eae:3b06])
 by smtp.gmail.com with ESMTPSA id h127sm11148048wme.31.2019.12.13.06.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 06:28:49 -0800 (PST)
Date: Fri, 13 Dec 2019 15:28:46 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191213142846.ki2t2fwljnql66lt@ltop.local>
References: <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <20191212202157.GD11457@worktop.programming.kicks-ass.net>
 <20191212205338.GB11802@worktop.programming.kicks-ass.net>
 <20191213104706.xnpqaehmtean3mkd@ltop.local>
 <20191213125618.GD2844@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213125618.GD2844@hirez.programming.kicks-ass.net>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 13, 2019 at 01:56:18PM +0100, Peter Zijlstra wrote:
> 
> Excellent! I had to change it to something like:
> 
> #define unqual_typeof(x)    typeof(({_Atomic typeof(x) ___x __maybe_unused; ___x; }))
> 
> but that does indeed work!
> 
> Now I suppose we should wrap that in a symbol that indicates our
> compiler does indeed support _Atomic, otherwise things will come apart.
> 
> That is, my gcc-4.6 doesn't seem to have it, while gcc-4.8 does, which
> is exactly the range that needs the daft READ_ONCE() construct, how
> convenient :/
> 
> Something a little like this perhaps?

Yes, this looks good to me.
Just a small nit here below.

> ---
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 7d9cc5ec4971..c389af602da8 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -75,9 +75,9 @@ static inline unsigned long array_index_mask_nospec(unsigned long idx,
>  
>  #define __smp_store_release(p, v)					\
>  do {									\
> -	typeof(p) __p = (p);						\
> -	union { typeof(*p) __val; char __c[1]; } __u =			\
> -		{ .__val = (__force typeof(*p)) (v) };			\
> +	unqual_typeof(p) __p = (p);					\
> +	union { unqual_typeof(*p) __val; char __c[1]; } __u =	\
> +		{ .__val = (__force unqual_typeof(*p)) (v) };	\

The 2 two trailing backslashes are now off by one tab.

-- Luc 

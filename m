Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF9449E7D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:42:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl5wX1Q9qz3bTN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:42:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O0fr5Uop;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=O0fr5Uop; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl5vq4CZKz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:41:41 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d1so2930196plh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 08:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LCmRUqeagqrmDIv1M1xM4hNMczReVWZ0/XfgL3nr9rA=;
 b=O0fr5UopoJBjwZittOtW82/OHDBeN0k2cD6+plRXAmiFvYevOGj4gFO0dQYyKT0RRT
 Rc31VYh33jA3BNL24xRIJgAULfU5WLeVIZjdhZmmqFXcYSgZXpeFqRyfTda9dNjSgS/D
 XmeiJxo75rWnG6wEFTTnUfZM+8oyLBw4tF5eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LCmRUqeagqrmDIv1M1xM4hNMczReVWZ0/XfgL3nr9rA=;
 b=qLL5YHagzC6Pq4/HBkMJJqML/kL3vHNsYapR9JdntMPBSwavuf73R/gEcfoCMvTqxp
 6zplv+FarIkE/YtjHHq+uQAMh4P2cqUgb6ONyhAM6mk0oArvKdVcMHDLsQlOHYmtjeAe
 Zd0DyLsBX50XqrgEcsXdIz5EHJ1DkfI7JIeWxvuoasP4Zg87vg3PJy8oDmZlDt8/z8cT
 ks4vPb7gHQdadaFG4envWcH3WO6Pk0oQ+p+y8O/0ED1MSPbraoa1boeLPrSQ/Y/puj+5
 Xzv5m3qA4bPtlVh3awUxUNPmEb24qwR1p8zi0gZbqYx6pBvh8T5KQLy510MtD8IlcL+T
 jDJg==
X-Gm-Message-State: AOAM5333YSjmTP5+619Xjj4VLhh/r6uGj2Q8ogBliF2k9LkhXAnaVyYi
 tBSB3i8rrrk6+fulj83u4KQ+gA==
X-Google-Smtp-Source: ABdhPJzJW6R3idJobTt3sSvhxG0E7Y46UI6zj21S0XR1zYmEqNiH6DhdfpsDs6RfS5jYQFRo54k6iA==
X-Received: by 2002:a17:902:cec4:: with SMTP id
 d4mr3980202plg.56.1643301699142; 
 Thu, 27 Jan 2022 08:41:39 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d20sm6605615pfv.74.2022.01.27.08.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 08:41:38 -0800 (PST)
Date: Thu, 27 Jan 2022 08:41:38 -0800
From: Kees Cook <keescook@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
Message-ID: <202201270834.4420E21F6@keescook>
References: <944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linux.ibm.com>
 <e9422643-a210-b77f-a037-da63a9d2e925@linux.alibaba.com>
 <20220124114548.30241947@gandalf.local.home>
 <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sachin Sant <sachinp@linux.ibm.com>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 11:46:49AM +0000, Mark Rutland wrote:
> I'm not sure how x86 works here; AFAICT the relocations are performed during
> decompression, but it looks like there's some special build-time processing
> associated with that, and the vmlinux doesn't contain standard ELF relocations.
> 
> Kees, IIUC you added the x86_64 support there, can you shed any light on if/how
> this works on x86?

I think Sven beat me to it, and this was answered in
https://lore.kernel.org/lkml/yt9dy231gzae.fsf@linux.ibm.com
but let me know if anything needs further info.

An additional note is that x86 is built with "-2G addressing"
(-mcmodel=kernel). There was some work done to make it actually
PIE, which would allow the KASLR base to move further:
https://github.com/KSPP/linux/issues/38

-Kees

-- 
Kees Cook

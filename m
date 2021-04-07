Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BE3575A0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:13:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFwZH3wnFz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 06:13:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dKW4tyxb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dKW4tyxb; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFwYs0NMzz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 06:13:04 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id g15so143893pfq.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=dKW4tyxbGX73iHxH5Iha60EvcjCvKI+5hrpqwPPcbjELczGr/kzgfdsnLJJsWtOJbP
 ubOwwaB3iZb/RBJ+1QPkWGQAjFPjPBqh2IboNE1nH7H1pZZqyeSqspXh1PeeRkVlyVq3
 D+oq7t34NOHRn9OQqu4dUPDeY2QjjFesL1gh9WM+knJrz1i5ZQMIlvyZpNZOQKqZbOKS
 4CB8O8zOE9mVX0eyokxf96eDPzy8oTdAAN584lU799CDSvkBRtjLRtC/rvSTel9pIKWP
 gshTMF9nTcU8N6w8UNgn+aG83qEZcXRIQj51bqqxl3MvzOMunlFLxakjAhVMSVBe674a
 jRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dwldfrHGB7cvjNDHe6gxp+OQ0DSzEe0anuIQnT5lIYc=;
 b=Qy+wrY7/vex2HCa6WTHxQx5AOva2Nblrc9CNInyLFdHVcFhoxABQNKYFLVYsWN42G7
 P6G41TQA+WRrzqjoteeUCOuGiOZeqlp0GkYjoqpok8bZxnuQHFMEfbYYV6/AMJT/cpyq
 0qrFuvc83MeoXE7hHV01gaRyxkI3O6U2QB3eqOkEvAPSeZiA1wFQwjywqmNngXlzG93i
 EC6EXHrG1qwFaRoQhfJBbqB5gK7waQSKFoVQbupbtsFugKL44yo2aXQcMGjEazStbmTP
 T1w3YV9TQOojfJ1d2HQiSuq475+SeGQf2WvKi/qlITuve5GEHe26GRNX6FhBiwvIbIPj
 CgDQ==
X-Gm-Message-State: AOAM532Ys9SeT9gNYnipsEXAmRbvCzGn4sU18hAM0Da4dLvBVU5nzHRn
 9HXlnOlic3V+TOUZ7uBmnAM=
X-Google-Smtp-Source: ABdhPJx1TzjDHM8SCpdazwwikZp8MB63xmALxAEXVlHdCjBoBVsMzPPllM88y4Piph/rcIdj06SGPw==
X-Received: by 2002:a65:610f:: with SMTP id z15mr4931593pgu.360.1617826380553; 
 Wed, 07 Apr 2021 13:13:00 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 m1sm5878421pjk.24.2021.04.07.13.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 13:12:59 -0700 (PDT)
Date: Thu, 8 Apr 2021 05:12:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <20210407201258.GH3288043@lianli.shorne-pla.net>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
 <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG1/xRgWlLHD4j/8@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org, guoren@kernel.org,
 sparclinux@vger.kernel.org, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 11:47:49AM +0200, Peter Zijlstra wrote:
> On Wed, Apr 07, 2021 at 08:52:08AM +0900, Stafford Horne wrote:
> > Why doesn't RISC-V add the xchg16 emulation code similar to OpenRISC?  For
> > OpenRISC we added xchg16 and xchg8 emulation code to enable qspinlocks.  So
> > one thought is with CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, can we remove our
> > xchg16/xchg8 emulation code?
> 
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32 is guaranteed crap.
>
> All the architectures that have wanted it are RISC style LL/SC archs,
> and for them a cmpxchg loop is a daft thing to do, since it reduces the
> chance of it behaving sanely.
> 
> Why would we provide something that's known to be suboptimal? If an
> architecture chooses to not care about determinism and or fwd progress,
> then that's their choice. But not one, I feel, we should encourage.

Thanks, this is the response I was hoping my comment would provoke.

So not enabling CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32 for architectures
unless they really want it should be the way.

-Stafford

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B0A23080C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 12:46:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGCzM0sVJzDr3L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 20:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rFUcMCUj; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGCwz0RHyzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 20:44:50 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id v22so3662151edy.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=rFUcMCUj2AwdC69csGGjJVjr3K/8WS4HC4QuFwZtg451Qj4L37BpO16QBPnCSOnEqP
 0XLFh6CAcMNi+86g1xCyy/bqdVTYRHcM+S9kEIZb7EWJKKOmGB7fGMyBy9goHLKaJvij
 l3J//FegCgxfC20hSO+SeOOi0ojcNdANd874jllkW9bgWXdBSGjDZ+KKsJ5ItnWu5ElM
 TutsV7Y/UWKyR2rEXX1BEUlxaWMHKF0PMaSsOZWNK/0D0ZH9xxW9nIbDP8AygACtKk6q
 SuVbplxJKZehbky/ztC2U7bihOneNjqjj52Fn1yyk39lDMDQeAEZqoI3viUUxFXSv5vl
 9XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=CQsm+0WOSqkkGr8cxjC5D2QzFswawfTT9vEb9619gUJsWkDvDJQsPUSBIwel9x51Nz
 DneVBOya3aszyqT/4O49okwm2E9+XZGfc5CcoTwexLyoBI4yHtXLwmo3WcjThYLJLCOk
 VCGnQNGIn5Gs/Z4T5XpeS+REXP0gk380USmoAfUMg4cvV3B1BfszbzAx4qfmR8+JSfgC
 aHuGYUZ3eVJQHVpPE6dElp4+Nwr9c26Bybxhf3pOjsS6QQrCzF+7jI2AALnjo8PUdZNK
 mutVdUknnLEHVcB58O4tu9biBMDm0f/74riBkABYGxjCnbeDEEe0w8wNLvoq5rf2Cwfv
 zfSw==
X-Gm-Message-State: AOAM533mJj/ISeSnKaOllNNUpWfBtMlwh6KuCE3jhCC1imDK2CtOaCeP
 ylAStMn+/FnvxgPvRXXiycs=
X-Google-Smtp-Source: ABdhPJztizS2/FT37W5GVOnd6egL7RbIXP7ubjCB3LMqpraJ3F9fNNOV7TQhtwANWplTQvf13TbOQg==
X-Received: by 2002:aa7:dd15:: with SMTP id i21mr12013673edv.153.1595933084517; 
 Tue, 28 Jul 2020 03:44:44 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id cf10sm460841ejb.4.2020.07.28.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:44:43 -0700 (PDT)
Date: Tue, 28 Jul 2020 12:44:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728104440.GA222284@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> regions to set node ID in memblock.reserved and than traverses
> memblock.reserved to update reserved_nodemask to include node IDs that were
> set in the first loop.
> 
> Remove redundant traversal over memblock.reserved and update
> reserved_nodemask while iterating over numa_meminfo.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/mm/numa.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)

I suspect you'd like to carry this in the -mm tree?

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

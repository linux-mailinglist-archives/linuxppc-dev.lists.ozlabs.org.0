Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A724626DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J310W0kkPz3ccY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.169;
 helo=mail-qt1-f169.google.com; envelope-from=dennisszhou@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J31050Gc9z2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:55:16 +1100 (AEDT)
Received: by mail-qt1-f169.google.com with SMTP id p19so18253563qtw.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pEDakQnvUPgfExSNtMrcASRup0dCzLPmxqHNnZuTaEw=;
 b=ER6whDxBdRq6x6tpuwfTTct8iXVT8IH+zkiXMtD1ZVHdMigZN65sML4CEgeuwev4tF
 FpI7n141uI9hwrPcv+4C8YQ1s6iK6Ee8iFKHvoppAfvIVosbHVSFU+ACmzFG7OhYcVqx
 vgK4fE2LJUN6jbqPwDzAWidg8WpS5Sf2WYYzYV7DZVmfZMsdpoDQWTya2bj+KYgcKiYH
 mb1LnBDgrIGqv4XfPn+9gU8l81I3/FNuxruzL17kMl4oz/w1UXgIn1j/0YccVmbenDN9
 BHQ/hownxjFmXWLAMTBYVro6ouwPBZkUR7ukdApnclQq/U6LbtOuoEB2QJX6cPA+nucx
 yjKQ==
X-Gm-Message-State: AOAM530ZL9smXp3W0rs2bLTdcyRQWJch3sd7FernNrccEt4V8hmf/j80
 imlSSJOVsb3Snzc1nr7nf4U=
X-Google-Smtp-Source: ABdhPJwhddCBXLud6erDgcxLoWG12ankufJKN/6VQiDHvJFght0g5pwFKu7S2tQHfyQ8XLjcAQQPNA==
X-Received: by 2002:ac8:4e56:: with SMTP id e22mr47933221qtw.72.1638226513800; 
 Mon, 29 Nov 2021 14:55:13 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id d9sm9373180qkn.131.2021.11.29.14.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:55:13 -0800 (PST)
Date: Mon, 29 Nov 2021 17:55:11 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Message-ID: <YaVaTwjiZmWz8PKY@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Sun, Nov 21, 2021 at 05:35:53PM +0800, Kefeng Wang wrote:
> When support page mapping percpu first chunk allocator on arm64, we
> found there are lots of duplicated codes in percpu embed/page first
> chunk allocator. This patchset is aimed to cleanup them and should
> no funciton change, only test on arm64.
> 
> Kefeng Wang (4):
>   mm: percpu: Generalize percpu related config
>   mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>   mm: percpu: Add generic pcpu_fc_alloc/free funciton
>   mm: percpu: Add generic pcpu_populate_pte() function
> 
>  arch/arm64/Kconfig             |  20 +----
>  arch/ia64/Kconfig              |   9 +--
>  arch/mips/Kconfig              |  10 +--
>  arch/mips/mm/init.c            |  14 +---
>  arch/powerpc/Kconfig           |  17 +---
>  arch/powerpc/kernel/setup_64.c |  92 +--------------------
>  arch/riscv/Kconfig             |  10 +--
>  arch/sparc/Kconfig             |  12 +--
>  arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>  arch/x86/Kconfig               |  17 +---
>  arch/x86/kernel/setup_percpu.c |  66 ++-------------
>  drivers/base/arch_numa.c       |  68 +---------------
>  include/linux/percpu.h         |  13 +--
>  mm/Kconfig                     |  12 +++
>  mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>  15 files changed, 165 insertions(+), 443 deletions(-)
> 
> -- 
> 2.26.2
> 

I've made a few comments. I think this will be a little bit of a
challenge to get through due to it touching so many architectures. For
ease, it probably makes sense to run it through mny tree, but we'll need
explicit acks as I mentioned.

I like getting rid of the pcpu_alloc_bootmem()/pcpu_free_bootmem()
functions. However, let's keep the implementation identical to x86.


I don't think we should get rid of the populate_pte_fn(). I'm not
comfortable changing x86's implementation. Simply offer a NULL, and if
NULL use the default.

Do you have a tree that intel pulls? I suggest cleaning up the patches
and pushing to a remote branch that they pick up. That would have caught
the mips typo. Send a PR creating a file in [1] for your branch, github
is fine. Basic validation needs to be done before I can pick this up
too on more than arm64.

[1] https://github.com/intel/lkp-tests/tree/master/repo/linux

Thanks,
Dennis

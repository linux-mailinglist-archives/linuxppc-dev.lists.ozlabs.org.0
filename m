Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4FE2359B4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 20:07:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKTW45p8FzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 04:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NClt20d7; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKTQS4PwGzDqJf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 04:03:12 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id o23so8883786ejr.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=NClt20d7Ft+K6FkgUCUu4JaE3tIZQCut3LntjJUJhXUsmJc9/hAN8f1uhRfdf1xDS4
 v+mVxDX9o4kozVR+Ah8Xum0mBupoLJJ8sGRFuq+zGUPap92vHCw3QWRVbrRdpExOLg1f
 PfYSYoa+08lkV+ejUHsbzm11vb6ZXDx9wG5OH/PIC6kGD+/IwmcMBK0f+S9Q47Ilfp0r
 CnDK0w5UJZcBtyEbi0uelKFQBUpbqi9svF4nCggxxWbCeGrL/RSClOw7dY42O+RKurT4
 SeQmDc1qACQRwd/qkF4Bl6+EBF1g484NpzCeNGAZebTMM88+MrzhcW/7+ogo+dclYvqf
 xJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=fimrAnmXq2CF6333s4kb4m4nQk42hdNL74kEdMejxQeyzAp79FQOohTQ0T7umk7JEM
 VDKYk/Fa1DpRt4JfJjJ1M3KaYXrV1DtYMlsCpqWWueTtyhWOFwx/Ousw2aJVcdAigFwB
 9VXyyt+1akccJHaaE9WZ42wGQwKlBgqsRP0jnddckwpPDq1sKlvHC6IbVZOhvJeaRdcf
 FcHc8ftzAEzT5Tsjwg76x8cQ8TVt3WcmXemHYqwTGasqZj0weM7C7wd2WzXaSntpqHKZ
 rHlU7K/GJphjSIXfP4QZjgbFbHaHsg/qkrJ+OnW0TXpnuwIX5nnvYdcErebdt/E1U8aO
 2JeA==
X-Gm-Message-State: AOAM533ZApXKuW0hfb6/a2TUyIA5MPMhw9zsRdojmcixKnh6OkMnl8IT
 BdPXkmifB+wE3JEqiGCcE1w=
X-Google-Smtp-Source: ABdhPJwRVVa9oTHFz53Gep6kufj7aL7kFTxC9FLC9t+X6tOc6fXoy+b82cv+AC/Z1BhRkxvbjIG1Og==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr12944760ejc.351.1596391388538; 
 Sun, 02 Aug 2020 11:03:08 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id x1sm13599477ejc.119.2020.08.02.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:03:07 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:03:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/17] memblock: use separate iterators for memory and
 reserved regions
Message-ID: <20200802180304.GC86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> for_each_memblock() is used to iterate over memblock.memory in
> a few places that use data from memblock_region rather than the memory
> ranges.
> 
> Introduce separate for_each_mem_region() and for_each_reserved_mem_region()
> to improve encapsulation of memblock internals from its users.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  .clang-format                  |  3 ++-
>  arch/arm64/kernel/setup.c      |  2 +-
>  arch/arm64/mm/numa.c           |  2 +-
>  arch/mips/netlogic/xlp/setup.c |  2 +-
>  arch/x86/mm/numa.c             |  2 +-
>  include/linux/memblock.h       | 19 ++++++++++++++++---
>  mm/memblock.c                  |  4 ++--
>  mm/page_alloc.c                |  8 ++++----
>  8 files changed, 28 insertions(+), 14 deletions(-)

The x86 part:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

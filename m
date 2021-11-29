Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2A460CDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 03:55:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2VMD5hgrz3bZx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 13:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.178;
 helo=mail-qk1-f178.google.com; envelope-from=dennisszhou@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VLm3NCrz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 13:54:39 +1100 (AEDT)
Received: by mail-qk1-f178.google.com with SMTP id 132so21309034qkj.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 18:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qbTe+lH71a6p8wzsCbhSxpErG9OzglSEt6YvNDwG21c=;
 b=qvbxnPehQC6QxJ+h4UFeOUlQPiQuADSE6deb7A26RNW6t8hdz4oNOhIlcUeLabyRuI
 i4LkXcLwR9eCyodwaZcZKvULc7xaSOLgHC5Qgb4pKuQbXooVeUm+DABdT+JxMcRKgSaW
 TTnsKqEbGoTd9OMdgY/Ly1loACN4NzRZTsVzA9RV3yUpc2tNcJCIFoNYOohY5IakesiI
 b9DNhN13GWJtWckWXBu7CBP2EqqKoDbGSlDThgMalWH3uh3OkIRoI33YRDJ8Rl8oDHRt
 RYHmSII5ul40B71P5ATHx0dwzd75NMMRVPBCgq2bA4KkvLMcExj5FMXBAjpNp3xl/Jx9
 QNkw==
X-Gm-Message-State: AOAM533p1gPBHXqzCZTno8n+vABrDlmp/xMsVjRx58GGOsm1pL47ddoY
 dmBC9QEpWT3fIpn3yNnE08Q=
X-Google-Smtp-Source: ABdhPJyi7aAcRBTHZ33Xv2m6ARGtjYSUACLIAGWWBFseVcXDEPx4RpqRlD7ZTzSfnjCXSQaXvSA7XQ==
X-Received: by 2002:a05:620a:1468:: with SMTP id
 j8mr36368878qkl.170.1638154476884; 
 Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id s6sm5164326qko.43.2021.11.28.18.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Date: Sun, 28 Nov 2021 21:54:34 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Message-ID: <YaRA6o0pHU6/206a@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
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

On Mon, Nov 29, 2021 at 10:51:18AM +0800, Kefeng Wang wrote:
> Hi Dennis and all maintainers, any comments about the changes, many thanks.
> 
> On 2021/11/21 17:35, Kefeng Wang wrote:
> > When support page mapping percpu first chunk allocator on arm64, we
> > found there are lots of duplicated codes in percpu embed/page first
> > chunk allocator. This patchset is aimed to cleanup them and should
> > no funciton change, only test on arm64.
> > 
> > Kefeng Wang (4):
> >    mm: percpu: Generalize percpu related config
> >    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
> >    mm: percpu: Add generic pcpu_fc_alloc/free funciton
> >    mm: percpu: Add generic pcpu_populate_pte() function
> > 
> >   arch/arm64/Kconfig             |  20 +----
> >   arch/ia64/Kconfig              |   9 +--
> >   arch/mips/Kconfig              |  10 +--
> >   arch/mips/mm/init.c            |  14 +---
> >   arch/powerpc/Kconfig           |  17 +---
> >   arch/powerpc/kernel/setup_64.c |  92 +--------------------
> >   arch/riscv/Kconfig             |  10 +--
> >   arch/sparc/Kconfig             |  12 +--
> >   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
> >   arch/x86/Kconfig               |  17 +---
> >   arch/x86/kernel/setup_percpu.c |  66 ++-------------
> >   drivers/base/arch_numa.c       |  68 +---------------
> >   include/linux/percpu.h         |  13 +--
> >   mm/Kconfig                     |  12 +++
> >   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
> >   15 files changed, 165 insertions(+), 443 deletions(-)
> > 

Hi Kefang,

I apologize for the delay. It's a holiday week in the US + I had some
personal things come up at the beginning of last week. I'll have it
reviewed by tomorrow.

Thanks,
Dennis

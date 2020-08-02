Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 402BC2359B3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 20:05:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKTSf2cQgzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 04:05:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uIs7/vU9; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKTPg1mJSzDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 04:02:30 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id i6so50327edy.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=uIs7/vU9Kx/pklkEtgD7hBiuHs6a0R+dGlNTjUGRPw721sRkbKusjxGi7PfHcXOJ+P
 EjAE8Vd54opYw74GdBkeR4XNF5IP2MPUk9fmgk6V6Ahfe99oRVQ2eTOjx4V/HNnjxo1p
 8JTL4om9ZC3cnlFf7IvLus1+6HB/iVpPvgkNBuxCV3vkFTVqsYvmHOwMCmyNnjJul9R4
 NyUbZELRb/+vAfU647duOFbumJn5NHcHvq2jBsmvofhPXlaOdyNnECGIYrfm3l1GH6Kt
 lYQels7sHnZLCY218xDI/G+/wAKH/pz8dPVH6DrvKapbnVTrwoCPcuTqLRUxp8GcwS18
 4m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=hIidJgHuEfm+QUxSjJcyWhB4lu2Xjl7LW3yKbJJeIh0=;
 b=tJOoMtqgtELlsY+H9+VbAjH5qbvKD9VnUqkC/M07QjSfF21lOWGZJrJdT/jbuNczqH
 RvrLU35loeSPHgyd4DRkHjXdIG9c2oBiWJbYxk4saWfZm5hlwGRi/WMT8b7OX+w5ySvK
 LWDREY/Hgz+N3aFLB7pnhodfg/C/lPvQwBIJ/F4JNfcq9GsdajCxbAC8LX5JmcIeca58
 OMbO0Mrrmk7pxnBCvkP+B9+/yL9qWirtAUSGC0VbsfO8yT2F5du+YVZiINezlSF5pvBi
 O7lachL3PeD4CsFVo24EKVVZroeAhSkQwnN6DpFlw5vsBW0wBUAH1Av9yADCAWm+rKrX
 NANg==
X-Gm-Message-State: AOAM533NT+0gbpW2A6kZ1njcOoYgQH5d2M9LWo/0LSLoqBIKiT2shWDv
 jRIzOYd/Bp/BDvgRUCAh2Pk=
X-Google-Smtp-Source: ABdhPJxqUvJyL87Stg26v1+JoHbkpad0yhpL8P6CjttoB9bwnL2tuiWl2R60zFRBWtP21v7K7J2UFg==
X-Received: by 2002:aa7:cb15:: with SMTP id s21mr12929126edt.175.1596391346876; 
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id j21sm14090092edq.20.2020.08.02.11.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:02:26 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:02:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 14/17] x86/setup: simplify reserve_crashkernel()
Message-ID: <20200802180223.GB86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-15-rppt@kernel.org>
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
> * Replace magic numbers with defines
> * Replace memblock_find_in_range() + memblock_reserve() with
>   memblock_phys_alloc_range()
> * Stop checking for low memory size in reserve_crashkernel_low(). The
>   allocation from limited range will anyway fail if there is no enough
>   memory, so there is no need for extra traversal of memblock.memory
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Assuming that this got or will get tested with a crash kernel:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

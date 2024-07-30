Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C1940F98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 12:39:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PdrvTUkJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYBY95kbBz3cjv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 20:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PdrvTUkJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=seakeel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY7Ft4Wy5z3c44
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 18:10:40 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so2684299a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722327037; x=1722931837; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4/S17o3ryXO92fKPDsd+20QrVlSG6ehQAGuA4AgUnAA=;
        b=PdrvTUkJRtbaSzwIRcMWNKcPM7k2Cn8X6BgzklFpo1HsTIpWpimkBEyQ3bvdtBrDDn
         Km3y84UYZEd+I/oIUS6w1pO+rT7AzE9JqflTsGlNatgFdeJJfxxH3owissZ6aGbvblZY
         6FH/kt59VS8196XQbKldtPn3iSVu5L+7evPI5CWEtynd7B75hnK8/wO1l+Vmdk4500X1
         DMZibayB8d7o+Pxuo/49CKk+UhpyfHuej0roZ+HngdORGB+XoIO/Ssvm6vR2GqI9ndGT
         SFrd0AbYTaHMMXp0wX/yp54159M1l6rZUz8Ne5SDAmaMbZrdF9JQz9Jm9A7IPQFnW3rQ
         qhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722327037; x=1722931837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/S17o3ryXO92fKPDsd+20QrVlSG6ehQAGuA4AgUnAA=;
        b=jOsMsUNXm8GQ8+T0E0V9q2jEUnW6ORNiurGZLfmfHu/WiLklQ8GzDs2SPcjhkeDEkw
         fgbpo0YihPtQ11LmhDYbU3aW95BMtySLDFQ+Kgb3ATrrrr/nY1HxCl8og0CJdcYlH1pJ
         9uRnw1gythEOYCnmvXhuMxdiibas74I+MTpSGjGl5Drv8VPTAfZDwI7iAj7v25NBEiJ/
         vLlM26z6DHx5S/KzrIXQXTbCjpejmNuBF+v7BvZfJbHlPnRZhWtDy6AeHVw26ls2FfNs
         sIENXfFuwUgATFbnxjD24AFyc0nm7vQSX5EwHhycK5Abx6CMoLARRB78RzfPsMG6lHTq
         1zfA==
X-Forwarded-Encrypted: i=1; AJvYcCWliezZmRsWxwPGKdWeCoeLb2FZ43AbGS8pH+ErCiwp/PA2c13xw5pHHnUQplsnodHufOUq1fehF6niMulbKlkRl9Mev8xatpPiFoEBRQ==
X-Gm-Message-State: AOJu0YwAq9sW5TCZFvZSRc+KKuR3u+Az2/SSzjmZ1s+B7gOM6rRFU//6
	JEF7+fnWlpXtKUfsrECft9TFuebnT7TPe3/Kjzmk0m0E5+VHtmOM
X-Google-Smtp-Source: AGHT+IHd+8idtSf9No9KXFiHPkFqgsgm8Dqu198TXfzlUpyaNdqot/AMDpkwkaetathdKfNuieqdfQ==
X-Received: by 2002:a17:90b:3a90:b0:2c9:9fdf:f72e with SMTP id 98e67ed59e1d1-2cf7e606d04mr8262857a91.26.1722327036447;
        Tue, 30 Jul 2024 01:10:36 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28e3cbaasm9886868a91.51.2024.07.30.01.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:10:35 -0700 (PDT)
Message-ID: <c2accb5d-33f6-404b-9298-6b9e8bf24a9b@gmail.com>
Date: Tue, 30 Jul 2024 16:10:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: alexs@kernel.org, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-s390@vger.kernel.org
References: <20240730064712.3714387-1-alexs@kernel.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20240730064712.3714387-1-alexs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 30 Jul 2024 20:25:54 +1000
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Hugh Dickins <hughd@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Wilcox <willy@infradead.org>, Jisheng Zhang <jszhang@kernel.org>, Breno Leitao <leitao@debian.org>, Guo Ren <guoren@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BTW, the patchset based on the latest git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm mm-unstable branch.

On 7/30/24 2:46 PM, alexs@kernel.org wrote:
> From: Alex Shi <alexs@kernel.org>
> 
> We have struct ptdesc for page table descriptor a year ago, but it
> has no much usages in kernel, while pgtable_t is used widely.
> 
> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
> except SUN3, others archs are all same as 'struct page *'.
> 
> These blocks the conception and code update for page table descriptor to
> struct ptdesc.
> 
> So, the simple idea to push the ptdesc conception forward is to update
> all pgtable_t by ptdesc or pte_t pointer. But this needs widely
> knowledges for most all of different archs. Common code change is easy
> for include/ and mm/ directory, but it's hard in all archs.
> 
> Thanks for intel LKP framework, I fixed most all of build issues except
> a bug on powerpc which reports a "struct ptdesc *" incompatible with 
> struct ptdesc *' pointer issue...
> 
> Another trouble is pmd_pgtable() conversion in the last patch.
> Maybe some of arch need define theirself own pmd_ptdesc()?
> 
> This patchset is immature, even except above 2 issues, I just tested
> virutal machine booting and kselftest mm on x86 and arm64.
> 
> Anyway any input are appreciated!
> 
> Thanks
> Alex
> 
> Alex Shi (18):
>   mm/pgtable: use ptdesc in pte_free_now/pte_free_defer
>   mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
>   fs/dax: use ptdesc in dax_pmd_load_hole
>   mm/thp: use ptdesc pointer in __do_huge_pmd_anonymous_page
>   mm/thp: use ptdesc in do_huge_pmd_anonymous_page
>   mm/thp: convert insert_pfn_pmd and its caller to use ptdesc
>   mm/thp: use ptdesc in copy_huge_pmd
>   mm/memory: use ptdesc in __pte_alloc
>   mm/pgtable: fully use ptdesc in pte_alloc_one series functions
>   mm/pgtable: pass ptdesc to pte_free()
>   mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
>   mm/thp: pass ptdesc to set_huge_zero_folio function
>   mm/pgtable: return ptdesc pointer in pgtable_trans_huge_withdraw
>   mm/pgtable: use ptdesc in pgtable_trans_huge_deposit
>   mm/pgtable: pass ptdesc to pmd_populate
>   mm/pgtable: pass ptdesc to pmd_install
>   mm: convert vmf.prealloc_pte to struct ptdesc pointer
>   mm/pgtable: pass ptdesc in pte_free_defer
> 
>  arch/alpha/include/asm/pgalloc.h              |   4 +-
>  arch/arc/include/asm/pgalloc.h                |   4 +-
>  arch/arm/include/asm/pgalloc.h                |  13 +--
>  arch/arm/include/asm/tlb.h                    |   4 +-
>  arch/arm/mm/pgd.c                             |   2 +-
>  arch/arm64/include/asm/pgalloc.h              |   4 +-
>  arch/arm64/include/asm/tlb.h                  |   4 +-
>  arch/csky/include/asm/pgalloc.h               |   4 +-
>  arch/hexagon/include/asm/pgalloc.h            |   8 +-
>  arch/loongarch/include/asm/pgalloc.h          |   8 +-
>  arch/m68k/include/asm/motorola_pgalloc.h      |  12 +-
>  arch/m68k/include/asm/sun3_pgalloc.h          |   4 +-
>  arch/microblaze/include/asm/pgalloc.h         |   2 +-
>  arch/mips/include/asm/pgalloc.h               |   4 +-
>  arch/nios2/include/asm/pgalloc.h              |   4 +-
>  arch/openrisc/include/asm/pgalloc.h           |   8 +-
>  arch/parisc/include/asm/pgalloc.h             |   2 +-
>  arch/powerpc/include/asm/book3s/32/pgalloc.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |   4 +-
>  arch/powerpc/include/asm/book3s/64/pgalloc.h  |   4 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h  |   8 +-
>  arch/powerpc/include/asm/book3s/64/radix.h    |   4 +-
>  arch/powerpc/include/asm/pgalloc.h            |   8 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c       |  10 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c      |  10 +-
>  arch/riscv/include/asm/pgalloc.h              |   8 +-
>  arch/s390/include/asm/pgalloc.h               |   4 +-
>  arch/s390/include/asm/pgtable.h               |   4 +-
>  arch/s390/mm/pgalloc.c                        |   2 +-
>  arch/s390/mm/pgtable.c                        |  14 +--
>  arch/sh/include/asm/pgalloc.h                 |   4 +-
>  arch/sparc/include/asm/pgalloc_32.h           |   6 +-
>  arch/sparc/include/asm/pgalloc_64.h           |   2 +-
>  arch/sparc/include/asm/pgtable_64.h           |   4 +-
>  arch/sparc/mm/init_64.c                       |   2 +-
>  arch/sparc/mm/srmmu.c                         |   6 +-
>  arch/sparc/mm/tlb.c                           |  14 +--
>  arch/x86/include/asm/pgalloc.h                |  10 +-
>  arch/x86/mm/pgtable.c                         |   8 +-
>  arch/xtensa/include/asm/pgalloc.h             |  12 +-
>  fs/dax.c                                      |  14 +--
>  include/asm-generic/pgalloc.h                 |  10 +-
>  include/linux/mm.h                            |  16 ++-
>  include/linux/mm_types.h                      |   4 +-
>  include/linux/pgtable.h                       |   6 +-
>  mm/debug_vm_pgtable.c                         |   6 +-
>  mm/huge_memory.c                              | 103 +++++++++---------
>  mm/internal.h                                 |   2 +-
>  mm/khugepaged.c                               |  14 +--
>  mm/memory.c                                   |  15 +--
>  mm/mremap.c                                   |   2 +-
>  mm/pgtable-generic.c                          |  37 +++----
>  53 files changed, 240 insertions(+), 236 deletions(-)
> 

Return-Path: <linuxppc-dev+bounces-15167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05020CEF229
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 19:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djWnJ2FSbz2yFW;
	Sat, 03 Jan 2026 05:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=209.85.160.179 arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767377108;
	cv=pass; b=anmbImIZxE2fNYYufSYy6PUhQFtDLZ0HT1vN2w4OO4XT6KiaY9Lp+JjiLwNW5PMbfIuYEoj7oGWOXUlqnYkz5qi5Es29ibOgKaJDGUx35sU2ETmP2XWlAEP7+Q7IbL+mFyQeIvH116Qsz/UlL60z1bnNRXwXw87+t1kbylIL5XQushR+Hx2xQfy2peCrLq1BrNKMhxM4jPgrTGlXON2rxkSqlUsF7hEjK6Yu60tYiDcrqdaImVAkSf2YfIjbcSB1YV5FDtUCgkucXIpedpCN5qXXTzSJ1nBzuEwRlKKBQkJanSv9oqHk1uGsQ5Hrt3YBbyMMyP54NQkb9l5PLugdng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767377108; c=relaxed/relaxed;
	bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WViDM5gkjtUHIOoe2xxe9Ab/p/kLDRzTjJFzDCGBI+L35a03fDX/23jYfhcmXAG/muGF305kF0bCfrAwxos21CO/1EIvpFFYLHQb7Hk++B6cLB5GdduJTXg+Qo+vP57jRDPF2iT3QLEW4ooKw0MtGWZauBTPIWnvD0tkFXwj2bf3PA9REW3mXLu+/DrJS+hvZjYT5DLouasgXenKEn7iHMDHWE2FnNTe6ra15lxbvNOyCGdmd56vRPV1NwOgzXFSP9vSBV5H1h2/Lm9MH+wecHt5e1Z2f6h+1dqqP+umlHU2gPZcI0pQXUix02OdcH+vzaw/rnadGB8MyG4f7Q8nkQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ChlB8zyW; dkim-atps=neutral; spf=pass (client-ip=209.85.160.179; helo=mail-qt1-f179.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ChlB8zyW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=209.85.160.179; helo=mail-qt1-f179.google.com; envelope-from=fvdl@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djWnG2tjqz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 05:05:05 +1100 (AEDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ee147baf7bso10881cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 10:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767377042; cv=none;
        d=google.com; s=arc-20240605;
        b=Ufa/5Oy9q0GhKy+tj/EfqsxCR/suP2Cm8V9zvGw7wZ6h0OTn1IFpGuidMuR75DEU8G
         KXlmR/s130vc/RyhYq/DGNQwYD52dqqQReh8L+IkiZILtk+kXs3ZY1qeQPzcRO6uNBuF
         jQhn/aIDuvnSLanFE7FTW8eCvv6N3hb4zlW+Qv7f8uGBrWAyH4qxz0lMU0Maua2QyK8W
         SFbwdErjG5pHycm5Lw38PPjogpeNzwd8LcSsTZx10FCwV4xMmhc680xShS028jieWnaZ
         1eZ/HT/YytWtfUGwE9hYxBl91TCic4DgV9fOMybvccWExqVGo0rinYj8Dc/sV7G6N5r0
         SxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        fh=0fF7ur0o1rQkV4iGgewn8tfksoiVOb/cmxRZsXSM+BE=;
        b=jYiH3P/SuDs0PeFwa1tdw3vcMPShX8Adm27MorlE+plXzEpz8mFefftMozOpLw/EVG
         KIXRchx7gJKj0kPRUySB5DTgGvisaUuTq0usY3ee3kHHh76vCQeNJldZ9WQiNvW9LgcR
         09vbMJlub+86/+IQGiJhRQQcsGNxVYXqKlJm9GFd0Q6HBG+lEmV/bSmeNCsBzAodEKm9
         FjuVCGtU8XSNeWQs+e/HD2vW/FOT2oDrxPq7ToEvfvjgpaHTYe9aMM3l3D0A53v9Sdt7
         VhVn23NvZVz9H7V628u4zLgfTJf15NXsw9Tbaalhbt7v7+6Pg7SzrHDtNcc7pFqRHEp+
         HJPA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767377042; x=1767981842; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        b=ChlB8zyWclFpfhOlTcP+/nYNUhoP02d7neu0eKLbibilr7RrOYTkKNNUfnYMszCGwp
         hi7f0lu3t7+K/sTr6txzR7w+z8agFdbHh7HDz0DIyi3ZCnli0rAR0IJlnt/QG6k2Yk5g
         IEA2QfzXc6/BW1JRIZ5MLnzx70hJE8vmA7hIy9wjqFuznJjypiXA5/bJ1cnkIU5++jIH
         6TtzIFZrimNb0wKT41aDHqmcEycfQQADjWl4RmuZIg4cDkNhLcrGWbtX3NsYTX/xEsdH
         J9MWBzJzDY7/heojSy1UbVTmdAlP3+LKZfeKaJ20AXatg5PyIoy1HDhN80kxIdYkYXn/
         Ywzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767377042; x=1767981842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        b=hvwi5BpG1RcA47O8XVEN7SNzVOn6VV4e7tguPVPcMqphbCc9aE2B6ZC13m9jZ4k72h
         7MUpxa4MBTGTxyINMBFjXe/JoHMV7U4SD1bGBRSP183Zg15tjT0F5d/G7X887oEcPGnB
         w+tYffFTTiO4Ve11Kxb9rzjaszscebwrEJcXBJ0NSOQCIMhk32OGyKA98RHkUaVgm7Ik
         j2L+NYdUErqfpcu6PI/5fFRwBCDd6FkxXjRIRz1qFdy/TdUfevI78502Ey2AdzLW+FP/
         Ptn86bxeKGxQxHDBe2PcBT/cHo+WmZJ5zFpNI2MgYsy/6knH8bEyhPlGwVhkvSXJlZsk
         av7w==
X-Forwarded-Encrypted: i=1; AJvYcCWsJT0/WXuJJ7MohCVO8JR7BPC+z1jbDcpSp+hUpDLt5PEHO1lXGyD2FgfsqcALKx7U+bO+9Xm8FFlCLGk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOgyqLOtTQU1+q4Vi58t/q/d3bGMliuiUwGMAeIX5G4Bhrpccr
	Hfj7N9Lo9VUtaaK+YcPw35+OmpyBUTHHYzTbbHMqhIhUy+2F6D6MM1RN0BJXTAMNRBChW28Eu3a
	2FTZturkgFFJAVcd9xLznyP7+cIxkz34MjmDgekqz
X-Gm-Gg: AY/fxX5yPx+686O0n3TJhVm11o8rPjLMwyDM3uongdxJbmUFWEfvuz7wL3qcAoJEvNG
	+pik037etKBrPLZDVIE8cLl0zbx1ivfpqsr1uL0jsEBDpEtlVhsmntZfohmYJM9Ef00vEnlpvVV
	UIV8zfdTRe9KDALIVfk6DTD8KdTgYAKwb1TOumTJmj7DmKErsO0PwHEdfAYKHe/M2lYuCWJ//zs
	VGqd6ZaaFiAhVVHxzAz0ABRsCCwOHrxdrOEXcXQIIGOkthz+Qw+XKQUuwWVKSvQ5Kp7mNE=
X-Google-Smtp-Source: AGHT+IE626c1niVbXfJuRnnEKb/XVpUT3xgOsgVHvUYmmAhOToE2K50Gpbsa48xtp+jOGlgqExM/NP3EnDee4koBR/0=
X-Received: by 2002:a05:622a:8016:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-4fbe3b0ad54mr14392961cf.1.1767377041692; Fri, 02 Jan 2026
 10:04:01 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260102070005.65328-1-rppt@kernel.org>
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 2 Jan 2026 10:03:49 -0800
X-Gm-Features: AQt7F2qPng5Y0NvX0my5UG4cpefC6iiH19nIvMPHQLdOtt1JmQ_l0Tjv8FxQEzo
Message-ID: <CAPTztWaZZt_ygCDNaDdW9A_TtT1FNZW6hFzyiq2b6_xxMw38gQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/28] arch, mm: consolidate hugetlb early reservation
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 1, 2026 at 11:00=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Hi,
>
> Order in which early memory reservation for hugetlb happens depends on
> architecture, on configuration options and on command line parameters.
>
> Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
> while others call it very early to allow pre-allocation of HVO-style
> vmemmap.
>
> When hugetlb_cma is supported by an architecture it is initialized during
> setup_arch() and then later hugetlb_init code needs to understand did it
> happen or not.
>
> To make everything consistent and unified, both reservation of hugetlb
> memory from bootmem and creation of CMA areas for hugetlb must be called
> from core MM initialization and it would have been a simple change.
> However, HVO-style pre-initialization ordering requirements slightly
> complicate things and for HVO pre-init to work sparse and memory map shou=
ld
> be initialized after hugetlb reservations.
>
> This required pulling out the call to free_area_init() out of setup_arch(=
)
> path and moving it MM initialization and this is what the first 23 patche=
s
> do.
>
> These changes are deliberately split into per-arch patches that change ho=
w
> the zone limits are calculated for each architecture and the patches 22 a=
nd
> 23 just remove the calls to free_area_init() and sprase_init() from arch/=
*.
>
> Patch 24 is a simple cleanup for MIPS.
>
> Patches 25 and 26 actually consolidate hugetlb reservations and patches 2=
7
> and 28 perform some aftermath cleanups.
>
> I tried to trim the distribution list and although it's still quite long
> if you feel that someone was wrongly excluded please add them back.
>
> The changes also available in git:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=3Dh=
ugetlb-init/v2
>
> v2 changes:
> * move the hugetlb and memory map initializaion to mm_core_init_early()
> * add Acks
>
> v1: https://lore.kernel.org/all/20251228124001.3624742-1-rppt@kernel.org
>
> Mike Rapoport (Microsoft) (28):
>   alpha: introduce arch_zone_limits_init()
>   arc: introduce arch_zone_limits_init()
>   arm: introduce arch_zone_limits_init()
>   arm64: introduce arch_zone_limits_init()
>   csky: introduce arch_zone_limits_init()
>   hexagon: introduce arch_zone_limits_init()
>   loongarch: introduce arch_zone_limits_init()
>   m68k: introduce arch_zone_limits_init()
>   microblaze: introduce arch_zone_limits_init()
>   mips: introduce arch_zone_limits_init()
>   nios2: introduce arch_zone_limits_init()
>   openrisc: introduce arch_zone_limits_init()
>   parisc: introduce arch_zone_limits_init()
>   powerpc: introduce arch_zone_limits_init()
>   riscv: introduce arch_zone_limits_init()
>   s390: introduce arch_zone_limits_init()
>   sh: introduce arch_zone_limits_init()
>   sparc: introduce arch_zone_limits_init()
>   um: introduce arch_zone_limits_init()
>   x86: introduce arch_zone_limits_init()
>   xtensa: introduce arch_zone_limits_init()
>   arch, mm: consolidate initialization of nodes, zones and memory map
>   arch, mm: consolidate initialization of SPARSE memory model
>   mips: drop paging_init()
>   x86: don't reserve hugetlb memory in setup_arch()
>   mm, arch: consolidate hugetlb CMA reservation
>   mm/hugetlb: drop hugetlb_cma_check()
>   Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"
>
>  .../driver-api/cxl/linux/early-boot.rst       |  2 +-
>  Documentation/mm/memory-model.rst             |  3 --
>  .../translations/zh_CN/mm/memory-model.rst    |  2 -
>  arch/alpha/kernel/setup.c                     |  1 -
>  arch/alpha/mm/init.c                          | 16 ++++----
>  arch/arc/mm/init.c                            | 37 +++++++++---------
>  arch/arm/mm/init.c                            | 25 ++----------
>  arch/arm64/include/asm/hugetlb.h              |  2 -
>  arch/arm64/mm/hugetlbpage.c                   | 10 ++---
>  arch/arm64/mm/init.c                          | 39 ++++++++-----------
>  arch/csky/kernel/setup.c                      | 16 ++++----
>  arch/hexagon/mm/init.c                        | 19 +++------
>  arch/loongarch/include/asm/pgtable.h          |  2 -
>  arch/loongarch/kernel/setup.c                 | 10 -----
>  arch/loongarch/mm/init.c                      |  6 +--
>  arch/m68k/mm/init.c                           |  8 ++--
>  arch/m68k/mm/mcfmmu.c                         |  3 --
>  arch/m68k/mm/motorola.c                       |  6 +--
>  arch/m68k/mm/sun3mmu.c                        |  9 -----
>  arch/microblaze/mm/init.c                     | 22 +++++------
>  arch/mips/include/asm/pgalloc.h               |  2 -
>  arch/mips/include/asm/pgtable.h               |  2 +-
>  arch/mips/kernel/setup.c                      | 15 +------
>  arch/mips/loongson64/numa.c                   | 10 ++---
>  arch/mips/mm/init.c                           |  8 +---
>  arch/mips/sgi-ip27/ip27-memory.c              |  8 +---
>  arch/nios2/mm/init.c                          | 12 +++---
>  arch/openrisc/mm/init.c                       | 10 +----
>  arch/parisc/mm/init.c                         | 11 +-----
>  arch/powerpc/include/asm/hugetlb.h            |  5 ---
>  arch/powerpc/include/asm/setup.h              |  4 ++
>  arch/powerpc/kernel/setup-common.c            |  1 -
>  arch/powerpc/mm/hugetlbpage.c                 | 11 ++----
>  arch/powerpc/mm/mem.c                         | 27 +++++--------
>  arch/powerpc/mm/numa.c                        |  2 -
>  arch/riscv/mm/hugetlbpage.c                   |  8 ++++
>  arch/riscv/mm/init.c                          | 10 +----
>  arch/s390/kernel/setup.c                      |  2 -
>  arch/s390/mm/hugetlbpage.c                    |  8 ++++
>  arch/s390/mm/init.c                           | 13 +++----
>  arch/sh/mm/init.c                             | 12 +++---
>  arch/sparc/mm/init_64.c                       | 17 +++-----
>  arch/sparc/mm/srmmu.c                         | 17 ++++----
>  arch/um/kernel/mem.c                          | 10 ++---
>  arch/x86/kernel/setup.c                       |  5 ---
>  arch/x86/mm/hugetlbpage.c                     |  8 ++++
>  arch/x86/mm/init.c                            |  8 +---
>  arch/x86/mm/init_32.c                         |  2 -
>  arch/x86/mm/init_64.c                         |  4 --
>  arch/x86/mm/mm_internal.h                     |  1 -
>  arch/xtensa/mm/init.c                         | 14 +++----
>  include/linux/hugetlb.h                       | 12 ++----
>  include/linux/mm.h                            |  5 ++-
>  include/linux/mmzone.h                        |  2 -
>  init/main.c                                   |  1 +
>  mm/hugetlb.c                                  | 13 -------
>  mm/hugetlb_cma.c                              | 33 ++++++++--------
>  mm/hugetlb_cma.h                              |  5 ---
>  mm/hugetlb_vmemmap.c                          | 11 ------
>  mm/internal.h                                 |  6 +++
>  mm/mm_init.c                                  | 20 ++++++----
>  61 files changed, 219 insertions(+), 394 deletions(-)
>
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.51.0
>

Thanks for this series. When I introduced HVO pre-init, I noticed the
inconsistencies in init order, but shied away from attempting any
general cleanup, as I had only tested pre-init on x86.

With this, it should be possible to enable
ARCH_WANT_HUGETLB_VMEMMAP_PREINIT on architectures that support HVO. I
think that's only riscv and loongarch right now. But that's out of
scope here, though.

- Frank


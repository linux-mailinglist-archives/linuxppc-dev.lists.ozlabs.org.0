Return-Path: <linuxppc-dev+bounces-4006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF3D9EDB27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 00:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7sGW6ZZJz2y6G;
	Thu, 12 Dec 2024 10:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733959683;
	cv=none; b=klXiYm4r4BmhnB/0HhbrTfnjZuYcVX9ihtsIs8EdOmEDZVsLWVjpz7ZS7VGIkO2lekrsE63UtRFlAOdbHCIuTSttatOR/ZUiHXgiZRWns54p7QXFLXP1887vQtN91iqAyRj59nVHpy/SGG1i1V1SWYfgWGjdzGsEgKkD+/oU2Fkm33d2IWvX1aDj/pfnLTDfN4cLLws25161LzLrAvXs575Rw4HF3zaTaJ4nqjwGOocHN9BW8P+afe5ljBzAqvnw4/SEv3cisxws87gUX0WQC+ZHiBg52hT8XbA4vqJqDc27GgCReJQhSIDOK34X+S2L4eb03SaYkuOxUmRztjnswA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733959683; c=relaxed/relaxed;
	bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gi8JLFJk9B7c7WOCwey/fCFY0QA5ofvgGdCKYe6p2nTE+evQsiXfFx+4Wyzbe6FD8TKqcyj9m4kbxyIwmqHZ1iF6xXoYGFB2g13a3lWrp0H3iurQDZT+Myl2kY7EOwurqiyDONtz0Q4OMZRewAWie+prFYfUV14nPBBo+5zORQ2QpSJZJgaLuGrQyPa5JIf6FoMdTsl8WOEHrTDtqaLXvcbDN8+ZrQcftqlIxkUTbm3lpFtzl8YJYW9UF6Qb/eVxDV4f651sNK4Vc1LYeVlx4dQLc08eADdbaopSWSL+wbajnO0IX6QsvWCY0l+zPsFRyePyIbRpxiFqEdjpqmtVWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QGTTlVPv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3_r9azwskdoysitmapaqvopowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QGTTlVPv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3_r9azwskdoysitmapaqvopowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7sGV52l7z2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 10:28:01 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2efa0eb9cfeso28340a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 15:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959678; x=1734564478; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=QGTTlVPvoIC/XtMWk9wXBR6UM3Q+5ipo42cvzk8lk2jV7J3tjrJDTUhjncJ+YJ3aM/
         1llgVYeYOBUY9D8U0gR6qB5X9FtQWr5/Bd4rUJkROqPF3ChDlHMmRvHOR5bmT/xeLlga
         IYTAsLogUTvGwVxLRO8egIk8reIHQqn+p/GLnsiHJhp4gkZMgroJbn5yxTLqhsC0d8Nr
         r101Ca6F/JWBvpYEZ+GLNPuP/3KsVyBXsRK4fWVQxZlJBaywsbrYA3CMmCSIg1M1MYyM
         6jkQ229s9BQxpZ3UOrx55AjaxCsBpnVXHRGV5nnGQMuwUe1YjwBbBVoAQ9Hfzr9KJ8+n
         RkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959678; x=1734564478;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Y13tezS9osfEyeZZhDu0hB4QwVrkWFM3vdAGWXDL0s=;
        b=GB/30gUq2lG8kfTl+73yt0UdJmXMFHBbChoRsnTV/3vgaHz8PWA9YKX8MFd78OSgno
         vJ8BjjN5L1sbOfqkttn4oIzIbnb6nX7ZzeoaHSvmVsetPs5jJBL0fEopKjvJEphbe5hV
         yWA3rkhT7x+97ZlpV+9o7uuce0iCrL6w00hDDxpki4e08/ywbdgcs8VvJqikSVK2UNsW
         WtdlnYmwDm44duRCqVbzNhuckvUVKcTToOsJdh2PxxR8E42GdblAtB4TwRQp/1MMqDxN
         whmqtD77FV9S11qEuDO6+8jHWi+qyWfjHDmzZFxoa/YKyIM3/zVx61FkyV/9JtNLsLQ0
         nKBw==
X-Forwarded-Encrypted: i=1; AJvYcCWqHXHU05k6e6U1uwAEBhXkSVUoBU9xnUWiEx8joWpnYslVhro8BhVy7+sbgT2qtiy7BWoFAG9RmmkoBYM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yytdk60sy+I4q/gkqcmKtinWvRKUC9teRCWRIv4GgH/n4VT5MfL
	RgJ1l5ARPQN3W6NpYD9kS8uzXO96tuQFx3nO9uUXcloq41qTCy7nOZ1H9QV+Tq1iHeP/n79KW2d
	yWO2tz+AVj5/zNEB22NyiWQ==
X-Google-Smtp-Source: AGHT+IH+hxwnbTejsd5rMe6ZdiiLsQVYXh76CpSNZ1O0EO7ZME4Z+uiov/c6u6U8sBeYTnWqfHb7LFZNMZjeMUedcw==
X-Received: from pjj11.prod.google.com ([2002:a17:90b:554b:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f81:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-2f13abc6e43mr1624666a91.5.1733959677870;
 Wed, 11 Dec 2024 15:27:57 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:38 -0800
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-1-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi all,

This is v2 othe the arch_mmap_hint() series.

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
    Patch 2 ("mm: x86: Introduce arch_mmap_hint()")

v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/

=======

This series introduces arch_mmap_hint() to handle allocating VA space
for the hint address.

Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
issue of mmap hint being ignored in some cases due to THP alignment [1]

[1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/

Thanks,
Kalesh


Kalesh Singh (16):
  mm: Introduce generic_mmap_hint()
  mm: x86: Introduce arch_mmap_hint()
  mm: arm: Introduce arch_mmap_hint()
  mm: alpha: Introduce arch_mmap_hint()
  mm: arc: Use generic_mmap_hint()
  mm: csky: Introduce arch_mmap_hint()
  mm: loongarch: Introduce arch_mmap_hint()
  mm: mips: Introduce arch_align_mmap_hint()
  mm: parisc: Introduce arch_align_mmap_hint()
  mm: s390: Use generic_mmap_hint()
  mm: sh: Introduce arch_mmap_hint()
  mm: sparc32: Introduce arch_mmap_hint()
  mm: sparc64: Introduce arch_mmap_hint()
  mm: xtensa: Introduce arch_mmap_hint()
  mm: powerpc: Introduce arch_mmap_hint()
  mm: Respect mmap hint before THP alignment if allocation is possible

 arch/alpha/include/asm/pgtable.h           |   1 +
 arch/alpha/kernel/osf_sys.c                |  31 +++---
 arch/arc/include/asm/pgtable.h             |   1 +
 arch/arc/mm/mmap.c                         |  43 +++++----
 arch/arm/include/asm/pgtable.h             |   1 +
 arch/arm/mm/mmap.c                         | 107 +++++++++------------
 arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
 arch/csky/abiv1/mmap.c                     |  68 +++++++------
 arch/loongarch/include/asm/pgtable.h       |   1 +
 arch/loongarch/mm/mmap.c                   |  49 +++++-----
 arch/mips/include/asm/pgtable.h            |   1 +
 arch/mips/mm/mmap.c                        |  50 +++++-----
 arch/parisc/include/asm/pgtable.h          |   1 +
 arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
 arch/powerpc/include/asm/book3s/64/slice.h |   1 +
 arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
 arch/s390/include/asm/pgtable.h            |   1 +
 arch/s390/mm/mmap.c                        |  51 +++++-----
 arch/sh/include/asm/pgtable.h              |   1 +
 arch/sh/mm/mmap.c                          |  83 ++++++----------
 arch/sparc/include/asm/pgtable_32.h        |   1 +
 arch/sparc/include/asm/pgtable_64.h        |   1 +
 arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
 arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
 arch/x86/include/asm/pgtable_64.h          |   1 +
 arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
 arch/xtensa/kernel/syscall.c               |  31 ++++--
 include/linux/sched/mm.h                   |   9 ++
 mm/huge_memory.c                           |  17 ++--
 mm/mmap.c                                  |  86 +++++++++++------
 30 files changed, 491 insertions(+), 424 deletions(-)

-- 
2.47.0.338.g60cca15819-goog



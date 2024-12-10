Return-Path: <linuxppc-dev+bounces-3879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2C9EA553
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 03:41:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6jfg55XKz2yGY;
	Tue, 10 Dec 2024 13:41:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733798491;
	cv=none; b=YQ+MtyYk+PMxFC0xup0kb+p31vK/hbFylbJ9i8C8m1mW/i65ASYxvi0G118bztvYJBHdm7KkNhg1T/srEnnkV91lpTpKm9iDWrpmUXfQTWlMOvJTRcs1SFkbP7Odp+fiFj87Yiw17RcJXEfdlA8T9CTzVF5OJSiz0bHNETCD5Nbeo4kW6rqwbFbw56UJ+J8HbJaKroY/ReAhGlWG52vzWFHbe2MiN6WGapB9uqY1M0YnKjNUdqlm7pJQH0e71b1LhcBOahKJKt8VK8qPFyLQzndEj1abhmocsJ9bRTRlxp48CQwXzLgP02DMkGcnz1l27ru/HKqsSAdF+iDQEJtRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733798491; c=relaxed/relaxed;
	bh=bf22iGP6jf2y7qifILZ5XtpYUOy94hbxgtZW13umpxY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=US/+mick+K6BMMq0YvM4SFYaO4B6TkrTTHwrgvvn3j4ffwnu+t+4RSgv0PmfSSkhIrKPEJg1Mm3H06gXG0Y79qJVgmQOR2UxWptQbXpec6kmVlBOuHZjbukVDNDr+CEH3TL8oDa7JCg2YmnC627IjOnM6N9dPTDbTfQJSZ/ZPx1d36krosCdbSAFVWQvBEu02xg6wzjkD916zciuO6cJK80wHUAzM1bwVM2xjC5dIOAu2VI3kRctCwTps7ru3VJ8MEZj9GtTxTdOlcuUVleRlJ/rAq1Cn3sESxDrrFsDe14EQS7TJf32BKSpyUDNVVChrfo3dFA3GiBTHmNkQDhMEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nnlpjKej; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3u6pxzwskdegukvo2r2sxqrqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nnlpjKej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--kaleshsingh.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3u6pxzwskdegukvo2r2sxqrqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--kaleshsingh.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6jfd34X1z2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 13:41:28 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2166855029eso7659025ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 18:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798484; x=1734403284; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bf22iGP6jf2y7qifILZ5XtpYUOy94hbxgtZW13umpxY=;
        b=nnlpjKejmHM6kc8MDWMJrLSTHvusJU1VQU34a4OQ2Bd02wMjn0sx+SpkS04tIIjA9R
         Fs2mDqm8bbM6M0pySMT5pSVgBOj6IFDd5rn65N77VdyjLJkEQy8X/QLpph3QDPXTNHNQ
         h6+GLRFl6y4gJrxOEAuS8g8lxPH/snOXWa0MgBjV2o6aDENUVUVdAhvP0hSByEG3h9KM
         Dmo6QcE+eBxqNAifxGHLoT2zwjiK/ReW2g8YylAcWRCq/waBqk+rI4JcB+cdMksjuEnu
         /Gb7YbkHrdjkVJwX4mV2g/cpg7A6bANpAzdGEucMYucfoUh2LqWGJnIUi42LQECY8Vji
         W3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798484; x=1734403284;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf22iGP6jf2y7qifILZ5XtpYUOy94hbxgtZW13umpxY=;
        b=J6494UohgEvwJmWJ9Xfr2by41qbEX+vkJoN/QZQzcc05O/B+UUiofSoAjUXs8iduvt
         euhwUx/CzBR8dOOd4hZpemupWFrrA6GSlhd+uU6juWKZ/hDdI32a1AOM5OXNEUuwj9rN
         DV+rH/lZ//9OlASiuOSyoE5bU99ckXlozydxSfeQHekf5rm7rI6i7gmq1ytym4o3C2FJ
         rBZiRqIun08x+jlEBDz2shdrS29lyr/6wMw2ljm8bCLTHuU7oXZZCkQAvihUAMHXbi/6
         H+nbzXH/7jGZ+NKgpnThuT6u+1QM/tI51A+fwgMHNvlDmtejesihqCNMv4yuRJh/Zjhr
         UpOw==
X-Forwarded-Encrypted: i=1; AJvYcCW57yjPqzExTmpbLbl88i+AdZMIRmdsPP8Ue9Afrn/If4dFzQ6AcvRbZUu0FhaxWDd9aZvGK1l64Nezi/8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0+MC+n10+AgT+cMsG0FR8/8+hyp3s8TaiDfvnQnj6/mnPTxQv
	xxrkNBsrmn0asahTnnIbaEA6H4gYcQS7e++RWVMn57ISfVQyz3VvABKKLT9sgzQ6F8qA4KJ3PpS
	hrtYel+kXF45MevpIWJhjEg==
X-Google-Smtp-Source: AGHT+IGmbMdmRSsqJri2ZoaLC+TQ8CWMLTK/EMvjfytSTGvuy8K5dpGza4XliOvDgrJOHh+vT9vCZPym9dpOQZfD/Q==
X-Received: from plbmk12.prod.google.com ([2002:a17:903:2bcc:b0:215:5607:bc71])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f64a:b0:216:2b14:b625 with SMTP id d9443c01a7336-2166a01e172mr48609585ad.31.1733798483773;
 Mon, 09 Dec 2024 18:41:23 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:02 -0800
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
Message-ID: <20241210024119.2488608-1-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 00/17] mm: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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

This series introduces aarch_mmap_hint() to handle allocating VA space
for the hint address.

Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
issue of mmap hint being ignored in some cases due to THP alignment [1]

[1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/

Thanks,
Kalesh

Kalesh Singh (17):
  mm: Introduce generic_mmap_hint()
  mm: x86: Introduce arch_mmap_hint()
  mm: arm: Introduce arch_mmap_hint()
  mm: alpha: Introduce arch_mmap_hint()
  mm: arc: Use generic_mmap_hint()
  mm: csky: Introduce arch_mmap_hint()
  mm: loongarch: Introduce arch_mmap_hint()
  mm: mips: Introduce arch_align_mmap_hint()
  mm: parisc: Introduce arch_align_mmap_hint()
  mm: s390: Introduce arch_mmap_hint()
  mm: sh: Introduce arch_mmap_hint()
  mm: sparc32: Introduce arch_mmap_hint()
  mm: sparc64: Introduce arch_mmap_hint()
  mm: xtensa: Introduce arch_mmap_hint()
  mm: powerpc: Introduce arch_mmap_hint()
  mm: Fallback to generic_mmap_hint()
  mm: Respect mmap hint before THP alignment if allocation is possible

 arch/alpha/include/asm/pgtable.h           |  1 +
 arch/alpha/kernel/osf_sys.c                | 29 ++++++++++--
 arch/arc/mm/mmap.c                         | 12 ++---
 arch/arm/include/asm/pgtable.h             |  1 +
 arch/arm/mm/mmap.c                         | 54 ++++++++++++---------
 arch/csky/abiv1/inc/abi/pgtable-bits.h     |  1 +
 arch/csky/abiv1/mmap.c                     | 38 ++++++++++-----
 arch/loongarch/include/asm/pgtable.h       |  1 +
 arch/loongarch/mm/mmap.c                   | 40 ++++++++++------
 arch/mips/include/asm/pgtable.h            |  1 +
 arch/mips/mm/mmap.c                        | 39 +++++++++------
 arch/parisc/include/asm/pgtable.h          |  1 +
 arch/parisc/kernel/sys_parisc.c            | 37 ++++++++++-----
 arch/powerpc/include/asm/book3s/64/slice.h |  1 +
 arch/powerpc/mm/book3s64/slice.c           | 31 ++++++++++++
 arch/s390/include/asm/pgtable.h            |  1 +
 arch/s390/mm/mmap.c                        | 32 ++++++-------
 arch/sh/include/asm/pgtable.h              |  1 +
 arch/sh/mm/mmap.c                          | 48 ++++++++++---------
 arch/sparc/include/asm/pgtable_32.h        |  1 +
 arch/sparc/include/asm/pgtable_64.h        |  1 +
 arch/sparc/kernel/sys_sparc_32.c           | 21 +++++++--
 arch/sparc/kernel/sys_sparc_64.c           | 47 +++++++++++++-----
 arch/x86/include/asm/pgtable_64.h          |  1 +
 arch/x86/kernel/sys_x86_64.c               | 49 ++++++++++---------
 arch/xtensa/include/asm/pgtable.h          |  1 +
 arch/xtensa/kernel/syscall.c               | 26 +++++++++-
 include/linux/sched/mm.h                   |  8 ++++
 mm/huge_memory.c                           | 15 +++---
 mm/mmap.c                                  | 55 ++++++++++++++--------
 30 files changed, 401 insertions(+), 193 deletions(-)

-- 
2.47.0.338.g60cca15819-goog



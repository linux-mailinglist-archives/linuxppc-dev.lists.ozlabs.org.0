Return-Path: <linuxppc-dev+bounces-11512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F00B3C7A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLq208Yqz2yvv;
	Sat, 30 Aug 2025 13:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526045;
	cv=none; b=CEjPjX8vgM8JhAp7mLZsEQyj5T3hAdEqO3/rWR4RorcpYf+U0awZ9pc92Z2UuNLWudQpGt7Qb4LVZgt4HfngHwh4maT8P7qvUSA0zI8ZsjwMmTk82Ybly7WeyW1m4YlFxp1Y2DW7An+6iohIHnDMjBOmtpMfjHijW97cKwFT6QtmZgd9obkjhaJRt4R1O2OkRIm2YqP6gPeCI/e7j/+0z7lKA0mhbBkroHRLkxG0geCSQfB5ikPYpaW7rALmoxLKoetjPtJTU4gdCKchFIveTjXrZAhXwZSoR39ZBrwRGUOM5blL8YPXILi0RJG4jYTp4Q5Hb836Xd2BHyDNQxWjww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526045; c=relaxed/relaxed;
	bh=N0O+sH8p1DzPTF1d6HUZs1mNy/B0Taq/B3V84tqISVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D6sx1Z4HSAimxlv1Yr19YrYKrk9h+wNlMN5qVk9g+bouK5h1B9zDBFE0ZerwyL96f4HyJzHdUis5OYcxwe73HZtFtwBxLal0x4V7OW3EKbw6rVebKQ3in0x9GxMjYOIEgazB6tz9Sa92tk4Q/sXaBhcMlyubHfPSNO2giyacUZc9uNx2jxNGiKh3nNWMQVKQzQzDci86QLvFaJYAvGj+fxogXTbD6EVmdzskc41fJ2xRoHNPlld0ll9AluQducOfggHx4LpetY3v0sY7b2ys4+1SFfTxO1tvsDJbTAlCCmSeEasm3YKU2sq5uyPylqHlhpaKND7BGvJXx9E7Bs/vlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZIUAw2Aw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZIUAw2Aw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLq129Yyz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:04 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-327f87275d4so1064736a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526042; x=1757130842; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0O+sH8p1DzPTF1d6HUZs1mNy/B0Taq/B3V84tqISVA=;
        b=ZIUAw2AwDxSuRST0mBsx+rdXIH76qAaEWdp1b//XR/wgaplBiGpAhOo626R8B69hEt
         wYZr3UZK/8c4RGL1hHHi41GlJCekiM9zzo1HygSUwL5BwMnr6d8teJwIdFqQJH6+UqSb
         ABlpfUTIh4ovqqt1ruRfvMjjuwhOAD0wuGdG81lmOlIUX2Zl7BIJ55LX8+0kqJekEEI0
         PU6EbASDTWS6O8lycTki5/xGLR5Qbi2eM9GZrrQS5Rzkmamruyz3iUtq7L1MfRenQtoU
         gyxqbLn9dVxtBZ+bQnLc1qY3yCD5T7Lc1+aeCN/iFDS88ArNOkBpMfAzkMomdeVHzQzT
         58Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526042; x=1757130842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0O+sH8p1DzPTF1d6HUZs1mNy/B0Taq/B3V84tqISVA=;
        b=Z+tE6C6ZXm0LeFXk+GokFTYpJy33E91li/7+7XaziQKVgIjxMahKoFpfMdoas5zmPs
         OqjuCGyM/xqaHtj53MOFq+1KTrR1FD2knMivjN106uJo2IImcQM+a8yZTcRGZ951Az8T
         EHA26vts2YArX8mPGqMR4Gm1W4o67DGOC0JdO8LmwsJF4yVrkR2K0QNbC3OnI4hD6wiW
         S795Jj3ThbzZ997CDNLIocrQXF4q/B0lOoeqS9XokakTrfT12aTNvIeKpj+48Cm6pVFa
         GbnWaZEEpVS9wETrHffCaD4k66r31jFO/E4gScsQjpTtyMeGAggFkfG20jwVpLX2ek3b
         Me4A==
X-Gm-Message-State: AOJu0Yw+JID3Dd84ivtigsuSMltfNQbgV6B5ItMXEuF4ADfyhyNKNdRn
	2HmS30n5qPHiQBMk/nGBYwzhNRfqgS8Znt+2Nw76Pu9M30efUePbTUWi+NhoSw==
X-Gm-Gg: ASbGncvhg7EFl2Zu5BMimOUVLtlt1cwjOpueuUz4a1YzDu4aqIH3YKb62HkegzcLKXx
	7UGs5AC+SrtQI4HGgEnEFGMinPEYF+PP2Z6xdNXKzkXufwG6BjAyGyQMKSGi6fFffNT/IPvswDA
	v3LAlCxJSNi9s1KGXUCPLA5vnnLM7zLhAE0s/p7NByHQnxMQNPGMSgSVPJNqj8tZHAPLtVSDgwt
	61jZCLVTdS3um0Mo471jv/vc0NXZnaoW4rq3UO/oNsTilJb+yTkWfUkTrxWEEJRVNe/fcD4b7Uy
	xEuFdYWwWYwB5NJGUc99eLwEAjDTU9hYYrYDpi6Iwo8P0vk+L4NVk669hGDiZDGUbALcR545CTU
	WF6DoTzO/mu3km9PjvL/zOdli+q3TrOAvx70Z
X-Google-Smtp-Source: AGHT+IEgFmBwpKDd8bPRFRryx4rrAZWzgnRsaD2dYzZIBeooemvZZRm7YfPopPWAI9Fa5w8KKoK10w==
X-Received: by 2002:a17:90b:3f47:b0:321:c0e3:a8ce with SMTP id 98e67ed59e1d1-328156c5797mr1143226a91.22.1756526041624;
        Fri, 29 Aug 2025 20:54:01 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:00 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH 0/8] powerpc/book3s64: Hash / SLB fixes & improvements
Date: Sat, 30 Aug 2025 09:21:39 +0530
Message-ID: <cover.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello all,

While working over SLB related multi-hit issue we identified few more Hash / SLB
related issues, which this patch series fixes.

Patches 1-4 are various fixes related to SLB / HASH MMU.
Patches 5-8 are improvements in ptdump, slb preload and the last patch adds slb
user and kernel vmstat counters.

Patch-1 was posted earlier as a standalone fix here [1]. It has no changes
in this version. But since patch-6 is dependent on this, hence we clubbed all
Hash / SLB related patches into a common series.

Other than patch-1 (which was posted earlier), the rest of the patches are
mostly only tested in Qemu tcg for powernv and pseries. I will be testing these
on the real HW too before the next revision. But meanwhile it will be good to
get any reviews/feedback.

[1]: https://lore.kernel.org/linuxppc-dev/20250814092532.116762-1-donettom@linux.ibm.com/

Donet Tom (1):
  powerpc/mm: Fix SLB multihit issue during SLB preload

Ritesh Harjani (IBM) (7):
  book3s64/hash: Restrict stress_hpt_struct memblock region to within RMA limit
  book3s64/hash: Fix phys_addr_t printf format in htab_initialize()
  powerpc/ptdump/64: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
  powerpc/ptdump: Dump PXX level info for kernel_page_tables
  powerpc/book3s64/slb: Make preload_add return type as void
  powerpc/book3s64/slb: Add no_slb_preload early cmdline param
  powerpc/book3s64/slb: Add slb faults to vmstat

 .../admin-guide/kernel-parameters.txt         |   3 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 -
 arch/powerpc/kernel/process.c                 |   5 -
 arch/powerpc/mm/book3s64/hash_utils.c         |  15 ++-
 arch/powerpc/mm/book3s64/internal.h           |   9 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |   2 -
 arch/powerpc/mm/book3s64/slb.c                | 112 ++++--------------
 arch/powerpc/mm/ptdump/8xx.c                  |   5 +
 arch/powerpc/mm/ptdump/book3s64.c             |   5 +
 arch/powerpc/mm/ptdump/hashpagetable.c        |   6 +
 arch/powerpc/mm/ptdump/ptdump.c               |   1 +
 arch/powerpc/mm/ptdump/ptdump.h               |   1 +
 arch/powerpc/mm/ptdump/shared.c               |   5 +
 include/linux/vm_event_item.h                 |   4 +
 mm/vmstat.c                                   |   5 +
 15 files changed, 73 insertions(+), 106 deletions(-)

--
2.50.1



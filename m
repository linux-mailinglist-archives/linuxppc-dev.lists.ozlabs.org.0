Return-Path: <linuxppc-dev+bounces-7238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA34A6AC27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 18:39:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJXrp6rsKz2yDH;
	Fri, 21 Mar 2025 04:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742492378;
	cv=none; b=gx2eXuYe9HLgw1UrW9BBVLR4ozPs2x3PjvETCt+YviGR3x7ExqgzZSjYmWd9Wzqdj+1Zu9nKpb93mQECZv2EPghQr2Q1k2bnCrl363EIAHbYnsGCVqpuqVGl2kA3T/uQW7UChur2avqGgAUi4BHVBeSHcIw8BJTVwopjgsc4Kt9DtJ9nVSaFMvMctZ9MrKNBA73gkB/a3JXdWPpLBk9J/AiWjuLgA36VSo33NMBtlrL0QX73omZb2f7WcMppeNrfsthxlUS6HuR1SXZ4QEo3vX8S5BrGEsRwOKDb3+REsRMYBC0euZDqzv+erdkyOhCUcjYRkPsHBDk4l04HU9KYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742492378; c=relaxed/relaxed;
	bh=k6tEKz/UqhbyHPwZaieYYXzQwjdGTl6UqIIR/Zfit/M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cCemqvnEXGpG7Yd0j3SSBf1/MOQrqDPI7vyU4uJ4+WxP8j8UGK5cZhFwitrZL47HOAzxx6QyLj/4yYTzrURM1hxlhaA8xT+ygqtfmdhHqlhccATh6SwoJ83ePf78f8Y2r9+FOoi57mGfcGuklnHVwx5KR/3Tw4U/79Ce1oecUHGUrX52qfBYirNzr/2tk3d4bzs/qnW7UBeTXkzPJzFLmGXSf61P/2wkjR3oewrVLgeLrkOMbaK7R6Caeu+YjvmOnfhNe+ueNohK9kv7J/LLfi5fug3FDE7CvHi43tFTS/OZE7OyA6EChHDlXvvXP5cwI9AR2mjUcZOhM3tAy2Xw+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nyfYLN9Z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31llczwykddmhjgtcqvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nyfYLN9Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31llczwykddmhjgtcqvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJXrn23j4z2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 04:39:36 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso2922072a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742492374; x=1743097174; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k6tEKz/UqhbyHPwZaieYYXzQwjdGTl6UqIIR/Zfit/M=;
        b=nyfYLN9Z/pTMhAohAeQCmMA9W7QZcv/7+tdTjepPTVjGNjsLEsHP3e0EnFXb0vX3qQ
         nF9vyxDNvw1TyKiEshLCBrNwE+GIpTxq9+iN0KosuJzqdjrX9szkTMxGW0bD+XxcH3oY
         XC5MGoshEvgB1PK8HTlmO1qgkQf4xPb1kO+kt6IENYTHlkPBCTjanD8QUzNlMdHYf3LO
         vUDkuOuuRv6OM/MfXMDszzQZkqujdePBbTnt7ICYiO7sdSxs7om4TZ0fJbeYY12MSrGl
         XqdqPm60rdeNHK48bG2eutogMrzA8cZRI124uRWZdP9toXkYjsZLuN+QSRUcqscZHoX5
         Z11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492374; x=1743097174;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6tEKz/UqhbyHPwZaieYYXzQwjdGTl6UqIIR/Zfit/M=;
        b=p2hemfnxQGYRfBQkm8h89eesq8JTyq0w6Ju+rxaHpTNTFEpUuIORb4QOmDq6zvKhCm
         u7aoqMGpZiKlhWU+Qadf/kwaD04NRMSkY0NirWDzJwGJfM4TDdaz3EfxsIF8MyOr0eeI
         hlt+HIzgoVquLwbstun1ugYceb690zfmGDr6e+H01TPPfgSrdpErSGcbcvNVBra2bGAF
         Xis8uWDGt5NPL5H/gOqKMt91/lfTFAIg3d5QV2R20vKe0oBLoF7fc/I5wao8Um+Etye4
         fHWspKPPaIwSpwr8f/nJdmAldtvgo1Hv0X/IpG6bbfVLX/lgE9Irbte5J/idkRRSrtZT
         jUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUig7Ze01ZDjwaf2HwqTEli+LVQSYtWjEj7sodQ3tUbBvqJOKVZV24P19Xutx8Kt8ovEFhSkARfl6uzV4o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOFz8i9oU2qN4m0BrdHrbVy1lToS3lpScuHT8uiE1bTE7bWoye
	Z/BPbvG/sRD0PtvwA/FCOL5bxgVJJsdBco53ZkGPJEzRR+g8W5cfYykOqsjf8f3eHhHehniYqVn
	8DA==
X-Google-Smtp-Source: AGHT+IGIxvxSLNwY9Q0/avXwy1mxv0PoM1/FD7lwSCmDvbaod/z/NHWuwhtnOKOlvUCBtbnjCWplqo4dvqI=
X-Received: from pjbsi11.prod.google.com ([2002:a17:90b:528b:b0:2f9:c349:2f84])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc6:b0:2fe:a79e:f56f
 with SMTP id 98e67ed59e1d1-3030fe9e9c3mr149779a91.13.1742492374365; Thu, 20
 Mar 2025 10:39:34 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:39:28 -0700
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
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320173931.1583800-1-surenb@google.com>
Subject: [RFC 0/3] Guaranteed CMA
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@redhat.com, vbabka@suse.cz, 
	lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, alexandru.elisei@arm.com, 
	peterx@redhat.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, mina86@mina86.com, 
	axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, surenb@google.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This RFC is posted to collect feedback and to be used as a reference
implementation for the upcoming LSF/MM discussion. The code is not of
production quality and needs more testing.

Guaranteed CMA (GCMA) is designed to improve utilization of reserved
memory carveouts without compromising their advantages of:
1. Guaranteed success of allocation (as long as total allocation size is
below the size of the reservation.
2. Low allocation latency.
The idea is that carved out memory when not used for its primary purpose
can be donated and used as an extension of the pagecache and any donated
page can be taken back at any moment with minimal latency and guaranteed
success.

To achieve this, GCMA needs to use memory that is not addressable by the
kernel (can't be pinned) and that contains content that can be discarded.
To provide such memory we reintroduce cleancache idea [1] with two major
changes. New implementation:
1. Avoids intrusive hooks into filesystem code, limiting them to two hooks
for filesystem mount/unmount events and a hook for bdev invalidation.
2. Manages fs->inode->page tracking and handles pools of donated pages
inside cleancache itself, freeing backends of this burden.
Cleancache provides a simple interface to its backends which lets them
donate a bunch of pages to cleancache, take a page back for own use and
return the page back to cleancache when not needed.

With cleancache in place, GCMA becomes a thin layer linking CMA allocator
to cleancache which allows existing CMA API to be used for continuous
memory allocations with additional guarantees listed above.
The limitation of GCMA is that its donated memory can be used only to
extend file-backed pagecache. Note that both CMA and GCMA can be used
at the same time.

The patchset borrows some ideas and code from previous implementations of
the cleancache and GCMA [2] as well as Android's reference patchset [3]
implemented by Minchan Kim and used by many Android vendors.

[1] https://elixir.bootlin.com/linux/v5.16.20/source/Documentation/vm/cleancache.rst
[2] https://lore.kernel.org/lkml/1424721263-25314-1-git-send-email-sj38.park@gmail.com/
[3] https://android-review.googlesource.com/q/topic:%22gcma_6.12%22

Minchan Kim (1):
  mm: introduce GCMA

Suren Baghdasaryan (2):
  mm: implement cleancache
  mm: integrate GCMA with CMA using dt-bindings

 arch/powerpc/kernel/fadump.c |   2 +-
 block/bdev.c                 |   8 +
 fs/super.c                   |   3 +
 include/linux/cleancache.h   |  88 ++++
 include/linux/cma.h          |   2 +-
 include/linux/fs.h           |   7 +
 include/linux/gcma.h         |  12 +
 kernel/dma/contiguous.c      |  11 +-
 mm/Kconfig                   |  32 ++
 mm/Makefile                  |   2 +
 mm/cleancache.c              | 926 +++++++++++++++++++++++++++++++++++
 mm/cma.c                     |  33 +-
 mm/cma.h                     |   1 +
 mm/cma_sysfs.c               |  10 +
 mm/filemap.c                 |  63 ++-
 mm/gcma.c                    | 155 ++++++
 mm/truncate.c                |  21 +-
 17 files changed, 1356 insertions(+), 20 deletions(-)
 create mode 100644 include/linux/cleancache.h
 create mode 100644 include/linux/gcma.h
 create mode 100644 mm/cleancache.c
 create mode 100644 mm/gcma.c


base-commit: 40caf747267c18b6206e26a37d6ea6b695236c11
-- 
2.49.0.rc1.451.g8f38331e32-goog



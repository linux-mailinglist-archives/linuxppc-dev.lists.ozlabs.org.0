Return-Path: <linuxppc-dev+bounces-13556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3AC20CA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 15:59:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6j94XLzz3btf;
	Fri, 31 Oct 2025 01:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836397;
	cv=none; b=SP88lJ1zGYbauO1G5h9oBXNqWoCEElEhK3jtKnXv6seXY2+rg5nXdhC1wid7MaDhB/02c8Dapvq5zxOjHGmNylwjXydC/KGh376ifu9XbwJmTqnu7WyxBHHPn+uvgffi2KL7LYyMp9PdBGrYsv3Q8IhC/WvOT2rEukAMIQINUAW70b8plv9MLerMUfU+6cj/MfV5AMPW/GLu+gOfX4Dtwf4sOVOuMU6wzdKK/BqsxDw5a238f+D2NkvzlnHUgox8nGXk6F4tI9keWCLavnD9eZiG6699A/8/3ZbOcSEFSWjb0p7HLupcxKehV0nmI4lkUFNCypOnXo18tkIa2RXMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836397; c=relaxed/relaxed;
	bh=BRkdAW+Q7RPnHucSsDJRqWTnLPV2iv5eie2Z/QXpXTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YFhxdH8j7xyZjUZK5H2y1UoR5Zty22pkkRg7WFgAGfFSgG664eXk0rF+jy8M3XiXDMqkGBed/QKcV1TXVW9FihJVL5WrzpTcHVAa2H3F3ieS5xbwWiJ5mwt9FHGs5lN6z9Rvy6B63QNO548t5T4h/1/3xTJL4UTmfbrmv02u9673OcGpfl7qH3LwH/MK801k5PTn6vXXMf6ox7LAEWXbjlFNyy699Wb/nNqK/KuR2InVQmq9sh55ICTsc32ISXIeqdI6bK/U+2pSdSWn1wom5GnqJHZ+o6l5ckHXslb7FuErmppfxIh0kSgXCtAbrobxa4GXtRgE8c/OJBz3qyt46Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NUO+PobO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NUO+PobO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6j86dJBz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 01:59:56 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-781010ff051so1030254b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836394; x=1762441194; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRkdAW+Q7RPnHucSsDJRqWTnLPV2iv5eie2Z/QXpXTs=;
        b=NUO+PobONst02qkemwReK9KaLTJus3Dyer3LeKf2tSfDKP7DZlYYtZFtJFi1ErTdTy
         wJZWULriHBvONR654qGic2EMFv0qQ81xRTFN7hhaoFtF/thUC2DmEjuFbArgDKpwBpOa
         SBh8mk3WgONP4C2KQWGOJkxPZp951M5XnT9WBPCb33XQ5+WvQqhRkB4sXERKb082/GnA
         ivkOjbOCqeBTdrvl/Ue/QCO21nA00faNYSuNxLKVEYzJfTDkMJsdLK7BJrMiOydE3U50
         kT0o+DVicdGL5Ku+fcXnZPSExvxU8SXdTTm2At3DJPPG+ckcz5boDk19jY64DpJOHQxT
         ZujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836394; x=1762441194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRkdAW+Q7RPnHucSsDJRqWTnLPV2iv5eie2Z/QXpXTs=;
        b=Y28krWvcKYwQo1+tMmkFP6EC7qxb7/iOyE8VxBKdf8UdOJM8AfLFr169inKAT+4kNn
         4JgPydZ6s6BQ3NhlVAc+xZ1eJEpIgmj++z1R6c7mTm+hAPO3TVIV3qSN+QvNiJrthLas
         bgYkfa099OKKpYJfa33Y5pXzpT4t5zpw3YUySQMbDqU4RycRtxeGkrLbJpDJrUdSv31/
         TLmdHcT9xUXP39nZU4PL8wGEZWd9QNuTGitQyfxC6LKdHn8RvLsoc6r3X15BrBPXoLfC
         EqcdvjyOG1BMi28iCB9048nVwoT8/s5IsyAtwjdqjjqj1jWJZgL6q5IumEN0CSw+tGUg
         2itQ==
X-Gm-Message-State: AOJu0YxS5ltrDXU6C8wLzjBCtR2e4J0HiTFXKetVmk9qSDV78dKRvsWy
	oFTl38VW1mJMbM8OR8eW8sWky5IEJZKKwvS1aCU0YDpSEwaI67ssbB9rYBKGMvYK
X-Gm-Gg: ASbGncvrB1+1sImeBj/mh3eGEL2GKHjh/QtIgJ2jolej26JWzxfp6X+EntPxF/SRQuP
	43wBh4NGCCp5yYjDXwnwXeMITl/NROoqgGH42VuUy/PlJg7lSQbvVhh6LNSN4V/Ada0e0Z6Dn+B
	zaxDQ6RqH1zsYGKeDllvOM0DFPlsZCKeDx0394T6fkEeDEayYNNqce9qBsrjFVpWzcAjpPyW/fs
	cs/iluW2b9uVo+lNVEzauBHyHlH/ex8VV3nJlL5l7FxdfbQlZW2AewMbnHHSwtnOiArhsuQNuJG
	QqtA8/WS3n1GCLOmfjIatKAIJswEFJ1EeCZgY5JA6i4RhmKjI/mMcQ6V0ts2YOC1krGP7y3hzSR
	0dUdkVVZmoASCKMIuMNDKpMxOptvD0GuYUmWzAieYTdKVt6/2xCThaCIz9g+uIy/N7KJLjg==
X-Google-Smtp-Source: AGHT+IFFhpLuPHgSg37HN1GF5tns1A7b5QeI5XhKNT2T+PGhBTbv6IOnyRcLQr5PqDFj0UmOsVKEHA==
X-Received: by 2002:a05:6a20:7d9f:b0:340:fce2:a15c with SMTP id adf61e73a8af0-3465145fb1bmr7363692637.9.1761836394335;
        Thu, 30 Oct 2025 07:59:54 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:59:53 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 00/11] powerpc/book3s64: Hash / SLB fixes & improvements
Date: Thu, 30 Oct 2025 20:27:25 +0530
Message-ID: <cover.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Hello All,

While working on slb multi-hit issue we identified few more fixes and
improvements required for Hash / SLB code. This patch series is a result of
that.

RFC -> v2:
==========
1. Addressed review comments from Christophe.
2. Added PATCH [5-8] as improvements patches.
3. Dropped the last patch which adds slb faults to vmstat counter.
   I'd like to do some more testing of this internally first, and if it proves to
   be really useful, I will send that patch separately later.

[RFC]: https://lore.kernel.org/linuxppc-dev/cover.1756522067.git.ritesh.list@gmail.com/

Donet Tom (1):
  powerpc/64s/slb: Fix SLB multihit issue during SLB preload

Ritesh Harjani (IBM) (10):
  powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
  powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
  powerpc/64s/hash: Fix phys_addr_t printf format in htab_initialize()
  powerpc/64s/hash: Improve hash mmu printk messages
  powerpc/64s/hash: Hash hpt_order should be only available with Hash MMU
  powerpc/64s/hash: Update directMap page counters for Hash
  powerpc/64s/pgtable: Enable directMap counters in meminfo for Hash
  powerpc/ptdump: Dump PXX level info for kernel_page_tables
  powerpc/64s/slb: Make preload_add return type as void
  powerpc/64s/slb: Add no_slb_preload early cmdline param

 .../admin-guide/kernel-parameters.txt         |   3 +
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 -
 arch/powerpc/kernel/process.c                 |   5 -
 arch/powerpc/mm/book3s64/hash_utils.c         |  41 +++++--
 arch/powerpc/mm/book3s64/internal.h           |   9 +-
 arch/powerpc/mm/book3s64/mmu_context.c        |   2 -
 arch/powerpc/mm/book3s64/pgtable.c            |  23 ++--
 arch/powerpc/mm/book3s64/slb.c                | 109 +++---------------
 arch/powerpc/mm/ptdump/8xx.c                  |   5 +
 arch/powerpc/mm/ptdump/book3s64.c             |   5 +
 arch/powerpc/mm/ptdump/hashpagetable.c        |   6 +
 arch/powerpc/mm/ptdump/ptdump.c               |   1 +
 arch/powerpc/mm/ptdump/ptdump.h               |   1 +
 arch/powerpc/mm/ptdump/shared.c               |   5 +
 14 files changed, 93 insertions(+), 123 deletions(-)

--
2.51.0



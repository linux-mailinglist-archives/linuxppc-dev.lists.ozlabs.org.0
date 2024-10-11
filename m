Return-Path: <linuxppc-dev+bounces-2094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B778999DC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:23:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPylk0kLGz3bm3;
	Fri, 11 Oct 2024 18:23:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728631410;
	cv=none; b=YqdWsaSqqoXgzSFJPS+clTwKXOCKlSsEXo4l3UueBp29wlqK2JDQLljW1Ykuq3tD/4h+i4EQEvWDRxYqVnJp7lI/8I4uHR/GCsMqVDsN4IwzRN0kqn9ewWgN5QClaoDRxP07NaqyQGZN70PyquCnDOCmfizB9mP1sP2fS8gc4FVJkGNJ71E/b23UUcc/2DxHMxFOQLU6NZ/qs1q0ESA6H7gov9OXSNFs8I6c6kEhDRqPOLK0lGQOB9NCHHKyHEqzPloPGg+6SBk5kxK7L6DgvqK7V6DSRhnLGsGZKKarU4d+BfWYd9JYJcfPBS2uO+1el+IcTgq45IolDkEecK4SoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728631410; c=relaxed/relaxed;
	bh=XnEaqowfcnk7jkRXbNgb4/5Y6pMvkA79KiBX2pek4eE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9SZTCS6xLfh6OifqvZtRMRKezy+/KX4f5he0lqBDR8A61zCtfwts15wZTqHEqwjo93b0zopYnxQ0gmPV7ozyBGrZO/PJenw55+Zgn/4Fj1rQy1gufPIJm4d1DFIMYF24Ni3ZYnRqeT+QUwhj1K/RTDuux5YgZ3WWNVmNlVMiqWOetM7q53T5plmrCAKcc584cn/e3NXSKJv85lY6K75nKAaEw15yVAKaXMAmTBc9l7sgOjD0HJNMZOeEo+8PIVeXe8wjOJ8+6k+Toq6r1ethZi1Npg5ntVviHTHXxT75tsz9K0GeYRBAFEmnh1a1w6Y44Q3kciiO7pFoX/ubpNtkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C7RMJNf9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C7RMJNf9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPylh3mhMz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:23:27 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c693b68f5so17544025ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631405; x=1729236205; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnEaqowfcnk7jkRXbNgb4/5Y6pMvkA79KiBX2pek4eE=;
        b=C7RMJNf9h/dTUHnIIHgUpP8wbmxdF2wDY3X55Plq4uTuAIrOZ5t3QvbSGv0rmJ9KIb
         NkqB94XFHTHPc3D3ZDsZIU6NBdP6l5AXaHMaZwYBtWnRDrtumOMFYm/ySOljvT1R5Ani
         GH8vhPlLLKgTtOukrfDlMPl+pzkLHY1PwiVXUxrDC7ise587Aos7zZ0OzPv0Ps4renMv
         wQGn3jlJ/B8eyx8W6g5VxMABOJFVQK2LJ42KYVB+5YD/cQ9B3AD033tizgGmH4jsS2K6
         BEIOfFak33OsmZ2x3dPgmHVt3mHdF6VcCvyfGsYgGPCnqhTK8Ot/rwcQtrn/4kGqOo8g
         bTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631405; x=1729236205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnEaqowfcnk7jkRXbNgb4/5Y6pMvkA79KiBX2pek4eE=;
        b=WBem9+aY8frp70tfo7Zg1fjTxd3zkeTBq2Zf8qZqwT41ncFc4lkammGvrWSSza6Q9X
         mwQFxS7SFW3vyXteTMPeKASFbekG5SwHpxv+K0v0PDxksf3reeIjwd7+IF71D+dhfDhm
         VLjXE8vJ9hFto4RojGrLrj7qM7ZYwtDqXu7ZgzQVOJW+zovkr299KpXJq/ZtxBzhdiwS
         lHkSyCmgz+EvmChD/N5BX53I/jbTQk9Aa60dIh9d1nHpX8sQ7RlPLabaa6p8hHZJI5RT
         2OdQKXvlS3ruGFcvUh/qYJJHHNPUI2IaKo4uPAqcs4XVusfTcKOxcu+ocBqrrUrR6f0m
         ffjA==
X-Gm-Message-State: AOJu0YxmNXNm1Eytq/PZjlsrwHH4NyqbiI7216/ielA2Jo2ieo0yUKY8
	LOosGfn+px90uVzVgd0ILTCLRh5McoBl7NTYNtuRpIE3lz+qYm6Wy2RJKQ==
X-Google-Smtp-Source: AGHT+IEFSIOyyGQ8iJm7Cv2Shmsw3hdd0D/3Fh+uN3QrHhs9C/KyWtczMqCxJnNMNXv5/J4NljymUg==
X-Received: by 2002:a17:902:d4ca:b0:20b:7a46:1071 with SMTP id d9443c01a7336-20ca13f7200mr21256995ad.4.1728631404978;
        Fri, 11 Oct 2024 00:23:24 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad335dsm18825155ad.50.2024.10.11.00.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:23:24 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 0/4] cma: powerpc fadump fixes
Date: Fri, 11 Oct 2024 12:53:08 +0530
Message-ID: <cover.1728585512.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Please find the v2 of cma related powerpc fadump fixes.

Patch-1 is a change in mm/cma.c to make sure we return an error if someone uses
cma_init_reserved_mem() before the pageblock_order is initalized.

I guess, it's best if Patch-1 goes via mm tree and since rest of the changes
are powerpc fadump fixes hence those should go via powerpc tree. Right?

v1 -> v2:
=========
1. Review comments from David to call fadump_cma_init() after the
   pageblock_order is initialized. Also to catch usages if someone tries
   to call cma_init_reserved_mem() before pageblock_order is initialized.

[v1]: https://lore.kernel.org/linuxppc-dev/c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (4):
  cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
  fadump: Refactor and prepare fadump_cma_init for late init
  fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
  fadump: Move fadump_cma_init to setup_arch() after initmem_init()

 arch/powerpc/include/asm/fadump.h  |  7 ++++
 arch/powerpc/kernel/fadump.c       | 55 +++++++++++++++---------------
 arch/powerpc/kernel/setup-common.c |  6 ++--
 mm/cma.c                           |  9 +++++
 4 files changed, 48 insertions(+), 29 deletions(-)

--
2.46.0



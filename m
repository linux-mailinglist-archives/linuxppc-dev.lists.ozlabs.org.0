Return-Path: <linuxppc-dev+bounces-3147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A619C7363
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 15:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpQRM4847z2yGd;
	Thu, 14 Nov 2024 01:20:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731507615;
	cv=none; b=M+DcC1dq3GwpxKnbPIC/0KRtAJQwmEb5j9Phm87DcIOKOBT0pmjxslvG1npsGtr+O2z2UD7xeTqyGE2fKXaSokdfPkAzQW3ICdzXXuWEAAqzo+QwY4uVZbXUIKFAYUbHVaEIgjJ1X2ozy8oQMDcbkXJsA9/qdkYW5HPDPztLAGsOZjqIqpu01DKe7RX5nNNv8muyGSGWEzupqHz73DGJPyA37s6nigTGMR/P7Lcv9waTUc6l3zdmShDcCWTSlzKWwXQpVvs+vr3rbmutnaNZF7pPpQ6IjefzdYES911qcpguLDqmOuIgXLFxl5bdITEaLqcN34ZkhNM2hxdD/+MHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731507615; c=relaxed/relaxed;
	bh=E+W5/1/yBRnzApluXvmZS6wnEL9+HSsK6+2J6aji4ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/JyTIk+i5eTkBh/QCaV1FD8mK+KYAhtFXyqAdWss9oc2XLvnAexF9F20ujDfx/DV+7ztepMackC9wtqWH+Gw62/RLq95Plr1W5TWi8jHdtczX3B3yB/Awjrf6+ad3P43QthgBH1Mxu7to+N62xu7XdSpbd0RjrrZdZeulM7YWjaqz78HdbrIcp7+rArZ4ob7jAKvdefoK0IMiKGUUkuoPPBbCDzT+Pw3AxOsRlaN1ytw68EsMc3JI9NwjgMDlSt2YTdXVoxi38r6xlXgqAoflH5nnsijmdvV42yDDxprtWulrzvFq5tQQF5vHMOzHZ6FrSLrfA8+hdFoHDvxVIdYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QpM4DxI5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QpM4DxI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpQRL07NTz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 01:20:12 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7f450f7f11dso2752579a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 06:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731507608; x=1732112408; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+W5/1/yBRnzApluXvmZS6wnEL9+HSsK6+2J6aji4ic=;
        b=QpM4DxI5x5WTpeFWyAUQHMs185bKeKdfSOwTTrMpYBtrtfBYwEP9/k6BDiNPyE+K5F
         sA98W6nKjEk8LUpQZ59y7Beka28BLYwm8AA5576CxrhhVCZPrFjVOfr/5gLoRs06Pj6d
         ygMIPp/A6fo45pDJjpt+fVBn31KvwGEm5TSVXsLAKTBZ7JVh5VhWxn04jaTfQibq3Zt/
         xkxOf/FMfHStgkigU955sNa2wJd2X8LLCjke00EQrboeRkjIX3y5a1/kKqwjJyP1MW/A
         r0PrYYphFS5faft4KRZFuSh/pwOdKktwF9edzQhYH8si8l011NTxKlVmSzZ/fBp9BgIJ
         Kq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731507608; x=1732112408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+W5/1/yBRnzApluXvmZS6wnEL9+HSsK6+2J6aji4ic=;
        b=Mypk4SJzGfkzk0Dee4DxH+AEkynBeLBi2ys3biKRqyBCXiwAs1AtPpsKqzAr+B18wf
         8gkmrN4FVEbz8VCYPQxeUNpzfimMgtLrC6+Es27uAP1xSM5MD/b7XxyBGst/NeVflgQD
         pzxHcAh4q/IpTlCB8allxqgtACQgUyQUk96JFyi3kUTA72BtRopoVIKRzIgErHR1vMgu
         2L3KlzHcB3AHNl+TEaPcd4V7VC1Nob2+XNxhQvdRS0uQjNlLSvdVbC7Rcj1bzMFbJWTS
         w1rFw5ssoUTRHR9Bq7XsD9PbPo5b0zBmT6G8wZ90WCoDRS1HopluYofUUTFcjHjCNYsb
         iquw==
X-Forwarded-Encrypted: i=1; AJvYcCVdvDZK3DDyoHTK40ktdURj3M5keKFkRh+SOdxbmjtx3YMNP5MZ1V8sCRCGoQ/Tu23Y+p66wKwPzQusEKQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLrwbGMnVrnHeDP+Mw3YsGuuvQ2f7+QVYSUZqMctmFa1x4ucs5
	XQWquYyqDonm7y/qPtxP2yrJL5Xte6D0/hlcTALFZg28UIH/wmSe
X-Google-Smtp-Source: AGHT+IGeOAmmIL3JeGd2B/FeYzTlCYu440XfiAvTwoYmEtolyVkG9FqkwR5NzpR2JeHhiVjtarSHuQ==
X-Received: by 2002:a17:902:ea02:b0:20c:5c13:732e with SMTP id d9443c01a7336-21183e11d8bmr278709445ad.38.1731507607853;
        Wed, 13 Nov 2024 06:20:07 -0800 (PST)
Received: from dw-tp.ibmuc.com ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6ab8fsm110636045ad.226.2024.11.13.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:20:07 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH v4 -next] cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
Date: Wed, 13 Nov 2024 19:49:54 +0530
Message-ID: <e274344b44d5f80fa54c52f530387257fe99ec65.1731505681.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cma_init_reserved_mem() checks base and size alignment with
CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
early boot when pageblock_order is 0. That means if base and size does
not have pageblock_order alignment, it can cause functional failures
during cma activate area.

So let's enforce pageblock_order to be non-zero during
cma_init_reserved_mem() to catch such wrong usages.

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
RFCv3 -> v4:
1. Dropped RFC tagged as requested by Andrew.
2. Updated the changelog & added background as requested by Andrew [RFCv3]
3. Added acked-by and RBs tags.
4. Small commit msg update.
5. No functional changes.
[RFCv3]: https://lore.kernel.org/all/20241112225902.f20215e5015f4d7cdf502302@linux-foundation.org/

Background -
============
1. This was seen with fadump on PowerPC which was calling
   cma_init_reserved_mem() before the pageblock_order was initialized.
   This is now fixed in the fadump on PowerPC itself. The details of that
   can be found in the patch including the userspace-visible effect of the issue [1].
2. However it was also decided that we should add a stronger enforcement check
   within cma_init_reserved_mem() to catch such wrong usages [2]. Hence this
   patch. This is ok to be in -next and there is no "Fixes" tag required for
   this patch.

[1]: https://lore.kernel.org/all/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/
[2]: https://lore.kernel.org/all/83eb128e-4f06-4725-a843-a4563f246a44@redhat.com/

 mm/cma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 3e9724716bad..36d753e7a0bf 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -182,6 +182,15 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	if (!size || !memblock_is_region_reserved(base, size))
 		return -EINVAL;

+	/*
+	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+	 * needs pageblock_order to be initialized. Let's enforce it.
+	 */
+	if (!pageblock_order) {
+		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+		return -EINVAL;
+	}
+
 	/* ensure minimal alignment required by mm core */
 	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
 		return -EINVAL;
--
2.46.0



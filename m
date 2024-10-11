Return-Path: <linuxppc-dev+bounces-2095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4A8999DC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPylq1yYWz3brm;
	Fri, 11 Oct 2024 18:23:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728631415;
	cv=none; b=iOc6JScN/YexKUMc3q/DvpIp+l4aGLNTXHW+jpAD/TxNIp4+NwRO39003OmM+bvUTZ1JlwlHaRauxZ/8w0wUS5qysC4rPH2nZYf59Qc0HJ13g9ZwClOY3b9Hp2BD4xjsacfWMq9diQjUt9HMeoJtou9xdHY0y/A/5KDPATlAR1jyjziX04+dp0SC7UPUk8vAAI6rlJnESp++QEAiOAuZwE/upCJ/XJ0ZdPvHdFxw7TkaD/eE0wL4MeHyGuMP+fUaq/4hqH2gAj1JpV63rCACaIF7Ex+hZAMMICL76tOzcHCXlJg80kKY/p7qlLwC5Z5qcBsuLM/fCGTVR6xY1yPQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728631415; c=relaxed/relaxed;
	bh=cFXU0lQKXMNLX0e10iqDZMzQn21Hy9EUBSVtGclHKC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzZsRHyvCbyU9YL4zbVSkrlr+c/esqN2iynBwiPuOirqpErXfuNR+7Uq82HOkhPUycNdH+KQA9nV4lGX/ijpiODTtHIK6c64hCmt3Gf1vjGgyofE5hyCNYNxyT1gJnvz7/IBx1n4X+Dh9GDr5deqe3/j9RJuQN4vBq1U0HR7uqqOG5ZCymNYS0alkPnjE3BqPWXywDv/j+o8PlFpvc/x91E4W9XLhFGFfT8n/B3kvObC89a5/c9QVrz5d0yrcTl8pi8J8fLnmR+n6gjkVvQPq4yFpiKu2J3iimSt/eNeSP/wp0I6o0rNjWT28OnGhkexD6txFBBejDt/E5hPoJ04Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZIvpZ1nR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZIvpZ1nR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPylp2cBbz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:23:34 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c544d34bcso16337965ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631411; x=1729236211; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFXU0lQKXMNLX0e10iqDZMzQn21Hy9EUBSVtGclHKC0=;
        b=ZIvpZ1nRAqOFKdm3CB6OQd9FLwmzvapiRwUX/MT7pYI7Bkt0M/zt8TsUfzOkK0zlYc
         plCu6BBHpgmdORGxKIcK65ae/wBUqDfRbFbPjSEnYWdb++BMjR7Cv2MeMG678KKiBv6j
         oHmR5MhFyhM9Uz8wVAEuSqTepKMd1dVvWGBOx2M1t3y8MGZXFdAfBOrS1NYn50UEQE2U
         Uud9woTOIoSGq4N0cIfzgUTxojCMeEGipSUpBYBdI7DPD+IKuyHB/Aq7kxK8o0TCTcty
         J4NKW7k3QlnZOXy5heXULTEQ/HJaeFpFO058qPa4squ54yJYvjed9OwnL0fa0OLRcfgJ
         iZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631411; x=1729236211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFXU0lQKXMNLX0e10iqDZMzQn21Hy9EUBSVtGclHKC0=;
        b=wZBCrQ1hz2CJPBNiBgUvrR+rk1GowPRb+fSBFf/A3csEbnQ6Gtynw7QVMYe4Eh6X6V
         gK5wJbMp8Tohl+OTkRQgLrAaJaF/KDVLu8ObxdeYHq1cRGJR+kJGshAZ5dnddjYBrCp4
         yyGedrjc9lAJRfmaRy0n54Krl9Zyq5/dTnweaonqJhwig7OEzkqyvB2JURnq5Outa4xR
         YAaXmBDvBxGIe+NjqotU1ct/H20AtFKnN5SjykHIy56B+KYKaxIwV4w7qbKOZWOAK5Lk
         x5vprqCPeZeW4GPw0y4ddqmbuEvKcMDrOzJPCY85WYwfyEHvdoWoF8kFcuumYKQUM8+1
         +XQw==
X-Gm-Message-State: AOJu0YxS1nIDP4YD8FPeLEZhN769cqs/9mX3WOdQ/cYITOU3ugz6I/Ai
	qQbNjvvG5YwW9Zbvgx3+5PlX3NBYnHOmFxsDvnGMD2L4IVtlyBPGFdE+Hw==
X-Google-Smtp-Source: AGHT+IGQ8iq1sir1NebxPCSK/DS4CJ2zGOXIXoa+HRwjhD+gjsmYWNAElhY1mGxdYNMN7u4TdJpehw==
X-Received: by 2002:a17:902:d2c8:b0:206:96bf:b0cf with SMTP id d9443c01a7336-20ca1315240mr25369385ad.0.1728631410877;
        Fri, 11 Oct 2024 00:23:30 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad335dsm18825155ad.50.2024.10.11.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:23:30 -0700 (PDT)
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
Subject: [RFC v2 1/4] cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
Date: Fri, 11 Oct 2024 12:53:09 +0530
Message-ID: <8579f887412720bd6f2fbce513c1c9904772ead4.1728585512.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728585512.git.ritesh.list@gmail.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
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

cma_init_reserved_mem() checks base and size alignment with
CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
early boot when pageblock_order is 0. That means if base and size does
not have pageblock_order alignment, it can cause functional failures
during cma activate area.

So let's enforce pageblock_order to be non-zero during
cma_init_reserved_mem().

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
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



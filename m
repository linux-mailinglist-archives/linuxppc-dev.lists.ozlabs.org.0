Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F410707DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:51:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sq0L4HRQzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tOIEAvlw"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spw66YrpzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:47:18 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id p184so17715214pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIBaep/KMs89J/MccVHkX0W00/BmLKBpEzrMNK9xGOo=;
 b=tOIEAvlwLCMV1xbie2TbvD9K8o/L5NJZ/vZ0+ReLDuoGN6WUWjtE+sQ4MXpgnfy564
 HdH/JyskY8ezfiZbtKOZG05kNd/JwGNGoRadvLaFEh19PYDXiOgGFk4Wj1YTuA2eiX/N
 8a1W/4lithMBEe9dpY6/pjbJrF88nTBFcDP8qqtV/IjtUfA3qgjm67xB4rPE0Zuh+jQz
 QpM8HzzJkN4DcqUAZFY7aMTjQtfzoA3/QNsrP87qi7NJnUSXN97PmAHUZiwR4jG92M6O
 Ph9n/2F9MKWUVUlu+1EH/qHTgrcV7ZBIYUPZ8nhGFMuIJKRhbNgffvD0X8ZN9sN+dNUh
 DTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIBaep/KMs89J/MccVHkX0W00/BmLKBpEzrMNK9xGOo=;
 b=swHucD0ptymegnc7wsenUtKuzZgFJH3vvd8RymbX2CsJufO3s21wdS9ib/9ETJ2C9E
 +ubwlxPmRMdIm2y7C2thu74zzQQYAhtB0LeNN2ASsYXd0ZvbSBJYqE7UFJ8Ed0OjZkP3
 XNmxD2QkzC0Ei2zZQtSvqGq5TJFZ8Q6EyGyX6JP0b3ef/Af7s1FfmmldfImI3Bp4TRQ/
 AydNWOBZSVzpsfpMTAdYvK9WGC2butukIiqWg1K8seR8iA7rROKhcczI3ai05qxVt/pZ
 IFJwdSJu72ogLrdP4ZrzRsjH3wJBCROewnI9AwXpmc6gVr1dTP95GpwGwySew8RtIVQg
 khfQ==
X-Gm-Message-State: APjAAAVLyAQQZeiMKP+1l2TFdS1uRYESao+Tqprzvz6QbBCnV9qyYVVI
 bwtrh8047qFQ8Oy9pmc5BovNlTY3
X-Google-Smtp-Source: APXvYqybvKn8k8MzbDYzw5lm+VnugEgaWNaxMY3Psk610ZEkGkvcNZu0QX9ZILVvadpiCiGJvE9egg==
X-Received: by 2002:a63:7a01:: with SMTP id v1mr74312722pgc.310.1563817636471; 
 Mon, 22 Jul 2019 10:47:16 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id z24sm69170057pfr.51.2019.07.22.10.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:47:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/4] powerpc/64s/radix: Fix memory hotplug section page
 table creation
Date: Tue, 23 Jul 2019 03:46:57 +1000
Message-Id: <20190722174700.11483-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722174700.11483-1-npiggin@gmail.com>
References: <20190722174700.11483-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

create_physical_mapping expects physical addresses, but creating and
splitting these mappings after boot is supplying virtual (effective)
addresses. This can be hit by booting with limited memory then probing
new physical memory sections.

Cc: Reza Arbab <arbab@linux.vnet.ibm.com>
Fixes: 6cc27341b21a8 ("powerpc/mm: add radix__create_section_mapping()")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b4ca9e95e678..c5cc16ab1954 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -902,7 +902,7 @@ int __meminit radix__create_section_mapping(unsigned long start, unsigned long e
 		return -1;
 	}
 
-	return create_physical_mapping(start, end, nid);
+	return create_physical_mapping(__pa(start), __pa(end), nid);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
-- 
2.20.1


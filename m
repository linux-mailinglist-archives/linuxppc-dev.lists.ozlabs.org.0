Return-Path: <linuxppc-dev+bounces-2377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 498729A4386
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 18:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVVHb6CQsz3bn0;
	Sat, 19 Oct 2024 03:18:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729268299;
	cv=none; b=SJSmWbFo8+CTV7EgwkzkOjkHDmyZnfySzEXwMUwxZQ4lE3FV8WbEhzY7XTZHMfk6nCsrlCMiM7vQRwtn6HE/icOCqGezvYHPJxeCnpOw6BwLgeffjvs45SHtz7FyOz+ziXpcwJ0z0Q7UQzHAcZyqTE/SGaoXKIbVAzT05eAnk+jmt+K+7HCSiksNdzc0VNW5LMNm8uDxsNgppBJoILLMD2WlvbKenW2lZ7ms1OlxGKox6Yho/ZYnHcVrpS6dmFstTLKPaHQvSBzRPlfz2qd+KibsyDIknEZMKtRHltpElCdkmmcmfIPMdX6YCYdy8WvRKlkrla32I8EGIcWkhMg74g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729268299; c=relaxed/relaxed;
	bh=lI1lmoX0aShbqtjbwicYm75B+4+2640ny91XLHS0QLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VcmDBC7sJdm3evl9LhsBxH2fkcysX9TRE6cI24h0jAKjsbjmA1PbPTUrwHoN0aI4ZH2FzPttMJINMMGVjygSjSX/msFDXZBt5qs+ykg1NhyT36BT9DkffNQc4VMuGYdygnu0A7UMfxFUue72cMF1f28MczH14bJSolz/6Y+H1PQGHwjXtLs5mmeagBzVu60DGZLjZno5oTqdWj3m+ezIczFqO/Nvp4khUalQ9xqoC5YbqEfXKNyYiGHvJ0zsW7K1ZWhqh9QTHv2fLceJytsJ8/caJ3E+NIftJ7aS2AstzyE6SKAe8AifdRO4YN4yjvm2hoSP3aIj3w3OWzjcvr1Law==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=buJQZKTw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=buJQZKTw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVVHZ4FGkz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 03:18:17 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e9fd82f1a5so1601594a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268294; x=1729873094; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lI1lmoX0aShbqtjbwicYm75B+4+2640ny91XLHS0QLk=;
        b=buJQZKTwpG13oqHBtDDJ+WUFFYVY6HexvB9kgemIGmw+Rc8XXPrK+zJaVJEEToVmmV
         ZbtA+XNajgWM4GkLNKFbpL4GnlVg1A2ON9xAzqRGeRRWF6+OZb6o9uMrp3ysqnOMKxKp
         v5VtPtjx/KJIV69rjqAqHIkG1lGE6+7UzPr3l8vriDCPzpBqy2iwKVpkr7l4GkgjlKaW
         5Kw5C19okm/3lkQG0iuyQ4VC0hG3PB7Fhc4/ahOXFshjHQIXKxMpDh4zeu+l7NyJnhtJ
         LDEtX/0i+868X9NEDCTS4l93TQIKXzJVM3lcsBorfKVGl799xpj4P8BEbsjk3O1iOwpj
         0wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268294; x=1729873094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lI1lmoX0aShbqtjbwicYm75B+4+2640ny91XLHS0QLk=;
        b=IAepjQvcTG6jG0qiCY3VFECkDeK7WbOj0Qgl1orQS/OOZq4PbJ5ZMXWxho/A/FfcUf
         wk+Ie98pW1IL5fdiZ5+q2hLrozGclJoJn11m0hwcojC2obVDox9yH1LcPbjQNZzeSc/F
         aoQBA38aIvpempsheZEo916pHUly1j//9mgSRsT0ewxtN45TS+G/ee7nn9mcgG94wdHB
         hpvDjnGy1GCn9FAZgWB46+E/i2neOy0fu8rjohSu3qI2PiNDZ+mv7OydjlprbrnrAH0f
         AGRloaQidtEkWtz54iKeQvUYMkR7WKhavrxbPWbSHyhr01zJToUaNiusUDgYkZqau2UM
         k+bA==
X-Gm-Message-State: AOJu0Yw0fMXOfLZ67rMmzZ+Ihaoe2G3j9LLytyn1lM4x78VEAheNQPu5
	GYR5mp2ATuePmxefsgehvcVVLP21gry4Z1le9QmzcUdGKtOeAnJ0ZunjQ6Ec
X-Google-Smtp-Source: AGHT+IHzJGqOqiYMgY0XNWgsPScuQIuvxXcZGIlbc7649iguD7LwhL7RFqPyEBoqw+pUDCliOqawww==
X-Received: by 2002:a05:6a21:6801:b0:1d9:278a:9ab with SMTP id adf61e73a8af0-1d92c56d430mr4837764637.35.1729268294000;
        Fri, 18 Oct 2024 09:18:14 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345677asm1692140b3a.147.2024.10.18.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:18:13 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 1/3] powerpc/fadump: Refactor and prepare fadump_cma_init for late init
Date: Fri, 18 Oct 2024 21:47:55 +0530
Message-ID: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
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

We anyway don't use any return values from fadump_cma_init(). Since
fadump_reserve_mem() from where fadump_cma_init() gets called today,
already has the required checks.
This patch makes this function return type as void. Let's also handle
extra cases like return if fadump_supported is false or dump_active, so
that in later patches we can call fadump_cma_init() separately from
setup_arch().

Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---

v3 -> v4
=========
1. Dropped RFC tag.
2. Updated commit subject from fadump: <> powerpc/fadump:
3. Added RvBs and Acks.
[v3]: https://lore.kernel.org/linuxppc-dev/030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com/

 arch/powerpc/kernel/fadump.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a612e7513a4f..162327d66982 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -78,27 +78,23 @@ static struct cma *fadump_cma;
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
-static int __init fadump_cma_init(void)
+static void __init fadump_cma_init(void)
 {
 	unsigned long long base, size;
 	int rc;

-	if (!fw_dump.fadump_enabled)
-		return 0;
-
+	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
+			fw_dump.dump_active)
+		return;
 	/*
 	 * Do not use CMA if user has provided fadump=nocma kernel parameter.
-	 * Return 1 to continue with fadump old behaviour.
 	 */
-	if (fw_dump.nocma)
-		return 1;
+	if (fw_dump.nocma || !fw_dump.boot_memory_size)
+		return;

 	base = fw_dump.reserve_dump_area_start;
 	size = fw_dump.boot_memory_size;

-	if (!size)
-		return 0;
-
 	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
 	if (rc) {
 		pr_err("Failed to init cma area for firmware-assisted dump,%d\n", rc);
@@ -108,7 +104,7 @@ static int __init fadump_cma_init(void)
 		 * blocked from production system usage.  Hence return 1,
 		 * so that we can continue with fadump.
 		 */
-		return 1;
+		return;
 	}

 	/*
@@ -125,10 +121,9 @@ static int __init fadump_cma_init(void)
 		cma_get_size(fadump_cma),
 		(unsigned long)cma_get_base(fadump_cma) >> 20,
 		fw_dump.reserve_dump_area_size);
-	return 1;
 }
 #else
-static int __init fadump_cma_init(void) { return 1; }
+static void __init fadump_cma_init(void) { }
 #endif /* CONFIG_CMA */

 /*
@@ -638,7 +633,7 @@ int __init fadump_reserve_mem(void)
 		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
 			(size >> 20), base, (memblock_phys_mem_size() >> 20));

-		ret = fadump_cma_init();
+		fadump_cma_init();
 	}

 	return ret;
--
2.46.0



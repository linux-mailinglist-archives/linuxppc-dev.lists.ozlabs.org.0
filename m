Return-Path: <linuxppc-dev+bounces-2096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D3999DC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:23:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPylx0wk3z3bsd;
	Fri, 11 Oct 2024 18:23:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728631421;
	cv=none; b=XRrGwIRdjgJj2jbSvuVbnRHwXADV9CYrurhfAPd3/dQrbPCUya1oCZG6+jXK3DgAqIZqXZHOyT+aGJxgGwaSO2hLrq2gERCajpWv14IO5gvTOywOVKRChYlVSYa5qbCsOH866iyrzUFL3W3f0OfgqDaXB3JlDQAmwT9G4e8SAL+S1qDH+2jVfM9ZPbKj0CcabERwbX0RE6lYrsrS4OIullGwN0sHfatomvpShA6bDISbct7EYtRlxxFfoggBO5AvP8BlT4G3EZecPpFR7Plld66rWU33xcMDd2a8q+BxVk6lXtx236OwLP/xrh0rOqPV1upSjKJk41R00YajGlZKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728631421; c=relaxed/relaxed;
	bh=e0XcJo9JGEctgbuPEWvt7vh5Yz6kEP61gEF6kN7DKNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/xftYHAsMnowatzeefLiKGFO4vt3ugXESIxnTl0tQ/CQ/PLRNjBl9t8j0WJz1o78T7zYgtzXLC8gZf9k/A9ltryma+nJOPW5XYkPsHLtFRFa2+paxYGGLO0RxD3KeZM+303HkGoo891ZmqIzspCToQ1YfI8KGSG2wM9SS2WwrTlcNQ20dWaE2Z4hIXl8yXJSJUVJaHfG2vSYwSKkxoonkgtD9/Y2Db9C9VzLEAAfkRjFnR2+PRsK8LCZfBItuBx0DmVg3nmlF6XlKzwZzuqH1Mqb8ueNlVDoH4jBRw5G00YJgU5XVXJu+Ewpe7eZNThUQ4AeT/fdjPcCBZhnxY+dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uo2Zbzkw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uo2Zbzkw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPylw2H63z2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:23:40 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so1465853a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728631417; x=1729236217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0XcJo9JGEctgbuPEWvt7vh5Yz6kEP61gEF6kN7DKNI=;
        b=Uo2ZbzkwSt/xHs+Lb8/jlAztPNczymCf6KPSNUbATLkQOoHrtdVYIHRA8friN9lQdE
         9YpZm+/1j+V7s8mYSDwOPYEnSnOwYwS6FgRhwZuQJklTYCV6grudgsFfJ2XwbJrOQsOa
         ID5o6FnjbjSrq245R6wZov4wjTcFKpG/lwBuW6vXh24NeSqK/He68bUgMwF51TssThGV
         TtrEw/IndXJtX/USpzubLG3LaOr0TDpwwmg6T7Tc+jP1rLoTmdbk9aD7mdVfyugwPSj9
         rS7OmE/lzp9Y6H1UtDLgCxc5VUIRWR1gr9LFR2Yut7DgyrSsDdAxIJEYBmHlhaMeZDbW
         eGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631417; x=1729236217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0XcJo9JGEctgbuPEWvt7vh5Yz6kEP61gEF6kN7DKNI=;
        b=jp0sCzHKQtMtteKm3hpS+JJ1gaeaaI0higTsFDtKL+hpNxjD5M7wHCF12daLOw3dzQ
         aXXPzCtCmVJshN2UTZyhJiq3v5qalY01O7tDO1KhKZbISLlai8HxuTHG+tzwC5bSdEZj
         G0Zsy6/touDgmexcI9exvqGZfkeXqvsrKB4qKCMgl2WDbIVmmZq7mutHFay+H3Gb5UBP
         8bRFCGZQsIdLalnH+88sZO5WPn6fLBjyBZ2QY1+N1FtFDtJ7W5xa4NQloXjPhRpl2maM
         2VG+Ad7juE9aEuz6n+USYG3JT4njUz2iwOo8H63JdoNbCNeI0+dqtw6GUi9IVSY3Sye3
         Ndvw==
X-Gm-Message-State: AOJu0YysFJZPjIcDTxIL7fK+HgxpHUXJGNnIPr+3g6yBCP8h6WA022XQ
	Mjd105PEF9akNPtkMrTTIx+/Y7f7i4Rfup2O4IcBEG4NbFvBGpWcrS3ebw==
X-Google-Smtp-Source: AGHT+IFVJLbjrihstm+z1iQykRd1RHjrMq1OggwLcM33etRABky007jtDtqG43IWWvWSUwC4nwqrng==
X-Received: by 2002:a05:6a21:6b0a:b0:1d6:de67:91ca with SMTP id adf61e73a8af0-1d8bcefd51bmr2327071637.4.1728631416985;
        Fri, 11 Oct 2024 00:23:36 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad335dsm18825155ad.50.2024.10.11.00.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 00:23:36 -0700 (PDT)
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
Subject: [RFC v2 2/4] fadump: Refactor and prepare fadump_cma_init for late init
Date: Fri, 11 Oct 2024 12:53:10 +0530
Message-ID: <079e98d7db3b63bc8a568f4e8c03f2976878ae23.1728585512.git.ritesh.list@gmail.com>
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

We anyway don't use any return values from fadump_cma_init(). Since
fadump_reserve_mem() from where fadump_cma_init() gets called today,
already has the required checks.
This patch makes this function return type as void. Let's also handle
extra cases like return if fadump_supported is false or dump_active, so
that in later patches we can call fadump_cma_init() separately from
setup_arch().

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
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



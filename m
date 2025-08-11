Return-Path: <linuxppc-dev+bounces-10814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAEB21290
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 18:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c10z05f5hz3cnv;
	Tue, 12 Aug 2025 02:51:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754931100;
	cv=none; b=CJn1tX31FmvdeubKy3kDKOKTQFtinKHPgyKkpSdRVNdVgqvlwrTYSDxjGUhbFqP2jyxen5TI6FUx7doBI3Lm5/GLdLhKWb0XHo45G+xoqXcKQzBC13W6PakT58+/SyYRyMg+C4al3c9Ugzbgjav6Qe38EMM32B3xj2rcm8a6oYeEeQlQtKYuGElq/OGdg+HKQag0PM7hjW9R6gqfy7gK2tHmD/Iwc+/zeXElfwGmekSesIi/6hbAScCpwXL1eBeVR7qTTpgI3zjiSCe4mwA4AvqdE0sNzgmA33O4Rl/K3r69FqK2oJscK+sdi+QrHt1vWa+dUWEtoW8UiZcIlx+3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754931100; c=relaxed/relaxed;
	bh=V59vbtFhyjRpFQ5fJVEOadJDZUONYR/hv3IrR/WcujM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXOlNiK539LRJjohvcgptF7wltSG9N6tdiBub2e3m4cJTEbLnrMlNpS4IzDskZsyhMFbs6bwjUW1o7wy9tI3HqJpy/+cL3WFddp1y9LewYDooE8RT9q6ZhWLhASzTlYdL6TR0Ab653GJhTrZzBOqji24Pvdr1qbSn/LUdQ1aeOJQKeKlDMsEPHtZO1eram5nlsTFm/eAwIyUEWFVcla7eUFiahEGgV0D6+HiZzRI5e6+Ew318MsbhWsyiHNnVC2VZvD7AujDmoWOA8Q6g79ZxgAg1J++YzGAdaIZ3764tqHrAABhQBNyZHI/ztOP2U5j68ZT7xKE/dvyHhUddKI2Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eq1uOhxM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eq1uOhxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c10yz3nw9z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 02:51:39 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b429db71b3dso3043654a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931097; x=1755535897; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V59vbtFhyjRpFQ5fJVEOadJDZUONYR/hv3IrR/WcujM=;
        b=eq1uOhxMmffdb83LooLAgRI/Gq3LcuBGk9Uc28y0i/XBP0q2OmhSYs5sWSnkNCoCLm
         ju29c89kCp+g0989TZqwIhvhrX6jH5LqUhUYwZOJixJtu+ZUN0NIySltMg4G3g1Stw+J
         ECP11/kBR/zRM+C3pnkH2DosN7RqzyTumNvVIxGhnmCDrWXXrezA7G5ue9bFVwK5p9uD
         lvgtrbm0y4GMmgS9zHoyBEXG5mmRhj8zjAphstjhGWKkrhd5AK9AlwUEZfx/4pRZ7bLZ
         ryNcgQwZjTN3CfxsoL33jZZZ+mOBo0xId6T8U5fxUrCXdjKYcQKjxYqyuEZQ+AWKl3jN
         to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931097; x=1755535897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V59vbtFhyjRpFQ5fJVEOadJDZUONYR/hv3IrR/WcujM=;
        b=f2qV00X5asTMUZPZ0w2h/uha/RNTya1lqT1kT5lf2yxVg6OmmnenCyzS+z1PIp990L
         EMPaXryHuwtsp0PyYXbOkh47S5WVxrWD+sZNnaI8Ksy0xgPrvsZGBZUJigbHCjjMoEtK
         txLD2NEJDTBb+AlTQOUl5/MwuzWb3v24OT4La0kl9zGKrF5twaxg/XlskF3XzUUKx12G
         defFrX7TcDvTaHYM3kV5IrU4QhZGVDDpM04UJ5cH0mqu6JERHGQLq3x9o5r8F4lJib3A
         A6+pvZ4wyijJueLdU85FpeXtK9I4PDetsi0/CJyJ2pvH1/PUUiJFGW239JzXGHewiv4g
         xpGw==
X-Forwarded-Encrypted: i=1; AJvYcCXsZxBvjIWcYnPIM+3+cTFY8W87eZFHYpkAeVkhunZD65jk/Nleqa2ACYBsP8fEJ8RWcB3721SPc9daVlM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjZkrlJST6qs/oCGBWM+ahwwPjadchTPvYu7/OXbJrmetCyngB
	98VkvgF5gnv45+JGyRm78RMztjsr1ohfT5feTc/21skOnayoVjWI2jGo
X-Gm-Gg: ASbGncsRN+/M48Odh/85BQ2bvVc9qtCVZg6brehW3oIev7lav8Ouqt4j+7+Es2LcHSh
	c5bBq/LKcc0UVOn4iLYnwo45LBNkmJ7YFie1nyvELhPIYiBXpUTmagz0l9Nq+ouQGXC/SXfkp5p
	sxgVNEZ7VG6SpDpqaUQ8fGPn2CsafuAdav7jNo+Qi4tH9pTGgQL0OxffMUBFOXtv7TuGgupLQES
	4IqsiW21KzVisZOfenara/ekKTd8m8TOrRoaJ1S5QJ/EgpftakQqfcad/GrXf3vpvVbQDFDEGJX
	YbDFkQJ+SmOILtRqDpLurZjiEzSxFdZKFWH8dXxU5fAI5CJpeqJxwQjHgE0y8LjJamo/RoUwmOy
	ABBe5VC1sha3tdS3DaBHMm+tTgtrXHjB5
X-Google-Smtp-Source: AGHT+IHrlZuWLZF8EU4mdBEryzaojxXSQaEV+/9U9HehfZdfYG3EEBW/xI/YXxLD2sNk9njvPGHeBQ==
X-Received: by 2002:a17:902:fc4e:b0:240:469d:beb0 with SMTP id d9443c01a7336-242c21fc427mr228926965ad.31.1754931096947;
        Mon, 11 Aug 2025 09:51:36 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee49c7sm31908373a91.21.2025.08.11.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:51:36 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] powerpc: pci-ioda: use bitmap_alloc() in pnv_ioda_pick_m64_pe()
Date: Mon, 11 Aug 2025 12:51:27 -0400
Message-ID: <20250811165130.37552-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165130.37552-1-yury.norov@gmail.com>
References: <20250811165130.37552-1-yury.norov@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>

Use the dedicated bitmap_alloc() in pnv_ioda_pick_m64_pe() and drop
some housekeeping code.

Because pe_alloc is local, annotate it with __free() and get rid of
the explicit kfree() calls.

Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8ccf2c9b98a..e2b0132fb6a1 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -292,18 +292,16 @@ static void pnv_ioda_reserve_m64_pe(struct pci_bus *bus,
 
 static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 {
+	unsigned long *pe_alloc __free(bitmap) = NULL;
 	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *master_pe, *pe;
-	unsigned long size, *pe_alloc;
 	int i;
 
 	/* Root bus shouldn't use M64 */
 	if (pci_is_root_bus(bus))
 		return NULL;
 
-	/* Allocate bitmap */
-	size = ALIGN(phb->ioda.total_pe_num / 8, sizeof(unsigned long));
-	pe_alloc = kzalloc(size, GFP_KERNEL);
+	pe_alloc = bitmap_alloc(phb->ioda.total_pe_num, GFP_KERNEL);
 	if (!pe_alloc) {
 		pr_warn("%s: Out of memory !\n",
 			__func__);
@@ -319,7 +317,6 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 	 * pick M64 dependent PE#.
 	 */
 	if (bitmap_empty(pe_alloc, phb->ioda.total_pe_num)) {
-		kfree(pe_alloc);
 		return NULL;
 	}
 
@@ -345,7 +342,6 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 		}
 	}
 
-	kfree(pe_alloc);
 	return master_pe;
 }
 
-- 
2.43.0



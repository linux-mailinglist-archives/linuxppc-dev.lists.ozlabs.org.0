Return-Path: <linuxppc-dev+bounces-10816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A071B21292
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 18:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c10z26cbZz3dF0;
	Tue, 12 Aug 2025 02:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754931102;
	cv=none; b=nqcrKkuo661bJ7n+nZNLD4fENQVoO4/n72yeIi69a/gKQNsYkYzR84BbfSeDx5/GXNipDJI14KbM8E8ibUrKnQQZR/tgyKz2vb6j7TYEKrsunn7NcaxkFu2KroIh0lL5JUVmZQfCExWpf9KKY4Q5xQixH9xGDhopUSnRCvwOVhQ/aCoaB6ANsewgqdSFcMmaeZkYnpF4yQrpM8RSeKmoGai1QHrcfqZwQZ/SL1l1u4gfqAaHMJk+m3gHL9+Mr8o2wIkHUQmxMm9gd3nWrPxoX30kvGUpUEFCOTOCE4kfVbyUgTRD8VQep7Uk+zFJ7x7QoKR5+9lwmX9We/VzmrlFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754931102; c=relaxed/relaxed;
	bh=TpaBsV9SP95dUvhDAYzFMq9u9AsNNIRTwXToAnWSLqY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUR8BHm5s6Ph5S4S/hf4tgqqFbMRaFcb+q961FSr0YdR+dTyA+oTh2QmbWnogkA+sQMaGYFmfcmUCYOciACO8OIf88JHSSgpt4q1D9IR1YLk0ceJeBQUsO08HRe4nSv7m4F2zl1I6V7zJS+tzk1/9fwEdSAHEdpBWCdHRMXvtXtGpZxbgREgeDJw8TCleGWa2E3cjtXFhF3XCqa/PglECsuMiGKzV+N74V9O/vLyN3Ehm0QfwFlqK0XMysC/AxlxyYI5AYb9IIpqKlXzOvsdHJBgxP1VgkECgPLBLfi4oy8NVHEULuogITl8DvvR3DWMe7GKG1LUP8ezX83UzB40rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eZQhEr9A; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eZQhEr9A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c10z2238Tz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 02:51:42 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31f325c1bc1so4033237a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754931100; x=1755535900; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpaBsV9SP95dUvhDAYzFMq9u9AsNNIRTwXToAnWSLqY=;
        b=eZQhEr9ASvigJ9pHlPuOx03qAVQQfKxFcgdxuLutx6VjEP+2+qJLjTwHta+u8PeMI7
         jdxW8T35Bs4VXgqZI+2XmupKJpXdFY1eVXW/mvhMmNIoI/QcwIQIlYRpAx4YHx72NQM/
         5CASPfFt5HmMcHOotwwY9IpOcjKbLWdcwdSnzvCvb96eV9jPAXdUAUduGUUpi30RlGOC
         T3HekjtMf/yFNEb5pDLKMzVF6udZqPAIFVRU15bnI40pf2j/OhjAdRr0MXQ/dzB1pIr7
         Xpb1Ce+KFcYkCvk4DUfRigw5ivRKTOBYvyKaSDDHTTC5U+dkYf8ZXAgN4pE5dQOyaiC8
         MrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754931100; x=1755535900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpaBsV9SP95dUvhDAYzFMq9u9AsNNIRTwXToAnWSLqY=;
        b=NcxIkI3V8GA3lMEHNlLl1SfhRaIQdzMRFVX9pB77VM+4P2703ALKCeRY9OQuKILFtz
         biAzpOWjTRs3goIwq7wtaCj7aefTZdS+eqvuZx2xQp91l0XoL+4mR0T2tE25uRxICk2L
         rQm0kmrBRpGQNDMupjz9JkD1S071y0OG/n2O7GNCLvSqrKAj3hKRGxtmDYSoZAF+AdJs
         f14zTMjFjNXt08abuxRjM/teyWnQkLw3r+APG2vA6tMIl4oupvbR8u50JM7WMxgEpYSX
         CFdrGaImV3egvZXnRO4KZjo8AHAunyaS1IjGRwXM4la45+g1lOFOUkcC1ltmpCjCfT/l
         sbJw==
X-Forwarded-Encrypted: i=1; AJvYcCXKFxMQjLSrz7lYCjs8tAnGGhltkehC2//TgC3nivbHL2n994hJVPxntLWr/SHoH3pKaE4XdX6wfdeY0gk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMu6V5wDJ4GdYFYEIlalgLd6+CgKKgvDj+RRRr0jfPMTZXJAl5
	PkUDZajy8e5C7N98yCs8o23R7U91OHxVZWpXgpvEvam4/UGSu4UQ88NWgsuUyA==
X-Gm-Gg: ASbGncuDWMHxyfJIhKs/tQliOi02YTbP9Q7ZXedjBZpV59k/MZc+/HHKVq/Tl4f6jp+
	83GVpQdEjS9x8er1QUI5tIZzO897fw6LHMeTY02xHT+1EStoWAiy74hVtBkbbfetVo+SbJOGLVD
	VHe0AouYZtpyVAPMvfjZvRc3bOTGGGrC7jlYAh3mrViBSnGqPNDZk+sCPpTGLvbki5wMB6huEDr
	AocdaYr3jCtTLz04ZI7n3kF7mWb9tpXWCx2w3nnyFP/FM0C/mr10ZXevedBlTIeZcj/Ywx1P8ry
	GzxN5LfifqZbQZJN99XArsXXJUnz2Z0SPDYsrH+smffm2FJzraCGBbqGwvSdMLiYTsn1T/KU3Ia
	RgKoGBM09Syxq7VLgzfdKiIZZPepvJQKc
X-Google-Smtp-Source: AGHT+IEnMob+OASgMciN2iOwD3AQExjTZg0txKEu5PZg0AB3URB7DM8uN2lLQYYlMVfKbzDw45a7AA==
X-Received: by 2002:a17:90b:2fc8:b0:321:87fa:e206 with SMTP id 98e67ed59e1d1-32187fae455mr15484709a91.20.1754931100403;
        Mon, 11 Aug 2025 09:51:40 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da5719sm32201110a91.6.2025.08.11.09.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:51:39 -0700 (PDT)
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
Subject: [PATCH v2 2/2] powerpc: pci-ioda: Optimize pnv_ioda_pick_m64_pe()
Date: Mon, 11 Aug 2025 12:51:28 -0400
Message-ID: <20250811165130.37552-3-yury.norov@gmail.com>
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

bitmap_empty() in pnv_ioda_pick_m64_pe() is O(N) and useless because
the following find_next_bit() does the same work.

Drop it, and while there replace a while() loop with the dedicated
for_each_set_bit().

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index e2b0132fb6a1..325197ac19e5 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -295,7 +295,7 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 	unsigned long *pe_alloc __free(bitmap) = NULL;
 	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
 	struct pnv_ioda_pe *master_pe, *pe;
-	int i;
+	unsigned int i;
 
 	/* Root bus shouldn't use M64 */
 	if (pci_is_root_bus(bus))
@@ -311,23 +311,16 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 	/* Figure out reserved PE numbers by the PE */
 	pnv_ioda_reserve_m64_pe(bus, pe_alloc, all);
 
-	/*
-	 * the current bus might not own M64 window and that's all
-	 * contributed by its child buses. For the case, we needn't
-	 * pick M64 dependent PE#.
-	 */
-	if (bitmap_empty(pe_alloc, phb->ioda.total_pe_num)) {
-		return NULL;
-	}
-
 	/*
 	 * Figure out the master PE and put all slave PEs to master
 	 * PE's list to form compound PE.
+	 *
+	 * The current bus might not own M64 window and that's all
+	 * contributed by its child buses. For the case, we needn't
+	 * pick M64 dependent PE#.
 	 */
 	master_pe = NULL;
-	i = -1;
-	while ((i = find_next_bit(pe_alloc, phb->ioda.total_pe_num, i + 1)) <
-		phb->ioda.total_pe_num) {
+	for_each_set_bit(i, pe_alloc, phb->ioda.total_pe_num) {
 		pe = &phb->ioda.pe_array[i];
 
 		phb->ioda.m64_segmap[pe->pe_number] = pe->pe_number;
-- 
2.43.0



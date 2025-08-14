Return-Path: <linuxppc-dev+bounces-11035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51CB26F83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 21:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2vv12pLxz30Yb;
	Fri, 15 Aug 2025 05:09:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755198589;
	cv=none; b=bEz8SwrcnMWz4CFnUYsdN5JabwRWVrbk3AH9CncaUch1Q5myZ8nJMyl2CaNo/N3zzpbxA7r1bVovq4zeIeAV9iqy03dVKXO4C+F4LWVvkDZjc27LmWqWhbeKXhsKzeLN9IH3GZkVyCvneV3U+HiGpCnHB68Bpi7QqETC07V1vVBf8gQiRl+BFQKZONAlp2Qt5CwRmLKr7D3eTZGPcXppeeXMzVGlIKFv8j+r5KZLaXb2gYuehp3Bv7Ew9+4GiBd7ELb25vFK6hfjEdHETgI+ReCxehApkXSGjKY5qBeVaGhfI8uqd5+K42NLxfx1cyhs05LzfKbm6kEwhvNAFQrmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755198589; c=relaxed/relaxed;
	bh=IF8qj3lRR6EFkcmgoXgDdUEvoMakOzSl+hSokVwaKUI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPNJapd/+Nz5X0+0yWkwefPuYuwTNpn64abTM4SP2XAVNxwvgZGlDgynfSdv+Up94kEMvcXaGEpkXE5CK7skdp2q5FrlsZA14g+lVTaAy7fp/HFgujBtHwQITqAeLjkYuGHQUoGW02JYU+TTB/ndMBWbjh+70YsgX+mWMeZpV4MjCgRhAUrWbul3ZadUKr3ttP/mS4nuTQew0/lobCL+vScITus+zSVVjFjRm7Pcj24wyHEvdfZIFCW+djy/ea5gM1eqpj4AA5IwRijqngl0RA4hzDO4gxmBXipAL6j8CkK+zzIDoJVEvZHwVpW7EgClGuRZSh3tDUPba1SGEMqKWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RjMIqrxd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RjMIqrxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2vv0545Nz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 05:09:48 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76e2ea79219so1557966b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 12:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755198586; x=1755803386; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IF8qj3lRR6EFkcmgoXgDdUEvoMakOzSl+hSokVwaKUI=;
        b=RjMIqrxdEHQoLh/B1Q3CX0NPJmMfU6EkmTU075g5S7GnxNw+cyyjEQXL7CeCMFHaFk
         VvDb38EMXRLjN56BxRHEMTcWp42U8k/YKZw4GkKfe6SDq29X3UlU8NWluQBHfl6I61Bb
         haZDj4mpyyEITFyBGWqGbaTnQEwkOcYoz8zdcDvqVCHwGvY9Qi1E5Z6ru5vsND54pM3n
         f7b7EiWTs1WjM9Waj+8empEOxioMRXxnQ14GXFZzyhqP4QYpMSmqWd/hQPSW2+eMPQ2s
         xq8+Ctyv1EYNQfveIl/fD9JQ/lXBm3Tr13j3R6pMORfaZn29eAPvqfNrze6So4AUASJI
         Er+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198586; x=1755803386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IF8qj3lRR6EFkcmgoXgDdUEvoMakOzSl+hSokVwaKUI=;
        b=q9wzVLx5mbO9kX1GAUq/kQBOgp82xAPOLMwY6PbS57dhX8S24UG8s+G0eSaJK69tW1
         16INahvoCWHvO6k+Zy2bAp1KQu0WXZweGSamxch/l9i5BD3wpwEfPOTTc0Io9rPus6Vx
         DKpdie2VSL5TSSKxqQerCyzRAh9khjLE56qqMpWKB9YX6x9GQFPkrQyxQieafIUk8w5P
         z+MhJUobZSHzYqFPWiiEGfDs6KIR+HGzT32ca1rsTOt9x8I9KtCzJbBSZ68GNN80XpLT
         77q4mf9bWMP3sw6Plz/vhpKn6oLw3ceG6nbVyjqvBfDM2kOKNkxQpXVIToSoV7J6+yby
         Nl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvO0gx2TFZWOtZKhhRXnS5gB4E8Jn7XQkp4pxByvL+AX1ZPGguTZ/W5f0pCa2bjeE9PX1nDgbyYg6V/2E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxrlb85RaZQFurjvJ2dw28OASHrA8KsjswQNs1K3yB11xmM55Ln
	+Uwf29dDw/vwsfQOPtuNchXZbZUIkV1+SvUFhR/Cfa2sIo9ojkMdxZ2n
X-Gm-Gg: ASbGncugjHQ3vHNLLodwUgTwVCn93mFSeUH/ax7OrBmF3EoRwF39DIdjsfcMT7lUUTM
	imNRPWg8ZgfLB8pET2asVlp4Fx7qYLOEqz67CUop7WQMcu+w4ueisabQxgA6BkI7Jz3J7Klmt8Z
	QPE+S+Rs6chyY1sIcwJDCOJ6BM2ccnhiTf9Yyhd0/AWwvUBYf98XqR8jpCiNM/WEd7ruuwWE7eF
	1UGTle+pZNcpvg9pqJ3nXgygiHcTlfHoNrx3oozxLSldund9RFm/Vu3du1dCkcW9i7h48BMSL+a
	a6Cy6m9J1FXIuveHCk1u7vLJ4tCRBoF8XcP/B9eEyMU8mXBUjk+5uk6Z0jJ08U0PV15sGSASqjm
	asSBhMSzfB0OfTM6+Fll2lw==
X-Google-Smtp-Source: AGHT+IHO9E6Ju6YUC/4W76OL34pJ6YJlwPdxgruOXLM17Ydpcq6OMMHw8A2vXRvcEHPm1CQnzcq1PQ==
X-Received: by 2002:a05:6a20:5491:b0:240:104c:8e14 with SMTP id adf61e73a8af0-240bd285526mr7187108637.38.1755198586198;
        Thu, 14 Aug 2025 12:09:46 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm35345257b3a.102.2025.08.14.12.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 12:09:45 -0700 (PDT)
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
Subject: [PATCH v3 2/2] powerpc: pci-ioda: Optimize pnv_ioda_pick_m64_pe()
Date: Thu, 14 Aug 2025 15:09:36 -0400
Message-ID: <20250814190936.381346-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814190936.381346-1-yury.norov@gmail.com>
References: <20250814190936.381346-1-yury.norov@gmail.com>
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

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2a4b916205c1..23b1db3f15a9 100644
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



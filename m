Return-Path: <linuxppc-dev+bounces-11033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE281B26F80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 21:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2vty5mndz3bTf;
	Fri, 15 Aug 2025 05:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755198586;
	cv=none; b=PJjnYMgNcryl78AQtPiSvmRGha49N0RLDUx0v1uGDxjXSG9HcN7HYl2JwSB/vPk0p1M9RktJoOL2PaOL0DMM6CVumowYStbUlTW6mFDPzallPah4IfUl8VyLw2wVwwWoAQV4+KJEhL8e22yX5lEdYlL6St8eIhr9qj+IZvrp4NhhmZQvhUnIJX1i1FaNOtT9LVpEbZybNGa+BOEx2QgL7EBS914jL0qD2kl1HKkWZQONLzkVfC+Bd7ZRnP1cis+WIVpKdy+YBB326GAjzZ3QmLZ/l341XhSntT29akjmbustcP6NLNH52MJIF2W2Befcp/alo77hNONdUSSR1HBpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755198586; c=relaxed/relaxed;
	bh=+UJlJ9+DjZd2THGL3J+lidGXBes5gAiTYGr+fy//EDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwFnkn5T6KuOpKTIXJyZWDEv/FQA9BPunh4StQHn9uwFyVvO3WaFHmHsWOvYeHOs3b9RQugAtpvDp2W0kgXLT14S/Qlq0wCDHh+MoYr1KVfQbYTPBg6GNaX6luweMh4eGMyQsVLgtpABO+RQXlE19jGBi0m8JDJLoAGRVvy/MU7OQ3V5e0o/gbMFX0bx+vZnS7jS4JhGunSZ/SSztcK1n8WOx74D581d0QF4P19c7QQYsxHlsYNB2YeDiNPPa5JFPoiyqGFY6RkhbRLlT9I+ooR5464RjkNloYZJX03nkOloqZbUNrJALM4j43PuP6dRmOjz7ccfqLKHZEKErQyVRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IV75Ltzo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IV75Ltzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2vtx5XM6z30Yb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 05:09:45 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b4716f46a2eso893987a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 12:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755198583; x=1755803383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UJlJ9+DjZd2THGL3J+lidGXBes5gAiTYGr+fy//EDg=;
        b=IV75Ltzo57lMUPFXPvryTYEEzGZfgdj/XO97e//er6QO0NyYQqSnwFgMf8pOpa/kI+
         IRpbjB7glmKd6XkgzcQmqi7+Apg03KBnCdNvcX3PMGt6DcZfaLaHW3qE1DA0Bh/jaTMZ
         JK/MLHjtQfSDySCkGm1p1nSrUitlenIjjxTDA4QlwiXojIMNfr/5M92bVpaAfGeQ+QeM
         IxWePx28409rm/23Guv73zfBswSCV8RN0Pi0ybMrei6rFXAsF24SjzzOB3MF2OSWnUrW
         6bgQFBKPw1McJq8Ns4q9S56ea3I1bZs9pz2uSzVR8cfzhvD1LnZCWUqZcz+oAiLn7UdL
         72WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198583; x=1755803383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UJlJ9+DjZd2THGL3J+lidGXBes5gAiTYGr+fy//EDg=;
        b=wC0gy8Z3ZCy0AM34yeVDxPNJ4haNhfLzi3U8dMIr7X9aMiBCWADvwbAGV8mQrLkxuf
         uUkNLAlKMJqe5sapP1DfkK+HSZ4yx86qqueoFAFGsFvwf2Gt0uXAzylPMXjgEvfpJZUI
         io68ndLSSWgbzvRkKRTA3AY/sI8HsSc95BYUzpgydmqFA7B/ThR+YF+WUu0v1VbUBpz5
         ZIaEZBOCOo/C5PaYVcgrBsqQFjHjLIkmRW7aGYSWTwG2ODf5vw9tIXzOdwVTJexObAtE
         KQOP4hTmNsudrXUz6aFMZL2MoEG5qVc+UnajToijCkyxmjpAiZvfwvgLTGPpecbQAtO8
         n+PA==
X-Forwarded-Encrypted: i=1; AJvYcCVC2Qr1l1bVkpYu5HiJCr6hvTTzdLlpzS+9qUH/QKplxbqsX713Zf7WcjNawrfxMs7XAK0iG8A8i/QVzfc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzbie0TbDqq70ROqgfBD4oSyXST+htcHq425oBZqzEQW1+aFkcM
	VzAM34Chzc/diMgEd2qNsFIKjEn+zn0ir1ryn+TikCPcRwxDC2kqKs+OV0zd3A==
X-Gm-Gg: ASbGncufldAmk87r3Uz5qF6aAXb2z9qA4CdZV4/44Y5bzDoh+zn/Es7K4DD/mjs45IM
	U65TVXyO3BL308x9VpFk0ZGWl6t7yujQTYykYbomWdNL1ZStMtYb+9DQVSkIJ+rSOE9Dr8mF0OW
	z/RpJBQ+rf27y169mkhN0H+T73BNEhAT4euQ+qL8bwuXL0GsAyNNcF0nG8yuLXOAMEpBfwJ86ZC
	6tJoNjQ/TAdG+1WztuCVGcB4BK+vmmq7XoQ6HS7jRPbO8j2SSjbKK3iR0+k7XNaVTp5TfbUI2Jx
	qOXZWs77WSkf773KsoVcKNz7cUiMDlAqW1S3sLfJbtmD5m11NdOFNFTr3BZJWvNChg9nfwzAvQl
	os1aahJnRuirHGz+CvAx8Qg==
X-Google-Smtp-Source: AGHT+IFFwZv1c1ZK8S3HgX4X3suV9YEHMQS8EnvLEjc+VXrDDUDebFYY3z9RLaiGqd94M4QhyksWTw==
X-Received: by 2002:a17:90b:3c86:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-3233d09ce8fmr24505a91.4.1755198583280;
        Thu, 14 Aug 2025 12:09:43 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330f8329asm2637497a91.3.2025.08.14.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 12:09:42 -0700 (PDT)
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
Subject: [PATCH v3 1/2] powerpc: pci-ioda: use bitmap_alloc() in pnv_ioda_pick_m64_pe()
Date: Thu, 14 Aug 2025 15:09:35 -0400
Message-ID: <20250814190936.381346-2-yury.norov@gmail.com>
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
index d8ccf2c9b98a..2a4b916205c1 100644
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
+	pe_alloc = bitmap_zalloc(phb->ioda.total_pe_num, GFP_KERNEL);
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



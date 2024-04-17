Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F298A870F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 17:08:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MfAAgOn/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKPS91nW1z3cNV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 01:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MfAAgOn/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKPRM1YYGz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 01:07:57 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e2c725e234so7544855ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713366473; x=1713971273; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E8toELjbePcynrZgXbGiqJbhoBQkJBRXLW63ZdNTbTo=;
        b=MfAAgOn/H7nO2PFGOOhBmn+yc8EDbAawu95Pl0KhlnCzJ9QWwgted6FE1jmA6Sq9ar
         a8lWXDe7SzD5KLPhbVs+pHlnjCxyuSY/jBBNnl2aKPd/FrAmobFhF2NZVPqkaImSNsoT
         s7IVHEdaifnAC6TQb3FgQZFv8uoVfcmAeBxo1wnXhIX3cNjvpyRc6FRUt4OniZy0ZHoo
         7Agrlq2BWyNTc0yzweCl0MiOXZsOGe8uoQFR0jrTsj6rNGD8XKNLrFqRF5XNCIINsOVC
         88aEG9X+46q1e0ztXAFdfqeOuvO6zgM8tWowx/ECo68Rp26IrqbqfhfxaJEx0kVAEeIc
         J+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713366473; x=1713971273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8toELjbePcynrZgXbGiqJbhoBQkJBRXLW63ZdNTbTo=;
        b=OztciBC5M3gjgtSWtkHqqxaWv3cY3Wq9ontrSVZ998NPuFPGGOcFmSmCbOA/OrYuL2
         4N0lE6DoxFI7bDTSzgWY90x+vjxAWw5alfsqIdLe5Y+G+2c2MjIn7scZtRy+Dh62EbVz
         GEeIOrtWoVRKFJvDJmm7z38IzU76jUq3Kx4thsrB/y5qrPT1rOgA3twUHKMCYHmvAilr
         v3q1griRGIknNNeXGL7So6sOaEy60LJ9agMxbFKefIJ09ernFcUtU18lyx3iDL//nSc6
         uuZTyPx0TlPoHkXD4+wmbJTGnMf7vIHUHJwO+yxNmFF5yvRKa15a3mnQdHIA0l3xnhgA
         0Pig==
X-Gm-Message-State: AOJu0YxBB+mLXudKhRfFnAY38BTdZ205RJR/OPf1PzP16JZGuAU0VLx9
	qg6xEmwOB8bUw4u/KL3aO6j7UK7fPzgQy3H0gVuAdv4cCJ8dEXgSydfFDQ==
X-Google-Smtp-Source: AGHT+IHvaaxCDBcuJaaeoudiupeuwCfHvjA0KZZsa3KrBPvqyKol1CcyNV3Xb1LT4xBC4IdNvFSXEg==
X-Received: by 2002:a17:902:d5d6:b0:1e4:3c7f:c179 with SMTP id g22-20020a170902d5d600b001e43c7fc179mr6910568plh.12.1713366473226;
        Wed, 17 Apr 2024 08:07:53 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.153])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709028d8900b001e431fb1336sm11666375plo.31.2024.04.17.08.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 08:07:52 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/ptdump: Fix walk_vmemmap to also print first vmemmap entry
Date: Wed, 17 Apr 2024 20:37:40 +0530
Message-ID: <a19ee3dc2b304d39da364a592d5cd167449f8c4a.1713365940.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.44.0
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
Cc: nathanl@linux.ibm.com, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, npiggin@gmail.com, donettom@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

walk_vmemmap() was skipping the first vmemmap entry pointed by
vmemmap_list pointer itself. This patch fixes that.

With this we should see the vmemmap entry at 0xc00c000000000000 for hash
which wasn't getting printed on doing

"cat /sys/kernel/debug/kernel_hash_pagetable"

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index 9a601587836b..a6baa6166d94 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -491,7 +491,7 @@ static void walk_vmemmap(struct pg_state *st)
 	 * Traverse the vmemmaped memory and dump pages that are in the hash
 	 * pagetable.
 	 */
-	while (ptr->list) {
+	while (ptr) {
 		hpte_find(st, ptr->virt_addr, mmu_vmemmap_psize);
 		ptr = ptr->list;
 	}
--
2.44.0


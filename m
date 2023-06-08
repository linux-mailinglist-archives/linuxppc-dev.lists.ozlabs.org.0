Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D44727C10
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 11:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcKSY402gz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 19:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHgGOkdM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=colin.i.king@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CHgGOkdM;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcKRj1lPvz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 19:58:55 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30c4c1fd511so416575f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686218331; x=1688810331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YlNe4BUkEg1VajwhQoFVrqBpA5/M9bmxOxMvTziERXM=;
        b=CHgGOkdMkON3E5JAKd2QN6ViPGseP5oGhADmE+HYpyeffAvoy6Muo/jJCSRgGv1I7d
         XyZOwJF11dqKYGhTmSyYFuGOciv9teDQmWdwXxKEgJjUX6MIuEHzNm+RcF/Yn4qTqFpb
         K4mt+7h24tWTOFP2nlbevHmvRaTvtdyrmp//Wi/2BDahsMSogZ1WwuL9ycF+8JKnFfbV
         x8PuB7Qt7lZDZ1a+kzC7B+ksdshKcYM2KF+rJjlln+Ela62lnJX441dmuUPd/tmdhRXy
         TmsqAWvc35OOnOL2XuPH9WTf3uDbxb8ol+5Hb47nPSG3KaV9CIW3ZwQlsvy+XMcIHYoX
         KFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686218331; x=1688810331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlNe4BUkEg1VajwhQoFVrqBpA5/M9bmxOxMvTziERXM=;
        b=afOsN/SImwogW7JDZuzpxMz+5F4NogFLwWiArpyLedZqn7IA2YR4KTCiObGcffIfJe
         R/jjN3xHrk2fGzupfO7Za+4WBcpwymXoN5nib38/yPQ8sdMdZzs1MkGIkZ+h3Sy1trkb
         SaPsZ8Aoz9mAc/oTmi3bzd6WrEFfLKVbQw76Cge9JgB/CRTKOgwMgjNGV33+NSxZpf8J
         gEDyaCqRjVdOVVb0JxZO3n/lPG0D/5kCIZZnMEotpz9Z2ikKncreBeD/5wOGvL/sPoKP
         G2+QvLx2ulWe3+CCu0K3FNoal9yFQ6J10w2KU8iJZmEOAL18MzFKHXGRqr8iKLciW03y
         W/lg==
X-Gm-Message-State: AC+VfDw0Yk6f67W0Fg1KpUcI2GvYR/Y63A/WPwg0yvYfOsV3SEDvVaMz
	Qi7YyTslSZsipiQdtzUZEvI=
X-Google-Smtp-Source: ACHHUZ4bwjDbYedllIN1larsf4jSAU4BoOl6EnSlCIw2Dmt/YKIRFssvTbWtdQSg+qKIlIAdWC/90A==
X-Received: by 2002:adf:e78d:0:b0:309:1532:87e with SMTP id n13-20020adfe78d000000b003091532087emr10078608wrm.31.1686218330725;
        Thu, 08 Jun 2023 02:58:50 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id a4-20020adffac4000000b00307c46f4f08sm1091924wrs.79.2023.06.08.02.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:58:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH][next] powerpc/powernv/sriov: perform null check on iov before dereferencing iov
Date: Thu,  8 Jun 2023 10:58:49 +0100
Message-Id: <20230608095849.1147969-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently pointer iov is being dereferenced before the null check of iov
which can lead to null pointer dereference errors. Fix this by moving the
iov null check before the dereferencing.

Detected using cppcheck static analysis:
linux/arch/powerpc/platforms/powernv/pci-sriov.c:597:12: warning: Either
the condition '!iov' is redundant or there is possible null pointer
dereference: iov. [nullPointerRedundantCheck]
 num_vfs = iov->num_vfs;
           ^

Fixes: 052da31d45fc ("powerpc/powernv/sriov: De-indent setup and teardown")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 7195133b26bb..42e1f045199f 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -594,11 +594,10 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
 	struct pnv_iov_data   *iov;
 
 	iov = pnv_iov_get(pdev);
-	num_vfs = iov->num_vfs;
-	base_pe = iov->vf_pe_arr[0].pe_number;
-
 	if (WARN_ON(!iov))
 		return;
+	num_vfs = iov->num_vfs;
+	base_pe = iov->vf_pe_arr[0].pe_number;
 
 	/* Release VF PEs */
 	pnv_ioda_release_vf_PE(pdev);
-- 
2.30.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935A267BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 18:11:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458Hgp3hbyzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 02:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="qVKEKI0j"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458HfB1NBKzDq9W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 02:10:05 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id p18so1853389qkk.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUUEDLWsi2MHHuyozS2c80A815aR1j2jtUYcHsaUwqw=;
 b=qVKEKI0jwdFX7l25/Vs53mFELv4NnklG6enWTsqv3YrfJ4DYmflKWe2oZdCW88LP4q
 9tBP+zieRZ8hjlthpUlBmuk2LQuZBSEhNi7xBM3OcIzq6c4nAjodP36q61MzVCci/oFN
 nhqLm0/usBT+OxNRTKV3RizsSBhEPdVwg/p8ujcd1gnmq9Nc+/RoDP6aaQX7i6gew09c
 Ka3KcUr7V/0pcL2k82suNNlQg+h7l8EDMfSoTXm6sxjiP9UV0GvhEVcHs/EWQnFpa8zL
 K70jOjS4cSXjht+BxM5SxefaKElso42VN9rIlRQg6f2LDPgzH8zdi5BG/05EuD3/+bab
 wpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HUUEDLWsi2MHHuyozS2c80A815aR1j2jtUYcHsaUwqw=;
 b=oPJjHz8OSSLNzjFSH0tCRRX1KGv7NKLBBHl/SXjNzpXdAiDarFmru29eO+4I2w1DKa
 BjG28159IpGarAa6usHFBzHBK0txVuQqi9olYLXYWJlxjzy5D+Xvay605PV3k5wjWQ2V
 FzM1OvyFoDu1/T1YyzxJ0rl+BYPvZ3b4wgUtpHvlL+Ggb056RJFZyqUhhGM1mgaGGoai
 P/3B5Nj6EJgZrwK0DgQ3/NvKl+PhV/o9BzVM5Nf67dc84170B5IHkewxBCCV9Oj0GuBx
 EeucmmSQLJqwTgvHCl+ekiy0Jwh+ReqXku6S/xab6d/oeLPFHagNR4zy+nyNNytd7YUz
 3AKQ==
X-Gm-Message-State: APjAAAWGOYK8MuzmymuDKJro3d+Rx0rJr+SgDRrlfbYtpFX0nXDl4cfo
 BfqZjbRnnMBSknX9bDJMd5dJbg==
X-Google-Smtp-Source: APXvYqz+KTVZkkrXq4HFkHrw6rYCj9TIrV16qTi2Kq+lg5ApDMamEoVdtLJqtAhJ41fYwlPosq2W2A==
X-Received: by 2002:a05:620a:1670:: with SMTP id
 d16mr2448898qko.288.1558541402697; 
 Wed, 22 May 2019 09:10:02 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id j5sm11446226qtb.30.2019.05.22.09.10.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:10:02 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: benh@kernel.crashing.org,
	paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/powernv: fix a W=1 compilation warning
Date: Wed, 22 May 2019 12:09:29 -0400
Message-Id: <1558541369-8263-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: aik@ozlabs.ru, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit b575c731fe58 ("powerpc/powernv/npu: Add set/unset window
helpers") called pnv_npu_set_window() in a void function
pnv_npu_dma_set_32(), but the return code from pnv_npu_set_window() has
no use there as all the error logging happen in pnv_npu_set_window(),
so just remove the unused variable to avoid a compilation warning,

arch/powerpc/platforms/powernv/npu-dma.c: In function
'pnv_npu_dma_set_32':
arch/powerpc/platforms/powernv/npu-dma.c:198:10: warning: variable ‘rc’
set but not used [-Wunused-but-set-variable]

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 495550432f3d..035208ed591f 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -195,7 +195,6 @@ static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
 {
 	struct pci_dev *gpdev;
 	struct pnv_ioda_pe *gpe;
-	int64_t rc;
 
 	/*
 	 * Find the assoicated PCI devices and get the dma window
@@ -208,8 +207,8 @@ static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
 	if (!gpe)
 		return;
 
-	rc = pnv_npu_set_window(&npe->table_group, 0,
-			gpe->table_group.tables[0]);
+	pnv_npu_set_window(&npe->table_group, 0,
+			   gpe->table_group.tables[0]);
 
 	/*
 	 * NVLink devices use the same TCE table configuration as
-- 
1.8.3.1


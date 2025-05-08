Return-Path: <linuxppc-dev+bounces-8430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1577AAF456
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNZT3g26z2xKd;
	Thu,  8 May 2025 17:10:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688241;
	cv=none; b=NZ3jAijOYWpHjfJTAbTe/Y4fP1GLH8/VpGHpjWfuO5eOHckrRCYWttDUh1U43rgFYdvUiFUyJHjfYq10hpR3eStTI7IumkH4vdKcAVTZkbU0yDA6eNkYXf2g0GpWLw5tiHdXv6cYQFQqBCHRrl3g1PIBkjoFW05pf6iFwBF1ORzpZ8la5U6Bek+k12ZvznIpmoNG3kEAvWPLgR4huu33BI9NgbcDRxwYPVKyNR7MUjH0tOdc9vw3T2OLrQuupkVWgbAHHp/oa5F47gQ+Eqfr2SbdgLoa+x5PPwb92Jnp5kpBBeR3KposWG94lScGXv8X1mkWs61fNTx/jfA/J1hHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688241; c=relaxed/relaxed;
	bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQdiF46k8a2p459/NXt+QZEi2n3rGo0/ToWeQ0InsGEHmQKCcSmbpETUNH3lwCLiJzfZ6l6f60A6vWRwgnYDbYVHodCDvMMU0FvBH/uuXR/u7tFj38PIbD7c7FF7CT9gjEjqehTl9TfQUvvG5EWFwknqKr+B+tcBO7CYSxNUn3YR5CkdscycgWRAUq9ffY/2MmRLQnGlCpit+sISr1S5/3e+uQZrYpGMfA3VFMuO/8Op/pEYyEF0f/YGgaGNOJ1S335//nYvNhLseAof3/Ng1m6ZFzPFBp4rza1K0LGuhb5xSAfG23wQd+zDQBUzPBhZkhBsPIxK6VAnWEV9fuDtAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PVrT/5Di; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PVrT/5Di;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNZR6lcsz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:10:39 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so6667035e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688236; x=1747293036; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=PVrT/5DiBPk1igOJEknIG6tuRHjZh1enU/a0SDzkZ76+opBL//c1VCTDNfVoNOoA3x
         RDlr/jhFvnu5j9hKSny0xAulxbonI7O18phSeZ79G1xW1eaDgQe5bwVSXPFP0wjVWYts
         BihPFtlN6TX65s8L8BpOT82f7Q8OWY2DSuKAAfuNgmAAVOIrftRsWHrjvPlhnLTnY0hR
         IiMXcrgZXMnjnLUy7DSjRVQWGNSZi6ResXC2zcj+Cwh0grBf/zU3Fz2rmHx8FSNmhx/g
         0H1wyp8dFHcmrqEJ7PbNItIw1fiClU96XzB1Uj42KZrE1JIk1YkBywQBBwZuYfggB4kY
         OdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688236; x=1747293036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=m45madX6Hyd7vl8qn6Yi+59uSJDXibnQXMJWRswL1Dfik4k+BbkbeOX/Nm35eH15XG
         vrNWY8kQHbtsOmGKC9hl89Xg+KUcXIW43DtC8AQVfU3GCnG3/71Xonkfnge1I2Fps6r5
         pE8nlma2MWnIlJKKlkSZKcPQDFbB2OFa+4kuw7JTOWb8gXmDl96Kbq6idZSusdb+edNf
         1Sz5q2f2hJh3boFRmZ2WJ5Mdhh7YAsjFrwFqQtSJaP8u2q4fIP0K8fA8FHWpVoLHr9yP
         re3fyQ9eMWuXOkHOj8tfB9TFWVFkc+yqcHWDTeT+rx3l82rPN3uP4CYO+oPSosg64LJs
         /D0A==
X-Forwarded-Encrypted: i=1; AJvYcCUzzzKDwwPHNFi6X6al98UWQT13Ktaw3hU7Ys8TvZhbceI0sCNCMGUELptSnQCmapYRwFl65Q/wiDHJ4o8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxObHMcspAeyhbeycPcKN8kvBpp/oUTa5tPkJy2Cr1P1rL3FXZu
	KLlHB/5Dzm7eD4Shwm5Xm7lwelForhFs+i0LQ314+sJksN10qMzh3RIeczzY3Q==
X-Gm-Gg: ASbGnctxFWxwPZcVViPiH8x8PaAGBkwck0BwnsQCsrbU5aTM577T248Oyf+e0pX5FZA
	O36TyGzsP9r/6zFvA5YBx271eO5do8pCg+06gerBf+2VbzDzNOqcanVNPAVO5OEqTnyosLzomr7
	xuLpQIYs+gxSlrbw31HOxmth5ygrlkA8JpMIIoU2ZCRxxw1nf2pzJ+abpOglxyjxZn/0khN29zH
	oRoNeaZe8x+f5QsNTV4RWFw/CnmM7bXKgu6lg3WwrrvfOq+nLsDHmdQlcZEvSouGVFLWyj7ftbh
	kmZVHGLHkoep1r27xPSZvCYfnd5MxD4lIuj79b8/07i0FrU3KpCl4m+SsSOabh8r3Rbijjil8Ce
	YKypFMeL2Yhf0qWMurKxdNp8oROY=
X-Google-Smtp-Source: AGHT+IGM/ocJYvn2QOjf3fD6bkcOlBGcdKqEyGGwPgr1OkqArjdUzcdfSklA7LLxbWYmBJNriXe76Q==
X-Received: by 2002:a05:600c:37cd:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d034bcbamr21959325e9.31.1746688236376;
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:30 +0530
Subject: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp3+Y0C7nYToqJfWiLXSkKAM5YKgVxrQcgv
 dew07ahS2+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9bheB/9ACtGdPZ3LmfihI48+MK1ALP0+Bx6+UetxxXKaahBYzIQ5gDCkxVfgOgnxWWQewlNuhzp
 LkZw3nCIYvdYAZ7/RT6FkDdBk4lRXh8t4QhrVlil8KmoN8umYdxyDDZutpu8RDRf9b5H84xabGV
 tt9QfWQz9sKtIRWtac2DBCJCM4vwuvtSDxEUlUvJkdec5PwCN8ffMmJBN3NQ+vSvJtmkY8CKX8o
 ZT1VVrEU3tuPcd3IaetbkOs7WBG2+W8B9TJkzU8p+4MnsQUmp41iy5Y6yO6mf3fDQ643DyRvmm+
 9X9+lTcKXgUsmH6hLBn6yhdJdN2ABj8XC+7vLejHvCUqYl4/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A PCI device is just another peripheral in a system. So failure to
recover it, must not result in a kernel panic. So remove the TODO which
is quite misleading.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
 	pci_info(bridge, "device recovery failed\n");
 
 	return status;

-- 
2.43.0



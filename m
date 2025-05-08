Return-Path: <linuxppc-dev+bounces-8431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33EAAF45C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNZV3MXPz2xBb;
	Thu,  8 May 2025 17:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688242;
	cv=none; b=FDf33E7XZOarNen7TYrOeMkjSx3xscoELDBOpN7SF5zVTPul1oyubV5l2SRL5DbrsH4LbpUsDs9ea2rn5FtKWuY6PitY/FQqQq/QA9PKLgFewsB600s6cE+WTYc/sroprZNgTP7v6STW3S10ZAsq/ap1FRfHEB0qBn5/6FISNzQwLwSXljgggTE929vTblOVXtBE8e+o/1Ii3hKneIFq4Ul7r9z2GlMOIpb0vWz/46jH19E4soJ7iPUyFsX77E7jEJX930peRBNXZXNL36zBOHL3hnacjpdeqpAHn0aC4ry2Ss6fdwqSpRv5S3M7Q1O+4APjuZr+t8qg7njWpjnzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688242; c=relaxed/relaxed;
	bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTi/6k8htiuSUwMCQjr/Vqqun39IC/cIjMoGpjXcIx0ud3oH0319WL//0LRiIk23foEFbqn1sNXF5zMVEBAIiqggREYzVrLPvJE2Ad57pFc0LpfIwGvPE9dnC29FfJEAMFw8bOcPLm+xby9YmrgVDoXj0ZuQLDdPkurmg15Or81731rfSJdNfmDC1n2sBUTpZWVCK+rsvD4yQupQwFD+yllwJweFrqfprVXtBF47mSKJd2KRga0F9u6u4UlNwr21UaVoHDeF7iJRcAe5Wqys2vkIpcKj5cFZvpCR3bOzq62nKT5Zn/nxIIfUE4AqU2EI1PF5TQBNUza9JQbOCiPBMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sIFaeDX+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sIFaeDX+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNZS2hXlz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:10:40 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so7315605e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688237; x=1747293037; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=sIFaeDX+BYbOxveGq3LVfxZX/br/tFHeVs/N4gq0QNgz+YpoR+XvuZctnGJTXfoToN
         F+XEpKbRBzb/bI3ibEcq96S1IIUawGp3w9aj9v/0cRRIV0IDyrzK5yE5ULpfWGUO+PpN
         xqDV18eVBTG1/fIXoUNO/3voKhc9qNeujgOl1MGy+qE8bM12Qk4QnlZn+RcZox2X6rux
         nL2PY1Uwbex1QGDqnh1sFKXv5Qnfacz4pyrE5u/3i+n84sjFZIdn8Fze6/hVB2Nlu9cP
         f74rzoHkfSKaU0t6tyjwjSOoZWHlbR7muMJTK9d9IFsEG4UlOSDQPJ51eb4YFBELKqym
         YHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688237; x=1747293037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2xdDt4RdWfJikzYadK7Wm2Dj/LeNHY+o4TedGbXhPE=;
        b=q8sOJXoEqszTZeUjDm03C5ZisOwyQTlkSt1c0LN7TYnJWx6gwyl3Hbg0tCuQKqbZvH
         OC4ZeRRxU+VMNc93nsMEXY//tjZiAmzHzCe0qj7FjUePjTLdWrfETimIeJ5ZsYgMcfW0
         TOkwwbjzGLXGDtDoqoLUJlnTbkKFAa1e6v3cwDEd3n73oJpWOeLoOyzUHRwp74268aT2
         s9Tgb6U5QzxfoBRSprReCkz4SBsAFDku4ZYKpQfesaU6cPzELgjU/W8ypjeqeuj5yhba
         K8WlS8L8cXBQiEFyQz7Jrt7Pi1W66N+bcT7GBejYKhICNaqGXw9Guo1FxfjC4OnvPo54
         Lovg==
X-Forwarded-Encrypted: i=1; AJvYcCVcDRpbglOGUunGY2OMcBPwWA3/zfmlTasgCT2d37Xmxrrtrl2NNcSDLxvnWfIYGxqBEEVvdhhiDsMTgzI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxT0vVvyxPAFACjB1y4zZU0aGE3o4TVED00KJUotXRJT9rPc1/r
	Gh7t1mG6uLVT+K6zIq1167vMIAUnl52JvjftTa3TTdsJp8Hr++o8jDabQpSaEw==
X-Gm-Gg: ASbGncvX7sF7fhgJaXGG8JGj3qFHiqjGWePKMsjmTJhhHu8iR3fMVh1j2uPp8mZ8ike
	3Zm8S119Gkex8m3Abe8r0LzXxLaC79nAGsCJRchyfuCNBLqzpfhS3DoPLbOkAotErgR8FD7JO/r
	PkahpcjeOP0UdQ18+4/JVK0L6q3sGJEiJifxff3OI9umRJ8Isb/tqDRbRu8Q5Z5aTguQaxPkW7W
	bzNiTdYpc8TavJHXT5jjADoGCmU2ep91aNCr2Nq81sjTD26PS45gCOm7F/mY77RM6fELVrIBKSq
	AVPayMU5yaDXycghKZR2jNUvWGpy3ZYanTa6tUPLIRLUfFUXfIYe06+AQne/ZoEdji+JSLb2QUP
	QoPNnbyP6b5UpG4oUsX12muGZgdWoPVHQSEJinQ==
X-Google-Smtp-Source: AGHT+IFU6Tfiix8kiA6qL1KyPENFK6H5A0dQpfBujyLXJD3m07n9Que2XUBEh0Jtu1ubwVrnoTFrSw==
X-Received: by 2002:a05:600c:3d9b:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-442d02f421emr16664105e9.18.1746688237328;
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:31 +0530
Subject: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
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
Message-Id: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2766;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DxjgbttCz+WbWbTBQh3uh5PZxc6tk82mAeHt4QTMKaE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjpfv/vQkWgyV/Hq0GucliJi+U/7FE1Skrvp
 pJ+nrHeneGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9UI+CACk0xFNBFRLakdLLAf9Ya1C7nW/+a/VQ4SxfviZzgiZSwQ3wAKQ1nn3pFJTctodOrYHrYt
 L3jspau7qSV/E69KaX8cHFBStVMmk8Ey9z4rzTqwgNJTiZu1osrkc0SiKydSeqMot1pRreGsKhv
 w6jmJPaJL6AL5/Wc44rKPtCqMktlSapMC4oZdAwUzr+ZolkNNdqp3Ptf12CclgABbIy0YDvrotC
 GnquyUFgI1V0jIOUvvcsv/n1eLtFUktxnxLDS83usEfAJ1WpRavyboLRCrmQ1K00Gvk58fZaWkN
 /w9ORtH6GykTqjVpzegZfHZz6+OjWKawa8B4PrmHhI29wJoR
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some host bridge devices require resetting the slots in a platform specific
way to recover them from error conditions such as Fatal AER errors, Link
Down etc... So introduce pci_host_bridge::reset_slot callback and call it
from pcibios_reset_secondary_bus() if available.

The 'reset_slot' callback is responsible for resetting the given slot
referenced by the 'pci_dev' pointer in a platform specific way and bring it
back to the working state if possible. If any error occurs during the slot
reset operation, relevant errno should be returned.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pci.c      | 12 ++++++++++++
 drivers/pci/pcie/err.c |  5 -----
 include/linux/pci.h    |  1 +
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
 
 void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	int ret;
+
+	if (host->reset_slot) {
+		ret = host->reset_slot(host, dev);
+		if (ret)
+			pci_err(dev, "failed to reset slot: %d\n", ret);
+
+		return;
+	}
+
 	pci_reset_secondary_bus(dev);
+
 }
 
 /**
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-		/*
-		 * TODO: Should call platform-specific
-		 * functions to reset slot before calling
-		 * drivers' slot_reset callbacks?
-		 */
 		status = PCI_ERS_RESULT_RECOVERED;
 		pci_dbg(bridge, "broadcast slot_reset message\n");
 		pci_walk_bridge(bridge, report_slot_reset, &status);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -599,6 +599,7 @@ struct pci_host_bridge {
 	void (*release_fn)(struct pci_host_bridge *);
 	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.43.0



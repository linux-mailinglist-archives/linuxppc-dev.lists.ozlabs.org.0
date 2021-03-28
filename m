Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E69B34BFEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t0h23drz30hX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BzAd00k8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BzAd00k8; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7szp2mPWz2yYZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:05 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id v70so10930982qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDOzS1vRcWtTYspKStQDHl39R8ItwGtdALzS3MH5haw=;
 b=BzAd00k8G81ySOORFH4ZYZ1bB3RbAIhMFXIV1td9cqvEo3UX3T7K8yDs0BLbUNs6dC
 G70pZ49bAzdfN5gPoTXAyB2FSNpShLDrz7XUsanKWuxMQrhE9um5pz0Eh9zXb8CEGvFR
 jProIh3TzVfDeb19gYLYfk5ihXrjFf2yWbMRIoNvoxWoNIfCyhIw+Kz9BsCPPMQa48D+
 /s97ueBJTMSjpIujqIKbMYw5vTW60f47/GtkTVffiOEP9zXV5SaMf2r5PpRh7pMqROjm
 DF1/IGaESef8EHnGmyWKekR0S17ktc8qfK44vFx3jKgxW3NB7Ado6xEEMvZo+NhRg8K7
 3Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDOzS1vRcWtTYspKStQDHl39R8ItwGtdALzS3MH5haw=;
 b=fDLKa/cLQ9BS7/Fhik3vqOLX6Z22iQmJJzSWdO2PKQHLXCOa5bD5gcT+GyJEakJOfn
 BbsHhhTnFCGDcgkJ5woL5fRzhtU9p2lHyeiCz+TtKAM9yMIG5gg2zLeFQ1cpU1ENsebI
 JHS+6u4kbUuheyFe8Xhhm7ZLjuGwNvNTeUQbzolmyVjlAyZwkx8UNknPMEk1oysUEG2r
 NczYKzuEFljHIl5rKNi2IMy7AmjTgJ8oCVN58M6sR8EHlM5AY8M1gZOpY3t/F6bFRAiG
 UeKijmJ11BB2aPCj/pocT2A/eu+MJRQ4AkN2Szz6LI1kLMehck8/r5iI7+DbrCROyPgZ
 3G3g==
X-Gm-Message-State: AOAM531ixcdQ0J6uE3hptiNJ16aj46D+SBTftad2cpdz9GQGZ6usJOGG
 29yZ6uqZAhDp0dxZWMsoIeU=
X-Google-Smtp-Source: ABdhPJypSYspQV6VkWopPpkt2zOnTgc+JiYwp3Y6rFrbq+R2YCZW03mpS3QNcfpuRFem43a0O2MkwQ==
X-Received: by 2002:a05:620a:110a:: with SMTP id
 o10mr23876269qkk.281.1616975762740; 
 Sun, 28 Mar 2021 16:56:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 01/30] acpi-dma.c: Fix couple of typos
Date: Mon, 29 Mar 2021 05:22:57 +0530
Message-Id: <c461490c88fdc6a18d264a283e5c69642ffa2859.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/exctract/extract/
s/avaiable/available/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/acpi-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/acpi-dma.c b/drivers/dma/acpi-dma.c
index 235f1396f968..4b1d5183bf64 100644
--- a/drivers/dma/acpi-dma.c
+++ b/drivers/dma/acpi-dma.c
@@ -100,7 +100,7 @@ static int acpi_dma_parse_resource_group(const struct acpi_csrt_group *grp,
 }

 /**
- * acpi_dma_parse_csrt - parse CSRT to exctract additional DMA resources
+ * acpi_dma_parse_csrt - parse CSRT to extract additional DMA resources
  * @adev:	ACPI device to match with
  * @adma:	struct acpi_dma of the given DMA controller
  *
@@ -293,7 +293,7 @@ EXPORT_SYMBOL_GPL(devm_acpi_dma_controller_free);
  * found.
  *
  * Return:
- * 0, if no information is avaiable, -1 on mismatch, and 1 otherwise.
+ * 0, if no information is available, -1 on mismatch, and 1 otherwise.
  */
 static int acpi_dma_update_dma_spec(struct acpi_dma *adma,
 		struct acpi_dma_spec *dma_spec)
--
2.26.3


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4615895C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 03:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LysLz2b7Dz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 11:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bno3s/km;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bno3s/km;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LysLM2xfFz2xJL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 11:57:28 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so4033221pjk.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Aug 2022 18:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fm/JvGypV/XXeVsRwhQRHU0S9OlMJe7oTobjC6aWCAk=;
        b=bno3s/kmehSJVL1qd9lSxU0IdzeVZxDGOBqZ+MgiLxcKUYMR5rrnNnYFd5Ad8xd5Yt
         6Hfkjowqyv7fpd69GQI0b2mRVk2SOVBAsPBfFtxgmlJFuL8CnFE4Cb74PijxVaVZk7Bo
         W2mxlilM8UXsXBpIk5spmkWzZ2+h2Z/mDKcZd8vfu0OZ+x4xEFJnB/QDqAHk6xL4e+6x
         oSr1KAr1APHjiqrOKGOOyJ/ZpeINDUesIJ1DuF+M7LyOT7NJlvxV63ZSUqm4Qlzkf+2l
         ei/oV+x4Xskoo7e425qcc3apq6EPkHTXPcXBoCBCXzXXivaN+rbm+HeilsCe1xnhYonZ
         ZvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Fm/JvGypV/XXeVsRwhQRHU0S9OlMJe7oTobjC6aWCAk=;
        b=PPT+BKOKlCrm2rK+cB9VVuIW/5ti8u0rq/Mo2nLs8vCRPSEOJm939OHgGJk6SdjOTQ
         nHs+YVJ7+YI8LBBIEyVMZdFnCAZWfi9LlYF6m20LDC192NOy97ERKcdYsAt+Y/p8cfmj
         poCK2oK/2Rn8UkiNS7pBdT2nfDhELDVuG0JhOh5C0Hi9r49l5m5nxjLHLzCKXRsZKCUM
         trFHZCcybJhTVJtZAuDjVBHvVyuH0ccYcxKGUq+xz/GEVQ4qmjLeY/K4kHUFw8VxuCSt
         HqlcQbZSWMf7dD8biJa+LJYK6zUXOSBXwnZvCiKWU/jcmTdHwG3EXmJQg61INXZ04Wwp
         ZXCA==
X-Gm-Message-State: ACgBeo2QEhHw5UR6fZl4FJOZ/ZrD6vLRe1vEgWESk7uAVavEVRPJ4ZQC
	y/xViBtTpMY6WTkXbHilKDhXAXsv4zI=
X-Google-Smtp-Source: AA6agR5CJosUsupWFeY/tUoE/ohq5ryoEV9xdnHUq6I3OY+OYR+YCN4n7WLcFlAdm2Ibvs9DtRHrcA==
X-Received: by 2002:a17:90a:9286:b0:1f1:bf7b:7602 with SMTP id n6-20020a17090a928600b001f1bf7b7602mr7951378pjo.83.1659578244928;
        Wed, 03 Aug 2022 18:57:24 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id z64-20020a626543000000b0052ce1737ee1sm9374712pfb.37.2022.08.03.18.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 18:57:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/microwatt: Add LiteX MMC driver
Date: Thu,  4 Aug 2022 11:27:08 +0930
Message-Id: <20220804015708.5928-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable the LiteX MMC device and it's dependency the common clock
framework.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/microwatt_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index eff933ebbb9e..ea2dbd778aad 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -75,7 +75,12 @@ CONFIG_SPI_BITBANG=y
 CONFIG_SPI_SPIDEV=y
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_LITEX=y
 # CONFIG_VIRTIO_MENU is not set
+CONFIG_COMMON_CLK=y
 # CONFIG_IOMMU_SUPPORT is not set
 # CONFIG_NVMEM is not set
 CONFIG_EXT4_FS=y
-- 
2.35.1


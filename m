Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5F436533
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:10:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrWg3P1fz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:10:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EUZaSbSs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EUZaSbSs; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrW24Hz8z3c74
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:09:50 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so5944279pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TfHsGP2yi6lWLecTIcZVrIhetTubqUKD7yLErDw3x2w=;
 b=EUZaSbSsvxfgQPDyiZv6K9FvbiaFo8lnIoEmpC0ubPuoqxNOuIOf4K8ZsIh578ws0Z
 2EDdrEbYHum8lqROFe1C/onYlVaB50CDb5AwppL0LpxiFNIEWdnc8cQjEFdXeAobfidj
 x8qfJAw0gdtPVdlvPc21q9Yxry610dr7WFKlVHFUO1eyzNlo/F03H3hyjJckpZwfON5S
 b21ly6HIsBApY6VwbYgoI1P/Fu0X1AZm7c/Cai3cT3TlLzr9REQ44ISEUK3PawQUbAVm
 ZC1Qe6WDuHchsm5VVBggdsA8zJ1Xgd6h2KTs8gi19LGsz2M2EyYOMMdey6IAUQiBbt/o
 +Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfHsGP2yi6lWLecTIcZVrIhetTubqUKD7yLErDw3x2w=;
 b=CybBVHuntxMPQ94NhtUa37ndWeKVjGUbfUUd5kHorLQM+7sc+H8Np3TmwPmjqqxw/A
 T6OWxx3lPMmSR9bEx3X0CKnbk0sy5vDtAcLybye3R2w4HBLRsbMdLdg6DxzN+I1BqzsZ
 jTaoxioNojHfbVFFdQ9EUbyBWddPBklutXw+gr6sltjouHP9O1+DdOKYj2yS83nUcNHc
 Ht6QRDLOJegDp5b3ny14x0vSAesVcGinRmCbovYznRS9mr4mboSqF4XnOZo2B/e/N3fP
 1aJ8dLWyrkU0Pg632pPmmKZSdklwpGwgRWq8KM9MkUeicQcbqxfoC8P8VsLI2DOtVz/X
 hCEw==
X-Gm-Message-State: AOAM532LX2WUX90EMnM+OFbutTRUqmOHNQ45JduQkmy3jGaBdqbT/FWP
 OCh6eW/xMUvimvtsXhcKuKs=
X-Google-Smtp-Source: ABdhPJxCZzHdSx53dvdDywLg2snzLq3kKzeBkBrose+fBiquWSSELbthuFAJlsRxyfUjW/fn7V8LMg==
X-Received: by 2002:a17:902:d4d1:b0:13f:af7:9068 with SMTP id
 o17-20020a170902d4d100b0013f0af79068mr5714981plg.20.1634828988016; 
 Thu, 21 Oct 2021 08:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:09:47 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 02/25] PCI: Set error response in config access defines
 when ops->read() fails
Date: Thu, 21 Oct 2021 20:37:27 +0530
Message-Id: <56642edd0d6bf8a8e3d20b5fcc088fd6389b827f.1634825082.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634825082.git.naveennaidu479@gmail.com>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Amey Narkhede <ameynarkhede03@gmail.com>, Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Naveen Naidu <naveennaidu479@gmail.com>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 skhan@linuxfoundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
response (~0), when the PCI device read by a host controller fails.

This ensures that the controller drivers no longer need to fabricate
(~0) value when they detect error. It also  gurantees that the error
response (~0) is always set when the controller drivers fails to read a
config register from a device.

This makes error response fabrication consistent and helps in removal of
a lot of repeated code.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/access.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 46935695cfb9..0f732ba2f71a 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
 	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
 	pci_lock_config(flags);						\
 	res = bus->ops->read(bus, devfn, pos, len, &data);		\
-	*value = (type)data;						\
+	if (res)							\
+		SET_PCI_ERROR_RESPONSE(value);				\
+	else								\
+		*value = (type)data;					\
 	pci_unlock_config(flags);					\
 	return res;							\
 }
@@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
 	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
 					pos, sizeof(type), &data);	\
 	raw_spin_unlock_irq(&pci_lock);				\
-	*val = (type)data;						\
+	if (ret)							\
+		SET_PCI_ERROR_RESPONSE(val);				\
+	else								\
+		*val = (type)data;					\
 	return pcibios_err_to_errno(ret);				\
 }									\
 EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
-- 
2.25.1


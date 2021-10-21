Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FCF436526
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 17:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZrVy3V8mz3c5l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 02:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Me2ms/bT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Me2ms/bT; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZrVJ62Xjz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:09:12 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso3356697pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCqTrKqg8AEEY1fy94bWXb9atpHsOzrSvfmsYcP1Hi4=;
 b=Me2ms/bTDiHgSLBr6tSZnSGK57Xq0PodMkigjQOxBqKFSTP+S6Ys0c1z1cgwhGRzMq
 dD61uaB62U1bO0yyIAfAlye2MhW4Xb6U3f1ifwy1tiGQ5Li+LQFTluq4WPm1SzJAA/Co
 i6USRU558XPIJjQTcsE+KgIJOgcbw+05/L7J2UmMshSYeUp0D7qGGyY19TKpkvepf99M
 qKvLJ/8dCZsuaslmM7TpJXRdRFEfgA57CfrtFR+iToFz5FQ8Br1TUIR43iayrks4OUUh
 WctytAcN5Y8WaMGzxbsbtr5gt6lzr1z6E+AuwgB/M+xYSeNi2uzA3U+TvUDD8R6lKBJR
 lYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCqTrKqg8AEEY1fy94bWXb9atpHsOzrSvfmsYcP1Hi4=;
 b=YW0hmRyShooTZodnidMRkG9mB1POqrCgUg5d4o2S2tYYGnW0IACS7Jr6QEYZ6ZOW/b
 TEhHgFG1hvsaNDHRJjAVPddAohyUXA+7uiNmP97b1oVIITbyIxw4IxKIfsBwMg4ntEWn
 EH/FBVR6QakocmXM0jnPWWrJZxOBqBo5szHwF6OokZwT31gC973pv+ccf7CGfCaQWqS+
 gRfswzoFJaTnKqAbAywoPCekIxg+GP4gNzdaNYIw0vrKQhwLjIWIyz0nf3IesotxiWQh
 gVLNnS2rL8qarqAOoFQkmJK01DVKnO2pMrWiM0zkSNaIyeFOQp51OgorpPQb/WUHk8oH
 IBuw==
X-Gm-Message-State: AOAM530DQt4A7zYHFgOOjBpLu8dLXpdS6H4FHep9/GQPovrImFW6SmDi
 DJfUUcNbIHHdn/08gXwPS5U=
X-Google-Smtp-Source: ABdhPJxnxqjsJSTu0VewveiQokmLiOhsbRmw+PWUQcLpIM+kXijEvkWeAPZfgzTDW/T9CfexzBf24w==
X-Received: by 2002:a17:90b:4d88:: with SMTP id
 oj8mr5111859pjb.175.1634828949353; 
 Thu, 21 Oct 2021 08:09:09 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id
 c9sm5508027pgq.58.2021.10.21.08.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:09:08 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v3 01/25] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Date: Thu, 21 Oct 2021 20:37:26 +0530
Message-Id: <f7960a4dee0e417eedd7d2e031d04ac9016c6686.1634825082.git.naveennaidu479@gmail.com>
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Add a PCI_ERROR_RESPONSE definition for that and use it where
appropriate to make these checks consistent and easier to find.

Also add helper definitions SET_PCI_ERROR_RESPONSE and
RESPONSE_IS_PCI_ERROR to make the code more readable.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 include/linux/pci.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index cd8aa6fce204..689c8277c584 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -154,6 +154,15 @@ enum pci_interrupt_pin {
 /* The number of legacy PCI INTx interrupts */
 #define PCI_NUM_INTX	4
 
+/*
+ * Reading from a device that doesn't respond typically returns ~0.  A
+ * successful read from a device may also return ~0, so you need additional
+ * information to reliably identify errors.
+ */
+#define PCI_ERROR_RESPONSE     (~0ULL)
+#define SET_PCI_ERROR_RESPONSE(val)    (*(val) = ((typeof(*(val))) PCI_ERROR_RESPONSE))
+#define RESPONSE_IS_PCI_ERROR(val) ((val) == ((typeof(val)) PCI_ERROR_RESPONSE))
+
 /*
  * pci_power_t values must match the bits in the Capabilities PME_Support
  * and Control/Status PowerState fields in the Power Management capability.
-- 
2.25.1


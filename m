Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E42D756F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 13:19:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsqbC3WFkzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 23:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Dx5LivaH; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsqVc1Px4zDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 23:15:15 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id q75so8378355wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSQYi3dLtVwnUE7Pl/TP3BDVgqP8TWHMbxJBiJCII0E=;
 b=Dx5LivaHRPPR2HXGN6NhnuCdmBQJvKcZWNlLrTLzZFJwcB6RzJfmUfHHX4C4GRDH+l
 Fcl2VrSCqpI3weTIOmxR4ST1Ab+nn2xscu6tLq74x6PXQBQG65J05JwnSJmobYeE9qJM
 dVtzrRd4Izqw/X9RQc7u7y0Gf07xW1suebY6PqHPbvgQpw/9xyyNskglhVAb3CQtCOJJ
 yvkfzspi1t+d/nNAM30Lby/YgWlVGRWwtFu2aJkl7Qkl4q0eInKA1+hgGxL3Zq2Yij0n
 ylb9TP1E0wB3Gi46R4nOboIrRT4ILrik9FL+7bvCj7CtuSdXcbyObivBqO36KuGP9+qn
 d1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSQYi3dLtVwnUE7Pl/TP3BDVgqP8TWHMbxJBiJCII0E=;
 b=lohmzn/rP8gVEYDqAYow9TqxWIklZgWsVMIudUkyoChRRXhqdGyJPmoS2AbGAoio6F
 hn/ND3ppu0u2NXiFPbMQmwT0cphi4zXEjSGvGosJw7w/Gcrbh4UdjB0vR3jfxsC2JhJX
 +Tb0FiSD2cqXEFegNRqI3MyYHwwRQsmtoUxJCMuLuvUxtr9C3Wj0IUwf+DyJ5W9JrVCY
 lANqG8YnTkCn+9I0ZTu0s8wzc+aCCjQv03z+0oV7Y9LUjC3mZXkO0pKbdgEPjnCeBjD8
 3X6zb6hWtiDYXYnmHs/SMRW26LpUHttGnjlbvJIUtbnOmwRteiuJIFFd68x2BW3i7gkQ
 7lhQ==
X-Gm-Message-State: AOAM533F8Qu7unbPfvFBfoINC+F9eNsM7kyQ/wz1hBFoVXKcJDjVBVCc
 mhFLLztOYXD0pNwKrvUAFwmqiA==
X-Google-Smtp-Source: ABdhPJzOVm94SMfkeQ9hfL9CF7fkbPYJoEd7mWVHor1srR0OHVa66W4FFAeAs+pfP5iEXHtZs3DlKw==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr13429738wmh.110.1607688910750; 
 Fri, 11 Dec 2020 04:15:10 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s63sm16668115wms.18.2020.12.11.04.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 04:15:10 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>
Subject: [RFC HACK PATCH] PCI: dwc: layerscape: Hack around enumeration
 problems with Honeycomb LX2K
Date: Fri, 11 Dec 2020 12:15:07 +0000
Message-Id: <20201211121507.28166-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Rob Herring <robh@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, patches@linaro.org,
 linux-pci@vger.kernel.org, Jon Nettleton <jon@solid-run.com>,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I have been chasing down a problem enumerating an NVMe drive on a
Honeycomb LX2K (NXP LX2160A). Specifically the drive can only enumerate
successfully if the we are emitting lots of console messages via a UART.
If the system is booted with `quiet` set then enumeration fails.

I guessed this would be due to the timing impact of printk-to-UART and
tried to find out where a delay could be added to provoke a successful
enumeration.

This patch contains the results. The delay length (1ms) was selected by
binary searching downwards until the delay was not effective for these
devices (Honeycomb LX2K and a Western Digital WD Blue SN550).

I have also included the workaround twice (conditionally compiled). The
first change is the *latest* possible code path that we can deploy a
delay whilst the second is the earliest place I could find.

The summary is that the critical window were we are currently relying on
a call to the console UART code can "mend" the driver runs from calling
dw_pcie_setup_rc() in host init to just before we read the state in the
link up callback.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    This patch is RFC (and HACK) because I don't have much clue *why* this
    patch works... merely that this is the smallest possible change I need
    to replicate the current accidental printk() workaround.  Perhaps one
    could argue that RFC here stands for request-for-clue.  All my
    observations and changes here are empirical and I don't know how best to
    turn them into something that is not a hack!
    
    BTW I noticed many other pcie-designware drivers take advantage
    of a function called dw_pcie_wait_for_link() in their init paths...
    but my naive attempts to add it to the layerscape driver results
    in non-booting systems so I haven't embarrassed myself by including
    that in the patch!

 drivers/pci/controller/dwc/pci-layerscape.c | 35 +++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index f24f79a70d9a..c354904b90ef 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -22,6 +22,8 @@

 #include "pcie-designware.h"

+#define WORKAROUND_LATEST_POSSIBLE
+
 /* PEX1/2 Misc Ports Status Register */
 #define SCFG_PEXMSCPORTSR(pex_idx)	(0x94 + (pex_idx) * 4)
 #define LTSSM_STATE_SHIFT	20
@@ -113,10 +115,31 @@ static int ls_pcie_link_up(struct dw_pcie *pci)
 	struct ls_pcie *pcie = to_ls_pcie(pci);
 	u32 state;

+	/*
+	 * Strictly speaking *this* (before the ioread32) is the latest
+	 * point a simple delay can be effective. If we move the delay
+	 * after the ioread32 then the NVMe does not enumerate.
+	 *
+	 * However this function appears to be frequently called so an
+	 * unconditional delay here causes noticeable delay at boot
+	 * time. Hence we implement the workaround by retrying the read
+	 * after a short delay if we think we might need to return false.
+	 */
+
 	state = (ioread32(pcie->lut + pcie->drvdata->lut_dbg) >>
 		 pcie->drvdata->ltssm_shift) &
 		 LTSSM_STATE_MASK;

+#ifdef WORKAROUND_LATEST_POSSIBLE
+	if (state < LTSSM_PCIE_L0) {
+		/* see comment above */
+		mdelay(1);
+		state = (ioread32(pcie->lut + pcie->drvdata->lut_dbg) >>
+			 pcie->drvdata->ltssm_shift) &
+			 LTSSM_STATE_MASK;
+	}
+#endif
+
 	if (state < LTSSM_PCIE_L0)
 		return 0;

@@ -152,6 +175,18 @@ static int ls_pcie_host_init(struct pcie_port *pp)

 	dw_pcie_setup_rc(pp);

+#ifdef WORKAROUND_EARLIEST_POSSIBLE
+	/*
+	 * This is the earliest point the delay is effective.
+	 * If we move it before dw_pcie_setup_rc() then the
+	 * NVMe does not enumerate.
+	 *
+	 * 500us is too short to reliably work around the issue
+	 * hence adopting 1000us here.
+	 */
+	mdelay(1);
+#endif
+
 	return 0;
 }


base-commit: 0477e92881850d44910a7e94fc2c46f96faa131f
--
2.29.2


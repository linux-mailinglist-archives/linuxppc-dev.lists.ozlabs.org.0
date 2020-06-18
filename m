Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E111FFD1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 23:05:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nvbC5FbczDrNh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:05:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=footclan.ninja (client-ip=2607:f8b0:4864:20::562;
 helo=mail-pg1-x562.google.com; envelope-from=kangie@footclan.ninja;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=footclan.ninja
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=footclan-ninja.20150623.gappssmtp.com
 header.i=@footclan-ninja.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=s3iDJs3l; dkim-atps=neutral
Received: from mail-pg1-x562.google.com (mail-pg1-x562.google.com
 [IPv6:2607:f8b0:4864:20::562])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nmlT21kYzDrBm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 01:56:49 +1000 (AEST)
Received: by mail-pg1-x562.google.com with SMTP id v11so3086500pgb.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=footclan-ninja.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvKoI8PMZzGI+SB60fJLf0VL2ZLdzN79PVHR+4htig8=;
 b=s3iDJs3leT+5hMurR0CCOMGi18ZAu4OuV5nCjuYJF3v6ZCb06x7Pm7EM1illjr/u9d
 7wkWrvpPS+HhPjBj2ohIzW39xNw2DrQAp1n03STbFn55hXCf36iUbBtSh0TJbsI6whPm
 sIpdWt+Cty8Wb5NsWUZS3EGhChG33MJSC832lJoWN3hqo0jWjGyGhuc4ZgE1WxQrtmJT
 MeNCea0OdUgZlWlvUNCo/NsM3gc4jszRUDke/zdepiY+Y2FvFhDIGtFpQ1iavnc1+cFA
 jrQtM28vsvpoc9sNiWk5hzvjkx0t3qjgVC/qdzCT4opUkIpfVXikGO/jalrsTE8WJre6
 w0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gvKoI8PMZzGI+SB60fJLf0VL2ZLdzN79PVHR+4htig8=;
 b=DIsx/F9EcTFmPfO4oJBRkTK49dV6F6EZl1xSmAz+cesK/MK4Iaq68/LOQzja4MqK3d
 HsYUTJSgwdz7Irz3DuexJKKiTucseShd+EK9zUMPC+Rb/5zjr9GB2xjJwCNDxyLbOBN+
 To0NlvwZOkgT3CZNnjM8RoDMARrVo9Tc9uXqtEThdEtpZVI9444fCukmY2caiDxAaV0G
 EqivgPr1lUeTcZr740IHCyEgaJ4pjXW5Ubuls6afu6+qSkVZj4qkE5k95s/9bpzGaaMp
 WHGsrmWrbEDMcd/xXWVzMaftmiB/h8uOTWvXdjhdLc2a1p8QKLHVRgXq0Uxbh/zKhZ5J
 3naA==
X-Gm-Message-State: AOAM531GKE1DAZ9Y3GZjE+31hydtYHxy757JId9hwuHI7sX7l4NcJsIN
 0fV2FDMPNMr4DZt8T71w+59h80Bl6D6hIFmgKocSVc1ZTvhw1A==
X-Google-Smtp-Source: ABdhPJw55PL0GjhYtbJiaokFl4eJuuGOYegFYT65bzjaA7qnmg26Lt+qEVKvP7WiFqwvz0ef2PncAS2U8scE
X-Received: by 2002:a05:6a00:14d4:: with SMTP id
 w20mr4240127pfu.279.1592495805652; 
 Thu, 18 Jun 2020 08:56:45 -0700 (PDT)
Received: from localhost.localdomain ([49.195.72.212])
 by smtp-relay.gmail.com with ESMTPS id y1sm355578pjy.0.2020.06.18.08.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 08:56:45 -0700 (PDT)
X-Relaying-Domain: footclan.ninja
From: Matt Jolly <Kangie@footclan.ninja>
To: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>,
 "Oliver O'Halloran" <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pci: pcie: AER: Fix logging of Correctable errors
Date: Fri, 19 Jun 2020 01:55:11 +1000
Message-Id: <20200618155511.16009-1-Kangie@footclan.ninja>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Jun 2020 07:03:47 +1000
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
Cc: Matt Jolly <Kangie@footclan.ninja>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The AER documentation indicates that correctable (severity=Corrected)
errors should be output as a warning so that users can filter these
errors if they choose to; This functionality does not appear to have been implemented.

This patch modifies the functions aer_print_error and __aer_print_error
to send correctable errors as a warning (pci_warn), rather than as an error (pci_err). It
partially addresses several bugs in relation to kernel message buffer
spam for misbehaving devices - the root cause (possibly device firmware?) isn't
addressed, but the dmesg output is less alarming for end users, and can
be filtered separately from uncorrectable errors. This should hopefully
reduce the need for users to disable AER to suppress corrected errors.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=201517
Link: https://bugzilla.kernel.org/show_bug.cgi?id=196183

Signed-off-by: Matt Jolly <Kangie@footclan.ninja>
---
 drivers/pci/pcie/aer.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3acf56683915..131ecc0df2cb 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -662,12 +662,18 @@ static void __aer_print_error(struct pci_dev *dev,
 			errmsg = i < ARRAY_SIZE(aer_uncorrectable_error_string) ?
 				aer_uncorrectable_error_string[i] : NULL;
 
-		if (errmsg)
-			pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
-				info->first_error == i ? " (First)" : "");
-		else
+		if (errmsg) {
+			if (info->severity == AER_CORRECTABLE) {
+				pci_warn(dev, "   [%2d] %-22s%s\n", i, errmsg,
+					info->first_error == i ? " (First)" : "");
+			} else {
+				pci_err(dev, "   [%2d] %-22s%s\n", i, errmsg,
+					info->first_error == i ? " (First)" : "");
+			}
+		} else {
 			pci_err(dev, "   [%2d] Unknown Error Bit%s\n",
 				i, info->first_error == i ? " (First)" : "");
+		}
 	}
 	pci_dev_aer_stats_incr(dev, info);
 }
@@ -686,13 +692,23 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	layer = AER_GET_LAYER_ERROR(info->severity, info->status);
 	agent = AER_GET_AGENT(info->severity, info->status);
 
-	pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		aer_error_severity_string[info->severity],
-		aer_error_layer[layer], aer_agent_string[agent]);
+	if  (info->severity == AER_CORRECTABLE) {
+		pci_warn(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+			aer_error_severity_string[info->severity],
+			aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		dev->vendor, dev->device,
-		info->status, info->mask);
+		pci_warn(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+			dev->vendor, dev->device,
+			info->status, info->mask);
+	} else {
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
+			aer_error_severity_string[info->severity],
+			aer_error_layer[layer], aer_agent_string[agent]);
+
+		pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
+			dev->vendor, dev->device,
+			info->status, info->mask);
+	}
 
 	__aer_print_error(dev, info);
 
-- 
2.26.2


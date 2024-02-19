Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C364185A2CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 13:03:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=GLA3jWiP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdh525DbTz3d3Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 23:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=GLA3jWiP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdh4G3FJHz3bWn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 23:02:36 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dc4a487b1eso1975330a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 04:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344152; x=1708948952;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2hACCCQq6ctsb61YdZfXiP9Cf/ZpEuBHB2ZECqqD5A=;
        b=AVO7GLmwJzGwr8GnFDRXTpFSw1oU70eSimdcCJOt6e35HFu2yY5NvDR26yGxSBQ1lZ
         P7ldZn+F6+DPfyzED0xahijgtJPUupPtPJGZetB0IUedkd6kJHPl2bgtEleG3LYTasDj
         agnaj8+jdMhXRaXEYqsDJK7Qwykath2OX6YelJwz9nlK4sASNkvkkY8Ke7GdC0v+rhut
         gW/B6WfFTxaqjFmZzq1DU6Tp4qszhEGb/jpg7xJGT3ceBWveDuEiX2uCmHXFvFtpneUB
         Nom6kCd5hFXbNCj67/XnzT1zLMxBnqXGe2ygw3AT7kNF9WAURbTLWkfLkCN64tIjVbJu
         OLnA==
X-Forwarded-Encrypted: i=1; AJvYcCXaY5IHXZOxfuAIr6wGLhYVyxs5XSd1jVwxTwCEb/Ec9/OZnNmElMCeQDErlajATXePLozVkRWKV3xt1AiinP2UvBOfDt+k9kEPgs6vuQ==
X-Gm-Message-State: AOJu0YwORXdtN20NvF4E1OavcohkzYQGLUkEu3qyECvpGzCpbOzB479w
	I+NSsB0uDW0IrSzHjQeapTGkLmDkgI9nI+14ukHeajouGFeUbR8R
X-Google-Smtp-Source: AGHT+IEO+YceAxGq2zoMcU6dSkph8vmrCIO81MsGwhvnHlOxsV6tVSs3Bi29WEspnQG7z4rGjj8g5g==
X-Received: by 2002:a17:90a:d243:b0:299:9ba4:abe6 with SMTP id o3-20020a17090ad24300b002999ba4abe6mr1749666pjw.46.1708344150939;
        Mon, 19 Feb 2024 04:02:30 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id gw3-20020a17090b0a4300b0029718f72ad3sm5126787pjb.44.2024.02.19.04.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:02:30 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708344149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H2hACCCQq6ctsb61YdZfXiP9Cf/ZpEuBHB2ZECqqD5A=;
	b=GLA3jWiPfbc35JQVF/PpwYZwxKUTNUioga/Ok1SoTYCgQTMIjQGElW2L2aK2wXrjQ1vXnE
	+rCYxAJaXrqtRLmLTM7DqEIqTmrTN+Ety2TkswvsF8iqVw0vF/kUpSO+rHVXa8hvrrP8fH
	g9KXDgectJMv8K7GmQZ9o31BzcYiaaQOP/EDwyVAYQRJo+bngUEQTxPmF7A2pVUcHVc2q0
	9YB7e/4VyDMvbnLZWmHWQtbP4/f2LufRVpOyyeUDD++NLKsvJ/iMnIgsrvY+vZJKmkEjWU
	pKakv9y0qJWVgumDUucFWnZsMJmYFnun4cOo9sAt0LD6C7r6tI9DZQOC3gLILQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:03:11 -0300
Subject: [PATCH next] bus: fsl-mc: constify the struct device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-fsl-mc-v1-1-d206b8b90f2b@marliere.net>
X-B4-Tracking: v=1; b=H4sIAH5D02UC/x2M7QpAMBRAX0X3t1sz5ONVJM12xy1GG1Ly7pafp
 845DwTyTAHa5AFPFwfeXIQsTUDPyk2EbCKDFLIQMmvQREnToBdS7tzRhgVXjaM0ta1UmYvaQGx
 3T5bv/9uBo/uA/n0/rKXtfm0AAAA=
To: Stuart Yoder <stuyoder@gmail.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Li Yang <leoyang.li@nxp.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6005; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=V4QRYQ76YEpXXNMyK5V0fnE0QpgAewPnLJMPRZ8+iSU=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00OC7UwZ8Nbbx/scP4H7DsOPAQv3LfbSIDf7w
 Pd5guhK1ZOJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNDggAKCRDJC4p8Y4ZY
 piGBD/0bu6xlhMehhehiv7GOBEfHsJlzUi2KMB8YcoxxTzu5gAxpsmRGTP+o5QPMkq4thc+fp+W
 va20fT14amRdGHGlgOHY/PbRwA86NbKik7Jnw+uuSwhONhu1Ws1c4HuYJhZG2WPcYrRZOPxEzFg
 tSu84QZEGMYqoKHPKZ4criSJXv0PqdRqhnJY/ogPbudPJd5ctRFQ17Y2Q6QoR/S/InoXVajONRy
 ICxqEbeWKlw7ikvQVIBuoCvC+5x9yWB3MkwbfG/KwCyLgPNyPB/bID8qw8avDrIR6O+JdYCuhzy
 a4YTpf2/UYIgM+s+3SXZE8JWoscZVB2OV0/4YrdHga8/nzW8OPVdBeFDeyOGZADigEjWo+11cMm
 tf0AgyJlzCXdTAjKOQ0vqzJiUMOizGok7hK6/krmlLyGiYgnDQKQTmTNG9xf0xf6seVe0mnVMnw
 u1sL6Iukrfek7rNZ7jHLfg+09qd59fTU5X4JZEOlLWweCZSiS7PlmiIdV2S45lNEGL4C/6O3sNm
 TXGCDlf1NrxfAT+L+mf+c87pl5Hny3fzmrcy9H1FxZzs37TlQhYsHsnfNOKzepW5BZ7dRNoCa9m
 +R1QjJPzW+wKNgvVZBtBAdGaSC+VMXCCSZisoeyiZhBwXeA64gJ4kMb8hfNqmGGtqLRQb80OI/h
 1dl9deN300fRuyQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move all the
device_type variables used in the bus to be constant structures as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 32 ++++++++++++++++----------------
 include/linux/fsl/mc.h          | 30 +++++++++++++++---------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 78b96cd63de9..f75ca3f0d75a 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -320,82 +320,82 @@ struct bus_type fsl_mc_bus_type = {
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_type);
 
-struct device_type fsl_mc_bus_dprc_type = {
+const struct device_type fsl_mc_bus_dprc_type = {
 	.name = "fsl_mc_bus_dprc"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dprc_type);
 
-struct device_type fsl_mc_bus_dpni_type = {
+const struct device_type fsl_mc_bus_dpni_type = {
 	.name = "fsl_mc_bus_dpni"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpni_type);
 
-struct device_type fsl_mc_bus_dpio_type = {
+const struct device_type fsl_mc_bus_dpio_type = {
 	.name = "fsl_mc_bus_dpio"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpio_type);
 
-struct device_type fsl_mc_bus_dpsw_type = {
+const struct device_type fsl_mc_bus_dpsw_type = {
 	.name = "fsl_mc_bus_dpsw"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpsw_type);
 
-struct device_type fsl_mc_bus_dpbp_type = {
+const struct device_type fsl_mc_bus_dpbp_type = {
 	.name = "fsl_mc_bus_dpbp"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpbp_type);
 
-struct device_type fsl_mc_bus_dpcon_type = {
+const struct device_type fsl_mc_bus_dpcon_type = {
 	.name = "fsl_mc_bus_dpcon"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpcon_type);
 
-struct device_type fsl_mc_bus_dpmcp_type = {
+const struct device_type fsl_mc_bus_dpmcp_type = {
 	.name = "fsl_mc_bus_dpmcp"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpmcp_type);
 
-struct device_type fsl_mc_bus_dpmac_type = {
+const struct device_type fsl_mc_bus_dpmac_type = {
 	.name = "fsl_mc_bus_dpmac"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpmac_type);
 
-struct device_type fsl_mc_bus_dprtc_type = {
+const struct device_type fsl_mc_bus_dprtc_type = {
 	.name = "fsl_mc_bus_dprtc"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dprtc_type);
 
-struct device_type fsl_mc_bus_dpseci_type = {
+const struct device_type fsl_mc_bus_dpseci_type = {
 	.name = "fsl_mc_bus_dpseci"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpseci_type);
 
-struct device_type fsl_mc_bus_dpdmux_type = {
+const struct device_type fsl_mc_bus_dpdmux_type = {
 	.name = "fsl_mc_bus_dpdmux"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdmux_type);
 
-struct device_type fsl_mc_bus_dpdcei_type = {
+const struct device_type fsl_mc_bus_dpdcei_type = {
 	.name = "fsl_mc_bus_dpdcei"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdcei_type);
 
-struct device_type fsl_mc_bus_dpaiop_type = {
+const struct device_type fsl_mc_bus_dpaiop_type = {
 	.name = "fsl_mc_bus_dpaiop"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpaiop_type);
 
-struct device_type fsl_mc_bus_dpci_type = {
+const struct device_type fsl_mc_bus_dpci_type = {
 	.name = "fsl_mc_bus_dpci"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpci_type);
 
-struct device_type fsl_mc_bus_dpdmai_type = {
+const struct device_type fsl_mc_bus_dpdmai_type = {
 	.name = "fsl_mc_bus_dpdmai"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdmai_type);
 
-struct device_type fsl_mc_bus_dpdbg_type = {
+const struct device_type fsl_mc_bus_dpdbg_type = {
 	.name = "fsl_mc_bus_dpdbg"
 };
 EXPORT_SYMBOL_GPL(fsl_mc_bus_dpdbg_type);
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index a1b3de87a3d1..4b9311f122e0 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -438,21 +438,21 @@ struct fsl_mc_device *fsl_mc_get_endpoint(struct fsl_mc_device *mc_dev,
 
 extern struct bus_type fsl_mc_bus_type;
 
-extern struct device_type fsl_mc_bus_dprc_type;
-extern struct device_type fsl_mc_bus_dpni_type;
-extern struct device_type fsl_mc_bus_dpio_type;
-extern struct device_type fsl_mc_bus_dpsw_type;
-extern struct device_type fsl_mc_bus_dpbp_type;
-extern struct device_type fsl_mc_bus_dpcon_type;
-extern struct device_type fsl_mc_bus_dpmcp_type;
-extern struct device_type fsl_mc_bus_dpmac_type;
-extern struct device_type fsl_mc_bus_dprtc_type;
-extern struct device_type fsl_mc_bus_dpseci_type;
-extern struct device_type fsl_mc_bus_dpdmux_type;
-extern struct device_type fsl_mc_bus_dpdcei_type;
-extern struct device_type fsl_mc_bus_dpaiop_type;
-extern struct device_type fsl_mc_bus_dpci_type;
-extern struct device_type fsl_mc_bus_dpdmai_type;
+extern const struct device_type fsl_mc_bus_dprc_type;
+extern const struct device_type fsl_mc_bus_dpni_type;
+extern const struct device_type fsl_mc_bus_dpio_type;
+extern const struct device_type fsl_mc_bus_dpsw_type;
+extern const struct device_type fsl_mc_bus_dpbp_type;
+extern const struct device_type fsl_mc_bus_dpcon_type;
+extern const struct device_type fsl_mc_bus_dpmcp_type;
+extern const struct device_type fsl_mc_bus_dpmac_type;
+extern const struct device_type fsl_mc_bus_dprtc_type;
+extern const struct device_type fsl_mc_bus_dpseci_type;
+extern const struct device_type fsl_mc_bus_dpdmux_type;
+extern const struct device_type fsl_mc_bus_dpdcei_type;
+extern const struct device_type fsl_mc_bus_dpaiop_type;
+extern const struct device_type fsl_mc_bus_dpci_type;
+extern const struct device_type fsl_mc_bus_dpdmai_type;
 
 static inline bool is_fsl_mc_bus_dprc(const struct fsl_mc_device *mc_dev)
 {

---
base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
change-id: 20240219-device_cleanup-fsl-mc-b2d8f7a5308d

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>


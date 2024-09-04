Return-Path: <linuxppc-dev+bounces-1015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4D96CA69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:28:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcbB6t50z2y8F;
	Thu,  5 Sep 2024 08:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725459486;
	cv=none; b=QI/ftUEZ6+2UReAdrtrl34JyfooNsQYbnFr6hcc5N3AjDG/Ixw4IjdIsPa+Pgaf6ONWYwBtbhIH2eQ21BI5FjT/C7cDH4Y/+0UnACwkzmp83SSMT7JWoQSodcO0FwJywSJ5zeAFwDaZVkOKTGq2We7Bo13VaibovcPFjtv6nRAo0s2F3vxkUaLptBoCwFzDh71WWoLyGYUTKwjkkqUqqs3yXP8pUFbxEIUDdGXWqaLC19ef1XzagWamuwYeRjpzQI8YFfaxQqgRsa5whAdA048W6/+hnW0EuokgTq/DPmihw1WQL0wsjkQyTeSIApuwIFRKu/gVyVZBKZNSAeClxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725459486; c=relaxed/relaxed;
	bh=ELDHVvYsM0/cFEKySzl95MUb/4tJhoB1VGQyY2w6COY=;
	h=DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:To:Cc; b=MiLnf8aKviOXRvBUE3AzZ3mw9p2D3ZAQjmw02vPsxvHCQJR/j0AjN9++xIr33JuD5N2ld9gy/O8qXY2gBEW0TWMViXEd5OD6pK96ieDzgqBwBkzJftNqnnfrfReeuyGld16Q7XJWPHYYTWxGYoudnjPdBO6M/7xiEHl4nLFkjmrwuh/2O3824ibkvVu00CwJsnLIEbRk5fi2wTsNDanD/bO3rgJhTdzjdtDaSsZttF+PcT6KgDTFF9qMHjc//Y3PRxnNylpPQX1Ljow/GXXlWpdOs0YaSuoglrzRrgG85K/T3kjChdndNRLCkytYOdwzXi1+KPHVKumW0eHUjSZfZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MX7PQM9/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=ricardo.marliere@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MX7PQM9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=ricardo.marliere@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzPj95Kr5z2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 00:18:05 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42c7856ed66so37005375e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 07:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725459475; x=1726064275; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELDHVvYsM0/cFEKySzl95MUb/4tJhoB1VGQyY2w6COY=;
        b=MX7PQM9/3xWYhrBAVm0iLVHg3SyvkwoXyTqrUKKpqEczP9OidxPsqt//O2Jl6AaMLj
         IbBykKSWyA7tdvNYnOh93ffPmyapm49Ow75kpQ+6zmWSubCIJy85OBauqtCizTvwxlYa
         IX8mnkFywR9yf9vRfOs1Y0pBxfyWDhZrw8c7oe/D1fOU0GTUVoK54Z99l6MTHcOpZ/WM
         QjcTJ8VKq3GvzxlNfE5LSnFerkJ0TAR1gDA7BVN2IcLs00Xo373PrLQTSMrXr+unpGCb
         KRXz001NzRekawLLwPLx5d1Cbb51ydusN0Rn4xSpx10juJ+eG0U5CNODSZg7xeBYiWEy
         vOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459475; x=1726064275;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELDHVvYsM0/cFEKySzl95MUb/4tJhoB1VGQyY2w6COY=;
        b=hAdjjixI0Sbq+czhkafA1PKX2kYpa9bGuxWNH30gHYPMXKe3XMulgfBtK75uqfF7FB
         UfdS/0kOT4BQIyQsl0jfW6+kK02R9+ti19KqblkFbpszNWLo2TR6r4nOc6CubJrNS5Qb
         99yGK+iSnZ7XnUsA2hXmysfhE+dEJ6aCME/cy38/oPuADx+dr/nMKE8wM5iN0DsBWber
         Du6O7zpO9U92ZQdfbHL/m3iUJXJg9deTKFeZtZuU3/1MWVa8bJDaXzDQF8r1toRKPJaY
         cJxps6E2rMyujMqRO97wVYyw3FIBGN7N1e78PfG7Ea9sCxqD6T9SJ7PKILjHf33dRmhd
         F9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWPnVbKKPtcP9ef2YMMUvRO8yKsj+9hsl3mR1Q4q7F//1c8Ftzo2IXNfLM4dht8W/F8KFYLfZ1pbBXPkMA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQy3e3mN/GWM293C1RL8n3uwvqqxah9BVLFs9kaHpm+3T5NRtE
	fVzZZgmN4HKQ75vttly3K+0fplP9mI7wJkh0Itot92xVkq+ReTQjnNkSBM+OrIo=
X-Google-Smtp-Source: AGHT+IGkD3blpPqv6B8eGGu6NVRvgAJ4j0fFjCWqCu3ka/hfnJLfo9Cgeq7k7QsaXhiUlobUpmTbug==
X-Received: by 2002:adf:e407:0:b0:374:ba61:b77e with SMTP id ffacd0b85a97d-374ba61b935mr8044857f8f.63.1725459474751;
        Wed, 04 Sep 2024 07:17:54 -0700 (PDT)
Received: from localhost (189-18-187-19.dsl.telesp.net.br. [189.18.187.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8c4d6e012sm7272417a91.29.2024.09.04.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:17:54 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
Date: Wed, 04 Sep 2024 11:17:23 -0300
Subject: [PATCH v2] bus: fsl-mc: constify the struct device_type usage
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-class_cleanup-fsl-mc-bus-v2-1-83fa25cbdc68@suse.com>
X-B4-Tracking: v=1; b=H4sIAPJr2GYC/x3MwQqDMAyA4VeRnA2E2oPuVWRIG1MXqJ00OAbiu
 6/s+B3+/wKTqmLw6C6o8lHTd2lwfQf8CmUT1LUZHDlPE3nkHMwWzhLKeWCyjDtjPA2HSH4dKcW
 JB2j5USXp97+en/f9A1VYS49qAAAA
To: Stuart Yoder <stuyoder@gmail.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Ricardo B. Marliere" <ricardo.marliere@suse.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6798;
 i=ricardo.marliere@suse.com; h=from:subject:message-id;
 bh=iF+xnUz4ZVPd2l4qR5ydbQTMDvMlGwihx9FK85bYczg=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBm2GwQbmdWX+KAX9FGwgD5cr9/sgSd7B39pIqzz
 xJTXfoySfSJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZthsEAAKCRDJC4p8Y4ZY
 puoVD/9auRpWOIpZjhD950/p+J7hVSvnPgH+pRzGey3BK46K1hcAzVYEcFl9i297Hz+3xAtJk7w
 ACaGCph4gu+0M6T3OCNLMuj2IUpKxKQMfYaazzWVKzrJ7Cf5a9Ns2cqG7MQFnDquzbp5nwzs+nU
 2aJwBvfZKMQzDvhP6X8ipnyEAMVHYqSVGAPisW87ko4JvOEOZ0WKFi17a3BjMej6FimmZU6APe0
 RdGrGJ6AikKI87SvmHjxy1ZWgJIMyeTsXWg64t/k/Mc6aW7Qb9QZRFGUx2tn1q/3g5n/sB4UMwK
 inoGtkCTdBJX2FL7lprYxdRU8IayrJ/05+XbYkoh0wQFACtVXa6nXyA+u/XtTieAftD1+aQTIrO
 ZLBt0divL6ngyTsrjTVHIjjISI8r6bDEu307mM9CRUhXm2qmpBAKc/Te0wTZQ3zfR1MxFMA09jq
 bTIEdwp+mMTz2yv18JoJuB6oTwS2V2SavRg5f+eOdyuvjnY4JAOiP4PPnioEzQcyHY/TZae31WZ
 po2XBK6RTkWq4g6pxCNercNDdUGLjHZ1J/56yiQ50bfts4M1rBMIJXcPGK6+KJWwtwbEzEN/D8w
 ZwG8xszSNQ/6nO2WrTVDgkWiSSm/jOCimjNZ2YIFZewUVzy7vr3E70ZYrHGsnh8DxrT5tOGwdEd
 tKxyF6hkCGpUczQ==
X-Developer-Key: i=ricardo.marliere@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move all the
device_type variables used in the bus to be constant structures as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo.marliere@suse.com>
---
v1->v2:
- Added missing specifiers regarding:
https://lore.kernel.org/oe-kbuild-all/202403091124.VOzGG1lj-lkp@intel.com/
https://lore.kernel.org/oe-kbuild-all/202403090918.89zrHUF2-lkp@intel.com/
https://lore.kernel.org/oe-kbuild-all/202409041701.8NfSraMa-lkp@intel.com/

v1: https://lore.kernel.org/all/20240309-device_cleanup-gregkh-v1-1-8ca586ef17ba@marliere.net/
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 36 ++++++++++++++++++------------------
 include/linux/fsl/mc.h          | 30 +++++++++++++++---------------
 2 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index dd68b8191a0a..2f68aa30dae6 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -320,90 +320,90 @@ struct bus_type fsl_mc_bus_type = {
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
 
-static struct device_type *fsl_mc_get_device_type(const char *type)
+static const struct device_type *fsl_mc_get_device_type(const char *type)
 {
 	static const struct {
-		struct device_type *dev_type;
+		const struct device_type *dev_type;
 		const char *type;
 	} dev_types[] = {
 		{ &fsl_mc_bus_dprc_type, "dprc" },
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 083c860fd28e..ee6cbf9ab580 100644
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
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
change-id: 20240904-class_cleanup-fsl-mc-bus-3b04d80fb9c3

Best regards,
-- 
Ricardo B. Marliere <ricardo.marliere@suse.com>



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F31AD236
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 23:52:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493CdF6k5qzDrp4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 07:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493CbV659KzDsTW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 07:51:18 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id e20so4447605otl.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7M3k+FxFM2t4ExxYTaDGkabiudch2FpP3FcpmG1/ak=;
 b=B8G62x1ZlPxCnVksgz2Ed0aF70KwWfCH+cAmJ1KJEHXPTcT9q2ZVSXj12lLQZm8aG8
 c4vVOx+JC8FjfosN5+XT839H6F+sK0i4tYFblCCOpPSwenYSN54AuQ63hA3TGzKNCUKS
 3cXl9coUcaPXbofYkRcdX/BgZQkcTfggHUMbtdSetNIqTL9I28tMyOF4eRfOoOLH8Vyy
 u1zrDuf/NkJT6+S82q8JI7ifzHsTytlYu2ne0nfm8tqs7eG57IYXG4e+o0CY8redM19y
 ie+MSbaC1cNVSXGHsBVxF4A62Ih9G5ou81+OqsyPfx/xQHDviRq7xTadOzeCfnVuFuEa
 92jQ==
X-Gm-Message-State: AGi0Pub12KYPhL2i/Mt+Dv9S4wV8Bt7YLBiV59hSAtFchn37SEXzJiP1
 vpESACyw04jAe6hjob5HNw==
X-Google-Smtp-Source: APiQypLorbM+YGCvyVCHjhxXKdsUcPK96qQ5LqT3sag6/2WHfdgbhXtSImcI2eO6SFiUXSzTws3LMg==
X-Received: by 2002:a05:6830:157:: with SMTP id
 j23mr167039otp.93.1587073876082; 
 Thu, 16 Apr 2020 14:51:16 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id q3sm205776oom.12.2020.04.16.14.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 14:51:15 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: Use of_node_name_eq for node name comparisons
Date: Thu, 16 Apr 2020 16:51:14 -0500
Message-Id: <20200416215114.7715-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/hotplug/rpaphp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 6504869efabc..9887c9de08c3 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -435,7 +435,7 @@ static int rpaphp_drc_add_slot(struct device_node *dn)
  */
 int rpaphp_add_slot(struct device_node *dn)
 {
-	if (!dn->name || strcmp(dn->name, "pci"))
+	if (!of_node_name_eq(dn, "pci"))
 		return 0;
 
 	if (of_find_property(dn, "ibm,drc-info", NULL))
-- 
2.20.1


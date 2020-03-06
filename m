Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7E17B7B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:47:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yfpz0YqrzDqDX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gohbmHug; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YfdX4h4QzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:39:28 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j20so516636pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nYudhVJQuCqGXbO3LdcHfUbkqwA52vSREP3TnTQNcTI=;
 b=gohbmHughPye/Z/yWEWtuXEsa9GjZBRM+kDoM4z4zoSowlaYi7HSyYjLY+xyqGjMU8
 76IOzMqmlce2Bzk73v6Lczyi1EldZZb8nNd5IbAuebYrHRrZo+zf68yIvFRyqm83E2C3
 gDCzvp7V+1WvFFWml7F7+T6Oq+ThoJZkQSduTG2CKxaqVaChdlXAzNrtvHwyAZ5fmXhc
 xdBrzNl2LZRBexYwTBwFmMPumsn9U5FiwEdY3Ir8He3lRYhniAAYeHnNz+tp6zk0tq2f
 92+94QY/eiEtWCYbIED2F3FD8jczouSXuJo86B8xUNCfuo8+Ul2xbZnl6x5L+rIhyyid
 PsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nYudhVJQuCqGXbO3LdcHfUbkqwA52vSREP3TnTQNcTI=;
 b=nXmD1TQ1Ht/rLez6d/Mc9SS+0XtNkPVoB+Z+LkAkZrHDKXCjPZC6BL/lqh4xJ5UzQN
 Oq3P4OC4NUtX8AW8CfTL7RN+oE+SS9vtqJUEeK1w+gPAPc+f/OAqrlTLJDg5BIos1La+
 V0igr0YxrkoCo1hPOBZGrJsqdXrvPGKm+AV00iXvlhG+Q4tJUvTyOaYvAgVOmV2r/Hv2
 2o3iQsVA8IZbQKmC2Y9cqnnrnSt4zWr6Vm/YxpX5MtgjG5ZYrrsCq2YyVPi5izyutJDw
 t3osCQt1KWAWlPpg630+QiR2GkDXQvQWKVc6/RYMoDTgoVUr1ut/m4k4zWvu7/aZl94N
 12GQ==
X-Gm-Message-State: ANhLgQ32xM6RNYEU1uKfgEala4MAx7wpIBN5zAKwjbigm66o9upD9pHP
 Ls6vX6NaDqGVbGXXOo1PVjlPBQDUrWA=
X-Google-Smtp-Source: ADFU+vu0HKQEzwylokDbfoxCyU5NfGlsKZFFhYlBWYkZ/2SvbwMve6RQ9J3aCz87487mME/UzcB0mg==
X-Received: by 2002:a17:902:8603:: with SMTP id
 f3mr1782236plo.235.1583480365139; 
 Thu, 05 Mar 2020 23:39:25 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b16sm6192999pff.25.2020.03.05.23.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:39:24 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] powerpc/eeh: Remove PHB check in probe
Date: Fri,  6 Mar 2020 18:39:02 +1100
Message-Id: <20200306073904.4737-4-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306073904.4737-1-oohall@gmail.com>
References: <20200306073904.4737-1-oohall@gmail.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This check for a missing PHB has existing in various forms since the
initial PPC64 port was upstreamed in 2002. The idea seems to be that we
need to guard against creating pci-specific data structures for the non-pci
children of a PCI device tree node (e.g. USB devices). However, we only
create pci_dn structures for DT nodes that correspond to PCI devices so
there's not much point in doing this check in the eeh_probe path.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 9cb3370..a9e4ca7 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1120,7 +1120,6 @@ core_initcall_sync(eeh_init);
  */
 void eeh_add_device_early(struct pci_dn *pdn)
 {
-	struct pci_controller *phb = pdn ? pdn->phb : NULL;
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
 	if (!edev)
@@ -1129,11 +1128,6 @@ void eeh_add_device_early(struct pci_dn *pdn)
 	if (!eeh_has_flag(EEH_PROBE_MODE_DEVTREE))
 		return;
 
-	/* USB Bus children of PCI devices will not have BUID's */
-	if (NULL == phb ||
-	    (eeh_has_flag(EEH_PROBE_MODE_DEVTREE) && 0 == phb->buid))
-		return;
-
 	eeh_ops->probe(pdn, NULL);
 }
 
-- 
2.9.5


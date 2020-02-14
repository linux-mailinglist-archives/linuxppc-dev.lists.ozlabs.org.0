Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA015F9F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 23:52:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7tb0jW4zDqsh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 09:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7hM0QHkzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 09:43:31 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id p8so10649961oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 14:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AyyJC538Y/y34o2rpyNkr6k8LEp+yP8uKUpD7OCEln0=;
 b=eSooR5vYiIqjYgQl1IHD7swkKP9pueHckE3Wj8nD4/3Z4NlBmDZIlBpksSNI07rSrd
 htzNbBaeF7/KUspzXY5HkUVLTsp8h1Khnv4mb6PqzP71j2xog5Bv74flPVMZWg8duqIx
 hN3czerAKAjHvB6u4yTycw9A9yCNa021boavZpy0gz5iknn6x6yaaqxx3L2eH5qySmK9
 2V0aF1UBcHk/VRBz1EbyFQlf+2eLF4wD9XLI6ll1Hw/3HWQVvzN9o3YteeRjnNmyl/Ml
 qfAz0v+AOg19yMM2UsS163BwsJhvgORvJ+3ypdz9Ge0HhVu5/BO83JOazXNeWfMFy0Hx
 ojgQ==
X-Gm-Message-State: APjAAAVlwWNJrY1tcifN7WQdKTP2INUVrLfydktCxnhsa3BSz9o84I24
 ZBsLnBORqX0XfoOgtN76RxQU1cc=
X-Google-Smtp-Source: APXvYqx8MMsvAf68sW+GAmZMr1gg/xcRTWMRudRem8bnJp5yjH/sXdGdXEh5dgpekBos7HCRRi6xyw==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr3956084otl.366.1581720208923; 
 Fri, 14 Feb 2020 14:43:28 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m69sm2453167otc.78.2020.02.14.14.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 14:43:28 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 4/7] of: Drop struct of_pci_range.pci_space field
Date: Fri, 14 Feb 2020 16:43:19 -0600
Message-Id: <20200214224322.20030-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214224322.20030-1-robh@kernel.org>
References: <20200214224322.20030-1-robh@kernel.org>
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
Cc: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's no more users of struct of_pci_range.pci_space field, so remove it.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 1 -
 include/linux/of_address.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 846045a48395..5d608d7c10d6 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -736,7 +736,6 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + parser->np > parser->end)
 		return NULL;
 
-	range->pci_space = be32_to_cpup(parser->range);
 	range->flags = of_bus_pci_get_flags(parser->range);
 	range->pci_addr = of_read_number(parser->range + 1, ns);
 	if (parser->dma)
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index eac7ab109df4..8d12bf18e80b 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -16,7 +16,6 @@ struct of_pci_range_parser {
 };
 
 struct of_pci_range {
-	u32 pci_space;
 	u64 pci_addr;
 	u64 cpu_addr;
 	u64 size;
-- 
2.20.1


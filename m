Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D8422F04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP48w5xyBz302W
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:20:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UvpRegiH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UvpRegiH; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP48B4LnDz2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:19:38 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso2309414pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjHgR4yuS2vTaKg7fKfhOjl8nNl87X4AMEmWTqe3CAo=;
 b=UvpRegiHO4NAWwEm0An/S746HVyraL1+IKlEUHsK7b4F732ko1nh7S4XAi2+ZFi0b6
 bj5GWF90SjpxzdpcbIVIimMhy10JdsL4iUHsdJGc7jTOfFL5A/B863nlU7PLVeyVe86m
 ttiIP1ALgJkzIYlfgAGNKSIlvlHYsd1kA3M1Rs2Ot3MNkOwV8KjIalam0TrlZODMnqkM
 dwaQ6z9hB42hc5w5gQom8SeKIt/CGM5sRwLYouk6LtfJmwRoxXlZAZp9uFb3M2XuSv9o
 5Yf9C/0A8wDenXF5AwdJW1tVNKkVNrkT7LdOXxhF+wmBMKU+ZmbfNqmGwS664+mwVcrP
 8R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjHgR4yuS2vTaKg7fKfhOjl8nNl87X4AMEmWTqe3CAo=;
 b=FEAagSC2E6xNBCg5dF2wqefG2kBxpKlCsb9PL0/ReGFY7NddGIEdTJ8UmRonAePHxj
 IEeMv8GwBzLYqMux5Rc6koD2O1ei4LayqVGYsK7xysdqWBjtjsg9swvvbADd6ZerSgOt
 mqDOTZJnxEI/TutxW02FIFGqoM3//Y99NmkQyKFgv/0FYbWWJy7lSeSYB9OKNpv+NmH6
 6xBO8JKgLmcp3ZIk9UFAVzPFoWvqdLLXCUK7/tzwAyHipuYMsqn7tWQx5qU/Lj4+maTY
 MsWJmSKBP+fJDpwElr5gMd57fR+XRIqTmRclPv9oUZ73YkAgayYdug2CdBnyHLZb5doe
 kEnA==
X-Gm-Message-State: AOAM531FZgSST5lGzDF4otrvMKidNpJ9vIJb7PNMK4qI4AXPQ9UE0xOb
 DaJl1fvGl3JrP8jIMhwESjw=
X-Google-Smtp-Source: ABdhPJxzVl2CYXY1+jXkMgxI7lgjA4Vhcp7jsudKPrO1RBAfCZVLiTcwITS9ttdeflkxxCh6kEfNHQ==
X-Received: by 2002:a17:90b:3e8d:: with SMTP id
 rj13mr5241539pjb.183.1633454375892; 
 Tue, 05 Oct 2021 10:19:35 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:19:35 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
Date: Tue,  5 Oct 2021 22:48:08 +0530
Message-Id: <22b2dae2a6ac340d9d45c28481d746ec1064cd6c.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, we do not print the "id" field in the AER error logs. Yet the
aer_agent_string[] has the word "id" in it. The AER error log looks
like:

  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)

Without the "id" field in the error log, The aer_agent_string[]
(eg: "Receiver ID") does not make sense. A user reading the
aer_agent_string[] in the log, might inadvertently look for an "id"
field and not finding it might lead to confusion.

Remove the "ID" from the aer_agent_string[].

The following are sample dummy errors inject via aer-inject.

Before
=======

In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
the "id" field was removed from the AER error logs, so currently AER
logs look like:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID) <--- no id field
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

After
======

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/aer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9784fdcf3006..241ff361b43c 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
 };
 
 static const char *aer_agent_string[] = {
-	"Receiver ID",
-	"Requester ID",
-	"Completer ID",
-	"Transmitter ID"
+	"Receiver",
+	"Requester",
+	"Completer",
+	"Transmitter"
 };
 
 #define aer_stats_dev_attr(name, stats_array, strings_array,		\
@@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	const char *level;
 
 	if (!info->status) {
-		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
 			aer_error_severity_string[info->severity]);
 		goto out;
 	}
-- 
2.25.1


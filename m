Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4526D4219DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:19:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZrH0s20z2xYS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:19:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ek2T9nV9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ek2T9nV9; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMcr39Sgz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:53:32 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id h3so5956891pgb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pG3mj4bKDd7l8ZFqHwjB1MgvpFgzE+2HiTROeiz4Dcw=;
 b=Ek2T9nV9gQ8EWW8JDLZtRMeCCS4iAzWtRhmGo7yHHo6WzIsUsiRDuBFkc0ZL2A5JwW
 wqYVIeN9ulfTvKJ5+EwL6nPlknmGh4JtbLi6Ql6q0xXPRK8kx1YgBD9LxXlEFQdVRtGC
 mUqtbcO01o3VDHKhrV323LAhW1CTqF81ywr28vwBzxElPYywwVh2i5n8LVlx4EwggwuC
 Qs2khDcDwteSaxo+vdGhUTks5JzBz3Y66YemKDinonJC6aTl6GHzaz0IRMYBAvt5G/6h
 lcf5R8jJSc9rB4cmZdV53j6lHJaYjFDcjzfiI2OOzsrNW20KlPVXTVaa1/KH7AoiJamr
 aScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pG3mj4bKDd7l8ZFqHwjB1MgvpFgzE+2HiTROeiz4Dcw=;
 b=WSMbepnwG2KETl0Pb0WH3Eo+OEVkcVndhYY0DkiWS+Y4UoTjpIUHkH5uziUglpVdZr
 E7bFpYoE4FSkBapMpiVKf+FPgIzLmLHl//U9xfM/k2iWb14gcwNo0qLzVqgPuVjE7ee3
 CDzTEFsHBdAlaYRzArKoos/XdoZCYnSTN6HhETPp6G+gosL3Ucs84lnuMLlmT9W5c7c5
 L210i+nWme9NAwf5dKsCCkDnMSWAomes5ZXfYNpy7aWFYcSjCsBbdJFV93Her0DsCxh3
 mr6d7TGR5/hBQoVNohjujhvs/KRmMqW0Z8QaZoU6UjWWUO52L9Q9JifC2jG6wHvdgZ5i
 egkA==
X-Gm-Message-State: AOAM531NvAcSh/0LMDrXdtDfGYEAs9z9xOMOzCUqk9bPPzI5MRQs/4VJ
 GyE9dl7YroDrbAQkliTNlgk=
X-Google-Smtp-Source: ABdhPJyvIHilOe5lS9NntuhffkTCHZ//p5UWlaai74QhVdLHck17Mlcj4MWEODyY2W6dSYUSaLrhfA==
X-Received: by 2002:a65:6389:: with SMTP id h9mr11100114pgv.83.1633355609139; 
 Mon, 04 Oct 2021 06:53:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:28 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 1/8] PCI/AER: Remove ID from aer_agent_string[]
Date: Mon,  4 Oct 2021 19:22:36 +0530
Message-Id: <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before 010caed4ccb6 ("PCI/AER: Decode Error Source RequesterID")
the AER error logs looked like:

  pcieport 0000:00:03.0: AER: Corrected error received: id=0018
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, id=0018 (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
the "id" field was removed from the AER error logs, so currently AER
logs look like:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

The second line in the above logs prints "(Receiver ID)", even when
there is no "id" in the log line. This is confusing.

Remove the "ID" from the aer_agent_string[]. The error logs will
look as follows (Sample from dummy error injected by aer-inject):

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


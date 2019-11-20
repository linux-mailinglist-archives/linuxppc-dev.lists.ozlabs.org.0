Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35901031C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:50:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnHM6Lq5zDqpC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qr7lrTFW"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWY2rY9zDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:49 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id h27so12497672pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqsuI+IqIXjog8o4iaGRNjE/y0GnVq6BrJwMMJG41Ds=;
 b=Qr7lrTFWh+tljk6uCLIv8AIhD8ClnVJAtmeY3Uafm1BF3G9LOuciLzWMtEPo/9L3y/
 HiR7QPtbscCrIzs9xuIkza113Sm0MBCCze8h57Ydy30B/j0Md0O+7JOTVN+YHe1RrK9g
 s6VLSHSbEJKWmCExGHuJ5yCQ8AkzZOa1A/PRBjWDagaxvbPVYhEcILr/caqYdswlF+rk
 RY/0tO0WP5snjY+CNhCAoRGMM9OkgUBIvYM3uB8+1qjoxfPHafSU8GUOdfDNUkEa3YGe
 9BYi7w86wKxUb2txbEI1kzsyvxKNvjkd3o24dVq8LA2oinqFVdP3m6EznNuR6ho9OFRJ
 AfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqsuI+IqIXjog8o4iaGRNjE/y0GnVq6BrJwMMJG41Ds=;
 b=mgVAdjkrbMs9D+EGP9Zpz88uP0mXGASfof+TWfSk0G9LUuKx3KeMrsbfpbn00l6Dmx
 my3ongUkZZbqxYHK7ul8U9RnPJLksP8/ZXHI3nzqNj7B5U+ZpJI5oH8/tROh0SwuYoFY
 YBOdFl7f1tU4SQaxol3NYFMiLd2ibV5StxdlrbLlFmI0gFsc9s2kH0uBmwhiFBpRFOz8
 ZV16L6v9esrdfl8nRfj5USZJcs3dw6iEAqUCgC6SRbL9giUvhqEGMT70dXXmdGq8YcKw
 O42P+1RAR5WCds041AyezUM3JdK6NZO6Y96vitYcBRp9GUw5VLs1boJCevn1ETJ6MAyn
 XX3w==
X-Gm-Message-State: APjAAAWRNmNiZNTWGxq5x+S+xYjHF2OorZVHvanbmIKEEDZX8rw7tRWH
 gYQ23E0ex/MdZsBAs8dRvRweL6VY
X-Google-Smtp-Source: APXvYqz5c1Ly6OORYf6NF9EBj+NOEDS2xFrhtWoJOu4tfbUlIGN0eRPgz49xfoZtqt9QYbzQX/HxYg==
X-Received: by 2002:a62:38d8:: with SMTP id f207mr738851pfa.209.1574213447122; 
 Tue, 19 Nov 2019 17:30:47 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:46 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 40/46] powernv/npu: Don't drop refcount when looking up GPU
 pci_devs
Date: Wed, 20 Nov 2019 12:28:53 +1100
Message-Id: <20191120012859.23300-41-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The comment here implies that we don't need to take a ref to the pci_dev
because the ioda_pe will always have one. This implies that the current
expection is that the pci_dev for an NPU device will *never* be torn
down since the ioda_pe having a ref to the device will prevent the
release function from being called.

In other words, the desired behaviour here appears to be leaking a ref.

Nice!

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 72d3749da02c..2eb6e6d45a98 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -28,15 +28,10 @@ static struct pci_dev *get_pci_dev(struct device_node *dn)
 			break;
 
 	/*
-	 * pci_get_domain_bus_and_slot() increased the reference count of
-	 * the PCI device, but callers don't need that actually as the PE
-	 * already holds a reference to the device. Since callers aren't
-	 * aware of the reference count change, call pci_dev_put() now to
-	 * avoid leaks.
+	 * NB: for_each_pci_dev() elevates the pci_dev refcount.
+	 * Caller is responsible for dropping the ref when it's
+	 * finished with it.
 	 */
-	if (pdev)
-		pci_dev_put(pdev);
-
 	return pdev;
 }
 
-- 
2.21.0


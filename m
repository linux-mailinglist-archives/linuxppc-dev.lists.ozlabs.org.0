Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC91031D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 04:01:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnXH5KF8zDqcL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LX/pRLm8"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWp5DhHzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:31:02 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q13so13347475pff.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2C0JWQmRvseosXGXzkaURoa7ehBtXNilHtvqRK9Jjxg=;
 b=LX/pRLm8dk2Y3RlRSy8pdnj5ocTBzkMGXP5PfMKjlakN3D8zBb/jRKB+h7kUmPMQQQ
 SQptub7AJNmTtIN5kABK3eVB0BgeFg4RavbD5itv+2NBXJaSXPB7gtxC9hXPiPvsAyRR
 7LM6ITM9nNy4eOmAX2US7ff1LM4k14vC2oXTvDVhWPtHPPQkp4EaIj8m+Gn/yW+eFYdM
 vY9w48M46djaFDPgV0vypXOMlYK1j/qLKFIl9UBDQ+Hj7T+S3UvZ9V0d3MIVzKAA8izz
 WVdumLx3vbrcEVnylV+NGVvAOrDtXB9hl43VPyr7DYmsUOuDtilG4HUG1hosSB33OwuI
 YH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2C0JWQmRvseosXGXzkaURoa7ehBtXNilHtvqRK9Jjxg=;
 b=V1PyaOMhvCQhAWH22pzTnCdp8LhMExyPdBjcfL4gPrQwvQdtaYpNZ97zodwldAuH8c
 k3sYTObef7f6Yn/nwMtLTDSEerCt5gT2hVV2FRPWdWLYL9EiWzHvrtyjiYvajIMFWkUc
 KALeXfeJNUlk1VU1Wq68DEb/kECyrEyPa4A2TnFcB4iaZBMd1hzu4DE0p3arBFBW2sQ0
 fBW8e1hY5tqO1+iDyA45sEMkdzWWVsf2iOLpS/7Q5f8rD6SxbG1o4QuObYeNTCfhCt7o
 UHQ4doQSzdjI1JopTPsAVwjto/zyUx2gZb1hI6qFF+fnp7gtEAthL/vDQgQNf/ozrP94
 4FeQ==
X-Gm-Message-State: APjAAAWGqYRVtjpzW96ZwQFfguIT0ruc1U1Rlqs1Q+uyxADELdjFBJRX
 Agv619O7FX8Qb3XekPIAALrX49y3
X-Google-Smtp-Source: APXvYqywm9MezI4F/j1nUQdvStrrtzA3Uu2sNVtlZY6X+5XWJ/BNAhsGcf3ewaIA0uqcxNQvWAZk0g==
X-Received: by 2002:a63:e316:: with SMTP id f22mr191873pgh.102.1574213460592; 
 Tue, 19 Nov 2019 17:31:00 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:31:00 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 46/46] HACK: prevent pdn's from being created
Date: Wed, 20 Nov 2019 12:28:59 +1100
Message-Id: <20191120012859.23300-47-oohall@gmail.com>
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

Not-Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/pci_dn.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index f790a8d06f50..0e05c1d7633a 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -289,6 +289,9 @@ struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
 	struct eeh_dev *edev;
 #endif
 
+	pr_err("skipping adding pdn for %pOF\n", dn);
+	return NULL;
+
 	pdn = kzalloc(sizeof(*pdn), GFP_KERNEL);
 	if (pdn == NULL)
 		return NULL;
-- 
2.21.0


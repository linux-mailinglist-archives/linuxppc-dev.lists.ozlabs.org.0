Return-Path: <linuxppc-dev+bounces-8692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DBFABC9EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 23:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1WHJ6yBwz3bYG;
	Tue, 20 May 2025 07:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747690636;
	cv=none; b=E42SiXtA7kYG53dpFPo6f1dtZvUYtLdrjcDgcVCIssYkVK5h5OkE3rRz+Q3aHBwwUKshTMjTGx1sNabSJOrBGZbvpq+iZezShtGmBTtfj6P3b7hsYOMZSjpDMtUSuGzSbjQfLL37okWNUL6kLke2n/vzUZ+B2TUKOs2Q1k0PrksnL2XvNm0aYHhSw5mUDAtrCDa14ylTeuCBJ54JSmO3cAAZM+lfJ/mk8ezGWl+mC3P7PBjLGCwmmcQxm5cVpsVQdv0hQv3egiJQP1MsEN7ddTYrzUo6ZYfNmSUWn+LrXL4BIU0uo/d3lJmhyqXsjJaEpbL6R1Ti9AMBMp0V5YWRDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747690636; c=relaxed/relaxed;
	bh=LUK0eWX7dr8omlEbgYUs13/ipUNhyzl6+g1k2OPj+a0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8MflonFORJjgrPFLzFmGRXT2PqImzEDdJYRdWf0luzRvOBlZhjxxYyH4/7jeSCvKDUTWrmkAUpVe8cm/MZZ/0qAQBZSuWacj/n6LvCNFPFoDdqgG9zFKdmlG5taLLmX7tLzCa/JWAn2UFDlIg0XC3aiHyERXsPYVV0HktqaIgvBYv1Z2tLb6EPLxlZ18i+VnqLtWN3aVqaAuiAfxnoy5bp3T6MV1d9rdbug7T/TE0DLsR2AcfwYwkApV0bs9zZ5GADz7P2fz8PWgDUJ0FiH9IZbfvpOlZfY4tCNNGpo3cTZy39iiiOjb+Z8k+ijrut/bSrNAtqruaj4Ih0daQ/BuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0WtaEvg; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0WtaEvg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1WHJ3n37z30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 07:37:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B353A629F0;
	Mon, 19 May 2025 21:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447FAC4CEE9;
	Mon, 19 May 2025 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747690634;
	bh=909bKlpGXpejs6alzRrtkNNoVbidxfjnR8RhC93JgX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0WtaEvgXAzOSk9iDG8i/BZrjzO6AGUdr9aPPpLa2T8Ze5lwku1J0lo6iD8vdJcIy
	 beoRBdYA6S0glwT3cdvYmet34cpc5K0od22JQ0ScSeDnVipX1eYOoy4F/gv8RKi9Ui
	 3wAUHYsd6CGCc36udQz7WFL8Me+OvicF9x+5I7CQLfrE8ukBB7oqEN1EjH4uY5asSG
	 vQbCO8kxhiUNJZ7OwSpryzBcebvWZTu6O7sOWwxgWillMZwAjNURM+0TpG4HUIWiMo
	 Hueh7xZWZ0WBB47iYJWQnPKbmpdpOjoTLwDeKvg08CCfsHqhCSaeHIb/OckfveUeNQ
	 SXDn+SHgtYp0w==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>,
	Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 15/16] PCI/AER: Add ratelimits to PCI AER Documentation
Date: Mon, 19 May 2025 16:35:57 -0500
Message-ID: <20250519213603.1257897-16-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519213603.1257897-1-helgaas@kernel.org>
References: <20250519213603.1257897-1-helgaas@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jon Pan-Doh <pandoh@google.com>

Add ratelimits section for rationale and defaults.

Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
 Documentation/PCI/pcieaer-howto.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index f013f3b27c82..896d2a232a90 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -85,6 +85,17 @@ In the example, 'Requester ID' means the ID of the device that sent
 the error message to the Root Port. Please refer to PCIe specs for other
 fields.
 
+AER Ratelimits
+--------------
+
+Since error messages can be generated for each transaction, we may see
+large volumes of errors reported. To prevent spammy devices from flooding
+the console/stalling execution, messages are throttled by device and error
+type (correctable vs. uncorrectable).
+
+AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
+DEFAULT_RATELIMIT_INTERVAL (5 seconds).
+
 AER Statistics / Counters
 -------------------------
 
-- 
2.43.0



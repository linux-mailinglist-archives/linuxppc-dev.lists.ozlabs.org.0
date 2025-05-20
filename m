Return-Path: <linuxppc-dev+bounces-8789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7665ABE66B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b27Y26mSmz3c57;
	Wed, 21 May 2025 07:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747777878;
	cv=none; b=PI9skxvITTcYZrl9PSCdPReYiSp2MXV6b9XgTXvkiMF6cZKgM6ZM7X+E3Qo7E5JHABOmMJgpd1mcZaZacDa4Cpl4yR2vwS9gBgoSvAQRorlX/zasxeEk2hcjsht2yvIiWi2tdDaP+UW+PtYhr9eMc9yL5H8M0ZEQPHMuMRec+tPWw4D7qWbjvONR5zBJfBNqScKscczntzQ52uXJlY/KAmJmsAEyg/1etcbQvkhZizmyqOUTwwq/aQGRlYlmsEy9O4oRbJWyJkWZAexAiyg3LRotnkTpB9K5/kKQj9CJKiANCnnc44YYIbYC8IgLisGK0ziocQkaPX/Wzcy9XgYjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747777878; c=relaxed/relaxed;
	bh=9ZJLDNdcWc8xq3gVvE/IfJiD1VxAq2/1sYQ6n/JvB/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=of/WfZrMBy8cQg+xbwZ+1CsX1mWrmD0wrg9aqmaSr8x9o6BxNb4CADWm2Oax4rPr6gubmUVjyNl/uKXsTpiQv4I2WsWmQl8Kp62vJedM581/dd+OYAbowETZ2in+4DDA7OCDyWEFOKKPQ2Y7lYelEcj/lMD+6s3RAcIlyKAFYWbhwQFyU2f2wqLgrxCvTSNiBx5+F6nuNtjoJw1MATgkzbeOeUhaNluUPNI6hjRjp1Yq3vUMw1zW5zMt/E46vdXBs/SaZISm2yxytOuzdqhNkSUPOO9qMMAF1AaMbjMQ1ujg5IDFcEurr3aGD5O86hOTe2Pcq100i021xo5cDSXrtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oQ+UUhc1; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oQ+UUhc1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b27Y23VL0z3c2t
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:51:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9F789A4EF0B;
	Tue, 20 May 2025 21:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8EBC4CEE9;
	Tue, 20 May 2025 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747777876;
	bh=vGxhmnnQMOoDk57ET4tcLt0Mo9fvIzE4nqwWsOgS15g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQ+UUhc16ctu9jd/RKklHzZ4tIDsOC0RQIU2iFmhql03I1hZ+F2O3um5Ji8DBqcUO
	 mSnTPGZzGSVTHSb8YTkf4spLiZ0nZQQ1O/qvTaDX7Cjq88gHpqYuZSicYWAtoBPJ1H
	 o3hBMPPyu/72VdDAT0Q7UtGr9bDwJwuvA8oE5MakCFBYPTRr1P/eSOnv8ICgU2Dl9F
	 8dKYl7rzX9TaYvWZwTEoG9F1nUlx4n2diFYMmTJj2NctkUzvjlVje8JnQu9E0gAS8a
	 CIwKwZfsD2bajUjV7mcFywVRKT+pBSwaOeEY7OuzGnmYgXuk2FtjGgJf2y8N3l+x65
	 3U2hTnqTJjMRg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
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
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [PATCH v7 16/17] PCI/AER: Add ratelimits to PCI AER Documentation
Date: Tue, 20 May 2025 16:50:33 -0500
Message-ID: <20250520215047.1350603-17-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520215047.1350603-1-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jon Pan-Doh <pandoh@google.com>

Add ratelimits section for rationale and defaults.

[bhelgaas: note fatal errors are not ratelimited]
Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
Signed-off-by: Jon Pan-Doh <pandoh@google.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
---
 Documentation/PCI/pcieaer-howto.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index f013f3b27c82..6fb31516fff1 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -85,6 +85,18 @@ In the example, 'Requester ID' means the ID of the device that sent
 the error message to the Root Port. Please refer to PCIe specs for other
 fields.
 
+AER Ratelimits
+--------------
+
+Since error messages can be generated for each transaction, we may see
+large volumes of errors reported. To prevent spammy devices from flooding
+the console/stalling execution, messages are throttled by device and error
+type (correctable vs. non-fatal uncorrectable).  Fatal errors, including
+DPC errors, are not ratelimited.
+
+AER uses the default ratelimit of DEFAULT_RATELIMIT_BURST (10 events) over
+DEFAULT_RATELIMIT_INTERVAL (5 seconds).
+
 AER Statistics / Counters
 -------------------------
 
-- 
2.43.0



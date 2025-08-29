Return-Path: <linuxppc-dev+bounces-11467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0369B3B431
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 09:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCqY562lxz2xnM;
	Fri, 29 Aug 2025 17:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5fcc:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756452313;
	cv=none; b=Mtb7tXPv8mFE2i40Ujc+YqcrrDv/FA2+vrKDnR9azYXHjuaQqOY6sDcmxf0YVTMMjpPMi9Jz8WQis1FTdcAIDksTyKg3KDSoUtE6Ux7gWhFPiCpUh1HSP+jq/ZOtz+Ej/maOcGK8+URwbEtofCIHPyEgdvkyGYMJmRnNOHyJ326WmZlQKQpJWVqYjYFkd1RFEtiNN2EQivMvD2lZ3Ul6+Qkrt3Gaertmvl/HIpSXj6SanHGDw7O46lMBHrDs8/KDCKmfxlsAqXoj1vvSW1mJ2qSzpd+rTuyY8aZYWRzlQE4kU576auO5K3Vz77RHrM7I++cn7fo+RP7H8gY0MeQA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756452313; c=relaxed/relaxed;
	bh=/uqlPSRNvqvYtA65cB66ilunbiKPmNvoURn+IcPqrcc=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=UwRf7Uxe9cj8Uqp/annchsT8MToQd1c1tGzxx6YKL58aiIZUJSBEr19f6ydDF1pPz9ZL9iV5UjEtkW1ffPWwNECGF9QxQ0nKmbX65pkjc7Dv9pTA1pu2b71AK1JsFi2vewsFJC5PxxiNShOrVxQNoPx3/nVXSN/aCzfao78ruQk1OOFeefufrGiyivRq8ZQiWH8DrNJesn2J+tCtr8Gdfe5Tzbq7endsIh7N15kqTMqRzHvWWH2Bn896avuK3xomRz3CxM3LCLP0gh6UN7aA44/sKKXlOMTkbeprb/4ymu5yhEdmWiO2/gZiKj8jCdi25X/2TaFZcwAcCqf98QJ2Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cCqY41x8Mz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 17:25:09 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with UTF8SMTPS id 0731018C47;
	Fri, 29 Aug 2025 09:25:04 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id D091A600AD9B;
	Fri, 29 Aug 2025 09:25:03 +0200 (CEST)
X-Mailbox-Line: From 3d6f5aa8634bd4d13f28b7ec6b1b8d8d474e3c69 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1756451884.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Fri, 29 Aug 2025 09:25:00 +0200
Subject: [PATCH 0/4] PCI: Update error recovery documentation
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
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The documentation on PCIe Advanced Error Reporting hasn't kept up with
code changes over the years.  This series seeks to remedy as many issues
as I could find.

Previous commits touching the documentation either prefixed the subject
with "Documentation: PCI:" or (when combined with code changes) "PCI/AER:"
or "PCI/ERR:".  I chose the latter for brevity and to avoid mentioning
"documentation" or "PCI" twice in the subject.  If anyone objects or
finds other mistakes in these patches, please let me know.  Thanks!

Lukas Wunner (4):
  PCI/AER: Sync documentation with code
  PCI/ERR: Sync documentation with code
  PCI/ERR: Amend documentation with DPC and AER specifics
  PCI/ERR: Tidy documentation's PCIe nomenclature

 Documentation/PCI/pci-error-recovery.rst | 42 +++++++++---
 Documentation/PCI/pcieaer-howto.rst      | 81 +++++++++++-------------
 2 files changed, 71 insertions(+), 52 deletions(-)

-- 
2.47.2



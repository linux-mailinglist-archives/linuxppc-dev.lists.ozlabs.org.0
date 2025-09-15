Return-Path: <linuxppc-dev+bounces-12224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C937DB57DE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 15:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQRJj4c10z3dSg;
	Mon, 15 Sep 2025 23:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ee9:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757944277;
	cv=none; b=cZpF4tZG+EmwQdfx1vin3tJ+mVth6M/1eBMleiEWyDU4zO54ThUadgQUkcM8GiNSVv1oUq124XylRft71+alw74e71ecpvRWKTMkrlNnElxpJYUqnnYf3HgsfFAEGBcZNHWSj0mO3vBHQ1SypI/M30FX6YX25PNRaY8+49Vu2PgoUfRmpjhbUNDlUVpQwmZ2zCenFlVmRuKw3NeS3nhJLZhQW8yZIrDspa4u2C34ENnwyJpxlj6P74WdpFvclUMG2JYP7Tn/pjrcWXtkzkl3dyog+yr9w4M35svGlP5rxlc5rAX/oXgVesitkl6ggx+bOqtFhojEBwGNHlsbqRJCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757944277; c=relaxed/relaxed;
	bh=YI75/yJ2NRzvMJ8ZlavynT7wJJkxSlm+9ZCXl/quHBc=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=cX3qsPlUs638Ac1rnr89sRpkUX7IfTzFlwKJHA4GBPR89Yqs6sJvmKQIKqcOhZo19aoSoJpBadJg8IIXnUEneQ6EqJmr3YdxWSH+O6xNbFNnIJoj9UQQlGMjlKW9XM4wK3G5zjA5cbiloYEJNcST5QlD2hSfLvBFtAd+DArpEcsmriPLPiQXXkCl4fVJqwScfCqNV5/mIuCVX44FgZz/oep1S5F9E3pncyHywladgc2/XZPg+ueMFfIsREjrrsiqGna9muJAAlCdax6oqkMdXGmTCor98cQfeCbHF5o6bBMIxaKRgBF3FYWh5IBpI29tuVy2NciqU66GfDmv8dTKfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cQRJh416Fz3dRK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 23:51:16 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with UTF8SMTPS id EBA2C2C1E640;
	Mon, 15 Sep 2025 15:51:02 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id CB93461248BC;
	Mon, 15 Sep 2025 15:51:02 +0200 (CEST)
X-Mailbox-Line: From db56b7ef12043f709a04ce67c1d1e102ab5f4e19 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1757942121.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 15 Sep 2025 15:50:00 +0200
Subject: [PATCH v2 0/4] Documentation: PCI: Update error recovery docs
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

Fix deviations between the code and the documentation on
PCIe Advanced Error Reporting.  Add minor clarifications
and make a few small cleanups.

Changes v1 -> v2:
* In all patches, change subject prefix to "Documentation: PCI: ".
* In patch [3/4], mention s390 alongside powerpc (Niklas).

Link to v1:
https://lore.kernel.org/all/cover.1756451884.git.lukas@wunner.de/

Lukas Wunner (4):
  Documentation: PCI: Sync AER doc with code
  Documentation: PCI: Sync error recovery doc with code
  Documentation: PCI: Amend error recovery doc with DPC/AER specifics
  Documentation: PCI: Tidy error recovery doc's PCIe nomenclature

 Documentation/PCI/pci-error-recovery.rst | 43 ++++++++++---
 Documentation/PCI/pcieaer-howto.rst      | 81 +++++++++++-------------
 2 files changed, 72 insertions(+), 52 deletions(-)

-- 
2.51.0



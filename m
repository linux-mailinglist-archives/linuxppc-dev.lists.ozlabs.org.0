Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6374E231
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 01:22:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bIL6XKUt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0KmC1lNvz3byy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 09:22:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bIL6XKUt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0KlH0fbPz30PN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:21:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5767361259;
	Mon, 10 Jul 2023 23:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897F3C433C7;
	Mon, 10 Jul 2023 23:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689031302;
	bh=0ZZzAlML7PigSYIRwkyWGmOeNW5UQGLxmRIiOlnen3o=;
	h=From:To:Cc:Subject:Date:From;
	b=bIL6XKUt8RG31HcS15ahZRfdOQmvVbNkmtd2+Cx3ezDsVLDdgPBiJuF9+YEVlfea5
	 VzI4BSqQaVNU+uatKjMcOXzW/rCiNI87ipZJw6EyWooMDB/lRO5BxFjDQuMjyT+UDd
	 /KJM7qXX42KlIIUtjwU2w4bhaPtYL/gjsi4kFJII4jqalchP/2BA56dToHdqrY60Xx
	 14XdoZ0+6mO5P1H+xDjUcirb5LWlMTsq5O10a9XIXPGr8SFsj/BE5PMvu7SNWHTWmr
	 vs0igRzgiAjyG98DMzT7raGU+8qDsqcg+WuqDRDqYg5UX9j3mCJ0tyozp5xB4oz1Py
	 S8RpdFcFwOZGA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 0/2] PCI/AER: Remove/unexport error reporting enable/disable
Date: Mon, 10 Jul 2023 18:21:34 -0500
Message-Id: <20230710232136.233034-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

pci_disable_pcie_error_reporting() is unused; remove it.
pci_enable_pcie_error_reporting() is used only inside aer.c; make it
static.

Bjorn Helgaas (2):
  PCI/AER: Drop unused pci_disable_pcie_error_reporting()
  PCI/AER: Unexport pci_enable_pcie_error_reporting()

 drivers/pci/pcie/aer.c | 15 +--------------
 include/linux/aer.h    | 11 -----------
 2 files changed, 1 insertion(+), 25 deletions(-)

-- 
2.34.1


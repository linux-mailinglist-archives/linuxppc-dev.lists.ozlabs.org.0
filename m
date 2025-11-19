Return-Path: <linuxppc-dev+bounces-14335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AF5C6D88D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:56:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFhf684mz3bk0;
	Wed, 19 Nov 2025 19:56:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:150:2161:1:b009:f23e:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763542594;
	cv=none; b=QxHrOQJ9y1XkVNaiaKiaARtpI5Ciz/o2uR03WIgsYIpmW6NDo9Eg5QHDJfTzEWgN0o/+dNdXtaIJV5wAF94MBF6tKoaUdoW1xDro8wTddZZk9KxADzlXFZa4J7YcMTQXBoO8eGq/BXa9LEdBKLRC/can4iJIk7/XPXBk9xhmRAle3lCuncDmEXXnjhPtNn6YlRUK7hicflkZPKXeBzp3jcKD3O9e5bFJ2XfM+iBv1Y56J3mhW2xkeoLL034aoSEifOlT3EG1xiFal/HMh4F5Vn3xfUq6PLc5euwO+pLv3F2rlO6/9PFauK5BDB9YeTAVOcZErSX6rTIsf2VGcDL6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763542594; c=relaxed/relaxed;
	bh=lUtUzN2cHCgTAFsZ/kkLI81ref7qovRR4ewH7A427Zg=;
	h=Message-ID:From:Date:Subject:To:Cc; b=FgTv/mSWwLARI5uc4S8Pu2SovADI7iVeqb8owd4NVE2WhvslMiS76OhhiuOFSr+4SipJm7RvAhjezcLHWG5Uv9mg25XpOCsChj/Upooug8XYhYkE/OfJ9ZctwyJ1/KKOErE/u7rDCzG5UVQC+tqXJ5Q1BBwuWLta16Vg0iI4NrPz6iRUEaPNuRYvhCAFodRJo2eAOj/UQYSX4+dd0E7reQUcVkL+lq9gKa4QB9mvkRM9EuFwHz+NMchsIoH9inIuDo17z15KYhCM+Kl6ZRwSD2SF7kS7stuy10wKjwx199P5p+UR4AIuMK5Kx6NV4PonI6IreVs00uo1LcGB8fmUbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 325 seconds by postgrey-1.37 at boromir; Wed, 19 Nov 2025 19:56:33 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBFhd1Lllz3bdW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:56:33 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id CC9BB2C000A8;
	Wed, 19 Nov 2025 09:50:52 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9A023D56F; Wed, 19 Nov 2025 09:50:52 +0100 (CET)
Message-ID: <cover.1763483367.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 19 Nov 2025 09:50:00 +0100
Subject: [PATCH v2 0/3] PCI: Universal error recoverability of devices
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

This series intends to replace commit 1dc302f7fccc ("PCI: Ensure error
recoverability at all times") on the pci/err topic branch:

https://git.kernel.org/pci/pci/c/1dc302f7fccc

The commit is assigning "dev->state_saved = false" in pci_bus_add_device()
and during review there were requests to explain the assignment more
clearly in a code comment.

However the assignment is (only) necessitated by missing assignments in
pci_legacy_suspend() and pci_pm_freeze(), so I propose to instead add
*those* assignments (patch [1/3]) and thus avoid the need for the
assignment in pci_bus_add_device(), together with its code comment.

Furthermore the commit is *removing* an assignment in pci_device_add().
I am separating that out to new patch [2/3].

So patch [3/3] is identical to the commit, but without the addition
of an assignment in pci_bus_add_device() and without the removal
of an assignment in pci_device_add().

I am looking into improving the documentation on pci_save_state()
in a separate series.

Lukas Wunner (3):
  PCI/PM: Reinstate clearing state_saved in legacy and !pm codepaths
  PCI/PM: Stop needlessly clearing state_saved on enumeration and thaw
  PCI/ERR: Ensure error recoverability at all times

 drivers/pci/bus.c        | 3 +++
 drivers/pci/pci-driver.c | 6 ++++--
 drivers/pci/pci.c        | 3 ---
 drivers/pci/probe.c      | 2 --
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.51.0



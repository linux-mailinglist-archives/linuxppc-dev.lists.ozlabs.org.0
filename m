Return-Path: <linuxppc-dev+bounces-12914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F1BDE5AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 13:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmqNy4fhDz3d3Q;
	Wed, 15 Oct 2025 22:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760529522;
	cv=none; b=L+3DBkkW+Pt4lXsW8mZQW13Hwum5dIK0NnjHUNlvTIb0Jx9yfZ6nHxyIJIRYDLobDIedZvV6mRhtq9tv+mI0UVbFoZvRIm91nYlyyk5UXmPHQHBZ/i5jQ9h1TdZxtF0S5P1sJUEHNTwbpSM+E82+zBH0i4WXheGcY6SWUTZAwBFDJlbMohBv4Q1GNG45ugoTqchNuQfy6z/CrmFFb9R6ex9eqMLV2kiqM6BzO44irAlHTBmKgoss3Z5yFgFEZyZ9qiThu1vVEZzYOBdLleS7ugMdKd4TCu02qKV61OgDFXRzIYRuoml+KpHv8NX6tbUVDXuKxdhi+sUx1hLUPCj4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760529522; c=relaxed/relaxed;
	bh=ngVr3I5DRzSRPzPhih29gyOv5iZlq1zTKbFNqj3H/O8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4nzYU83bYQIqiafbyzmkKCzgtcqg8olnZSGcLoviKVv+ABX8Brjm7G20LslakFCxNoBsIdXdeoBMQGyHL+X6tD7yyuZGRI5uoc4hSneOpSPZz77Vs9cAdSdm7js7j9PzMSek/FQCLjHCl20FULv0FEwVyPZ6e5mjV8daEn+52xR7nFt4TDIn7BWEoA+VACja6O6DDxaxbyIO9/XacvSB7WkcUGSWEsWLlM+lZ/ovsRAZquPedFVvA6ifnkZLxFCor9nRQY9YoJZFlCEeoOKL3zY37segMhkE8WKMzfmxpqyAUOzcUoh/lrz+KWjuvYgRB+ZBBKKkXQP41+kEiJOIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zS8CtYcS; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zS8CtYcS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmqNx15Dtz3d2w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 22:58:39 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DE4C1A13D1;
	Wed, 15 Oct 2025 11:58:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E548606F9;
	Wed, 15 Oct 2025 11:58:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 656D8102F22B7;
	Wed, 15 Oct 2025 13:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760529515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ngVr3I5DRzSRPzPhih29gyOv5iZlq1zTKbFNqj3H/O8=;
	b=zS8CtYcSo0bjbwx88TkAQ99cfcIvGZQbM4CbIednNRLwO9OL7ks9kvDpW8Bbh8iDMAH5Db
	2Sm4312Nqs2oUmYuJzY0649MCmQpksodMkK39tf/BNvljX2je8abxFIyIsH8l76uKoGKeK
	bUvENmKYw1OTZH3KvRG+U+TQt+aZUKf6I51EDVXqUDTfy56k8JqOnNu44IPowaKI9xYVG6
	G7kP+4CNdwUVmjR5lDgsuQXUctlLFvyZ1wg6uVS3VqIrrmS2cT0Ij4DZ4zKWxdMk0ZqA8E
	Q7lbjOcE0v2AKjzCrDboRnFUIrnFp5KQjX/o6lkSzTvAYpW4rBtwH9+KekzUPg==
Date: Wed, 15 Oct 2025 13:58:11 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, linux-pci@vger.kernel.org, mad skateman
 <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian
 Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>,
 debian-powerpc@lists.debian.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251015135811.58b22331@bootlin.com>
In-Reply-To: <A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
References: <20251015101304.3ec03e6b@bootlin.com>
	<A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christian,

On Wed, 15 Oct 2025 13:30:44 +0200
Christian Zigotzky <chzigotzky@xenosoft.de> wrote:

> Hello Herve,
> 
> > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > 
> > ﻿Hi All,
> > 
> > I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > ClockPM and ASPM states for devicetree platforms")  
> 
> Thanks for reporting.
> 
> > 
> > Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > an the quirk also fixes the timing issue.  
> 
> Where have you added quirk_disable_aspm_all?

--- 8< ---
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..a3808ab6e92e 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
+static void quirk_disable_aspm_all(struct pci_dev *dev)
+{
+       pci_info(dev, "Disabling ASPM\n");
+       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
+}
+
+/* LAN966x PCI board */
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, quirk_disable_aspm_all);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this
--- 8< ---

Best regards,
Hervé


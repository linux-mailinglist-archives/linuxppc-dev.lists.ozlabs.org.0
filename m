Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD960D608
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 23:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxl8Q6rzGz3cHg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 08:15:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fWGyOa7T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=fWGyOa7T;
	dkim-atps=neutral
X-Greylist: delayed 511 seconds by postgrey-1.36 at boromir; Wed, 26 Oct 2022 08:14:31 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxl7W6NX5z2xjr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 08:14:31 +1100 (AEDT)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C52CED3E4B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 21:06:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 396DF20002;
	Tue, 25 Oct 2022 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666731941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuNweShXWaeC97qVfm6xoS1jF6hfC9NTAzy5bUMmmMM=;
	b=fWGyOa7Tw0o5Qhw4WPi/wDNzNlVBhDJwbC3BHULtLEVLKk1XZuhRDel58Fy7iFoXJ069Zt
	BlonTxfg6bnASdGS79Z822zYFFaHQMpsfzSIEd6E0W04QVgsleCcc0Wm2f1Z8gAQUe1xyL
	3H+lyPQrlj2+9wMJKPFrujm4Fq5eHC865XftuIQKzI9O9BOwqZOTQuLXZLq1CiUzS/zMUf
	rac13aDaqidRXccnNHDzA9bz0VybWXYkR30Qqe2oYVlmDR9i8fS1OtCaqhDHwgtmd5BGl+
	suRyGuze0D3AcB///F8/GqZ7FF7JYjpxXXRYpy3pOTlP4c6KmxJ9vSHsDTJ4RA==
Date: Tue, 25 Oct 2022 23:05:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 3/4] PCI: mvebu: Include <linux/irqdomain.h>
 explicitly
Message-ID: <20221025230534.290a5809@windsurf>
In-Reply-To: <20221025185147.665365-4-helgaas@kernel.org>
References: <20221025185147.665365-1-helgaas@kernel.org>
	<20221025185147.665365-4-helgaas@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott Branden <sbranden@
 broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Oct 2022 13:51:46 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> pci-mvebu.c uses irq_domain_add_linear() and related interfaces but relies
> on <linux/irqdomain.h> but doesn't include it directly; it relies on the
> fact that <linux/of_irq.h> includes it.
> 
> Include <linux/irqdomain.h> directly to remove this implicit dependency.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/pci-mvebu.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

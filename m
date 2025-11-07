Return-Path: <linuxppc-dev+bounces-13919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F9C3EA01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 07:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2q5D13hwz3btC;
	Fri,  7 Nov 2025 17:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762497216;
	cv=none; b=bLF/jj2JGTmRn8RiRNZKIYISzkO2xIZ5n20ED2G2m0e6mobX3cuWZi+R9Yhvk5AnjYxdOypWMiEkBW9FeUGd8jaIfEjecUJSNtDW9m4kOcl3L/3z2J4d5CCHiJam+dnJSUJcgoIJzcpqch476qgRp2pmo/X55C/y7pR6clD4vQWImQjYRLRqZfT7s5mrYbAr8L1AHtGPjqgqH5CIvhTkRemYxZDEvXhLQQ96OhVe4usL4KcXrrXPubHXXf0ltzPllwHpvdiHDWh6hMtcuL+29A1d9xWcjzwIUqscGyFusF3zTYi9VyJ49xCooXEG4rEWHE1X8s9B5cC+Xn7/xVs5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762497216; c=relaxed/relaxed;
	bh=gjhNdhbX09NImVbFe6Szl845BIzLIYmjAsrq60zVgOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoCrUNOCVw9qPeR7CLn+Mb9A3U2/gPUO+l0Aw2EtKBWwXA5ubB9cGq8n4wX7qyEzWhlcFIen271n9abtBkN9Z5xeqGA/a0N+icoSVgfNnbAIQnWzN9KQ4morvIPTh9DoGRTDR5fOTCUs54ZP94nVRkasVK+JF+KFMbI8PyatpWGFj0Dzw4ERbnWoWu2lb+3r8MyHUnqiaiCz9SzKMklhwjVrFeNUlBuHT7KhlBI6XFrblm4d5nLu4gdn/jgU2oxV8naRC2+tPSY2tn1zzLUtOQFamPKejzGKrI3ChHeZDn1dERXRhQEJrHDyv2AwPajMpNh2IfkO1r2VynfyxzHGmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2q5C2cNTz3bsN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 17:33:34 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 15FDC2C06414;
	Fri,  7 Nov 2025 07:33:31 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0B73549A; Fri,  7 Nov 2025 07:33:31 +0100 (CET)
Date: Fri, 7 Nov 2025 07:33:31 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/2] PCI/ASPM: Allow quirks to avoid L0s and L1
Message-ID: <aQ2Su6wp5DWlkEgb@wunner.de>
References: <20251106183643.1963801-1-helgaas@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106183643.1963801-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 12:36:37PM -0600, Bjorn Helgaas wrote:
> L1 PM Substates and Clock PM in particular are a problem because they
> depend on CLKREQ# and sometimes device-specific configuration, and none of
> this is discoverable in a generic way.

According to PCIe r7.0 sec 7.5.3.7, the "Enable Clock Power Management"
bit is "applicable only for Upstream Ports and with form factors that
support a Clock Request (CLKREQ#) mechanism".

Thus, if BIOS has set the "Enable Clock Power Management" bit
on a Downstream Port, we can infer that CLKREQ# is supported.

Thanks,

Lukas


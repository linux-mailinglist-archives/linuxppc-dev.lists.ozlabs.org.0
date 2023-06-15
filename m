Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3E731210
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 10:23:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qa3eBkRp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhb0q6YScz3bkD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 18:23:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qa3eBkRp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhZzz1CHMz302Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 18:23:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34C7462828;
	Thu, 15 Jun 2023 08:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA3DC433C8;
	Thu, 15 Jun 2023 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686817388;
	bh=oKnnEN/3/0K5S/IpaxAfeYE2ONcRBKAWQT5d6KIBaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qa3eBkRpoPV5/zSaZAhXK77OULHOsalfQeVCwd9BXonl+gc1Eh/BVABziJfkUv+nx
	 1QZCLtWPDLV4T9J6qSo2hwl8ZNyfnFx4JLKCcFyBU0XYyLnQS2DRByurPNr6vj/0aB
	 37DNzEHyEbvVpzm34seGCJiESvBlG5o0xjP/k0EV9WwzQCUYssPzd4uo4Hj9dewCbm
	 LZrb385bG2vFYQGFmZxljKrKBxFCznEo4bCCH3T7Fsa1pBc+D6+fKbHWLZPzpYaF75
	 OKBUz7WapFMrtuJqkZzC3EzMQGiGds6vkozCptg7uUUMO1hRebRkXgaL+o6YX88MON
	 ZHuaYQ7DSiMCw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Thu, 15 Jun 2023 10:23:01 +0200
Message-Id: <168681736632.249392.2955088102759301523.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515151049.2797105-1-Frank.Li@nxp.com>
References: <20230515151049.2797105-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: imx@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 May 2023 11:10:49 -0400, Frank Li wrote:
> Layerscape has PME interrupt, which can be used as linkup notifier.
> Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
> when linkup detected.
> 
> 

Applied to controller/endpoint, thanks!

[1/1] PCI: layerscape: Add the endpoint linkup notifier support
      https://git.kernel.org/pci/pci/c/71d9ca28015c

Thanks,
Lorenzo

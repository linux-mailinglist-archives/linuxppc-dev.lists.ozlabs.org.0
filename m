Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E257C0098
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 17:45:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teHIhOEA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4gG70LqMz3c5Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 02:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=teHIhOEA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4gFH33GKz2yW2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 02:44:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 098D6CE1092;
	Tue, 10 Oct 2023 15:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F010CC433C7;
	Tue, 10 Oct 2023 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696952671;
	bh=Ysfj3tASnZsm0LsPvesZ/F3r/9kf+qCznBqcA1tmt0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=teHIhOEADPw4Mu/kF5qYr134rDmns9sAynWZn4m6LlcWTj1XaJBPCvRuk+8Xe4uAO
	 F3/DgVQKJ+aQmVBmel5AUlK3C3LWsLae/ATnIt7l3rJLNbhf7otdcOYZITPBWoU55j
	 7LCDyqJ03imKInjGjZJayKH+7nvVHX36kB8/tKbXv+tG6aIkCVdDDYBMjofHJT9nfT
	 Wf0XY55TllvBBhebpzw8S7mYpBkthznN9e+MmLEXIU/ppT6ACmuC6kGxjDTgmOztwf
	 5V8+lzH0U/Vy+Yaf9cifVyjVojkWlkzblK88hTiWcXwmaBcZ7T7eLlvOGvFr+sCrOT
	 nDImDWEhQXZyA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: hch@infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Date: Tue, 10 Oct 2023 17:44:23 +0200
Message-Id: <169695244699.95067.12901655371819245761.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230926140445.3855365-1-Frank.Li@nxp.com>
References: <20230926140445.3855365-1-Frank.Li@nxp.com>
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, christophe.jaillet@wanadoo.fr, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 Sep 2023 10:04:45 -0400, Frank Li wrote:
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> 
> 

Read this:
https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com

Find the issue with the commit log (that I fixed).

This does not apply to v6.6-rc1 so I tweaked it,
check that everything is OK please.

Applied to controller/layerscape, thanks!

[1/1] PCI: layerscape-ep: set 64-bit DMA mask
      https://git.kernel.org/pci/pci/c/81ef01bc5934

Thanks,
Lorenzo

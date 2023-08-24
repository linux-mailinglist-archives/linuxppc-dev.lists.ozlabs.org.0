Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AB7869D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:15:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DROKImgg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbVz4YbRz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:15:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DROKImgg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbV253hwz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:14:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D6EE62832;
	Thu, 24 Aug 2023 08:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7716C433C8;
	Thu, 24 Aug 2023 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692864886;
	bh=1Tn6vKJJFKlBGjG8QtuFgkvRlH6W9nCtGYntwAHYyns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DROKImggRM845E0c2tdxVMg6dQJUjn+LhQAhJJ6H+ovC9cECv7K+wabfNVTnZMcrF
	 ykqTm4Iagwnm95y7fivs0qr4lx5z2D6Q8QgQZguyOqttsovsbX+Zcpn096NxV6j09X
	 L3miw0LeHd8LR5qQ662RwztEWxVHwegyw/QOS3WWAnvC3D9JYP4NdXS1I0WKPXjMCI
	 Zz/kQ9D4wDiKM8/MK+N0jI83eTeToNcPipI6OVPL0HV/xIR93RrR097wkdm1k1tyqx
	 vX9EG42PHo3pbBDe4l/1w2lpreaiz860nnpxYySWCJo2AnxJMUooLYn/DomglZvLZy
	 M+VOS3t7+uTOA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: frank.li@nxp.com,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down notification
Date: Thu, 24 Aug 2023 10:14:38 +0200
Message-Id: <169286486358.59705.3375218028619595727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720135834.1977616-1-Frank.Li@nxp.com>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
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
Cc: robh@kernel.org, imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, markus.elfring@web.de, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, Zhiqiang.Hou@nxp.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jul 2023 09:58:33 -0400, Frank Li wrote:
> Add support to pass Link down notification to Endpoint function driver
> so that the LINK_DOWN event can be processed by the function.
> 
> 

Applied to controller/layerscape, thanks!

[1/2] PCI: layerscape: Add support for Link down notification
      https://git.kernel.org/pci/pci/c/d28c0d84ca40
[2/2] PCI: layerscape: Add the workaround for lost link capabilities during reset.
      https://git.kernel.org/pci/pci/c/17cf8661ee0f

Thanks,
Lorenzo

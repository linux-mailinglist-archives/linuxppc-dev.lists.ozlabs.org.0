Return-Path: <linuxppc-dev+bounces-8435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BCAAF48B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNmC3fkFz3089;
	Thu,  8 May 2025 17:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688747;
	cv=none; b=bCDCQuAKiE0OsNvxEH7ePwGdb4SVFEZ4ZBnjCo2EVQX2SHkR9NLab1GH/fietD6B5oK91LNL6KmIzkKBwm5jaqUyAqT/aYsDyFuQuAa1xzVL0M+h0g313wQvaKsn1fJyQUzkJvhmvvnmWHfyy+d1B45YYBgppljX1WtnxswALUgAjg/5DkfWirkY9Xlolk+rW2lv2cxpBIDrseXIoycOfBx1ozjSjMCLv33dh4aPetLSCGDc0x062DFnKbDjTwcoifwYetjuYgMk8Jy/HjoVTAfSdcYqnHbQVOZxnNdpdF4SAtHJQN914MN29xyBFAe/rLiC6zIzwN6lseF+4T9CKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688747; c=relaxed/relaxed;
	bh=Xyksvq/un7NeztXrAHApIvxEOzekyWzlS8JtLs62uPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnnWn2AfJI9MTja4SPWXUOYHua0ydH/ATNF5TZ+87OVpdoebU4O7Kf9o+xXw9NBkA7XnSLkeIPtczxGNPy2gYkQ4BvvlyYVaP9CLZqPZZp4qr4m38Kilg5LWUkRlRWHSjDm+aRNSTu/vMUCKKGsJhoG1ecwHFC5WuEbUZDEhs1FCfKQ7jMpOdc9AtJGi6x4+oTOsO/buBgGhuj1eQiDbmKgf30GwED5DIHP4fx/DVtLAEKg0udY4hG45z2q30Z3Xb4WVjnjxwLp8ArRu2y1T9JOlRKF/qHLwxL9x19NcLfzH+9jz6a5nju/ztCuwb2YSKU5yoS0Q7Cz2h7g/GzGGWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNmB2wpdz305n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:19:06 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 348912C00160;
	Thu,  8 May 2025 09:18:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F0654178299; Thu,  8 May 2025 09:18:55 +0200 (CEST)
Date: Thu, 8 May 2025 09:18:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kw@linux.com>, Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>, Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
Message-ID: <aBxa3wItVo4iIKT_@wunner.de>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
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
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 12:40:31PM +0530, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Lukas Wunner <lukas@wunner.de>


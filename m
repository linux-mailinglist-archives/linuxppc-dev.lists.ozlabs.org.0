Return-Path: <linuxppc-dev+bounces-15252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFBCF3125
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlB3q3DQhz2ySC;
	Mon, 05 Jan 2026 21:53:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767610407;
	cv=none; b=gUOM0mL7tDb/nzH7LEWjCwkWEQL3sJbsZ7ekJxxKA+jX9nGqRnkb53rMowz6LEtZKUdaxsW6cJ151vgx8qKqTSn3O8UqtpFVzm6cjKgX4XlDpTJ5z61Qo3YtidtrPWy6CJNb2Qem+DYXSeV5i0Fnk2gvP032s8zeZyOub02j7i6HWqq4QGquK/6E2eAQpOTOzxfmM0SkoDX4XQARI+2VB1UK29h97o4fsk4GxOd/GG3u/2Sl7B/CpdRb2UFVmO6NOaVDN97YLtWw/GfUWiKqvmK/qL5BTG/huOnzPQ18Q6YFqA+lVO53TlZTAszUmUefRmfOBA4vUjNuPGKdyZ1AWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767610407; c=relaxed/relaxed;
	bh=+KKS/oIWerUwd9TAnCurwEcjkTyGGqLXTkWrxIrfO3Q=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=obwCqwSBEjUe2RigHm5TefBMkAF5Zcc3SixRN8mXZxITjim13DT3i2wMKlATgkcG5uGzR5QO3Mue2t2C4hucY+lLxwsj8b5ytzRpVnZR6XGnX4lmB2DiA1xdmCAOkyRTgISI/En32RxlckEJu/K/KJ6usnq5K0BvlvIL1rUhJTVeVycpQ+NjJF9HaIQDkZjSmf1HqylhCH7KTj/CJnLqry25y3E6j2O2u4VSNrNrn0Ddoz24w+rfclxZ66KzqPhmLo5f1QtvUQV3vj3J0CvHdK1T8xXbItBv5U7L9FqRTJjNlc/xM4geDrfFQ9tUrjcNE24amF7wBkdgRIA/Fo0scQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlB3p4802z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:53:24 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9fb4yvKzHnH7p;
	Mon,  5 Jan 2026 18:35:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B4AB540565;
	Mon,  5 Jan 2026 18:35:05 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:35:04 +0000
Date: Mon, 5 Jan 2026 10:35:02 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?UTF-8?Q?Roh?=
 =?UTF-8?Q?=C3=A1r?= <pali@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
	<linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/3] PCI: mvebu: Simplify with scoped for each OF child
 loop
Message-ID: <20260105103502.00002efe@huawei.com>
In-Reply-To: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri,  2 Jan 2026 13:49:01 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Hi Krzysztof,

Drive by review.  Your changes are functionally equivalent and lgtm.
However, I am curious at whether the lack of reference count for child
when stashed in port->dn (and then used in the for loop) is a potential
issue.

Jonathan

> ---
>  drivers/pci/controller/pci-mvebu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
> index a72aa57591c0..4d3c97b62fe0 100644
> --- a/drivers/pci/controller/pci-mvebu.c
> +++ b/drivers/pci/controller/pci-mvebu.c
> @@ -1452,7 +1452,6 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  	struct mvebu_pcie *pcie;
>  	struct pci_host_bridge *bridge;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *child;
>  	int num, i, ret;
>  
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(struct mvebu_pcie));
> @@ -1474,16 +1473,14 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		struct mvebu_pcie_port *port = &pcie->ports[i];
>  
>  		ret = mvebu_pcie_parse_port(pcie, port, child);
> -		if (ret < 0) {
> -			of_node_put(child);
> +		if (ret < 0)
>  			return ret;
> -		} else if (ret == 0) {
> +		else if (ret == 0)
>  			continue;
> -		}
>  
>  		port->dn = child;
>  		i++;
> @@ -1493,6 +1490,7 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
>  	for (i = 0; i < pcie->nports; i++) {
>  		struct mvebu_pcie_port *port = &pcie->ports[i];
>  		int irq = port->intx_irq;
> +		struct device_node *child;
>  
>  		child = port->dn;
>  		if (!child)



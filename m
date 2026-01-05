Return-Path: <linuxppc-dev+bounces-15247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6146CF300A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 11:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl9h33fhNz2yHD;
	Mon, 05 Jan 2026 21:36:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767609379;
	cv=none; b=QVD/B/UEk+LohMkedEvlyijOgfj2L+E9kt1LMytCT15CMpgwit76ttSr+1gM2uVPZ7FlVO9jmMkHvBlgXL8tZbcUbpsDiIfSo1IoNWoC3s7yh4e739BPc3+2fe8VE6vW/X803f8KzHBOjLpO5zQqK2Wk9JgzyASX+kDvsrOUJmm8DiFmBfDgwlTgbYgiS4uWVdnSmVSc6ehoAkdfSzZM3vhVhKDUyQ5CxHCTrOyLBT9DDcSo7oaPEcmVgCm7xRduR+rp0lTB+hbf3/wOga/uKtIBv1fIxHWfcu3nVmgf1+p2R3aXV2skIIFQViT7iWBZu97fugzsvq/5shVqDSxHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767609379; c=relaxed/relaxed;
	bh=SUMJp2MwlSAyE8trIJFUgdegQl5OGt6hp8S/A6I+zUg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4xfI3guIoFeC/9E23xIOoxqUp8seZeDaO+Cdl8eI7zOLO9w0jSWqikiOYI4FMoeCnrwQ9PevD5gbRltPOapsMvPfRsYvO28wVcBm3IeBF0O1TiiVT+uBdb6Z9Tn2c45/3KtNQwLNZ0+fkg8XGkR84rKLV3FJLQWTyyTg0yrrb6k6to211TVTIkZpM+dp3Bri5r6tyMZr0CThc4wx4Ub1Y+6Bz04ntDwyTj+7cz0GY5lwI9YoHRi5oD4WpZK49qGg9/joRTszDf4fsfRStESQ2tfqnfrMrBzSkDgpj0ENF45HSTRPAT0y8RiH07kGpBcZx23owCepRveyb9SClJg0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 05 Jan 2026 21:36:18 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl9h23Yh9z2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 21:36:18 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9fp080yzJ46jg;
	Mon,  5 Jan 2026 18:35:14 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3CC8C40086;
	Mon,  5 Jan 2026 18:36:14 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:36:13 +0000
Date: Mon, 5 Jan 2026 10:36:11 +0000
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
Subject: Re: [PATCH 2/3] PCI: pnv_php: Simplify with scoped for each OF
 child loop
Message-ID: <20260105103611.0000788f@huawei.com>
In-Reply-To: <20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124900.64528-4-krzysztof.kozlowski@oss.qualcomm.com>
	<20260102124900.64528-5-krzysztof.kozlowski@oss.qualcomm.com>
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

On Fri,  2 Jan 2026 13:49:02 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index c5345bff9a55..0d80bee284e0 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
>  static int pnv_php_populate_changeset(struct of_changeset *ocs,
>  				      struct device_node *dn)
>  {
> -	struct device_node *child;
> -	int ret = 0;
> +	int ret;
>  
> -	for_each_child_of_node(dn, child) {
> +	for_each_child_of_node_scoped(dn, child) {
>  		ret = of_changeset_attach_node(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  
>  		ret = pnv_php_populate_changeset(ocs, child);
> -		if (ret) {
> -			of_node_put(child);
> -			break;
> -		}
> +		if (ret)
> +			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)



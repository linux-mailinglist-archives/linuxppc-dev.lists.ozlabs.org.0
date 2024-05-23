Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id ECE848CD13E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 13:31:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JQLKM0vm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlQpB2Dq8z78t0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 21:25:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JQLKM0vm;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlQnW0f2Kz3vZm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 21:25:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716463503;
	bh=xz5HmwISGE6JPRBQj3ZIbQI4h9QCSU4QHSIcfScVatg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JQLKM0vmOL055TJl+XXGRzzbmUvRLCww8tlf6nddVcsrtzh+WvpCorTP+wKrHCjgk
	 CKPEjguPEXgyQ6lX9w4lfTqTk3GV3lUWMf7zFzz4NZGRmNiXA8pfbq6nSKdmi1+rcF
	 9fjamtltw2z0Y4NHnL94nwlifGqvjyUNaBOdZgz18tmOsxobeguHV6rUnuHuunbaAO
	 G5JdBc6IAQrt+8Bgdbh10jDHGwpcIkcsUmeJYJB+bkyv7BbIAXdR/XucRU/Do9Ivh/
	 /sa8oFuB6ITwLPSXlbch2gfXNjws6fkbLdLZUXxe+VpOgJ4f2w73grRTKIydwQvOET
	 3jaBF9LmQY4xA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlQnV2GSdz4wb0;
	Thu, 23 May 2024 21:25:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>, akpm@linux-foundation.org
Subject: Re: [PATCH next] arch: powerpc: platforms: Remove unnecessary call
 to of_node_get
In-Reply-To: <20240522194250.1165568-1-pvkumar5749404@gmail.com>
References: <20240522194250.1165568-1-pvkumar5749404@gmail.com>
Date: Thu, 23 May 2024 21:25:01 +1000
Message-ID: <87h6eo3h4i.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>, javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, julia.lawall@inria.fr, npiggin@gmail.com, skhan@linuxfoundation.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prabhav Kumar Vaish <pvkumar5749404@gmail.com> writes:
> `dev->of_node` has a pointer to device node, of_node_get call seems
> unnecessary.

Sorry but it is necessary.

> Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
> ---
>  arch/powerpc/platforms/cell/iommu.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
> index 4cd9c0de22c2..5b794ce08689 100644
> --- a/arch/powerpc/platforms/cell/iommu.c
> +++ b/arch/powerpc/platforms/cell/iommu.c
> @@ -780,14 +780,13 @@ static int __init cell_iommu_init_disabled(void)
>  static u64 cell_iommu_get_fixed_address(struct device *dev)
>  {
>  	u64 cpu_addr, size, best_size, dev_addr = OF_BAD_ADDR;
> -	struct device_node *np;
> +	struct device_node *np = dev->of_node;
>  	const u32 *ranges = NULL;
>  	int i, len, best, naddr, nsize, pna, range_size;
>  
>  	/* We can be called for platform devices that have no of_node */
> -	np = of_node_get(dev->of_node);
>  	if (!np)
> -		goto out;
> +		return dev_addr;
>  
>  	while (1) {
>  		naddr = of_n_addr_cells(np);

		nsize = of_n_size_cells(np);
		np = of_get_next_parent(np);
		if (!np)
			break;

of_get_next_parent() drops the reference of the node passed to it (np).

So if you actually tested your patch you should see a recount underflow.

cheers

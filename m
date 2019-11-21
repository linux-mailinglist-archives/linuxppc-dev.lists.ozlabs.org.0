Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E7D104DF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:31:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JXpZ1PVQzDqGc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b88e8c106c1fb0af7a00+5933+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="XhMJ5MMR"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JWx11llRzDr0C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 18:52:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Pwb2FmkdHEYylRXn44G40uY/L0PIupA3T2COf2+uiM=; b=XhMJ5MMRZKJCujjCFhjSZbJpq
 VMBJSQo+tVybFNi+fTGjcfNAlnZCIc/nuse8w6VXgALn2aEG9Pbz+SGcovz4ndtfeJ79wZkK7ahk8
 PLrgLdtOR7PnfVBC7H9Ndg3jt3UV95/BBsMmamsLQ3TxXqgqN+Wa2hl+Fd0O8FA1fSLcxghPaSRF0
 lc1H9/3ED2yPlHqUv/kQ9I1P81+enrHkozwoIkC3s4nMeG8zCBSNWc/vCI1F+awi/YR5cze65WfOw
 /PAngKyyv8m1g9U5AToHob4A1QobaeLqTH5/KozvZlk7I5BXdgDmmbcvmptXqffGCaysDOA/yKYrf
 3JpoTuTzA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iXhFz-0003KR-Os; Thu, 21 Nov 2019 07:52:03 +0000
Date: Wed, 20 Nov 2019 23:52:03 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [Very RFC 31/46] powernv/pci: Remove open-coded PE lookup in
 pnv_pci_ioda_dma_dev_setup()
Message-ID: <20191121075203.GD17209@infradead.org>
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-32-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120012859.23300-32-oohall@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 20, 2019 at 12:28:44PM +1100, Oliver O'Halloran wrote:
> Use the helper to look up the pnv_ioda_pe for the device we're configuring DMA
> for. In the VF case there's no need set pdn->pe_number since nothing looks at
> it any more.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index d4b5ee926222..98d858999a2d 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1709,10 +1709,9 @@ int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  
>  static void pnv_pci_ioda_dma_dev_setup(struct pnv_phb *phb, struct pci_dev *pdev)
>  {
> -	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> -	pe = &phb->ioda.pe_array[pdn->pe_number];
> +	pe = pnv_ioda_get_pe(pdev);

Nit: why not move the pe initialization to the line declaring the
variable?

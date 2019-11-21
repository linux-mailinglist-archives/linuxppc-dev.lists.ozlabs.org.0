Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF6104DD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:26:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JXhx3cHGzDq9J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:26:41 +1100 (AEDT)
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
 header.b="WVfaiJEc"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JWpm6KwqzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 18:46:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ0fg0rJK/V6zqITW1vi5dkZIVpB4VhGqFI3dCTjli4=; b=WVfaiJEc/WaMGzUij9n6rdGO4
 AEXaJxH0fjF+sOr6oPKe0su/n3DJl1hU64ZIU9UhjlUZKDn9pwnO1E16nuVJ7W1AAAH9/UhiIheUx
 FiOj5/7Z4hi4qRx2l8ZWekkWdlt8Va+BoVNUIdXXRMxtOSqgVfQUm3AOkNkCDrWGi2UD1EEU+uPtz
 MQaQszkmWMpkV3Ul1Lmcaeys55gOSOcB3587IJB2rcmrLjLwbNDdh214RbMdNTZQoWjlPsxkmg6vp
 jlMG0urC8MiJuYWd/JDU+xnNT8iW0mOlg9ajiMu3tX+2bupBoB1IOJBqRe0YRTVyPCmCTJgq1qnBG
 +f+zEliXA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iXhAj-0001Yi-Ke; Thu, 21 Nov 2019 07:46:37 +0000
Date: Wed, 20 Nov 2019 23:46:37 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [Very RFC 04/46] powernv/pci: Move dma_{dev|bus}_setup into
 pci-ioda.c
Message-ID: <20191121074637.GB17209@infradead.org>
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-5-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120012859.23300-5-oohall@gmail.com>
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

> +#ifdef CONFIG_PCI_IOV
> +	struct pnv_ioda_pe *pe;
> +
> +	/* Fix the VF pdn PE number */
> +	if (pdev->is_virtfn) {
> +		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> +			if (pe->rid == ((pdev->bus->number << 8) |
> +			    (pdev->devfn & 0xff))) {
> +				pe->pdev = pdev;
> +				break;
> +			}
> +		}
> +	}
> +#endif /* CONFIG_PCI_IOV */

It would be nice to split this into a helper.  And I think using
IS_ENABLED we might not even need ifdefs:

static void pnv_pci_dma_fixup_vfs(struct pci_dev *pdev)
{
	struct pnv_ioda_pe *pe;

	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
		if (pe->rid ==
		    ((pdev->bus->number << 8) | (pdev->devfn & 0xff))) {
			pe->pdev = pdev;
			break;
	}
}


...

	if (IS_ENABLED(CONFIG_PCI_IOV) && pdev->is_virtfn)
		pnv_pci_dma_fixup_vfs(pdev);
		

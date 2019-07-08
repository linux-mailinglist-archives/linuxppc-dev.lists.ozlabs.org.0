Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3F62C06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 00:44:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jL9h4b4NzDqSm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 08:44:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+84af0ccca5b63497293a+5797+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jL850jgQzDqPn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 08:43:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P9ZbarkRoC/k/pYpbYOrW10IaUGKSRYoo+klKaShKug=; b=MVvIJ0lMf7cHnUQYNbsF/VEmvR
 NLtRe1c48h03TG8/yInjrRI0IzX1fnObf45rLaWtBRcdZP2pg0Mc0QBJ3mKZp2oR1xzzxymfYvmsm
 AX2UOHJQpX7oWepvM9+QSEu9SJ30O8aL9HjYj65HRK5VJFnmchzLIzzZe07qaRrlwztD/0BzWB8uw
 pzvWazlzhrR1hrleYsDmqITD3Iuk/dOEmnHTJaLBvNRVsOE1yLad0tGDboOgxkEMQU7qi1r/mAi5x
 scmGgPxWAqrEakiCdXDvHlcjU+h91NoQ0Uy9E0Nejsw1VElIw+jXJyez5lJH8zhd5G0mkYoj1WtUQ
 c54NUMqw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hkcLg-0007cu-7m; Mon, 08 Jul 2019 22:43:04 +0000
Date: Mon, 8 Jul 2019 15:43:04 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v2] tpm: tpm_ibm_vtpm: Fix unallocated banks
Message-ID: <20190708224304.GA25838@infradead.org>
References: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
 <586c629b6d3c718f0c1585d77fe175fe007b27b1.camel@linux.intel.com>
 <1562624644.11461.66.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1562624644.11461.66.camel@linux.ibm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 08, 2019 at 06:24:04PM -0400, Mimi Zohar wrote:
> > static int tpm_get_pcr_allocation(struct tpm_chip *chip)
> > {
> > 	int rc;
> > 
> > 	rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
> >      	     tpm2_get_pcr_allocation(chip) :
> >      	     tpm1_get_pcr_allocation(chip);
> 
> > 
> > 	return rc > 0 ? -ENODEV : rc;
> > }
> > 
> > This addresses the issue that Stefan also pointed out. You have to
> > deal with the TPM error codes.
> 
> Hm, in the past I was told by Christoph not to use the ternary
> operator.  Have things changed?  Other than removing the comment, the
> only other difference is the return.

In the end it is a matter of personal preference, but I find the
quote version above using the ternary horribly obsfucated.

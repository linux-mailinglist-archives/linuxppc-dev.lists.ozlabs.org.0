Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55311CDB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 14:01:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YYnx2zgzzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 00:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+27c5b7719eecc710bb1c+5954+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="b39pNqg9"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YYgd5QgJzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 23:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v9w7ihWU15mTjgE/fFnHbc0kztIj65tTjqKpkCnN/0k=; b=b39pNqg9zh8RzNZhDGNnhMIrb
 1eVGJX4Gvc/v8cfTV8kDfOa5zMSAo63cQeCCuOurtL7066N53GvzW8h/4SPtmT1duDDNDFuiIWvTg
 pju1ILDc9p1YjJO04jMgW1e4EvhRK4Q8EZvdtF4eqmfcSh4IrzjXEBfagYMPO9Za1qZIMa9+p09Un
 jJBXlhPR3K5HxgnwSkc7eDFETP7V7JwEtg+H9DrplZM7TbpE8tBSWWBzJsh4d49Rj7jVV6XG8Ng/x
 nN5UXi8DrOkVR3mIFokcd7lGVLSbgHSqbruYP45HDWPq+wCh8rKLRx5pLNWgr60lw9sptVFB6guKR
 lYSPjP+sQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ifO0D-00047V-TQ; Thu, 12 Dec 2019 12:55:33 +0000
Date: Thu, 12 Dec 2019 04:55:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V2 04/13] powerpc/vas: Setup fault window per VAS instance
Message-ID: <20191212125533.GC3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862233.16318.21.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575862233.16318.21.camel@hbabu-laptop>
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 08, 2019 at 07:30:33PM -0800, Haren Myneni wrote:
> +static int vas_irq_fault_window_setup(struct vas_instance *vinst)
> +{
> +	int rc = 0;
> +
> +	rc = vas_setup_fault_window(vinst);
> +
> +	return rc;
> +}

No real need for the local variable here.

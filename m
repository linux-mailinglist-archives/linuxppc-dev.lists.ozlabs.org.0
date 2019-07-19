Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1746E128
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 08:48:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhRm0Sw6zDqcY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 16:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+0127b854950d050a2cef+5808+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhPL5WW4zDqpg;
 Fri, 19 Jul 2019 16:46:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dFnx5TzMMcoSpuOVSBkt3bk6kgdNjnFBeNAo17jg5Wk=; b=YPaurXaTajlIneAubMagzsXcC
 s7lRHW6bMmRz5vJoILwjx09X/rG2EhotoYUCEBkPgAPRvep7T9EL8rE9YqZx+lJqfB8dIDW6sgb/f
 5ekxC+GX1RAI38SYBVesXcaEU28iwSanRRpEj/Mj05pSBUI/SgcGybCGhG5k0jsC+sqHbDva5YziK
 mxIe/MvYIGBGZ1jnh1UCzMiQK0WxQFTvo5gFiJu5VkmN0vpIF61rDTSu940GxT4YvZ0Ag8KdzjBt9
 fHnRvSoZHZKlymeW/sRI+JzKkOFfxcda4Fh/aTFGeFCY27ywJsi/kGHel8I3FcBNjtHaD6m2WGCGJ
 +rqfCRqZQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hoMfB-0007eC-Mp; Fri, 19 Jul 2019 06:46:41 +0000
Date: Thu, 18 Jul 2019 23:46:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v5 1/7] kvmppc: HMM backend driver to manage pages of
 secure guest
Message-ID: <20190719064641.GA29238@infradead.org>
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-2-bharata@linux.ibm.com>
 <29e536f225036d2a93e653c56a961fcb@linux.vnet.ibm.com>
 <20190710134734.GB2873@ziepe.ca>
 <20190711050848.GB12321@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711050848.GB12321@in.ibm.com>
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, janani <janani@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 11, 2019 at 10:38:48AM +0530, Bharata B Rao wrote:
> Hmmm... I still find it in upstream, guess it will be removed soon?
> 
> I find the below commit in mmotm.

Please take a look at the latest hmm code in mainline, there have
also been other significant changes as well.

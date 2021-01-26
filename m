Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FD3036CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 07:45:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPy0d3FbwzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 17:45:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=XFJjQnlO; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPxy86dSQzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 17:43:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=XFJjQnlOmKPrpamUOymOwxeLZG
 nTEr98Y7kNW8QS5NHaW0kkQddRAz7PSPmxL1BCFZYqcJNmVKoJ8teXKWfyx4f40ItG0mruV2CyAGH
 BOWfEHlkBnTxTy2pdd/F79fQFpq92dPzOFmamckYfdzBf7viCXEBvVan0E7NvO4el4jaibngUVac5
 UdbkRLkdIdTutyOG5Dv+VM7xpSDv5u8qqGHfK09SHX7Ir38+s1trQuozDDKgoerCBfxnt08NiWL2o
 KdjcWatSfxwUNXhgtC3+Odn06CKkk1MDqSlnk+oiPoDbqxT0B1eOouyPg+lMvwrlWE/f3P1T+gmZ8
 cPzaRC5w==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l4I1j-005CI6-0T; Tue, 26 Jan 2021 06:40:59 +0000
Date: Tue, 26 Jan 2021 06:40:35 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 04/13] mm/ioremap: rename ioremap_*_range to
 vmap_*_range
Message-ID: <20210126064035.GA1236944@infradead.org>
References: <20210126044510.2491820-1-npiggin@gmail.com>
 <20210126044510.2491820-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126044510.2491820-5-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

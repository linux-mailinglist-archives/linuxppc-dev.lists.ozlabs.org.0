Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE08F6723E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 17:22:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lc9x47bbzDqxD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 01:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+957344792e76119913ac+5801+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="P+1zkLQU"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lc7j2q80zDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 01:20:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A98RIwMn+nGQFCpoIyLPqEezS1FPTC2pHqHY35SB5pU=; b=P+1zkLQUhrAFfaTtq9v6k1bZh
 FcM9tnh1rGbCglLDgXKKTrkg/NGSWXwfqrzLVi8p0leJwq59ZLS7tyKPDC0LrxffKTFhVRxXACstH
 Mc/4X+ZMnD9qiOmvyl/My5lpi/+VoHeu8sSGW72hRrNzIyowD8EulYlZ6JkAgg1O/nqQcl/dt+Q9n
 rBb+dJlxcDl5ZIF+FdwSxbnKO+/ZNULx6m1xA3vNC0ECzpAzu5/TWzeWtbODz6PVYBVtSfD6BloOs
 wMtZCd5yqeGX1vlSqD+DNNH/1XSSxG33Lp12jNhHHXDYAsmLmzKwoUCOQ0I01AHwZW0WjKmHaf4ZG
 UE+uJR6GA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hlxLp-0002DO-1T; Fri, 12 Jul 2019 15:20:45 +0000
Date: Fri, 12 Jul 2019 08:20:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 2/4] powerpc/iommu: Allow bypass-only for DMA
Message-ID: <20190712152044.GA3061@infradead.org>
References: <20190712094509.56695-1-aik@ozlabs.ru>
 <20190712094509.56695-3-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712094509.56695-3-aik@ozlabs.ru>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> This skips the 32bit DMA setup check if the bypass is can be selected.

That sentence does not parse.  I think you need to dop the "can be"
based on the actual patch.

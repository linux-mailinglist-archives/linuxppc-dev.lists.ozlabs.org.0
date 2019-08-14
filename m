Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7D8CBED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:32:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fs73v03zDqRM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:32:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="nNjq/9jK"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467fqH31tzzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:31:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4IdTV78FsPfI1DcGuq/VJWnEgDTS2/i20t6j7jbmAU=; b=nNjq/9jKjp3TgScQoIA0PaajSm
 I+nF/VZU+awFuii2M9QQmEYmpz7kFngpkeM+GMdGeNiXqwSOy02R7RkbYZ4+Re81TryuRXnS00Kk8
 BKE3VVZoV+5A2QyMl/MDMUDFaievGQuuCQq7FeEERHXM06pYBBewwzy8331i4uPsMf2UWMJm7K/qY
 Dnn3PvTeVN86yedN7DJFvbKL3jt7Ors/rJ7rv6JOJZug4XenViaHJlPhkfnZOxjvyqMaUZvq5FYfG
 BmA68PKRlXTGSa7X7ImXocXF7upPaH076Dw+nEOFTEl0oDyDirE9gzEzuH9j+TK4WAtl8hBcrG1Cq
 5HbZOoGA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxmo6-0003jz-0j; Wed, 14 Aug 2019 06:30:50 +0000
Date: Tue, 13 Aug 2019 23:30:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 10/10] powerpc/mm: refactor ioremap_range() and use
 ioremap_page_range()
Message-ID: <20190814063049.GA3981@infradead.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <bd784c8091cbf41231a862f73b52fd2a356ec8f1.1565726867.git.christophe.leroy@c-s.fr>
 <20190814054941.GC27497@infradead.org>
 <3f866bc8-7cc3-cb09-92f3-016dfb906526@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f866bc8-7cc3-cb09-92f3-016dfb906526@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Christoph Hellwig <hch@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 08:23:54AM +0200, Christophe Leroy wrote:
> Le 14/08/2019 à 07:49, Christoph Hellwig a écrit :
> > Somehow this series is missing a cover letter.
> > 
> > While you are touching all this "fun" can you also look into killing
> > __ioremap?  It seems to be a weird non-standard version of ioremap_prot
> > (probably predating ioremap_prot) that is missing a few lines of code
> > setting attributes that might not even be applicable for the two drivers
> > calling it.
> > 
> 
> ocm_init_node() [arch/powerpc/platforms/4xx/ocm.c] calls __ioremap() with
> _PAGE_EXEC set while ioremap_prot() clears _PAGE_EXEC

Indeed.  But I don't see anything marking this intentional.  Then again
the driver is entirely unused, so we might as well kill it off now.

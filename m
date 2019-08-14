Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B88CBCA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:16:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467fV72NdyzDqgG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:16:15 +1000 (AEST)
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
 header.b="XNTqUbcz"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467fS70PhkzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:14:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=44K07C207hP60aYqx/O6kvlLTyW56Ovhtuazmf91s3M=; b=XNTqUbczBcUcBbsb2phecwHjD
 /lGxXibOWPO99uMOTbuOoALJusaNcHor07dCMalkCClPs3nQt/P8CvClvz2yHRNX4jZwXF3D+om5T
 vB5pbbOJMSjhtIoVYDrnj3tQf+pOhrr8SDPfu4Z96z5i50/E9jiQ2Q+2uLpwgIkwVNH/AOCANk1H7
 CmOBRSMduJImu+WNej5byXvQHT/nhYc7ifGAGEMMtpK6Ob489BB07q5Q9YbJh16eQQseDdqPzRZU+
 nXjkTeROgopU8iLe44RqQC1qHEvtnpXAgFR9q96FXFTjN/yfjSEtQXPjF6XPwsHg1aBHfRiFsfM3I
 51ChTttGQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxmY8-0005Tu-P2; Wed, 14 Aug 2019 06:14:21 +0000
Date: Tue, 13 Aug 2019 23:14:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to
 bottom on PPC64 too.
Message-ID: <20190814061420.GA17453@infradead.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
 <20190814055525.GA12744@infradead.org>
 <1d44ec1d-339d-e22c-2133-175e0aa745f6@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d44ec1d-339d-e22c-2133-175e0aa745f6@c-s.fr>
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
Cc: Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 08:10:59AM +0200, Christophe Leroy wrote:
> > Note that while a few other architectures have a magic hack like powerpc
> > to make ioremap work before vmalloc, the normal practice would be
> > to explicitly use early_ioremap.  I guess your change is fine for now,
> > but it might make sense convert powerpc to the explicit early_ioremap
> > scheme as well.
> > 
> 
> I've been looking into early_ioremap(), but IIUC early_ioremap() is for
> ephemeral mappings only, it expects all early mappings to be gone at the end
> of init.

Yes.

> PPC installs definitive early mappings (for instance for PCI). How does that
> have to be handled ?

Good question, and no good answer.  I've just been looking at a generic
ioremap for simple architectures, and been finding all kinds of crap
and inconsistencies, and this is one of the things I noticed.

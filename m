Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B6DCA77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 18:11:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vrcx22j6zDqSP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 03:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+a41d4027e0bbc9b2ab1a+5899+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vrZ053M7zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 03:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZO4T3laCAFkLJNde78e3mOnKmGc7aiAK62njk4E0oo=; b=F91zrAlaRm0sYDs/QHsnqkU5j
 v6/E8OUC//BtIJmcEi/UGDnRtFTkYxAK14XNaAgtVRt36Fx6jGH9c7Dp4L9Um8VEecka5gypZouuB
 PZOGw/jCQmCIsXlEWN4sqFdDM1LLNlKJx+hDZUWssZEtRqZA3UngJ5/ngBZ+VczG4IbMWic2IGmoZ
 ndBdPYIgLJLen1TBM4xTbhL4gBf69bvMIHOJqC1YLiGdnMEhHlRAOdmFtQUwgsH/9zW+qCDw0C1K5
 KIGsPw4DgoOz1z+Rc1dgFP/HXJUr8IHrdbSWiSIhdynEKIdwqR5ZXZb7pZhu31LNItJqUMOy1gs7D
 6h0/FC/1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iLUo8-0007Tv-Ic; Fri, 18 Oct 2019 16:08:52 +0000
Date: Fri, 18 Oct 2019 09:08:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 4/7] soc: fsl: qe: replace spin_event_timeout by
 readx_poll_timeout_atomic
Message-ID: <20191018160852.GA13036@infradead.org>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191018125234.21825-5-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018125234.21825-5-linux@rasmusvillemoes.dk>
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
Cc: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 02:52:31PM +0200, Rasmus Villemoes wrote:
>  	/* wait for the QE_CR_FLG to clear */
> -	ret = spin_event_timeout((ioread32be(&qe_immr->cp.cecr) & QE_CR_FLG) == 0,
> -				 100, 0);
> -	/* On timeout (e.g. failure), the expression will be false (ret == 0),
> -	   otherwise it will be true (ret == 1). */
> +	ret = readx_poll_timeout_atomic(ioread32be, &qe_immr->cp.cecr, val, (val & QE_CR_FLG) == 0,

This creates an overly long line.

Btw, given how few users of spin_event_timeout we have it might be good
idea to just kill it entirely.

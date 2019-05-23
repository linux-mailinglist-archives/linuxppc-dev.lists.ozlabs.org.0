Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 301DF27764
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 09:48:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458hSq5bnwzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 17:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c417bddcefb42f015981+5751+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458hRN4m5CzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 17:47:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lsgHCa2vpCehpFETQiyNH/o7TEppcQLLkSY0AC+okiA=; b=rZj7TWxRADhac9Kvvt+/WDl6C
 bW6EfWL6kkFNW5mJuOaTXt7KeEjdw8yatC1AIV8E8Fk/iGOzC9/YduaBBOeV075273SM4j855TshK
 ochtlLTCj0BLyFLfQdxrONj6B7772aAOAulInHhxwyayetCdNyiYTD3WgKiLvocCoZ93fHsAfF2w+
 jLKzq5/74UJMRNsrMSMeROaCAzWZSw9YBGV/4xDfA/GNO0HGbnMey+PSEUIrFv1P4yvinPeZcxfNa
 PaB8Ka0MhGFKGoQuM6qj+oSpKH8caqD36jMtEpKVQerx7x1el4lLaHN5HJGWqstYpsdirnZ7r4e4G
 6wptVuhgQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hTiRC-0003v4-Sr; Thu, 23 May 2019 07:46:54 +0000
Date: Thu, 23 May 2019 00:46:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/powernv: fix variable "c" set but not used
Message-ID: <20190523074654.GA9873@infradead.org>
References: <20190523023141.2973-1-cai@lca.pw>
 <d0512822-ca22-75ec-3dd9-1024001632f5@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0512822-ca22-75ec-3dd9-1024001632f5@c-s.fr>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 09:26:53AM +0200, Christophe Leroy wrote:
> You are not fixing the problem, you are just hiding it.
> 
> If the result of __get_user() is unneeded, it means __get_user() is not the
> good function to use.
> 
> Should use fault_in_pages_readable() instead.

Also it is not just the variable that is unused, but that whole
function.  I'll resend my series to remote it in a bit.

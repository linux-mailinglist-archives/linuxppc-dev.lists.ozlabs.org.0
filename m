Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C011744E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 19:35:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WsM15myvzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 05:35:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WsK75xPQzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 05:33:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8zgmO8yIumpWTktN/WLnCjKv5dav9LhhmBQXS3TWUg8=; b=eNqP4p7owxWNWsbfq6onLxwlig
 lmiOYyGS8vCUjkzr+ed5MFL4EZw8QPfltFoMQAMkTBGeglMNlCLuOkhY9HqyAN4GSkY0Vgva0cjJh
 dmWKgQJXVQkyShp0GMPCz88nmEUCKdZIw7nghIelP7W3hYTXFI5RcPOmgPuyskrv8V8XxTaSPrVxg
 LrdyC0smjo6V5/ylW+B1b70NTBYQWYdajHbKZGXMMJ2827jh/pnwREcdhyW7upbnOzab/uwTty5dV
 MP3jnbgpGMQS4xifzcHuAgqGSySIt3EjNsS+HfsYY2ijlI/clx0qtibK0EJC9SjDZmwf9XRjOKTAi
 rvapDXwg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ieNqg-0000pS-2A; Mon, 09 Dec 2019 18:33:34 +0000
Date: Mon, 9 Dec 2019 10:33:33 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: add support for folded p4d page tables
Message-ID: <20191209183333.GG32169@bombadil.infradead.org>
References: <20191209150908.6207-1-rppt@kernel.org>
 <7f4c038d-e971-b61f-3d3a-60a5faddfc0a@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f4c038d-e971-b61f-3d3a-60a5faddfc0a@c-s.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 09, 2019 at 06:46:36PM +0100, Christophe Leroy wrote:
> 
> 
> Le 09/12/2019 à 16:09, Mike Rapoport a écrit :
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Implement primitives necessary for the 4th level folding, add walks of p4d
> > level where appropriate and replace 5level-fixup.h with pgtable-nop4d.h.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Tested on 8xx and 83xx, no problem observed (ie book3s/32 and nohash/32)
> 
> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Christophe

Did you add anything else to the next 1100 lines that you didn't bother
to snip?  I can't be arsed to scroll through them all looking.

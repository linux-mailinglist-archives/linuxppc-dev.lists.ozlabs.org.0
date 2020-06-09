Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA11F348D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:58:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1Dv5zrQzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:58:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+0efb7c18612ba92a370e+6134+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=MQcVtyML; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gznf306PzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:53:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WDJS0ySUVAw6kQtMQKzgwZm9RScbAWiEhZ1h+MXRv5g=; b=MQcVtyMLgKl+y6Gj+FAVgPDZJ6
 A05JWrb0/FYvd/P5bUzJ02U1p4VlG9s1fYtrgvhzlSCqDi9GfBZBvKM/fn4PhrIbK/Uz845Wgq3gk
 iEiduuys3OM/Ji81sNzehEpoh5TeFSGVQvLy5sV4bBlNr+cVBMbyrWxi+/LtR+TsTs0/3iDlJ48F7
 vWzLTn4lP72aMqDMBGbhEiQMxJwa2IrgBwAqn0R2LdU/IFhvUk2Hdyhu49aCijNsMxc0K8PnBuRPM
 qQ3pWiXnzAYWYWftPcO+L2fz0pz93APi4dyrefTkublCB4/dpvQ7xIW3V7EaNvuWHPVmBtaciqn9N
 d6IdJXFg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiXCK-0006fA-A0; Tue, 09 Jun 2020 05:53:20 +0000
Date: Mon, 8 Jun 2020 22:53:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kprobes: Use probe_address() to read instructions
Message-ID: <20200609055320.GA14237@infradead.org>
References: <7f24b5961a6839ff01df792816807f74ff236bf6.1582567319.git.christophe.leroy@c-s.fr>
 <159168034650.1381411.840854749818290996.b4-ty@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159168034650.1381411.840854749818290996.b4-ty@ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 03:28:38PM +1000, Michael Ellerman wrote:
> On Mon, 24 Feb 2020 18:02:10 +0000 (UTC), Christophe Leroy wrote:
> > In order to avoid Oopses, use probe_address() to read the
> > instruction at the address where the trap happened.
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc/kprobes: Use probe_address() to read instructions
>       https://git.kernel.org/powerpc/c/9ed5df69b79a22b40b20bc2132ba2495708b19c4

probe_addresss has been renamed to get_kernel_nofault in the -mm
queue that Andrew sent off to Linus last night.

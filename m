Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084A96F0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 03:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CrGy5v8WzDrFK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 11:51:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+8278da87f424520a76ac+5841+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="MQBLmHoe"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CrDv6SH5zDqhs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 11:49:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SGtyDfOk7ztf7e1zq8UPqa3xUIMnaYAeWahTWcEr7d4=; b=MQBLmHoexH6YgdK4vldQKz4da
 8RAZW2Yi8DxJxQAlpwgczYaEaHM1c41vT1AnkpoCnNqXbGnGTNghSk0fVikznf0kIEi0v+5N5r8g1
 /6oblkV7iXrJ3a45Axj84aDQZSNiq8kQRjY+HUCF8V1Py56nJy0hBCl9/lpFyn+yndcDaRZqJkzVt
 bIi8Pv29Kk3FsfaRxdzwIJpj8AfPIsMMPyFdhswi9/+xmIhUaAbFj+F5czW5zAlG2znKGKTxCbpT/
 UF3RHjXmL4RitId7QozMvfJ4mmRlqlKtKIA6x7b3LDsgzeXJblkyLmEfssdO0Km6aGAzq3az5/zkW
 SJ4UIFkeA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i0FkA-0003gm-R5; Wed, 21 Aug 2019 01:48:58 +0000
Date: Tue, 20 Aug 2019 18:48:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] btrfs: fix allocation of bitmap pages.
Message-ID: <20190821014858.GA9158@infradead.org>
References: <20190817074439.84C6C1056A3@localhost.localdomain>
 <20190819174600.GN24086@twin.jikos.cz>
 <20190820023031.GC9594@infradead.org>
 <6f99b73c-db8f-8135-b827-0a135734d7da@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f99b73c-db8f-8135-b827-0a135734d7da@suse.cz>
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
Cc: erhard_f@mailbox.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 stable@vger.kernel.org, dsterba@suse.cz, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 01:06:25PM +0200, Vlastimil Babka wrote:
> > The whole point of copy_page is to copy exactly one page and it makes
> > sense to assume that is aligned.  A sane memcpy would use the same
> > underlying primitives as well after checking they fit.  So I think the
> > prime issue here is btrfs' use of copy_page instead of memcpy.  The
> > secondary issue is slub fucking up alignments for no good reason.  We
> > just got bitten by that crap again in XFS as well :(
> 
> Meh, I should finally get back to https://lwn.net/Articles/787740/ right

Yes.  For now Dave came up with an idea for a workaround that will
be forward-compatible with that:

https://www.spinics.net/lists/linux-xfs/msg30521.html

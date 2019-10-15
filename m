Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E016D70B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 10:06:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sp0N4M8yzDqSP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 19:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+55b1b98096d206da203c+5896+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="UlavkiBd"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46snv64BbDzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:01:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hjKUVGeHNRInFeWaMu8pTCN9rukm3B6OsQ2Vm8GmAU=; b=UlavkiBd6rPMoW0IFuURQJ1kx
 9WRM7km8J3HgXlS7u5vUPz26XojTMb6mQI7F87eM1VqyLf9CDlFCyO7lj2Bhh+AFH3bAgDhz9uZ36
 whP86ZjdolPlSAjncJGy2Vd1MQPkYwbPSwCv+IEAYFqJUb/xUlGcPlkFnfcgI8HjhC9cULmQH0C+w
 XIU3XEAo2Bt6xRuZDLIJPhcXooEctcTSl1hb6Y0xpDChHNd+NkBY1XxR4zGybPe/JengqLRk1gjsb
 dnzPSC1VKeKnpmREm0ekUmXPkzSFegGtXo0d/ITCJexJPP2rliZmpCcMsdnaMBKE5VJF9wLEnjvTk
 X26WLowrQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iKHlu-0002K4-7C; Tue, 15 Oct 2019 08:01:34 +0000
Date: Tue, 15 Oct 2019 01:01:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191015080134.GC3055@infradead.org>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191014084027.GA3593@infradead.org> <20191015015620.GA14327@mypc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015015620.GA14327@mypc>
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
Cc: linux-xfs@vger.kernel.org, Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Christoph Hellwig <hch@infradead.org>, Dave Chinner <dchinner@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 15, 2019 at 09:56:20AM +0800, Pingfan Liu wrote:
> Agree. For the consistency of the whole fs, we need grub to be aware of
> log. While this patch just assumes that files accessed by grub are
> known, and the consistency is forced only on these files.
> > get by freezing and unfreezing the file system using the FIFREEZE and
> > FITHAW ioctls.  And if my memory is serving me correctly Dave has been
> freeze will block any further modification to the fs. That is different
> from my patch, which does not have such limitation.

So you freeze and immediately unfreeze.

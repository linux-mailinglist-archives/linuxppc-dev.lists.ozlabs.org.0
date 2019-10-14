Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56342D5DB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 10:42:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sBrn37HczDqRR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 19:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+2ed427457fa03ed83a56+5895+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sBpX2nNhzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 19:40:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2gy955Uqq63ZjbU+vRHD094tE85UQvetN3oFV5jJfwc=; b=Cm+smAvqWaa00v+wmPEn5jh3n
 QUVIT5Kzd0V12wUiND2zUq1Vl2QDJ5amb5nalQN5GdfoVR20Dh0v1aElo8IXu7A7ZMhoIcPTtEdtV
 krdxDC148VEdY3U97N9jVuami18kQzgnMmPq97hHUgroXdB0bBJudmdHVQj0959AVucm395fQ8BZb
 RcwoZ0SngCzWEh9ieNrCH+pdJFeUHgVUmO5cKuF4LF8Rc/vhGovR1X4aC6swdpD7y8itVl5bSC/5C
 EK2K/x3XBRKoqIWzGMHJPZVXKmg7zuYZDcup33rInu89iicplLjANh7hPtEX/PsgDqMJQ2G2KLHEK
 Lgo6krLcw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iJvtz-0002pq-Ao; Mon, 14 Oct 2019 08:40:27 +0000
Date: Mon, 14 Oct 2019 01:40:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191014084027.GA3593@infradead.org>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
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
Cc: Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org,
 Dave Chinner <dchinner@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 13, 2019 at 10:37:00PM +0800, Pingfan Liu wrote:
> When using fadump (fireware assist dump) mode on powerpc, a mismatch
> between grub xfs driver and kernel xfs driver has been obsevered.  Note:
> fadump boots up in the following sequence: fireware -> grub reads kernel
> and initramfs -> kernel boots.

This isn't something new.  To fundamentally fix this you need to
implement (in-memory) log recovery in grub.  That is the only really safe
long-term solutioin.  But the equivalent of your patch you can already
get by freezing and unfreezing the file system using the FIFREEZE and
FITHAW ioctls.  And if my memory is serving me correctly Dave has been
preaching that to the bootloader folks for a long time, but apparently
without visible results.

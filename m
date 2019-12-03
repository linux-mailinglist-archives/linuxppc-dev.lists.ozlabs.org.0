Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3D10FE6B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 14:10:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S2Qg3lrHzDq61
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 00:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+febdd2e10d904463134d+5945+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="CUrXyLSf"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S2N71pR6zDq61
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 00:08:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcIcKJaf0Vzu8gfZz02oe7Gwnt0ERuFDFTLCCrtsorU=; b=CUrXyLSfM0j73HpzyXClUZ9ZB
 Ya7bqqBtCIpv+OfHzcjkp8AY3lZyjlOwMWwBORH1exJBQlXKuRhyu6hN9mAkkBSWypIvRJzID6bH9
 MEt5gGpJM9F/LG9UBnRGyO8JMV5Z+uNRSREp1xk9HOWxG+3rqxnTxffGV/PxbjCab2+0G2FF+0Gop
 wJ/pNAa+v8fo1IVysoeY5Y6awX6A+pEspjRT1OxergIKgPLlAjskkMhIDebmlyQbgkHTxlCKkvB3r
 dnHufob/L8HJlVtJiXPbEofyXbHdLMcke2iNXBFYorJeiP3N/wURx5wmHHpK8ocxtTYf31SN1trqZ
 LtHuZlL1A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ic7uI-0000jv-0C; Tue, 03 Dec 2019 13:07:58 +0000
Date: Tue, 3 Dec 2019 05:07:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Stancek <jstancek@redhat.com>
Subject: Re: [bug] userspace hitting sporadic SIGBUS on xfs (Power9,
 ppc64le), v4.19 and later
Message-ID: <20191203130757.GA2267@infradead.org>
References: <cki.6C6A189643.3T2ZUWEMOI@redhat.com>
 <1738119916.14437244.1575151003345.JavaMail.zimbra@redhat.com>
 <8736e3ffen.fsf@mpe.ellerman.id.au>
 <1420623640.14527843.1575289859701.JavaMail.zimbra@redhat.com>
 <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1766807082.14812757.1575377439007.JavaMail.zimbra@redhat.com>
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
Cc: hch@infradead.org, darrick.wong@oracle.com,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>, linux-xfs@vger.kernel.org,
 CKI Project <cki-project@redhat.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, LTP Mailing List <ltp@lists.linux.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2019 at 07:50:39AM -0500, Jan Stancek wrote:
> My theory is that there's a race in iomap. There appear to be
> interleaved calls to iomap_set_range_uptodate() for same page
> with varying offset and length. Each call sees bitmap as _not_
> entirely "uptodate" and hence doesn't call SetPageUptodate().
> Even though each bit in bitmap ends up uptodate by the time
> all calls finish.

Weird.  That should be prevented by the page lock that all callers
of iomap_set_range_uptodate.  But in case I miss something, does
the patch below trigger?  If not it is not jut a race, but might
be some weird ordering problem with the bitops, especially if it
only triggers on ppc, which is very weakly ordered.

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index d33c7bc5ee92..25e942c71590 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -148,6 +148,8 @@ iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 	unsigned int i;
 	bool uptodate = true;
 
+	WARN_ON_ONCE(!PageLocked(page));
+
 	if (iop) {
 		for (i = 0; i < PAGE_SIZE / i_blocksize(inode); i++) {
 			if (i >= first && i <= last)

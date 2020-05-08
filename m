Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0091CB50B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 18:37:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JbbB0TWPzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 02:37:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ade674efe42abf9194a0+6102+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jb6955KFzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 02:15:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Es4eIMqxlcHTpRumUrbJ++gZhpS818l1WN5FHjjMEjU=; b=bPwC4QVd0Eqoqu/0a+YLSeqq6G
 y3Ac6OeS7pyYIvXRuJ1Q1r8hldlCe1EyFxndwC6/UraMbV3XVZvIqbPYeCd5sGITrXAIxDNXAGQUW
 yZp4CytLymAXVg8Itk+HF3vSnQYDL2aEs5HHWvuQT/9u8WcWUgP3a6UsxHxFUCSXefc0ZOB92ORqu
 p2J+yQbrrAa18myCM+1A5S2RAbMs1QtGw3SppGzhKmy3I7wNMrzkeLRctZpWN3/RDMn+XM88t1UK7
 d9WLPbt4BVV7ADYNKYz+1OpEtXJFhYJsMyjG9PKK6MKBcvwLmtY5ZPUUd3vITVwYSJiyK9m0mJk6z
 xYopxSug==;
Received: from [2001:4bb8:180:9d3f:90d7:9df8:7cd:3504] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX5eh-0004MH-Mi; Fri, 08 May 2020 16:15:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: remove a few uses of ->queuedata
Date: Fri,  8 May 2020 18:15:02 +0200
Message-Id: <20200508161517.252308-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-raid@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
 linux-kernel@vger.kernel.org, Jim Paris <jim@jtan.com>,
 linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Joshua Morris <josh.h.morris@us.ibm.com>,
 Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

various bio based drivers use queue->queuedata despite already having
set up disk->private_data, which can be used just as easily.  This
series cleans them up to only use a single private data pointer.

blk-mq based drivers that have code pathes that can't easily get at
the gendisk are unaffected by this series.

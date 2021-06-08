Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B091E39FBBE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:08:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwBb0jSJz3cCX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:08:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzFtnNTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+20703f0a86d9058a1f86+6498+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=qzFtnNTF; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzw8n4jKsz3014
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:06:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Rdgj+Ts6eEAHTRBjOLsHiLNSbIi9S90acEKIrhbynF0=; b=qzFtnNTFmjF8Bait7y64aPFZjN
 CG2xrZHMA96jvX4qfRKYO5q71QNoW/BKkemB5jooCYQBcQqtahwoHyvnRng4gkQ4p0EjCDnxe+t9+
 Lw573yQw6PEwJ74VCgSfbMxmrKoah4Fzox9v+HoEW/jDOqe2nHBWUHypRgDL5B/kogWv5Z4Dk97La
 +Y9hvgpZuOxpkbmkF/VrP06Wn+CZNQ4jEbMhqUXmQj26SUv+5Uagwjfn2tabJrBmUVgS7jcH+mmT2
 9DPQOluGnmWUso/06e7SWZ/eezBK/hWJ8lN3DjOKZPMmLH+jw9Or7ECR42QNO1i8OPZDLTNnr9+jC
 R4oNA/TQ==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeEx-009RZp-AE; Tue, 08 Jun 2021 16:06:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: switch the block layer to use kmap_local_page
Date: Tue,  8 Jun 2021 18:05:47 +0200
Message-Id: <20210608160603.1535935-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series switches the core block layer code and all users of the
existing bvec kmap helpers to use kmap_local_page.  Drivers that
currently use open coded kmap_atomic calls will converted in a follow
on series.

Diffstat:
 arch/mips/include/asm/mach-rc32434/rb.h |    2 -
 block/bio-integrity.c                   |   14 ++++------
 block/bio.c                             |   37 +++++++---------------------
 block/blk-map.c                         |    2 -
 block/bounce.c                          |   35 ++++++--------------------
 block/t10-pi.c                          |   16 ++++--------
 drivers/block/ps3disk.c                 |   19 ++------------
 drivers/block/rbd.c                     |   15 +----------
 drivers/md/dm-writecache.c              |    5 +--
 include/linux/bio.h                     |   42 --------------------------------
 include/linux/bvec.h                    |   27 ++++++++++++++++++--
 include/linux/highmem.h                 |    4 +--
 12 files changed, 64 insertions(+), 154 deletions(-)

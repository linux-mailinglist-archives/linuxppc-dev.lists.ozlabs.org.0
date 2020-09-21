Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F35272937
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 16:56:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw6wB5lDtzDqLn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 00:56:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+776a1a22abff015854b2+6238+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Cr3xQBVQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw6Qq0RttzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 00:34:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=hvHVjgb7+ogIHMv2QziVfmEo4wIHVDzxSBO7sgqq+LI=; b=Cr3xQBVQWALKH7tuoir4RRrOx5
 ObtytscKgX2pD9jdFKZl7OAaSGqHvKMY6QdN1AAeL7iPRdfGMnnuAKRp2fO3zs/Qa1qanBrJcMzlp
 2i6iNQiXjZlAfSdr8eSouVvMxW6Jwy5mKeEirvXr3ZTTiIIwvkxrQMh9XAJw5QuRUQsbNqdCQQyyW
 WDrgFWFBzIj4YkZNzY0XDygo/V19wuSoL2WQzUur+fGNL+3uLi2J6QXLcsQR+yhOTXD5FmYG9PgHH
 hyhjGiAZI27lRyg9jFDzu3lo4ZZQVp8d384XapZSVtaSeOjqaz3u6nukSqWN2rkY3CEe6gIiU4FAO
 cLQDX6OQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKMtc-0007rU-GX; Mon, 21 Sep 2020 14:34:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 04/11] iov_iter: explicitly check for CHECK_IOVEC_ONLY in
 rw_copy_check_uvector
Date: Mon, 21 Sep 2020 16:34:27 +0200
Message-Id: <20200921143434.707844-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921143434.707844-1-hch@lst.de>
References: <20200921143434.707844-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Explicitly check for the magic value insted of implicitly relying on
its numeric representation.   Also drop the rather pointless unlikely
annotation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/iov_iter.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index d7e72343c360eb..a64867501a7483 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1709,8 +1709,7 @@ static ssize_t rw_copy_check_uvector(int type,
 			ret = -EINVAL;
 			goto out;
 		}
-		if (type >= 0
-		    && unlikely(!access_ok(buf, len))) {
+		if (type != CHECK_IOVEC_ONLY && !access_ok(buf, len)) {
 			ret = -EFAULT;
 			goto out;
 		}
@@ -1824,7 +1823,7 @@ static ssize_t compat_rw_copy_check_uvector(int type,
 		}
 		if (len < 0)	/* size_t not fitting in compat_ssize_t .. */
 			goto out;
-		if (type >= 0 &&
+		if (type != CHECK_IOVEC_ONLY &&
 		    !access_ok(compat_ptr(buf), len)) {
 			ret = -EFAULT;
 			goto out;
-- 
2.28.0


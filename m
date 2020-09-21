Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB190272974
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 17:07:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw78R0r3jzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:07:19 +1000 (AEST)
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
 header.s=casper.20170209 header.b=h5C0cP74; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw6Qq2llqzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 00:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tfXqHGtFwgmM6UcSRx58+EM7ODTSdMOtwKoRg1u1yAY=; b=h5C0cP745frGI6LFd4dq0v1VC6
 dlre8+k7vu02YmAZ8W+aYC7/KFVYWpjVw4xuvxDaZNd2Z6QBa9oiL0Wj/Hkv5xYC2wYLt9KCBe8bl
 TYAoN6sz7hdDgHMalPgUQTr+fLk7AIcfJFZomtrhfeUIwlk6hulwAl1drU0/fuTNP7wSa0Q5YwXJV
 epTQJexY9j8oJJFTiE4IOj814WqvBV14TzUclzJplEScbfbnyXCkjYiSnhMOe79Hf9o1hSteR7Rvm
 SSHXMAUvLZDteiCW+SEwO+/7lrFRnDtCQ8YijeIlpmrJacTqjMfI2M+KPH2OSNdgKTyq62UNZlM0b
 PcBfcm0Q==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKMtY-0007qo-Gk; Mon, 21 Sep 2020 14:34:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 01/11] compat.h: fix a spelling error in <linux/compat.h>
Date: Mon, 21 Sep 2020 16:34:24 +0200
Message-Id: <20200921143434.707844-2-hch@lst.de>
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

There is no compat_sys_readv64v2 syscall, only a compat_sys_preadv64v2
one.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index b354ce58966e2d..654c1ec36671a4 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -812,7 +812,7 @@ asmlinkage ssize_t compat_sys_pwritev2(compat_ulong_t fd,
 		const struct compat_iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high, rwf_t flags);
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64V2
-asmlinkage long  compat_sys_readv64v2(unsigned long fd,
+asmlinkage long  compat_sys_preadv64v2(unsigned long fd,
 		const struct compat_iovec __user *vec,
 		unsigned long vlen, loff_t pos, rwf_t flags);
 #endif
-- 
2.28.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 299451B2BB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:55:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4967Sw6mXWzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:55:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e7bbf23787eeed0e081a+6085+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=JFPUu4yw; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49679S43jmzDqF7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 01:42:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=f152nRjSYvV+eMw/fALng3AkfZikt7gm61bUg8UTS34=; b=JFPUu4yw/6UB9q3h6V32zVamm5
 zxymF4hEUx8UfY35t7SoEpJd4Ibzompx56UBcITTY/q5eRpHnl0vt2WqsCvWZHhN1DHdBJviyLnnL
 KP7U4UV+Kyzkq4G0sjYIkVPiHRVahwxtuoVyAZIU/5sqqIc2ybKFIHWyR3pdVwGP7j8iEaOCk+vrN
 ZGD7aGnUK3+ax+b6rnWJjWT7yo1tLvGeWKnn73pNavAvLDzCjGz6TM59btGjzhWX6h/WOFkidPc/a
 Qpqt6QXhD9sQk4kPQcoPLKTbkYvcYSyqH1zCTMWkpKVbjXjrmx0qIhA00BiCi+KwFKX9pIerLoMFx
 IeQ/aqUg==;
Received: from [2001:4bb8:191:e12c:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQv2E-0007pX-Uc; Tue, 21 Apr 2020 15:42:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: remove set_fs calls from the exec and coredump code v3
Date: Tue, 21 Apr 2020 17:41:57 +0200
Message-Id: <20200421154204.252921-1-hch@lst.de>
X-Mailer: git-send-email 2.26.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series gets rid of playing with the address limit in the exec and
coredump code.  Most of this was fairly trivial, the biggest changes are
those to the spufs coredump code.

Changes since v2:
 - don't cleanup the compat siginfo calling conventions, use the patch
   variant from Eric with slight coding style fixes instead.

Changes since v1:
 - properly spell NUL
 - properly handle the compat siginfo case in ELF coredumps


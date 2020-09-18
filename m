Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090AD26FDB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 15:03:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtDXn2CSmzDqM5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 23:03:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1a7941a35ce833a0e493+6235+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=vJlif4OD; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtD8m0wtGzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:45:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=V3X+nIZPxUoB2BOajjqXji1hFeXgDyeXoEcOBeTEcjY=; b=vJlif4ODGlFSaA/X96y95TBxaJ
 n1vQfWDy9aeQQz/QfN88AtyhJjnDQw4iBBxB3dOINUYSWIDVuarqzmR0pZ51u4RNdWq3xd56/l+oR
 5GEDqjcn7bBB3CNVKgHN2a9wCcAG8SVe7T2vZu1M3dI0BtwzjwiuqLtNf9Jp3kLrAw46KAsyjal9/
 QoDWN5trBS3vHnHgnjwv02AJsET1D7F4cR807vr6jIEUKZP+oBkLuggklbUB1OR5q/LzveCjsdCRd
 XkzH7AWVhPje1BKWsGUA6phSyo6a5kaSlGjDsD4kHaEc69ADj0ykAyKUBp48wXzsnb2cVPD/Usdlf
 ivQpFJ1w==;
Received: from [80.122.85.238] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJFle-0008SE-9Z; Fri, 18 Sep 2020 12:45:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: let import_iovec deal with compat_iovecs as well
Date: Fri, 18 Sep 2020 14:45:24 +0200
Message-Id: <20200918124533.3487701-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
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
 linux-scsi@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Al,

this series changes import_iovec to transparently deal with comat iovec
structures, and then cleanups up a lot of code dupliation.  But to get
there it first has to fix the pre-existing bug that io_uring compat
contexts don't trigger the in_compat_syscall() check.  This has so far
been relatively harmless as very little code callable from io_uring used
the check, and even that code that could be called usually wasn't.

Diffstat
 arch/arm64/include/asm/unistd32.h                  |   10 
 arch/mips/kernel/syscalls/syscall_n32.tbl          |   10 
 arch/mips/kernel/syscalls/syscall_o32.tbl          |   10 
 arch/parisc/kernel/syscalls/syscall.tbl            |   10 
 arch/powerpc/kernel/syscalls/syscall.tbl           |   10 
 arch/s390/kernel/syscalls/syscall.tbl              |   10 
 arch/sparc/include/asm/compat.h                    |    3 
 arch/sparc/kernel/syscalls/syscall.tbl             |   10 
 arch/x86/entry/syscall_x32.c                       |    5 
 arch/x86/entry/syscalls/syscall_32.tbl             |   10 
 arch/x86/entry/syscalls/syscall_64.tbl             |   10 
 arch/x86/include/asm/compat.h                      |    2 
 block/scsi_ioctl.c                                 |   12 
 drivers/scsi/sg.c                                  |    9 
 fs/aio.c                                           |   38 --
 fs/io_uring.c                                      |   21 -
 fs/read_write.c                                    |  307 ++++-----------------
 fs/splice.c                                        |   57 ---
 include/linux/compat.h                             |   29 -
 include/linux/fs.h                                 |    7 
 include/linux/sched.h                              |    1 
 include/linux/uio.h                                |    7 
 include/uapi/asm-generic/unistd.h                  |   12 
 lib/iov_iter.c                                     |   30 --
 mm/process_vm_access.c                             |   69 ----
 net/compat.c                                       |    4 
 security/keys/compat.c                             |   37 --
 security/keys/internal.h                           |    5 
 security/keys/keyctl.c                             |    2 
 tools/include/uapi/asm-generic/unistd.h            |   12 
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl |   10 
 tools/perf/arch/s390/entry/syscalls/syscall.tbl    |   10 
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |   10 
 33 files changed, 207 insertions(+), 582 deletions(-)

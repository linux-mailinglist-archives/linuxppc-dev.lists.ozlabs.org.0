Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914E1CB0C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 15:47:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JWqb2QjrzDqww
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 23:47:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JVvj1bGPzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 23:06:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Jzbub23r; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JVvb5YQBz9sWh; Fri,  8 May 2020 23:06:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49JVvZ6wKrz9sWj; Fri,  8 May 2020 23:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588943179;
 bh=1GN005tbj9IwratrslGZWMhNVJ3NhNCQjUVhN8c5D2U=;
 h=From:To:Cc:Subject:Date:From;
 b=Jzbub23rJVn/BR3RdqugN8DQ9yT8mG7a1+0w19N6mxUfTFMZy8CtKzwkJQlXFaRsZ
 2pnvbDNxE0A5thvOXob6da3laRC2f8d2NRN/kodeF+m1Z0obFS51LCzEM50b0B0MPs
 Ifq/05bjExuUEZWp+f6A6IAapui+v42lJNT9wqzsTMM5UWT3puz+kJBDSXgVs2tn5x
 lHwp5k3EJ97puWxtXfBUUaTii1PW8jD6vbQRaKUpAoYsDVA2Bwsb5h6BDRfBcd7SrU
 1iZud8dVlik0Qlz2EPQCO3q4myLZYNab3U+38vLQbmsSFXjL2uD1YvYXIpgjc3GwT8
 XH/kA8+EwXHwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc/spufs: Rework fcheck() usage
Date: Fri,  8 May 2020 23:06:33 +1000
Message-Id: <20200508130633.2532759-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: hch@lst.de, jk@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the spu coredump code triggers an RCU warning:

  =============================
  WARNING: suspicious RCU usage
  5.7.0-rc3-01755-g7cd49f0b7ec7 #1 Not tainted
  -----------------------------
  include/linux/fdtable.h:95 suspicious rcu_dereference_check() usage!

  other info that might help us debug this:

  rcu_scheduler_active = 2, debug_locks = 1
  1 lock held by spu-coredump/1343:
   #0: c0000007fa22f430 (sb_writers#2){.+.+}-{0:0}, at: .do_coredump+0x1010/0x13c8

  stack backtrace:
  CPU: 0 PID: 1343 Comm: spu-coredump Not tainted 5.7.0-rc3-01755-g7cd49f0b7ec7 #1
  Call Trace:
    .dump_stack+0xec/0x15c (unreliable)
    .lockdep_rcu_suspicious+0x120/0x144
    .coredump_next_context+0x148/0x158
    .spufs_coredump_extra_notes_size+0x54/0x190
    .elf_coredump_extra_notes_size+0x34/0x50
    .elf_core_dump+0xe48/0x19d0
    .do_coredump+0xe50/0x13c8
    .get_signal+0x864/0xd88
    .do_notify_resume+0x158/0x3c8
    .interrupt_exit_user_prepare+0x19c/0x208
    interrupt_return+0x14/0x1c0

This comes from fcheck_files() via fcheck().

It's pretty clearly documented that fcheck() must be wrapped with
rcu_read_lock(), adding that fixes the RCU warning.

hch points out that once we've released the RCU read lock the file may
be closed and freed, which would leave us with a pointer to a freed
spu_context.

To avoid that, take a reference to the spu_context while we hold the
RCU read lock, and drop that reference later once we're done with the
context.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/cell/spufs/coredump.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

v2: Take a reference and hold it until we're done.

diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
index 8b3296b62f65..37c155254cd5 100644
--- a/arch/powerpc/platforms/cell/spufs/coredump.c
+++ b/arch/powerpc/platforms/cell/spufs/coredump.c
@@ -82,13 +82,20 @@ static int match_context(const void *v, struct file *file, unsigned fd)
  */
 static struct spu_context *coredump_next_context(int *fd)
 {
+	struct spu_context *ctx;
 	struct file *file;
 	int n = iterate_fd(current->files, *fd, match_context, NULL);
 	if (!n)
 		return NULL;
 	*fd = n - 1;
+
+	rcu_read_lock();
 	file = fcheck(*fd);
-	return SPUFS_I(file_inode(file))->i_ctx;
+	ctx = SPUFS_I(file_inode(file))->i_ctx;
+	get_spu_context(ctx);
+	rcu_read_unlock();
+
+	return ctx;
 }
 
 int spufs_coredump_extra_notes_size(void)
@@ -99,17 +106,23 @@ int spufs_coredump_extra_notes_size(void)
 	fd = 0;
 	while ((ctx = coredump_next_context(&fd)) != NULL) {
 		rc = spu_acquire_saved(ctx);
-		if (rc)
+		if (rc) {
+			put_spu_context(ctx);
 			break;
+		}
+
 		rc = spufs_ctx_note_size(ctx, fd);
 		spu_release_saved(ctx);
-		if (rc < 0)
+		if (rc < 0) {
+			put_spu_context(ctx);
 			break;
+		}
 
 		size += rc;
 
 		/* start searching the next fd next time */
 		fd++;
+		put_spu_context(ctx);
 	}
 
 	return size;
-- 
2.25.1


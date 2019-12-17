Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D22122C5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 13:57:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cdSq60tSzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 23:56:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="MY1qeILg"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cd4M2T9CzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:39:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576586350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rIiQFFDXfUcgIvM2Nb3KxFpLZCLOM7WNsSYtHUtaG8Q=;
 b=MY1qeILgNrAwCD55NHyv2STptPVYC78rByaRKXQwyN/RFtIWPRmTH4knI1efArD4lhMFG8
 a8MJKKx6A7H1cj4YbNYN0dPhDFsxsphjPxpG70v8uJIoRLQ5H8mWEIyiqDv7YxDfJStKM4
 JCgcEUlhGRWfSydtniWOm8NgsJmJVJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-muAGo-jKPuemWvDF66R4fw-1; Tue, 17 Dec 2019 07:39:06 -0500
X-MC-Unique: muAGo-jKPuemWvDF66R4fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3247800EBF;
 Tue, 17 Dec 2019 12:39:03 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 393FA10016DA;
 Tue, 17 Dec 2019 12:39:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 2/3] powerpc/memtrace: Factor out readding memory into
 memtrace_free_node()
Date: Tue, 17 Dec 2019 13:38:50 +0100
Message-Id: <20191217123851.8854-3-david@redhat.com>
In-Reply-To: <20191217123851.8854-1-david@redhat.com>
References: <20191217123851.8854-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>, Rashmica Gupta <rashmica.g@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While at it, move it, we want to reuse it soon.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 44 ++++++++++++++---------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/pla=
tforms/powernv/memtrace.c
index 0c4c54d2e3c4..2d2a0a2acd60 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -50,6 +50,32 @@ static const struct file_operations memtrace_fops =3D =
{
 	.open	=3D simple_open,
 };
=20
+static int online_mem_block(struct memory_block *mem, void *arg)
+{
+	return device_online(&mem->dev);
+}
+
+static int memtrace_free_node(int nid, unsigned long start, unsigned lon=
g size)
+{
+	int ret;
+
+	ret =3D add_memory(nid, start, size);
+	if (!ret) {
+		/*
+		 * If the kernel isn't compiled with the auto online option, we
+		 * will try to online ourselves. We'll ignore any errors here -
+		 * user space can try to online itself later (after all, the
+		 * memory was added successfully).
+		 */
+		if (!memhp_auto_online) {
+			lock_device_hotplug();
+			walk_memory_blocks(start, size, NULL, online_mem_block);
+			unlock_device_hotplug();
+		}
+	}
+	return ret;
+}
+
 static int check_memblock_online(struct memory_block *mem, void *arg)
 {
 	if (mem->state !=3D MEM_ONLINE)
@@ -202,11 +228,6 @@ static int memtrace_init_debugfs(void)
 	return ret;
 }
=20
-static int online_mem_block(struct memory_block *mem, void *arg)
-{
-	return device_online(&mem->dev);
-}
-
 /*
  * Iterate through the chunks of memory we have removed from the kernel
  * and attempt to add them back to the kernel.
@@ -229,24 +250,13 @@ static int memtrace_online(void)
 			ent->mem =3D 0;
 		}
=20
-		if (add_memory(ent->nid, ent->start, ent->size)) {
+		if (memtrace_free_node(ent->nid, ent->start, ent->size)) {
 			pr_err("Failed to add trace memory to node %d\n",
 				ent->nid);
 			ret +=3D 1;
 			continue;
 		}
=20
-		/*
-		 * If kernel isn't compiled with the auto online option
-		 * we need to online the memory ourselves.
-		 */
-		if (!memhp_auto_online) {
-			lock_device_hotplug();
-			walk_memory_blocks(ent->start, ent->size, NULL,
-					   online_mem_block);
-			unlock_device_hotplug();
-		}
-
 		/*
 		 * Memory was added successfully so clean up references to it
 		 * so on reentry we can tell that this chunk was added.
--=20
2.23.0


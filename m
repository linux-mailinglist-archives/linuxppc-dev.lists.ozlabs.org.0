Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDC2AF44A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:00:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSZN25m7zDqpB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 01:59:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KpPZCt4J; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KpPZCt4J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRD0R3HzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HauqxgXColeqjprPbUc0JmWW3cRk97A/ix3dTNECW2k=;
 b=KpPZCt4JBTik3HGu/InAtfDKWKpzPUPcxhQpZRvc33BkEfv/tA0mWx29qWMxHkn1viA5kR
 lVewmc/E1QJ3PHLqgJNyPc2xn8XOqclwh2hfx/o8bBxLQcKCOgljvcdk1Yntwim68L3izi
 yT83UxlicaT04Q8OvD5T4aykPKPG71s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HauqxgXColeqjprPbUc0JmWW3cRk97A/ix3dTNECW2k=;
 b=KpPZCt4JBTik3HGu/InAtfDKWKpzPUPcxhQpZRvc33BkEfv/tA0mWx29qWMxHkn1viA5kR
 lVewmc/E1QJ3PHLqgJNyPc2xn8XOqclwh2hfx/o8bBxLQcKCOgljvcdk1Yntwim68L3izi
 yT83UxlicaT04Q8OvD5T4aykPKPG71s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-lQFt9juWPYGtGkNOXol1zQ-1; Wed, 11 Nov 2020 09:53:37 -0500
X-MC-Unique: lQFt9juWPYGtGkNOXol1zQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6B0B879539;
 Wed, 11 Nov 2020 14:53:35 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D95D1380;
 Wed, 11 Nov 2020 14:53:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] powernv/memtrace: fix crashing the kernel when
 enabling concurrently
Date: Wed, 11 Nov 2020 15:53:16 +0100
Message-Id: <20201111145322.15793-3-david@redhat.com>
In-Reply-To: <20201111145322.15793-1-david@redhat.com>
References: <20201111145322.15793-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: David Hildenbrand <david@redhat.com>, stable@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's very easy to crash the kernel right now by simply trying to enable
memtrace concurrently, hammering on the "enable" interface

loop.sh:
  #!/bin/bash

  dmesg --console-off

  while true; do
          echo 0x40000000 > /sys/kernel/debug/powerpc/memtrace/enable
  done

[root@localhost ~]# loop.sh &
[root@localhost ~]# loop.sh &

Resulting quickly in a kernel crash. Let's properly protect using a
mutex.

Fixes: 9d5171a8f248 ("powerpc/powernv: Enable removal of memory for in memory tracing")
Cc: stable@vger.kernel.org# v4.14+
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index eea1f94482ff..0e42fe2d7b6a 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -30,6 +30,7 @@ struct memtrace_entry {
 	char name[16];
 };
 
+static DEFINE_MUTEX(memtrace_mutex);
 static u64 memtrace_size;
 
 static struct memtrace_entry *memtrace_array;
@@ -279,6 +280,7 @@ static int memtrace_online(void)
 
 static int memtrace_enable_set(void *data, u64 val)
 {
+	int rc = -EAGAIN;
 	u64 bytes;
 
 	/*
@@ -291,25 +293,31 @@ static int memtrace_enable_set(void *data, u64 val)
 		return -EINVAL;
 	}
 
+	mutex_lock(&memtrace_mutex);
+
 	/* Re-add/online previously removed/offlined memory */
 	if (memtrace_size) {
 		if (memtrace_online())
-			return -EAGAIN;
+			goto out_unlock;
 	}
 
-	if (!val)
-		return 0;
+	if (!val) {
+		rc = 0;
+		goto out_unlock;
+	}
 
 	/* Offline and remove memory */
 	if (memtrace_init_regions_runtime(val))
-		return -EINVAL;
+		goto out_unlock;
 
 	if (memtrace_init_debugfs())
-		return -EINVAL;
+		goto out_unlock;
 
 	memtrace_size = val;
-
-	return 0;
+	rc = 0;
+out_unlock:
+	mutex_unlock(&memtrace_mutex);
+	return rc;
 }
 
 static int memtrace_enable_get(void *data, u64 *val)
-- 
2.26.2


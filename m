Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B48722AF458
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:04:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSgf2CSYzDqpL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:04:30 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=VQjhgdHs; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fVZ4f0to; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRL5WpwzDqpB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSQatxuwdd1ehWeHPVVOm8FQ78oIMefwI0KM3vx9OUY=;
 b=VQjhgdHs8AYav6x0BunlQpdNjniSlMa84QKCQbmmskCcw+NzrbDcmdiyRUixiwyhi75nMR
 vl3sr72jrGtSgs+dgodTXcM0GmPpNOfI3TEqU6DhEehdpeaY2QhOKkLMUvcQFBemYY+aMW
 hLfj3Yozo29eK//kkJ1E/xMbRMx+510=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSQatxuwdd1ehWeHPVVOm8FQ78oIMefwI0KM3vx9OUY=;
 b=fVZ4f0tosFtxL3ghmxKXczV1i2cgArybceKFRNtuUs6WD0HZ7u/GJ0kYyvKOZwK9mUO7L6
 2zy3EILH+N5IAMLMoedw8GQB8sV7UnIttEQQccCJMzYDIgm9XmQcB1N9UUrOlITXgZNWbD
 QnKhWh34IXe6f9bsWit4TVPhdo8T6Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-eMn4ZS-3NWCR9QdUC20pPQ-1; Wed, 11 Nov 2020 09:53:43 -0500
X-MC-Unique: eMn4ZS-3NWCR9QdUC20pPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D269A8049CC;
 Wed, 11 Nov 2020 14:53:41 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A9F9380;
 Wed, 11 Nov 2020 14:53:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] powerpc/mm: protect linear mapping modifications by a
 mutex
Date: Wed, 11 Nov 2020 15:53:18 +0100
Message-Id: <20201111145322.15793-5-david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This code currently relies on mem_hotplug_begin()/mem_hotplug_done() -
create_section_mapping()/remove_section_mapping() implementations
cannot tollerate getting called concurrently.

Let's prepare for callers (memtrace) not holding any such locks (and
don't force them to mess with memory hotplug locks).

Other parts in these functions don't seem to rely on external locking.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8a86d81f8df0..ca5c4b54c366 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -58,6 +58,7 @@
 #define CPU_FTR_NOEXECUTE	0
 #endif
 
+static DEFINE_MUTEX(linear_mapping_mutex);
 unsigned long long memory_limit;
 bool init_mem_is_free;
 
@@ -126,8 +127,10 @@ int __ref arch_create_linear_mapping(int nid, u64 start, u64 size,
 	int rc;
 
 	start = (unsigned long)__va(start);
+	mutex_lock(&linear_mapping_mutex);
 	rc = create_section_mapping(start, start + size, nid,
 				    params->pgprot);
+	mutex_unlock(&linear_mapping_mutex);
 	if (rc) {
 		pr_warn("Unable to create linear mapping for 0x%llx..0x%llx: %d\n",
 			start, start + size, rc);
@@ -144,7 +147,9 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
 	start = (unsigned long)__va(start);
 	flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
 
+	mutex_lock(&linear_mapping_mutex);
 	ret = remove_section_mapping(start, start + size);
+	mutex_unlock(&linear_mapping_mutex);
 	WARN_ON_ONCE(ret);
 
 	/* Ensure all vmalloc mappings are flushed in case they also
-- 
2.26.2


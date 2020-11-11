Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66E2AF468
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:07:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSkX3RdszDqwD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JC5qn6dW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JC5qn6dW; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRR28cfzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjIV86G4+zXJRkvdg3A94EY+lDllWpujuARJLy+GgHg=;
 b=JC5qn6dWq9FNy9U2fNX803zak4VwjZ3PPtf1EECkPQqntMq7nu2hXRVKWXt2Mi9HbgphwN
 qrdF85oN5oAy1gi3m2LyMpjiLR7Dv8r9aXeGi3R/N8MA5/Mymn7C70TkuCYJ+jyjYbOZKl
 Jx9UJwZMeFluZLoA4Qn1HmiaUwMlqYU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjIV86G4+zXJRkvdg3A94EY+lDllWpujuARJLy+GgHg=;
 b=JC5qn6dWq9FNy9U2fNX803zak4VwjZ3PPtf1EECkPQqntMq7nu2hXRVKWXt2Mi9HbgphwN
 qrdF85oN5oAy1gi3m2LyMpjiLR7Dv8r9aXeGi3R/N8MA5/Mymn7C70TkuCYJ+jyjYbOZKl
 Jx9UJwZMeFluZLoA4Qn1HmiaUwMlqYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-hceWkfh2NFaINwskg_F-hQ-1; Wed, 11 Nov 2020 09:53:46 -0500
X-MC-Unique: hceWkfh2NFaINwskg_F-hQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E7E1099F63;
 Wed, 11 Nov 2020 14:53:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F3A2380;
 Wed, 11 Nov 2020 14:53:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] powerpc/mm: print warning in
 arch_remove_linear_mapping()
Date: Wed, 11 Nov 2020 15:53:19 +0100
Message-Id: <20201111145322.15793-6-david@redhat.com>
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

Let's print a warning similar to in arch_add_linear_mapping() instead of
WARN_ON_ONCE() and eventually crashing the kernel.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
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
 arch/powerpc/mm/mem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ca5c4b54c366..c5755b9efb64 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -150,7 +150,9 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
 	mutex_lock(&linear_mapping_mutex);
 	ret = remove_section_mapping(start, start + size);
 	mutex_unlock(&linear_mapping_mutex);
-	WARN_ON_ONCE(ret);
+	if (ret)
+		pr_warn("Unable to remove linear mapping for 0x%llx..0x%llx: %d\n",
+			start, start + size, ret);
 
 	/* Ensure all vmalloc mappings are flushed in case they also
 	 * hit that section of memory
-- 
2.26.2


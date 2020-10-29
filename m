Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CF29F1C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 17:41:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMWRT2gL5zDqb1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:41:25 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=AfTNM44J; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AfTNM44J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMW7n3hgmzDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 03:27:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603988858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7siXqe9xLyC5jnHaj5YIsmBgb0Hn9zRskk7tPjv5dw=;
 b=AfTNM44JApO+t5QPnyqR/S3uXMEuzpRf2Eb6kuEuXXpyzni+LGgnvrMpKZ/bxXQGDmzhUu
 6bK5W6syaTVNknzpLjQbi8Ns+iwws0910cvTEFz66ozJ+9CnbM1HvrAvK6blYTcDpODtoN
 kCV8nFy/H1iF7BONs/jM3V1SZrVRCqI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603988858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7siXqe9xLyC5jnHaj5YIsmBgb0Hn9zRskk7tPjv5dw=;
 b=AfTNM44JApO+t5QPnyqR/S3uXMEuzpRf2Eb6kuEuXXpyzni+LGgnvrMpKZ/bxXQGDmzhUu
 6bK5W6syaTVNknzpLjQbi8Ns+iwws0910cvTEFz66ozJ+9CnbM1HvrAvK6blYTcDpODtoN
 kCV8nFy/H1iF7BONs/jM3V1SZrVRCqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-xWjC179tNFKDqVFXM7kCyQ-1; Thu, 29 Oct 2020 12:27:35 -0400
X-MC-Unique: xWjC179tNFKDqVFXM7kCyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2D6980B714;
 Thu, 29 Oct 2020 16:27:33 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-181.ams2.redhat.com [10.36.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 334855C1C4;
 Thu, 29 Oct 2020 16:27:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] powerpc/mm: print warning in
 arch_remove_linear_mapping()
Date: Thu, 29 Oct 2020 17:27:16 +0100
Message-Id: <20201029162718.29910-3-david@redhat.com>
In-Reply-To: <20201029162718.29910-1-david@redhat.com>
References: <20201029162718.29910-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 8a86d81f8df0..685028451dd2 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -145,7 +145,9 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
 	flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
 
 	ret = remove_section_mapping(start, start + size);
-	WARN_ON_ONCE(ret);
+	if (ret)
+		pr_warn("Unable to remove linear mapping for 0x%llx..0x%llx: %d\n",
+			start, start + size, ret);
 
 	/* Ensure all vmalloc mappings are flushed in case they also
 	 * hit that section of memory
-- 
2.26.2


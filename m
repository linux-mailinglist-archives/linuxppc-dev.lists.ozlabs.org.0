Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C4122C4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 13:50:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cdK45frrzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 23:50:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="NLN8ykOl"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cd4G1ph8zDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:39:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576586346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B246GLaT3HAQaGu/abosRqj+9QWb/G6+/8B/T9JdjTs=;
 b=NLN8ykOlKEbDicwTqcCtwyEs3j4UEjoMgDFjWgjx6YEX6OjM6IXmnFMqri3RbSZ/VcA/yT
 4AhVam6l1ueyFnC55jYCYomMet43oOcS7mfSey4TLzb7O9azMGYA/rU5sd9gUeXwHwqApl
 qj9LYK2OmNA0DZLFs2giqc24JHCv6PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-lTiwSymxNZWStB5eZN8R8g-1; Tue, 17 Dec 2019 07:39:03 -0500
X-MC-Unique: lTiwSymxNZWStB5eZN8R8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE8DF107ACC5;
 Tue, 17 Dec 2019 12:39:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.36.118.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 538961001281;
 Tue, 17 Dec 2019 12:38:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v1 1/3] powerpc/memtrace: Enforce power of 2 for memory
 buffer size
Date: Tue, 17 Dec 2019 13:38:49 +0100
Message-Id: <20191217123851.8854-2-david@redhat.com>
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
Cc: David Hildenbrand <david@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Rashmica Gupta <rashmica.g@gmail.com>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code mentions "Trace memory needs to be aligned to the size", and
e.g., round_up() is documented to work on power of 2 only. Also, the
whole search is not optimized e.g., for being aligned to memory block
size only while allocating multiple memory blocks.

Let's just limit to powers of 2 that are at least the size of memory
blocks - the granularity we are using for alloc/offline/unplug.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/pla=
tforms/powernv/memtrace.c
index eb2e75dac369..0c4c54d2e3c4 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -268,15 +268,11 @@ static int memtrace_online(void)
=20
 static int memtrace_enable_set(void *data, u64 val)
 {
-	u64 bytes;
-
-	/*
-	 * Don't attempt to do anything if size isn't aligned to a memory
-	 * block or equal to zero.
-	 */
-	bytes =3D memory_block_size_bytes();
-	if (val & (bytes - 1)) {
-		pr_err("Value must be aligned with 0x%llx\n", bytes);
+	const unsigned long bytes =3D memory_block_size_bytes();
+
+	if (val && (!is_power_of_2(val) || val < bytes)) {
+		pr_err("Value must be 0 or a power of 2 (at least 0x%lx)\n",
+		       bytes);
 		return -EINVAL;
 	}
=20
--=20
2.23.0


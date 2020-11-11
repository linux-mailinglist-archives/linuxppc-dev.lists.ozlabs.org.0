Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC702AF46F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:08:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWSmH2bBgzDqwv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:08:31 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=JOdLSEgF; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JOdLSEgF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRV2xfszDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhuJKFJ40YYV4yAtUj0xc/iGakKgHu3ked/4T0h0M60=;
 b=JOdLSEgFUFLv9l1YH1Fe+5lbBXcB+D7uJMtvdBddlZG26yA+PvWID0cqUkvG7BtXMjyuOv
 +4myFtExMOwBbl6XB/1ki14Zjvc1Oqg7Pk5yEWa+Jlch6r7InUwiodIQ94T+yFDcF+NvTp
 aZ3yW4oGhXZlnxieGwg2YzI4WMJGAEw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhuJKFJ40YYV4yAtUj0xc/iGakKgHu3ked/4T0h0M60=;
 b=JOdLSEgFUFLv9l1YH1Fe+5lbBXcB+D7uJMtvdBddlZG26yA+PvWID0cqUkvG7BtXMjyuOv
 +4myFtExMOwBbl6XB/1ki14Zjvc1Oqg7Pk5yEWa+Jlch6r7InUwiodIQ94T+yFDcF+NvTp
 aZ3yW4oGhXZlnxieGwg2YzI4WMJGAEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-7ZYhYZrcON-D3_JaRH7ltg-1; Wed, 11 Nov 2020 09:53:53 -0500
X-MC-Unique: 7ZYhYZrcON-D3_JaRH7ltg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA1A1017DC3;
 Wed, 11 Nov 2020 14:53:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27E18380;
 Wed, 11 Nov 2020 14:53:44 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] powerepc/book3s64/hash: drop WARN_ON in
 hash__remove_section_mapping
Date: Wed, 11 Nov 2020 15:53:20 +0100
Message-Id: <20201111145322.15793-7-david@redhat.com>
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
 David Hildenbrand <david@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The single caller (arch_remove_linear_mapping()) prints a proper warning
when this function fails. No need to eventually crash the kernel - let's
drop this WARN_ON.

Suggested-by: Oscar Salvador <osalvador@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 24702c0a92e0..d2dcb7757c68 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -845,7 +845,6 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
 {
 	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
 				     mmu_kernel_ssize);
-	WARN_ON(rc < 0);
 
 	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
 		pr_warn("Hash collision while resizing HPT\n");
-- 
2.26.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080162B879
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:32:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBzrB162Pz3f5j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:32:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipsbOjNl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipsbOjNl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipsbOjNl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ipsbOjNl;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBzlW2Z8Bz3cMm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:28:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBNCmUN3Fl+gew+kF5uWxf/68ToHi+G0X+q3EDBSaEw=;
	b=ipsbOjNl3H0csSAMWDPb4ASWN+FhukfFMtzhKnCIPZbS2+0RuK9/7l7YI5xPgeFGyAcEQg
	okO46gh0e9aViQT9P8gl7Rimd98ZkowD8WllI8yUjY5R4nUHTAPuNdVmQbzLj2H7qnpZra
	oC0iUpY2Ry+JymMgdip/WcZz1RxgxAw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBNCmUN3Fl+gew+kF5uWxf/68ToHi+G0X+q3EDBSaEw=;
	b=ipsbOjNl3H0csSAMWDPb4ASWN+FhukfFMtzhKnCIPZbS2+0RuK9/7l7YI5xPgeFGyAcEQg
	okO46gh0e9aViQT9P8gl7Rimd98ZkowD8WllI8yUjY5R4nUHTAPuNdVmQbzLj2H7qnpZra
	oC0iUpY2Ry+JymMgdip/WcZz1RxgxAw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-sQYY2ixTM6-Iv3BZ-sVvtQ-1; Wed, 16 Nov 2022 05:28:02 -0500
X-MC-Unique: sQYY2ixTM6-Iv3BZ-sVvtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFD7C3C10ECA;
	Wed, 16 Nov 2022 10:28:00 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83B9A2028E8F;
	Wed, 16 Nov 2022 10:27:53 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable v1 05/20] mm: add early FAULT_FLAG_WRITE consistency checks
Date: Wed, 16 Nov 2022 11:26:44 +0100
Message-Id: <20221116102659.70287-6-david@redhat.com>
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Oded Gabbay <ogabbay@kernel.org>
 , linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
care in all other handlers and might get "surprises" if we forget to do
so.

Write faults without VM_MAYWRITE don't make any sense, and our
maybe_mkwrite() logic could have hidden such abuse for now.

Write faults without VM_WRITE on something that is not a COW mapping is
similarly broken, and e.g., do_wp_page() could end up placing an
anonymous page into a shared mapping, which would be bad.

This is a preparation for reliable R/O long-term pinning of pages in
private mappings, whereby we want to make sure that we will never break
COW in a read-only private mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index e014435a87db..c4fa378ec2a0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5170,6 +5170,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
 		 */
 		if (!is_cow_mapping(vma->vm_flags))
 			*flags &= ~FAULT_FLAG_UNSHARE;
+	} else if (*flags & FAULT_FLAG_WRITE) {
+		/* Write faults on read-only mappings are impossible ... */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
+			return VM_FAULT_SIGSEGV;
+		/* ... and FOLL_FORCE only applies to COW mappings. */
+		if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
+				 !is_cow_mapping(vma->vm_flags)))
+			return VM_FAULT_SIGSEGV;
 	}
 	return 0;
 }
-- 
2.38.1


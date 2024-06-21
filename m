Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A59127A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:26:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lx4l+OVG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lx4l+OVG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KRX58TTz3cfy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lx4l+OVG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lx4l+OVG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KQ233bmz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:25:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=Lx4l+OVGmfCgixz1+7PdePOxhzRoqv6r8u3p5LcoJiswQE/4o5yl7k9LOTm9spsgufR6q6
	Q3wOuoZsy4ieXofmIsBa3gzCVWg0AtD22mdeofNnnEm3zeEkDq0QgM4Gg3e3apP4u2IkMJ
	AgKavWNk0aXjePAakAV0IFGn2zsAFXk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=Lx4l+OVGmfCgixz1+7PdePOxhzRoqv6r8u3p5LcoJiswQE/4o5yl7k9LOTm9spsgufR6q6
	Q3wOuoZsy4ieXofmIsBa3gzCVWg0AtD22mdeofNnnEm3zeEkDq0QgM4Gg3e3apP4u2IkMJ
	AgKavWNk0aXjePAakAV0IFGn2zsAFXk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-aUZ3vLK5N-WJyAXN6MVPFw-1; Fri, 21 Jun 2024 10:25:10 -0400
X-MC-Unique: aUZ3vLK5N-WJyAXN6MVPFw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7955a7df54cso26467185a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979910; x=1719584710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
        b=Md5D9Q1v0FOO6Rw0dXWM0yGmsMoFq9F8dr9/o0AB5LTbBXDcu02XvL0KfYiHfl8wMO
         9kaQIkOxVDO29liK2IGcJ9fAe86nVqMOzdV26uoJw1Fx9zXx6a71RfDPQ17gUYQ2VksF
         cmqTYdDPFvFsMfMP/2xJYg/8IAz+rhr3X+fHRjDCn8JATT4A0u7i19n6vcwwnmKs/SR8
         ld4KS1/nPy3BoYDQLWfEihdefawgNltedQjKcsYvfPKRPY9Lwvw8ovtcRnbHCPNfyBag
         0Qiy5B9JTOMss1ttqZJgG5p2/qAxKPsJpor8etzAUbAAQBPmU7T9bZBw7Ji4OWWICux3
         qphQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkPzwV7EjodTggsJbX6ULJAfyH6EqiO3DAMmWndU8qU58WbSScC0MQehu02pB0OjJXrkEN6Isr6sqtdiT1a8JExdhXceTSjqCudQDpEg==
X-Gm-Message-State: AOJu0Yy6rya74NWJ4BiE3K3CC3e2nVOyzCcCWwom4LPs6mWICVFr0UwL
	9rQIhgb0XaSPMuD98h0TU2rnLNBoigIeK39L4LL8e4wiaACFtRu7e7HpbdrvDxPw8kYehMbzE5p
	vcLqlEK76hBRf7NR64oI0LogRFOidzfO17QDbb0iIcpxbVDMGRhouglJC6AhT8bg=
X-Received: by 2002:a05:620a:1a1f:b0:795:c5a1:cbac with SMTP id af79cd13be357-79bb3ee371bmr869907285a.5.1718979909461;
        Fri, 21 Jun 2024 07:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBrJ7N3pmBZU3UlBHH/5YVIoMtOfK+G61+YRt17HXeINLiGOOyCA8EM9L/R3OdwJcsLTRnFw==
X-Received: by 2002:a05:620a:1a1f:b0:795:c5a1:cbac with SMTP id af79cd13be357-79bb3ee371bmr869904185a.5.1718979908847;
        Fri, 21 Jun 2024 07:25:08 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce944cb2sm90564785a.125.2024.06.21.07.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:25:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/7] mm/dax: Dump start address in fault handler
Date: Fri, 21 Jun 2024 10:24:58 -0400
Message-ID: <20240621142504.1940209-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240621142504.1940209-1-peterx@redhat.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the dax fault handler dumps the vma range when dynamic debugging
enabled.  That's mostly not useful.  Dump the (aligned) address instead
with the order info.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/dax/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index eb61598247a9..714174844ca5 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -235,9 +235,9 @@ static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf, unsigned int order)
 	int id;
 	struct dev_dax *dev_dax = filp->private_data;
 
-	dev_dbg(&dev_dax->dev, "%s: %s (%#lx - %#lx) order:%d\n", current->comm,
-			(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
-			vmf->vma->vm_start, vmf->vma->vm_end, order);
+	dev_dbg(&dev_dax->dev, "%s: op=%s addr=%#lx order=%d\n", current->comm,
+		(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
+		vmf->address & ~((1UL << (order + PAGE_SHIFT)) - 1), order);
 
 	id = dax_read_lock();
 	if (order == 0)
-- 
2.45.0


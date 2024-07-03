Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C33926A45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:30:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=efpAxnP0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=efpAxnP0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtHR2C6Kz3fRL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:30:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=efpAxnP0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=efpAxnP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtG05MMRz3ccL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=efpAxnP0NJx8h+MxwWDpirYPMo7xBw/L2bW+6L/Lp99vUZZaH2wpAaob26RdVCgG2b3FPj
	PVP0A3gjmDboBxBfndD4Q/CQnTye2wk1VeY3691lR0GAZ9oDnkoOStQjEL0Aa1sBdv+E4k
	NdkpZQNuOaAADJrPXeDw4tIVnXXB6xo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
	b=efpAxnP0NJx8h+MxwWDpirYPMo7xBw/L2bW+6L/Lp99vUZZaH2wpAaob26RdVCgG2b3FPj
	PVP0A3gjmDboBxBfndD4Q/CQnTye2wk1VeY3691lR0GAZ9oDnkoOStQjEL0Aa1sBdv+E4k
	NdkpZQNuOaAADJrPXeDw4tIVnXXB6xo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-7_VUHRyqMOOFPXrhMgMsDA-1; Wed, 03 Jul 2024 17:29:24 -0400
X-MC-Unique: 7_VUHRyqMOOFPXrhMgMsDA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-446405b39baso4234231cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042164; x=1720646964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrFUBbcc9D0ORnx0qoNz81Y3Ewmb+xGo+hBykZs/BiM=;
        b=KS9sEuqU6B809OX8OXwJY3N64rnnapWJtTpK1bDE/crr27mgBVtSsDRClRhcz8VwDW
         4TqcuAw6w7D/opV+00+hZCohQpycSMa5XOQh7W+QnZx/kTEL01HUpmFDqBF5vfAtj+A+
         IIBWX+0VaQdY0oFtJIVSEyl8JA9nEORs2FVtcWBVp2HV30feo8bObl3sa4VYVQrrrumn
         L722k2Gi46NJNHb7NHvvttZ0Ye1oJAX1MT7nCthib067pkWcULXrvGt5J6YwhQKoo0lJ
         20F0lro8JfSwr7015gvvAh+DLrnfUsjBWR7+asXxR0A7jerX3Nrla6pyRNFHmkJB50s1
         gxQg==
X-Forwarded-Encrypted: i=1; AJvYcCWX8SnhmqiC/gEKBTVc8zxdIxn+JETlEhpUHHQG1XztiMTM2RXm37LCYYLP1dp8YjkP1Ik5UYdvU54KdKxKpQQ3+8cfbcsrJw6WskrycA==
X-Gm-Message-State: AOJu0YxHNIj61Nrz3wDMMBQxFAXtAlazLYq/0Nk5HrinRyN+E+RsOpKE
	yfnONDDSqzs+wOs+3dz31AqHEaqHCByZjlqRVeBKIxR7bhiOGKdnFhWkrq/ESQ9PnimCBvTbT+l
	CcjatoxmoTBnwe7R7aHwLMO0na5uh2C0TWF/fDToH78YQYC9EGR2W2uNh6Vi4UJ4=
X-Received: by 2002:a05:622a:20f:b0:446:395a:37c9 with SMTP id d75a77b69052e-44662e3a591mr137075691cf.4.1720042163855;
        Wed, 03 Jul 2024 14:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMTQtKzW3HcLgwCHDxSHbcORdQ9cM6uS4LGBZ0J8HIBqay3DdOq6gf2nTNP/Qtw7gCSEI+OA==
X-Received: by 2002:a05:622a:20f:b0:446:395a:37c9 with SMTP id d75a77b69052e-44662e3a591mr137075451cf.4.1720042163442;
        Wed, 03 Jul 2024 14:29:23 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:22 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/8] mm/dax: Dump start address in fault handler
Date: Wed,  3 Jul 2024 17:29:11 -0400
Message-ID: <20240703212918.2417843-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240703212918.2417843-1-peterx@redhat.com>
References: <20240703212918.2417843-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
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


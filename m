Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B287B3C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:48:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rt4e2Rua;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rt4e2Rua;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw3zG2xsMz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:48:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rt4e2Rua;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rt4e2Rua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yT06FFz30gJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
	b=Rt4e2RuaL1A/tArNI5R3j05x1CzL2OCFh++r2I+GgawIBHvN63kk/fZsSC3bJEygWPO2NV
	w6iJ0//sKI6rKMX+7bLNEmqpySdxbwe0cmCqooBD5vXQHe1O8svw1oS0aRKFG41qCYzQo3
	O+9u9i7LztD8lCHggJ+uPP7TAI8PsS4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
	b=Rt4e2RuaL1A/tArNI5R3j05x1CzL2OCFh++r2I+GgawIBHvN63kk/fZsSC3bJEygWPO2NV
	w6iJ0//sKI6rKMX+7bLNEmqpySdxbwe0cmCqooBD5vXQHe1O8svw1oS0aRKFG41qCYzQo3
	O+9u9i7LztD8lCHggJ+uPP7TAI8PsS4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-4L-296UbM4Go93EESmo8Pw-1; Wed, 13 Mar 2024 17:47:23 -0400
X-MC-Unique: 4L-296UbM4Go93EESmo8Pw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-690ab2b0de1so1162696d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366443; x=1710971243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8evz9V3UX8qsNtRrNT6H/1m1GM34KP8FDwkI2vjQ2A=;
        b=SY/NcMTwy790FY6Ek//8W1CvTf4TaaQYuXBTF0y4NHwY8N7lMUcEN5zvlIdd/8RTLp
         9t8O0/9BZ/mWfAk9xLn2c2aBWzefsFZyC4wBDJrjdX9ZOt3httGaRjON5fd5QRRv0TxV
         nTTg+3/NlcTM71Hjpdbw7FSwTi4Xiy3GbI1xBNLATP0v+H2PV2EHCSwJG50eBPwSLve3
         T4DXVNStogePQobnKTOS5G9aXAwT4sOCASvv86slk13rIgHDXOCWEWFsU9cVC1KprcIH
         +BU/x8xDW9ukPQ71z1jqj5kfomZMtFFMpYDlsVx4zfLw9Y2HPih1Vgwsmf0/DJce5oP9
         UzJg==
X-Forwarded-Encrypted: i=1; AJvYcCXOpRv+2NtfYoWcuHveuPnpf/qy/A+zgSA9SHHhryKrChgCXnVwpI2izke+06SN+dhZicUM/2lto6zD2B5f4UtVZeWiIFFt5I18t9bvFg==
X-Gm-Message-State: AOJu0Yzdfug9yvfbfEocIaWZTSnJFdJCNDvOSYd60mOcGTqMVy6486hN
	KECrOfEP5wmGGw2ycCgwIQjZ8o0vbl//sEoAdK/yVHQke1Scq9bh6/eurmqOENZXkQm0UNYSXRG
	r22iD4gh3w63/mXuwFvjR+xcrSUnKCXfcPB7lmqM6gc1zFrhKnlFVaHNWvuHA7Vk=
X-Received: by 2002:a05:6214:1743:b0:690:27a:e6 with SMTP id dc3-20020a056214174300b00690027a00e6mr5703630qvb.5.1710366443331;
        Wed, 13 Mar 2024 14:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB+0sslZT/w15j/K+m+SJUdgZVImDODUje9EjvSi+lJj4JWIjdAUo0kKWd9JJ6p81zVpsztA==
X-Received: by 2002:a05:6214:1743:b0:690:27a:e6 with SMTP id dc3-20020a056214174300b00690027a00e6mr5703604qvb.5.1710366442877;
        Wed, 13 Mar 2024 14:47:22 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:22 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 01/13] mm/hmm: Process pud swap entry without pud_huge()
Date: Wed, 13 Mar 2024 17:47:07 -0400
Message-ID: <20240313214719.253873-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313214719.253873-1-peterx@redhat.com>
References: <20240313214719.253873-1-peterx@redhat.com>
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
Cc: Alistair Popple <apopple@nvidia.com>, Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Swap pud entries do not always return true for pud_huge() for all archs.
x86 and sparc (so far) allow it, but all the rest do not accept a swap
entry to be reported as pud_huge().  So it's not safe to check swap entries
within pud_huge().  Check swap entries before pud_huge(), so it should be
always safe.

This is the only place in the kernel that (IMHO, wrongly) relies on
pud_huge() to return true on pud swap entries.  The plan is to cleanup
pXd_huge() to only report non-swap mappings for all archs.

Cc: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hmm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 277ddcab4947..c95b9ec5d95f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -424,7 +424,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	walk->action = ACTION_CONTINUE;
 
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud)) {
+	if (!pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
@@ -435,11 +435,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		unsigned long *hmm_pfns;
 		unsigned long cpu_flags;
 
-		if (!pud_present(pud)) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole(start, end, -1, walk);
-		}
-
 		i = (addr - range->start) >> PAGE_SHIFT;
 		npages = (end - addr) >> PAGE_SHIFT;
 		hmm_pfns = &range->hmm_pfns[i];
-- 
2.44.0


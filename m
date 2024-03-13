Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070F87B3F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 22:55:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyHbBMqp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyHbBMqp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw47R1yqXz3vjk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyHbBMqp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eyHbBMqp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw3yj2C61z3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:47:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
	b=eyHbBMqpmOdphPVDHPexS3Ajj36G1vhX7lqr4pB4NOt7QmQhjyIOvV/icmVrMFugV7x5GH
	z3VNZsGIXt6ughzlXTUes2Vmw8USsMedC2icP47Eu7Py4/LvoObJCBs5aA2dCAIGB9sQ/6
	RYlaC9yqhbh+ks+xgNxOpgj7bKgNoHQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710366458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
	b=eyHbBMqpmOdphPVDHPexS3Ajj36G1vhX7lqr4pB4NOt7QmQhjyIOvV/icmVrMFugV7x5GH
	z3VNZsGIXt6ughzlXTUes2Vmw8USsMedC2icP47Eu7Py4/LvoObJCBs5aA2dCAIGB9sQ/6
	RYlaC9yqhbh+ks+xgNxOpgj7bKgNoHQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-vd73jVYoM3aD9T0X57AaiA-1; Wed, 13 Mar 2024 17:47:36 -0400
X-MC-Unique: vd73jVYoM3aD9T0X57AaiA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-690ab2b0de1so1163036d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 14:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366456; x=1710971256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0Y+ceGC2u4mzi2lycxKAqHeA0qAqllKwMSRaV+2/Lw=;
        b=Vmi0RtGbwu7+wqv/+jnRHAn31gk0waXf/221/hzEkHqHyj3i08P6d4mOqpfj/QpDys
         i8I/Sf9DcqnAtqnLKY1AFPiC/YTJbTTEjDEwQppdVH4ABSeXR9sAwOjbd4s2ih9rkT7b
         lwY8BIRaKb1F9dwEL9OVScj23K/ZHeFffZ9DqFvekOysWlOa2J45dEBd8+kyW2p7lTHr
         17/cTe5wLX4qR798710KiJoOLISLxs2CuiZwHaScHJXbkJZ9rNT5Dbe/i8wluak5ErSJ
         l4lYZpPue94tCOFfGEDYssuScjE2/+GQcu68yxXEW/7Zyvtfp2pDK/ywpmJvV4/OVvNH
         vGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWoUKd+rB49bOf6VSi6ve5dlHABMkYqyPik2vNJiq5VDZ/Vb9avchMnWTWG78vnXlPhXQeKdGeq0lOjHk903ytorO181hfgDhplMKmSw==
X-Gm-Message-State: AOJu0Ywg9bfEI+94JZq/dxnm1X1aND5QJLj5WUeQteu/6kaAjwBIgBeY
	f+xUuaoE2+JWjcbClKshfrsA4GSUl8jRTrvRgoRpNeSd24Z1Ueq7G0df09dN/miJiF82i3/4nqo
	Hqlg0xXatsopWngqJK3J/Z4qyUHnJuTYg+Vg9OVFCuKy1RnzM2ZqnavksGW4KPJk=
X-Received: by 2002:ad4:4c41:0:b0:690:c64d:c2 with SMTP id cs1-20020ad44c41000000b00690c64d00c2mr5759451qvb.2.1710366456313;
        Wed, 13 Mar 2024 14:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+HGFdkYe0dzh0k+TaZTCqm6znW50jTd/iFDz8bJGRu/cwrU7vGL7Qd6Yn9XWGaKvseEdKzw==
X-Received: by 2002:ad4:4c41:0:b0:690:c64d:c2 with SMTP id cs1-20020ad44c41000000b00690c64d00c2mr5759436qvb.2.1710366455985;
        Wed, 13 Mar 2024 14:47:35 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id dv10-20020ad44eea000000b0069111c5cdd4sm60114qvb.100.2024.03.13.14.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:47:35 -0700 (PDT)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 10/13] mm/gup: Merge pXd huge mapping checks
Date: Wed, 13 Mar 2024 17:47:16 -0400
Message-ID: <20240313214719.253873-11-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Huge mapping checks in GUP are slightly redundant and can be simplified.

pXd_huge() now is the same as pXd_leaf().  pmd_trans_huge() and
pXd_devmap() should both imply pXd_leaf(). Time to merge them into one.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 802987281b2f..e2415e9789bc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3005,8 +3005,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 		if (!pmd_present(pmd))
 			return 0;
 
-		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
-			     pmd_devmap(pmd))) {
+		if (unlikely(pmd_leaf(pmd))) {
 			/* See gup_pte_range() */
 			if (pmd_protnone(pmd))
 				return 0;
@@ -3043,7 +3042,7 @@ static int gup_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr, unsigned lo
 		next = pud_addr_end(addr, end);
 		if (unlikely(!pud_present(pud)))
 			return 0;
-		if (unlikely(pud_huge(pud) || pud_devmap(pud))) {
+		if (unlikely(pud_leaf(pud))) {
 			if (!gup_huge_pud(pud, pudp, addr, next, flags,
 					  pages, nr))
 				return 0;
@@ -3096,7 +3095,7 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
 			return;
-		if (unlikely(pgd_huge(pgd))) {
+		if (unlikely(pgd_leaf(pgd))) {
 			if (!gup_huge_pgd(pgd, pgdp, addr, next, flags,
 					  pages, nr))
 				return;
-- 
2.44.0


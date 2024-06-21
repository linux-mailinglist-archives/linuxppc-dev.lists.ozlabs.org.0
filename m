Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936439127C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:30:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsDVcJ7f;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsDVcJ7f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KXF1P2Wz3ccf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsDVcJ7f;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FsDVcJ7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KQM19jXz3cbR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:25:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2ztUKph00cBWbOmplix2Q4QYxHwnhS7TcGpCnDIOcM=;
	b=FsDVcJ7f3YBQvC2+/7lCJERGU6LO2gu4s3mu1YH/TIRyBmu4CeUG47QzlQ7rOHBxKQtdYS
	q3oJLhjvppHYSm/d8FaFKCa4wj0DXGdW4BSzaW/Hg1rPPUMDQR5dBCa3C2PwCXJhsTu25T
	V6XAfAZH/xmPOuzvjHQ0pZpG7sYgE+o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2ztUKph00cBWbOmplix2Q4QYxHwnhS7TcGpCnDIOcM=;
	b=FsDVcJ7f3YBQvC2+/7lCJERGU6LO2gu4s3mu1YH/TIRyBmu4CeUG47QzlQ7rOHBxKQtdYS
	q3oJLhjvppHYSm/d8FaFKCa4wj0DXGdW4BSzaW/Hg1rPPUMDQR5dBCa3C2PwCXJhsTu25T
	V6XAfAZH/xmPOuzvjHQ0pZpG7sYgE+o=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-gwitl1rSMJu7KoxXVK1Mpg-1; Fri, 21 Jun 2024 10:25:23 -0400
X-MC-Unique: gwitl1rSMJu7KoxXVK1Mpg-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-25989a3969dso365780fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979918; x=1719584718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2ztUKph00cBWbOmplix2Q4QYxHwnhS7TcGpCnDIOcM=;
        b=WYmmKhpsdVhR3j6Oy8u+EKlabSz6zQyzt9xHw/OypHFFeXDu1yXeQLJyKNv12vewGK
         UMHpUJwLbzpvlEqXobQsmgyWmZa52NiQPkODFcAFoFbzc/Ylf6b4ub3sJWKVbhIhx5sF
         KLYGE62Wk31yGy3RNGRkh7B7cxvf/rtg9KMz5G4yoOyXmqU1lzUOyEdazy1a+UdNivuq
         Pn4VPbLutFUwc4Em8a3ZSVZP85H0T3vayLRBXK+Gzf+Q3IgrHvnUH0npQFGCvABp7q+h
         dI67r+jYP3m9A6iSbkIFzxfTwd2fI6uufQL7UH9x+ZXfVynXz3GKv1tcMHcndUIKWK+V
         Ay3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhKTEsX5uZpzKHHYgfM7xxMp6Qya+z7Ivi9mkQevpe/KNMT699lOZPtW1+nwx/TmrqsR3ggQa1tiouplaKzN7UopO4o7GsTxkSFMqZyQ==
X-Gm-Message-State: AOJu0Yw13k0Mv11t3Y61yyYZOPOT59IdfAo4neIrK0I44RQhQSrhDowK
	bkrEEgMnaczmFeH7mhNnpK4rZpGarGr49/5C78NIY7hlYZ4YIgaFk7DA+aQ8/i2Xuk+fsghPIjs
	woV8PE5TcBeruJ1w2RT0Do8rCXgQIlncivtR+5F5pKRhCEG2zHk1alXEeNmeAtfY=
X-Received: by 2002:a05:6871:14f:b0:254:cae6:a812 with SMTP id 586e51a60fabf-25c94d8a94emr9065106fac.3.1718979917843;
        Fri, 21 Jun 2024 07:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpfu3cPye3+7RpVIl2JRxNk+CTOiRpoiTdFmb6dpb/ERi8sD9JFsePfCkLHiFMYZR2Pz0U9w==
X-Received: by 2002:a05:6871:14f:b0:254:cae6:a812 with SMTP id 586e51a60fabf-25c94d8a94emr9065078fac.3.1718979917305;
        Fri, 21 Jun 2024 07:25:17 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce944cb2sm90564785a.125.2024.06.21.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:25:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 5/7] mm/x86: Make pud_leaf() only cares about PSE bit
Date: Fri, 21 Jun 2024 10:25:02 -0400
Message-ID: <20240621142504.1940209-6-peterx@redhat.com>
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

An entry should be reported as PUD leaf even if it's PROT_NONE, in which
case PRESENT bit isn't there. I hit bad pud without this when testing dax
1G on zapping a PROT_NONE PUD.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 65b8e5bb902c..25fc6d809572 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1073,8 +1073,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
 {
-	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
-		(_PAGE_PSE | _PAGE_PRESENT);
+	return pud_val(pud) & _PAGE_PSE;
 }
 
 static inline int pud_bad(pud_t pud)
-- 
2.45.0


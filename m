Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D094B0B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:52:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EP5EY6UF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IZR87+RI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfLRr25Mdz3dHm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:52:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EP5EY6UF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IZR87+RI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfLMM1VDrz3dLd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 05:48:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ts+Sj64QZG1FGRDLVoa9nQimNVqUC6U/k8fGPxCUtI=;
	b=EP5EY6UFfks1Ce2q5WPA9TLSenl+gvnrQNUPK4EvGC8WZQcaXja70fS3j3d1D2ebQaNtTL
	PZ7T4jk6C4z/Uss1Z0WsFvQwcyXjy/184NeD/+1zUMIBMGIX49RbiQsvr5ckzrV3ymFLuv
	sR2ZAHqFjKL8eDD0EIlgkeF2/9pmZY0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ts+Sj64QZG1FGRDLVoa9nQimNVqUC6U/k8fGPxCUtI=;
	b=IZR87+RIamqQDto+wtO24buQyMy2d6lHUt6V53JgCVGnU6U6EDuO8mAM8DnQET88ndgBYj
	rdOcE+Bb2cXmwyVl5aHZpyAbw17ApoqgPBb38EPjbwLwshjgfRbfCJShCIHCztg73bpbv/
	nG0t7vH/DAeQC0WgtqFJJHBwq+q2fMc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-hTJtGU_WPuiB3h_xMwZQLw-1; Wed, 07 Aug 2024 15:48:24 -0400
X-MC-Unique: hTJtGU_WPuiB3h_xMwZQLw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ba92dd246fso407706d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 12:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060104; x=1723664904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ts+Sj64QZG1FGRDLVoa9nQimNVqUC6U/k8fGPxCUtI=;
        b=LAao0NhxNf2AF0btrMbh+kFbAE3pWhGwFiteThMRD/oV2XJJb1OtRmJKqt1j7BAgNQ
         /zoeOKb37jgbN1nvyR21OP3uS2KLsAzFBFzY4gx+Nri6Co0g20L8EYTOa2iyf0QoXZ2y
         Y/UsN+wXpsS7FIt13vGd+1K53G0dBo6Sos2gQ39efPBV3dFf82y+MktOWjo2xl+Qedza
         epKJK3jGPyQPlZj+aRITa2jb3MMkm9PiFporBS52w8ObSs214JtEUCIgx/9nWabBDjzd
         rRhRAHy8x6/2tCX56s+WnUuEHzvzC3sevqXlChVq7ElSUrRMUOjKIYh0WndhG9RVQQw/
         Ix0w==
X-Forwarded-Encrypted: i=1; AJvYcCXSw1z0rg1s1006WCYr1UR/abeMUO2/iJRJQIKqkSqXwACWRou5wongXCJ6TseLCZy0Z5mQOequEsgrIZs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxEPIuWD537WcK76pVqJPpijU5a5HvenUD70ABE1Z2sk0yseDf
	6BTTslc7MMV4akouPc1PrlfagzEK3bqejbk8+OWE+H6CWI3zWACVFbJWmJAngnqc0oX/202+q2L
	I/ND6hbHo62DwmkYGUCEXAAT5n7ZOsg/sMpMRsPjOGcFn+2YEU+kRJ6LqYXfy4/c=
X-Received: by 2002:ad4:5dca:0:b0:6b5:e3bc:af9a with SMTP id 6a1803df08f44-6bb9832d2dbmr147037496d6.2.1723060103630;
        Wed, 07 Aug 2024 12:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOqKDpzCy2XKs/l7qwihRy4ZY0EbFICMSu3L2U6zTcNQWVR9cvlOSLvEsobqbXC66x3CvadA==
X-Received: by 2002:ad4:5dca:0:b0:6b5:e3bc:af9a with SMTP id 6a1803df08f44-6bb9832d2dbmr147037356d6.2.1723060103178;
        Wed, 07 Aug 2024 12:48:23 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c78ae4asm59853256d6.33.2024.08.07.12.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:48:22 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 4/7] mm/x86: Make pud_leaf() only care about PSE bit
Date: Wed,  7 Aug 2024 15:48:08 -0400
Message-ID: <20240807194812.819412-5-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807194812.819412-1-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
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
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index e39311a89bf4..a2a3bd4c1bda 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1078,8 +1078,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F23926A52
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:33:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FXKtmmxr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpFf9Kkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtLf3rmXz3dHP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FXKtmmxr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpFf9Kkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtGB43cJz3fRF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
	b=FXKtmmxrEEigCw5GSaSsTGmj3/LaPubQp1lPJxLRff5pVWAo0anbUMvFfJLMaqn64WsZyv
	3CDlaVAj5CC+jwT5PDkZ4UZmeQBATdtIfgS+5EuJ1ZQ7hZ5Asg49fZagiv2ODqXrv/b//J
	2L6Fbo/fBAznPpEmzmW44IRMQTa5Y5I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
	b=GpFf9KkvOZXx5qmQNGd4rITI5B2ggnpYAwljMLL6bBkHCh0taS3O41TlYHw3l8X4QvAfeY
	LuBBt4ihMWawcHBWBPmJuxA/Ohk+hpOu/VnAXNqwPfpW7Ftq1S+X2Zl9E43x2UKBTdebh6
	mRUu8Tcmm7CfXoLrxbVPeHL9pbuZ7hk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-ohV1QzQGPimnYKZ8TixxkQ-1; Wed, 03 Jul 2024 17:29:32 -0400
X-MC-Unique: ohV1QzQGPimnYKZ8TixxkQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4464454e329so1958011cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042172; x=1720646972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
        b=EADLrxblDoTAWgwDmJ6nWnriV0/E6RT1PTcGcBeVIVkoJTMRRSo0S1da00YLfusIEp
         ZraGfjfJlETO2EEhFRokVeD43DJ1B9NW/WwZBt2CWvtBFZqjZ9/tQx60ij+kdbjpDcGp
         hXgGQb/rg4HnAomi5whjV1fK9HnvrYVJbMetGV90fc5+kcELsVh/S4YVBNY+KeNsmjQ6
         jIuEo9QG1n01QSA1EhH0RCteM6TgMzsvZ3q8A5R28jIdjzQqzBrbFNmbCRzkt7hKwkxH
         jGxklut+8djSKGf4WaShlj8MK8ljDO0NmEn6bSvu7uPS29Zxa1Wd/Ti+byS6TBGkeA61
         mcCA==
X-Forwarded-Encrypted: i=1; AJvYcCUc0cFnfJX+r4XBxc5/Vu3v1ig0ao9ZzosWMyNqnAiRMKOpKt7PH0zXQlBnAuwodKAzEZSPGWibGGwc09tGVy7iTysrV4ke20+9i9iKtw==
X-Gm-Message-State: AOJu0YxAdZyPxWl6dORYHQT77WnN+gsvZrfixpoAfxwdBnLrRLhyT2ZN
	HoO9QT0mYOfPXTPtkQAqAt9no7sNRv+nHHFfgXZJRM0CBrg9jZEKRI4IKDKyL8/Tze12E5E2BEg
	N6mluY6DJwQMFHnrzUqOtOeXczshSLBltQcGkNOZr/MCxGz+8DMgA1SduNJTccuE=
X-Received: by 2002:ac8:7c4f:0:b0:446:4428:2d8f with SMTP id d75a77b69052e-44662fe8d5dmr138289601cf.6.1720042171885;
        Wed, 03 Jul 2024 14:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMHO5UTPVYkVSEJYbLjxCcukt7PlLC0h81KBHiBOgwFBj/wiCFjtQJqk/7gb0k9Iu8HJBYNg==
X-Received: by 2002:ac8:7c4f:0:b0:446:4428:2d8f with SMTP id d75a77b69052e-44662fe8d5dmr138289521cf.6.1720042171603;
        Wed, 03 Jul 2024 14:29:31 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:31 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 5/8] mm/x86: Make pud_leaf() only cares about PSE bit
Date: Wed,  3 Jul 2024 17:29:15 -0400
Message-ID: <20240703212918.2417843-6-peterx@redhat.com>
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

An entry should be reported as PUD leaf even if it's PROT_NONE, in which
case PRESENT bit isn't there. I hit bad pud without this when testing dax
1G on zapping a PROT_NONE PUD.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552F931AE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 21:25:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NpPkaEXf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlaI9QPa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNBxx12jCz3d8x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 05:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NpPkaEXf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YlaI9QPa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBsR5TbSz3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 05:22:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
	b=NpPkaEXffuebhJwhLcEJQTDztAjfNBUEXu4TJCyeQe4oCwR1SfzdVO1Y8GULCLEqsdIvt+
	1+Egnfs3O7PPv6DZSvkOiF15xTng/WGecwNQY8wa7H1Lz1L8l6W+rYCwBKpQDF+fl6UYe5
	g3qMvIsTVGRUbb3c6bd1y7d8SpDErKA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
	b=YlaI9QPacGnYVr/+RnEiIT09nODOOTEdtPukn5sWIXwqUSuKDtXvuSrXRSwI+KJ19gY++7
	DZtPAWVpO23v28zS0z9IpLf965eJgVdtxdBOGpp2JUZK5KUOBbAH/pxkssMwXVDSkRUFWn
	c41ttFOjsWy+MKnEbCXhlK0ruKTPEvA=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-KiIcz2RrMxm9ZX66RXyfJw-1; Mon, 15 Jul 2024 15:21:59 -0400
X-MC-Unique: KiIcz2RrMxm9ZX66RXyfJw-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5ce529cca68so557231eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071317; x=1721676117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFEuzrgphkpyKgRaMn/StFmQ1IWZKcW4qj9eIjoToHw=;
        b=M/jh0qIwIH4CVolRwSKAZ7zr98H3jjEKivQm5vjwjfYI+/ZKFjkw8nJUHjcXtr7gaq
         x1ARnzsDaqOzPh4mP1E9f1wRH7deBX0bZG0vCIc1W07+FDg3gjmBIj/xvRtuD97Bu9Hu
         g4lnCLgKb7xnu0lfhlMXWk1HSCLWPRG6OXIVEUF9mN7QB2lQtBgyMcIa/XYHvxN5zMoO
         QgFYoAhkXVfdOEX35Gk2fWvss0aFij5R4yMeYW3MhqwUOWI2vqB+b6905ExklC+61BJ7
         MG9as1HpmlR5oUmGtRRJgGZz4HYEJUKugipJ/UZDZz36pENT47zLQAqCQJgK/5IK7EoV
         nHGw==
X-Forwarded-Encrypted: i=1; AJvYcCWPtoCbxIMChuLfpS/tHMqyhQ3sKZCEY/NoPeVSIZHs5OVyYaoR248r4IPVsk6kSkvbg629DhKBGp+dmjY/llxR1WO3JR12ut5zSzuXpA==
X-Gm-Message-State: AOJu0Yw5m4IRftNFT9j2WRZihBrXZy0fSWXgDFzgTRrPeyj6Iv+rzP30
	DaQgnOVS+XTg/wG/73HZpoeWod+9G/Cmi2SwHN8LJ8TWdazkDnD/CLHB+5Uy9GD4e+byC6pWJbA
	9MmPN8hBdzKo8I6a16e2aOoy7iJRlyYz+OFi/puEVYCdJumViShoRg4WVaN4Befg=
X-Received: by 2002:a4a:4308:0:b0:5c7:aeba:77a0 with SMTP id 006d021491bc7-5d25035be58mr500662eaf.0.1721071317070;
        Mon, 15 Jul 2024 12:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHclECHVFRdVYbFwnrtKH3lJcHIiAHM9jyDo1qTRx8+nslWI3GA72lYOtCld/HD9tYeAzQ33w==
X-Received: by 2002:a4a:4308:0:b0:5c7:aeba:77a0 with SMTP id 006d021491bc7-5d25035be58mr500637eaf.0.1721071316695;
        Mon, 15 Jul 2024 12:21:56 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761978d30sm24039356d6.31.2024.07.15.12.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:21:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] mm/x86: Make pud_leaf() only cares about PSE bit
Date: Mon, 15 Jul 2024 15:21:39 -0400
Message-ID: <20240715192142.3241557-6-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
References: <20240715192142.3241557-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
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


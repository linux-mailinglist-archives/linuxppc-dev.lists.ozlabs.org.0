Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A1A7ED8EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 02:30:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpriMu8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h2bIeuXy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SW2XQ5kp1z3dBt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 12:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ISpriMu8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h2bIeuXy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SW2WY4kbCz3cFh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 12:29:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700098162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUKDadnp+1aD4MuuhezpyppaSOr8lCSuMGXbTAXddpQ=;
	b=ISpriMu8yGjWIlMf/FTN2qDnDbzOacO8LwZIbhWXXo58Hnn9Nc6gSZMcWhOBS1wIao8ku0
	bnVByu6CqmwzDz+epiELqETzjevXFEhH82E9kupK1KMpBGzkQ1nKxo39GZC+s1Z7F8zxXD
	kTjF8XI+hdybutIHwveXzVtK8Kpm0Hg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700098163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUKDadnp+1aD4MuuhezpyppaSOr8lCSuMGXbTAXddpQ=;
	b=h2bIeuXy1K3H3dU7wyqQYvL+N9Q4n+o2GDSdHRP1jc9faHlpqB8Q0g24zvW9OEt2S4VklS
	vtLqEPMnwa4IG2pyYZbPEsoVFxJd4t87x7YEKbTNtUZe6WDZV9gasXUDFOUXOrsZ20AB7F
	lDFM2KkdPbtHSUUHRvDovuqCWjB8om8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-HCORO31zPcGdb_Pp0dbC7g-1; Wed, 15 Nov 2023 20:29:21 -0500
X-MC-Unique: HCORO31zPcGdb_Pp0dbC7g-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cbafdb4b6so931531cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 17:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700098161; x=1700702961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUKDadnp+1aD4MuuhezpyppaSOr8lCSuMGXbTAXddpQ=;
        b=qOK4ZVWhEmyZiE/1eQm2tCtWxEO2hj6PovwIKjmhilj70IjwYnu/0bT4CX+dOu6urr
         9djsw/MXWODd3gTzvr/knKTC7o9ePxsIapY1yiQxOm2izwVzxPU+YG/bHvUIFTb15sVE
         KjSpS6rq+brYu/cfUBEKuPbHHivX2wiJ4ZNZg4ZQMuZeUeB8kUAPdS+rHvb6kVemfmLn
         HQSGE10vlv7BQCCrvqmxHwlPP0BYh2SXHHxnj5LZHXWv7hJLLxUlXcXJ+5eVMiPUXhgy
         bo9l6vsyEabdfG3eQNWJUJCiWcmD3Tzptz24zGAsx+Mll+q8Ax2kUi1Vy9Z3EMv+Eq6v
         FTjA==
X-Gm-Message-State: AOJu0Yym6pDONhOnO8ybEpZyOlpfmHUL7HP0D6iNrEEZ+62VUucL7Eo2
	UAWlCX2dKakMh9/YAoAjWF8yyNBNE7dTo/FJEnxg+gr9ZazWX1+TelmZTS82SLfly47emYPC2Kc
	M3BsbWsJhFvS3tEqcPrTqLSm8ag==
X-Received: by 2002:a05:622a:810e:b0:41c:d433:6c86 with SMTP id jx14-20020a05622a810e00b0041cd4336c86mr6482575qtb.4.1700098161047;
        Wed, 15 Nov 2023 17:29:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBd1/VL7OzaVonjYuLiYORLZv0OSCh6ZT9Z6PevvXUdWDeqJg/IL5dpgLaUCzFthgUgScdWA==
X-Received: by 2002:a05:622a:810e:b0:41c:d433:6c86 with SMTP id jx14-20020a05622a810e00b0041cd4336c86mr6482544qtb.4.1700098160768;
        Wed, 15 Nov 2023 17:29:20 -0800 (PST)
Received: from x1n.redhat.com (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id c24-20020ac85198000000b0041e383d527esm3922598qtn.66.2023.11.15.17.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 17:29:20 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Wed, 15 Nov 2023 20:29:02 -0500
Message-ID: <20231116012908.392077-7-peterx@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231116012908.392077-1-peterx@redhat.com>
References: <20231116012908.392077-1-peterx@redhat.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, peterx@redhat.com, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hugepd format is only used in PowerPC with hugetlbfs.  In commit
a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
file-backed mappings"), we added a check to fail gup-fast if there's
potential risk of violating GUP over writeback file systems.  That should
never apply to hugepd.

Drop that check, not only because it'll never be true for hugepd, but also
it paves way for reusing the function outside fast-gup.

Cc: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 0e00204761d2..424d45e1afb3 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2816,11 +2816,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!folio_fast_pin_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
 	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
-- 
2.41.0


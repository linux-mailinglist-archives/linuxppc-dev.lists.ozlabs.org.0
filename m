Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F88B4D91
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 21:02:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Axk6keNv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9SqdAw5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSG7B4rgmz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 05:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Axk6keNv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9SqdAw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSG6N4PD9z30gK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 05:02:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TChkYNJLokf0R7TU3fj1Jd4fvD6sn29Wrs03bf1LQhQ=;
	b=Axk6keNvXKEbIba4UfZYVs0EImo7LuSWyQJok2oAAnhJA5JZTgj4Cm5/YDlwOAXvhp72uJ
	VjYgsQ5cthy7flGvlgpj8GF9T9JGrtNRYRnjA23w+kbdnwX3tvVP4OmiPwAGozauF4tcHW
	nMyKjz0MkkS330rRfiAs3oIJ4JpkIYQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TChkYNJLokf0R7TU3fj1Jd4fvD6sn29Wrs03bf1LQhQ=;
	b=L9SqdAw5Jp6lX2qgXB3sIjYo7KK/AviG2+8F9ZhhT7gWOdnLqZ9l52rNlZs8198QocXf1n
	EZ5sTe7dOhjQxlB7AclvAHmy3mw9jhqJM0dtPNYWvXUVub+gjgEjpYC1wxQYgIoAV5AfM5
	CAgOwlca02EWQbPUcNkBjjVbsB6GDLo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-95DZ5fYmOQu6o6Q8bIkMug-1; Sun, 28 Apr 2024 15:01:57 -0400
X-MC-Unique: 95DZ5fYmOQu6o6Q8bIkMug-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5af985fcdadso684596eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 12:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714330916; x=1714935716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TChkYNJLokf0R7TU3fj1Jd4fvD6sn29Wrs03bf1LQhQ=;
        b=BQd7rm+TIl37prJ//JY2V1azGNxleo8d+NdrMOv2ttz6xxFUIeob6FxbKVMeVWAd5Y
         WC0yYbv2Px8R1e8nto7gqiqi8Q+FgWWyejqLtUhYakx+Vp1bHgu9sVOy9Umenf+efNzj
         uaReiutUOQbfBzwCZS6aGO/JUMNeluoqbeG8DTtiX4o6VrluHYOLokyPNHkwaLHRsRM7
         w/JVT516VCtnGwn5I3gNxDeyai/DRj8aDqaJfqcBam6G3E3u1DDaFhovVAPFIvf/FIpd
         S8werF4AIwTXb32Jm/c/2j1SC1KslsHHg7Lv4val1TLDxha3qzSn/WmBNgpaMWMrKCyh
         uTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQ/5+LS2RJ/DIRYN7mEdMRGrGJ7TXQkQaJpB1BfjuytIz/bk/rR+HGPX+E12Pv5lI1XJh+OwA+RDgzEwwXnSkIdv8PC9Z1VvJDsOnLA==
X-Gm-Message-State: AOJu0Yw25jt95eDEX4jJKpNDfFa4eQs92CJRVtW8yJgQUcX5UtnfojwJ
	eBPlx/pXxRPwmM6H8kCDczhJZZ6Tz0Uqb7zKOnWbYnYTSKNkApioaXjL+J4ZJtlICthPLAkzBY3
	i57s8GB9mxUmLCMy6dloExNnLcSncBZEVuJwbcbom+TLoqB7Y97DTGAon/GmdQVw=
X-Received: by 2002:a05:6830:7193:b0:6ed:ffd4:f871 with SMTP id el19-20020a056830719300b006edffd4f871mr5375195otb.0.1714330916162;
        Sun, 28 Apr 2024 12:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbfCPhcOZyAaf7bBZJaTYiO0a8lHR2gVf15VHmfKPjl2t1+bRyODyi0XieC0TmXGWNmTdCnA==
X-Received: by 2002:a05:6830:7193:b0:6ed:ffd4:f871 with SMTP id el19-20020a056830719300b006edffd4f871mr5375155otb.0.1714330915677;
        Sun, 28 Apr 2024 12:01:55 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id oo8-20020a05620a530800b0078d693c0b4bsm9818152qkn.135.2024.04.28.12.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 12:01:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/2] mm/selftests: Don't prefault in gup_longterm tests
Date: Sun, 28 Apr 2024 15:01:51 -0400
Message-ID: <20240428190151.201002-3-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428190151.201002-1-peterx@redhat.com>
References: <20240428190151.201002-1-peterx@redhat.com>
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prefault, especially with RW, makes the GUP test too easy, and may not yet
reach the core of the test.

For example, R/O longterm pins will just hit, pte_write()==true for
whatever cases, the unsharing logic won't be ever tested.

This patch remove the prefault.  This tortures more code paths at least to
cover the unshare care for R/O longterm pins, in which case the first R/O
GUP attempt will fault in the page R/O first, then the 2nd will go through
the unshare path, checking whether an unshare is needed.

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tools/testing/selftests/mm/gup_longterm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index ad168d35b23b..488e32186246 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -119,10 +119,16 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
 	}
 
 	/*
-	 * Fault in the page writable such that GUP-fast can eventually pin
-	 * it immediately.
+	 * Explicitly avoid pre-faulting in the page, this can help testing
+	 * more code paths.
+	 *
+	 * Take example of an upcoming R/O pin test, if we RW prefault the
+	 * page, such pin will directly skip R/O unsharing and the longterm
+	 * pin will success mostly always.  When not prefaulted, R/O
+	 * longterm pin will first fault in a RO page, then the 2nd round
+	 * it'll go via the unshare check.  Otherwise those paths aren't
+	 * covered.
 	 */
-	memset(mem, 0, size);
 
 	switch (type) {
 	case TEST_TYPE_RO:
-- 
2.44.0


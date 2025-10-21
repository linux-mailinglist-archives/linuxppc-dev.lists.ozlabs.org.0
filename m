Return-Path: <linuxppc-dev+bounces-13092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF8BF697C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 15:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crXSd3rHGz3btF;
	Tue, 21 Oct 2025 23:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761051585;
	cv=none; b=JmCRciic4b2VRAVtNm0xT6SIpd2SuItA+weXN9gMM3XyByUXYo2WwzbzRoa+Lenbcxm0gZPtqs0QbUO5khaHJwaFgfRteddca6iZHLsXfPrj8+i7/VTdYTY+VtNQVlmpVDi59T7WvfwsV2F6ztq0P++UPgYBwmv6F/AzmYp1HfxGB+vwnM3ucobctf+beVB9ZmbqdSGXXS1anE/Dmfrx/SJkUN4M1YYgxWc+6L4R8E5VBRleXBLtliEnJ4lxmAfxCznTjwtr/NldHW2NOQ8PgjAn5XY4MsT1GXm9eJk5INgNtaG7ZBjtGt6d+gR5kUC55z1MAbcZu7Qdcp09ETsiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761051585; c=relaxed/relaxed;
	bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gjbwbnbrs92Y1LDPMG6gapWVesskJPBTPRP8HtDvrl7Q2rDGVbtn5tNYaMjBHdhl5zghpgjBL3CIwlgkv38cGE11f92jlfcOUWlx9wKQJZmtFvkRh1/BeXZzHxe4hkxqNcwLAo59Q+inoaVHtPSNn5cDIQYydxCsh34KSLmCylvbzt57jWXuLAShUQTsGdJq0u9pbLbJ19W0qGg0PuB7EPdGtIaqK/O/H0O8IDHNvNsbRZSHAGQ/FA8mh7o+ppDmPvdVKFdUAPvcK1Z4N7/yY3gs80L70vPWkDXq8qp6FERf9boLXjjVMFhDnQef0eWV04DJB46DvyI9KG49puaekg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SNeghmcf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SNeghmcf; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SNeghmcf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SNeghmcf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crXSc4XhJz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 23:59:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
	b=SNeghmcfgssZ09SC5mknOSPcnvZ+wpNLLAB2pEISK92cKdUlxW4xrPkIMX5aCFardcuZAy
	oYRZ0S1TiHJME+DIYtfR3uOywCgN7QjM+WPhM3Rw8PzlVmuyDjJ9z9S0wmcKKK1SuTzGz6
	YDwCoOaBEg57+1cP5D2DfE9bLwJKQIg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
	b=SNeghmcfgssZ09SC5mknOSPcnvZ+wpNLLAB2pEISK92cKdUlxW4xrPkIMX5aCFardcuZAy
	oYRZ0S1TiHJME+DIYtfR3uOywCgN7QjM+WPhM3Rw8PzlVmuyDjJ9z9S0wmcKKK1SuTzGz6
	YDwCoOaBEg57+1cP5D2DfE9bLwJKQIg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-ZZNEHraaOkeSDYBwuRJQPg-1; Tue, 21 Oct 2025 08:59:40 -0400
X-MC-Unique: ZZNEHraaOkeSDYBwuRJQPg-1
X-Mimecast-MFC-AGG-ID: ZZNEHraaOkeSDYBwuRJQPg_1761051579
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47111dc7c35so38737975e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 05:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051579; x=1761656379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cInpBRrRn5ydv+Sa63F4MdgmnDVvTCru+7wR3lsxUS4=;
        b=Ri8SRB3Y8Kcoc6KfrmLzw0t2PQsyCIg0XNM5lj108KlDqUrQOJtjsVBJrkPxH7Q3n7
         qDGlBgjnrIe5zt3uql399lNDyd+jZiIReOKiTkUXbrnuiPkA5J0x7EZyKguSLaZV0DpP
         nM1Qio3EhwLOmJxzjR8umMPDTgj9SGLhOYwPzNQLK3tXiI9sqnl754qrnVHBeLLECRXT
         H9z9ZPVLhx6jC5wFAjPyWLwySxdkyVqFFdCI+4BBmrI1UC3hz74G/HDCISoWLUegsdD0
         XejbgCbkheipPPCP62CCxWuCxIIXSxaizz4VMe1wlNlKX4xxAuDMF1g71MprHtUoGqZR
         7nFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUyMknwcULz2NZSxalrCUIRupZ2yMQPT2Q5hIlTZhMzqzntqqy5XxMFF9GPTVYe/LogsXSPrxcVOLhEGc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwBVEcfpTe9JbeB4Ny8rBUPY9lQglzXWsdvQVPq3DEx3ezm/jU
	3tiOXxfuWGAa7K1pyz8bf7PpqRdqg8PEdTH81blf+UAwYXXrw3U61RsyPIhiq/JptfFGcyj4zb0
	hnEgplM0VaAfNC7sKxsuYhcFA5RupgPNhVBotZxsObOTp2UiUB/3dP0o55eV7GbU4CYfbP4Qnhi
	g=
X-Gm-Gg: ASbGncsnCUUbAB7l23Jua+8mOLgJZCrPu9ri3Syy5uqb1rR87SUmVAHopF4d7rloroX
	RmHrmkvJG4Fqfe2I+EYqHCqoyirWASF+7l0wMNpWKyOW987zl8WdxEeC0rEcIIk88yBQD7WFXHC
	44fsy+2QLOl9exuP/njgvTdZCxqRv1R+Gy0kbm8npjOkVZ7TBOrj+exYIkdXF3XZsiuwk1I5PVT
	F9MxuNadeJ2WPyBFT4taoMX5UFaPAxi9U1xeg4OfcIWwjJn6g6Tiptum6ogbzvxWSgzQ5gfkezR
	MM7gVAcCF+QX3GmcWTzvW0SU2Vb7BQtexz/u7R9WpXVLPSiG35KnZ+qAezaAoGueg/II86UlrpM
	vQBKYuBKTCrZc7Tbanq6OOmtcyXZgwbfDXlaT+c3H4Vj5u356rAx7W+iOKoT5
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr122622645e9.12.1761051578989;
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+zjcAWFH7UfZS6G5yWsBJ4PGUBhvAl9sC1ULzHpIWHcC8Aeot/GO9fktrhO0M9VdZy+aJsA==
X-Received: by 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr122622255e9.12.1761051578618;
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a781sm20658322f8f.30.2025.10.21.05.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:38 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 03/23] powerpc/pseries/cmm: remove cmm_balloon_compaction_init()
Date: Tue, 21 Oct 2025 14:59:08 +0200
Message-ID: <20251021125929.377194-4-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eRWFTcBJ1d3rRSxXSJim-U8utq48x0D6hsQwQM28Ko8_1761051579
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that there is not a lot of logic left, let's just inline setting up
the migration function.

To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
the compiler happy by only providing the function declaration.

Now that the function is gone, drop the "out_balloon_compaction" label.
Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
to movable_operations"), now not anymore.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 310dab4bc8679..67c7309c36147 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -548,15 +548,9 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 
 	return 0;
 }
-
-static void cmm_balloon_compaction_init(void)
-{
-	b_dev_info.migratepage = cmm_migratepage;
-}
 #else /* CONFIG_BALLOON_COMPACTION */
-static void cmm_balloon_compaction_init(void)
-{
-}
+int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
+		    struct page *page, enum migrate_mode mode);
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 /**
@@ -573,11 +567,12 @@ static int cmm_init(void)
 		return -EOPNOTSUPP;
 
 	balloon_devinfo_init(&b_dev_info);
-	cmm_balloon_compaction_init();
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		b_dev_info.migratepage = cmm_migratepage;
 
 	rc = register_oom_notifier(&cmm_oom_nb);
 	if (rc < 0)
-		goto out_balloon_compaction;
+		return rc;
 
 	if ((rc = register_reboot_notifier(&cmm_reboot_nb)))
 		goto out_oom_notifier;
@@ -606,7 +601,6 @@ static int cmm_init(void)
 	unregister_reboot_notifier(&cmm_reboot_nb);
 out_oom_notifier:
 	unregister_oom_notifier(&cmm_oom_nb);
-out_balloon_compaction:
 	return rc;
 }
 
-- 
2.51.0



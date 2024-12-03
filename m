Return-Path: <linuxppc-dev+bounces-3704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C199E1828
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 10:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2bRk2RbVz2yDj;
	Tue,  3 Dec 2024 20:47:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733219266;
	cv=none; b=avPG8Ytybhbtj5PEVxXwVznwSDtXVdi3Su4chufzi/j2T7IgJQ1ipjy0AED4cp6w1qLppwoz49f5RBDyWAJKx52wX2ftdDcCENn/QdMR1nwOqQGBe6lldx23OVgL7YrnNm/beBIMIJBnESb9jqWJ+riSvepqsjpz7cKAzXznPck/XHFCXawsX7JvE+ayFyCPiVnJbr0y1CZTx7AsUh+EaEq9+TGRyvhaxrGiKvtiHzFQvEh1UjH+76gbSc9Hx9x5jkxkjkFfh5FtDYlGIoNcw7mdd3Wsi6qu3HN7E1+NVhJi9QCbAJICV/MQBR1qZ85tOAyeEeWVzDnJ0m8MZ2WMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733219266; c=relaxed/relaxed;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=obmVzs3+fIIeq/8sCOlXjHSzzwTHrr3qDa1YaA2EQVockqFtak+cMrqN0TOnSt9LNsL4pqotDIH6X4lYaZCkV3kz1BoPRXGa11K9bo04CTtr45u/X0uXW9WV2+II9rxqbDF23VkFfTsvyjmrbHa9Y5PhH5sWCo1IoE+UjPIhID8y/sS3Lhr+QHz9crqq5bMhur0wNSaTuraQMakT3jKEzGSV4CML1t5SWgrl9XjLRfhEC1oN/LQFHzKDVE2OYbvvO1BW47lXjeQ60NOl5qDyT70KLtwMYNnPY7Gxr2ecxmDeEPjf08ifjT+weiVxlSCCpzzz3qnJ0fmHrMWP9WGH6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvfGAkHL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvfGAkHL; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvfGAkHL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EvfGAkHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2bRj126Cz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 20:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	b=EvfGAkHLlY92iKyCRaWecvpzN+kGHK5bQsXeHfSkfmMDzfWbQSV2n1eLxVAdCmoZ/AL6ig
	O6GieysnZEv5DHxiiWYLs2EgVnidbE6RJ/gjviAeROG7YYlB3NC3L3VdkyNUZ3pAGdJz4I
	KbnmJ/EG5EVhyVlUX2REHg8NHi2wXts=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733219262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
	b=EvfGAkHLlY92iKyCRaWecvpzN+kGHK5bQsXeHfSkfmMDzfWbQSV2n1eLxVAdCmoZ/AL6ig
	O6GieysnZEv5DHxiiWYLs2EgVnidbE6RJ/gjviAeROG7YYlB3NC3L3VdkyNUZ3pAGdJz4I
	KbnmJ/EG5EVhyVlUX2REHg8NHi2wXts=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-BXYoflxDO9C15XrEPfN75w-1; Tue, 03 Dec 2024 04:47:40 -0500
X-MC-Unique: BXYoflxDO9C15XrEPfN75w-1
X-Mimecast-MFC-AGG-ID: BXYoflxDO9C15XrEPfN75w
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43499388faaso37359885e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 01:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219259; x=1733824059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adHjUEuwXA+ANkdOzZ/yc4IEWn5pdw/yGiEpqds38YQ=;
        b=u34RXco7tIgR5T8D4dAd/52DHHrLm8W4FxI60JfjoKf1aahTcalB6v3bKAFD0SnP/y
         LJR9A00TCXFn9huc36/fe+b508abTzJmQr1w6QQo3wnkZDeaphd316TtM6lmkMk4VC/7
         lECarHyitSvWrwVyQLzxG8LzZpD/H1Zrt2TynIF1LdB+YzAI9fbFJOVzY/tOfRuzemB3
         NG57Qz0mGtWNsvY1IIkgyXibdUSnbmung3QCBYQ/4bSYJOFep59SfR3BXZwK1B8JmA/Y
         rJ8pvfRCz+yTBiQI/zkedu/X/xy06lBUnmLJBqbYgzkorkTOBb3WoVNxVoYHP4ntYcGH
         6lPw==
X-Forwarded-Encrypted: i=1; AJvYcCXIxd3smb9ZxzddanrNP2/3mfAUTJS0aZ2EJ092i2Cax4JTsU0NkmXuwvZs2qjQLJOCgGUrjtJfPzAfzD4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz67mUmGsDBItwWfN1Dza32mJQAPXt/UAOkogizlRgcFkrBvYVa
	qo5P52GYEqdT+9Z016mUj6zR+2ZEJ1OEcQuWoJd2+ly1mFAPS3LNBuDpTtqMkdG57fCFULYUuJe
	hwP6qut6wyua/RDaaJUobkGACgmtRBqUrwXWeLorferp2JfxbvZ6UsRZ4HwALawE=
X-Gm-Gg: ASbGncvDZvxNP2LjOXL0kdCi9jMeF4l7VnODUBZDQMLO90ZYb8ZPSi34uoKK40tQhEJ
	w154YOLWpG8zM0GTv9JaMqxnCKRNkE/YlWg80xsKgVYqLHg50YczBlIvgVlUJ7T5RdCEYYJkTvO
	wWhciJHyj2P+c7P6mL1zHXzkorJ3NTfU6r/LhoSIju9J5qsCOhD/vIfQxH8CvhosbJC0GWl8N6B
	hThR30Aq+P5QBPPk5f8ekFWpfmoMHJXd9+cHFp36XTbNBIQczTbcx/pY+R+F6KDHFELxGylfI3f
	8FhD2IDDysMVyuBYzoKMiQQvrBNk3l8jxRA=
X-Received: by 2002:a05:600c:19d2:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-434d0a03be0mr13411235e9.23.1733219259534;
        Tue, 03 Dec 2024 01:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwdCbQ2+x4fQDn4t4+UDQwQ2YQY46+IOELCndGNvUKUKqg7eAlnbIgz+QXoKcPKq7fDw8IyQ==
X-Received: by 2002:a05:600c:19d2:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-434d0a03be0mr13411005e9.23.1733219259183;
        Tue, 03 Dec 2024 01:47:39 -0800 (PST)
Received: from localhost (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-434aa763aaesm213653525e9.14.2024.12.03.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 01:47:37 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH RESEND v2 1/6] mm/page_isolation: don't pass gfp flags to isolate_single_pageblock()
Date: Tue,  3 Dec 2024 10:47:27 +0100
Message-ID: <20241203094732.200195-2-david@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203094732.200195-1-david@redhat.com>
References: <20241203094732.200195-1-david@redhat.com>
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
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kea4jDY7FWWLwmcAYS2Z6kvfuCf0VwGcb_Db3y7vPgk_1733219259
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The flags are no longer used, we can stop passing them to
isolate_single_pageblock().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 7e04047977cf..e680d40d96de 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -286,7 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
  * @flags:			isolation flags
- * @gfp_flags:			GFP flags used for migrating pages
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
@@ -306,8 +305,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * the in-use page then splitting the free page.
  */
 static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-			gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
-			int migratetype)
+		bool isolate_before, bool skip_isolation, int migratetype)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -489,7 +487,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
+	ret = isolate_single_pageblock(isolate_start, flags, false,
 			skip_isolation, migratetype);
 	if (ret)
 		return ret;
@@ -498,7 +496,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
+	ret = isolate_single_pageblock(isolate_end, flags, true,
 			skip_isolation, migratetype);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
-- 
2.47.1



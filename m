Return-Path: <linuxppc-dev+bounces-610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B32960C86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 15:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtTTs5VSkz2yV8;
	Tue, 27 Aug 2024 23:51:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724749945;
	cv=none; b=I+agCvT3lXKWmOLW0JFccfs/evoj6T2aDmD/g9o2MsZmFFnssqMSlbxJYGXN955tDQvsnaciADEx4N1UaScguUHFPkrbi5121DNNS4pjjBYQa8Y7hbTL09mSd+ODiznhg10U9R9rcalQ+9cEu0cgYVqyGYUIOpDuAqmasRTbhMSpvPaR14XtzL70dISWeffawvIh+Q2+9fP9Qh5lR4SIF5kYpMtirDJGNqHwPCYcfLJqTM5vcCImSXAlMdjrHt0Sl/U3U6QOq6RzrkwAYdmjqJ7AcLM066avoggv7Eli75Zzv15Zr31/RZHWmCf2xey+dHPWrRwfEO7PUIEhRABmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724749945; c=relaxed/relaxed;
	bh=5k3/8qSNos56A86IMpzBShMFvQxlC2q9OGMugpqaxkg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=mo5vQt632OmCkLEKeYkSE0P4tOozQPoEktdU+CqMKA+eByTL0EVO5leGyBcbZiDKBeWZVQS+iQjLa7kyC5We5i+7YUaVOrqHZ5FOVlI+JzmG7DzrdeCTTAt9b3QDqpJMax6y+2jbvs5orfiK67Mf8qgkx0Tm9W7WX5YxqJRDxp0cSTzykQ2YzZmkjrHtdGxx+NkO2arTtoWfrEhftr0S1+AyAZrNoWh+jl/+iG4GxxsIcyyn0umfZI1K9QB4zlL0zQ6eCpuyZwpXmr/0mUGdYy24fbGDt8YXOG5k96jN1+wiUi+C4ypMlcBn7ZbUVX0eUd8tGCABwF0HSMWuC4pRoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=neATqp3M; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=neATqp3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtMJ85hg7z2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 19:12:24 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-70942ebcc29so4833930a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 02:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724749939; x=1725354739; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5k3/8qSNos56A86IMpzBShMFvQxlC2q9OGMugpqaxkg=;
        b=neATqp3Mk4VO5Y48ghkX2Gfrlga9+j8II6Zo6QljQcwTgnchX7ETmcs38E9CY/R89n
         4KACwBEOQhUwjiuTBjxTEj0tYcuk0X/nk4YO5IVp6uVaaylIdr8q32mRuEk2+XVfeu8a
         /PlpZKcUxUREsUrOqN3VNO+tqrBzDT6Nk8L7Qy5qotTn1F4jZnSsna3hx8GQCU/+JQna
         uzBQc+zadRf5Qxw2tDud3aLKMPIx2pCWoSyUJRw9MfDQulM7pSaiUHHhRMSH4pV0GQKk
         kWWwqwjlcYVw/9PuP/ItBbI3rT/Ul7cm+jHAlVK9adpJQClMGAwdcCRynJKJu0sENwl5
         KbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749939; x=1725354739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5k3/8qSNos56A86IMpzBShMFvQxlC2q9OGMugpqaxkg=;
        b=gPobIXYz4R/j03SrzZoVzfWD2viuWyNBLcPNyPkc14v/Wz6RVBaUL2ZcGp3jTDbVTX
         DKb3Jeh2s8N2/8mP/Ey2Tx0GNx4paoZAlvxs3OL7sDiLLCCkXMKQG48pdeoPtRktPgJ1
         SbG0zH+n2f3wY8gk40jjmEuljSZBRREiLhAuWPhNgiXXIur302bQBJP3qHFQuWutnonD
         3uhXloW20/SszNo+EmVbDAQgLhIJGZ8Susr2GKA51AtyLADy0n2wZRPamp4W38iObO6r
         uulmnBQJjRNayU2FmJtOk8PDz64UvG3ePhEGlQrxwcoFgxDpjJ4j1ZO6zXm7BRng0hD0
         XUEw==
X-Gm-Message-State: AOJu0YxbEtcNrX3TqBSPIIJi15JjMpMDBpnadQEKdbuAmbpfJ0jw1VYN
	P1Js8M7ykK3IK8OyjOtbY58KuJiH1q8laQLd+qo87JsYWLmqsLpCAkd2Xg==
X-Google-Smtp-Source: AGHT+IGT6abTRgmak5aqPkCAEFXe66pf7YHsBgFuczkbM9kxPNZFR/gzJTpwE27xO2O9FS2cUrrsgA==
X-Received: by 2002:a05:6830:3989:b0:70b:39f4:a90a with SMTP id 46e09a7af769-70e0ebd02camr14386304a34.25.1724749939305;
        Tue, 27 Aug 2024 02:12:19 -0700 (PDT)
Received: from dw-tp.. ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434af1856sm8113341b3a.68.2024.08.27.02.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:12:18 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc: Use printk instead of WARN in change_memory_attr
Date: Tue, 27 Aug 2024 14:42:11 +0530
Message-ID: <e2fcabe78795552264f045bd224f83609903708f.1724749026.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pr_warn_once instead of WARN_ON_ONCE as discussed here [1]
for printing possible use of set_memory_* on linear map on Hash.

[1]: https://lore.kernel.org/all/877cc2fpi2.fsf@mail.lhotse/#t

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/pageattr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index ac22bf28086f..c8c2d664c6f3 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -94,8 +94,11 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 	if (!radix_enabled()) {
 		int region = get_region_id(addr);

-		if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
+		if (region != VMALLOC_REGION_ID && region != IO_REGION_ID) {
+			pr_warn_once("%s: possible use of set_memory_* on linear map on Hash from (%ps)\n",
+					__func__, __builtin_return_address(0));
 			return -EINVAL;
+		}
 	}
 #endif

--
2.39.2



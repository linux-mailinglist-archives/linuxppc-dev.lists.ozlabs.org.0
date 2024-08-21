Return-Path: <linuxppc-dev+bounces-267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A890A9597D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjYc4BM0z2yLJ;
	Wed, 21 Aug 2024 20:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DAsxMyJh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQM09Shz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:19:54 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so3874666a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228392; x=1724833192; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHfDnFSOmlgsN5ypR9SiqdvWOZgzK74sPfUFdgGElDM=;
        b=DAsxMyJhEFu5aq71U61pl/jeoTZ4a/y8zicy6KSYMMkIsppjhbftHcIfYiG9XUB4B2
         VA2rDLXta6R61mCgKEOd7iM3Pi6cnfbNHGQWG/ou8uQpgPePfZUo5hD0Pss74RsUnASh
         hgM+X14nbh/wruzKs9ip+Zy2sQTZP7Sq5iQYYxY+C/zevMumhZwQQ9bpLKLhUpHpwqKc
         tCFFS9HRF3yAcK9gWtk1lc3is/9gpgCwvMUrK+2WEB8HjfjWWSXPM1b9N+lPV3ZIGTJo
         aBnaJ4PYkzi8QG8AE52lMX0APsZW3xzeCZvLcWv2i8YS1rd7CEum3Mcb6MVIujpdP+qZ
         GfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228392; x=1724833192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHfDnFSOmlgsN5ypR9SiqdvWOZgzK74sPfUFdgGElDM=;
        b=DHgJ+3js+lKB71c5dKgvqyB4jipSstd0ryDSt7anzzbqxxJgpUzqvz3e/XO1STFbrO
         u5mxj4tAnv5jGE5gK+NUP6yJxdAwgRrkm37Y0bIK7AlRM9hmzWZCSsa0S5I+iGuaMtCk
         VqbuZaiWHc6y5tJbe3LY+U+diYY+yswIxAwtRNoYAxUJVqx9VHOotc0lRIgNom4p96+j
         0D5g5CI36k+ijLJeskib+VP1umMQe/e95Q+9gEPGJ+7vHbNzSZbLpLYirvwMCYap+lkk
         Wg+EFTBiDi17ljHhrQYvpRznSScu+iHxUbWdW6MfPBOrRLRgT2SxNF79pPMEwQp65tGn
         KByQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6IArIpFEyz5wjJ3797QOzywpHvZvidkOnf5tpeYrLLxR1jgrqyeXDNZdK8VeCu+Kg8DloGgeWw/2hyQU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzLhSgoVydxYs3mz2zGtE9im4jyps9wH0lLaX+YTT126n7CPTc
	nh3wdTgobGpnYP0Z9R1G3/FAxUyUDXEzS/7lpfG2O59h6wfrEFTWxX91FOUrR8M=
X-Google-Smtp-Source: AGHT+IEDKdhDrkAt8Xw9HjhxvAn16yLBj0ykk9gzeBgjUCoqqbqdejlnt+3gntiVrRuxkT/2XR+s6w==
X-Received: by 2002:a17:90a:d98e:b0:2c2:c149:ca4 with SMTP id 98e67ed59e1d1-2d5eaa9d141mr1321075a91.43.1724228392525;
        Wed, 21 Aug 2024 01:19:52 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:52 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 04/14] mm: filemap: filemap_fault_recheck_pte_none() use pte_offset_map_readonly_nolock()
Date: Wed, 21 Aug 2024 16:18:47 +0800
Message-Id: <c1dbbc9022c9d8d4736d1751678076a2afa1366f.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
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

In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
convert it to using pte_offset_map_readonly_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/filemap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index d87c858465962..491eb92d6db1f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3228,8 +3228,8 @@ static vm_fault_t filemap_fault_recheck_pte_none(struct vm_fault *vmf)
 	if (!(vmf->flags & FAULT_FLAG_ORIG_PTE_VALID))
 		return 0;
 
-	ptep = pte_offset_map_nolock(vma->vm_mm, vmf->pmd, vmf->address,
-				     &vmf->ptl);
+	ptep = pte_offset_map_readonly_nolock(vma->vm_mm, vmf->pmd,
+					      vmf->address, &vmf->ptl);
 	if (unlikely(!ptep))
 		return VM_FAULT_NOPAGE;
 
-- 
2.20.1



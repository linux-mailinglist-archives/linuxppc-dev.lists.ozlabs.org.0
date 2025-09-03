Return-Path: <linuxppc-dev+bounces-11687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12CB42942
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk95Nmgz30gY;
	Thu,  4 Sep 2025 04:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925985;
	cv=none; b=bUNWYEUj1w1/c05nLCNnm5N3WcxLWbuU6ToNvCPwxnSMsGw0Lg0s27Y40shxhCH62E4kbA6Chnd57RKemadU5J5Mv5FIqeaxqCMCAjbhfa+XT4eRONfYEjES2Fu4t7T2sx7aif5o9Z88clxW+mtXS+2Gz1UoDzs2G70SESTSaNtUH+VX0IBivIyukq6HJZBbHG9AUkVSny9fF6QPnwbUz1GIvPCbkulDZCZzIKUpGjrwfa9+ekjQSbJLweTjd0dtejxMfupagVFkQFeUmTcPzGq06jgTFkarr5Pr3iZsnwIzSo/HACXaEvSzAq8Gs4UJmrHnu4F2w9qZL95D7X+eFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925985; c=relaxed/relaxed;
	bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hG5DXYeC7C/akuauTqcFKzzUg5Ux+QxCU3FjiiHjqsk83XR5QbFWIj34Bzn7Eq2KLHYpeiiRXMk+t5MlaWKrAg2mhJCtbkWI0KH9BJKwCZM+PVDlSlnEAwB96Zi4sE28p23dUDRRmgZduVEBAycOcJSCnV1ghHZkkOKTDn3MC0hmf6DQlRJRxqd087e7+Gdx5776vhQTIjEG6kT5oHlDSFlmQK5zrG/90UhMQ/01AGzPN6w9GgBq7UYTRCK3e9FsddsxFC9gp9h4L00SZ0L9NrhfEaIQ7n3sOCFCeD0jP4kdx7Qy/cbK2dSh142bEC/OOo99GrtlMEkJGWNjPzaVSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nCAPMO0T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nCAPMO0T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk90vYCz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:44 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24c8ef94e5dso1743615ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925983; x=1757530783; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=;
        b=nCAPMO0Tq8o/pJJUqLUAuSLrurarY4VWrRIFI0EUiyK1r7L27kGj6vn9CeNZv+sgTe
         Z27UjG9FmtiIckSUYgg1w2k/Ggl8nQd6ZvaBs2G3el//qfOzMBtTv+RtRT4ilAGUkx1+
         QKEsP5ojlOdnJPsxNBw+p4EZ5Kp7rxIgII0PVCN2tDLgxp3KtSxsWsx5KgxKprzwOdTA
         kx6f82d4S6JqLLpth9BDnMHpC1XH3VMwc7bVRQMmy6Cwlf9VKciC/tqNS3tva6XbhkBC
         cV0+i7mR+67kNbudvkB7QTpLtC8HWsSCyTInYnE8njFbi4gcOgAcM4/K5yzV+9GQX9OT
         TYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925983; x=1757530783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXRq4apmEamZdvq2d1xSOZY75J3qH8SSfCfS4DJoIVY=;
        b=NiEWFba25gat5vUGuH8gppR9svAkbh897lHkBmcrKWywIQs9pwJ95YmD5/IqQn4bv3
         kSUJTQxJRsDq0ES49EZd2ignfUdJ3NhKm+VFi+/F/Nwb01zHJaYBVzY0LiAxfIHpWZV+
         KLSmxmSqhOgre06lVBOSxCnvzGx/nLZKsEV4b3/RI2d7tEDLYd5YRQVlUo0tKTo5MWlL
         R0+FcFFz4y7MRGoZiXzpLKSS3XGykrPKCn9TqqQ7kqsSAD+Q4Aske2EeWvBQPzCTf/Z1
         sc0vUW3yBA1v5JEzFiuR3YK0dheKgfPanKV8ztJz5TXbx42BRkFxwUoKNf5CfJZ6hda3
         pyqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXQ9wA5Ee2USEFYwPWTXNe7b+IIN4GBOQHbV7FzpXZAKYewVAqzSzcDV3oShUCz79o3Vdgj599G7DnCg0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHL7ytBY6SDFsp3COL8bu+/me6ik2qvUm8mBh9T2Hc21Too1Rp
	N5TxZu79vDtDwOn01DWpXyEhl4pqaz97g+0qTNDb+n4k5fYXceWLraBJ
X-Gm-Gg: ASbGncun2KHjQJjn/REXUr/KaMFZfjlMafwyGxmBHGXZFx7RLNWiTmMxrI8Ersi8Hbq
	C4fTMHFgJGgghKCJQirA73qCSXo4j65mMOihChp6AD0xseBOHnT0MW0I9E3jWMsSKF6qmZujtPD
	4IR99NDJfqGpZtwSb4A8j9tzgqcZs8K/Kk6OyhQ7Tm9jdwrwZQez/pOcrV/QIVWQ0TNluvtyPbv
	YYn0R8ub1AowQzk1iur01t8/q8OwFRLft+mNen1zBH2+UiC0chvm7m66gyo1r5Q3ySStHIY70Fq
	/LX2j/c601G0oJPBA+4P4TPyzylUYlNARF7yjmty6zTPMMBHJ5om+XWQqXrwAHfAdWKALt9Nij+
	CqAWHB+IBU/Uc6yC1EpwkU1v/14ZZlb9CzISeiIwFX8zlzlo/cm8XTM+i0uN/m2vpzms0JYXBLn
	M=
X-Google-Smtp-Source: AGHT+IGnOdoMz4pWaL7qXoMT+R27TwnQ4+tCeRLJ9HFet8fs0efEGIfh6YbGSI9RHeToTjhpbJgt1A==
X-Received: by 2002:a17:902:f688:b0:248:aa0d:bb22 with SMTP id d9443c01a7336-249446d2aa2mr226131105ad.0.1756925983252;
        Wed, 03 Sep 2025 11:59:43 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:42 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 5/7] powerpc: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:19 -0700
Message-ID: <20250903185921.1785167-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index be523e5fe9c5..73977dbabcf2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -780,7 +780,7 @@ static void __meminit free_vmemmap_pages(struct page *page,
 		while (nr_pages--)
 			free_reserved_page(page++);
 	} else
-		free_pages((unsigned long)page_address(page), order);
+		__free_pages(page, order);
 }
 
 static void __meminit remove_pte_table(pte_t *pte_start, unsigned long addr,
-- 
2.51.0



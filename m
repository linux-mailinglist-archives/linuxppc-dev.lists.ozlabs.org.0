Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2E38231F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4Zp6xyXz3d5g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Qxn0R3mJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qxn0R3mJ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4Vm6jdtz3bsF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:34:08 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b21so2386111plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73lCnqrVhO1Rqxiqs9OGNpEuWzRE3MRG2Lu6lmhZPKo=;
 b=Qxn0R3mJ1DXFbfPOS0rqR9LqVVbGnL5iH4EakKLZrv+yxqDCGr06wrEdvSdWKJ8tou
 eApAYwEzWuROr7jmEoERGtJlA9sU6fKJrPEN/vWCHJb9ipj+79wmSsC5zwJbb8dDmUJQ
 VgjDp6zQmb3psLsnJiDeUI3BHofdLdy1VSWYDFW8zQVg69XcdoWxtbfoA/eFoC3PIGPA
 HYiaBW7CDKgLxWkdPD66sFsNECAQ0WuwYezDn4CImI+z+DFzipT+mduTaTkfoxac36I7
 ij+o42Q6svCLtyDAm2yMckwuWe60Fek55Z75QchX/K6b/Wq4eMyc5DV4slavj2CngzY/
 QXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73lCnqrVhO1Rqxiqs9OGNpEuWzRE3MRG2Lu6lmhZPKo=;
 b=hFbRXHE/4RVAegqPa+9YVV+RECL9Te186Xd0KrMzTaVzUQa3AMBk1AsVi6ucPVjUgm
 UBplQ9xcdw+3fYxWkfUJkC/d9lY9doDbyfXXPAFTnQQggnijvTevfxaW6k3RPLVib4MI
 GjSTz5JSMhv2He7SCRABWmPqpMNe9hILwJUIbqXaDT/w9VetfYQqkztjckLI77wbuwSG
 6oBKnpQwd//I2/GipquIkQ3X/msZZ6ynKp/lxJEaeFViKxa7KKpJ/wTk7D7qybvDtD0m
 8Tfl0sfdaGgayc4ivAGS67cqi6T04sANqIKT6unNktSWPQvWVp8iS/mwooGRr/bhsy/I
 ehqw==
X-Gm-Message-State: AOAM533MgLetuX0JGLm0LleAO1zUHBt2l8yflq4HD5QxPKQgWRgdmA1I
 n8jdufSDB4rKknbUu20qDP4PpeI3QVU=
X-Google-Smtp-Source: ABdhPJznWr92PADFOTrKUw4h19YJbeSY4n5XIj4T+rr8C5DsMUYbqFcbm2Q7foOnfa4s1h/jPFdgzQ==
X-Received: by 2002:a17:903:2403:b029:ee:eaf1:848d with SMTP id
 e3-20020a1709032403b02900eeeaf1848dmr58148756plo.63.1621222446354; 
 Sun, 16 May 2021 20:34:06 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:34:06 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 8/9] powerpc/mm: implement set_memory_attr()
Date: Mon, 17 May 2021 13:28:09 +1000
Message-Id: <20210517032810.129949-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, kbuild test robot <lkp@intel.com>,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

In addition to the set_memory_xx() functions which allows to change
the memory attributes of not (yet) used memory regions, implement a
set_memory_attr() function to:
- set the final memory protection after init on currently used
kernel regions.
- enable/disable kernel memory regions in the scope of DEBUG_PAGEALLOC.

Unlike the set_memory_xx() which can act in three step as the regions
are unused, this function must modify 'on the fly' as the kernel is
executing from them. At the moment only PPC32 will use it and changing
page attributes on the fly is not an issue.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reported-by: kbuild test robot <lkp@intel.com>
[ruscur: cast "data" to unsigned long instead of int]
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/set_memory.h |  2 ++
 arch/powerpc/mm/pageattr.c            | 33 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index 64011ea444b4..b040094f7920 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -29,4 +29,6 @@ static inline int set_memory_x(unsigned long addr, int numpages)
 	return change_memory_attr(addr, numpages, SET_MEMORY_X);
 }
 
+int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot);
+
 #endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 5e5ae50a7f23..0876216ceee6 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -99,3 +99,36 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 	return apply_to_existing_page_range(&init_mm, start, size,
 					    change_page_attr, (void *)action);
 }
+
+/*
+ * Set the attributes of a page:
+ *
+ * This function is used by PPC32 at the end of init to set final kernel memory
+ * protection. It includes changing the maping of the page it is executing from
+ * and data pages it is using.
+ */
+static int set_page_attr(pte_t *ptep, unsigned long addr, void *data)
+{
+	pgprot_t prot = __pgprot((unsigned long)data);
+
+	spin_lock(&init_mm.page_table_lock);
+
+	set_pte_at(&init_mm, addr, ptep, pte_modify(*ptep, prot));
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	spin_unlock(&init_mm.page_table_lock);
+
+	return 0;
+}
+
+int set_memory_attr(unsigned long addr, int numpages, pgprot_t prot)
+{
+	unsigned long start = ALIGN_DOWN(addr, PAGE_SIZE);
+	unsigned long sz = numpages * PAGE_SIZE;
+
+	if (numpages <= 0)
+		return 0;
+
+	return apply_to_existing_page_range(&init_mm, start, sz, set_page_attr,
+					    (void *)pgprot_val(prot));
+}
-- 
2.25.1


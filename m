Return-Path: <linuxppc-dev+bounces-1842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF97994F68
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 15:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNGzQ553Jz2yF1;
	Wed,  9 Oct 2024 00:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728394066;
	cv=none; b=dUVlq9VUwa+5JgzDjPIuMKMeAhP5UpMhv7qnusz/6kz0r0XBFS+tnlUCtmIn+VjhzJXmrYyZcfVmWU1azz/Ma5Z3Gvmeu/MaP+JGNAQdBG6SCB/7IrvNyr2Qjj5Du5pmD5DY+OYPcxgJb/KKWbfjD03nruUlzTZSQFs+I45xKYoTP0oMPorFuGQNuXIF4oAIFUQx8zGov0YcTUQTsHPBdHGDN2f8DCfgZs1oiwWQj6FVbzhO/K0lYwTXF5SQLQsLwpZ/Irl39Z+UYQeZM9K42QwLrbUtN3H3Myve9VQLElG4ZKRVRCQ5O0e85TrD/3AbVvCtcS3mcjYqZHcz+SQ4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728394066; c=relaxed/relaxed;
	bh=GNRTK4GY4M/5SnKSdR40yf4xxmnZc4ktxUmJ5/TaZVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJ1C2Rl2L7mQuEDEbjnejyOqvAdd+UymBFcMsWY5GnGtpl6p49xeZ+TidN+LLNWqgyz5pIZbyHbH0vI+98Tvqk89e3543b27JxZq9NLpgc0MuROe28B+WvZRuLBRlPfSsptLoOPfXucEMga9JkuUSd9tovRgmMrHo8Mf+sbUlCEfS7o9q6Lan4RbTdN/UdeozVWTojTYrl6mMkH0UvAUCe+2DNNvRcetTQQUhEMReB+8zKEoHFOEf40/P/DxikiJeyniDd3PAlCguKa5o9ki8GR3yabBq4dSJYgFnm3qXtMh7IoAp4DMqGEIiJGEXHuYaITqSC3wd06cYRDgpoZ4Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IjDKxA8O; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IjDKxA8O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNGzP1N5Kz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:27:43 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ea24595bccso251676a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728394059; x=1728998859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNRTK4GY4M/5SnKSdR40yf4xxmnZc4ktxUmJ5/TaZVA=;
        b=IjDKxA8Ooy8NPx8HQ+l0Kkj2TdWczth+wN/6jbK1cQfbt747PaKpSlwHDtCvGW0cgs
         8/OLqcdjJVzvpytA+S5FsCQPscNiPAv97Lc8yzhJ8/mizalz5gTFDcC8woRwpxz7RDPn
         Ab5MInU/FJ9WB58O13SeA5kTKQV2MJvG5SvMLsXkqe6riz35EVwAMhWroZrDNEQUoI48
         XoQxQ/C9K5RoIgJOwI+8X4vCc2dhT7OYMSBVWEKd+2kCIlSris/FWSvmsnXZs1nFLwEO
         fCzjDuLjWRzaRW6Tj+cgdjXqxgSOcPz5HSgRCJo5CwOaVhSO/Uwp9UPW7m1ak74Zdosm
         RzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394059; x=1728998859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNRTK4GY4M/5SnKSdR40yf4xxmnZc4ktxUmJ5/TaZVA=;
        b=j4L/XozPpAQ6AHYkzWCjs3X5bUESqrYpubLWMlfqHZqjfeHCEc0jjyHzrQbx2R0I7L
         gme4SGtKoTCuKERbM0T5jM+DSnWo0OJd0Fsa/zMnIQq9MUAcqd7j2B3kLGwKCldi7YIU
         NrOVOBv8jbkxp5NLA/juZ+iIV+Qas27PrwS3/BfsKPGZSDyA2hdBh1a8x6AyBjlxwaVb
         8e20+jAAANECw2wO+SjIvxgNzzfs/i1W6qvutaa8DMRKvbv/JMCwvyfY1TcotuLe4Iky
         9Jfx6nCQlkhfilLvEKp+SaJAES0mwos6vOcykN3BVDZQH3eqh+mP3oEvugxnovkgoTUn
         D1dw==
X-Gm-Message-State: AOJu0YxKET68z5T9sQNM4oXIED/2vhWH2W4nLPi0onFG+DSoorqVNAgZ
	xQsc8Uqba8OimeQpWqlJTBwolbJtp7wby2Juh1XuqE1CaSbMxFwrQGvEcw==
X-Google-Smtp-Source: AGHT+IEPBSY9n6qD6ZyvnmB52+tWd6fPMTLLVgOtWzgpTHXZv6NjkRb9kArISqSlxpL+qPUzVtYrRA==
X-Received: by 2002:a05:6a20:c886:b0:1cc:da34:585e with SMTP id adf61e73a8af0-1d6dfaee214mr21301979637.46.1728394058567;
        Tue, 08 Oct 2024 06:27:38 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.87.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20af4655dsm7628992a91.27.2024.10.08.06.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 06:27:37 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: [RFC 1/2] cma: Fix CMA_MIN_ALIGNMENT_BYTES during early_init
Date: Tue,  8 Oct 2024 18:57:18 +0530
Message-ID: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

During early init CMA_MIN_ALIGNMENT_BYTES can be PAGE_SIZE,
since pageblock_order is still zero and it gets initialized
later during paging_init() e.g.
paging_init() -> free_area_init() -> set_pageblock_order().

One such use case is -
early_setup() -> early_init_devtree() -> fadump_reserve_mem()

This causes CMA memory alignment check to be bypassed in
cma_init_reserved_mem(). Then later cma_activate_area() can hit
a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
area was not pageblock_order aligned.

Instead of fixing it locally for fadump case on PowerPC, I believe
this should be fixed for CMA_MIN_ALIGNMENT_BYTES.

<stack trace>
==============
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10010
flags: 0x13ffff800000000(node=1|zone=0|lastcpupid=0x7ffff) CMA
raw: 013ffff800000000 5deadbeef0000100 5deadbeef0000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(pfn & ((1 << order) - 1))
------------[ cut here ]------------
kernel BUG at mm/page_alloc.c:778!

Call Trace:
__free_one_page+0x57c/0x7b0 (unreliable)
free_pcppages_bulk+0x1a8/0x2c8
free_unref_page_commit+0x3d4/0x4e4
free_unref_page+0x458/0x6d0
init_cma_reserved_pageblock+0x114/0x198
cma_init_reserved_areas+0x270/0x3e0
do_one_initcall+0x80/0x2f8
kernel_init_freeable+0x33c/0x530
kernel_init+0x34/0x26c
ret_from_kernel_user_thread+0x14/0x1c

Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 include/linux/cma.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 9db877506ea8..20abc6561bcd 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/numa.h>
+#include <linux/minmax.h>

 #ifdef CONFIG_CMA_AREAS
 #define MAX_CMA_AREAS	CONFIG_CMA_AREAS
@@ -17,7 +18,8 @@
  * -- can deal with only some pageblocks of a higher-order page being
  *  MIGRATE_CMA, we can use pageblock_nr_pages.
  */
-#define CMA_MIN_ALIGNMENT_PAGES pageblock_nr_pages
+#define CMA_MIN_ALIGNMENT_PAGES \
+	(1ULL << min_not_zero(MAX_PAGE_ORDER, pageblock_order))
 #define CMA_MIN_ALIGNMENT_BYTES (PAGE_SIZE * CMA_MIN_ALIGNMENT_PAGES)

 struct cma;
--
2.46.0



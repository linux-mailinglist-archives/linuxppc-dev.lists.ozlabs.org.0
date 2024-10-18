Return-Path: <linuxppc-dev+bounces-2379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8419A438A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 18:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVVHl1sPJz3br5;
	Sat, 19 Oct 2024 03:18:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729268307;
	cv=none; b=bGAPtnuZK4yCcCmdXEut7gc+Ne6P/ILcR8TtNo+mf1Q50feuuyf4eF6umWynmMOBsadEvO8X4EkKJTuuZvgge0EatG4edw5dnZgJutczKiLv67cSPeJus8f+XF9YeJLG4EdWwLVWI8L8FgICk396WQa32r1KzNmvFtXFMcezn6fJq51F2PuVpbOuLPK82T/729WU774NNVXtVvqEoHRr+12GkGgCoN92mncm89KQ+DTEY8B4/dQdSke54285q0Voo/ye6Yo6Fd56TawzFbGkXLUYQvZKIQermGeVPOlO0MW7SQlLREZRDxAfFqFIIqcoxXC8wZUILoN/c8QmFBq1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729268307; c=relaxed/relaxed;
	bh=uLmZcdH3+iUB7uSULBBt8ADH32xOpUfbglYzjMZPi2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPxuuUQ5auqxfw2Tu5LNZQwMXoD6vxzr4VCsgj2N7Wx8VoD2BmDigdi3g8Fb9TPcsrrCJqquA1PVf8tDHIpU/Ca452guHggku4cpiCex2Qq0pcD/445se+qNiXNrA5ymcmnRC2F+pSDH/1Cv/6qcMC9cIvDLxF2UyD7+ZjPU30ZW3AXHNkJwiM64Y54WD2Y3asqBOzamU2RmbmIVDvJI49zg+0d8ZFLzRipbVauZN9zpX+Iwv1hvHcJuf+DnFhvXIpm60c41YeQGVRj0zKndJ+bjrbdQleHmXftonUo1LfardEbAOiRhO77Gs4e4aiSr3vQF257kcHQl5ZHfmV9VPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nLznE0Cx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nLznE0Cx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVVHk2Dnvz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 03:18:26 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so1680216a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729268303; x=1729873103; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLmZcdH3+iUB7uSULBBt8ADH32xOpUfbglYzjMZPi2A=;
        b=nLznE0Cx/a2/YjSIqLABeg8vE2aivn6GzvTbgDCsJajRNyyalLVhHe5a3mtmfE0QI1
         2ndF60OEQoQ0nScjmNCUcVrIFuWI6VvtwJ4WXW3rwcpEWNYqqkUHMgkQ4SPi24TGyv/W
         wS2jSIjsX131foN25wLBbb0vOmjf1xCLuh06pXmt/XeLK0+MfRQ6GnwkiwB5FpnFPrS9
         vmXbH0nazatEMEZLk3CpTWlAbuiTDrn/IwqELRZEIshW+Pquc9iA14sLddOvGOfH7bGv
         9oSMmqzDHbP7zRI5pgKlC83myBKc9HSDUs5O5G9Y10XweFvsV2Nwor670+rKBz6U6fVh
         BtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729268303; x=1729873103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLmZcdH3+iUB7uSULBBt8ADH32xOpUfbglYzjMZPi2A=;
        b=aMzWUAC3pC0AHtRAr9RtEGOj8f8f4CDQ2NuofWr7cTDTXVKvmLkzPUIe5FncHOmyY0
         1NSkIWj394Olp0jGSORFbWy0BIJ7nBQSjulvZ4P2wD5znMitW0XWmcUYFBS4JEPo8c4s
         bm1Zxm/E1SXQGVoHhlZZ+Ang2Ldoq5SFPwdNGdf0QYxLSQRYGDY75isAGYqSsfbRrx6e
         8hNqTdsNlmdtLC6BvvVs2wO5r/ru+2N7nDicBSxNzarXO7nJIG2KA7UAEZARN9jliRlq
         bKrC77Q4I8RNjjgDNmHpg796z1H+xpk5HyURzzsEKNlPKVMEEoHQGT8B8kvJ+s+WI15Y
         JTNw==
X-Gm-Message-State: AOJu0YwYHhbq5bVNzo0V4vjpPTp9hB/Rq1WvaX+QNlfm6v2uJP/pwMYm
	AQf8EOtn7tHF9Nl7Atu5ORWedHpn1A86RTNtLRTVxsX8oixRZxzf85s0wTm+
X-Google-Smtp-Source: AGHT+IFFH2dXD4/u8KGoMcsdlAu0XJqAkbNBFR0eSBy3BkBtBCA1KnsX++lMxG2V+BFH8gOUwBq8xQ==
X-Received: by 2002:a05:6300:668a:b0:1d9:2992:d6c2 with SMTP id adf61e73a8af0-1d92c49fc95mr3759338637.2.1729268303039;
        Fri, 18 Oct 2024 09:18:23 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345677asm1692140b3a.147.2024.10.18.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 09:18:22 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Sachin P Bappalige <sachinpb@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 3/3] powerpc/fadump: Move fadump_cma_init to setup_arch() after initmem_init()
Date: Fri, 18 Oct 2024 21:47:57 +0530
Message-ID: <3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
References: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
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
later during initmem_init() e.g.
setup_arch() -> initmem_init() -> sparse_init() -> set_pageblock_order()

One such use case where this causes issue is -
early_setup() -> early_init_devtree() -> fadump_reserve_mem() -> fadump_cma_init()

This causes CMA memory alignment check to be bypassed in
cma_init_reserved_mem(). Then later cma_activate_area() can hit
a VM_BUG_ON_PAGE(pfn & ((1 << order) - 1)) if the reserved memory
area was not pageblock_order aligned.

Fix it by moving the fadump_cma_init() after initmem_init(),
where other such cma reservations also gets called.

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

Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignment")
Suggested-by: David Hildenbrand <david@redhat.com>
Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/fadump.h  | 7 +++++++
 arch/powerpc/kernel/fadump.c       | 6 +-----
 arch/powerpc/kernel/setup-common.c | 6 ++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index ef40c9b6972a..3638f04447f5 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -34,4 +34,11 @@ extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data);
 extern int fadump_reserve_mem(void);
 #endif
+
+#if defined(CONFIG_FA_DUMP) && defined(CONFIG_CMA)
+void fadump_cma_init(void);
+#else
+static inline void fadump_cma_init(void) { }
+#endif
+
 #endif /* _ASM_POWERPC_FADUMP_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ffaec625b7a8..c42f89862893 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -78,7 +78,7 @@ static struct cma *fadump_cma;
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
  */
-static void __init fadump_cma_init(void)
+void __init fadump_cma_init(void)
 {
 	unsigned long long base, size, end;
 	int rc;
@@ -139,8 +139,6 @@ static void __init fadump_cma_init(void)
 		fw_dump.boot_memory_size >> 20);
 	return;
 }
-#else
-static void __init fadump_cma_init(void) { }
 #endif /* CONFIG_CMA */

 /*
@@ -642,8 +640,6 @@ int __init fadump_reserve_mem(void)

 		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
 			(size >> 20), base, (memblock_phys_mem_size() >> 20));
-
-		fadump_cma_init();
 	}

 	return ret;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 943430077375..b6b01502e504 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -997,9 +997,11 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();

 	/*
-	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb. These must
-	 * be called after initmem_init(), so that pageblock_order is initialised.
+	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
+	 * hugetlb. These must be called after initmem_init(), so that
+	 * pageblock_order is initialised.
 	 */
+	fadump_cma_init();
 	kvm_cma_reserve();
 	gigantic_hugetlb_cma_reserve();

--
2.46.0



Return-Path: <linuxppc-dev+bounces-14509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D41C8C84E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 02:15:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGz5L4XW7z301N;
	Thu, 27 Nov 2025 12:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764206150;
	cv=none; b=Hku2/0dzzAZAAjjcPt68NpxqUkLFvB5zjc6rHGU28bNY5YUqWf9GHgS9YwRQ3wHxHD3RzhQ91KgPILnMCPhhkUECJMyUPFlCd3PY8veuwvCuCpc9RKgxKp/h26mjxb0ISnoQlwQdCDPjMf6q1UKnt1oRfXeQJvRwJn9d37x+TXlD67P50LmKCBeJ/ye63yZL4xQ0xxSJDkWFoFZHoemg/P0EfMukMkqY/Kh5UJ2ZWXqxwdix3Y1YpJEP/piSC3wn19Q4c2rRlXAgWEEWWJfsvCgNEErOsh8fuJWxMuHLK/owBLDisXIou1rlQvc88kjGTGpOAwl62FzYphSZg339ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764206150; c=relaxed/relaxed;
	bh=W4p1bn22G2i0XoJzrL7o1dUUJ8ghtmPDbFaXYxRwFkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COckcKXvW5jSctIhiTpszn244tsTZoGhw5Zm6dvimHxRCKV1NCbYaSNj8PXfzD2Ig0VPgNFhS1lf4ipKEaJldzE88OevjitBeKpXQMqOcpx4POo4L/64/f5vqYHrjyJM4rH5h3lsPSF1zmNMBixWRX7n6uQTE5UXme1spwY0xZ4hiUH1W278hIxnqy6zdz3Mx+W71mC5l6YUHFH415+s3fUSZ/+4Sew7wx4T2RNUuz1hZ12mIZTwTaGCqL+TQu2XZOg8fVrEObM0Ej/4WyKpQbaMXa5ep+GTmHmFpscJ//zDwELfA/jUbFfV3eFeq3ceGlkZ3McfxVaVu8nHfmv1rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WxeU3jlF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WxeU3jlF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGz5K6mTJz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 12:15:49 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so286343b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 17:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764206148; x=1764810948; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4p1bn22G2i0XoJzrL7o1dUUJ8ghtmPDbFaXYxRwFkI=;
        b=WxeU3jlFZC/yB64KPHVGUoNSIguTkMfC0sy6KxzknfApHPNXNSUtY1iTeYannyOryF
         h/K2fhKjGoi9cIMQGDAjdjEKQWE6fyh40mtJS8sssa83FZCnTZRIw1RI5ZsqZ0u5GZwh
         SQj5s4cErrIqOVhSUOgPbIY65khzh1+rHLzX7BiRwf/usH5tQCprRyoMBlYteA43YQvo
         y+PwGq8uS+fBF/b9EkAIHk6rX/Px5GdfHM7Ux0BzyprkyAUz3uExOG1SwvhKf6jRHtWk
         Od1uJE1kg4PyzvETN/7t0MMuxxD5xZDeVmDnoSmEiJeLnpRqhljw15eDY6IwmIoVaYEZ
         rAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206148; x=1764810948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4p1bn22G2i0XoJzrL7o1dUUJ8ghtmPDbFaXYxRwFkI=;
        b=Z1iyuYterS3ZXE1y/3C/9Lece3T1yYB424bmnujhCxJxyJl9bDku3sDbA51XJbUqp9
         6IG7nhm+RfU4zhFQsLz4Bjcx+375wrfIkQrVFXe78GQSzjhcRBE8QI4Q8B0qtBdPwSY3
         EewtRBLm1L4GDgzhgkTy3Zt16Gvhixtip9HjjafxUBhkDl9MepmtbuD+8iQzAJMLTmyf
         u3ZxVbWMfOwi5lvR0Cr88uI/AYkBruUh6AfAVv8Pis4cgiq/r6PKQgexy6vYIGfn9oJG
         uFF9sDI3P22iSUaGhDVPKjYefGrglyMTgmmEUV8bLvUrLR7nabIQ6l0Qn8zJR9prGAnR
         /rEA==
X-Forwarded-Encrypted: i=1; AJvYcCXECppGpIbplqkE+a4h3l/0c65mE91Kl9HwtcWAaa/9H3UxCsJl1aLkOKSw+NRqO0MeIPZXnN5sKxBywI8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyywAFND2H/RAJN87xBdOmwGSoG6O9AO4nHpt1t8iots85n8Hnh
	rbNYjgtPnRCFUBIaVVviS4bpvTmZd2l3RdPIWeKZrvPVWnjrLVB3UQYA
X-Gm-Gg: ASbGncvevvXzAAcHRpjwpG3HEhxF9FUhpKldYgbLfVqi83ArQfj2SS1YhiB1q2K2sWZ
	C2UdT0e7sJ5VCct1N6u++Ik0EOJhThQ6Y2+nwYaCIB4khzjXReU59EE1wms7y7QAEQKYLgINvgd
	VbpdjJKYYuYb4lsQzZuDclfQW3TP660eMuTwVhNOSew5N59B7YCcdtleqvPDFELXXeK6iuSSw5N
	ZdPAEDj4JwXnc2ec3ZvWIrDdzCdwChZ8G5DKM/98qvWgx4AQBSEyk/xNXbgFPSt+RE1yj58c13o
	yn88wamVg/6+Yub7j0CJCRRjfSmzidECdA19WcmoCB+k4zi4BBhbM1+rNQyA6EcB7FCvUEj68yn
	nV1b4sMNt+DZbYiisPjmuHOsc6CiI7jMXg6jV9/TY/6x8Ia318zo7FP+JaKuYh2/vSq+vWAhFjs
	VLMsFc66P1HV5vn/OFu5RdGwHG4wCdsCqYegE=
X-Google-Smtp-Source: AGHT+IHM/YJW2qPboNwUb7KDGSWGsZmmt6gqbwAlILL0AqNuX4PEwg/PSJbXIFKwaU4zyLqhhDzUUA==
X-Received: by 2002:a05:6a00:4616:b0:77f:2dc4:4c16 with SMTP id d2e1a72fcca58-7c58e016d67mr22034173b3a.21.1764206147616;
        Wed, 26 Nov 2025 17:15:47 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c414c226f9sm22447356b3a.53.2025.11.26.17.15.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Nov 2025 17:15:46 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Matthew Wilcox <willy@infradead.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Oven Liyang <liyangouwen1@oppo.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	=?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Nam Cao <namcao@linutronix.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [RFC PATCH 2/2] mm/swapin: Retry swapin by VMA lock if the lock was released for I/O
Date: Thu, 27 Nov 2025 09:14:38 +0800
Message-Id: <20251127011438.6918-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251127011438.6918-1-21cnbao@gmail.com>
References: <20251127011438.6918-1-21cnbao@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Barry Song <v-songbaohua@oppo.com>

If the current do_swap_page() took the per-VMA lock and we dropped it only
to wait for I/O completion (e.g., use folio_wait_locked()), then when
do_swap_page() is retried after the I/O completes, it should still qualify
for the per-VMA-lock path.

Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Oven Liyang <liyangouwen1@oppo.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Kristina Martšenko <kristina.martsenko@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Wentao Guan <guanwentao@uniontech.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: Chris Li <chrisl@kernel.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/memory.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 4f933fedd33e..7f70f0324dcf 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4654,6 +4654,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	unsigned long page_idx;
 	unsigned long address;
 	pte_t *ptep;
+	bool retry_by_vma_lock = false;
 
 	if (!pte_unmap_same(vmf))
 		goto out;
@@ -4758,8 +4759,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 
 	swapcache = folio;
 	ret |= folio_lock_or_retry(folio, vmf);
-	if (ret & VM_FAULT_RETRY)
+	if (ret & VM_FAULT_RETRY) {
+		if (fault_flag_allow_retry_first(vmf->flags) &&
+		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT) &&
+		    (vmf->flags & FAULT_FLAG_VMA_LOCK))
+			retry_by_vma_lock = true;
 		goto out_release;
+	}
 
 	page = folio_file_page(folio, swp_offset(entry));
 	/*
@@ -5044,7 +5050,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 	}
 	if (si)
 		put_swap_device(si);
-	return ret;
+	return ret | (retry_by_vma_lock ? VM_FAULT_RETRY_VMA : 0);
 }
 
 static bool pte_range_none(pte_t *pte, int nr_pages)
-- 
2.39.3 (Apple Git-146)



Return-Path: <linuxppc-dev+bounces-1843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993AB994F6E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 15:27:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNGzS33TSz2yl1;
	Wed,  9 Oct 2024 00:27:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728394068;
	cv=none; b=bXBXsmQizyYUXL4c3GBO64Bg3cMcHeSs5BYy0bBcsNiNGYe75dE9USFZOLolMbBinAQ7vqeQfXrOjwF582gyZSxMd/hS50nbvbuPeUeX2abDv9kla1X4hNVSiuJwiz50S8QcbD+beE2uKF+7w3Km0TaKNxkZ442gSjx3wv5SRd9stm93AK39+bUggFaEzP9A5mXLUIQlYP7OQVRwxGpJTJaycuZDaAhhb23FtNoWaCneJqz5eRbNkWtKmGgSIbS9h/VUaAf8JNI3IaTB4dQEADSXrj6JTrQGCmk6t9HyiTSd2NsNM1spsefzA55tKOIw2sKdv+ZqQQdDWQDAhhbzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728394068; c=relaxed/relaxed;
	bh=iORC/3+gFiV4oQN4Aw7kbFgz84yNOuZ0Gq1M6ocZ+00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xl6unhbKCdxB2s3RLR/Zk9QeT/QtlvSLvgaSoCOBJMZk7GMZc/2MkTGtN+lUIuEg3Qx9A9i+Cc/o1rWMJoIEF4PY7tSp0KHb7lkLBlcyE2CSNbVF+JRQurVqdLKKpJkFZ1JEtI34whPD/+dl4XDcNv+sulPC1BIyGJYb+dxi5cYAeE+e0iLxCfORq2UOpFUKS2cRSgQeyoMzzT2i8KyWqNWRU2kZoUS/o9t+oZpA5x/RIYqraxRda1DfXRIqtK7AD7Ye063zdHMqX51jK9/RyO58d78m+D1Umakc6qK6/zoG5PMNmIqdeoFKDI+c+v/gHw1/l3Wq8XZ2nJgkSgyIZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZQxh0RTm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZQxh0RTm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNGzR4D7dz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 00:27:47 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so4325813a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728394064; x=1728998864; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iORC/3+gFiV4oQN4Aw7kbFgz84yNOuZ0Gq1M6ocZ+00=;
        b=ZQxh0RTmszoKfykxr8LWh9LNXxy71pkefAO/RPCdCqTIq+/4oASXOc5Ph72e2PYgWZ
         Jt6JvtV+qr8q9EZIl5uk1299cZPTm9YAG2d3xb5JUF1Rf1v/STWLaxU0JL5fZB9sLvCC
         9JrI2Q11PEoDbZM0ednuXYzSXd1SL8IXTuVGz3TFIqqqXXGtol+UzHmyjCKEOph0s3zH
         FNhh7u8QyVdhlsJnaQ/36eTmwB5KS74JotaYYYSidQQ6b2cBHI8HfewEY7XrrI662P+/
         vyaZ41x9ivgkjZcCmJSUgxDKC3bt6AhWuKObIUNd1EvexyXvSSxFt1bnnu/eSkSZJ8W7
         hKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394064; x=1728998864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iORC/3+gFiV4oQN4Aw7kbFgz84yNOuZ0Gq1M6ocZ+00=;
        b=CX2PgnIbVNhXQT5FOBQtB7BrQHgQ4PW0SboRUDBQ4jDxH/fddWO58pB0JJrgTTN9ME
         0OF3dCTuej7SFHybtkswLGrjOelOwkhvt6uVqhyexnXu6B8FW0nHllmuSVRYUcSTS8ad
         AqhGiNJovNmP27ZRQsCEdyvntUFcBgxCIesFnkydSxgr+BkAeoFpsHn4GHLznExiNghg
         1iqnv4N21eR8Yg+J/fvVMGSr5HHfQGGtaP0soEnn0m6pHqMOiPLx8x8CKStQYMx+v27L
         NSjqIROY2D47jbS/4JEnvoTvOAOlihvrMhfyaOCL3yoJme3prDietkRoy2B6TcqkFGlJ
         u2Uw==
X-Gm-Message-State: AOJu0Yx/CQl7qKzDbiP1rNHbDyYmxdaQeloyjjfUpK1UZpxMmkgdcIA/
	InxpSVibS7pxTlCKZCUBjbHFIOionQzGELLFCOq9ghC6tpBJUglypGX4Ew==
X-Google-Smtp-Source: AGHT+IFUSmB5qj013ukPWcd2PnqbxEbtyk9xGORICVlDGwgM/Alk+7OzaNIs/iU7kZlzw9YIiIXvNQ==
X-Received: by 2002:a17:90b:360f:b0:2d8:8175:38c9 with SMTP id 98e67ed59e1d1-2e1e626c076mr18806026a91.20.1728394064555;
        Tue, 08 Oct 2024 06:27:44 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.87.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20af4655dsm7628992a91.27.2024.10.08.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 06:27:43 -0700 (PDT)
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 2/2] fadump: Make fadump reserve_dump_area_start CMA aligned in case of holes
Date: Tue,  8 Oct 2024 18:57:19 +0530
Message-ID: <7950c20ae9f771a39eb0c0d568beb8681fee0209.1728386179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com>
References: <c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com>
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

Consider cma alignment into account while calculating base address for
fadump memory allocation. Physical memory ranges can have holes and
fadump_locate_reserve_mem() tries to find a suitable base address.
If CMA is enabled and fadump nocma is false then we need to consider
CMA_MIN_ALIGNMENT_BYTES for reserve_dump_area_start.

For e.g. in case of below memory layout, the most suitable base address
is 0x00000501000000 for crashkernel=4097M which is 16M (order 8) aligned
as expected by CMA_MIN_ALIGNMENT_BYTES on PPC64 during early boot
(when pageblock_order is still not initialized)

~ # cat /proc/iomem
00000000-1fffffff : System RAM
100000000-1ffffffff : System RAM
300000000-3ffffffff : System RAM
500200000-9001fffff : System RAM

~ # dmesg |grep -Ei "fadump|cma"
fadump: Reserved 4112MB of memory at 0x00000501000000 (System RAM: 25088MB)
fadump: Initialized 0x101000000 bytes cma area at 20496MB from 0x1010002a8 bytes of memory reserved for firmware-assisted dump
Kernel command line: root=/dev/vda1 console=ttyS0 nokaslr slub_max_order=0 norandmaps noreboot crashkernel=4097M fadump=on disable_radix=no debug_pagealloc=off
Memory: 21246656K/25690112K available (31872K kernel code, 4544K rwdata, 17280K rodata, 9216K init, 2212K bss, 218432K reserved, 4210688K cma-reserved)

Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/fadump.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a612e7513a4f..15ea9c80bc03 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -512,6 +512,10 @@ static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
 	phys_addr_t mstart, mend;
 	int idx = 0;
 	u64 i, ret = 0;
+	unsigned long align = PAGE_SIZE;
+
+	if (IS_ENABLED(CONFIG_CMA) && !fw_dump.nocma)
+		align = CMA_MIN_ALIGNMENT_BYTES;

 	mrngs = reserved_mrange_info.mem_ranges;
 	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
@@ -520,7 +524,7 @@ static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
 			 i, mstart, mend, base);

 		if (mstart > base)
-			base = PAGE_ALIGN(mstart);
+			base = ALIGN(mstart, align);

 		while ((mend > base) && ((mend - base) >= size)) {
 			if (!overlaps_reserved_ranges(base, base+size, &idx)) {
@@ -529,7 +533,7 @@ static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
 			}

 			base = mrngs[idx].base + mrngs[idx].size;
-			base = PAGE_ALIGN(base);
+			base = ALIGN(base, align);
 		}
 	}

--
2.46.0



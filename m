Return-Path: <linuxppc-dev+bounces-11511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C5B3C7A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLgz2f1Yz2yLJ;
	Sat, 30 Aug 2025 13:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756525679;
	cv=none; b=j6FpgKnFhs5OiX/FQwDaQiA/T6zyTWVsd6qyjYfb65p33qGuLOUwoNkeXxp2FAonT8eBnXGjbMSzM++SoOozdZWY/Y8blVKiAHiQb+p1fgvCy51MhQX25EN4gmywOqFKI230mbZulqnBYbYhx2ES37fpyjvlsWMIMYjEN0HN81WPWwmOZLjN4vwpx3YZBaZ6WKyC6FdjgVs8ob0hEUfmmcBPeOZiha5ar4XFhD0ueV8fppYriIGB0WrNWlZBacp/Hc2a8820eYJzoOKL78775Uaazrz2OP+sUDj3iPTdtDS4eYP3imw6A+HXh9zwiE+Mn41x8dSoe4sD8vrHt3EU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756525679; c=relaxed/relaxed;
	bh=4HJzf+cbt3tnVGA5I6S0xUC2mgQggddjkpihkUdYn0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoCwR9kvR0Uxy/EDiIbIclezUNNUklMNitbiYM5KTmmSso0dkVxS/6p9umlkIgId3pJL8QBIZO8WibxQUUjnDRo2+Qj+Kg5LNIjTwIeBB1MY0UpR1BlymrzsSMY1ysThCzoJ6SDuMJvPJcCTgRdVhIwzz7W9oOCJeNjkN7raQYSCIsJxXVMytseBnPX+hRmbmImVsQ6P7AX1IEy92E5KAmyKx0Hkoa3KD3pPcEgF5lt5Ixu2U1q4FCVgUkaXNH00ynrie7NopYivLDKKrgJGouDYYOPteA98eJ2auHr9wB3dCbP70wjLbsrXZzVaVh0J/Qf4NuxnnJl3H9VfdxIv0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ASIjsD/T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ASIjsD/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLgy2Vb0z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:47:58 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77238a3101fso518575b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756525676; x=1757130476; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HJzf+cbt3tnVGA5I6S0xUC2mgQggddjkpihkUdYn0w=;
        b=ASIjsD/TLNLZKCWt0aGCZAutVmTk4p4SCVL/0O3LTC2bkg1x1hFOMXkYC5Js3jMexj
         3AjnCyIY/NwByPYu9p1yZvvmSQn6VhZQJ66792aRyo7ZmANiWVObfq5S3/9jA3aQV6fV
         H2aYa5cdjxhMvi4DQ7BlEW8KB9aPIsFP0Na7RGJaVksX5rAJlJ87szT3Tgd9Etdy8ZEL
         Ltmuh4fbJ1mJFi6PA2nVH3tUKCa5mbZAzu1LKWJDGLpWdtKpf/BHDw6lrudCAkVC9V4L
         YuuYJeNfEt4uYsvpIJ6ozJ5P0CEbYHLwZg6SCQtJdO8DTJt7A/fY8i8BRy4Iz6XfJOtt
         dN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756525676; x=1757130476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HJzf+cbt3tnVGA5I6S0xUC2mgQggddjkpihkUdYn0w=;
        b=faTyVrUpXFbt8QhlmIpYIcSYXaekGq4Mf/Yskgz3SnvxfJQl+av46A2fE8c3P8DJLP
         jJ1dr9SPHuYO32tkQgUyht2/iL5F38eNEa1RccrrBcDC+V61gDPtLhGneQj+cT8zwe1Z
         TaYLl//pOUnCHFR+1EwvagzEhOkfOqBUrwBGS6NNabxnzdrSO8YRSDgtj8ABHMOqDQDh
         JXGFKWMi4G+2UZ8HfcpYof3px0lAmA96VRyro0QV1aRi109PjGWgPiJRYMPnCNjkUs8Z
         MTWZuDQOMQtUDdBod8ILhs7WpCgkcCsm83DfZiOfN3bhQtCB1xhcE7t2LCDxYnLu9G4Y
         5B4w==
X-Forwarded-Encrypted: i=1; AJvYcCVqOVqqZF/MufSCGLEfB2PFAwflHzgCqeHVpH/njy4IGWX7FlI+YVzDkB5ci/v18grZPhKNHDcGhN2dMuc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsOdQXmCXM8kpCKVr3oA9CKwa8uZcSOdSsQC3AA9EPpFEF/WEF
	R77teYYhdaFeeQEaasyJZOrbaMPryFiX84Cab5wHLX6mH3ymB8sOUrv4
X-Gm-Gg: ASbGnctpqRsBibdZl4GsTNAi9ObOqSLxGJMBllIOHRCGDb2rtQzcjImNo4w3fvRmTUi
	9ml2KEYTqMFRHXsobre+nrADSCzBEAcF490mgAoHN+bi1JWrWwOmVW3arkh1OA+QAMslIx7wMNu
	6LKfgA9aojWCjUTdRN/u4G27BfEq2Dk2TUdMqnRl4NQgy6ZT7Ge186EyUhIMyeAPu5RGyYGN10e
	gpitz/V+UpX819q9o9gAHTFD2LCokPhk9PBfYuLRSIOhfDpDLBn9ew8K3aoeYyn3oKeqoX9qtux
	30qY9DEG4cMR1jyMoELWVVqKl/3iYS5a7/kMweF4YrYlfOnDMokzvdNLrSnrynMhePXdMSel6PZ
	hxpPQe2ca8sd1cwH+CD4yBPbR/w==
X-Google-Smtp-Source: AGHT+IHQqkzGpozoO/PUeN4PSh2M47+f064YNS2XPGekapyxTgNu5ZvriybhdEX/8K3++YzhEXgffg==
X-Received: by 2002:a05:6a00:928b:b0:76b:f2d9:c760 with SMTP id d2e1a72fcca58-7723e21a73cmr1040745b3a.7.1756525676100;
        Fri, 29 Aug 2025 20:47:56 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4ba1d8sm3895377b3a.51.2025.08.29.20.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:47:55 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH 02/02] scripts/gdb/mm: Add support for powerpc book3s64
Date: Sat, 30 Aug 2025 09:15:35 +0530
Message-ID: <9da03d8e78cd895666deb1aec7ec8318833f1b6a.1756521755.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
References: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
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

This adds page ops support to powerpc book3s64. Following operations are
now supported:

lx-pfn_to_kaddr -- PFN to kernel address
lx-pfn_to_page -- PFN to struct page
lx-page_address -- struct page to linear mapping address
lx-page_to_pfn -- struct page to PFN
lx-page_to_phys -- struct page to physical address
lx-virt_to_page -- virtual address to struct page
lx-virt_to_phys -- virtual address to physical address

lx-vmallocinfo -- Show vmallocinfo
lx-slabinfo -- Show slabinfo

e.g. Below showing lx-mmu_info command i.e.
On Radix:
(gdb) lx-mmu_info
MMU: Radix

On Hash:
(gdb) lx-mmu_info
MMU: Hash

e.g. Below shows that struct page pointers coming from vmemmap area i.e.
(gdb) p vmemmap
$5 = (struct page *) 0xc00c000000000000

(gdb) lx-pfn_to_page 0
pfn_to_page(0x0) = 0xc00c000000000000

(gdb) lx-pfn_to_page 1
pfn_to_page(0x0) = 0xc00c000000000040

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 scripts/gdb/linux/constants.py.in |   4 ++
 scripts/gdb/linux/mm.py           | 114 +++++++++++++++++++++++++++++-
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index 154db10fe94a..97a731db6e89 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -153,6 +153,10 @@ if IS_BUILTIN(CONFIG_ARM64):
     LX_VALUE(CONFIG_PAGE_SHIFT)
     LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
 LX_CONFIG(CONFIG_PPC_BOOK3S_64)
+if IS_BUILTIN(CONFIG_PPC_BOOK3S_64):
+    LX_VALUE(CONFIG_PAGE_OFFSET)
+    LX_VALUE(CONFIG_PAGE_SHIFT)
+    LX_VALUE(CONFIG_KERNEL_START)
 LX_CONFIG(CONFIG_SPARSEMEM)
 LX_CONFIG(CONFIG_SPARSEMEM_EXTREME)
 LX_CONFIG(CONFIG_SPARSEMEM_VMEMMAP)
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index 7571aebbe650..9e5b1632f910 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -24,10 +24,17 @@ class page_ops():
     def __init__(self):
         if not constants.LX_CONFIG_SPARSEMEM_VMEMMAP:
             raise gdb.GdbError('Only support CONFIG_SPARSEMEM_VMEMMAP now')
-        if constants.LX_CONFIG_ARM64 and utils.is_target_arch('aarch64'):
+
+        if utils.is_target_arch('aarch64'):
+            if not constants.LX_CONFIG_ARM64:
+                raise gdb.GdbError('ARM64 page ops require CONFIG_ARM64')
             self.ops = aarch64_page_ops()
+        elif utils.is_target_arch('powerpc'):
+            if not constants.LX_CONFIG_PPC_BOOK3S_64:
+                raise gdb.GdbError('Only supported for Book3s_64')
+            self.ops = powerpc64_page_ops()
         else:
-            raise gdb.GdbError('Only support aarch64 now')
+            raise gdb.GdbError('Unsupported arch for page ops')

 class aarch64_page_ops():
     def __init__(self):
@@ -287,6 +294,109 @@ class aarch64_page_ops():
     def folio_address(self, folio):
         return self.page_address(folio['page'].address)

+
+class powerpc64_page_ops():
+    """powerpc64 minimal Virtual Memory operations
+    """
+
+    def __init__(self):
+        vmemmap_sym = gdb.parse_and_eval('vmemmap')
+        self.vmemmap = vmemmap_sym.cast(utils.get_page_type().pointer())
+
+        self.PAGE_SHIFT = constants.LX_CONFIG_PAGE_SHIFT
+        self.PAGE_OFFSET = constants.LX_CONFIG_PAGE_OFFSET
+        self.KERNEL_START = constants.LX_CONFIG_KERNEL_START
+
+        # These variables are common for both Hash and Radix so no
+        # need to explicitely check for MMU mode.
+        self.KERNEL_VIRT_START = gdb.parse_and_eval("__kernel_virt_start")
+        self.VMALLOC_START = gdb.parse_and_eval("__vmalloc_start")
+        self.VMALLOC_END = gdb.parse_and_eval("__vmalloc_end")
+        self.KERNEL_IO_START = gdb.parse_and_eval("__kernel_io_start")
+        self.KERNEL_IO_END = gdb.parse_and_eval("__kernel_io_end")
+        # KERN_MAP_SIZE can be calculated from below trick to avoid
+        # checking Hash 4k/64k pagesize
+        self.KERN_MAP_SIZE = self.KERNEL_IO_END - self.KERNEL_IO_START
+        self.VMEMMAP_START = gdb.parse_and_eval("vmemmap")
+        self.VMEMMAP_SIZE = self.KERN_MAP_SIZE
+        self.VMEMMAP_END = self.VMEMMAP_START + self.VMEMMAP_SIZE
+
+        if constants.LX_CONFIG_NUMA and constants.LX_CONFIG_NODES_SHIFT:
+            self.NODE_SHIFT = constants.LX_CONFIG_NODES_SHIFT
+        else:
+            self.NODE_SHIFT = 0
+        self.MAX_NUMNODES = 1 << self.NODE_SHIFT
+
+    def PFN_PHYS(self, pfn):
+        return pfn << self.PAGE_SHIFT
+
+    def PHYS_PFN(self, pfn):
+        return pfn >> self.PAGE_SHIFT
+
+    def __va(self, pa):
+        return pa | self.PAGE_OFFSET
+
+    def __pa(self, va):
+        return va & 0x0fffffffffffffff;
+
+    def pfn_to_page(self, pfn):
+        return (self.vmemmap + int(pfn)).cast(utils.get_page_type().pointer())
+
+    def page_to_pfn(self, page):
+        pagep = page.cast(utils.get_page_type().pointer())
+        return int(pagep - self.vmemmap)
+
+    def page_address(self, page):
+        pfn = self.page_to_pfn(page)
+        va = self.PAGE_OFFSET + (pfn << self.PAGE_SHIFT)
+        return va
+
+    def page_to_phys(self, page):
+        pfn = self.page_to_pfn(page)
+        return self.PFN_PHYS(pfn)
+
+    def phys_to_page(self, pa):
+        pfn = self.PHYS_PFN(pa)
+        return self.pfn_to_page(pfn)
+
+    def phys_to_virt(self, pa):
+        return self.__va(pa)
+
+    def virt_to_phys(self, va):
+        return self.__pa(va)
+
+    def virt_to_pfn(self, va):
+        return self.__pa(va) >> self.PAGE_SHIFT
+
+    def virt_to_page(self, va):
+        return self.pfn_to_page(self.virt_to_pfn(va))
+
+    def pfn_to_kaddr(self, pfn):
+        return self.__va(pfn << self.PAGE_SHIFT)
+
+    # powerpc does not use tags for KASAN. So simply return addr
+    def kasan_reset_tag(self, addr):
+        return addr
+
+class LxMmuInfo(gdb.Command):
+    """MMU Type for PowerPC Book3s64"""
+
+    def __init__(self):
+        super(LxMmuInfo, self).__init__("lx-mmu_info", gdb.COMMAND_USER)
+
+    def invoke(self, arg, from_tty):
+        if not constants.LX_CONFIG_PPC_BOOK3S_64:
+            raise gdb.GdbError("Only supported for Book3s_64")
+
+        lpcr = gdb.parse_and_eval("(unsigned long)$lpcr")
+        # Host Radix bit should be 1 in LPCR for Radix MMU
+        if (lpcr & 0x0000000000100000):
+            gdb.write("MMU: Radix\n")
+        else:
+            gdb.write("MMU: Hash\n")
+
+LxMmuInfo()
+
 class LxPFN2Page(gdb.Command):
     """PFN to struct page"""

--
2.50.1



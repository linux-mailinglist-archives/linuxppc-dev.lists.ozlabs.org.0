Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1174FCA88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 02:52:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcnHZ69dRz3bbl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 10:52:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gczfqQpt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gczfqQpt; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcnGz1mvXz2xBF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 10:51:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74D66B815C8;
 Tue, 12 Apr 2022 00:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AE6C385A9;
 Tue, 12 Apr 2022 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724694;
 bh=YM5jbNuYoDJbbdPNVsAyxItLgFYeipZZZly7PYJXEZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gczfqQptWkL2DJovElFzcWGgGRoLQVOB5xFNkBxO8SMpwuPA/QAmA9EcFiikxmgJX
 NxT2/BkOA/O1OIZ6JtbQcfwKWMbPGEapEUi822vRjM51vIKv0CIzLr2PqFMuPw2poF
 +KloabXwfXqL5M9HSkawBf29COBRa/XC4XaLg0dePhKxetCm5enwpMAjyPhxxyHKQm
 Cedakte2zEqQgZbuWm1fWDR8nCIur1yl5zwWBzhKEEBGOIZDgYBty3bYvr3zwpISVD
 TfeBzcZ2RYU9VlvlVfqCr6LxE7/RHLiy/nAffytTXS7/keCjigkhIZNtyU7mj0UHlR
 P8cDeJqpeXkbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 17/21] powerpc: Fix virt_addr_valid() for 64-bit
 Book3E & 32-bit
Date: Mon, 11 Apr 2022 20:50:36 -0400
Message-Id: <20220412005042.351105-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412005042.351105-1-sashal@kernel.org>
References: <20220412005042.351105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kefeng Wang <wangkefeng.wang@huawei.com>

[ Upstream commit ffa0b64e3be58519ae472ea29a1a1ad681e32f48 ]

mpe: On 64-bit Book3E vmalloc space starts at 0x8000000000000000.

Because of the way __pa() works we have:
  __pa(0x8000000000000000) == 0, and therefore
  virt_to_pfn(0x8000000000000000) == 0, and therefore
  virt_addr_valid(0x8000000000000000) == true

Which is wrong, virt_addr_valid() should be false for vmalloc space.
In fact all vmalloc addresses that alias with a valid PFN will return
true from virt_addr_valid(). That can cause bugs with hardened usercopy
as described below by Kefeng Wang:

  When running ethtool eth0 on 64-bit Book3E, a BUG occurred:

    usercopy: Kernel memory exposure attempt detected from SLUB object not in SLUB page?! (offset 0, size 1048)!
    kernel BUG at mm/usercopy.c:99
    ...
    usercopy_abort+0x64/0xa0 (unreliable)
    __check_heap_object+0x168/0x190
    __check_object_size+0x1a0/0x200
    dev_ethtool+0x2494/0x2b20
    dev_ioctl+0x5d0/0x770
    sock_do_ioctl+0xf0/0x1d0
    sock_ioctl+0x3ec/0x5a0
    __se_sys_ioctl+0xf0/0x160
    system_call_exception+0xfc/0x1f0
    system_call_common+0xf8/0x200

  The code shows below,

    data = vzalloc(array_size(gstrings.len, ETH_GSTRING_LEN));
    copy_to_user(useraddr, data, gstrings.len * ETH_GSTRING_LEN))

  The data is alloced by vmalloc(), virt_addr_valid(ptr) will return true
  on 64-bit Book3E, which leads to the panic.

  As commit 4dd7554a6456 ("powerpc/64: Add VIRTUAL_BUG_ON checks for __va
  and __pa addresses") does, make sure the virt addr above PAGE_OFFSET in
  the virt_addr_valid() for 64-bit, also add upper limit check to make
  sure the virt is below high_memory.

  Meanwhile, for 32-bit PAGE_OFFSET is the virtual address of the start
  of lowmem, high_memory is the upper low virtual address, the check is
  suitable for 32-bit, this will fix the issue mentioned in commit
  602946ec2f90 ("powerpc: Set max_mapnr correctly") too.

On 32-bit there is a similar problem with high memory, that was fixed in
commit 602946ec2f90 ("powerpc: Set max_mapnr correctly"), but that
commit breaks highmem and needs to be reverted.

We can't easily fix __pa(), we have code that relies on its current
behaviour. So for now add extra checks to virt_addr_valid().

For 64-bit Book3S the extra checks are not necessary, the combination of
virt_to_pfn() and pfn_valid() should yield the correct result, but they
are harmless.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[mpe: Add additional change log detail]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220406145802.538416-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/page.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 6ba5adb96a3b..0d8f9246ce15 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -132,7 +132,11 @@ static inline bool pfn_valid(unsigned long pfn)
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
 
-#define virt_addr_valid(kaddr)	pfn_valid(virt_to_pfn(kaddr))
+#define virt_addr_valid(vaddr)	({					\
+	unsigned long _addr = (unsigned long)vaddr;			\
+	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
+	pfn_valid(virt_to_pfn(_addr));					\
+})
 
 /*
  * On Book-E parts we need __va to parse the device tree and we can't
-- 
2.35.1


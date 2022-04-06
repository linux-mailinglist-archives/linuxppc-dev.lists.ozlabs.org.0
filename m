Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36B4F623B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:58:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYSMG3NsMz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 00:58:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XuknIDNX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYSLh6XmXz2yZC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 00:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XuknIDNX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYSLf5s9Yz4x5W;
 Thu,  7 Apr 2022 00:58:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649257100;
 bh=482/VmSc3/+9uF+WZHXcCFnkt6IcQHz0q1m16na6BLc=;
 h=From:To:Cc:Subject:Date:From;
 b=XuknIDNXBB8whFLquxiU5jQaBH8HPF1Zt/dsTbDERXsThoBnXK75IHth7dN+HMesE
 4VQ3u+k+BO6hvhpvrQq9cdzh1INubLCwpJTPOsPoNUj5PEs/MNr7mCGr7Stiham5uX
 lIDRtzgpvqI47Ifv0dsauTL6KbEfgvQu5wLHiUInDM01Pebf7Fjg1vSB9iofvGHiPt
 7biLm7tEI23r1cLacYTmwdw5u1uc0wWAtNXrqS1SbpvdeA1R7dkh4ZCu0YHV7XGp1+
 vudDRFxO2BXLIvVm97GG0k9LDeTRMR6Pzk3016aXq8GHiVYyS9UVlCPxUM2U27oFLg
 PXq/VD/LQUyBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/6] powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit
Date: Thu,  7 Apr 2022 00:57:57 +1000
Message-Id: <20220406145802.538416-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: erhard_f@mailbox.org, wangkefeng.wang@huawei.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kefeng Wang <wangkefeng.wang@huawei.com>

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
---
 arch/powerpc/include/asm/page.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 254687258f42..f2c5c26869f1 100644
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
2.34.1


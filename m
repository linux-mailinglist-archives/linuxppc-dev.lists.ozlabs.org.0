Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F411B089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 16:23:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y10y46TfzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 02:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="TJmzM2QU"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y0lp4BSmzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:12:22 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6684422B48;
 Wed, 11 Dec 2019 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576077137;
 bh=zqTUOEFIaUW8OAamEIz8kTudhAMpMV0HwrLv/f5BdIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TJmzM2QUTSy+ztPrGFXFHGJw8qt6yebw32cpfU3/HKtWAjI1MNq6Z1ygcrP3N/ZzV
 sXwqiyMhyaItWpvJDKRBdzjUi69JriCDaENqY8LokVcghD3YEGOFzxbUwu6hKnMgoD
 q0F562TwzlIcgOzGLHeyNFe44WRiSUhutDjJQuFw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 024/134] powerpc/pseries: Don't fail hash page
 table insert for bolted mapping
Date: Wed, 11 Dec 2019 10:10:00 -0500
Message-Id: <20191211151150.19073-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211151150.19073-1-sashal@kernel.org>
References: <20191211151150.19073-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit 75838a3290cd4ebbd1f567f310ba04b6ef017ce4 ]

If the hypervisor returned H_PTEG_FULL for H_ENTER hcall, retry a hash page table
insert by removing a random entry from the group.

After some runtime, it is very well possible to find all the 8 hash page table
entry slot in the hpte group used for mapping. Don't fail a bolted entry insert
in that case. With Storage class memory a user can find this error easily since
a namespace enable/disable is equivalent to memory add/remove.

This results in failures as reported below:

$ ndctl create-namespace -r region1 -t pmem -m devdax -a 65536 -s 100M
libndctl: ndctl_dax_enable: dax1.3: failed to enable
  Error: namespace1.2: failed to enable

failed to create namespace: No such device or address

In kernel log we find the details as below:

Unable to create mapping for hot added memory 0xc000042006000000..0xc00004200d000000: -1
dax_pmem: probe of dax1.3 failed with error -14

This indicates that we failed to create a bolted hash table entry for direct-map
address backing the namespace.

We also observe failures such that not all namespaces will be enabled with
ndctl enable-namespace all command.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191024093542.29777-2-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 6c123760164e8..6e5a769ebcb80 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -294,7 +294,14 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 		ret = mmu_hash_ops.hpte_insert(hpteg, vpn, paddr, tprot,
 					       HPTE_V_BOLTED, psize, psize,
 					       ssize);
-
+		if (ret == -1) {
+			/* Try to remove a non bolted entry */
+			ret = mmu_hash_ops.hpte_remove(hpteg);
+			if (ret != -1)
+				ret = mmu_hash_ops.hpte_insert(hpteg, vpn, paddr, tprot,
+							       HPTE_V_BOLTED, psize, psize,
+							       ssize);
+		}
 		if (ret < 0)
 			break;
 
-- 
2.20.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE801973DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:30:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rLdd0B35zDqf9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:30:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=hCzyPFbC; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rLT01H0HzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:22:58 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id E40E22DC682D;
 Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585293141;
 bh=NLU6a+GZmpbGM7ZZlM+S8RXczj/+GapNI1yMP3rrpMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hCzyPFbCqeOcmtzW6SY05RhBcPIxs8zbC5tLYywSkBDdyzkBfaz87rhMNSBwMnoYp
 Zs73azLmq1wWh2TxHbBd8GSmjvxZSVtaA79yHebEbjTy/YXjZzrWCDDU5bDpxki2pB
 rN2yPnnECyv0AP/0MpPXrv8ZnHvyARjDQkGZauduLjpYcpvGKthonv2K2P7ZEGeT3r
 BWtkFZekdnExUu8PcpN9hof6O6UVI8aP0qrYDNZVkshtTLRvZbGfsRPrhKuotRnefo
 jCpgo90BgMbqz2oDrTKep24o4Co6T59jViwsTP8ee/qv0Xlz/j8EBmv20t8dT4DnuM
 nbJOUSeitii2d2dnPk723FdeI/+4gos4LDyKZz01DH5KbYRzCR+459OyUX++I1fKNK
 hqsTtTXeKLOz71rQf2BzGHmPkcWw7K5r3OBgi/R4EN56O38sqsK6yoBQvHi2orUs6j
 vVIvNEYUU+xmK+zTlYLatt9vnPH8wa81do/yIaNuL5o0jYorLHklmBJz3Yg8hb1eP3
 SJwPR8jJWB9+JkFp+pvthgTGgzLA8uozWXIEBpG6zASx0q7OCBnaODBeZqQSg5PLwn
 N1U5Xz2nG6uQ/mLENf2G4yEIrWdeJS7o8GXcUJwgjqe7dXHyrcZl9/+ZiO0yHu3jQb
 L2zJCEa24D4PbxYl88zmfV2s=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Aa045934;
 Fri, 27 Mar 2020 18:12:14 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 01/25] powerpc/powernv: Add OPAL calls for LPC memory
 alloc/release
Date: Fri, 27 Mar 2020 18:11:38 +1100
Message-Id: <20200327071202.2159885-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:14 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add OPAL calls for LPC memory alloc/release

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/include/asm/opal-api.h        | 2 ++
 arch/powerpc/include/asm/opal.h            | 2 ++
 arch/powerpc/platforms/powernv/opal-call.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index c1f25a760eb1..9298e603001b 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -208,6 +208,8 @@
 #define OPAL_HANDLE_HMI2			166
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
+#define OPAL_NPU_MEM_ALLOC			171
+#define OPAL_NPU_MEM_RELEASE			172
 #define OPAL_MPIPL_UPDATE			173
 #define OPAL_MPIPL_REGISTER_TAG			174
 #define OPAL_MPIPL_QUERY_TAG			175
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 9986ac34b8e2..301fea46c7ca 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -39,6 +39,8 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
 				uint64_t PE_handle);
 int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
 			uint64_t rate_phys, uint32_t size);
+int64_t opal_npu_mem_alloc(u64 phb_id, u32 bdfn, u64 size, __be64 *bar);
+int64_t opal_npu_mem_release(u64 phb_id, u32 bdfn);
 
 int64_t opal_console_write(int64_t term_number, __be64 *length,
 			   const uint8_t *buffer);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 5cd0f52d258f..f26e58b72c04 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -287,6 +287,8 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
 OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
 OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
 OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
+OPAL_CALL(opal_npu_mem_alloc,			OPAL_NPU_MEM_ALLOC);
+OPAL_CALL(opal_npu_mem_release,			OPAL_NPU_MEM_RELEASE);
 OPAL_CALL(opal_mpipl_update,			OPAL_MPIPL_UPDATE);
 OPAL_CALL(opal_mpipl_register_tag,		OPAL_MPIPL_REGISTER_TAG);
 OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
-- 
2.24.1


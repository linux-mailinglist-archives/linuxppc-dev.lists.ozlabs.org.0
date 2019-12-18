Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8681240D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 08:59:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d6qQ3VxtzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 18:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d6g66PxbzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 18:52:34 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI7qUC3002378
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 02:52:32 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy705fvgh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 02:52:31 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Wed, 18 Dec 2019 07:52:23 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Dec 2019 07:52:19 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBI7qHus55115932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 07:52:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7228BAE053;
 Wed, 18 Dec 2019 07:52:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28096AE045;
 Wed, 18 Dec 2019 07:52:15 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 07:52:14 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: shuahkh@osg.samsung.com, linux-kselftest@vger.kernel.org
Subject: [PATCH v15 07/23] selftests: vm: pkeys: Add helpers for pkey bits
Date: Wed, 18 Dec 2019 13:21:40 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1576645161.git.sandipan@linux.ibm.com>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1576645161.git.sandipan@linux.ibm.com>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121807-0020-0000-0000-000003996804
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121807-0021-0000-0000-000021F0889F
Message-Id: <5d8155ea36d0e7fdec7c0ce1f4cd446ddb3d85ed.1576645161.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_01:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=775 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180063
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, linux-mm@kvack.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, dave.hansen@intel.com, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This introduces some functions that help with setting
or fetching bits of a particular pkey. This also adds
an abstraction for getting a pkey's bit position in
the pkey register as this may vary across architectures.

cc: Dave Hansen <dave.hansen@intel.com>
cc: Florian Weimer <fweimer@redhat.com>
cc: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/vm/pkey-helpers.h    | 23 ++++++++++++++
 tools/testing/selftests/vm/pkey-x86.h        |  5 +++
 tools/testing/selftests/vm/protection_keys.c | 32 ++++++--------------
 3 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 2a1a0240f684..bd90a49a3229 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -80,6 +80,29 @@ extern void abort_hooks(void);
 #error Architecture not supported
 #endif /* arch */
 
+#define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
+
+static inline pkey_reg_t set_pkey_bits(pkey_reg_t reg, int pkey,
+					pkey_reg_t flags)
+{
+	u32 shift = pkey_bit_position(pkey);
+	/* mask out bits from pkey in old value */
+	reg &= ~((pkey_reg_t)PKEY_MASK << shift);
+	/* OR in new bits for pkey */
+	reg |= (flags & PKEY_MASK) << shift;
+	return reg;
+}
+
+static inline pkey_reg_t get_pkey_bits(pkey_reg_t reg, int pkey)
+{
+	u32 shift = pkey_bit_position(pkey);
+	/*
+	 * shift down the relevant bits to the lowest two, then
+	 * mask off all the other higher bits
+	 */
+	return ((reg >> shift) & PKEY_MASK);
+}
+
 extern pkey_reg_t shadow_pkey_reg;
 
 static inline pkey_reg_t _read_pkey_reg(int line)
diff --git a/tools/testing/selftests/vm/pkey-x86.h b/tools/testing/selftests/vm/pkey-x86.h
index 5f40901219d3..4937f48f77cc 100644
--- a/tools/testing/selftests/vm/pkey-x86.h
+++ b/tools/testing/selftests/vm/pkey-x86.h
@@ -120,6 +120,11 @@ static inline int cpu_has_pku(void)
 	return 1;
 }
 
+static inline u32 pkey_bit_position(int pkey)
+{
+	return pkey * PKEY_BITS_PER_PKEY;
+}
+
 #define XSTATE_PKEY_BIT	(9)
 #define XSTATE_PKEY	0x200
 
diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 7e2148662fa4..b474d4fbe92b 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -333,25 +333,13 @@ pid_t fork_lazy_child(void)
 
 static u32 hw_pkey_get(int pkey, unsigned long flags)
 {
-	u32 mask = (PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE);
 	pkey_reg_t pkey_reg = __read_pkey_reg();
-	pkey_reg_t shifted_pkey_reg;
-	u32 masked_pkey_reg;
 
 	dprintf1("%s(pkey=%d, flags=%lx) = %x / %d\n",
 			__func__, pkey, flags, 0, 0);
 	dprintf2("%s() raw pkey_reg: "PKEY_REG_FMT"\n", __func__, pkey_reg);
 
-	shifted_pkey_reg = (pkey_reg >> (pkey * PKEY_BITS_PER_PKEY));
-	dprintf2("%s() shifted_pkey_reg: "PKEY_REG_FMT"\n", __func__,
-			shifted_pkey_reg);
-	masked_pkey_reg = shifted_pkey_reg & mask;
-	dprintf2("%s() masked  pkey_reg: %x\n", __func__, masked_pkey_reg);
-	/*
-	 * shift down the relevant bits to the lowest two, then
-	 * mask off all the other high bits.
-	 */
-	return masked_pkey_reg;
+	return (u32) get_pkey_bits(pkey_reg, pkey);
 }
 
 static int hw_pkey_set(int pkey, unsigned long rights, unsigned long flags)
@@ -363,12 +351,8 @@ static int hw_pkey_set(int pkey, unsigned long rights, unsigned long flags)
 	/* make sure that 'rights' only contains the bits we expect: */
 	assert(!(rights & ~mask));
 
-	/* copy old pkey_reg */
-	new_pkey_reg = old_pkey_reg;
-	/* mask out bits from pkey in old value: */
-	new_pkey_reg &= ~(mask << (pkey * PKEY_BITS_PER_PKEY));
-	/* OR in new bits for pkey: */
-	new_pkey_reg |= (rights << (pkey * PKEY_BITS_PER_PKEY));
+	/* modify bits accordingly in old pkey_reg and assign it */
+	new_pkey_reg = set_pkey_bits(old_pkey_reg, pkey, rights);
 
 	__write_pkey_reg(new_pkey_reg);
 
@@ -402,7 +386,7 @@ void pkey_disable_set(int pkey, int flags)
 	ret = hw_pkey_set(pkey, pkey_rights, syscall_flags);
 	assert(!ret);
 	/* pkey_reg and flags have the same format */
-	shadow_pkey_reg |= flags << (pkey * 2);
+	shadow_pkey_reg = set_pkey_bits(shadow_pkey_reg, pkey, pkey_rights);
 	dprintf1("%s(%d) shadow: 0x"PKEY_REG_FMT"\n",
 		__func__, pkey, shadow_pkey_reg);
 
@@ -436,7 +420,7 @@ void pkey_disable_clear(int pkey, int flags)
 	pkey_rights |= flags;
 
 	ret = hw_pkey_set(pkey, pkey_rights, 0);
-	shadow_pkey_reg &= ~(flags << (pkey * 2));
+	shadow_pkey_reg = set_pkey_bits(shadow_pkey_reg, pkey, pkey_rights);
 	pkey_assert(ret >= 0);
 
 	pkey_rights = hw_pkey_get(pkey, syscall_flags);
@@ -512,7 +496,8 @@ int alloc_pkey(void)
 			shadow_pkey_reg);
 	if (ret) {
 		/* clear both the bits: */
-		shadow_pkey_reg &= ~(0x3      << (ret * 2));
+		shadow_pkey_reg = set_pkey_bits(shadow_pkey_reg, ret,
+						~PKEY_MASK);
 		dprintf4("%s()::%d, ret: %d pkey_reg: 0x"PKEY_REG_FMT
 				" shadow: 0x"PKEY_REG_FMT"\n",
 				__func__,
@@ -522,7 +507,8 @@ int alloc_pkey(void)
 		 * move the new state in from init_val
 		 * (remember, we cheated and init_val == pkey_reg format)
 		 */
-		shadow_pkey_reg |=  (init_val << (ret * 2));
+		shadow_pkey_reg = set_pkey_bits(shadow_pkey_reg, ret,
+						init_val);
 	}
 	dprintf4("%s()::%d, ret: %d pkey_reg: 0x"PKEY_REG_FMT
 			" shadow: 0x"PKEY_REG_FMT"\n",
-- 
2.17.1


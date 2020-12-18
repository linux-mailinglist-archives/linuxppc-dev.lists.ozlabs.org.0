Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3EC2DDE8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 07:23:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxzLz27hJzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 17:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TVpDwF5F; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxzKD5l1vzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 17:21:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BI62Jv6160568; Fri, 18 Dec 2020 01:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=v0I4Firm0Qr586y5SeVV+M1N6ptYXQ/oTT7Jl73AOCc=;
 b=TVpDwF5FoljaNIbcfaOA2Uue9DH85YjBloyDzPkdSiGP4fDVUB3BNjByEvcty24Zeb+s
 i0TJN9ejdupz1AqxO91WEGudPcsSgwDnOOZSffvE9hE/oZpK+IPuZQbxo4txDERLz6Y2
 iSvqGreu9EGHemDOZVhNNTH34viJla0vVhS/TLRrLLFY7UagBN4WXDq8Kh5yTWUVw3GC
 SeTH5WBBAPI+hUhmC58/mRa3SDpjCiJjtu1x/ra0qWjoZ4fHSqKZSo2K1CN8AihRe9xz
 WTxDlafekJwNlbxYgrHb9Nh4lDWjwuu7Ydav1bRO5GQtuIIGQAC9Fjh5UDFCY8UsZBkR /w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gpkerphc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 01:21:22 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BI6FrHK023987;
 Fri, 18 Dec 2020 06:21:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng9dfyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 06:21:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BI6LLth29426150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 06:21:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18B19BE059;
 Fri, 18 Dec 2020 06:21:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5548CBE054;
 Fri, 18 Dec 2020 06:21:19 +0000 (GMT)
Received: from manicouagan.localdomain.com (unknown [9.85.195.64])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 06:21:18 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Limit allocation of SWIOTLB on server machines
Date: Fri, 18 Dec 2020 03:21:03 -0300
Message-Id: <20201218062103.76102-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_03:2020-12-17,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180040
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On server-class POWER machines, we don't need the SWIOTLB unless we're a
secure VM. Nevertheless, if CONFIG_SWIOTLB is enabled we unconditionally
allocate it.

In most cases this is harmless, but on a few machine configurations (e.g.,
POWER9 powernv systems with 4 GB area reserved for crashdump kernel) it can
happen that memblock can't find a 64 MB chunk of memory for the SWIOTLB and
fails with a scary-looking WARN_ONCE:

 ------------[ cut here ]------------
 memblock: bottom-up allocation failed, memory hotremove may be affected
 WARNING: CPU: 0 PID: 0 at mm/memblock.c:332 memblock_find_in_range_node+0x328/0x340
 Modules linked in:
 CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc2-orig+ #6
 NIP:  c000000000442f38 LR: c000000000442f34 CTR: c0000000001e0080
 REGS: c000000001def900 TRAP: 0700   Not tainted  (5.10.0-rc2-orig+)
 MSR:  9000000002021033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 28022222  XER: 20040000
 CFAR: c00000000014b7b4 IRQMASK: 1
 GPR00: c000000000442f34 c000000001defba0 c000000001deff00 0000000000000047
 GPR04: 00000000ffff7fff c000000001def828 c000000001def820 0000000000000000
 GPR08: 0000001ffc3e0000 c000000001b75478 c000000001b75478 0000000000000001
 GPR12: 0000000000002000 c000000002030000 0000000000000000 0000000000000000
 GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000002030000
 GPR20: 0000000000000000 0000000000010000 0000000000010000 c000000001defc10
 GPR24: c000000001defc08 c000000001c91868 c000000001defc18 c000000001c91890
 GPR28: 0000000000000000 ffffffffffffffff 0000000004000000 00000000ffffffff
 NIP [c000000000442f38] memblock_find_in_range_node+0x328/0x340
 LR [c000000000442f34] memblock_find_in_range_node+0x324/0x340
 Call Trace:
 [c000000001defba0] [c000000000442f34] memblock_find_in_range_node+0x324/0x340 (unreliable)
 [c000000001defc90] [c0000000015ac088] memblock_alloc_range_nid+0xec/0x1b0
 [c000000001defd40] [c0000000015ac1f8] memblock_alloc_internal+0xac/0x110
 [c000000001defda0] [c0000000015ac4d0] memblock_alloc_try_nid+0x94/0xcc
 [c000000001defe30] [c00000000159c3c8] swiotlb_init+0x78/0x104
 [c000000001defea0] [c00000000158378c] mem_init+0x4c/0x98
 [c000000001defec0] [c00000000157457c] start_kernel+0x714/0xac8
 [c000000001deff90] [c00000000000d244] start_here_common+0x1c/0x58
 Instruction dump:
 2c230000 4182ffd4 ea610088 ea810090 4bfffe84 39200001 3d42fff4 3c62ff60
 3863c560 992a8bfc 4bd0881d 60000000 <0fe00000> ea610088 4bfffd94 60000000
 random: get_random_bytes called from __warn+0x128/0x184 with crng_init=0
 ---[ end trace 0000000000000000 ]---
 software IO TLB: Cannot allocate buffer

Unless this is a secure VM the message can actually be ignored, because the
SWIOTLB isn't needed. Therefore, let's avoid the SWIOTLB in those cases.

Fixes: eae9eec476d1 ("powerpc/pseries/svm: Allocate SWIOTLB buffer anywhere in memory")
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/mm/mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index afab328d0887..3af991844145 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -300,7 +300,8 @@ void __init mem_init(void)
 	memblock_set_bottom_up(true);
 	if (is_secure_guest())
 		svm_swiotlb_init();
-	else
+	/* Server machines don't need SWIOTLB if they're not secure guests. */
+	else if (!machine_is(pseries) && !machine_is(powernv))
 		swiotlb_init(0);
 #endif
 

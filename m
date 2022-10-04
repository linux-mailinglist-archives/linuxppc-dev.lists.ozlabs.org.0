Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F35F4BFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhszy2fKlz30Bb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 09:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DgMVaYKZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DgMVaYKZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhsyy4hRbz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 09:37:29 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294MOxKE008207
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Oct 2022 22:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=v3h+vW1mYuCobjs469KgWYfgljfYff4dl0AT7f4l94Q=;
 b=DgMVaYKZBsklVGV6swOjUwYA9AjTiXcIcyaxGJsAylufzh/RdjXVlZPh0QjaDCL1i3rK
 MGdxKxtWne7EJT+RZ/KaXCwEpgZAtciXHr0utCaECcNU1g1OP4v1BpI3w/KIXk73JS/3
 zbcKuvy852aQ2bNIEkkCCAIKzIYIN8ZO4Hy0otSesV3X93ITWepjJJmbxyc7yqXSrQCK
 mnhGYfqtJ7kGpjNr2qE+gAIuG2XqoJJRSI2QsERft6ffwdNXjc7d4YyzX+eb7Ha4/SNu
 nEptPRuFlY2metHvpw0aOgggXmcyI0QsQxhJDLXd1rXCiKR31fuK4NqHiGaNomGdUF2V Ag== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0gw1qwb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 22:37:26 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 294MamI2020445
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Oct 2022 22:37:26 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3jxd6a5hn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 22:37:26 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 294MbO7S20709968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Oct 2022 22:37:25 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E0A558058
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:37:24 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6745358054
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:37:24 +0000 (GMT)
Received: from localhost (unknown [9.211.83.15])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 22:37:24 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Date: Tue,  4 Oct 2022 17:37:24 -0500
Message-Id: <20221004223724.38707-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AOrrMRzeVD7vrshpf_CHiYbNRHLoU2rx
X-Proofpoint-GUID: AOrrMRzeVD7vrshpf_CHiYbNRHLoU2rx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=898 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210040145
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is known to crash at boot on book3s_64 with non-radix MMU. As
noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
KASAN support"):

  A kernel with CONFIG_KASAN=y will crash during boot on a machine
  using HPT translation because not all the entry points to the
  generic KASAN code are protected with a call to kasan_arch_is_ready().

Such crashes look like this:

  BUG: Unable to handle kernel data access at 0xc00e00000308b100
  Faulting instruction address: 0xc0000000006d0fcc
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc5-02183-g3ab165dea2a2 #13
  [...regs...]
  NIP [c0000000006d0fcc] kasan_byte_accessible+0xc/0x20
  LR [c0000000006cd9cc] __kasan_check_byte+0x2c/0xa0
  Call Trace:
  [c00000001688f930] [c00000001688f970] 0xc00000001688f970 (unreliable)
  [c00000001688f970] [c0000000005f6a74] ksize+0x34/0xa0
  [c00000001688f9a0] [c0000000024c03a8] __alloc_skb+0xd8/0x2d0
  [c00000001688fa00] [c0000000003c48c0] audit_log_start+0x260/0x660
  [c00000001688fb30] [c0000000003c50ec] audit_log+0x3c/0x70
  [c00000001688fb60] [c00000000404590c] audit_init+0x188/0x1ac
  [c00000001688fbe0] [c0000000000127e0] do_one_initcall+0xe0/0x610
  [c00000001688fcd0] [c00000000400a1f0] kernel_init_freeable+0x4c0/0x574
  [c00000001688fda0] [c000000000013450] kernel_init+0x30/0x1d0
  [c00000001688fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64

If you look carefully enough at the full kernel output, you might
notice this message, much earlier:

  KASAN not enabled as it requires radix!

But the eventual oops does not carry any indication that the real
problem was detected early on and is a known limitation.

Change init_book3s_64.c::kasan_init() to emit a warning backtrace and
taint the kernel when not running on radix. When the kernel likely
oopses later, the 'W' taint flag in the report should help minimize
developer time spent trying to understand what's gone wrong.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/mm/kasan/init_book3s_64.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index 9300d641cf9a..5d9894d7fb97 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -56,10 +56,8 @@ void __init kasan_init(void)
 	u64 i;
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
 
-	if (!early_radix_enabled()) {
-		pr_warn("KASAN not enabled as it requires radix!");
+	if (WARN(!early_radix_enabled(), "KASAN known broken on HPT"))
 		return;
-	}
 
 	for_each_mem_range(i, &start, &end)
 		kasan_init_phys_region((void *)start, (void *)end);
-- 
2.37.1


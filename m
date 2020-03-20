Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A818CC1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 12:03:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kLVX5SPXzDrPs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 22:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kLSQ754mzDrMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 22:01:42 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KAlXlL028063
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 07:01:39 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu98vg13w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 07:01:39 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Fri, 20 Mar 2020 11:01:38 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 11:01:35 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02KB0Xxw42140008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 11:00:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A4714C04A;
 Fri, 20 Mar 2020 11:01:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DCED4C040;
 Fri, 20 Mar 2020 11:01:33 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.55.224])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 11:01:33 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: Fix MCE handling on pseries
Date: Fri, 20 Mar 2020 16:31:19 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20032011-0012-0000-0000-000003946CD6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032011-0013-0000-0000-000021D155DB
Message-Id: <20200320110119.10207-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_02:2020-03-20,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 phishscore=0
 clxscore=1015 adultscore=0 mlxlogscore=490 suspectscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003200044
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
Cc: mahesh@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MCE handling on pSeries platform fails as recent rework to use common
code for pSeries and PowerNV in machine check error handling tries to
access per-cpu variables in realmode. The per-cpu variables may be
outside the RMO region on pSeries platform and needs translation to be
enabled for access. Just moving these per-cpu variable into RMO region
did'nt help because we queue some work to workqueues in real mode, which
again tries to touch per-cpu variables. Also fwnmi_release_errinfo()
cannot be called when translation is not enabled.

This patch fixes this by enabling translation in the exception handler
when all required real mode handling is done. This change only affects
the pSeries platform.

Without this fix below kernel crash is seen on injecting
SLB multihit:

BUG: Unable to handle kernel data access on read at 0xc00000027b205950
Faulting instruction address: 0xc00000000003b7e0
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: mcetest_slb(OE+) af_packet(E) xt_tcpudp(E) ip6t_rpfilter(E) ip6t_REJECT(E) ipt_REJECT(E) xt_conntrack(E) ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ebtable_filter(E) ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) xfs(E) ibmveth(E) vmx_crypto(E) gf128mul(E) uio_pdrv_genirq(E) uio(E) crct10dif_vpmsum(E) rtc_generic(E) btrfs(E) libcrc32c(E) xor(E) zstd_decompress(E) zstd_compress(E) raid6_pq(E) sr_mod(E) sd_mod(E) cdrom(E) ibmvscsi(E) scsi_transport_srp(E) crc32c_vpmsum(E) dm_mod(E) sg(E) scsi_mod(E)
CPU: 34 PID: 8154 Comm: insmod Kdump: loaded Tainted: G OE 5.5.0-mahesh #1
NIP: c00000000003b7e0 LR: c0000000000f2218 CTR: 0000000000000000
REGS: c000000007dcb960 TRAP: 0300 Tainted: G OE (5.5.0-mahesh)
MSR: 8000000000001003 <SF,ME,RI,LE> CR: 28002428 XER: 20040000
CFAR: c0000000000f2214 DAR: c00000027b205950 DSISR: 40000000 IRQMASK: 0
GPR00: c0000000000f2218 c000000007dcbbf0 c000000001544800 c000000007dcbd70
GPR04: 0000000000000001 c000000007dcbc98 c008000000d00258 c0080000011c0000
GPR08: 0000000000000000 0000000300000003 c000000001035950 0000000003000048
GPR12: 000000027a1d0000 c000000007f9c000 0000000000000558 0000000000000000
GPR16: 0000000000000540 c008000001110000 c008000001110540 0000000000000000
GPR20: c00000000022af10 c00000025480fd70 c008000001280000 c00000004bfbb300
GPR24: c000000001442330 c00800000800000d c008000008000000 4009287a77000510
GPR28: 0000000000000000 0000000000000002 c000000001033d30 0000000000000001
NIP [c00000000003b7e0] save_mce_event+0x30/0x240
LR [c0000000000f2218] pseries_machine_check_realmode+0x2c8/0x4f0
Call Trace:
Instruction dump:
3c4c0151 38429050 7c0802a6 60000000 fbc1fff0 fbe1fff8 f821ffd1 3d42ffaf
3fc2ffaf e98d0030 394a1150 3bdef530 <7d6a62aa> 1d2b0048 2f8b0063 380b0001
---[ end trace 46fd63f36bbdd940 ]---

Fixes: 9ca766f9891d ("powerpc/64s/pseries: machine check convert to use common event code")
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: Avoid asm code to switch to virtual mode.
---
 arch/powerpc/platforms/pseries/ras.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 1d7f973c647b..43710b69e09e 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -683,6 +683,17 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 #endif
 
 out:
+	/*
+	 * Enable translation as we will be accessing per-cpu variables
+	 * in save_mce_event() which may fall outside RMO region, also
+	 * leave it enabled because subsequently we will be queuing work
+	 * to workqueues where again per-cpu variables accessed, besides
+	 * fwnmi_release_errinfo() crashes when called in realmode on
+	 * pseries.
+	 * Note: All the realmode handling like flushing SLB entries for
+	 *       SLB multihit is done by now.
+	 */
+	mtmsr(mfmsr() | MSR_IR | MSR_DR);
 	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
 			&mce_err, regs->nip, eaddr, paddr);
 
-- 
2.17.2


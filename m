Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4F8B906A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 15:12:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZYym6Yp4zF3FW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZYqW136TzF2Wl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 23:05:42 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KD5dni133828
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:05:40 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4x5cb97f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:05:39 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 20 Sep 2019 14:05:31 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Sep 2019 14:05:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KD5PkD56557750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 13:05:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA9111C066;
 Fri, 20 Sep 2019 13:05:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2A2511C04C;
 Fri, 20 Sep 2019 13:05:24 +0000 (GMT)
Received: from pomme.com (unknown [9.145.3.52])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 13:05:24 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] powerpc/mm: Conditionally call H_BLOCK_REMOVE
Date: Fri, 20 Sep 2019 15:05:21 +0200
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092013-0016-0000-0000-000002AE913D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092013-0017-0000-0000-0000330F465C
Message-Id: <20190920130523.20441-1-ldufour@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=870 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200126
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the commit ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE"),
the call to H_BLOCK_REMOVE is always done if the feature is exhibited.

However, the hypervisor may not support all the block size for the hcall
H_BLOCK_REMOVE depending on the segment base page size and actual page
size.

When unsupported block size is used, the hcall H_BLOCK_REMOVE is returning
H_PARAM, which is triggering a BUG_ON check leading to a panic like this:

kernel BUG at /home/srikar/work/linux.git/arch/powerpc/platforms/pseries/lpar.c:466!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 28 PID: 583 Comm: modprobe Not tainted 5.2.0-master #5
NIP: c0000000000be8dc LR: c0000000000be880 CTR: 0000000000000000
REGS: c0000007e77fb130 TRAP: 0700  Not tainted (5.2.0-master)
MSR: 8000000000029032 <SF,EE,ME,IR,DR,RI> CR: 42224824 XER: 20000000
CFAR: c0000000000be8fc IRQMASK: 0
GPR00: 0000000022224828 c0000007e77fb3c0 c000000001434d00 0000000000000005
GPR04: 9000000004fa8c00 0000000000000000 0000000000000003 0000000000000001
GPR08: c0000007e77fb450 0000000000000000 0000000000000001 ffffffffffffffff
GPR12: c0000007e77fb450 c00000000edfcb80 0000cd7d3ea30000 c0000000016022b0
GPR16: 00000000000000b0 0000cd7d3ea30000 0000000000000001 c080001f04f00105
GPR20: 0000000000000003 0000000000000004 c000000fbeb05f58 c000000001602200
GPR24: 0000000000000000 0000000000000004 8800000000000000 c000000000c5d148
GPR28: c000000000000000 8000000000000000 a000000000000000 c0000007e77fb580
NIP [c0000000000be8dc] .call_block_remove+0x12c/0x220
LR [c0000000000be880] .call_block_remove+0xd0/0x220
Call Trace:
[c0000007e77fb3c0] [c000000fb8c00240] 0xc000000fb8c00240 (unreliable)
[c0000007e77fb4e0] [c0000000000bfef8] .pSeries_lpar_flush_hash_range+0x578/0x670
[c0000007e77fb660] [c000000000073994] .flush_hash_range+0x44/0x100
[c0000007e77fb700] [c00000000007667c] .__flush_tlb_pending+0x3c/0xc0
[c0000007e77fb780] [c0000000002d3fdc] .zap_pte_range+0x7ec/0x830
[c0000007e77fb8d0] [c0000000002d4524] .unmap_page_range+0x3f4/0x540
[c0000007e77fb9f0] [c0000000002d4a04] .unmap_vmas+0x94/0x120
[c0000007e77fbab0] [c0000000002e0efc] .exit_mmap+0xac/0x1f0
[c0000007e77fbbc0] [c0000000000fae1c] .mmput+0x9c/0x1f0
[c0000007e77fbc40] [c000000000105738] .do_exit+0x388/0xd60
[c0000007e77fbd20] [c0000000001061b4] .do_group_exit+0x54/0x100
[c0000007e77fbdb0] [c000000000106274] .__se_sys_exit_group+0x14/0x20
[c0000007e77fbe20] [c00000000000b688] system_call+0x5c/0x70
Instruction dump:
39400001 38a00000 4800003c 60000000 60420000 7fa9e800 38e00000 419e0014
7d29d278 7d290074 7929d182 69270001 <0b070000> 7d495378 394a0001 7fa93040

The PAPR document specifies the TLB Block Invalidate Characteristics which
tells for each pair of segment base page size, actual page size, the size
of the block the hcall H_BLOCK_REMOVE is supporting (cf Power Architecture
Platform Requirements +, Section 7.3.16.23, page 252).

Supporting various block sizes doesn't seem needed at that time since all
systems I was able to play with was supporting an 8 addresses block size,
which is the maximum through the hcall, or none at all. Supporting various
size would complexify the algorithm in call_block_remove() so unless this
is required, this is not done.

In the case of block size different from 8, a warning message is displayed
at boot time and that block size will be ignored checking for the
H_BLOCK_REMOVE support.

Due to the minimal amount of hardware showing a limited set of
H_BLOCK_REMOVE supported page size, I don't think there is a need to push
this series to the stable mailing list.

The first patch is reading the characteristic through the hcall
ibm,get-system-parameter and record the supported block size for each page
size.  The second patch is changing the check used to detect the
H_BLOCK_REMOVE availability to take care of the base page size and page
size couple.

Fixes: ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE")

Changes since V2:
 - Adressing Michael's comments
 - Remove some unedeed logging
 - Replace "hblkr" prefix/suffix to "hlkbrm"
 - In pseries_lpar_read_hblkrm_characteristics()
   - Remove unneeded buffer's initialisation
   - Limit endianness trouble
   - Prevent potential buffer overflow.

Changes since V1:
 - Addressing Aneesh's comments
 - Remove penc initialisation, this is already done in
   mmu_psize_set_default_penc()
 - Add details on the TLB Block Invalidate Characteristics's buffer format
 - Introduce #define instead of using direct numerical values
 - Function reading the characteristics is now directly called from
   pSeries_setup_arch()
 - The characteristics are now stored in a dedciated table static to lpar.c

Laurent Dufour (2):
  powperc/mm: read TLB Block Invalidate Characteristics
  powerpc/mm: call H_BLOCK_REMOVE when supported

 arch/powerpc/platforms/pseries/lpar.c    | 162 ++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/pseries.h |   1 +
 arch/powerpc/platforms/pseries/setup.c   |   1 +
 3 files changed, 162 insertions(+), 2 deletions(-)

-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69334269E95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 08:33:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrD2R1PJbzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 16:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FOW5E8fX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrD0P2fvmzDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 16:31:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08F6704u098249; Tue, 15 Sep 2020 02:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=b/EX2RhTV5VeaSE/WblE3R6qq3W28b/TaRIYmsvfycQ=;
 b=FOW5E8fXjti3IXj6reR13VSJi05PGZ78gUSWRvZFmrIjcNyEANlGJAT2d/nRrbaLYk2Z
 pHuqLy1ShFbUggQcmokXVG4pDrT+j3s/PUFif9/SsFpDUbGtLNmtNSQyRsHOCyetVT7k
 fx7dcXIJ2Sw2TJEMKRy5xawVjgsvkhnRAyL7P4kTcGOJ68Y3rDSE4sSrU2alAAsqavp9
 Bp8sFukvr2YoUNgtQGzT1Aa6/LQXa/a5KWL3MkKe/BLEvj/8GAPFTME4qOeCkeiO3uLp
 pw9l2OBZenTAz9/k9R+O6Lxx0gU9X8V8AN5at0JL5CRRPJiS5+rTPZSe0jn7/9CcOA5y kg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33jqaw9h30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 02:31:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08F6NhMs022605;
 Tue, 15 Sep 2020 06:31:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 33h2r9aq80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 06:31:38 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08F6U20D10027470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 06:30:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72BC8AE051;
 Tue, 15 Sep 2020 06:31:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE154AE063;
 Tue, 15 Sep 2020 06:31:35 +0000 (GMT)
Received: from [9.199.38.191] (unknown [9.199.38.191])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Sep 2020 06:31:35 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: [5.9.0-rc5-20200914] Kernel crash while running LTP(mlock201)
Message-Id: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
Date: Tue, 15 Sep 2020 12:01:34 +0530
To: linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_04:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxlogscore=839
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150052
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running LTP tests (specifically mlock201) against next-20200914 =
tree
on a POWER9 LPAR results in following crash.

BUG: Kernel NULL pointer dereference on read at 0x00000000
Faulting instruction address: 0xc000000000454248
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
Modules linked in: af_packet(E) nft_ct(E) nf_conntrack(E) =
nf_defrag_ipv6(E) nf_defrag_ipv4(E) libcrc32c(E) ip6_tables(E) =
nft_compat(E) ip_set(E) rfkill(E) nf_tables(E) nfnetlink(E) =
vmx_crypto(E) uio_pdrv_genirq(E) gf128mul(E) uio(E) rtc_generic(E) =
crct10dif_vpmsum(E) sch_fq_codel(E) ip_tables(E) x_tables(E) ext4(E) =
crc16(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) sg(E) ibmvscsi(E) =
scsi_transport_srp(E) scsi_mod(E) ibmveth(E) crc32c_vpmsum(E) =
dm_mirror(E) dm_region_hash(E) dm_log(E) dm_mod(E) autofs4(E)
CPU: 11 PID: 26435 Comm: mlock201 Tainted: G            E     =
5.9.0-rc5-next-20200914-281.gf529200-default #1
NIP:  c000000000454248 LR: c000000000445a74 CTR: c000000000413150
REGS: c0000008e645b770 TRAP: 0300   Tainted: G            E      =
(5.9.0-rc5-next-20200914-281.gf529200-default)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28002482  XER: =
20040000
CFAR: c00000000000fbb0 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0=20=

GPR00: c000000000445a74 c0000008e645ba00 c0000000017c4500 =
0000000000000000=20
GPR04: 0000000000000001 c0000008ea109e98 c0000008f0c40000 =
0000000000000000=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000003=20
GPR12: c000000000413150 c00000001ec70200 0000000000000000 =
c000000001502038=20
GPR16: 00007fff9c61ffff 00007fff9c61ffff 00007fff9c61ffff =
c000000000cb02f8=20
GPR20: 00007fff9c5c0000 00007fff9c620000 c0000008e645bcd8 =
c0000008f0c40000=20
GPR24: c00c0000023c0d00 fffffffffffffe7f 0000000000000000 =
c0000008f0c40000=20
GPR28: c0000008ea109e98 0000000000000001 c0000008ea9288a8 =
0000000000000000=20
NIP [c000000000454248] PageHuge+0x8/0x60
LR [c000000000445a74] find_get_incore_page+0x114/0x160
Call Trace:
[c0000008e645ba00] [c000000000445994] find_get_incore_page+0x34/0x160 =
(unreliable)
[c0000008e645ba40] [c000000000412e54] mincore_page+0x24/0x160
[c0000008e645ba70] [c000000000413020] =
__mincore_unmapped_range+0x90/0x160
[c0000008e645bac0] [c000000000413680] mincore_pte_range+0x530/0x5d0
[c0000008e645bb40] [c000000000422a38] walk_pgd_range+0x4e8/0xae0
[c0000008e645bc30] [c0000000004230c4] __walk_page_range+0x94/0x250
[c0000008e645bcb0] [c0000000004233d8] walk_page_range+0x158/0x1e0
[c0000008e645bd40] [c00000000041386c] sys_mincore+0x14c/0x370
[c0000008e645bdc0] [c000000000033eb8] system_call_exception+0xf8/0x200
[c0000008e645be20] [c00000000000d140] system_call_common+0xf0/0x27c
Instruction dump:
e8410018 38210020 e8010010 7c0803a6 4e800020 60000000 3d400001 7d435378=20=

4e800020 60000000 7c0802a6 60000000 <e9230000> 75290001 40820010 =
e9230008=20
---[ end trace 357eb14a3b22eab2 ]=E2=80=94


The function find_get_incore_page() was introduced with=20
3fcbe4eb49a0406e6202e8c8c3560f30965a8e79=20

mm: factor find_get_incore_page out of mincore_page


Thanks
-Sachin


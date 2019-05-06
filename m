Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BBC151D7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 18:45:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yTBY42bGzDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 02:45:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ricklind@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yT8q0wKFzDq7n
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 02:44:10 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46GcnKm090374
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 12:44:07 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2saqjuu727-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 12:44:07 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ricklind@linux.vnet.ibm.com>;
 Mon, 6 May 2019 17:44:06 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 17:44:03 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x46Gi0UO64356540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 16:44:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96873BE056;
 Mon,  6 May 2019 16:44:00 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AA46BE051;
 Mon,  6 May 2019 16:43:59 +0000 (GMT)
Received: from [9.80.199.74] (unknown [9.80.199.74])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 16:43:59 +0000 (GMT)
Subject: Re: [PATCH] powerpc/book3s/64: check for NULL pointer in pgd_alloc()
To: Michael Ellerman <michaele@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <5ae0401c-a84a-1e59-5d9d-70659f5a85de@linux.vnet.ibm.com>
 <87zhnzx1ey.fsf@concordia.ellerman.id.au>
From: Rick Lindsley <ricklind@linux.vnet.ibm.com>
Date: Mon, 6 May 2019 09:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87zhnzx1ey.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050616-0004-0000-0000-0000150ABB01
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011060; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01199478; UDB=6.00629282; IPR=6.00980354; 
 MB=3.00026758; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-06 16:44:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050616-0005-0000-0000-00008B8D2F60
Message-Id: <7da42c66-2008-e131-05a8-0a8f7f354ab8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060142
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

On 05/06/2019 04:33 AM, Michael Ellerman wrote:

> 
> Can you post an oops log? Just so if someone hits it they can possibly
> recognise it from the back trace etc.

Sure.  The system waa already at the mercy of the oom killer (for other reasons) and finally ran out of things to kill.  Here's the stack trace.  The "missing" (static inline) function in the trace is mm_alloc_pgd().

[ 1849.077846] Unable to handle kernel paging request for data at address 0x00000000
[ 1849.077871] Faulting instruction address: 0xc0000000000a4000
[ 1849.077889] Oops: Kernel access of bad area, sig: 11 [#1]
[ 1849.077905] LE SMP NR_CPUS=2048 NUMA pSeries
[ 1849.077920] Modules linked in: xt_recent ipt_REJECT nf_reject_ipv4 xt_set iptable_mangle iptable_raw ip_set_hash_ip ip_set_hash_net xt_nat xt_comment veth ipip tunnel4 ip_tunnel xt_multiport xt_mark ip_set ip6_tables rpadlpar_io rpaphp ipt_MASQUERADE nf_nat_masquerade_ipv4 nf_conntrack_netlink nfnetlink sctp_diag sctp iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 xt_addrtype tcp_diag udp_diag inet_diag unix_diag af_packet_diag netlink_diag iptable_filter xt_conntrack nf_nat nf_conntrack br_netfilter bridge stp llc overlay nls_utf8 isofs sg pseries_rng binfmt_misc ip_tables xfs libcrc32c sr_mod cdrom sd_mod ibmvscsi scsi_transport_srp ibmveth dm_mirror dm_region_hash dm_log dm_mod
[ 1849.078125] CPU: 70 PID: 48471 Comm: entrypoint.sh Kdump: loaded Not tainted 4.14.0-115.6.1.el7a.ppc64le #1
[ 1849.078154] task: c000000334a00000 task.stack: c000000331c00000
[ 1849.078171] NIP:  c0000000000a4000 LR: c00000000012f43c CTR: 0000000000000020
[ 1849.078192] REGS: c000000331c039c0 TRAP: 0300   Not tainted  (4.14.0-115.6.1.el7a.ppc64le)
[ 1849.078217] MSR:  800000010280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44022840  XER: 20040000
[ 1849.078249] CFAR: c000000000008874 DAR: 0000000000000000 DSISR: 42000000 SOFTE: 1
[ 1849.078249] GPR00: 0000000000000020 c000000331c03c40 c0000000014ce100 0000000000000000
[ 1849.078249] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[ 1849.078249] GPR08: 000000000000001a c00000000166e230 0000000000000000 0000000000000004
[ 1849.078249] GPR12: 0000000000002000 c000000007a50200 00000000100fa0a8 000000001013b118
[ 1849.078249] GPR16: 0000000000000000 0000010008089120 0000000000000060 0000000000000001
[ 1849.078249] GPR20: 00000000ffffffff c000000001691928 c000000334a00000 0000000000000000
[ 1849.078249] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000330640000
[ 1849.078249] GPR28: c000000322980000 c00000000143bea8 0000000000000000 c000000322a40000
[ 1849.078467] NIP [c0000000000a4000] memset+0x68/0x104
[ 1849.078483] LR [c00000000012f43c] mm_init+0x27c/0x2f0
[ 1849.078497] Call Trace:
[ 1849.078506] [c000000331c03c40] [c00000000012f420] mm_init+0x260/0x2f0 (unreliable)
[ 1849.078529] [c000000331c03c80] [c0000000001342c4] copy_mm+0x11c/0x638
[ 1849.078550] [c000000331c03d40] [c00000000013105c] copy_process.isra.28.part.29+0x6fc/0x1080
[ 1849.078575] [c000000331c03dc0] [c00000000013292c] _do_fork+0xdc/0x4c0
[ 1849.078596] [c000000331c03e30] [c00000000000b580] ppc_clone+0x8/0xc
[ 1849.078614] Instruction dump:
[ 1849.078624] 409e000c b0860000 38c60002 409d000c 90860000 38c60004 78a0d183 78a506a0
[ 1849.078648] 7c0903a6 41820034 60000000 60420000 <f8860000> f8860008 f8860010 f8860018
[ 1849.078674] ---[ end trace 4005ba72a5a65464 ]---
[ 1849.081449]
[ 1849.081559] Sending IPI to other CPUs
[ 1849.089581] IPI complete
[ 1849.125032] kexec: Starting switchover sequence.


>> Signed-off-by: Rick Lindsley <ricklind@vnet.linux.ibm.com>
>> Fixes: cf266dbcd2a7 ("Zero PGD pages on allocation")
> 
> I don't have that commit. Did you mean:
> 
> Fixes: fc5c2f4a55a2 ("powerpc/mm/hash64: Zero PGD pages on allocation")

Whoops, sorry, yes.

Rick


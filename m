Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 995BF1753B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 11:37:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zWc36pxjzDqHF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 19:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zWZg1KqWzDqGP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 19:36:42 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x489ZNJd111227
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 May 2019 05:36:38 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sbvm6g1a4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 05:36:38 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Wed, 8 May 2019 10:36:36 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 May 2019 10:36:33 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x489aW7c49938534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 May 2019 09:36:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C19D2A404D;
 Wed,  8 May 2019 09:36:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C05D6A4051;
 Wed,  8 May 2019 09:36:31 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 May 2019 09:36:31 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: [next-20190507][powerpc] WARN kernel/cgroup/cgroup.c:6008 with LTP
 ptrace01 test case
Date: Wed, 8 May 2019 15:06:30 +0530
To: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19050809-0012-0000-0000-000003197D23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050809-0013-0000-0000-00002151FE00
Message-Id: <A8995C41-9A8F-468C-89B2-AB6E44C7EADC@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=519 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905080060
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
Cc: Tejun Heo <tj@kernel.org>, Roman Gushchin <guro@fb.com>,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running LTP tests(specifically ptrace01) following WARNING is =
observed
on POWER8 LPAR running next-20190507 built using 4K page size.

[ 3969.979492] msgrcv04 (433) used greatest stack depth: 9328 bytes left
[ 3981.452911] madvise06 (515): drop_caches: 3
[ 4004.575752] WARNING: CPU: 5 PID: 721 at kernel/cgroup/cgroup.c:6008 =
cgroup_exit+0x2ac/0x2c0
[ 4004.575781] Modules linked in: overlay rpadlpar_io rpaphp =
iptable_mangle xt_MASQUERADE iptable_nat nf_nat xt_conntrack =
nf_conntrack nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4 xt_tcpudp tun =
bridge stp llc kvm iptable_filter pseries_rng rng_core vmx_crypto =
ip_tables x_tables autofs4 [last unloaded: dummy_del_mod]
[ 4004.575837] CPU: 5 PID: 721 Comm: ptrace01 Tainted: G           O     =
 5.1.0-next-20190507-autotest #1
[ 4004.575846] NIP:  c000000001b3026c LR: c000000001b30054 CTR: =
c000000001c9f020
[ 4004.575855] REGS: c000000171fff840 TRAP: 0700   Tainted: G           =
O       (5.1.0-next-20190507-autotest)
[ 4004.575863] MSR:  800000010282b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE,TM[E]>  CR: 44004824  XER: 20000000
[ 4004.575885] CFAR: c000000001b30078 IRQMASK: 1=20
[ 4004.575885] GPR00: c000000001b30054 c000000171fffad0 c000000003938700 =
c00000027b02fa18=20
[ 4004.575885] GPR04: c00000027b02fa00 0000000000000000 c000000003ae8700 =
00000000001c180a=20
[ 4004.575885] GPR08: 0000000000000001 0000000000000001 c000000003ae8700 =
0000000000000001=20
[ 4004.575885] GPR12: 0000000000004400 c00000001ec7ea80 c000000003a4d670 =
0000000000000009=20
[ 4004.575885] GPR16: 0000000000000000 0000000000040100 00000000418004fc =
0000000008430000=20
[ 4004.575885] GPR20: 0000000000000009 0000000000000001 c0000001715e9200 =
c00000016d8f4d00=20
[ 4004.575885] GPR24: c000000171fffd90 0000000000000100 c000000168692478 =
c000000171fffb98=20
[ 4004.575885] GPR28: c000000168692400 c00000016d8f4d00 c0000000036420d0 =
c00000027b02fa00=20
[ 4004.575958] NIP [c000000001b3026c] cgroup_exit+0x2ac/0x2c0
[ 4004.575966] LR [c000000001b30054] cgroup_exit+0x94/0x2c0
[ 4004.575972] Call Trace:
[ 4004.575979] [c000000171fffad0] [c000000001b30054] =
cgroup_exit+0x94/0x2c0 (unreliable)
[ 4004.575990] [c000000171fffb30] [c0000000019cea98] =
do_exit+0x878/0x1ae0
[ 4004.575999] [c000000171fffc00] [c0000000019cfe4c] =
do_group_exit+0xac/0x1d0
[ 4004.576009] [c000000171fffc40] [c0000000019ed00c] =
get_signal+0x2bc/0x11c0
[ 4004.576019] [c000000171fffd30] [c000000001867b14] =
do_notify_resume+0x384/0x900
[ 4004.576029] [c000000171fffe20] [c00000000183e844] =
ret_from_except_lite+0x70/0x74
[ 4004.576037] Instruction dump:
[ 4004.576043] 314a0001 7d40492d 40c2fff4 3d42001b e92a7288 39290001 =
f92a7288 4bfffe5c=20
[ 4004.576056] 3d42001b e92a7258 39290001 f92a7258 <0fe00000> 4bfffe0c =
4be91e45 60000000=20
[ 4004.576071] ---[ end trace 82a1a7c19005ebd6 ]=E2=80=94

The WARN_ONCE was added by following commit=20
96b9c592def5 ("cgroup: get rid of cgroup_freezer_frozen_exit()=E2=80=9D).=20=


Reverting the patch helps avoid the warning.

Thanks
-Sachin=


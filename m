Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7545E7F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 07:41:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0lWx6c2xz2yN1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqqzHwiy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dqqzHwiy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0lW65TTNz2xtT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 17:40:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQ4kQ0v017130; 
 Fri, 26 Nov 2021 06:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 subject : message-id : date : cc : to : content-transfer-encoding :
 mime-version; s=pp1; bh=L+qTGsV07eipPM7xUhUdQFqRYiIMZ+96OahlfZfYL6U=;
 b=dqqzHwiyhkeTwwa9BMOUqZHR0tsmSQyHDmPnu+Q8GTYisEqjfQBa+u3HgUU/tmGHfMof
 sbTns/51BsYxi7Ig27/kifsgaPPs+h4mnwOV+j/EbOOPLp9O1OI+46+ysKNDbsw1sEvq
 QL4q2CCVc8TwvBs9/V+RoRCjRIKwOSGipUnWXuZNvlhPYnmMo0xzMFPicShwIX4Yk8Wx
 PPX7h8fwtsLEZUj8DrbqaoruWl5W/qYrjJezQX9LuYmZLul85H4UEqqnxW0KunOCNcEr
 um097T/dBms5T3rNJSBf/dd98q1UvdU4IVU20dL2UZzL1jFGfpvNe4a784FbT5Fto36z Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cjruq9r2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 06:40:44 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQ6HVY8031947;
 Fri, 26 Nov 2021 06:40:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cjruq9r23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 06:40:43 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQ6chEM006332;
 Fri, 26 Nov 2021 06:40:42 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3cerna5xuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 06:40:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQ6ed3465274218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 06:40:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A6C5A405B;
 Fri, 26 Nov 2021 06:40:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3CE6A4054;
 Fri, 26 Nov 2021 06:40:38 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.181.116])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Nov 2021 06:40:38 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: [powerpc/merge] ftrace warning while running stress_code_patching
Message-Id: <3668743C-09DF-4673-B15C-2FFE2A57F7D7@linux.vnet.ibm.com>
Date: Fri, 26 Nov 2021 12:10:37 +0530
To: linuxppc-dev@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Uz137YRdPqNZOZj2Wxx2I2Kf5itkPZLP
X-Proofpoint-ORIG-GUID: bILyIVxoESyBbDyzzJJ8ywwPzgFuJw7r
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_02,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=665 phishscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260036
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running stress_code_patching.sh (powerpc/mm selftest) against
latest powerpc/merge branch (5.16.0-rc2-g2dbc3a3e8fc1) following
warning is seen:

Reverting following patch allows the test to run successfully.
commit 8b8a8f0ab3f5 :
powerpc/code-patching: Improve verification of patchability

I did try the 3 patch series [1] (powerpc/code-patching) posted by Nick, bu=
t that does not
seem to fix the problem.

ftrace-powerpc: Unexpected call sequence at 000000001d3f5e8d: 4801c5ad 2c23=
0000
------------[ ftrace bug ]------------
ftrace failed to modify=20
[<c008000007110004>] fuse_len_args+0x4/0x80 [fuse]
 actual:   ad:c5:01:48
Setting ftrace call site to call ftrace function
ftrace record flags: 80000001
(1)=20=20
expected tramp: c000000000082494
------------[ cut here ]------------
WARNING: CPU: 18 PID: 1991307 at kernel/trace/ftrace.c:2068 ftrace_bug+0x27=
4/0x2e8
Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_defrag_ipv6 nf_def=
rag_ipv4 ip_set nf_tables rfkill libcrc32c nfnetlink sunrpc pseries_rng xts=
 vmx_crypto sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvs=
csi ibmveth scsi_transport_srp fuse
CPU: 18 PID: 1991307 Comm: stress_code_pat Not tainted 5.16.0-rc2-g2dbc3a3e=
8fc1 #1
NIP:  c0000000002d710c LR: c0000000002d7108 CTR: c0000000001f5e40
REGS: c000000039d9b760 TRAP: 0700   Not tainted  (5.16.0-rc2-g2dbc3a3e8fc1)
MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48228224  XER=
: 20040009
CFAR: c0000000001f99e0 IRQMASK: 0=20
GPR00: c0000000002d7108 c000000039d9ba00 c000000002a00500 0000000000000022=
=20
GPR04: 00000000ffff7fff c000000039d9b720 0000000000000027 c000000efd747e18=
=20
GPR08: 0000000000000023 0000000000000001 0000000000000027 0000000000000001=
=20
GPR12: 0000000000008000 c000000effbf8280 0000000040000000 000000012d9f9798=
=20
GPR16: 000000012d9f9724 000000012d996be8 000000012d92f4f0 000000012d9fd568=
=20
GPR20: 000000015bed3ed0 0000000000000001 000000012d9a99d8 00007fffc36f7f54=
=20
GPR24: 0000000000000001 0000000000000000 c000000039d9bc70 c000000000faf228=
=20
GPR28: c000000000ff3730 c000000000fac298 c008000007110004 c000000016690000=
=20
NIP [c0000000002d710c] ftrace_bug+0x274/0x2e8
LR [c0000000002d7108] ftrace_bug+0x270/0x2e8
Call Trace:
[c000000039d9ba00] [c0000000002d7108] ftrace_bug+0x270/0x2e8 (unreliable)
[c000000039d9ba90] [c0000000002d05c8] ftrace_modify_all_code+0x108/0x1c0
[c000000039d9bac0] [c0000000000822b8] arch_ftrace_update_code+0x18/0x30
[c000000039d9bae0] [c0000000002d07b8] ftrace_run_update_code+0x58/0xe0
[c000000039d9bb10] [c0000000002d5a78] ftrace_startup+0xf8/0x1a0
[c000000039d9bb50] [c0000000002d5b6c] register_ftrace_function+0x4c/0xc0
[c000000039d9bb80] [c0000000002f9b38] function_trace_init+0x88/0x100
[c000000039d9bbb0] [c0000000002efaf8] tracing_set_tracer+0x368/0x550
[c000000039d9bc50] [c0000000002efdf8] tracing_set_trace_write+0x118/0x180
[c000000039d9bd10] [c000000000491e50] vfs_write+0xf0/0x340
[c000000039d9bd60] [c00000000049227c] ksys_write+0x7c/0x140
[c000000039d9bdb0] [c000000000033284] system_call_exception+0x174/0x370
[c000000039d9be10] [c00000000000c74c] system_call_common+0xec/0x250
--- interrupt: c00 at 0x7fffb4f0bd74
NIP:  00007fffb4f0bd74 LR: 00007fffb4e834c4 CTR: 0000000000000000
REGS: c000000039d9be80 TRAP: 0c00   Not tainted  (5.16.0-rc2-g2dbc3a3e8fc1)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222222  =
XER: 00000000
IRQMASK: 0=20
GPR00: 0000000000000004 00007fffc36f7d30 00007fffb5007100 0000000000000001=
=20
GPR04: 000000015bed1750 0000000000000009 0000000000000010 000000006e6f6974=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00007fffb513aeb0 0000000040000000 000000012d9f9798=
=20
GPR16: 000000012d9f9724 000000012d996be8 000000012d92f4f0 000000012d9fd568=
=20
GPR20: 000000015bed3ed0 0000000000000001 000000012d9a99d8 00007fffc36f7f54=
=20
GPR24: 00007fffc36f7f50 000000012d9faf94 0000000000000009 000000015bed1750=
=20
GPR28: 0000000000000009 00007fffb5001848 000000015bed1750 0000000000000009=
=20
NIP [00007fffb4f0bd74] 0x7fffb4f0bd74
LR [00007fffb4e834c4] 0x7fffb4e834c4
--- interrupt: c00
Instruction dump:
48000014 3c62fe5f 386333e0 4bf228b1 60000000 7fe3fb78 4bff88c5 7c641b78=20
3c62fe5f 386333f8 4bf22895 60000000 <0fe00000> 38210090 39000001 3d22fd68=20
---[ end trace c4abf5aea4841297 ]---

Thanks
-Sachin

[1] https://lore.kernel.org/linuxppc-dev/f9e53405-b5b9-15d1-eaf9-0616a5b874=
24@csgroup.eu/T/


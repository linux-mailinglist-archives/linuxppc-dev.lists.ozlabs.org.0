Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E51B3F8A55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 16:43:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwQZn0R9kz3050
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 00:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9Bp386v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n9Bp386v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwQYz2199z2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 00:43:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17QEXpWq144849; Thu, 26 Aug 2021 10:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=pM3Vp/RMF+m5bPiP7jzhn+fl0aFW0IR3xodks46bCTA=;
 b=n9Bp386v7p7Q68yjUff6nsEo7+Jql+mQi3TaObXO0osdF7cCvYExrhlxS6BRLdsGhlKz
 CxQcd/4in6y/GL2MUS+x5+MeBZ26GhfMOc102ix/0W6FYHgT5Hwi7ng+aJrK15+7MFD9
 m2AoSMIxzAMTRIpDDXUCrRbr6Ekuf60B4j8b85BVMNt7o0P6SU6wGO5rR96Hj/1CnoYt
 BY+8S05w4zpg9JGdGLiE4bXX2jsINXu5ynPdE3Y5cdHY4z/27CrEApJvghriFeVBk3yB
 wap/ntAAQV7eZdM5H5hLPBkrCJCsdQiPs/j3vIPd0gF5pc/ksWOvfA/nVzJTp+2P2NEQ lQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3apcsdrbyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 10:42:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17QEgpXS013105;
 Thu, 26 Aug 2021 14:42:58 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3ajs4g3qhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 14:42:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17QEgvLb42336680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 14:42:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEC2B6A06B;
 Thu, 26 Aug 2021 14:42:56 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70D4B6A054;
 Thu, 26 Aug 2021 14:42:54 +0000 (GMT)
Received: from [9.43.43.241] (unknown [9.43.43.241])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Aug 2021 14:42:54 +0000 (GMT)
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: [next-20210820][ppc][nvme/raid] pci unbind WARNS at
 fs/kernfs/dir.c:1524 kernfs_remove_by_name_ns+
To: linux-next <linux-next@vger.kernel.org>
Message-ID: <063e6cf0-94ab-26f2-4fed-aebf1499127c@linux.vnet.ibm.com>
Date: Thu, 26 Aug 2021 20:11:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v6wptZ9oCHLjvDSCE2yAMK7zr5vhWcAn
X-Proofpoint-GUID: v6wptZ9oCHLjvDSCE2yAMK7zr5vhWcAn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-26_03:2021-08-26,
 2021-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=602 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108260085
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

Today's linux-next kernel WARN's while unbind of pci ssd flash device on 
my powerpc box

# lspci -nn
001d:80:00.0 Non-Volatile memory controller [0108]: Seagate Technology 
PLC Nytro Flash Storage [1bb1:0100]
001e:90:00.0 Non-Volatile memory controller [0108]: Seagate Technology 
PLC Nytro Flash Storage [1bb1:0100]

$ echo -n 001d:80:00.0 > /sys/bus/pci/drivers/nvme/unbind

md: md127: raid0 array has a missing/failed member
Buffer I/O error on dev md127, logical block 1498959, async page read
Buffer I/O error on dev md127, logical block 1498959, async page read
md127: detected capacity change from 191866880 to 0
md: md127 stopped.
------------[ cut here ]------------
kernfs: can not remove 'md127', no directory
WARNING: CPU: 21 PID: 11006 at fs/kernfs/dir.c:1524 
kernfs_remove_by_name_ns+0xc0/0x110

Modules linked in: dm_mod rpadlpar_io rpaphp kvm_pr kvm nf_tables 
libcrc32c nfnetlink tcp_diag udp_diag inet_diag unix_diag af_packet_diag 
netlink_diag bridge stp llc rfkill sg pseries_rng raid0 xts vmx_crypto 
uio_pdrv_genirq gf128mul uio nfsd auth_rpcgss nfs_acl lockd grace sunrpc 
binfmt_misc sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod ibmvscsi 
ibmvnic ibmveth scsi_transport_srp nvme nvme_core t10_piCPU: 21 PID: 
11006 Comm: mdadm Not tainted 5.14.0-rc6-next-20210820-autotest #1

NIP:  c00000000056dda0 LR: c00000000056dd9c CTR: 00000000007088ec
REGS: c000000004593680 TRAP: 0700   Not tainted 
(5.14.0-rc6-next-20210820-autotest)
MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48044224  
XER: 0000000d
CFAR: c000000000145f00 IRQMASK: 0
GPR00: c00000000056dd9c c000000004593920 c0000000019b3200 000000000000002c
GPR04: 00000000ffff7fff c0000000045935f0 0000000000000027 c00000077cd07e08
GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000000018694b0
GPR12: 0000000000004000 c00000001ec40680 00007fff84875040 ffffffffffffffff
GPR16: 0000000000000000 0000000000000001 0000000000000000 000001001e990280
GPR20: 0000000000000000 0000000000000000 0000000000000066 0000000000030d40
GPR24: c00000002bc591e8 0000000000000000 c00000002bc591c8 c000000025765c00
GPR28: c000000025765c70 c000000025765c00 0000000000000000 c000000025790640
NIP [c00000000056dda0] kernfs_remove_by_name_ns+0xc0/0x110
LR [c00000000056dd9c] kernfs_remove_by_name_ns+0xbc/0x110
Call Trace:
[c000000004593920] [c00000000056dd9c] 
kernfs_remove_by_name_ns+0xbc/0x110 (unreliable)
[c0000000045939b0] [c000000000572368] sysfs_remove_link+0x28/0x70
[c0000000045939d0] [c000000000678bd4] bd_unlink_disk_holder+0xc4/0x130
[c000000004593a10] [c00000000098e4e0] unbind_rdev_from_array+0x40/0x1b0
[c000000004593ac0] [c0000000009921e0] do_md_stop+0x410/0x5a0
[c000000004593bc0] [c0000000009966ac] md_ioctl+0xc6c/0x1c60
[c000000004593cd0] [c000000000654ebc] blkdev_ioctl+0x2fc/0x740
[c000000004593d40] [c0000000004ce284] block_ioctl+0x74/0x90
[c000000004593d60] [c00000000047b6e8] sys_ioctl+0xf8/0x150
[c000000004593db0] [c00000000002ff28] system_call_exception+0x158/0x2c0
[c000000004593e10] [c00000000000c764] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x7fff84790290
NIP:  00007fff84790290 LR: 000000013d5c2ef0 CTR: 0000000000000000
REGS: c000000004593e80 TRAP: 0c00   Not tainted 
(5.14.0-rc6-next-20210820-autotest)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 
28044288  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000036 00007fffd0148020 00007fff84877300 0000000000000003
GPR04: 0000000020000932 0000000000000000 0000000000030d40 00007fffd0148028
GPR08: 0000000000000003 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fff8494a780 00007fff84875040 ffffffffffffffff
GPR16: 0000000000000000 0000000000000001 0000000000000000 000001001e990280
GPR20: 0000000000000000 0000000000000000 0000000000000066 0000000000030d40
GPR24: 0000000020000932 000001001e992ac0 ffffffffffffffff 000001001e990a40
GPR28: ffffffffffffffff 0000000000000018 00007fffd0148100 0000000000000003
NIP [00007fff84790290] 0x7fff84790290
LR [000000013d5c2ef0] 0x13d5c2ef0
--- interrupt: c00
Instruction dump:
ebe10088 38210090 e8010010 ebc1fff0 7c0803a6 4e800020 60000000 60000000
3c62ff5c 3863d168 4bbd8109 60000000 <0fe00000> fba10078 fbe10088 60000000
---[ end trace 634fa04d6dac7dfd ]---

-- 
Regard's

Abdul Haleem
IBM Linux Technology Center


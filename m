Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA8F019
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 07:53:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tW0k1xVNzDqFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tVzR1xNyzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tVzQ58wHz8svv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:52:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tVzQ4pBLz9sB3; Tue, 30 Apr 2019 15:52:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tVzQ1wrtz9s9y
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 15:52:18 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U5lGoa106056
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 01:52:15 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s6fjvhxgx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 01:52:15 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Tue, 30 Apr 2019 06:52:13 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 06:52:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U5qAke57278494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 05:52:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B7CA4054;
 Tue, 30 Apr 2019 05:52:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19955A4067;
 Tue, 30 Apr 2019 05:52:10 +0000 (GMT)
Received: from [9.109.244.72] (unknown [9.109.244.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 05:52:09 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: powernv/subpage_prot: kernel NULL pointer dereference running kernel
 self tests (subpage_prot)
Date: Tue, 30 Apr 2019 11:22:08 +0530
To: linuxppc-dev@ozlabs.org
X-Mailer: Apple Mail (2.3445.104.8)
X-TM-AS-GCONF: 00
x-cbid: 19043005-0008-0000-0000-000002E1B30C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0009-0000-0000-0000224E1947
Message-Id: <D26F7C2F-AA9E-4B9E-AD52-AA38E18F2088@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300039
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
Cc: "Aneesh Kumar K. V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While running kselftests (subpage_prot) ran into following OOPS.=20
This is against linuxppc merge branch. Does not happen against mainline.
Same problem is seen with latest linux-next tree as well.

Following recent commits have modified the code in question.

ef629cc5bf0543eb57d6e344ba776880ac35fd00 :
    powerc/mm/hash: Reduce hash_mm_context size

60458fba469a695a026334b364cf8adbcd5807e3:=20
   powerpc/mm: Add helpers for accessing hash translation related =
variables


(47/47) avocado-misc-tests/kernel/kselftest.py:kselftest.test:  =
[17020.529615] BUG: Kernel NULL pointer dereference at 0x00001038
[17020.529639] Faulting instruction address: 0xc00000000008bdb4
[17020.529646] Oops: Kernel access of bad area, sig: 11 [#1]
[17020.529651] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP =
NR_CPUS=3D2048 NUMA PowerNV
[17020.529695] Dumping ftrace buffer:
[17020.529779]    (ftrace buffer empty)
[17020.529788] Modules linked in: iscsi_target_mod target_core_mod =
macsec tcp_diag udp_diag inet_diag unix_diag af_packet_diag netlink_diag =
binfmt_misc xt_CHECKSUM ipt_MASQUERADE tun ip6t_rpfilter ipt_REJECT =
nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink =
ebtable_nat ebtable_broute bridge stp llc ip6table_nat ip6table_mangle =
ip6table_security ip6table_raw iptable_nat nf_nat nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_security =
iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables =
iptable_filter kvm_hv kvm i2c_dev sunrpc dm_mirror dm_region_hash dm_log =
dm_mod ses enclosure scsi_transport_sas sg ibmpowernv ipmi_powernv =
leds_powernv ipmi_devintf uio_pdrv_genirq ipmi_msghandler uio opal_prd =
powernv_op_panel ip_tables ext4 mbcache jbd2 sd_mod ipr libata tg3 ptp =
pps_core [last unloaded: kretprobe_example]
[17020.529873] CPU: 138 PID: 17457 Comm: subpage_prot Tainted: G         =
  O      5.1.0-rc6-autotest-autotest #1
[17020.529880] NIP:  c00000000008bdb4 LR: c00000000000b688 CTR: =
c00000000008bd40
[17020.529886] REGS: c00020002c6b7aa0 TRAP: 0300   Tainted: G           =
O       (5.1.0-rc6-autotest-autotest)
[17020.529892] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: =
22000842  XER: 00000000
[17020.529901] CFAR: c00000000000b684 DAR: 0000000000001038 DSISR: =
40000000 IRQMASK: 0=20
[17020.529901] GPR00: c00000000000b688 c00020002c6b7d30 c0000000013b6600 =
0000000000000000=20
[17020.529901] GPR04: 0000000000000000 0000000000000000 0000000000000001 =
0000000000000008=20
[17020.529901] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
c000000000ab1058=20
[17020.529901] GPR12: c00000000008bd40 c0002007ff6e5900 0000000000000000 =
0000000000000000=20
[17020.529901] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[17020.529901] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
[17020.529901] GPR24: 0000000000000000 0000000000000000 0000000000000000 =
00007fff997afbb8=20
[17020.529901] GPR28: 00007fff997b0000 0000000010001f50 0000000010001350 =
c000200662c3ea00=20
[17020.529949] NIP [c00000000008bdb4] sys_subpage_prot+0x74/0x590
[17020.529955] LR [c00000000000b688] system_call+0x5c/0x70
[17020.529959] Call Trace:
[17020.529964] [c00020002c6b7d30] [c00020002c6b7d90] 0xc00020002c6b7d90 =
(unreliable)
[17020.529971] [c00020002c6b7e20] [c00000000000b688] =
system_call+0x5c/0x70
[17020.529976] Instruction dump:
[17020.529980] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f821ff11 =
e92d1178 f9210068=20
[17020.529987] 39200000 e92d0968 ebe90630 e93f03e8 <eb891038> 60000000 =
3860fffe e9410068=20
[17020.529997] ---[ end trace 90c07b8228c575ad ]=E2=80=94

Thanks
-Sachin=


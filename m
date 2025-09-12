Return-Path: <linuxppc-dev+bounces-12058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA93B541E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 07:21:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNN7y40zWz3cZ1;
	Fri, 12 Sep 2025 15:21:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757654494;
	cv=none; b=jcZ/20ygWMA4jVCyE5PzIwhpfHkf/aZMjRcxZOSSyuOtpJi5yTTK4Vq6B2VCREQzAhRWNkfYijLFC9nJgI70/4mRIQpjOsbExl5KxkmSBo1pbOQO78JuAzDHEySKxS3sMvCe7zrk/7z9omPtAF8fBwhjJ0iAN7rm6HlnyVdUArQiT7dXULDfy8nClExCrmdF7K0xnC+4j6ieVsb5OWcVAo6yLo01C081VdiIz6SXT8acCCFOlfwK9OMQHOAY3Zpwd7QF4n29fzLh4JuY8FO+zuVtbAloH08ujhciloZopeVKdam0Puo1smt55EISDC1OxFLJzdzA/wREWpjpkOfDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757654494; c=relaxed/relaxed;
	bh=FhmyoOXJewb5ZgfFyMM4Tek+tvEb/TnkFHCfsvnCN/g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=opWt6Rse/1RMF+gLbXvK4eV4411ybk/HWzdQ1opw29FGVyTdzL4xYVaNKJJ27tErUbpyGfq/eih/RGrX3lyytv3Fu8JTpDktBouZpUBKP/7goX71XwjFyf7rIvKajq+Dxcg/5b4loXGp1KNjPW393wzbzQEuQaMKjDHZzBv0tyYOxYCGiRRAyrkxDE5X57v8v0ii63Z6KrKsMqjx52ySNN4jWQZqXAiWLtWfxvUE1+XAJXSe+5tGr7l/hGH1EC1Qh0jqANHAlfDF/dQrnkW6UGZXmSACRSEXmy7+FiIOe4PwGO7nqRCsdqEz7WigiVLKI+M9fvfYb9jNiouPDtiJPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZfYcJzG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tZfYcJzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNN7x3nYDz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 15:21:33 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C3vd0F030119;
	Fri, 12 Sep 2025 05:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=FhmyoOXJewb5ZgfFyMM4Tek+tvEb
	/TnkFHCfsvnCN/g=; b=tZfYcJzGfJoKiCGJgjajt76BQJ0qHxWl4qvYNdOer+vy
	4X9YWn2yl5tFo27IaltZKE7ewF5Fqr6LqtE8J+4iJZelLJoSm+j/oPqE/vscLLK1
	EOb8QDKAqpcqYkwnhxSWJAWvXk7iAsfnzY/KGoYcA/fwpQW9IHmS7D1hyXUjbDBL
	C4snlVUUbgVCq+5fQu4wdT5x50GQZ2EvRN0q4qn6emmecIMT7KVNrtlmYWYpu9eU
	RjI+fk6yE2zFRthzWtDbWQdziF1mpo81ahtnHyPRdUn9iOSvBQd1q2w3rtdLaoHK
	PEobK0DxkSXjmF6LH8M6OigbRrttH+lPFniz7kFWqg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukewjny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:21:30 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58C4Y0JQ011447;
	Fri, 12 Sep 2025 05:21:29 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9usk75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:21:29 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58C5LSst60752372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 05:21:28 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95A8D5805D;
	Fri, 12 Sep 2025 05:21:28 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1287258058;
	Fri, 12 Sep 2025 05:21:22 +0000 (GMT)
Received: from [9.61.244.60] (unknown [9.61.244.60])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 05:21:20 +0000 (GMT)
Message-ID: <8957c526-d05c-4c0d-bfed-0eb6e6d2476c@linux.ibm.com>
Date: Fri, 12 Sep 2025 10:51:18 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-fsdevel@vger.kernel.org, riteshh@linux.ibm.com,
        ojaswin@linux.ibm.com, linux-xfs@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [linux-next20250911]Kernel OOPs while running generic/256 on Pmem
 device
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfX/u/o3cFuWy2j
 vkGcIOH5ti9KzriPR+gU31G8iE+7UZrNJE1ddlbqU8UxcSofd684kwbybdn304fvB317Jp8ym1e
 f98cFXhFQTsyUn3frufC5nms4RkEMQu4Rb7XJlrt6snfy5v20JHX+ii7zYMllNig6PiMOBEWicz
 avnYBeWfSB8j9DnbXj3aX7OmXSDxvcGSHprx5B0oV0nAfKyOnlyXSPw3BwMXrOngXX0hPEq9+Vo
 Tms1YvK8zMx0/n3g++Wb4z6jXKwxgRVlZbl45YACsE/JBsxX8oHUszdZlPF357vMf4c6LFcrW5z
 epigq2LNytqTTbTaHwLXLU8OzTWhAb5hOsJn4MoC+dIRJ72SNaCAhqxAjwVRtgXCyATeL9geL+L
 RH1AGvdU
X-Proofpoint-ORIG-GUID: _ZmsZFnLQlcGw0Yal2dPIWEcN6D6sXv4
X-Proofpoint-GUID: _ZmsZFnLQlcGw0Yal2dPIWEcN6D6sXv4
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68c3adda cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=izZR_8X7pELvyxFw3OwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!


IBM CI has reported a kernel crash, while running generic/256 test case 
on pmem device from xfstests suite on linux-next20250911 kernel.


xfstests: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

local.config:

[xfs_dax]
export RECREATE_TEST_DEV=true
export TEST_DEV=/dev/pmem0
export TEST_DIR=/mnt/test_pmem
export SCRATCH_DEV=/dev/pmem0.1
export SCRATCH_MNT=/mnt/scratch_pmem
export MKFS_OPTIONS="-m reflink=0 -b size=65536 -s size=512"
export FSTYP=xfs
export MOUNT_OPTIONS="-o dax"


Test case: generic/256


Traces:


[  163.371929] ------------[ cut here ]------------
[  163.371936] kernel BUG at lib/list_debug.c:29!
[  163.371946] Oops: Exception in kernel mode, sig: 5 [#1]
[  163.371954] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
[  163.371965] Modules linked in: xfs nft_fib_inet nft_fib_ipv4 
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack bonding tls 
nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink sunrpc 
pseries_rng vmx_crypto dax_pmem fuse ext4 crc16 mbcache jbd2 nd_pmem 
papr_scm sd_mod libnvdimm sg ibmvscsi ibmveth scsi_transport_srp pseries_wdt
[  163.372127] CPU: 22 UID: 0 PID: 130 Comm: kworker/22:0 Kdump: loaded 
Not tainted 6.17.0-rc5-next-20250911 #1 VOLUNTARY
[  163.372142] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
[  163.372155] Workqueue: cgroup_free css_free_rwork_fn
[  163.372169] NIP:  c000000000d051d4 LR: c000000000d051d0 CTR: 
0000000000000000
[  163.372176] REGS: c00000000ba079b0 TRAP: 0700   Not tainted 
(6.17.0-rc5-next-20250911)
[  163.372183] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  
CR: 28000000  XER: 00000006
[  163.372214] CFAR: c0000000002bae9c IRQMASK: 0
[  163.372214] GPR00: c000000000d051d0 c00000000ba07c50 c00000000230a600 
0000000000000075
[  163.372214] GPR04: 0000000000000004 0000000000000001 c000000000507e2c 
0000000000000001
[  163.372214] GPR08: c000000d0cb87d13 0000000000000000 0000000000000000 
a80e000000000000
[  163.372214] GPR12: c00e0001a1970fa2 c000000d0ddec700 c000000000208e58 
c000000107b5e190
[  163.372214] GPR16: c00000000d3e5d08 c00000000b71cf78 c00000000d3e5d05 
c00000000b71cf30
[  163.372214] GPR20: c00000000b71cf08 c00000000b71cf10 c000000019f58588 
c000000004704bc8
[  163.372214] GPR24: c000000107b5e100 c000000004704bd0 0000000000000003 
c000000004704bd0
[  163.372214] GPR28: c000000004704bc8 c000000019f585a8 c000000019f53da8 
c000000004704bc8
[  163.372315] NIP [c000000000d051d4] __list_add_valid_or_report+0x124/0x188
[  163.372326] LR [c000000000d051d0] __list_add_valid_or_report+0x120/0x188
[  163.372335] Call Trace:
[  163.372339] [c00000000ba07c50] [c000000000d051d0] 
__list_add_valid_or_report+0x120/0x188 (unreliable)
[  163.372352] [c00000000ba07ce0] [c000000000834280] 
mem_cgroup_css_free+0xa0/0x27c
[  163.372363] [c00000000ba07d50] [c0000000003ba198] 
css_free_rwork_fn+0xd0/0x59c
[  163.372374] [c00000000ba07da0] [c0000000001f5d60] 
process_one_work+0x41c/0x89c
[  163.372385] [c00000000ba07eb0] [c0000000001f76c0] 
worker_thread+0x558/0x848
[  163.372394] [c00000000ba07f80] [c000000000209038] kthread+0x1e8/0x230
[  163.372406] [c00000000ba07fe0] [c00000000000ded8] 
start_kernel_thread+0x14/0x18
[  163.372416] Code: 4b9b1099 60000000 7f63db78 4bae8245 60000000 
e8bf0008 3c62ff88 7fe6fb78 7fc4f378 38637d40 4b5b5c89 60000000 
<0fe00000> 60000000 60000000 7f83e378
[  163.372453] ---[ end trace 0000000000000000 ]---
[  163.380581] pstore: backend (nvram) writing error (-1)
[  163.380593]


If you happen to fix this issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.




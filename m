Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9691D6EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 06:17:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B9QVElmS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCCSV5RmCz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B9QVElmS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCCRp5jXVz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 14:17:09 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4613R8HM015925;
	Mon, 1 Jul 2024 04:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=M
	fus8T8Z1NrX/n9H3EaUvtu8IXz3YMR/Msv2Csoois8=; b=B9QVElmSOQ5uabXdS
	/jrqYhODtqTURW4QrsEhw1keNiSDO4E64g0GuOZl6pkYA44ggjc/u2xdCg0903Rn
	TuZydOxFPSiOC36vXWHLH86PvKhOw+mlyrI/46+BXj33Kl5kZDRi6an6EFTF2OMQ
	hk59rxWFsmm2MkXHdOccf7bjVRPlGzEn3IfoVSBCfIqZejT8LQNThVbhh3kdbmmW
	p1GHGkrjRmDkY0zakcZllM3bhFS+XVWsOMMOKTEHAW7uq4jAKKE8OaxZc6K7OmuJ
	SBLYkXjvJz30KAHmyi1bPLEb/0iQD4cHlb594BLzXfpqMYIq/m7gQrH/nv56ydjj
	sxolg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403grj0hfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:17:01 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4614H1Ow026483;
	Mon, 1 Jul 2024 04:17:01 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 403grj0hfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:17:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 461463VZ026465;
	Mon, 1 Jul 2024 04:17:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkpn8s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 04:17:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4614GuSF55902638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 04:16:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D513820043;
	Mon,  1 Jul 2024 04:16:56 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDD9920040;
	Mon,  1 Jul 2024 04:16:55 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 04:16:55 +0000 (GMT)
Message-ID: <fadac5d2-ab50-429e-a9ff-5ec99742c023@linux.ibm.com>
Date: Mon, 1 Jul 2024 09:46:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
To: Gautam Menghani <gautam@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20240625134047.298759-1-npiggin@gmail.com>
 <b2et5jeraufcie3ildki6ispdtqzt2y6n6mppsqesizwl2gogu@u7lbwsla6nde>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <b2et5jeraufcie3ildki6ispdtqzt2y6n6mppsqesizwl2gogu@u7lbwsla6nde>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6q_jslse4oS4W_KxksD6SjuDy5rZ5WsQ
X-Proofpoint-GUID: urjOA5W1WOpSfj7EOo0KZQ__J9uUtsII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_02,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=943 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010027
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/06/24 15:10, Gautam Menghani wrote:
> Without this patch, we had an issue where if we have some cpus disabled
> in the system and we try to do a 2 stage kexec as follows:
>
> kexec -l vmlinux ....
> kexec -e
>
> we would hit the following Oops
>
> [ 2598.923098] kernel BUG at arch/powerpc/kernel/exceptions-64s.S:501!
> [ 2598.923103] Oops: Exception in kernel mode, sig: 5 [#1]
> [ 2598.923107] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [ 2598.923111] Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc kvm_hv kvm bonding tls rfkill binfmt_misc tg3 vmx_crypto aes_gcm_p10_crypto ibmveth crct10dif_vpmsum pseries_rng nfsd auth_rpcgss nfs_acl lockd grace sunrpc fuse loop dm_multipath nfnetlink zram xfs ibmvscsi scsi_transport_srp crc32c_vpmsum pseries_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables
> [ 2598.923167] CPU: 11 PID: 1548 Comm: systemd-journal Not tainted 6.9.0+ #4
> [ 2598.923171] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
> [ 2598.923176] NIP:  c0000000000089e4 LR: 00007fffaa1427c4 CTR: c0000000000089b0
> [ 2598.923180] REGS: c0000008dfe7fd60 TRAP: 0700   Not tainted  (6.9.0+)
> [ 2598.923184] MSR:  8000000000021031 <SF,ME,IR,DR,LE>  CR: 28002413  XER: 00000000
> [ 2598.923192] CFAR: c0000000000089dc IRQMASK: 0
> [ 2598.923192] GPR00: 0000000000000003 00007ffff40fb110 0000000000000000 0000000000000009
> [ 2598.923192] GPR04: 00007ffff40fbcf0 0000000000002000 00007ffff40fdcc0 0000000000000000
> [ 2598.923192] GPR08: 00007fffaabc3b80 0000000048002413 00007ffff40fb3e0 0000000000017000
> [ 2598.923192] GPR12: 8000000000009003 c0000008dfff2b00 0000000000000000 0000000000000000
> [ 2598.923192] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [ 2598.923192] GPR20: 0000000000000000 0000000000000000 0000000000000000 00007fffaabaf448
> [ 2598.923192] GPR24: 000000011bc72700 00007ffff40fddf8 0000000132490ea0 00007ffff40fddf0
> [ 2598.923192] GPR28: 0000000000000000 00007ffff40fbcf0 0000000000002000 0000000000000009
> [ 2598.923238] NIP [c0000000000089e4] data_access_common_virt+0x14/0x220
> [ 2598.923245] LR [00007fffaa1427c4] 0x7fffaa1427c4
> [ 2598.923251] Call Trace:
> [ 2598.923253] Code: 2c0a0000 39400300 408242c0 e94d0020 694a0002 7d400164 60420000 718a4000 7c2a0b78 3821fd30 41c20008 e82d0910 <0981fd30> f9210160 f9610130 f9810138
> [ 2598.923269] ---[ end trace 0000000000000000 ]---
> [ 2598.926662] pstore: backend (nvram) writing error (-1)
>
>
> With this patch, the disabled cpus are woken up and kexec goes through
> fine.

Verified the same on LPAR and has similar observation as Guatam 
mentioned above.

Thanks for the fix Nick.

Tested-by: Sourabh Jain <sourabhjain@linux.ibm.com>

- Sourabh

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD00917CB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 11:41:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUZGZZsC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8GtW5N1Nz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 19:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUZGZZsC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8Gsn1wX2z30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 19:41:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q9TSCv020646
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 09:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pp1; bh=lT1TOYZEDvgSk7KOX/SwPWAFjVZ
	xa+xeca5g276aOMM=; b=jUZGZZsCUPOglk3gWcwv17vmeox4ild5agJc6qwN1BJ
	+4GTCpXp4h+cLhQQYI2HvN8Hpp9eLM8/6aOxx8kE3ZYsQI38AyeOyDOGduIl/PqO
	rKD+c/V3C1znNsfgaazrzj3boD8G5EZuTF1A6kDgQUNSnnUEqeFcJh/zjHXNuby9
	9pMs59lk1ZTNs5IiJrkKuPXc1WzNtApw5VLxOyOhrNpR7SVVrBOAD3Dm7cTTwIzz
	z1do19V0hP+Z9dGfMWNR/Slsyg9yo4AQYBeLS4gZ+iOwJaRwFcgESokFTL0+UUmX
	W1hRIEOET8qx/RZAyoXTrsrNzNqMUS7XJvtnm/vy3Gw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400gcsr0y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 09:40:57 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q9evki006581
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 09:40:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400gcsr0xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 09:40:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q7R7Ed000397;
	Wed, 26 Jun 2024 09:40:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn3b3fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 09:40:56 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q9epgq52101392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 09:40:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2EA472006A;
	Wed, 26 Jun 2024 09:40:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5287F2004D;
	Wed, 26 Jun 2024 09:40:50 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Jun 2024 09:40:50 +0000 (GMT)
Date: Wed, 26 Jun 2024 15:10:48 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
Message-ID: <b2et5jeraufcie3ildki6ispdtqzt2y6n6mppsqesizwl2gogu@u7lbwsla6nde>
References: <20240625134047.298759-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625134047.298759-1-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YzC-MZkPTVX7MtsBcgKOCzXtIlI6i2UX
X-Proofpoint-ORIG-GUID: lulvzd9Mo-2SHP8E75lJ1LrFTtceESOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxlogscore=554 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260071
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
Cc: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Without this patch, we had an issue where if we have some cpus disabled
in the system and we try to do a 2 stage kexec as follows:

kexec -l vmlinux ....
kexec -e

we would hit the following Oops

[ 2598.923098] kernel BUG at arch/powerpc/kernel/exceptions-64s.S:501!
[ 2598.923103] Oops: Exception in kernel mode, sig: 5 [#1]
[ 2598.923107] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[ 2598.923111] Modules linked in: rpcrdma rdma_cm iw_cm ib_cm ib_core xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc kvm_hv kvm bonding tls rfkill binfmt_misc tg3 vmx_crypto aes_gcm_p10_crypto ibmveth crct10dif_vpmsum pseries_rng nfsd auth_rpcgss nfs_acl lockd grace sunrpc fuse loop dm_multipath nfnetlink zram xfs ibmvscsi scsi_transport_srp crc32c_vpmsum pseries_wdt scsi_dh_rdac scsi_dh_emc scsi_dh_alua ip6_tables ip_tables
[ 2598.923167] CPU: 11 PID: 1548 Comm: systemd-journal Not tainted 6.9.0+ #4
[ 2598.923171] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
[ 2598.923176] NIP:  c0000000000089e4 LR: 00007fffaa1427c4 CTR: c0000000000089b0
[ 2598.923180] REGS: c0000008dfe7fd60 TRAP: 0700   Not tainted  (6.9.0+)
[ 2598.923184] MSR:  8000000000021031 <SF,ME,IR,DR,LE>  CR: 28002413  XER: 00000000
[ 2598.923192] CFAR: c0000000000089dc IRQMASK: 0
[ 2598.923192] GPR00: 0000000000000003 00007ffff40fb110 0000000000000000 0000000000000009
[ 2598.923192] GPR04: 00007ffff40fbcf0 0000000000002000 00007ffff40fdcc0 0000000000000000
[ 2598.923192] GPR08: 00007fffaabc3b80 0000000048002413 00007ffff40fb3e0 0000000000017000
[ 2598.923192] GPR12: 8000000000009003 c0000008dfff2b00 0000000000000000 0000000000000000
[ 2598.923192] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[ 2598.923192] GPR20: 0000000000000000 0000000000000000 0000000000000000 00007fffaabaf448
[ 2598.923192] GPR24: 000000011bc72700 00007ffff40fddf8 0000000132490ea0 00007ffff40fddf0
[ 2598.923192] GPR28: 0000000000000000 00007ffff40fbcf0 0000000000002000 0000000000000009
[ 2598.923238] NIP [c0000000000089e4] data_access_common_virt+0x14/0x220
[ 2598.923245] LR [00007fffaa1427c4] 0x7fffaa1427c4
[ 2598.923251] Call Trace:
[ 2598.923253] Code: 2c0a0000 39400300 408242c0 e94d0020 694a0002 7d400164 60420000 718a4000 7c2a0b78 3821fd30 41c20008 e82d0910 <0981fd30> f9210160 f9610130 f9810138
[ 2598.923269] ---[ end trace 0000000000000000 ]---
[ 2598.926662] pstore: backend (nvram) writing error (-1)


With this patch, the disabled cpus are woken up and kexec goes through
fine.

Tested-by: Gautam Menghani <gautam@linux.ibm.com>

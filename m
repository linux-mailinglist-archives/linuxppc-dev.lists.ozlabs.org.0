Return-Path: <linuxppc-dev+bounces-7113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9679A647F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:46:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVV00t7vz2ygf;
	Mon, 17 Mar 2025 20:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742204776;
	cv=none; b=LO/VcEidKkYNuDlIqWC6puWCN7v5WyUGV+cMSmJ2HP9cLzMOkLdp6CaeUCZz4ArDMhFepCNChlAkfH6qeQaxHi7QD3fl2jHLx7EK10Wd1YG7YQXmh3KUU0nU2XEFS3gXmHaBBCRJVeSRXdr0jzI9CxlXPcLFkb0G2vTROlJhaTj7ysL/b5nYuRvg7losI1dGflGSpPkpE8kSjQdtprhEJ15LctQ5C8K1D3rQf/gIvdtojbvs2MmV7MCKE+192vAJKXOLgJBdzYkLt72OvLJTB6+86SI15vmndS3jHZa+fOloEdEEGfTEM3kZK2EW2SBvk9oSVfrdPHo6JcLvScmY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742204776; c=relaxed/relaxed;
	bh=a3Z920sjslTYtQWbVmfCMmUEmBhePId9iuSjdY0LKVQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=hv5EQOr1JdlzJLj7sAirVsb1E9Ep8c1TpvOu0azu/aVi6Js3Xd3lmRHux6uXK3EWpvBy9HTKi2SfGORt6trcMy9FZsyGa8JWupd9sT7R+bHNkVdXTPRH9fE7u90CFfEgl2nIRhWwFzGu6f4iKpwVyGICdqCbE3KofVa2dikYGiX99huYMjkqr2mcmmaGd+CsJjB8MrrDiqm1xPxih5AQ54eQI5LC8fB2GNN2lzQmeMW1OiKXKzPFJpPQ+VHJzZRhGdvwDeUZPogfI3byVF/DMIJiVKgJJEtX/qvR7xNkDbBiLyTTPy0TkW/Ju0ZxRlNOgpdH0hQWJQPkDaQtY9T6Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c0r/QLuv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c0r/QLuv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGVTz04spz2ygK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:46:14 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H8mi8r003235;
	Mon, 17 Mar 2025 09:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=a3Z920sjslTYtQWbVmfCMmUEmBhe
	PId9iuSjdY0LKVQ=; b=c0r/QLuvm6OAK48K0hOwnrOyrjxyHinC4s1zzFa74uzt
	dBB2N8URq112ioubkIkBzUlN8hOsc5ZjHR3WjdvsaIQ6cIzg4hC1+WJ2JENNjOHq
	o4ileiaQ1IYpMTctfjpgoPTtBmvoEGsJmMGPUEpvrG3DKl9aLIcrMik7932JDLnP
	yQc4dMga41maWnYYSybz1rtSqSbOfO18cKuJN0W4eZayhGv8ssRtVNJyIGmU0bZo
	vbhLCbcYTbuJgxgLVWtTsgmP/nxRmfrTmkAwVTBjMdExX6vwnKUKKcLWD6VUAM4r
	6EvPnf1KxpYeNA0AnWevFLvcyiVBIbjQfk7RZKMdWQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45e5v02h4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 09:46:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H88lAN032356;
	Mon, 17 Mar 2025 09:46:05 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvt5p14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 09:46:05 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52H9k2Ys29295176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 09:46:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 350B45805D;
	Mon, 17 Mar 2025 09:46:04 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72C9C58057;
	Mon, 17 Mar 2025 09:46:02 +0000 (GMT)
Received: from [9.61.253.6] (unknown [9.61.253.6])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Mar 2025 09:46:02 +0000 (GMT)
Message-ID: <5f88a95b-1c8d-4a74-9753-9cdb2e64daf4@linux.ibm.com>
Date: Mon, 17 Mar 2025 15:16:00 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [main-line][PowerPC]selftests/powerpc/signal: sigfuz fails
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yB8YfxfjreZhljaWCgqy_Ulnka7mvHf6
X-Proofpoint-GUID: yB8YfxfjreZhljaWCgqy_Ulnka7mvHf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_03,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503170069
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!

I am observing selftests/powerpc/signal:sigfuz test fails on linux 
mainline repo on IBM Power10 systems.

The test passes on the kernel with commit head: 
619f0b6fad524f08d493a98d55bac9ab8895e3a6 and fails on the kernel with 
commit head: ce69b4019001407f9cd738dd2ba217b3a8ab831b on the main line.


Repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

I tried to do git bisect and the bisect tool pointed first bad commit 
to: 16ebb6f5b6295c9688749862a39a4889c56227f8.

But upon reverting the first bad commit issue is still seen. So please 
ignore, if the bisection dosent help.


Error:

# selftests: powerpc/signal: sigfuz
# test: signal_fuzzer
# tags: git_version:v6.14-rc7-1-g49c747976afa
# !! killing signal_fuzzer
# !! child died by signal 15
# failure: signal_fuzzer
not ok 3 selftests: powerpc/signal: sigfuz # exit=1


Bisect log:

git bisect start
# status: waiting for both good and bad commits
# good: [619f0b6fad524f08d493a98d55bac9ab8895e3a6] Merge tag 
'seccomp-v6.13-rc8' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux
git bisect good 619f0b6fad524f08d493a98d55bac9ab8895e3a6
# status: waiting for bad commit, 1 good commit known
# bad: [ce69b4019001407f9cd738dd2ba217b3a8ab831b] Merge tag 
'net-6.13-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
git bisect bad ce69b4019001407f9cd738dd2ba217b3a8ab831b
# good: [f62bb88782ffc2d8b619ac781ca26582b00c4db6] Merge branch '100GbE' 
of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue
git bisect good f62bb88782ffc2d8b619ac781ca26582b00c4db6
# bad: [2c3688090f8a1f085230aa839cc63e4a7b977df0] net/mlx5e: Fix 
inversion dependency warning while enabling IPsec tunnel
git bisect bad 2c3688090f8a1f085230aa839cc63e4a7b977df0
# bad: [d6e3316a1680305da291a5b5deaf424559aaf06c] net: pcs: xpcs: 
actively unset DW_VR_MII_DIG_CTRL1_2G5_EN for 1G SGMII
git bisect bad d6e3316a1680305da291a5b5deaf424559aaf06c
# bad: [f0d0277796db613c124206544b6dbe95b520ab6c] net: netpoll: ensure 
skb_pool list is always initialized
git bisect bad f0d0277796db613c124206544b6dbe95b520ab6c
# bad: [c17ff476f53afb30f90bb3c2af77de069c81a622] net: xilinx: axienet: 
Fix IRQ coalescing packet count overflow
git bisect bad c17ff476f53afb30f90bb3c2af77de069c81a622
# bad: [16ebb6f5b6295c9688749862a39a4889c56227f8] nfp: bpf: prevent 
integer overflow in nfp_bpf_event_output()
git bisect bad 16ebb6f5b6295c9688749862a39a4889c56227f8
# first bad commit: [16ebb6f5b6295c9688749862a39a4889c56227f8] nfp: bpf: 
prevent integer overflow in nfp_bpf_event_output()


If you happen to fix the issue, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



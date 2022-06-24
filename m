Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB85955A517
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 01:52:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVDSh4b28z3cFY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 09:52:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IQVcBgOf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IQVcBgOf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVDRs5ZnTz3bs4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 09:51:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OMUALD015703;
	Fri, 24 Jun 2022 23:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=l1owu+QJK7QDB/LMpGuaR7ZzvRgW4C27GWY2msSc/VI=;
 b=IQVcBgOfMrMFTlt4lDe6P0So1sFd6MCLAfRr8CQvP2QQh1SeElXKf+DZwwPaJCLkIrKN
 6mc2UrlAKsf4VLNvyIhlFxDaxCiAnd0J5XG1RyGTxzBXM3yu+qpdzsrZSNL7mnMPCHwS
 UyBYUZ6Ey5QpTeSdDemXMsRnkilXOUqeYnt107hhlnH/cKLd8+yLj9UV7hkdZ5mwoo9h
 4NQ3zxv+/fHneCRCfeu7CraCxM3jo79t+1zdbOULB7HCLc61WC6tY4sYY1vUFT604wBg
 GVnHoogwIsg/QZ8r4uz9C6Qd3Kq6QIHg0VCGZy0A3ykJeUbHFZNEVumjfXmsRWFWNkg5 Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwp491hev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 23:51:48 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25ONj9Ei015840;
	Fri, 24 Jun 2022 23:51:48 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwp491hej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 23:51:48 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ONa7MN015558;
	Fri, 24 Jun 2022 23:51:47 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma02dal.us.ibm.com with ESMTP id 3gt00a6pb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 23:51:47 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ONpks039780770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 23:51:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A034AAE060;
	Fri, 24 Jun 2022 23:51:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C304AE05C;
	Fri, 24 Jun 2022 23:51:46 +0000 (GMT)
Received: from localhost (unknown [9.211.152.104])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jun 2022 23:51:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Liam Howlett <liam.howlett@oracle.com>
Subject: Re: power9 slab-out-of-bounds in _find_First_zero_bit
In-Reply-To: <20220624210400.gic4akzlwwdqkxym@revolver>
References: <20220624210400.gic4akzlwwdqkxym@revolver>
Date: Fri, 24 Jun 2022 18:51:45 -0500
Message-ID: <87pmixmxgu.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vsW7K57hDmU6khpOyfcmUpPbqW_7lu3f
X-Proofpoint-ORIG-GUID: 1nv4zAIvaBtnlZLbIKxySDWgV47WG5VP
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_10,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=979 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240090
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Liam,

Liam Howlett <liam.howlett@oracle.com> writes:
>
> When trying v5.19-rc3 on my ppc64 VM with KASANs enabled, I get the
> following on boot:
>
> [    0.174621] ==================================================================
> [    0.175501] BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/0x140
> [    0.176132] Read of size 8 at addr c00000000f7f0410 by task swapper/0/1
> [    0.176900] 
> [    0.177844] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.19.0-rc3+ #8
> [    0.179461] Call Trace:
> [    0.179907] [c0000000119677d0] [c0000000075af350] dump_stack_lvl+0x74/0xa8 (unreliable)
> [    0.181107] [c000000011967810] [c000000000632220] print_report+0x330/0x740
> [    0.181977] [c0000000119678e0] [c000000000632980] kasan_report+0x100/0x1f0
> [    0.182788] [c0000000119679c0] [c000000000634de4] __asan_load8+0xa4/0xe0
> [    0.183560] [c0000000119679e0] [c0000000018b92b0] _find_first_zero_bit+0x40/0x140
> [    0.184119] [c000000011967a20] [c0000000000c5f7c] xive_spapr_get_ipi+0xcc/0x220
> [    0.184689] [c000000011967ad0] [c0000000000c1adc] xive_setup_cpu_ipi+0x1ec/0x420
> [    0.185231] [c000000011967b90] [c00000000a033b3c] pSeries_smp_probe+0x44/0xd4
> [    0.185825] [c000000011967bc0] [c00000000a01c77c] smp_prepare_cpus+0x62c/0x688
> [    0.186359] [c000000011967cb0] [c00000000a00ea94] kernel_init_freeable+0x24c/0x520
> [    0.186893] [c000000011967d90] [c000000000012b00] kernel_init+0x30/0x1c0
> [    0.187395] [c000000011967e10] [c00000000000ce54] ret_from_kernel_thread+0x5c/0x64

[...]

Please try "powerpc/xive/spapr: correct bitmap allocation size", posted yesterday:

https://lore.kernel.org/linuxppc-dev/20220623182509.3985625-1-nathanl@linux.ibm.com/

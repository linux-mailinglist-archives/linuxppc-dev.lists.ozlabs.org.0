Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17AA493529
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 07:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdx7f31Jlz3bZG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 17:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N/SOVwLX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N/SOVwLX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdx6s5Bktz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 17:48:20 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20J4Rh0H011571; 
 Wed, 19 Jan 2022 06:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1pXc8wu1kGznTiSZBb8qJ0lFSPxRf+qPmi/aFA16Ue4=;
 b=N/SOVwLXu5f9N500JZbgYMi92msNmOREUcLVJPWFr3FmHpLEttiJoIdigC/kukB4GNg/
 xzFQDDlN5Nz0G1vgdBe9IQ+dT1MPRteEIufsGmOKcJD3f17B55n/zNrvAag3Sn1F4zzc
 amoQk18N8ytjLyilaYbnyx78uzTaOsDV55sKjhEcVf2D5TvgVIax2piGIbEAokVDZdxi
 e7r1Z71A/ss7vlNdRLjCDYTDgtoXf88S4IlY9QHqPX/xIiKK0EfzEVPETUKWM8YNHfhQ
 EATIX7kY6O8BrxNvnBclAA8bh9MHAwFhZ6P3IWF7qFMfpTIeb8E1d9rW8bQbwde3iYSt 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpbmwj6sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 06:48:09 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20J5b5aO008742;
 Wed, 19 Jan 2022 06:48:09 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpbmwj6rs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 06:48:09 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20J6h36A011702;
 Wed, 19 Jan 2022 06:48:06 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3dknwah2rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 06:48:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20J6m1b227853202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 06:48:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B04811C052;
 Wed, 19 Jan 2022 06:48:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 643E611C04C;
 Wed, 19 Jan 2022 06:47:57 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.74.187])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Jan 2022 06:47:56 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] powerpc/perf: Fix power_pmu_disable to call
 clear_pmi_irq_pending only if PMI is pending
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1642566179.l0008zwdzw.astroid@bobo.none>
Date: Wed, 19 Jan 2022 12:17:52 +0530
Message-Id: <81D2A9B5-81E8-456A-8844-CC48E747A586@linux.vnet.ibm.com>
References: <20220115072020.93524-1-atrajeev@linux.vnet.ibm.com>
 <1642566179.l0008zwdzw.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z03z12Bn2BXi76vwyhQLP0I0Sa4oNfNh
X-Proofpoint-ORIG-GUID: 3Y8hgxrBZtu8ATEmBAA4wU7ZyRo958nL
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190034
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com, kajoljain <kjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 19-Jan-2022, at 9:54 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of January 15, 2022 5:20 pm:
>> Running selftest with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG enabled in kernel
>> triggered below warning:
>>=20
>> [  172.851380] ------------[ cut here ]------------
>> [  172.851391] WARNING: CPU: 8 PID: 2901 at arch/powerpc/include/asm/hw_=
irq.h:246 power_pmu_disable+0x270/0x280
>> [  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_=
defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc xfs lib=
crc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_table=
s ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fu=
se
>> [  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted 5.16.0=
-rc5-03218-g798527287598 #2
>> [  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: c0000000=
0013b180
>> [  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  (5.16.0-=
rc5-03218-g798527287598)
>> [  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 480048=
84  XER: 20040000
>> [  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1
>> [  172.851482] GPR00: c00000000013d5a4 c000000017687b00 c000000002a10600=
 0000000000000004
>> [  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 0000000000000000=
 00000008b7ed0000
>> [  172.851482] GPR08: 00000000446194f6 0000000000008000 c00000000013b118=
 c000000000d58e68
>> [  172.851482] GPR12: c00000000013d390 c00000001ec54a80 0000000000000000=
 0000000000000000
>> [  172.851482] GPR16: 0000000000000000 0000000000000000 c000000015d5c708=
 c0000000025396d0
>> [  172.851482] GPR20: 0000000000000000 0000000000000000 c00000000a3bbf40=
 0000000000000003
>> [  172.851482] GPR24: 0000000000000000 c0000008ba097400 c0000000161e0d00=
 c00000000a3bb600
>> [  172.851482] GPR28: c000000015d5c700 0000000000000001 0000000082384090=
 c0000008ba0020d8
>> [  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
>> [  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
>> [  172.851565] Call Trace:
>> [  172.851568] [c000000017687b00] [c00000000013d5a4] power_pmu_disable+0=
x214/0x280 (unreliable)
>> [  172.851579] [c000000017687b40] [c0000000003403ac] perf_pmu_disable+0x=
4c/0x60
>> [  172.851588] [c000000017687b60] [c0000000003445e4] __perf_event_task_s=
ched_out+0x1d4/0x660
>> [  172.851596] [c000000017687c50] [c000000000d1175c] __schedule+0xbcc/0x=
12a0
>> [  172.851602] [c000000017687d60] [c000000000d11ea8] schedule+0x78/0x140
>> [  172.851608] [c000000017687d90] [c0000000001a8080] sys_sched_yield+0x2=
0/0x40
>> [  172.851615] [c000000017687db0] [c0000000000334dc] system_call_excepti=
on+0x18c/0x380
>> [  172.851622] [c000000017687e10] [c00000000000c74c] system_call_common+=
0xec/0x268
>>=20
>> The warning indicates that MSR_EE being set(interrupt enabled) when
>> there was an overflown PMC detected. This could happen in
>> power_pmu_disable since it runs under interrupt soft disable
>> condition ( local_irq_save ) and not with interrupts hard disabled.
>> commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
>> pending PMI before resetting an overflown PMC") intended to clear
>> PMI pending bit in Paca when disabling the PMU. It could happen
>> that PMC gets overflown while code is in power_pmu_disable
>> callback function. Hence add a check to see if PMI pending bit
>> is set in Paca before clearing it via clear_pmi_pending.
>>=20
>> Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending P=
MI before resetting an overflown PMC")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
>> ---
>> Note: Address the warning reported here:
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/238190.html
>> Patch is on top of powerpc/merge
>>=20
>> arch/powerpc/perf/core-book3s.c | 7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-bo=
ok3s.c
>> index a684901b6965..dfb0ea0f0df3 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1327,9 +1327,10 @@ static void power_pmu_disable(struct pmu *pmu)
>> 		 * Otherwise provide a warning if there is PMI pending, but
>> 		 * no counter is found overflown.
>> 		 */
>> -		if (any_pmc_overflown(cpuhw))
>> -			clear_pmi_irq_pending();
>> -		else
>> +		if (any_pmc_overflown(cpuhw)) {
>> +			if (pmi_irq_pending())
>> +				clear_pmi_irq_pending();
>=20
> And this works because MSR[EE] gets disabled by the masked interrupt=20
> handler if we have a PMI irq pending, is that right?
>=20
> Can I be a pain and just ask for a little comment there otherwise I'll
> forget about it next time.

Hi Nick,

Thanks for the review. Yes that=E2=80=99s right, if there is a PMI pending,=
 MSR[EE] will be disabled by the handler.
I will add that in comment.

Thanks
Athira
>=20
> Thanks,
> Nick
>=20
>> +		} else
>> 			WARN_ON(pmi_irq_pending());
>>=20
>> 		val =3D mmcra =3D cpuhw->mmcr.mmcra;
>> --=20
>> 2.33.0


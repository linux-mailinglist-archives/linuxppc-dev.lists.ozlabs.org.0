Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A82195BE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 03:55:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2K59684vzDqtl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 11:55:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2K3T47gBzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 11:54:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0691WCSh019825; Wed, 8 Jul 2020 21:54:07 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325mpbqe41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 21:54:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0691p3KU019035;
 Thu, 9 Jul 2020 01:54:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 325mdhg7x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 01:54:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0691s2JB62914946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 01:54:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CE8A4C046;
 Thu,  9 Jul 2020 01:54:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D034C044;
 Thu,  9 Jul 2020 01:54:01 +0000 (GMT)
Received: from [9.79.221.246] (unknown [9.79.221.246])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 01:54:00 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 01/10] powerpc/perf: Add support for ISA3.1 PMU SPRs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <874kqi46cg.fsf@mpe.ellerman.id.au>
Date: Thu, 9 Jul 2020 07:23:58 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF000FF6-EF09-4299-A4AD-EF76277A6EF4@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <874kqi46cg.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007090005
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
Cc: Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 08-Jul-2020, at 4:32 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> ...
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index cd6a742..5c64bd3 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -39,10 +39,10 @@ struct cpu_hw_events {
>> 	unsigned int flags[MAX_HWEVENTS];
>> 	/*
>> 	 * The order of the MMCR array is:
>> -	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2
>> +	 *  - 64-bit, MMCR0, MMCR1, MMCRA, MMCR2, MMCR3
>> 	 *  - 32-bit, MMCR0, MMCR1, MMCR2
>> 	 */
>> -	unsigned long mmcr[4];
>> +	unsigned long mmcr[5];
>> 	struct perf_event *limited_counter[MAX_LIMITED_HWCOUNTERS];
>> 	u8  limited_hwidx[MAX_LIMITED_HWCOUNTERS];
>> 	u64 alternatives[MAX_HWEVENTS][MAX_EVENT_ALTERNATIVES];
> ...
>> @@ -1310,6 +1326,10 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	if (!cpuhw->n_added) {
>> 		mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & =
~MMCRA_SAMPLE_ENABLE);
>> 		mtspr(SPRN_MMCR1, cpuhw->mmcr[1]);
>> +#ifdef CONFIG_PPC64
>> +		if (ppmu->flags & PPMU_ARCH_310S)
>> +			mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
>> +#endif /* CONFIG_PPC64 */
>> 		goto out_enable;
>> 	}
>>=20
>> @@ -1353,6 +1373,11 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	if (ppmu->flags & PPMU_ARCH_207S)
>> 		mtspr(SPRN_MMCR2, cpuhw->mmcr[3]);
>>=20
>> +#ifdef CONFIG_PPC64
>> +	if (ppmu->flags & PPMU_ARCH_310S)
>> +		mtspr(SPRN_MMCR3, cpuhw->mmcr[4]);
>> +#endif /* CONFIG_PPC64 */
>=20
> I don't think you need the #ifdef CONFIG_PPC64?

Hi Michael

Thanks for reviewing this series.

SPRN_MMCR3 is not defined for PPC32 and we hit build failure for =
pmac32_defconfig.
The #ifdef CONFIG_PPC64 is to address this.

Thanks
Athira


>=20
> cheers


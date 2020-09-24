Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C673127668F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 04:41:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxfSq5tHvzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 12:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XV9NKNO1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxfR83D4HzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 12:40:18 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O25OxN008884
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 22:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=hyQLRizQ0W/0MifZTitqhI0W7E2sFfUDiKJshhDlkgo=;
 b=XV9NKNO1y+fHVMsUyste8WWiDgq6wO0VGCVbIcpmwOUT0TIyE909UMFqB+hJ1FvDmIz6
 6mlcLCLfjumaVd6+pFPjqfaHGiAZbEb6MI5WCqH7X429pPWQsSkwFTzqiRL6cux+m1Bn
 1b/X1uWvXLmx6n84AYj+nfKnXFn8YiOJhlEAdL6c21cnKd0IsBW9VfpcRDUXw1mOtCzC
 2fpR02LBF/wITeHSTw+vAD3qY9byxY0TFfQQ+AF2shtbiRGX7HMG0CcIuEMDebWtptK6
 ok017YVD26IHo4iAWWEJqVhH4PLPLP8mIb7hFOgI7bMxDCJTwquEB9DKrpjMCS0XTylF Ww== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rhn0hey5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 22:40:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O2cwA3020586
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 02:40:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 33n9m7tfbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 02:40:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08O2ca3e24248772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 02:38:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1568EA4040;
 Thu, 24 Sep 2020 02:40:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CE35A4051;
 Thu, 24 Sep 2020 02:40:11 +0000 (GMT)
Received: from [9.77.196.90] (unknown [9.77.196.90])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Sep 2020 02:40:10 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V2] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU
 group constraints
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200922104656.GA664163@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Date: Thu, 24 Sep 2020 08:10:08 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D9F8E55-2283-49F7-A050-E430A600FEC3@linux.vnet.ibm.com>
References: <1600672204-1610-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200922104656.GA664163@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
To: "Paul A. Clarke" <pc@us.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_19:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240009
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22-Sep-2020, at 4:16 PM, Paul A. Clarke <pc@us.ibm.com> wrote:
>=20
> Just one nit in a comment below...
> (and this is not worthy of tags like "reviewed-by" ;-)
>=20
> On Mon, Sep 21, 2020 at 03:10:04AM -0400, Athira Rajeev wrote:
>> PMU counter support functions enforces event constraints for group of
>> events to check if all events in a group can be monitored. Incase of
>> event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
>> not all constraints are applicable, say the threshold or sample bits.
>> But current code includes pmc5 and pmc6 in some group constraints =
(like
>> IC_DC Qualifier bits) which is actually not applicable and hence =
results
>> in those events not getting counted when scheduled along with group =
of
>> other events. Patch fixes this by excluding PMC5/6 from constraints
>> which are not relevant for it.
>>=20
>> Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>=20
>> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
>> index 964437a..12153da 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -288,6 +288,15 @@ int isa207_get_constraint(u64 event, unsigned =
long *maskp, unsigned long *valp)
>>=20
>> 		mask  |=3D CNST_PMC_MASK(pmc);
>> 		value |=3D CNST_PMC_VAL(pmc);
>> +
>> +		/*
>> +		 * PMC5 and PMC6 are used to count cycles and =
instructions
>> +		 * and these doesnot support most of the constraint =
bits.
>=20
> s/doesnot/do not/

Hi Paul,

Thanks for checking the patch and sharing the comment.=20

Athira
>=20
>> +		 * Add a check to exclude PMC5/6 from most of the =
constraints
>> +		 * except for ebb/bhrb.
>> +		 */
>> +		if (pmc >=3D 5)
>> +			goto ebb_bhrb;
>=20
> PC


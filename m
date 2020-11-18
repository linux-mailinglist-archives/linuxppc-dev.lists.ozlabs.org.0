Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B22B75AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:23:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbWRl3pvBzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 16:23:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j0/9PMER; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbWPd536SzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 16:21:25 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AI54vqW108208; Wed, 18 Nov 2020 00:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=PLIUfrlogZK2PS/+yKPL9oN6KPxcoByWHoNuyZQGfbs=;
 b=j0/9PMERhOZHzo/aoQYP97nVAogqleoLzT0uikI6mZjMCqOxLw/bxog28BMHc1TNKxLG
 GCWP3sSYmcU7WPTyguIrsj2HwCAIWkFNtAJe0dwDLEbYaV3jYRnEE9lVEi9c3ToDIssB
 6ehtXwPHm1KvEXnfMoKOIt3X/A8mZEVBE94oZvN66JmGM1ul6tGi2gotWJ044FA/XfCX
 LCNI+p5JvFUgdhriTfIy+rBSgdSnWPBWHMoDbtmaQdwn8EWN7GiXIJddo7rLqSOq+f88
 zTSg33isL741m6D9Sep7Dno6EKbCcUWZTIpLL/A5whilK2xyI6Fw5PQ81fXhPlefyTwB dw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vw2q0d0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 00:21:18 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AI5CRwW031703;
 Wed, 18 Nov 2020 05:21:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 34t6v81xr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Nov 2020 05:21:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AI5LE629634416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 05:21:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36356A404D;
 Wed, 18 Nov 2020 05:21:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D572CA4055;
 Wed, 18 Nov 2020 05:21:12 +0000 (GMT)
Received: from [9.79.237.153] (unknown [9.79.237.153])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Nov 2020 05:21:12 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 2/4] powerpc/perf: Update the PMU group constraints for
 l2l3 and threshold events in power10
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <878saz2sl7.fsf@mpe.ellerman.id.au>
Date: Wed, 18 Nov 2020 10:51:10 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E4CABE5-C378-419B-A5A5-C99326128BF8@linux.vnet.ibm.com>
References: <1605069189-2740-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1605069189-2740-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <878saz2sl7.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-18_01:2020-11-17,
 2020-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180030
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
Cc: Michael Neuling <mikey@neuling.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 18-Nov-2020, at 10:02 AM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> In Power9, L2/L3 bus events are always available as a
>> "bank" of 4 events. To obtain the counts for any of the
>> l2/l3 bus events in a given bank, the user will have to
>> program PMC4 with corresponding l2/l3 bus event for that
>> bank.
>>=20
>> Commit 59029136d750 ("powerpc/perf: Add constraints for power9 l2/l3 =
bus events")
>> enforced this rule in Power9. But this is not valid for
>> Power10, since in Power10 Monitor Mode Control Register2
>> (MMCR2) has bits to configure l2/l3 event bits. Hence remove
>> this PMC4 constraint check from power10.
>>=20
>> Since the l2/l3 bits in MMCR2 are not per-pmc, patch handles
>> group constrints checks for l2/l3 bits in MMCR2.
>=20
>> Patch also updates constraints for threshold events in power10.
>=20
> That should be done in a separate patch please.

Thanks mpe for checking the patch set.
=20
Sure,=20
I will make threshold constraint changes as a separate patch and send =
next version


>=20
> cheers


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8509234A4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 19:36:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJDwP2r6hzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 03:36:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJDtG4VznzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Aug 2020 03:34:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VH2GDD088045; Fri, 31 Jul 2020 13:34:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mnxvb8e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:34:25 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06VHGABo130819;
 Fri, 31 Jul 2020 13:34:24 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32mnxvb8dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 13:34:24 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06VHVjrw022037;
 Fri, 31 Jul 2020 17:34:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0vmh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 17:34:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06VHYJVM17302004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 17:34:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C68DA11C050;
 Fri, 31 Jul 2020 17:34:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3BDB11C04C;
 Fri, 31 Jul 2020 17:34:16 +0000 (GMT)
Received: from [9.199.60.84] (unknown [9.199.60.84])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 31 Jul 2020 17:34:16 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH V5 0/4] powerpc/perf: Add support for perf extended regs
 in powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200730195048.GA1484375@krava>
Date: Fri, 31 Jul 2020 23:04:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA3D75F3-5F63-425B-A3C1-00C181E41108@linux.vnet.ibm.com>
References: <1595870184-1460-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <27D1CE26-A506-4CFF-B1C2-E0545F26E637@linux.vnet.ibm.com>
 <20200730195048.GA1484375@krava>
To: Jiri Olsa <jolsa@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_06:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310124
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 31-Jul-2020, at 1:20 AM, Jiri Olsa <jolsa@redhat.com> wrote:
>=20
> On Thu, Jul 30, 2020 at 01:24:40PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 27-Jul-2020, at 10:46 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>>>=20
>>> Patch set to add support for perf extended register capability in
>>> powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
>>> indicate the PMU which support extended registers. The generic code
>>> define the mask of extended registers as 0 for non supported =
architectures.
>>>=20
>>> Patches 1 and 2 are the kernel side changes needed to include
>>> base support for extended regs in powerpc and in power10.
>>> Patches 3 and 4 are the perf tools side changes needed to support =
the
>>> extended registers.
>>>=20
>>=20
>> Hi Arnaldo, Jiri
>>=20
>> please let me know if you have any comments/suggestions on this patch =
series to add support for perf extended regs.
>=20
> hi,
> can't really tell for powerpc, but in general
> perf tool changes look ok
>=20

Hi Jiri,
Thanks for checking the patchset.

Athira.

> jirka


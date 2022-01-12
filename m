Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9AD48BED6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 08:09:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYdvy6HJyz3bSl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 18:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WT66aN77;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WT66aN77; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYdvF4922z2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 18:08:24 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C5x6hE006887
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 07:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Lv89zbBBlxPe+9gr8iQB8wfV1SiSwMf5gheDlKNLUGo=;
 b=WT66aN77MpAkwN65bG+Wc+lApSRgqHDHKhJFJhk3f91QhrOmKC5Hi36bRHx3ABURZvew
 gjXa3RPPWOcYuC8ezKYO6LB31tB63HK1VFZG5sXszk3mCGcBxKDozExewxIHpq23wIKc
 McIUbsaRGIZlnpPKqihNoZ/XJq81vN976ygdC+mwVydtb7RdQ8lXohIfxyqVC/zYDKmQ
 8B8hazPujAFIYFmicACFroJt6M+3TBOjOACdpnAgTdmxfAkMitwTWYIC8D5tbiuKN6Vw
 pdQqVu6OD7mMCQi0pQuULb0N+BUXXr6ZTXKpP5gZmv7YBKwIuxs9HquZKEi2afiL1dAQ sQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcw907c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 07:08:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C77xoS025346
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 07:08:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3df1vj6g9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 07:08:20 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C78Gwh33751364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 07:08:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE4D54C073;
 Wed, 12 Jan 2022 07:08:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2E384C07E;
 Wed, 12 Jan 2022 07:08:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.44.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 07:08:15 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [powerpc/merge] PMU: Kernel warning while running pmu/ebb
 selftests
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <14F95BC2-208C-4936-8809-19B01321B170@linux.vnet.ibm.com>
Date: Wed, 12 Jan 2022 12:38:14 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <0379FF60-B57C-4A03-96AD-888F38A15B09@linux.ibm.com>
References: <4645BEDB-75D8-4178-A5AE-C2AE8693BE96@linux.vnet.ibm.com>
 <0A534F83-D1CB-4DF2-907C-FCCAA65EBA35@linux.ibm.com>
 <14F95BC2-208C-4936-8809-19B01321B170@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: snOezJqW7xkAcgQKy8CZjuJ-2wBSHDPK
X-Proofpoint-ORIG-GUID: snOezJqW7xkAcgQKy8CZjuJ-2wBSHDPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_02,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120044
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> The warning indicates that MSR_EE being set(interrupt enabled) when
> there was an overflown PMC detected. This could happen in
> power_pmu_disable since it runs under interrupt soft disable
> condition ( local_irq_save ) and not with interrupts hard disabled.
> commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
> pending PMI before resetting an overflown PMC") intended to clear
> PMI pending bit in Paca when disabling the PMU. It could happen
> that PMC gets overflown while code is in power_pmu_disable
> callback function. Hence add a check to see if PMI pending bit
> is set in Paca before clearing it via clear_pmi_pending.
>=20
> Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending =
PMI before resetting an overflown PMC")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> ---

Thanks for the patch. The test ran to completion without the
reported warning.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> arch/powerpc/perf/core-book3s.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index a684901b6965..dfb0ea0f0df3 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1327,9 +1327,10 @@ static void power_pmu_disable(struct pmu *pmu)
> 		 * Otherwise provide a warning if there is PMI pending, =
but
> 		 * no counter is found overflown.
> 		 */
> -		if (any_pmc_overflown(cpuhw))
> -			clear_pmi_irq_pending();
> -		else
> +		if (any_pmc_overflown(cpuhw)) {
> +			if (pmi_irq_pending())
> +				clear_pmi_irq_pending();
> +		} else
> 			WARN_ON(pmi_irq_pending());
>=20
> 		val =3D mmcra =3D cpuhw->mmcr.mmcra;
> --=20
> 2.33.0
>=20
>=20


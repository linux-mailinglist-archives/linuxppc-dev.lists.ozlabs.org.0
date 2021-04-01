Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83691351699
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 18:03:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB7Jp3rBSz3gyh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 03:03:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b2rc6Q9t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b2rc6Q9t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB7Hn0vhhz3ghF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 03:02:44 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131G051h193684; Thu, 1 Apr 2021 12:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=WVddq16PKRx8bgxnWAPhairtiSG0/DH30CuSBK5EKds=;
 b=b2rc6Q9tz3U/2Zuuz+CJgr+/wGPqzOiu5Wb6gwz9y4OpDPkb+IH2b6MU8nnA8FBFuznN
 yPTDYoGSvyPGIFHR7eRuge2AQhpVFE8HHiALiKIzJFS2LM1bOxQG8n5/3T0CHE1wlVWl
 sXK58ylOXS/Y9KwhW9vVAOjdYrcDE6AScYs0K69gLSwnlweI4/H9MyuSOLxzcJDDOaRG
 BBpHhWA1m8t5e3oTT3vpITmHl9a0bGH9+P7QomsZGx5jBcQvnfEtZFAKiF+RzEdhYhx7
 mSNaZ8wz2iCRoVruTi9g3hwdJPXiXJVZDx3Vy0LPGJNnZH3gxCF+IFdUDBXRzWnTo6mu Uw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37nh6dgajb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 12:02:36 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131G2JvA023351;
 Thu, 1 Apr 2021 16:02:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 37n28trmpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 16:02:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 131G2VH839911728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 16:02:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89AB4A4057;
 Thu,  1 Apr 2021 16:02:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DA2DA404D;
 Thu,  1 Apr 2021 16:02:25 +0000 (GMT)
Received: from [9.124.214.47] (unknown [9.124.214.47])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  1 Apr 2021 16:02:19 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v3 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210325115326.143151-1-maddy@linux.ibm.com>
Date: Thu, 1 Apr 2021 21:30:05 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <31D80EFE-8C54-480F-B00D-AD50910B004A@linux.vnet.ibm.com>
References: <20210325115326.143151-1-maddy@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aZ306ADFSYdyaKzeamp8hqmdvrmdCt1d
X-Proofpoint-GUID: aZ306ADFSYdyaKzeamp8hqmdvrmdCt1d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_07:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010104
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 25-Mar-2021, at 5:23 PM, Madhavan Srinivasan <maddy@linux.ibm.com> =
wrote:
>=20
> Introduce code to support the checking of attr.config* for
> values which are reserved for a given platform.
> Performance Monitoring Unit (PMU) configuration registers
> have fields that are reserved and some specific values for
> bit fields are reserved. For ex., MMCRA[61:62] is
> Random Sampling Mode (SM) and value of 0b11 for this field
> is reserved.
>=20
> Writing non-zero or invalid values in these fields will
> have unknown behaviours.
>=20
> Patch adds a generic call-back function "check_attr_config"
> in "struct power_pmu", to be called in event_init to
> check for attr.config* values for a given platform.
> "check_attr_config" is valid only for raw event type.
>=20
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog v2:
> -Fixed commit message
>=20
> Changelog v1:
> -Fixed commit message and in-code comments

Changes looks fine to me.

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks,
Athira
>=20
> arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
> arch/powerpc/perf/core-book3s.c              | 14 ++++++++++++++
> 2 files changed, 20 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/perf_event_server.h =
b/arch/powerpc/include/asm/perf_event_server.h
> index 00e7e671bb4b..dde97d7d9253 100644
> --- a/arch/powerpc/include/asm/perf_event_server.h
> +++ b/arch/powerpc/include/asm/perf_event_server.h
> @@ -67,6 +67,12 @@ struct power_pmu {
> 	 * the pmu supports extended perf regs capability
> 	 */
> 	int		capabilities;
> +	/*
> +	 * Function to check event code for values which are
> +	 * reserved. Function takes struct perf_event as input,
> +	 * since event code could be spread in attr.config*
> +	 */
> +	int		(*check_attr_config)(struct perf_event *ev);
> };
>=20
> /*
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 6817331e22ff..c6eeb4fdc5fd 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct =
perf_event *event)
>=20
> 		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
> 			return -EINVAL;
> +		/*
> +		 * PMU config registers have fields that are
> +		 * reserved and specific value to bit field as reserved.
> +		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
> +		 * and value of 0b11 to this field is reserved.
> +		 *
> +		 * This check is needed only for raw event type,
> +		 * since tools like fuzzer use raw event type to
> +		 * provide randomized event code values for test.
> +		 *
> +		 */
> +		if (ppmu->check_attr_config &&
> +		    ppmu->check_attr_config(event))
> +			return -EINVAL;
> 		break;
> 	default:
> 		return -ENOENT;
> --=20
> 2.26.2
>=20


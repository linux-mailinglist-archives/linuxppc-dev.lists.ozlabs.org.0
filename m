Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B95545DC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 09:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCjK40Hnz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LXqQbnSi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LXqQbnSi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKChZ3xlqz306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 17:46:37 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5xRkw008495;
	Fri, 10 Jun 2022 07:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=pc8m+/UKYEn3uIRmUUvBET7hGvTQWixAH7EnOzXeuLg=;
 b=LXqQbnSigGREsmG7vMd9bd9wCGtQcNtjZexL6fKp3QX+c04LLnVItRaFQVVkUjoT70uw
 grNHXWKohY56Te/bmJ9qKOe+9RVadQFZnYWPhTCWQG/+LklQQWU1xmYmuMQXJPWKM+mF
 Dd+p1m0L2tNsMpWCEzeIRxubFLG414k+AEQh1qwZ4bSBCmGlqvztMEuaBRSbhb9mRHbN
 9j7AfMlF5uB2eUVIU5QMegf/Zwi8FezNE1zyjK+ANYU4V8Us9arc9hevr8/SN+TMnT3v
 zLliEEUZqEs+LeevqQb0p2sGeDbz6QzVwKFpyoPWZOxCitDxh9eYe74d0YXdNIW97vDb CA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm09xspkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 07:46:33 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25A7LWZ1016367;
	Fri, 10 Jun 2022 07:46:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3gfy18x928-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 07:46:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25A7kR4c20775220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 07:46:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F41A4C040;
	Fri, 10 Jun 2022 07:46:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A2244C04E;
	Fri, 10 Jun 2022 07:46:25 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.7.130])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jun 2022 07:46:24 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2] powerpc/perf: Give generic PMU a nice name
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220610044006.2095806-1-joel@jms.id.au>
Date: Fri, 10 Jun 2022 13:16:20 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A506984B-31A6-43E2-8F1F-9F01621539A1@linux.vnet.ibm.com>
References: <20220610044006.2095806-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uLu7BFB0Rv6kUw0kpDfuDzd28vDNGQgl
X-Proofpoint-ORIG-GUID: uLu7BFB0Rv6kUw0kpDfuDzd28vDNGQgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100025
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Athira Rajeev <atrajeev@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10-Jun-2022, at 10:10 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> When booting on a machine that uses the compat pmu driver we see this:
>=20
> [    0.071192] GENERIC_COMPAT performance monitor hardware support =
registered
>=20
> Which is a bit shouty. Give it a nicer name.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Go with ISAv3
>=20
> arch/powerpc/perf/generic-compat-pmu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/perf/generic-compat-pmu.c =
b/arch/powerpc/perf/generic-compat-pmu.c
> index f3db88aee4dd..16392962c511 100644
> --- a/arch/powerpc/perf/generic-compat-pmu.c
> +++ b/arch/powerpc/perf/generic-compat-pmu.c
> @@ -292,7 +292,7 @@ static int generic_compute_mmcr(u64 event[], int =
n_ev,
> }
>=20
> static struct power_pmu generic_compat_pmu =3D {
> -	.name			=3D "GENERIC_COMPAT",
> +	.name			=3D "ISAv3",


Looks good.


Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

> 	.n_counter		=3D MAX_PMU_COUNTERS,
> 	.add_fields		=3D ISA207_ADD_FIELDS,
> 	.test_adder		=3D ISA207_TEST_ADDER,
> --=20
> 2.35.1
>=20


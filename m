Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24D26DBF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:47:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BscDq50WVzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:47:23 +1000 (AEST)
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
 header.s=pp1 header.b=dl7+8OAh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsbfW31ngzDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 22:21:07 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HC2Jsr134600; Thu, 17 Sep 2020 08:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ZlfXov+rkmD/LlDJQObNUJUji01jJqDsWqymiRDSKNc=;
 b=dl7+8OAhcgY39gxhAQwjIEn9Cv55+NzWprlD5Fcmi58ErBoLEfbHj1RnNLzwZiFh63iP
 DIyrLLsC7p0llfuW+ONIZa4BlnjozJUQGsAhuki+e12WjCWoCaLWl5CBlnADB/my1ECS
 Nv1uX5M7WJQQrNC5dzYlnuTQvJIymcsAClPbUAydXTXOt5YK0neSU9IpCOuo33nUFqsN
 zWjTwmyf/Div6KgqFePRQI15VQQ+8CZPzB3sBbnsCl3KiZa8UKsI53c1PfCxr/W9D6C5
 YjT2Ca/c/QbQq/a3vQNcQMUg3w+55HD84se9IY72YGrvZDNvFGLQ8oJeYOO304oVfC20 IA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33m6ufhsj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 08:20:55 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HCFsal002869;
 Thu, 17 Sep 2020 12:20:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 33k9ge9xjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 12:20:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HCKlLM24445306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 12:20:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EE8E4203F;
 Thu, 17 Sep 2020 12:20:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B30F242049;
 Thu, 17 Sep 2020 12:20:45 +0000 (GMT)
Received: from [9.85.83.146] (unknown [9.85.83.146])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Sep 2020 12:20:45 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v2 6/7] powerpc/perf: Remove unused variable 'target' in
 trace_imc_event_init()
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20200914211007.2285999-7-clg@kaod.org>
Date: Thu, 17 Sep 2020 17:50:43 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B774F363-DE5F-49AD-B170-2259367AE656@linux.vnet.ibm.com>
References: <20200914211007.2285999-1-clg@kaod.org>
 <20200914211007.2285999-7-clg@kaod.org>
To: =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_08:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170090
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "anju@linux.vnet.ibm.com" <anju@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 15-Sep-2020, at 2:40 AM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>=20
> This fixes a compile error with W=3D1.
>=20
> CC      arch/powerpc/perf/imc-pmu.o
> ../arch/powerpc/perf/imc-pmu.c: In function =
=E2=80=98trace_imc_event_init=E2=80=99:
> ../arch/powerpc/perf/imc-pmu.c:1429:22: error: variable =E2=80=98target=E2=
=80=99 set but not used [-Werror=3Dunused-but-set-variable]
>  struct task_struct *target;
>                      ^~~~~~
>=20
> Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> arch/powerpc/perf/imc-pmu.c | 3 ---
> 1 file changed, 3 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index 62d0b54086f8..9ed4fcccf8a9 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -1426,8 +1426,6 @@ static void trace_imc_event_del(struct =
perf_event *event, int flags)
>=20
> static int trace_imc_event_init(struct perf_event *event)
> {
> -	struct task_struct *target;
> -
> 	if (event->attr.type !=3D event->pmu->type)
> 		return -ENOENT;
>=20
> @@ -1458,7 +1456,6 @@ static int trace_imc_event_init(struct =
perf_event *event)
> 	mutex_unlock(&imc_global_refc.lock);
>=20
> 	event->hw.idx =3D -1;
> -	target =3D event->hw.target;

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
>=20
> 	event->pmu->task_ctx_nr =3D perf_hw_context;
> 	event->destroy =3D reset_global_refc;
> --=20
> 2.25.4
>=20


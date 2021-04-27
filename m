Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9436C770
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 16:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV3Ld0Gyxz302c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 00:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VMmXJfQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VMmXJfQZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV3Kr0VDRz2xYY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 23:59:43 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RDqVaB126556
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=Aaq5Wp/NCuUfLwUnG1XMYDfT++xkqCioxL4mR8dXNIc=;
 b=VMmXJfQZbBokDWWKXjMd6OWVhFk4EniBJVM/RJLCE+bE675I1OiU+508iUIA9dnDkc0s
 eEqlTjq/4YppLDYk+IGyr308Zby3tEPjIM3Uh8NermK59NrAThWqA/65AsPXGRb5jhFT
 Wzqc2bq4bqCDNGv0QFeV9mS1wZYHoSyqvNFS2vQ1udChCH+OZYydCja8chcgHhsV+0NG
 5x2K0nLeET00q6VG0W7gy3oSbcffN0EhJfZiIoRIZq1MLP4mutSoS2TehAHbTzDEF0HT
 ytUgv8BI2FN57w75FVVdMj/9e7o8fgpoABMUku0HLtxDSoAHyxkzLyDWFd9WeRfImfEB ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386kvpr5ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:59:40 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RDsKZk133137
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:59:40 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386kvpr5kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 09:59:39 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RDwpXj017572;
 Tue, 27 Apr 2021 13:59:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 384ay80sas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 13:59:37 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13RDxALq28508506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 13:59:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52FC411C058;
 Tue, 27 Apr 2021 13:59:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9ACB11C04A;
 Tue, 27 Apr 2021 13:59:33 +0000 (GMT)
Received: from localhost (unknown [9.85.74.4])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 13:59:33 +0000 (GMT)
Date: Tue, 27 Apr 2021 19:29:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-5-npiggin@gmail.com>
In-Reply-To: <20210423031108.1046067-5-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1619531703.lv0qigovgz.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tHl7_2m9Dta1ClFhZ0I0Sj8WmrIjaeZg
X-Proofpoint-GUID: teDWpr5flz_Yct81pNK8I2yI6Wz7NCkZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_08:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270094
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> ---
>  arch/powerpc/platforms/pseries/lpar.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfor=
ms/pseries/lpar.c
> index 835e7f661a05..a961a7ebeab3 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -1828,8 +1828,11 @@ void hcall_tracepoint_unregfunc(void)
>=20
>  /*
>   * Since the tracing code might execute hcalls we need to guard against
> - * recursion. H_CONFER from spin locks must be treated separately though
> - * and use _notrace plpar_hcall variants, see yield_to_preempted().
> + * recursion, but this always seems risky -- __trace_hcall_entry might b=
e
> + * ftraced, for example. So warn in this case.

__trace_hcall_[entry|exit] aren't traced anymore since they now have the=20
'notrace' annotation.

> + *
> + * H_CONFER from spin locks must be treated separately though and use _n=
otrace
> + * plpar_hcall variants, see yield_to_preempted().
>   */
>  static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
>=20
> @@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long opco=
de, unsigned long *args)
>=20
>  	depth =3D this_cpu_ptr(&hcall_trace_depth);
>=20
> -	if (*depth)
> +	if (WARN_ON_ONCE(*depth))
>  		goto out;

I don't think this will be helpful. The hcall trace depth tracking is=20
for the tracepoint and I suspect that this warning will be triggered=20
quite easily. Since we have recursion protection, I don't think we=20
should warn here.


- Naveen


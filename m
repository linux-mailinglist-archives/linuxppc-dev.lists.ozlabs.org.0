Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB15843E64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 12:31:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mICveEIP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ0Gx16fLz3cSL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 22:31:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mICveEIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ0Fd5194z3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 22:30:13 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40VAkVr3026617;
	Wed, 31 Jan 2024 11:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qo3pFwQDixYJLlvSifX/m2m+bH91u4D+H7WqgFPAQyU=;
 b=mICveEIPDkf5RIjy7qK1E+lZB/fjOPgaSTNvLjhMwriua45cAan/ubbX4E6QYGHJyFlO
 gGuCM4eBtPCoBnsdsR9mDCkHXEWIzxy0K0Cc/ad4SJenhAgzrSAAXlGfs83UG4GtAGgJ
 aA4psZHgaMMiS5jD9mPPMWu2WHrSoRJDnpC3rjk600okn3SjP0ff2AMOggch5Ra72Boa
 Yuls5zfJxYveUm/l23x3A2CW81c8TuCEJ8JvvrVwMEGJgUCEVWIC0i47iFcd6TDYC5v9
 aDXmFyMTKraX81KqAVrwMYWYuvUo5oNk4BwDyIrthN2XxJclRzqjMQrw7WTKOsRyujOC xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vyhyu52s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:30:08 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40VBGHZt022748;
	Wed, 31 Jan 2024 11:30:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vyhyu52qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:30:07 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40V9oFFb010887;
	Wed, 31 Jan 2024 11:30:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vweckmr48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:30:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40VBU4fj49217992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jan 2024 11:30:04 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB6AC2004B;
	Wed, 31 Jan 2024 11:30:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F6FA20040;
	Wed, 31 Jan 2024 11:30:02 +0000 (GMT)
Received: from [9.171.57.39] (unknown [9.171.57.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jan 2024 11:30:02 +0000 (GMT)
Message-ID: <7f81b8d7-a3ed-ac65-401f-ccd1de486860@linux.ibm.com>
Date: Wed, 31 Jan 2024 17:00:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] perf/pmu-events/powerpc: Update json mapfile with Power11
 PVR
To: Madhavan Srinivasan <maddy@linux.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240129120855.551529-1-maddy@linux.ibm.com>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20240129120855.551529-1-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KYK2agzR8jWkVOC0gFf_zdjsxjcei6tT
X-Proofpoint-ORIG-GUID: z5grKTglX16sgpKAsN7s8TlhWx_Xa3kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401310087
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
Cc: linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch looks fine to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

On 1/29/24 17:38, Madhavan Srinivasan wrote:
> Update the Power11 PVR to json mapfile to enable
> json events. Power11 is PowerISA v3.1 compliant
> and support Power10 events.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  tools/perf/pmu-events/arch/powerpc/mapfile.csv | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/pmu-events/arch/powerpc/mapfile.csv b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> index 599a588dbeb4..4d5e9138d4cc 100644
> --- a/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> @@ -15,3 +15,4 @@
>  0x0066[[:xdigit:]]{4},1,power8,core
>  0x004e[[:xdigit:]]{4},1,power9,core
>  0x0080[[:xdigit:]]{4},1,power10,core
> +0x0082[[:xdigit:]]{4},1,power10,core

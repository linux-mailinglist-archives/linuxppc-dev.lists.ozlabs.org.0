Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 200CA9320F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 09:07:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=higpwW40;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNVWB0Ws0z3d9s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 17:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=higpwW40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNVVT41k1z2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 17:06:41 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G72mxg005314;
	Tue, 16 Jul 2024 07:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=U
	bJ9PN2ocB3ub4Ud6fp71ukk0Rx+QhDOVMxYciX9QWk=; b=higpwW40DfxgEZbFm
	IwFGJx20VQkIx7DdNoCR4uRdjUfPEWwpmWyBfOvwOu3tU82lYBkny4rYLr+0ETrO
	yENkTekvx4O1VaIX5v41+2lVHkJW2np4kwxSqpYtpKHWzTFyNUnyLWkMEga+4v1G
	MDcKYZunVxFHKoMU4+a0k079csGjy4jiaZlKn3zi2uowjAbe9ppIByJRa9dtPQ/W
	FAFOKSDU6KvtdnOmbXI0xSkkWPF+pA5Gf/DZ67ZQ38gAcU0MS4jOngIC1KM4f7jR
	XPI9IHbFaxN/whkyuWuUGnkFso1vS/Que7qJsGC/Rf6BgN/nN5FW7QGqjL+q4NFX
	iq+Lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40dkmdg47k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 07:06:20 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46G76J3U011077;
	Tue, 16 Jul 2024 07:06:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40dkmdg47g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 07:06:19 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46G4fNpp018009;
	Tue, 16 Jul 2024 07:06:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 40c3wtu2rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 07:06:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46G76FDY52953408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 07:06:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55DA52004B;
	Tue, 16 Jul 2024 07:06:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7228120043;
	Tue, 16 Jul 2024 07:06:13 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jul 2024 07:06:13 +0000 (GMT)
Message-ID: <92e61201-2ee4-458d-988d-a476018a05dc@linux.ibm.com>
Date: Tue, 16 Jul 2024 12:36:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Update powerpc BPF JIT maintainers
To: Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
 <24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9H5WhQee8nWzWOgKC_l9BaEh45cpN-WB
X-Proofpoint-ORIG-GUID: tRVYrAhgPlQbwhcoW8TOCUuyXtUj4JPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160051
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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/07/24 2:04 pm, Naveen N Rao wrote:
> Hari Bathini has been updating and maintaining the powerpc BPF JIT since
> a while now. Christophe Leroy has been doing the same for 32-bit
> powerpc. Add them as maintainers for the powerpc BPF JIT.
> 
> I am no longer actively looking into the powerpc BPF JIT. Change my role
> to that of a reviewer so that I can help with the odd query.
> 
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 05f14b67cd74..c7a931ee7a2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,8 +3878,10 @@ S:	Odd Fixes
>   F:	drivers/net/ethernet/netronome/nfp/bpf/
>   
>   BPF JIT for POWERPC (32-BIT AND 64-BIT)
> -M:	Naveen N Rao <naveen@kernel.org>
>   M:	Michael Ellerman <mpe@ellerman.id.au>
> +M:	Hari Bathini <hbathini@linux.ibm.com>
> +M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> +R:	Naveen N Rao <naveen@kernel.org>
>   L:	bpf@vger.kernel.org
>   S:	Supported
>   F:	arch/powerpc/net/

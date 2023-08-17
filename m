Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F777F4B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:03:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IeNXNr3+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRMYY4LJVz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:03:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IeNXNr3+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRMXf1fDGz2yVp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:02:26 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RRMXb6nrMz4wy6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:02:23 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RRMXb6ggdz4wy3; Thu, 17 Aug 2023 21:02:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IeNXNr3+;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RRMXb3kM9z4wZs;
	Thu, 17 Aug 2023 21:02:23 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HB0n5p013309;
	Thu, 17 Aug 2023 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YsJN6V2e6Qh0rBRr5JT6LvYD+1jux3pTKtDr3Cx7cDs=;
 b=IeNXNr3+ZRxSpLjA2hgTJARaWaAuxseKJ8tKdvg/L7cHd5CY0F4fmfR+Z5BIN/CtSsFi
 dVfDctQEtg0ho33DNGW3lKwABGwQ3JDfaOs48oVvK3yiH1m4yNC9ZcfFWS1do5hJNNV/
 M7knVW/uXlLqGc7CNlArmnfblKb6AohtmZZAaySSZCoh4gaqDclqBgxyeeLL4dTx28CZ
 3IvvDv+VS6UaBZ72Vr1C7UYXLE1Mt2CWUlwEEhpdTF41EvzhW3YK3ft/dFXWQqe/lYw+
 4/pJMBDiSdSogWUTWE63AXccgmSy+bsmlfen6K+LfHIGooQm+/uwF6k0B9YwypcBT8OL 5g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3shja701fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 11:02:19 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37H90YDK002418;
	Thu, 17 Aug 2023 11:02:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sendnnghs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 11:02:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37HB2Fvn15860312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Aug 2023 11:02:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1E3720067;
	Thu, 17 Aug 2023 11:02:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22C352006A;
	Thu, 17 Aug 2023 11:02:14 +0000 (GMT)
Received: from [9.43.127.155] (unknown [9.43.127.155])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Aug 2023 11:02:13 +0000 (GMT)
Message-ID: <8732c11e-77e4-2231-dc84-568a5e8ea652@linux.ibm.com>
Date: Thu, 17 Aug 2023 16:32:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] powerpc/fadump: reset dump area size if fadump memory
 reserve fails
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
References: <20230704050715.203581-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20230704050715.203581-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _8Td5EZs_QwMab2CHbOdC0IPl97qFLdQ
X-Proofpoint-ORIG-GUID: _8Td5EZs_QwMab2CHbOdC0IPl97qFLdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_03,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170095
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
Cc: mahesh@linux.vnet.ibm.com, Mahesh Salgaonkar <mahesh@linux.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

Are there any reviews or comments on this fix?

Thanks,
Sourabh Jain

On 04/07/23 10:37, Sourabh Jain wrote:
> In case fadump_reserve_mem() fails to reserve memory, the
> reserve_dump_area_size variable will retain the reserve area size. This
> will lead to /sys/kernel/fadump/mem_reserved node displaying an incorrect
> memory reserved by fadump.
>
> To fix this problem, reserve dump area size variable is set to 0 if fadump
> failed to reserve memory.
>
> Fixes: 8255da95e545 ("powerpc/fadump: release all the memory above boot memory size")
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
> Chnages form V1:
> * Reset the dump area size within the error_out path to cover more
>    failure cases. Furthermore, the commit description has been modified
>    accordingly.
> ---
>   arch/powerpc/kernel/fadump.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index f3166acab09b..5a07d0f9c7f0 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -654,6 +654,7 @@ int __init fadump_reserve_mem(void)
>   	return ret;
>   error_out:
>   	fw_dump.fadump_enabled = 0;
> +	fw_dump.reserve_dump_area_size = 0;
>   	return 0;
>   }
>   


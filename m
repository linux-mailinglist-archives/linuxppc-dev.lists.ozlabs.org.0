Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BC97455AB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 08:56:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HNx0kBpZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvcCD3Ffjz3brB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 16:56:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HNx0kBpZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvcBJ3vYbz2xq1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 16:55:20 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QvcBJ3Q6Kz4wqZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 16:55:20 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4QvcBJ3KrGz4wqX; Mon,  3 Jul 2023 16:55:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HNx0kBpZ;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4QvcBH6BbYz4wbP;
	Mon,  3 Jul 2023 16:55:19 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3636lPx8018620;
	Mon, 3 Jul 2023 06:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fTL/o85lsPw/3VjmUUlsM9pb1Crg/uYmFbhqD3AMIFY=;
 b=HNx0kBpZwv4WdIvgUd/ZZAr/uQ/WTOeS6cucSHgpsA5jbxjF1ohYYdkH+GyHwLEqHjcz
 zSWhmn6nVopDdzZyk8WALcs3KsBEm4oEc6bhLQMV3ictFXUe5Oa67cNHkMS5Y6DeGk5o
 YqcoKsoqd08JYWyIdDwVy7h+Rxs6gBbggVrO134b4RL0buBkkXOIQT0p7U5uoA6Qu2m7
 rKh2PrRBK799fjfLjp/0x26b4NDzp3erx9L0/JKg23lT3VeUP+VnO+PGmSwySTOI6zjp
 /xIK9t4UjzrrQXWn9tUWj9rp1cYYxWALtQWrBWPb96CuminvBFoW6JFKKBC8WOW2Vc85 fA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rksce06g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jul 2023 06:55:16 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3632roO1017239;
	Mon, 3 Jul 2023 06:55:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rjbs4rut1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jul 2023 06:55:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3636tBg225428688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Jul 2023 06:55:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAA052004D;
	Mon,  3 Jul 2023 06:55:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82DB42004B;
	Mon,  3 Jul 2023 06:55:10 +0000 (GMT)
Received: from [9.43.15.91] (unknown [9.43.15.91])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jul 2023 06:55:10 +0000 (GMT)
Message-ID: <ed637200-537f-70a5-bf40-ceefb2092e1e@linux.ibm.com>
Date: Mon, 3 Jul 2023 12:25:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] powerpc/fadump: reset dump area size variable if memblock
 reserve fails
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
References: <20230608092246.343761-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20230608092246.343761-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qXN4nTvtJUFaQs-4uQEVsH9HFRcQvTP5
X-Proofpoint-GUID: qXN4nTvtJUFaQs-4uQEVsH9HFRcQvTP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030060
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

Do you have any feedback or comments regarding this patch?

Thanks,
Sourabh

On 08/06/23 14:52, Sourabh Jain wrote:
> If the memory reservation process (memblock_reserve) fails to reserve
> the memory, the reserve dump variable retains the dump area size.
> Consequently, the size of the dump area calculated for reservation
> is displayed in /sys/kernel/fadump/mem_reserved.
>
> To resolve this issue, the reserve dump area size variable is set to 0
> if the memblock_reserve fails to reserve memory.
>
> Fixes: 8255da95e545 ("powerpc/fadump: release all the memory above boot memory size")
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
>   arch/powerpc/kernel/fadump.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index ea0a073abd96..a8f2c3b2fa1e 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -641,6 +641,7 @@ int __init fadump_reserve_mem(void)
>   			goto error_out;
>   
>   		if (memblock_reserve(base, size)) {
> +			fw_dump.reserve_dump_area_size = 0;
>   			pr_err("Failed to reserve memory!\n");
>   			goto error_out;
>   		}

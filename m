Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0B1F3551
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:45:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h2Gg4tp1zDqSM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:45:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1n10wJgzDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:23:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 059742Or127869
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jun 2020 03:23:14 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31hrq7neph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 03:23:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0597KETk024991
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jun 2020 07:23:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 31g2s7t74g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 07:23:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0597N9Ql37421288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jun 2020 07:23:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E0B24203F;
 Tue,  9 Jun 2020 07:23:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 192D142041;
 Tue,  9 Jun 2020 07:23:09 +0000 (GMT)
Received: from pomme.local (unknown [9.145.53.106])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jun 2020 07:23:09 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/svm: Remove unwanted check for
 shared_lppaca_size
To: sathnaga@linux.vent.ibm.com, ltc-ultravisor@lists.linux.ibm.com
References: <20200609053827.363381-1-sathnaga@linux.vent.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <7e9ffdc0-ff36-6b18-b24b-cf4fb6ddb4dd@linux.ibm.com>
Date: Tue, 9 Jun 2020 09:23:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609053827.363381-1-sathnaga@linux.vent.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-09_02:2020-06-08,
 2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 cotscore=-2147483648 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090048
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
Cc: Ram Pai <linuxram@us.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 09/06/2020 à 07:38, sathnaga@linux.vent.ibm.com a écrit :
> From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> 
> Early secure guest boot hits the below crash while booting with
> vcpus numbers aligned with page boundary for PAGE size of 64k
> and LPPACA size of 1k i.e 64, 128 etc, due to the BUG_ON assert
> for shared_lppaca_total_size equal to shared_lppaca_size,
> 
>   [    0.000000] Partition configured for 64 cpus.
>   [    0.000000] CPU maps initialized for 1 thread per core
>   [    0.000000] ------------[ cut here ]------------
>   [    0.000000] kernel BUG at arch/powerpc/kernel/paca.c:89!
>   [    0.000000] Oops: Exception in kernel mode, sig: 5 [#1]
>   [    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> 
> which is not necessary, let's remove it.

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Ram Pai <linuxram@us.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kernel/paca.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 949eceb25..10b7c54a7 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -86,7 +86,7 @@ static void *__init alloc_shared_lppaca(unsigned long size, unsigned long align,
>   	 * This is very early in boot, so no harm done if the kernel crashes at
>   	 * this point.
>   	 */
> -	BUG_ON(shared_lppaca_size >= shared_lppaca_total_size);
> +	BUG_ON(shared_lppaca_size > shared_lppaca_total_size);
>   
>   	return ptr;
>   }
> 


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F77BF5CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 10:27:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tPHuU4/6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4TXh3CBVz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tPHuU4/6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4TWp5ffRz300g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 19:26:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A8P4pQ031516;
	Tue, 10 Oct 2023 08:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sxnapVHKhUyMlOcgKPjAwwaPpExMmq9U92IVlVJOelw=;
 b=tPHuU4/6IEqMjDH5dxgsnZEUA6V7203XXdr+a13omiCGn0I7K6iyB4fT+QBc8FeI2xtP
 2GPCO2WelWcqbkcC64j24PM17i2sXbmtjjJA0p90vE0fp566gVXfJRoanuroJAyxymgw
 KW5BXrkDEO5uu+PjcyQ1PyBSxLSbbEpZQLwe5e9WTTuDiuTQ2f8zhwKsiRhy8M/KGYsp
 gf0mFk5NmDs3s+oJuuIdtqImrE9cZ893ogMJKDkp7ORr/WBAzYEDvQ23QEGWNDW2X/kM
 8yq2pqYB4cBEMkEgmvqm8CDdRVa59nIZNtRImGeUgE1BOL38TxwBimfb9gD7KyVllw6H Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn3318215-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:26:21 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39A8PF3t032000;
	Tue, 10 Oct 2023 08:26:21 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn33181ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:26:21 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39A778Fp028239;
	Tue, 10 Oct 2023 08:26:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xy89h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:26:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39A8QG7p16843284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2023 08:26:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92AB520043;
	Tue, 10 Oct 2023 08:26:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA25220040;
	Tue, 10 Oct 2023 08:26:14 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Oct 2023 08:26:14 +0000 (GMT)
Message-ID: <8216e3e3-8475-158f-dc79-1b5ba1032150@linux.ibm.com>
Date: Tue, 10 Oct 2023 13:56:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid
 greater than nr_cpus
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-4-piliu@redhat.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20231009113036.45988-4-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qcOiXTFHAunYHq7vNCh0S8FSdjk3elas
X-Proofpoint-ORIG-GUID: Fxt0V3M0qzpYiUXCdgmDEkVRqJdXDnQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 clxscore=1011 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100062
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/10/23 5:00 pm, Pingfan Liu wrote:
> If the boot_cpuid is smaller than nr_cpus, it requires extra effort to
> ensure the boot_cpu is in cpu_present_mask. This can be achieved by
> reserving the last quota for the boot cpu.
> 
> Note: the restriction on nr_cpus will be lifted with more effort in the
> successive patches
> 
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Wen Xiong <wenxiong@linux.ibm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/setup-common.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 81291e13dec0..f9ef0a2666b0 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -454,8 +454,8 @@ struct interrupt_server_node {
>   void __init smp_setup_cpu_maps(void)
>   {
>   	struct device_node *dn;
> -	int shift = 0, cpu = 0;
> -	int j, nthreads = 1;
> +	int terminate, shift = 0, cpu = 0;
> +	int j, bt_thread = 0, nthreads = 1;
>   	int len;
>   	struct interrupt_server_node *intserv_node, *n;
>   	struct list_head *bt_node, head;
> @@ -518,6 +518,7 @@ void __init smp_setup_cpu_maps(void)
>   			for (j = 0 ; j < nthreads; j++) {
>   				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
>   					bt_node = &intserv_node->node;
> +					bt_thread = j;
>   					found_boot_cpu = true;
>   					/*
>   					 * Record the round-shift between dt
> @@ -537,11 +538,21 @@ void __init smp_setup_cpu_maps(void)
>   	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
>   	list_add_tail(&head, bt_node);
>   	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
> +	terminate = nr_cpu_ids;
>   	list_for_each_entry(intserv_node, &head, node) {
>   
> +		j = 0;

> +		/* Choose a start point to cover the boot cpu */
> +		if (nr_cpu_ids - 1 < bt_thread) {
> +			/*
> +			 * The processor core puts assumption on the thread id,
> +			 * not to breach the assumption.
> +			 */
> +			terminate = nr_cpu_ids - 1;

nthreads is anyway assumed to be same for all cores. So, enforcing
nr_cpu_ids to a minimum of nthreads (and multiple of nthreads) should
make the code much simpler without the need for above check and the
other complexities addressed in the subsequent patches...

Thanks
Hari

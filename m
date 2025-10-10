Return-Path: <linuxppc-dev+bounces-12765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC50BCBA31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 06:23:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjYX94Rftz2xQD;
	Fri, 10 Oct 2025 15:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760070217;
	cv=none; b=WbnE1YqNQAnP4H1wRxI5/7ZpzZPAC7jCKlAZNgQTcXC/BB/NlmMsUaxtwb+LCY/gybEGrCJYaNjNjBziF1s2IyI8Lf4M1X5VJuUb+eSOIQCabJwUtY8FdtyM0tIKBckcGZ9Yc9ruUWQYOPmto5jVr19y1Iz6OAp4MoseP+wv5G1NcPVZveO8ylLJbAr1NFZonFS9yt6JdnMDYrHYftxlkxxgviQWiSg5UW6PcYL4Tb3mNdXZpJ8DeeJ0iGUcBRabGFjrDpvIr5fdThd3WlEQFOViAlzk0Nlr45/izaPEAnx2zndid5n7t5um7DjzPPaaRLPqpq0r7tf/RASmqiA7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760070217; c=relaxed/relaxed;
	bh=8mBBfhOUT8M6yrO90Duy0AJBqEiKRHoVuX608C0++mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V6+6wMWVCFdmKRYvJzvDrpLz0TMZsCwrcW6A11dvxfneSa4Rk2rGUqhYMLB6wgo3CqsmZ0BQ6yLMNiu1tG1woqBbhUYLZ2sjkH5GkQG3H8XhWb9Q+Qh5/tNRjyUek/bxqHusUQCCQdyoY09tNF362uHh2bllSiLkCKcIqIVuRZRzGS15hRLCrZqU1k1yzSaElvbpOZjNW2fpXiaZrG0I1ooemYBENV69KbZrG0FRgCV/0E2A/qBENsLoZ6WDYBZRcEA6OTWnxHlJHepug2fNCreGKlwcHvodyDlGoqHZkns++/UG5CgARXVtWRo4KAzFIAwGolpeEM5y730fS66Y1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq7XAPTx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq7XAPTx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjYX84BbZz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 15:23:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599IHucF002809;
	Fri, 10 Oct 2025 04:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8mBBfh
	OUT8M6yrO90Duy0AJBqEiKRHoVuX608C0++mI=; b=kq7XAPTxSbppsUv27Pe7cd
	UtpRys4EbdvN7Dg5lb5D0O+D7dvJSWVxgUMsf3cYe31K1fqi7g2Rrmqkog5ocfOG
	qTFy4QjOeyBY7xQcbuTQvs8NgIJfWxpT8qg3ZfS0/HsoFmKoaSIY/GLJGvVE5UQR
	NSjbVKIE0YGm/bZrSWOkDVkOmG02LXdBZYF1tOM13EjBeO9P4OYbepjEybw5fZ0j
	V44qdjiQZH3YNfvhQdKsEc5veg0KVLFTw1FOIX+qmerSMb3hnGT4An3hpratIo5Z
	UAieZITgaJop+cYw+W4LDRxB6O55itdGtCSBhIkYpWDMp3i8NnqjIRqLkTSAZDzg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv870fs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 04:23:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59A31Kns026015;
	Fri, 10 Oct 2025 04:23:17 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49nvamr31r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 04:23:17 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59A4NG1I27919090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Oct 2025 04:23:16 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E49F58065;
	Fri, 10 Oct 2025 04:23:16 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CD6958052;
	Fri, 10 Oct 2025 04:23:15 +0000 (GMT)
Received: from [9.61.240.51] (unknown [9.61.240.51])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Oct 2025 04:23:14 +0000 (GMT)
Message-ID: <72694ae5-f3ef-4da5-a5ac-b18236d9583c@linux.ibm.com>
Date: Fri, 10 Oct 2025 09:53:13 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bisected][mainline]Kernel OOPs at msi_desc_to_pci_dev
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Gautam Menghani <gautam@linux.ibm.com>
References: <878d7651-433a-46fe-a28b-1b7e893fcbe0@linux.ibm.com>
 <87wm55h8ep.fsf@yellow.woof>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <87wm55h8ep.fsf@yellow.woof>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CVYy3NYgwX7N4bgbJ4yKHTBIwFj0eEe-
X-Proofpoint-ORIG-GUID: CVYy3NYgwX7N4bgbJ4yKHTBIwFj0eEe-
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=68e88a36 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VnNF1IyMAAAA:8 a=ZJ7TM_y2-Z2NVvSBRrsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX3kfu4vM4FKS3
 inIkwG2cH33mSGhKqpLj5fcAGnZH3L1eBCIRS+tvIUDLM1/dIUWn+Jr3QjfgLlkCW2I3Bv+Lu3L
 couripZXvEeieh4q0IMfONrH6viy4wb0dB6c7pH2GaIKCiFMNACNCKo+ELlHsAY+76TmRwSIBnb
 dTFmWGofqa5L6CUXDVkAWDmA5cLyQuU8xoYrdKaFW+6qhChKftDE0/aPJRVKRukh1Ec06YTYpxe
 6pxcPaZcQ7YObarxpXD0eY3CsqDgRInLTd7zPHnXJplMsvds5cq7rjsiEkFpkbOtoItneTPrOIP
 mkd7aBySEcKF/p6CFoK3UyrH3MHkmMKznrcf8pTqViSRTm5DiRx2QjQSNul6FteJqwgcXCaYTrb
 LBaQZZVnMVVMJv9ZxxeD1U7iwN10vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510080121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 08/10/25 6:12 pm, Nam Cao wrote:
> Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
>> IBM CI has reported a kernel crash while running module load and unload
>> testing on lpfc driver.
> Thanks for the report.
>
> I trust the below patch should fix the issue?
>
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index 825f9432e03d..a82aaa786e9e 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -443,8 +443,7 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
>    */
>   static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
>   {
> -	struct msi_desc *desc = arg->desc;
> -	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
> +	struct pci_dev *pdev = to_pci_dev(domain->dev);
>   
>   	rtas_disable_msi(pdev);
>   }
>
Thanks for the fix. This change fixes the reported issue. Please add 
below tag also, while sending out the patch.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.




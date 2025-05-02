Return-Path: <linuxppc-dev+bounces-8258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4883AA710A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 14:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZpqJc4CpCz2y34;
	Fri,  2 May 2025 22:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746187280;
	cv=none; b=femk0dUgSDecKeNinbYoB55u4+16BxtyDtquzB9GknA0PYqS1a5BFeW49vaPnuzfWgN4R1dmewTWokkKg4oP/rKe2DNsUR1fZDnIlr02sq/p41qdzsZsb03jHm1PO7PnAKZlMz0uf9DSRP1gt0wOYitSRlZMx/61dbr25uXvdbpfiD+83OFSgVX5IwG687dncuw9gBId0gUCQ12QnFg1WqtpkekHlO1aN3tGWGr2Tn08SobjTTWPQI/rWquiuWiML6TQqb7QDCOnVID7EdpmOp3hDVAwbn//Xjwy49dKOa9Q01Az4JGlVeAe8410xXfB8RCRf64MkqYlqQOV25Ttyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746187280; c=relaxed/relaxed;
	bh=l4BVd6xWzagMIbyTPyk7pywmsK+BN7JPzeovOab1+vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+06Rc5q4FH0lZZY3bE3Z/a2UQrEnysksNS1DUPFbM+xTeqaenqQBn+APtpRR/SmgCWSc6cCLP6aGEdOMWMNN6LHlkPBE+HjD5OWZIWT4BvB8i3XZTH5SkaNYPHjAHHHNrh5TUpusc+HStTTUmMvJHm8RKPzGMJwDkecVf9Mu5QawdJiyYDmRYvkWSqkyS/4ZS+dXHf83AsGQRMGXAekJDIrsnDJb6N8U1tBMB9Z3fp/pSGD+rDIjVu2tNvJs3krDxff3okDdxThO8b1Ye9szemCNZhHzBtyISkAaK4wy7q92hXWpxhSufyj2eNsGM7F6c+NkjlHh8n4zseoblhdYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ge4+Zjp2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ge4+Zjp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZpqJb2vkqz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 22:01:18 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542A4HVc030671;
	Fri, 2 May 2025 12:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=l4BVd6
	xWzagMIbyTPyk7pywmsK+BN7JPzeovOab1+vc=; b=ge4+Zjp23TatX3wRNkGPkb
	MDzHaLcJmry525VNzVZKhGEPXlKb7YZHyFYHHv2Zc+9CRqnvmVU4Zf66XGgW21Go
	o8TlpG9rOFsH+RsE4ruhsqT0kc9Gmc08uYlFP8X2ekEdzlTaek9EB/RfjVFhJWP0
	/YUqvgidjH+UUX2/QwysqN88a7rIDu3L5U8hzq4INroJjbtFPCBZU4SlBmPokvuG
	kqP+o+RRWwyleKEvVdxBtaDd3qLdYTETtfkK24IQ8exl3HjKx0uT30Cb4FHaEmSy
	ITBOCG3QDBqtk7/KCd8lezTpCWDCG1lWgVSVi0yge+nXUImCZiTS6Nz+WN8QoiHA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cuyk8dac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 12:00:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 542B1bdJ031662;
	Fri, 2 May 2025 12:00:32 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tuhugc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 12:00:32 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 542C0UMv22675856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 12:00:30 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DCF15805F;
	Fri,  2 May 2025 12:00:30 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA79C5805D;
	Fri,  2 May 2025 12:00:26 +0000 (GMT)
Received: from [9.61.251.128] (unknown [9.61.251.128])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 12:00:26 +0000 (GMT)
Message-ID: <90953737-7c8c-4868-984d-30430b5aefaa@linux.ibm.com>
Date: Fri, 2 May 2025 17:30:25 +0530
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
Subject: Re: [PATCH] watchdog: Fix the SOFTLOCKUP_DETECTOR=n case
Content-Language: en-GB
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc: luogengkun@huaweicloud.com, dianders@chromium.org,
        joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <20250430205503.4a316f48@canb.auug.org.au>
 <20250502111120.282690-1-nysal@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250502111120.282690-1-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8ox7mOuU3l5-sahkWNn9UsousUuKWDTb
X-Proofpoint-ORIG-GUID: 8ox7mOuU3l5-sahkWNn9UsousUuKWDTb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA5MSBTYWx0ZWRfX37nvVsHaLAet Na6/O9mXd2MP60p/4O1BffAQrP+1E5wyrO7ceDQ70/8glHEUWPAB7WgMl5P1qc584XndXNE+3Jb zAfv4eroRfMMBk/TNM42FK5ZjGp6nrJ1wF8B1TC4drPEAVSTHQ3KrT1kXq6ldcfosdQrSWwNBzZ
 HT/6X52bZDBrAvDif6I4sP5xmx4yKbtdcsk/FCeQ548LvZH6yskncD3gYthJdYvV21hQ95+iOR1 xLHHlN65k9/2RByUxnynXnH+VhW2ftn0lrCoz19H1Uyl8LBfftx/rKE6OoCFLTGYkte58Z1bLn3 ybdjGGDqAyHLlml16hoOXJJHLgx+fipJXgEjYD3eNPxKpBmOQh/zOOSy5jAqMrWfYB8PJ3AzO0k
 Ptqjk0vZxoY1CY4bls3GVIjudfO2t1+ZwWxCXwvNTNx9gEJjXhur39PVD8uHaVc9S1SeCyzG
X-Authority-Analysis: v=2.4 cv=KYTSsRYD c=1 sm=1 tr=0 ts=6814b3e6 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Oh3Zmkm9Fq4tdngPZlYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020091
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 02/05/25 4:41 pm, Nysal Jan K.A. wrote:
> Update watchdog_thresh when SOFTLOCKUP_DETECTOR=n.
> Additionally fix a build failure in this case as well.
>
> Fixes: 0bff3dababb07 ("watchdog: fix watchdog may detect false positive of softlockup")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
> The "Fixes:" SHA1 points to the commit in mm-nonmm-unstable and will need updating
>
>   kernel/watchdog.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 80d1a1dae27..2d283e92be5 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -923,10 +923,12 @@ static __init void lockup_detector_setup(void)
>   }
>   
>   #else /* CONFIG_SOFTLOCKUP_DETECTOR */
> -static void __lockup_detector_reconfigure(void)
> +static void __lockup_detector_reconfigure(bool thresh_changed)
>   {
>   	cpus_read_lock();
>   	watchdog_hardlockup_stop();
> +	if (thresh_changed)
> +		watchdog_thresh = READ_ONCE(watchdog_thresh_next);
>   	lockup_detector_update_enable();
>   	watchdog_hardlockup_start();
>   	cpus_read_unlock();


Tested this patch, and with this, build is successful. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



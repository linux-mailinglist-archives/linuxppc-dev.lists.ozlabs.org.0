Return-Path: <linuxppc-dev+bounces-10560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B8B19F11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 11:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwX4n6QsCz30Yb;
	Mon,  4 Aug 2025 19:56:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754301369;
	cv=none; b=k3Vr54SWHJRuCZsgjz0YylEJGO2AU2qh+RZWH7i/WLTLJHpeb5zwSH0DaVBT1omgDNzhr2mrRX4R+E4RuZaPU8yai+6I11j6XKIWrBUPEpSMnsRA6S9Eg6fTCuOTNH24Nw5RGRjiHKlnOjWIoeLO1G8MiVIn9N8GLgHBvgwGAdv70SCSBgfkDQosuifcsAvsKUDJCnzILCS62Wi0QhAlLDj0NlJ417PNVO/TYibRpoxpayy4rnjelfjvycwfgO6TNO0g1Oa55nrh5QtmP2XQptWzDjq7bNUkW2GwnQKhDaZ00ivHmNXmXVoEjNnXFReJCnfoA9Eb74125T7+/s03RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754301369; c=relaxed/relaxed;
	bh=pCU8ninXVYcWh4jRTcA9x2LyPI6zCWkcNu6uPo+aMAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy6yB9D0o6lEB+S8btZcnMqD1U63neVwyNy+pBYjJnFWlqgaZRSwQIJobwwaVC/5jWpBSThAcNa3RGwjYnCf8jBGwMHsr/wuxYLE/X4BJHdrlyZhuSwqtUxCmRDeE7xWMm4WYo1gW3sxyssmsHltEUWtixfjZdmVWYtdxf8geswY/L4LRYj9UQt0s6QrHaDqEBEI5aVi+t7G46Hhywp9Hb6EmpaWCZDntTyflNdGCqsUtHND+Uko2pwrot7dPS4Oqxn/ntGLhcqzABbmrusOGZ7e/KOH9c7QERYGNd2q0FeBihzkAEmZ/u8rFZxQ4pj3EUAmJx6A4UJcTWwiMNPiUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ir0NdNZu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ir0NdNZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwX4h6lw7z3069
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 19:56:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57440tJs016552;
	Mon, 4 Aug 2025 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=pCU8ninXVYcWh4jRTcA9x2LyPI6zCW
	kcNu6uPo+aMAE=; b=ir0NdNZucVvuXpjF2uF+lF2Sfdd4gOrU7ZDyeiNeZf7b3C
	aZqAjWZDtmL8SQoPkiVRdxFKmAS33PspooliJZ/itO4L8CN3mCo+fRTMYWW29oVj
	6ywiSSfwEMjJJzDwhTa1xzyvPjMyXV/h3Hfw2a9Ek2z9mFCM1OnjRh+30xC/BCgl
	VWt8FHs3GK7RD7ApNyr4dKvkd+ZWbTWnVjvDEWm+MyCmM5eufdo+0xlG+edfySHG
	D7i3q6tiAcr+2PTFGxhL1JTjGZ1XTnQdnDn9PLhnWnQvJl0UrrUqXjnnq8liCqaw
	duuPG0TKtYF9FnPDQfLYpVfbBQjuy4RQwFWgqrbQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48983t0gk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 09:55:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5749tqos015263;
	Mon, 4 Aug 2025 09:55:52 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48983t0gju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 09:55:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5747KWoZ001780;
	Mon, 4 Aug 2025 09:55:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 489y7kmyd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 09:55:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5749tmUZ50463122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Aug 2025 09:55:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86581214D6;
	Mon,  4 Aug 2025 09:30:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3637E214CE;
	Mon,  4 Aug 2025 09:30:11 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.207.58])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  4 Aug 2025 09:30:11 +0000 (GMT)
Date: Mon, 4 Aug 2025 15:00:09 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/64: Drop unnecessary 'rc' variable
Message-ID: <dtzjm4ngxlmpevlvjadtvnl5kfwxrkngrouxssq6skxvywe2kt@gbi362blsi3k>
References: <20250801035908.370463-1-zhao.xichao@vivo.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801035908.370463-1-zhao.xichao@vivo.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA1MyBTYWx0ZWRfX59lred3ItIuJ
 l+TJxeGn/ThkFpLvxglsoV7g4Umv5aGlYhlmJaOFXomffj56HZFy+gEWC7m6eJgA1EwuZ3YisLL
 S620FrF3f5w5ZVGUwynd+kWrlKAQvM3KBrMMgWLXFCRoZI1lLrrj7B32Igc1Ohr/O1YSOWNBtxO
 ymv+sOHD8NRgla/AZUGYPZYNXsKXszEQqj5wCXStbOyzhPsYe4C6Q7tl4nCHCwXlX7x7pjaYPgN
 XY50v1FZuEjFI94GY0MWTbd27VqRbcbYJ4nHrwZtI8je0Rli7yrKciFjSwvE5WQxclaOv/IP/6z
 MMI0LfbTXXGPfMSihWe7kwe9TnsM2+frwM8H4o0NoZnBh0KvkTRY/XTENdJmBw9LOrtAWzf4O+r
 PDBFkr7Wo4QP7q9RK+3sS5nhoKoxQAj82/T2a3iuB8mjFN9LK4pFgh1xgrA7vNAfKmpbSqYW
X-Proofpoint-GUID: QXtOYMhFiVUaqBtIA3xaCAaw4MCe-WGH
X-Proofpoint-ORIG-GUID: aEElh-yU4m14DDHukNKOmDuIJznMgYWB
X-Authority-Analysis: v=2.4 cv=AZSxH2XG c=1 sm=1 tr=0 ts=689083a9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=VnNF1IyMAAAA:8
 a=95aTRTVSYsbvNN7snPQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=866 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040053
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 01, 2025 at 11:59:08AM +0800, Xichao Zhao wrote:
> Simplify the code to enhance readability and maintain a consistent 
> coding style.
> 
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 7284c8021eeb..8fd7cbf3bd04 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -141,10 +141,7 @@ void __init check_smt_enabled(void)
>  			smt_enabled_at_boot = 0;
>  		else {
>  			int smt;
> -			int rc;
> -
> -			rc = kstrtoint(smt_enabled_cmdline, 10, &smt);
> -			if (!rc)
> +			if (!kstrtoint(smt_enabled_cmdline, 10, &smt))
>  				smt_enabled_at_boot =
>  					min(threads_per_core, smt);
>  		}


Thanks for the cleanup

Acked-by: Gautam Menghani <gautam@linux.ibm.com>

Thanks,
Gautam


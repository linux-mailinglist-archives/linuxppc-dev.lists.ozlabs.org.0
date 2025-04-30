Return-Path: <linuxppc-dev+bounces-8184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44CAA4CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 15:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zncxm4X1zz2xHv;
	Wed, 30 Apr 2025 23:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746018652;
	cv=none; b=RJacqTFf2D8ymETHv64GApOvnFnDf1ad7Ke571baIAjFTT5MtE9fbnZGtd2SQ03bYzehtg1BJYZ9CjahqPYhmAa0obkaGbqaBV6+J64TStmlnVeFBNcJ+ISiiiyDdGRmrnQJq/JKkoyR28vuEek1kKCH8IX0AMIVaup+S44DKEyQJ6GrNBp0xN8ShvamSwRtCqwt3kVBbL3NAOt7Nf78pdQhFjwkD5rYhc/n2IGQzSXGEKI4/LxgW1kYtqS3fawzJOwbuczzKyJl8Tbp7wb5omfBck3BJB74mb3Ygs5ve8xU/eQJB1boUebJLJmwJ9knWdMNjVYD8I9olPkBPPRZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746018652; c=relaxed/relaxed;
	bh=uYW/rgU6sc03ijeeWl4mdDB5hWQMisOGwoLF7BduGvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovXZ7sRNMrNQo4zCQXB0Py92W5BhLFB7ph41H8HIKY14rzjQXLkXgkkSsryV3THJL3UjLL3S9Hv2gJ9VlSarZSGKrsgWmWN98LsaITUCFZRlDzQkifL6D4AHUuUw3e4nvkdMQKc5rl/lMhAFcWS6nghI5/b1wK1Tm02cFJac5xD6xmFH1gOdmVH/9sy6ABsfc57kpW89Zsu+tTl/UZOsb+hd5v2IfrsK/Rhw4E7jW6XdrDJZQvxl2sPPOkGrm/eGGBM6V3P3Q0WWl/Tt1GVkX0dPSKnKj4hsHhr6cdevmlx/VCZuwvgCbxSgyEbEcYUKmSw/50Nm43yM2wv0eEZspg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LVYcOl9a; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LVYcOl9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zncxl5lJBz2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 23:10:51 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UA40wu006015;
	Wed, 30 Apr 2025 13:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=uYW/rgU6sc03ijeeWl4md
	DB5hWQMisOGwoLF7BduGvc=; b=LVYcOl9aDXlViyjqKddKHwM1LTdfDGTK1+IG3
	BQNUYFWNsXers6uJ8SfRTtEd2wPJSpzfAttsqa5qklErQ8tVzHcg9J29NdS/jhtG
	WfHbwfZByKG337u8ZvMAz8wK+mD8M2JQ+S54kFgwkh2Kj9Rf25PMOXtgNU/9ldyH
	I0jfi6kX12ea6oRZF384jzp61BTiZMvC9fmFUl0tsV7cjnrCJQEco7dsaEaKeueQ
	byddnv/g6dS+CbEZ3wvn8h5QlkhajN+BneC8rAyWM9NJjx4/FqMlqopp0JpJcz8L
	3Y5vT6knwuFEE9TOEY60QUA6McbQyuv5AnGB8KPUfY7tbYCuw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjrtk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:10:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53UD1YWl023259;
	Wed, 30 Apr 2025 13:10:18 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bhsjrtjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:10:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U8wFrp024634;
	Wed, 30 Apr 2025 13:10:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1m7pr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 13:10:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53UDAE0J45613366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 13:10:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C78D20043;
	Wed, 30 Apr 2025 13:10:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B44820040;
	Wed, 30 Apr 2025 13:10:11 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 30 Apr 2025 13:10:11 +0000 (GMT)
Date: Wed, 30 Apr 2025 18:40:10 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, peterz@infradead.org,
        fbarrat@linux.ibm.com, ajd@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] powerpc: sysdev: use lock guard for mutex
Message-ID: <aBIhMiNTpu6t8Hej@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
 <20250314114502.2083434-7-sshegde@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250314114502.2083434-7-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dcuA3WXe c=1 sm=1 tr=0 ts=6812213b cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=ZHvBtOU28Z4fw6L-_00A:9
 a=wPNLvfGTeEIA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 1hNkNEucwBhGvQp6cbbZvQ1YmnzcYRJz
X-Proofpoint-ORIG-GUID: kYjYSclzroQ3zX_EpgIOYqwBbjnpYgJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5NCBTYWx0ZWRfX9d6sCjSrZMYY ZuoKLtp1KjbKYkWwv+lFjRMB6R1wtoeltPFIhyMz1Oof2RsZofcfaDNApAj3nhSzHiN17Y0lNbg jCHhWZ1z3nKDyPBm/IQhLUo1zqWy9QkFj/KlBqdeMoS681VAW/pBQFZEQWTnmhz9ZzhNHUuLRBn
 Pu2ZP5AU7TGIf5BsplF1bzqyyhhl7dQhqWvEg9nP1L/0C1m2pkoAl3T1/14WSDlUip0iaEUw+Cu eRHQ3cqW14a0AbDKwDtv0+w22KkQk27NdQETxSPif2A+aWPF+q3o1s3rbkszfALl+iTLeVQKk99 rAay3aCi6gMA7/DmNkjHLZeG/CuzOjVxg21aIbWgVLCYNUGn/w3KC/oB3h+MvCDTTDKbObe7zeB
 ub3W/Zjttc+4u7jRGLa3Ax0PKLEMznUUpORbj1xihoeImLM4zv9IXcOu+5twBbHMLivSWWdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=714 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300094
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Shrikanth Hegde <sshegde@linux.ibm.com> [2025-03-14 17:15:02]:

> use guard(mutex) for scope based resource management of mutex
> This would make the code simpler and easier to maintain.
> 
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
> index ce6c739c51e5..bbfc7c39b957 100644
> --- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
> +++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
> @@ -75,7 +75,7 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>  	if (kstrtoll(buf, 0, &interval))
>  		return -EINVAL;
>  
> -	mutex_lock(&sysfs_lock);
> +	guard(mutex)(&sysfs_lock);
>  
>  	if (fsl_wakeup->timer) {
>  		disable_irq_wake(fsl_wakeup->timer->irq);
> @@ -84,14 +84,12 @@ static ssize_t fsl_timer_wakeup_store(struct device *dev,
>  	}
>  
>  	if (!interval) {
> -		mutex_unlock(&sysfs_lock);
>  		return count;
>  	}

Nit: Here and the next change, due to the current change, there is no need
for curly braces.

Other than this nit looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

-- 
Thanks and Regards
Srikar Dronamraju


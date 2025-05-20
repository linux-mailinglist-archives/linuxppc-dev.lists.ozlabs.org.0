Return-Path: <linuxppc-dev+bounces-8710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3095ABCDC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 05:19:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1ftB1jC1z2yrQ;
	Tue, 20 May 2025 13:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747711170;
	cv=none; b=TI8Uh4oALv9z4AxS3aZZc+JSXjBcKSLvTvxJCkFoJgSucY2jGxVZ8ExlGErtrfVL2tUAvJvhn9irfd5cXGUp2p93rre6bZ5tSy4ICx8vvuP47K4IMSFRxnlPqgPsBX8ZPd9uvn3N6EhMAz4OX9A13akHqCh+8msx0bR2b9NWZMbqwsw9me0yDm3JMXWaTVMHyl8+N4z5f2IMWYVbshalWSZZekkrgh2C+FB2NUi1zajtpuj2Xj37Vke02G0lo4SE3GVAahgXCwvqofPb3muykG/D9hfAdis20sK2SI3hcgSJ7AZFXBOykFYDzI9+yFKCB948rujGcv1JDJ+W9Y01uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747711170; c=relaxed/relaxed;
	bh=m2gIUYyBgS95RQQMEUcdYsXFWdcdNysYXDQqt/Nv5io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGTltzd+XBWKiD0GvcAUEtr/L7QvSFx0FEaQfMbm7rRGKGx6WEl5cz0S1moy66Aj7I+x7ElcZlKgmLy1Bo9AB/laslM1rmCvvPwgdKfzHyEY4/LcAa5aLBng6LyJSNiU+YLxPqlLlc1u0WqhpUJmI4f5mFrDUgpkQL8cWy639Ng4QQpNjnKy1m6LpkitjbBfoo+uoNOV6u71PSHob2nCR0ff0cYNf6MzS/oZEV5J1teix/W7i221t+No8L5uk5tq2ZyvSz3nQjKahbFVi3E82X7K9lQUWuHCXlgB7V+5QlOkwF3iGbP/MCEuvBwiWSotCBFe9KXP5TeLwP8XoJwmTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CACJp3Z5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CACJp3Z5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ft93Zqkz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 13:19:29 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JIoIxV013642;
	Tue, 20 May 2025 03:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=m2gIUYyBgS95RQQMEUcdY
	sXFWdcdNysYXDQqt/Nv5io=; b=CACJp3Z5Y0fiO7Go3tsxcty5zwhM28b7C1Wzs
	Fgot7rSQ16RLhP/EG9M7P3TZOigY6R5oZWeDeI2peDNH8GK3hOGGIfpk4fEcbOAN
	iiOEYfvaN3d/BR5bjZIJ1pbyyDtqL1Ozc4woAoL/gUAOT0px9f1RHhB6IfZuMbrm
	UiATARsuIiEuE7z44Z++9AdNMLuB87ozmT8PqgnYL7eSyV3xF85qdSiltVxAmU1+
	hiaS3tPEUUmYIWhvUbkZBJ99vvQ9lzZ04XlmsHM1jiD6b5ZQz3JKesNJ50trt0qz
	NAEL6WROp8snwfYoDtm6ggPe6dgfh5wLYw3QZqVO22XhDp1YA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 03:19:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54K3J73Y019225;
	Tue, 20 May 2025 03:19:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ra99hq9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 03:19:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54JN6uRm007225;
	Tue, 20 May 2025 03:19:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k9k2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 03:19:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54K3J4wt34341582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 03:19:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D04C620040;
	Tue, 20 May 2025 03:19:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4899D20043;
	Tue, 20 May 2025 03:19:00 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.218.163])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 20 May 2025 03:19:00 +0000 (GMT)
Date: Tue, 20 May 2025 08:48:57 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, "Oliver O'Halloran" <oohall@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Maciej Falkowski <maciej.falkowski@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
        linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 6/6] powerpc/eeh-powernv: fix potential OoB
Message-ID: <3wfa4z2uozeg4bhu47uipn7mqjuaspxxvjsb7gfpwxbgjfivat@lr6lh5gpht7m>
Reply-To: mahesh@linux.ibm.com
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-7-markus.burri@mt.com>
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
In-Reply-To: <20250508130612.82270-7-markus.burri@mt.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=J/mq7BnS c=1 sm=1 tr=0 ts=682bf4ac cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=02EIq6OHAAAA:8 a=VnNF1IyMAAAA:8 a=uC_ZhKPKdcj-b1_MkeYA:9 a=CjuIK1q_8ugA:10
 a=vbqWBO59iwVkzqU4rnh-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAyNCBTYWx0ZWRfX+JFPH1t1qErO yq1THqtaDHBTugOHb5q8YHF3TI7HXvDNNqKKBtHRsgq3oqIyZpyB3MVeFusPJ/JeV2USGFok5jl a+r8UyHCAqx9AKwKeKigFVL5xjuNonDdak9cl7T3TjKm38Sn3afEMQT07+lGkuzf0nd+BWmANDq
 9hK6qUxgOqjMnJzLhUfL8AI7AObqoljSL2w77nNZfUNUZJlxvuPgn/iPeV7LYjdCGK6rxqQ4+H2 iC3HK4pSSsrd67bg+d4pxbFe81nMv8BJr6DY+/lXx+QiZvpRqTROqkTIXo1u8UdXFfjFie9QUKx HtbPrngZHtAbkCSYnz/yXH9B0xToyhBGOh6qtwrPYfa7L4FD1IF9ksKzqjd6xaDggmHw0DtfX2r
 /D8pdTl5dEvvwMHH2l6fk8tvUToL5idCNlLRpS2wZJ4yfXeV5DP1eZAjWBnSavQXUdJBpk5g
X-Proofpoint-ORIG-GUID: lPEI4Yq43fuJeUhtFgRjRhA4gLGAQBSA
X-Proofpoint-GUID: Udv_LAj6XDkTY2t_olBZEJaLHOagX977
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-08 15:06:12 Thu, Markus Burri wrote:
> The buffer is set to 50 characters. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> To protect from OoB access, check that the input size fit into buffer and
> add a zero terminator after copy to the end of the copied data.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Looks perfect to me.

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> ---
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index db3370d1673c..3abee21fdd05 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -73,14 +73,19 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
>  	char buf[50];
>  	int ret;
>  
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
>  	if (!eeh_ops || !eeh_ops->err_inject)
>  		return -ENXIO;
>  
>  	/* Copy over argument buffer */
> -	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
>  	if (!ret)
>  		return -EFAULT;
>  
> +	buf[ret] = '\0';
> +
>  	/* Retrieve parameters */
>  	ret = sscanf(buf, "%x:%x:%x:%lx:%lx",
>  		     &pe_no, &type, &func, &addr, &mask);
> -- 
> 2.39.5
> 
> 

-- 
Mahesh J Salgaonkar


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E751B7B53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 18:20:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497zt40SmczDqRx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 02:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497zpY6F5tzDqNP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 02:17:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OG1GlF134592
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:17:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghua7vg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:17:21 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03OG2LwI138258
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:17:21 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghua7vfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 12:17:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03OGF9l6024517;
 Fri, 24 Apr 2020 16:17:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 30fs67qh9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 16:17:20 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OGHI3Z8782332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 16:17:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 184AFBE05F;
 Fri, 24 Apr 2020 16:17:19 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1D54BE068;
 Fri, 24 Apr 2020 16:17:18 +0000 (GMT)
Received: from localhost (unknown [9.85.163.64])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 16:17:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] powerpc/eeh: fix pseries_eeh_configure_bridge()
In-Reply-To: <3944bede1195f62f887436a3e4150b06894d6e62.1587704308.git.sbobroff@linux.ibm.com>
References: <cover.1587704308.git.sbobroff@linux.ibm.com>
 <3944bede1195f62f887436a3e4150b06894d6e62.1587704308.git.sbobroff@linux.ibm.com>
Date: Fri, 24 Apr 2020 11:17:17 -0500
Message-ID: <871rocluya.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_08:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=1 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240122
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> If a device is hot unplgged during EEH recovery, it's possible for the
> RTAS call to ibm,configure-pe in pseries_eeh_configure() to return
> parameter error (-3), however negative return values are not checked
> for and this leads to an infinite loop.
>
> Fix this by correctly bailing out on negative values.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 893ba3f562c4..9ea1c06a78cd 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -607,6 +607,8 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
>  
>  		if (!ret)
>  			return ret;
> +		if (ret < 0)
> +			break;
>  
>  		/*
>  		 * If RTAS returns a delay value that's above 100ms, cut it
> @@ -627,7 +629,7 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
>  
>  	pr_warn("%s: Unable to configure bridge PHB#%x-PE#%x (%d)\n",
>  		__func__, pe->phb->global_number, pe->addr, ret);
> -	return ret;
> +	return rtas_error_rc(ret);

See my response to patch #1. I think the best you can do here right now
is return -EINVAL for -3, -EIO for any other (unarchitected) negative
value.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0566310BAB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 14:18:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXGFh0l3ZzDvb9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 00:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LDfP/FXJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXGB32tc4zDvVp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 00:15:22 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115D4GnO013180
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Feb 2021 08:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=sNfMTNw0ZDUfYNdAOL32//cJ5jkxk7S4ma1kN2bKT2E=;
 b=LDfP/FXJcJqJmSZ3zeUFYiPqtPNXWUGJksdf+Xj43pG511DKNJ3JWtpJZpoPiglBLm67
 LlhWpHKCKEJ27DlMeOUTueg7WNOWgDB7NXyPk6UwRPHQ+iGTgvVpCgdLHKUz/W3e2R/X
 hxJ/SjrBDFYw1AhLxRTCpkT87oxlFzA9YMkoJEwjDjmO098uFuA11ov61wTxMaAb7uXH
 2KdsiRROy+BUPiXxOQwmz76v9+8t9p269m4g/nYMNtTCMAelVeAkSTVr++rY3QRtZBQq
 hk14O9oFoHa0CuuP1o+MSxVk8E4q8Kmvz39Hpk4JuYGHUJXMFalTKfvFcxb/XnW8STyw 0A== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h5tv1w9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 08:15:19 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115D8Pw2019834
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Feb 2021 13:15:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 36eu8rbqs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 13:15:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115DFH3l25755934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 13:15:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A910DAE05C;
 Fri,  5 Feb 2021 13:15:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68789AE062;
 Fri,  5 Feb 2021 13:15:17 +0000 (GMT)
Received: from localhost (unknown [9.211.46.77])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 13:15:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/dlpar: handle ibm, configure-connector
 delay status
In-Reply-To: <20210107025900.410369-1-nathanl@linux.ibm.com>
References: <20210107025900.410369-1-nathanl@linux.ibm.com>
Date: Fri, 05 Feb 2021 07:15:16 -0600
Message-ID: <87im76wt97.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_07:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050083
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Scott Cheloha <cheloha@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> dlpar_configure_connector() has two problems in its handling of
> ibm,configure-connector's return status:
>
> 1. When the status is -2 (busy, call again), we call
>    ibm,configure-connector again immediately without checking whether
>    to schedule, which can result in monopolizing the CPU.
> 2. Extended delay status (9900..9905) goes completely unhandled,
>    causing the configuration to unnecessarily terminate.
>
> Fix both of these issues by using rtas_busy_delay().
>
> Fixes: ab519a011caa ("powerpc/pseries: Kernel DLPAR Infrastructure")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Just following up and adding some people to cc in hopes of getting some
review for this.


> ---
>  arch/powerpc/platforms/pseries/dlpar.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 16e86ba8aa20..f6b7749d6ada 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -127,7 +127,6 @@ void dlpar_free_cc_nodes(struct device_node *dn)
>  #define NEXT_PROPERTY   3
>  #define PREV_PARENT     4
>  #define MORE_MEMORY     5
> -#define CALL_AGAIN	-2
>  #define ERR_CFG_USE     -9003
>  
>  struct device_node *dlpar_configure_connector(__be32 drc_index,
> @@ -168,6 +167,9 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
>  
>  		spin_unlock(&rtas_data_buf_lock);
>  
> +		if (rtas_busy_delay(rc))
> +			continue;
> +
>  		switch (rc) {
>  		case COMPLETE:
>  			break;
> @@ -216,9 +218,6 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
>  			last_dn = last_dn->parent;
>  			break;
>  
> -		case CALL_AGAIN:
> -			break;
> -
>  		case MORE_MEMORY:
>  		case ERR_CFG_USE:
>  		default:
> -- 
> 2.29.2

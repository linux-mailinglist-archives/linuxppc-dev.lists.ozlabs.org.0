Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F4104584
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 22:12:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JFkP4wTjzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 08:11:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JFhF1lpTzDqnR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47JFhF0Zqzz8wVy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:10:05 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47JFhF07nJz9sPT; Thu, 21 Nov 2019 08:10:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47JFhD3m9nz9sPL
 for <linuxppc-dev@ozlabs.org>; Thu, 21 Nov 2019 08:10:03 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKL0w66064065; Wed, 20 Nov 2019 16:09:52 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wadmytm7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 16:09:52 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAKL5qBG021318;
 Wed, 20 Nov 2019 21:09:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2wa8r787k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 21:09:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKL9onI52429092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 21:09:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77C9F7805C;
 Wed, 20 Nov 2019 21:09:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE287805E;
 Wed, 20 Nov 2019 21:09:49 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.47.117])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Nov 2019 21:09:49 +0000 (GMT)
Subject: Re: [PATCH] of: unittest: fix memory leak in attach_node_and_children
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@ozlabs.org
References: <20191114184334.2866770-1-erhard_f@mailbox.org>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <6de4752a-1601-fd48-f9c8-522652a2da92@linux.ibm.com>
Date: Wed, 20 Nov 2019 13:09:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114184334.2866770-1-erhard_f@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911200173
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/14/19 10:43 AM, Erhard Furtner wrote:
> In attach_node_and_children memory is allocated for full_name via
> kasprintf. If the condition of the 1st if is not met the function
> returns early without freeing the memory. Add a kfree() to fix that.
> 
> Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>

Michael provided instructions about what needs to be done with a v2 spin of your
patch to get it upstream. Please feel free to include my reviewed-by as well.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  drivers/of/unittest.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 92e895d86458..ca7823eef2b4 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1146,8 +1146,10 @@ static void attach_node_and_children(struct device_node *np)
>  	full_name = kasprintf(GFP_KERNEL, "%pOF", np);
> 
>  	if (!strcmp(full_name, "/__local_fixups__") ||
> -	    !strcmp(full_name, "/__fixups__"))
> +	    !strcmp(full_name, "/__fixups__")) {
> +		kfree(full_name);
>  		return;
> +	}
> 
>  	dup = of_find_node_by_path(full_name);
>  	kfree(full_name);
> 


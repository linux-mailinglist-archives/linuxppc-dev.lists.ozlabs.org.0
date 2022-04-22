Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C379150C09C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 22:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlQRB4wCjz3bpr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 06:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvnxrbbV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mvnxrbbV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlQQP5TKvz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 06:06:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23MGZk40019136; 
 Fri, 22 Apr 2022 20:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g01tJpX+1sUJrShvusZ25PsNMnRVj5xBSlaI7IJ1xUQ=;
 b=mvnxrbbVXpitGlqiGtXYbaR+2eXCb4YE2sBg+edSMz5Sheu1gKJ1p3/fMhGYk5N+R2Ha
 S+DxE751yzK9lBGxTAa7xpc0V7/xro5VuhtAsphPBlw2Mwg20roZvhPccS4uDCs8JPt2
 C44YYSY74g0gKWezeEmBtyzGF4R1hmNVd1NyrSLoy3ZOP55A6htJvZg2P4bTMUGzpa/j
 CICEJAq26SDqgZUcdH+X7IBB7Q1iMFd/kra5fF4Enbpm/gyrhBy7XqLN0YXg04cWoYUj
 A5sornFu+xaJ6UJ1ckZ4vtBeSofeqTQsjRnPaDug0mQ1+7jQlwtp9hDpWGHUJAGzBO3I oQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fkvdv8jhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 20:05:55 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23MK1Vda000830;
 Fri, 22 Apr 2022 20:05:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3ffneaw6t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 20:05:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23MK5sW528049704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 20:05:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FF926A05A;
 Fri, 22 Apr 2022 20:05:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB1B86A04D;
 Fri, 22 Apr 2022 20:05:52 +0000 (GMT)
Received: from [9.160.2.163] (unknown [9.160.2.163])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 22 Apr 2022 20:05:52 +0000 (GMT)
Message-ID: <c4613523-de98-b824-175a-89fd66931bd6@linux.ibm.com>
Date: Fri, 22 Apr 2022 13:05:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] powerpc/pci: Remove useless null check before call
 of_node_put()
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <1650509529-27525-1-git-send-email-baihaowen@meizu.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <1650509529-27525-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K0jsygH_2k__2G2zY9heq5s1_kNUdsHt
X-Proofpoint-ORIG-GUID: K0jsygH_2k__2G2zY9heq5s1_kNUdsHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_06,2022-04-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=657 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220085
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/22 19:52, Haowen Bai wrote:
> No need to add null check before call of_node_put(), since the
> implementation of of_node_put() has done it.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  arch/powerpc/kernel/pci_dn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 61571ae23953..ba3bbc9bec2d 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -357,8 +357,8 @@ void pci_remove_device_node_info(struct device_node *dn)
> 
>  	/* Drop the parent pci_dn's ref to our backing dt node */
>  	parent = of_get_parent(dn);
> -	if (parent)
> -		of_node_put(parent);
> +
> +	of_node_put(parent);

This whole block of code looks useless, or suspect. Examining the rest of the
code for this function this is the only place that parent is referenced. The
of_get_parent() call returns the parent with its refcount incremented, and then
we turn around and call of_node_put() which drops that reference we just took.
The comment doesn't do what it says it does. If we really need to drop a
previous reference to the parent device node this code block would need to call
of_node_put() twice on parent to accomplish that.

A closer examination is required to determine if what the comment says we need
to do is required. If it is then the code as it exists today is leaking that
reference AFAICS.

-Tyrel

> 
>  	/*
>  	 * At this point we *might* still have a pci_dev that was


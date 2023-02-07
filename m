Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FC68DCAD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 16:15:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB6BJ3rR6z3cgv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:15:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aUnamm0K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aUnamm0K;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB69L2ysTz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 02:14:14 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317EjlkS038743
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Feb 2023 15:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=QNhAfa4EAWp9mBJby3943WBxHFVDrzOiWYsm9ghslBE=;
 b=aUnamm0KHS/dGD1tDRvRELUp0bfWIWKvF8bbK6jeib3eH6XRjNygx8w+0VBNVwoNTm4h
 0V0XjMxNnLwEdq6c/ZRM0M5PfURV9xHA92Wb8zLcMsbynAopsBPKEmC4a66Zc1sVR9Km
 TxD65oC3cTYQvZMFowBjPCVG8oNeaDCOThliSmbtp6mBD5peB/PaBjqu4ulrp2zqaQY/
 zl/oa73PMymgZ1lpxxtXLKaVPzl9Re54Xgk7nVa60yB583qb3VekPnd029fxRHZZ4/L8
 qcK9IQ0cp4kyb5Nz2fvYYhSQ8DEOQ7lcfFjopFitAAPKECwB212qmgl7eY/7xikj+RUn yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkrpp14d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 15:14:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317Ejq6v039744
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Feb 2023 15:14:11 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkrpp14ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 15:14:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317DqqfM019586;
	Tue, 7 Feb 2023 15:14:10 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nhf07vpcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 15:14:10 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 317FE89W31719762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 15:14:08 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB77E5805C;
	Tue,  7 Feb 2023 15:14:08 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AE8658054;
	Tue,  7 Feb 2023 15:14:08 +0000 (GMT)
Received: from localhost (unknown [9.163.2.97])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Feb 2023 15:14:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Fix device node refcounting
In-Reply-To: <20230201195856.303385-1-brking@linux.vnet.ibm.com>
References: <20230201195856.303385-1-brking@linux.vnet.ibm.com>
Date: Tue, 07 Feb 2023 09:14:08 -0600
Message-ID: <87zg9po6db.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GeE_dqEr_bNj1bZGBGnW6FXoTgy8Xe5z
X-Proofpoint-GUID: Osih6hePkQK2SN8gUThVTOWBETQ8lpet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070135
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, mmc@linux.vnet.ibm.com, nnac123@linux.ibm.com, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


(cc'ing a few possibly interested people)

Brian King <brking@linux.vnet.ibm.com> writes:
> While testing fixes to the hvcs hotplug code, kmemleak was reporting
> potential memory leaks. This was tracked down to the struct device_node
> object associated with the hvcs device. Looking at the leaked
> object in crash showed that the kref in the kobject in the device_node
> had a reference count of 1 still, and the release function was never
> getting called as a result of this. This adds an of_node_put in
> pSeries_reconfig_remove_node in order to balance the refcounting
> so that we actually free the device_node in the case of it being
> allocated in pSeries_reconfig_add_node.

My concern here would be whether the additional put is the right thing
to do in all cases. The questions it raises for me are:

- Is it safe for nodes that were present at boot, instead of added
  dynamically?
- Is it correct for all types of nodes, or is there something specific
  to hvcs that leaves a dangling refcount?

Just hoping we're not stepping into a situation where we're preventing
leaks in some situations but doing use-after-free in others. :-)

>
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/reconfig.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
> index 599bd2c78514..8cb7309b19a4 100644
> --- a/arch/powerpc/platforms/pseries/reconfig.c
> +++ b/arch/powerpc/platforms/pseries/reconfig.c
> @@ -77,6 +77,7 @@ static int pSeries_reconfig_remove_node(struct device_node *np)
>  	}
>  
>  	of_detach_node(np);
> +	of_node_put(np);
>  	of_node_put(parent);
>  	return 0;

In a situation like this where the of_node_put() call isn't obviously
connected to one of the of_ iterator APIs or similar, I would prefer a
comment indicating which "get" it balances. I suppose it corresponds to
the node initialization itself, i.e. the of_node_init() call sites in
pSeries_reconfig_add_node() and drivers/of/fdt.c::populate_node().

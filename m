Return-Path: <linuxppc-dev+bounces-5563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C5A1C7A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jan 2025 13:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ygqsg1nhbz2xjd;
	Sun, 26 Jan 2025 23:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737892919;
	cv=none; b=GHZy8d4TVUAUImhXSQzllcylZrY1xKz7f/CqjK1ncEao8kMWviOBJpekiSCSuWidBoR4jf9Ua61oQXtVAkZO4SzPLF/vHZtRRjcuMvAnHPJ2DskpIh/Oemn0jqb/KHvRzfflAy7srJw8DKaiA6+/eoYLkGHFKt4GE1pFVFjZCOW774Zq79W1rsiO9HL4QW7TQwK9utg2L274s8YvuvEi3NjukfDybVdwRjrnP8geenj461Ar4w0PFs1WdkT7DPZQQGDsk9wfHO90KKEVG3sA+HDbmAXWXAHcjW1dZu50N6Z0IGNHbBmVF+FIZ0SlGzHSeK32KjxrBXD5PTtrpppW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737892919; c=relaxed/relaxed;
	bh=rioXlv22BaDeiwlJEM11PSjiQyxwkIje7ifIcBvxiyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTl8XuAnBctGUGn1+fPP4cucImMySuXMLQ/yBy8A5/uLhT51GlcWMTv6LDOjP3WDixcnhbXQaxwzbDYRv5LbOhHuozA9zavqUa/ihCJRdQD7DhlCosqz23k5WKVJZTxQk24Z2GlzN6859jy/aT4dNNeMjgbn+TvyufCM/smIJByNmcylue5hMMMofX9H5N7TFE8gO2DnBmde9yimjOmrDsZgd1CSZjBotn4qu64U+RC7n3KLules3dSreLRDlj6Mykn4fFa1h/06bqhj4KbxSAJ2BzMQnFLRdjGVn+ObzzZxjhrv2oI6vi8A7PMcqPIct0glg3IYDdcFfNPywpRzYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rpDYd0eU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rpDYd0eU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ygqsf1Hfvz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2025 23:01:57 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50Q6tV9w027178;
	Sun, 26 Jan 2025 12:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=rioXlv22BaDeiwlJEM11P
	SjiQyxwkIje7ifIcBvxiyY=; b=rpDYd0eU9Q9GQvM2yfE+g1qZ9+kBgPAWB2FZ0
	4vdOttFhxdVORJEJqh0Md9ZNn5VFqXFepxKn3+pRbdDlNwDQwsSZ8hIpLGWRQoqh
	fFZTIrPvLcvoUti4vTmK9LfnA62ly4u7yQmW8/o0/bQ30R7VIGvKlDGhtktG/waO
	dsU8lUICKRxzLD5Ty65pEUJKIBqsSqr2kjerPdHlJhtrgbU+RlMR74PPxuTiANlc
	AtFlpKWkFkLXPMDSeXNiMnbeiCnoB8zdjMikKnVJXDYMGvdXKYsPJJg4HpEwV++/
	gtxuaSvuLWrX7Rs13gKQjXl3dTZugt+BDSM2ifV/cylHakzTw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44db491n6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jan 2025 12:01:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50QBjhdX028045;
	Sun, 26 Jan 2025 12:01:47 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44dbsk1sqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jan 2025 12:01:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50QC1hLB45482368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 26 Jan 2025 12:01:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F3242004B;
	Sun, 26 Jan 2025 12:01:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2977C20040;
	Sun, 26 Jan 2025 12:01:41 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.211.114])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 26 Jan 2025 12:01:40 +0000 (GMT)
Date: Sun, 26 Jan 2025 17:31:32 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Avnish Chouhan <avnish@linux.ibm.com>,
        Brian King <brking@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 4/4] Documentation/powerpc/fadump: add additional
 parameter feature details
Message-ID: <meqtpejxbyj447ec3l4fzh4dmcnigwrs7ptkddzu2ajctqfvru@k3cebam5uu57>
Reply-To: mahesh@linux.ibm.com
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
 <20250123114254.200527-5-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123114254.200527-5-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7axMyJi0XorRHeGI8oXck-gToL2WZyEz
X-Proofpoint-ORIG-GUID: 7axMyJi0XorRHeGI8oXck-gToL2WZyEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-26_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501260096
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-23 17:12:54 Thu, Sourabh Jain wrote:
> Update the fadump document to include details about the fadump
> additional parameter feature.
> 
> The document includes the following:
> - Significance of the feature
> - How to use it
> - Feature restrictions
> 
> No functional changes are introduced.
> 
> Cc: Avnish Chouhan <avnish@linux.ibm.com>
> Cc: Brian King <brking@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-kernel-fadump |  3 ++-
>  .../arch/powerpc/firmware-assisted-dump.rst   | 22 +++++++++++++++++++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
> index 2f9daa7ca55b..b64b7622e6fc 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-fadump
> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
[...]
> +-- Support for Additional Kernel Arguments in Fadump
> +   Fadump has a feature that allows passing additional kernel arguments
> +   to the fadump kernel. This feature was primarily designed to disable
> +   kernel functionalities that are not required for the fadump kernel
> +   and to reduce its memory footprint while collecting the dump.
> +
> +  Command to Add Additional Kernel Parameters to Fadump:
> +  e.g.
> +  # echo "nr_cpus=16" > /sys/kernel/fadump/bootargs_append
> +
> +  The above command is sufficient to add additional arguments to fadump.
> +  An explicit service restart is not required.
> +
> +  Command to Retrieve the Additional Fadump Arguments:
> +  e.g.
> +  # cat /sys/kernel/fadump/bootargs_append
> +
> +Note: Additional kernel arguments for fadump with HASH MMU is only
> +      supported if the RMA size is greater than 768 MB. If the RMA
> +      size is less than 768 MB, the kernel does not export the
> +      /sys/kernel/fadump/bootargs_append sysfs node.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

> +
>  Implementation details:
>  -----------------------
>  
> -- 
> 2.48.1
> 
> 

-- 
Mahesh J Salgaonkar


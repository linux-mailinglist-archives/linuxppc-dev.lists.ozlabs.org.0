Return-Path: <linuxppc-dev+bounces-6020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A3A2E536
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 08:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrwq62Nmmz2ykT;
	Mon, 10 Feb 2025 18:16:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739171778;
	cv=none; b=QmKY7w+NK8Xx+REw1/i9kTLnPKU89DhX1xD4Ct++70CoMl6T+vF5b59Okbnko0aCLK54T1jQx2HtSZtgsuf9fLOeEjlnIiTXGmgImUnUCw8pRlFuoQy1FKoudnyoqhuNiR7ZWvw+FvpA1PfL1NXGqOA+gIhSqYOBSY5Rej7+hkJ/36qI0mMvv9leuPMJVdSkM6Nh2GY343Pg2iAiY115kLqaVXmbpMvgId7tjmmLL26ayyLTKoEohHDCDTZs3RrAAWNQ8/18pHid9ptzUWcY/ifbVCaMbPpB8kRcaHAx/o2s+M09qaA7FfjnpbV5caF9ywgZBKpyrUjcmbAID5UHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739171778; c=relaxed/relaxed;
	bh=ZEGOILOpJfdgDP7CF5bk0UQx+n0rroOkfXFOv9GtQnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6DNvZP0yuxZul1Mx0pWqqP50lhURjwWwNnJB6OVPrat9VjkffBe/tDW09tPkgzx0cBb/b9qH9sLUB8DDp2YgTWRLgh3+UYbVWElTGnyspyn/HMESH5l78Vwn6GNF1RuQh4EsdRDO9Oz7XjXErExQ2wZx0FjtluN7FhBD/i3sKY+wN1K4uInOaL2ES6Zu1x69rfptTYst5RkWUJ9QCzq9Sx+cpVg/fQlnlsv8zOoc3bNQhfgufXb5HVYC0XYNIqgpDS8WzAOBft86mrGy5r/515KRXAa5ff82BNzXq8pm5O9NCmaW0PojSCyXdLyQfi95/Wsg04eE51RDL37ay5Pgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbFhU7Gj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbFhU7Gj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrwq52rQRz2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 18:16:17 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A18XNj025075;
	Mon, 10 Feb 2025 07:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZEGOIL
	OpJfdgDP7CF5bk0UQx+n0rroOkfXFOv9GtQnU=; b=jbFhU7Gj6P+x/EYTIGox04
	VP1HSuO0Kloaq4fnTpgKixLxlmPdqee6UHbwwAKMjD9k2OeKmk0kPjmW0sgu3gBN
	hb/PWSYKKvpe6E6ZkbXmniwdJtG/Onp23XgY+oH54Vzf6cmkADCyT6GW5yMRY8VY
	xGPsJDl3TxYJyHKcYgFKH+oSJODVkpJYmi8im0PqldIBeBlsX9egy+sj1xo/Jqpx
	n9jPQ3+xLg9cxYTjToMIv8w8wYowLC3Q9yB7R6Pj4WtLsvzAmhmr5J9dvIE6MlLP
	69SW0NwN9lim+vRHw7tdMpMLqU9DCncWoIWSCxXYwE/zRQAM1K8T3RJGqXIKujzg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q7h999k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:16:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5Hu9I011677;
	Mon, 10 Feb 2025 07:16:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pktjmuhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:16:08 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51A7G4RG29753606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 07:16:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3107A20144;
	Mon, 10 Feb 2025 07:16:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8314E20143;
	Mon, 10 Feb 2025 07:16:02 +0000 (GMT)
Received: from [9.203.114.244] (unknown [9.203.114.244])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 07:16:02 +0000 (GMT)
Message-ID: <a99f2ed0-ebd0-48eb-83bd-3798de8cb28a@linux.ibm.com>
Date: Mon, 10 Feb 2025 12:46:00 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] Documentation/powerpc/fadump: add additional
 parameter feature details
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Avnish Chouhan <avnish@linux.ibm.com>, Brian King <brking@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>
References: <20250123114254.200527-1-sourabhjain@linux.ibm.com>
 <20250123114254.200527-5-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
Disposition-Notification-To: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250123114254.200527-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EyXoqttzO36BxaxnGZMqsg5bBjCtH3X1
X-Proofpoint-ORIG-GUID: EyXoqttzO36BxaxnGZMqsg5bBjCtH3X1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100057
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Sourabh,

Thanks for updating the documentation..

On 23/01/25 5:12 pm, Sourabh Jain wrote:
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
>   Documentation/ABI/testing/sysfs-kernel-fadump |  3 ++-
>   .../arch/powerpc/firmware-assisted-dump.rst   | 22 +++++++++++++++++++
>   2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
> index 2f9daa7ca55b..b64b7622e6fc 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-fadump
> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> @@ -55,4 +55,5 @@ Date:		May 2024
>   Contact:	linuxppc-dev@lists.ozlabs.org
>   Description:	read/write
>   		This is a special sysfs file available to setup additional
> -		parameters to be passed to capture kernel.
> +		parameters to be passed to capture kernel. For HASH MMU it
> +		is exported only if RMA size higher than 768MB.
> diff --git a/Documentation/arch/powerpc/firmware-assisted-dump.rst b/Documentation/arch/powerpc/firmware-assisted-dump.rst
> index 7e37aadd1f77..7e266e749cd5 100644
> --- a/Documentation/arch/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/arch/powerpc/firmware-assisted-dump.rst
> @@ -120,6 +120,28 @@ to ensure that crash data is preserved to process later.
>      e.g.
>        # echo 1 > /sys/firmware/opal/mpipl/release_core
>
    > +-- Support for Additional Kernel Arguments in Fadump

"Support to add additional kernel parameters to FADump capture kernel" ?

> +   Fadump has a feature that allows passing additional kernel arguments
> +   to the fadump kernel. This feature was primarily designed to disable
> +   kernel functionalities that are not required for the fadump kernel
> +   and to reduce its memory footprint while collecting the dump.

The below details are more appropriate in "Sysfs/debugfs files:" section
with the details going under /sys/kernel/fadump/bootargs_append:

> +
> +  Command to Add Additional Kernel Parameters to Fadump:

Do those words really need to start with Uppercase?

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
> +

- Hari


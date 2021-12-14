Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 809F6473BF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 05:27:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCljT2QwCz3cDS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 15:27:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RW23+ZjW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RW23+ZjW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JClhl4bJTz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 15:27:18 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BE3hbfT007256
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IHGQ661fvkyvCR8RJjKR6+juNLT2pxtcuSyLQzfjXmg=;
 b=RW23+ZjWaDn1v9CLNKneVUkjmZY5v9mSlDeDgBkQY6M3dPdxyI6eXbwW6wQFlz31PgCX
 9KZ9glguNb1OjC2oz0REg/3xI/+ODLQfJ5l6EDdnUBclIVL3a7KxloGjDrb8WNjHPSst
 kOL39g7ntpOaQBe+1FlvBppv442s0/0tGM/tXWWoU3wlNiTSRDkvLzEl1lQuBs5z3yBt
 oCT03LGM/NxUBKRpdlWbdyxPR8ynRjFxq3oz3rikz82llPUVYA9jCSnLX9PON0IdxXqr
 d/lZPpQdbsvzyisXtmvz1qq3qvv8JtPyA9Xjqs1Pbx3z9ab47CYgKAwiNBFyUK8EEomp UQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx9r9709v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:27:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BE4IILJ010373
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:27:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3cvkm99hvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:27:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BE4JEoj49676660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 04:19:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F72642041;
 Tue, 14 Dec 2021 04:27:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6402442042;
 Tue, 14 Dec 2021 04:27:09 +0000 (GMT)
Received: from [9.43.83.156] (unknown [9.43.83.156])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Dec 2021 04:27:09 +0000 (GMT)
Message-ID: <745575be-382c-69bd-db6b-40f5d5a7ea5b@linux.ibm.com>
Date: Tue, 14 Dec 2021 09:57:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH]selftests/powerpc: skip tests for unavailable mitigations.
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <163941374362.36967.18016981579099073379.sendpatchset@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9kA1YEttZbYEwIGvMidcm0yTuVlO5Zm1
X-Proofpoint-GUID: 9kA1YEttZbYEwIGvMidcm0yTuVlO5Zm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_14,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140019
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



On 13/12/21 10:12 pm, Sachin Sant wrote:
> Mitigation patching test iterates over a set of mitigations irrespective
> of whether a certain mitigation is supported/available in the kernel.
> This causes following messages on a kernel where some mitigations
> are unavailable:
> 
>    Spawned threads enabling/disabling mitigations ...
>    cat: entry_flush: No such file or directory
>    cat: uaccess_flush: No such file or directory
>    Waiting for timeout ...
>    OK
> 
> This patch adds a check for available mitigations in the kernel.
> 
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

> ---
> diff -Naurp aa/tools/testing/selftests/powerpc/security/mitigation-patching.sh bb/tools/testing/selftests/powerpc/security/mitigation-patching.sh
> --- aa/tools/testing/selftests/powerpc/security/mitigation-patching.sh	2021-12-13 10:17:05.714127154 -0500
> +++ bb/tools/testing/selftests/powerpc/security/mitigation-patching.sh	2021-12-13 10:19:32.575315913 -0500
> @@ -44,7 +44,10 @@ mitigations="barrier_nospec stf_barrier
>   
>   for m in $mitigations
>   do
> -    do_one "$m" &
> +    if [[ -f /sys/kernel/debug/powerpc/$m ]]
> +    then
> +        do_one "$m" &
> +    fi
>   done
>   
>   echo "Spawned threads enabling/disabling mitigations ..."

-- 
Thanks and Regards
R.Nageswara Sastry

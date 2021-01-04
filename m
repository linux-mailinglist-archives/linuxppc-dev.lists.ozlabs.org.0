Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21D2E92CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 10:48:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8W5c0ZwKzDqFs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 20:48:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aBBzV1QE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8W3t11QnzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 20:46:33 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1049W76N006501
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 Jan 2021 04:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m5Jn27UCH5q3n1VfntGF+9ZSEzAGklTuRd1+UTav9zk=;
 b=aBBzV1QEBMt8FxRtSCZ97hxoQbNzL+56SMQGf/2Fa6ildgKpWYP8PSlye3tEV4j+njt7
 snajJypYLi8ZXZrkKHUm3j4IMVI01id3q9BO0LiW94aDyaTjCore3FKreu50iL6/KpoJ
 UP+JURui6e079/HL9x7kmgqgh/hRo9p/XZ5o6uBeY23sA/CDqQKoobiTPgDST+FVn5GS
 9CO1cLEFlDeXoxd7R8t1GOJslGWB+j7RZbC8iMmMlSQLLc/NMdjdhyEALcYOR8HIS8wF
 r3zoD7hR9AJDzrsJTCO0wealoi5575tcJf41dL5iWgw2qncYyvt5X3v3MfQdeFQaQ0t5 aw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v0er8aut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 04:46:29 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1049WSe2011085
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 Jan 2021 09:46:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 35tgf89qpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 09:46:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1049kM5j31326502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 Jan 2021 09:46:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F903A405C
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 09:46:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6557FA405B
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 09:46:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.75.217])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 09:46:25 +0000 (GMT)
Subject: Re: [PATCH] selftests/powerpc: make the test check in eeh-basic.sh
 posix compliant
To: linuxppc-dev@lists.ozlabs.org
References: <20201228043459.14281-1-po-hsu.lin@canonical.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <8f943d9b-21cd-49b8-fb45-706cb49e4093@linux.ibm.com>
Date: Mon, 4 Jan 2021 10:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228043459.14281-1-po-hsu.lin@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_07:2020-12-31,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040061
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



On 28/12/2020 05:34, Po-Hsu Lin wrote:
> The == operand is a bash extension, thus this will fail on Ubuntu with
> 

Error message is somehow missing. It should read:
"./eeh-basic.sh: 89: test: 2: unexpected operator"

> As the /bin/sh on Ubuntu is pointed to DASH.
> 
> Use -eq to fix this posix compatibility issue.
> 
> Fixes: 996f9e0f93f162 ("selftests/powerpc: Fix eeh-basic.sh exit codes")
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---


With the above,
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

Thanks!

>   tools/testing/selftests/powerpc/eeh/eeh-basic.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
> index 0d783e1..64779f0 100755
> --- a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
> +++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
> @@ -86,5 +86,5 @@ echo "$failed devices failed to recover ($dev_count tested)"
>   lspci | diff -u $pre_lspci -
>   rm -f $pre_lspci
>   
> -test "$failed" == 0
> +test "$failed" -eq 0
>   exit $?
> 

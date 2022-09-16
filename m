Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493D5BADD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZB46xtPz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:07:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f9S+tZ33;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f9S+tZ33;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZ8y72Tjz3cBV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:06:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GD30Qt030641;
	Fri, 16 Sep 2022 13:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r6aS4M4HRLHhdbl68r3zalom3ti9LMMuKVG4shlo794=;
 b=f9S+tZ33mIycjWyAM+kBU8pbfDyP7BrmTGevPVasErm00RH2GYy489ORRJaiqM+N5s6X
 lDIv9wCrjMDzyswcXfG4KsdmOdorpRMdjSlLWIVXhwXmi3ucuyom7AXIm2CvFc2Gon55
 OXJW9RQ56psrhlaLkZgQhENZzED3ACKJQ00C1LuegdnM6FvYJwFD27icetAf5fX/P+VX
 G8OuNdnKn9tZCHlweP+zY3yU/RFq6cJMX+MjWwT6+9C9zqkrpimAjb3QC/YMq9wi5Iw2
 lrpvuyn0QHsP0CzvwUixStCD0eH97daFqqxZE0unby+LJI6uHozPQp9R2OSF4vzcBpgO fA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmsksrjs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 13:06:51 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GD6UeS026550;
	Fri, 16 Sep 2022 13:06:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3jm91t8rtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 13:06:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GD6kfd39649740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 13:06:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07F1DA404D;
	Fri, 16 Sep 2022 13:06:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AE64A4051;
	Fri, 16 Sep 2022 13:06:43 +0000 (GMT)
Received: from [9.43.57.125] (unknown [9.43.57.125])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 13:06:43 +0000 (GMT)
Message-ID: <3e2fc080-76fa-5651-ffd5-095a86c55284@linux.ibm.com>
Date: Fri, 16 Sep 2022 18:36:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] tools/perf/tests: Fix branch stack sampling test to
 include sanity check for branch filter
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
 <20220913115546.36179-2-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220913115546.36179-2-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jNW7VEu9lbhkXJbF9PTm0JAJSpABdkYu
X-Proofpoint-GUID: jNW7VEu9lbhkXJbF9PTm0JAJSpABdkYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160092
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/13/22 17:25, Athira Rajeev wrote:
> commit b55878c90ab9 ("perf test: Add test for branch stack sampling")
> added test for branch stack sampling. There is a sanity check in the
> beginning to skip the test if the hardware doesn't support branch stack
> sampling.
> 
> Snippet
> <<>>
> skip the test if the hardware doesn't support branch stack sampling
> perf record -b -o- -B true > /dev/null 2>&1 || exit 2
> <<>>
> 
> But the testcase also uses branch sample types: save_type, any. if any
> platform doesn't support the branch filters used in the test, the testcase
> will fail. In powerpc, currently mutliple branch filters are not supported
> and hence this test fails in powerpc. Fix the sanity check to look at
> the support for branch filters used in this test before proceeding with
> the test.
> 
> Fixes: b55878c90ab9 ("perf test: Add test for branch stack sampling")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Patch looks good to me.

Reviewed-By: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

> ---
>  tools/perf/tests/shell/test_brstack.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/test_brstack.sh b/tools/perf/tests/shell/test_brstack.sh
> index c644f94a6500..ec801cffae6b 100755
> --- a/tools/perf/tests/shell/test_brstack.sh
> +++ b/tools/perf/tests/shell/test_brstack.sh
> @@ -12,7 +12,8 @@ if ! [ -x "$(command -v cc)" ]; then
>  fi
>  
>  # skip the test if the hardware doesn't support branch stack sampling
> -perf record -b -o- -B true > /dev/null 2>&1 || exit 2
> +# and if the architecture doesn't support filter types: any,save_type,u
> +perf record -b -o- -B --branch-filter any,save_type,u true > /dev/null 2>&1 || exit 2
>  
>  TMPDIR=$(mktemp -d /tmp/__perf_test.program.XXXXX)
>  

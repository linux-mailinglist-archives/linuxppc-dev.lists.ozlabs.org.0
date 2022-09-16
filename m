Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F049E5BADD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTZBx5mfSz3dxF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:08:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eQW1iP+p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eQW1iP+p;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTZ9T5xx7z3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 23:07:25 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GCx5LK033984;
	Fri, 16 Sep 2022 13:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gpMGg5exULCmsPvdSRtzQwgHyaEPzwXR1TlEx2ARkgw=;
 b=eQW1iP+p4LKLwYKJ6NcNI1OS4uAU9j6aL9KxUOTRXaDXIXh+8dMyYyFGLK4rjKFmiym+
 3oY0QgYoTO6shoQnVL7BmKrwMvLc/qlIm+fAfp19Qb1JnSkcBzRNCjqszY8UQ/NN5ZOM
 3eETZy0QtBJjVHWkL8TSvJIZ2tF2FVkL5Zs5HzRXAC88AxPghYvkANQHZuTuotSAtIhL
 CFAzYhRhHgMjdIdGMudABG7vm8JHljoM7ZZVEaanFAIqWCGil7GUJUCak6M0SB1HZk9b
 nNordCKB2YyvwWSg3h97RNpAlAMd249yqQWlNzBHo3ekJVLcpZvN3W959hI6J4tfuZsp Vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jms6m1gqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 13:07:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GD6i1d008212;
	Fri, 16 Sep 2022 13:07:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3jm921h1s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 13:07:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GD7Dkr38666538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 13:07:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA1D8A4040;
	Fri, 16 Sep 2022 13:07:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 613CCA4053;
	Fri, 16 Sep 2022 13:07:11 +0000 (GMT)
Received: from [9.43.57.125] (unknown [9.43.57.125])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 13:07:11 +0000 (GMT)
Message-ID: <5430757d-678f-9f49-5fd7-c510e5c7ceff@linux.ibm.com>
Date: Fri, 16 Sep 2022 18:37:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] tools/testing/selftests/powerpc: Update the bhrb
 filter sampling test to test for multiple branch filters
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20220913115546.36179-1-atrajeev@linux.vnet.ibm.com>
 <20220913115546.36179-3-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220913115546.36179-3-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0s0Pvqv8jweLwajy5xUTUq8I2M61M2To
X-Proofpoint-GUID: 0s0Pvqv8jweLwajy5xUTUq8I2M61M2To
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160096
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
> For PERF_SAMPLE_BRANCH_STACK sample type, different branch_sample_type,
> ie branch filters are supported. The testcase "bhrb_filter_map_test"
> tests the valid and invalid filter maps in different powerpc platforms.
> Update this testcase to include scenario to cover multiple branch
> filters at sametime. Since powerpc doesn't support multiple filters at
> sametime, expect failure during perf_event_open.
> 
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  .../powerpc/pmu/sampling_tests/bhrb_filter_map_test.c    | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
> index 8182647c63c8..605669d4e4cb 100644
> --- a/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
> @@ -96,6 +96,15 @@ static int bhrb_filter_map_test(void)
>  		}
>  	}
>  

Patch looks good to me.

Reviewed-By: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain


> +	/*
> +	 * Combine filter maps which includes a valid branch filter and an invalid branch
> +	 * filter. Example: any ( PERF_SAMPLE_BRANCH_ANY) and save_type
> +	 * (PERF_SAMPLE_BRANCH_TYPE_SAVE).
> +	 * The perf_event_open should fail in this case.
> +	 */
> +	event.attr.branch_sample_type = PERF_SAMPLE_BRANCH_ANY | PERF_SAMPLE_BRANCH_TYPE_SAVE;
> +	FAIL_IF(!event_open(&event));
> +
>  	return 0;
>  }
>  

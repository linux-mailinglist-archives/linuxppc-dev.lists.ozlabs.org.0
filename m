Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB26351DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 09:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHDH257z9z3cMk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 19:06:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTQrsSB4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTQrsSB4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHDG63QPpz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 19:05:50 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN74aZX010256;
	Wed, 23 Nov 2022 08:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n5QwxpIonNMroYuN7a7wcudqV6ZvkPpMwvP6kgKHgSU=;
 b=fTQrsSB4S7kApqxLLgy+vOqdypMGGMVvotXXwTHLojepLBvOiNIgBg+xXfKDASQb5HYf
 /w1h+Uw48JNLOc88IX7QSs7gzIX69Uc+bRElL491LN54Nzm2Fz5pAhxECRcE0A9c7pJc
 4ICrGlCn6iDcCpvfS/Zt/PphMro1SF+f0jklHHUK9oplfN33JADtMDu8JzHZnSoeGJqw
 NH1wtgbeYyIaXfMtpU4hpz2drkGSkZkaTDLgo694EWYgF7F3QZXwuX1/bE8R7GQvvFq7
 6w6OSwD3bMmC1yX+YcxVLERuS3bajFx+0oCzRPBxwwhu9wd+iEzpwTbaKG40zOGAApCD fQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10bm687s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 08:05:41 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AN85Dt0020032;
	Wed, 23 Nov 2022 08:05:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8uwbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Nov 2022 08:05:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AN85bpq58458372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Nov 2022 08:05:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18B5FA4040;
	Wed, 23 Nov 2022 08:05:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 452F2A4053;
	Wed, 23 Nov 2022 08:05:35 +0000 (GMT)
Received: from [9.43.90.58] (unknown [9.43.90.58])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 23 Nov 2022 08:05:35 +0000 (GMT)
Message-ID: <1671ea30-cc2f-e3b3-d8d0-430e6e14fed6@linux.ibm.com>
Date: Wed, 23 Nov 2022 13:35:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] perf test: Skip watchpoint tests if no watchpoints
 available
Content-Language: en-US
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: psj5nHdOV1vb4Hz5V79xQVbV3uzNKR3Q
X-Proofpoint-GUID: psj5nHdOV1vb4Hz5V79xQVbV3uzNKR3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211230060
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
Cc: Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/21/22 15:57, Naveen N. Rao wrote:
> On IBM Power9, perf watchpoint tests fail since no hardware breakpoints
> are available. Detect this by checking the error returned by
> perf_event_open() and skip the tests in that case.
> 
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---

Patch looks fine to me. Also tested it in power9 box

Test result without this patch changes :
 23: Watchpoint  :
 23.1: Read Only Watchpoint    : FAILED!
 23.2: Write Only Watchpoint   : FAILED!
 23.3: Read / Write Watchpoint : FAILED!
 23.4: Modify Watchpoint       : FAILED!


Test result with patch changes:
 23: Watchpoint  :
 23.1: Read Only Watchpoint    : Skip (missing hardware support)
 23.2: Write Only Watchpoint   : Skip (missing hardware support)
 23.3: Read / Write Watchpoint : Skip (missing hardware support)
 23.4: Modify Watchpoint       : Skip (missing hardware support)


Reviewed-by: Kajol Jain<kjain@linux.ibm.com>
Tested-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain

>  tools/perf/tests/wp.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/tests/wp.c b/tools/perf/tests/wp.c
> index 56455da30341b4..cc8719609b19ea 100644
> --- a/tools/perf/tests/wp.c
> +++ b/tools/perf/tests/wp.c
> @@ -59,8 +59,10 @@ static int __event(int wp_type, void *wp_addr, unsigned long wp_len)
>  	get__perf_event_attr(&attr, wp_type, wp_addr, wp_len);
>  	fd = sys_perf_event_open(&attr, 0, -1, -1,
>  				 perf_event_open_cloexec_flag());
> -	if (fd < 0)
> +	if (fd < 0) {
> +		fd = -errno;
>  		pr_debug("failed opening event %x\n", attr.bp_type);
> +	}
>  
>  	return fd;
>  }
> @@ -77,7 +79,7 @@ static int test__wp_ro(struct test_suite *test __maybe_unused,
>  
>  	fd = __event(HW_BREAKPOINT_R, (void *)&data1, sizeof(data1));
>  	if (fd < 0)
> -		return -1;
> +		return fd == -ENODEV ? TEST_SKIP : -1;
>  
>  	tmp = data1;
>  	WP_TEST_ASSERT_VAL(fd, "RO watchpoint", 1);
> @@ -101,7 +103,7 @@ static int test__wp_wo(struct test_suite *test __maybe_unused,
>  
>  	fd = __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
>  	if (fd < 0)
> -		return -1;
> +		return fd == -ENODEV ? TEST_SKIP : -1;
>  
>  	tmp = data1;
>  	WP_TEST_ASSERT_VAL(fd, "WO watchpoint", 0);
> @@ -126,7 +128,7 @@ static int test__wp_rw(struct test_suite *test __maybe_unused,
>  	fd = __event(HW_BREAKPOINT_R | HW_BREAKPOINT_W, (void *)&data1,
>  		     sizeof(data1));
>  	if (fd < 0)
> -		return -1;
> +		return fd == -ENODEV ? TEST_SKIP : -1;
>  
>  	tmp = data1;
>  	WP_TEST_ASSERT_VAL(fd, "RW watchpoint", 1);
> @@ -150,7 +152,7 @@ static int test__wp_modify(struct test_suite *test __maybe_unused, int subtest _
>  
>  	fd = __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
>  	if (fd < 0)
> -		return -1;
> +		return fd == -ENODEV ? TEST_SKIP : -1;
>  
>  	data1 = tmp;
>  	WP_TEST_ASSERT_VAL(fd, "Modify watchpoint", 1);
> 
> base-commit: 63a3bf5e8d9e79ce456c8f73d4395a5a51d841b1

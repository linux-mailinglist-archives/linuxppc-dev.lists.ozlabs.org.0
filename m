Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B87524B37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 13:16:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzTjk6jW4z3cGR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 21:16:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PKr3ZfMQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PKr3ZfMQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzTj228gJz3bdY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 21:15:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24CBBqrN003014;
 Thu, 12 May 2022 11:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0NLTqlqdU6w+qVbfA67PLuJiexPPQKRbf2FgJotJPc0=;
 b=PKr3ZfMQQpWl9dQrDi3k/cQeUJHSHxD8EKVxLOewzC5DRsxdOC2G6A4/nvlvSsAyLjf/
 mZJZY3L1MN59UG8gLj00h4syeYi9IRukuqPU1Cd0bkdfaWImDMWI7OAkqwElpUkgRYgF
 C9TKry9KvHOvWgnKJowqcojEqhh4vUQCPQIw4YGKEX/njlv3HRuJYt3ZxlLhW7NSjXtJ
 jqDo1V6eO/4D0hzvWX2fae8tc8YCCMMCw9wf1YUlskh3FvRdSAg91pLG5/UxNhgScQCE
 1pDpOvd1QQsjmicA8f67WWiHqFVQVpqADt6TNYiejL9OHwTfx6Ml0BqPBfXOZsovl408 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g115ag1ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:15:25 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24CBCGFm003890;
 Thu, 12 May 2022 11:15:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g115ag1te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:15:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24CB8nBT014712;
 Thu, 12 May 2022 11:15:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8xwrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 11:15:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24CBFJG758065338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 11:15:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2233A405C;
 Thu, 12 May 2022 11:15:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BD13A4054;
 Thu, 12 May 2022 11:15:16 +0000 (GMT)
Received: from [9.43.85.52] (unknown [9.43.85.52])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 May 2022 11:15:16 +0000 (GMT)
Message-ID: <ee50c1c1-a15e-76ec-59fe-b722d595bc17@linux.ibm.com>
Date: Thu, 12 May 2022 16:45:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH V2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
References: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4JHdAJZwlACNFQvro--5ss6clhF6TeEc
X-Proofpoint-ORIG-GUID: ej2_PNfx9S69XJuJNw8mTWUeHuiMAD81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205120050
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/22 17:19, Athira Rajeev wrote:
> The session topology test fails in powerpc pSeries platform.
> Test logs:
> <<>>
> Session topology : FAILED!
> <<>>
> 
> This testcases tests cpu topology by checking the core_id and
> socket_id stored in perf_env from perf session. The data from
> perf session is compared with the cpu topology information
> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
> physical_package_id. In case of virtual environment, detail
> like physical_package_id is restricted to be exposed. Hence
> physical_package_id is set to -1. The testcase fails on such
> platforms since socket_id can't be fetched from topology info.
> 
> Skip the testcase in powerpc if physical_package_id returns -1
> 

Patch looks fine to me.

Reviewed-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain

> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
> v1 -> v2:
>  Addressed review comments from Arnaldo and Michael Ellerman.
>  skip the test in powerpc when physical_package_id is set to
>  -1.
>  Dropped patch 1 from V1 since current change doesn't use info
>  from /proc/cpuinfo and rather uses physical_package_id value.
> 
>  tools/perf/tests/topology.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
> index ee1e3dcbc0bd..d23a9e322ff5 100644
> --- a/tools/perf/tests/topology.c
> +++ b/tools/perf/tests/topology.c
> @@ -109,6 +109,17 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
>  			&& strncmp(session->header.env.arch, "aarch64", 7))
>  		return TEST_SKIP;
>  
> +	/*
> +	 * In powerpc pSeries platform, not all the topology information
> +	 * are exposed via sysfs. Due to restriction, detail like
> +	 * physical_package_id will be set to -1. Hence skip this
> +	 * test if physical_package_id returns -1 for cpu from perf_cpu_map.
> +	 */
> +	if (strncmp(session->header.env.arch, "powerpc", 7)) {
> +		if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)
> +			return TEST_SKIP;
> +	}
> +
>  	TEST_ASSERT_VAL("Session header CPU map not set", session->header.env.cpu);
>  
>  	for (i = 0; i < session->header.env.nr_cpus_avail; i++) {

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDB46012D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 17:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mrh6j68Vvz3dqk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 02:41:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRdsio5w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRdsio5w;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mrh5j5tKmz3c87
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 02:40:25 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HEe0gs031076;
	Mon, 17 Oct 2022 15:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rnbdnwmmTYFN3ka7BUYRRTD3vlsSmXwUOO/6IsVJ5zE=;
 b=jRdsio5wDqRP4ttf33SBxSCMtL38ok3MtHfFR3MtsKG6WPftEm5U5D836pItH327kdtZ
 fz4mvDyGPmE9y0RJGCvotGAC2UwZXIxGf6sa/Wwec1Fa60QfgoYwtHjadsDtQyRcsCFL
 QCjWZ0T8iYh3b4n1XRlUDa7FkWSAfmIdFp/ZJy10lmubuBWdssjsSlhiQ+jho9Gwhg3/
 qVSisnOmNi0Ia6wDemAI3qAoL8oBCw4P0Sq6B7DuBV31qd3OYggF6qx9l4IHRb2uZTL4
 jTqPlF8r7NlQzLwtVk4Zfx2MNO1/z3Ler+rfQv4G+C1fqM5gsv6Yc9bg4uUD3/hoGH8L 9g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k86vu6v34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 15:40:08 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29HFbFd2008004;
	Mon, 17 Oct 2022 15:40:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3k7mg938xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Oct 2022 15:40:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29HFe2Do3867312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Oct 2022 15:40:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A99E942041;
	Mon, 17 Oct 2022 15:40:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82B2E42047;
	Mon, 17 Oct 2022 15:39:57 +0000 (GMT)
Received: from [9.43.55.73] (unknown [9.43.55.73])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 17 Oct 2022 15:39:56 +0000 (GMT)
Message-ID: <c92d40fa-4394-a755-62f2-abbd21296412@linux.ibm.com>
Date: Mon, 17 Oct 2022 21:09:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/2] tools/perf/tests/shell: Update stat+csv_output.sh to
 include sanity check for topology
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, mpe@ellerman.id.au
References: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AbwBz5PjmFLnw_JMJmjKohr3zSPLA6pd
X-Proofpoint-GUID: AbwBz5PjmFLnw_JMJmjKohr3zSPLA6pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_12,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170084
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/6/22 9:21 PM, Athira Rajeev wrote:
> Testcase stat+csv_output.sh fails in powerpc:
>
> 	84: perf stat CSV output linter: FAILED!
>
> The testcase "stat+csv_output.sh" verifies perf stat
> CSV output. The test covers aggregation modes like
> per-socket, per-core, per-die, -A (no_aggr mode) along
> with few other tests. It counts expected fields for
> various commands. For example say -A (i.e, AGGR_NONE
> mode), expects 7 fields in the output having "CPU" as
> first field. Same way, for per-socket, it expects the
> first field in result to point to socket id. The testcases
> compares the result with expected count.
>
> The values for socket, die, core and cpu are fetched
> from topology directory:
> /sys/devices/system/cpu/cpu*/topology.
> For example, socket value is fetched from
> "physical_package_id" file of topology directory.
> (cpu__get_topology_int() in util/cpumap.c)
>
> If a platform fails to fetch the topology information,
> values will be set to -1. For example, incase of pSeries
> platform of powerpc, value for  "physical_package_id" is
> restricted and not exposed. So, -1 will be assigned.
>
> Perf code has a checks for valid cpu id in "aggr_printout"
> (stat-display.c), which displays the fields. So, in cases
> where topology values not exposed, first field of the
> output displaying will be empty. This cause the testcase
> to fail, as it counts  number of fields in the output.
>
> Incase of -A (AGGR_NONE mode,), testcase expects 7 fields
> in the output, becos of -1 value obtained from topology
> files for some, only 6 fields are printed. Hence a testcase
> failure reported due to mismatch in number of fields in
> the output.
>
> Patch here adds a sanity check in the testcase for topology.
> Check will help to skip the test if -1 value found.
>
> Fixes: 7473ee56dbc9 ("perf test: Add checking for perf stat CSV output.")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Suggested-by: James Clark <james.clark@arm.com>
> Suggested-by: Ian Rogers <irogers@google.com>

For the patchset,

Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>

> ---
>   tools/perf/tests/shell/stat+csv_output.sh | 43 ++++++++++++++++++++---
>   1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/tests/shell/stat+csv_output.sh b/tools/perf/tests/shell/stat+csv_output.sh
> index eb5196f58190..b7f050aa6210 100755
> --- a/tools/perf/tests/shell/stat+csv_output.sh
> +++ b/tools/perf/tests/shell/stat+csv_output.sh
> @@ -6,6 +6,8 @@
>
>   set -e
>
> +skip_test=0
> +
>   function commachecker()
>   {
>   	local -i cnt=0
> @@ -156,14 +158,47 @@ check_per_socket()
>   	echo "[Success]"
>   }
>
> +# The perf stat options for per-socket, per-core, per-die
> +# and -A ( no_aggr mode ) uses the info fetched from this
> +# directory: "/sys/devices/system/cpu/cpu*/topology". For
> +# example, socket value is fetched from "physical_package_id"
> +# file in topology directory.
> +# Reference: cpu__get_topology_int in util/cpumap.c
> +# If the platform doesn't expose topology information, values
> +# will be set to -1. For example, incase of pSeries platform
> +# of powerpc, value for  "physical_package_id" is restricted
> +# and set to -1. Check here validates the socket-id read from
> +# topology file before proceeding further
> +
> +FILE_LOC="/sys/devices/system/cpu/cpu*/topology/"
> +FILE_NAME="physical_package_id"
> +
> +check_for_topology()
> +{
> +	if ! ParanoidAndNotRoot 0
> +	then
> +		socket_file=`ls $FILE_LOC/$FILE_NAME | head -n 1`
> +		[ -z $socket_file ] && return 0
> +		socket_id=`cat $socket_file`
> +		[ $socket_id == -1 ] && skip_test=1
> +		return 0
> +	fi
> +}
> +
> +check_for_topology
>   check_no_args
>   check_system_wide
> -check_system_wide_no_aggr
>   check_interval
>   check_event
> -check_per_core
>   check_per_thread
> -check_per_die
>   check_per_node
> -check_per_socket
> +if [ $skip_test -ne 1 ]
> +then
> +	check_system_wide_no_aggr
> +	check_per_core
> +	check_per_die
> +	check_per_socket
> +else
> +	echo "[Skip] Skipping tests for system_wide_no_aggr, per_core, per_die and per_socket since socket id exposed via topology is invalid"
> +fi
>   exit 0

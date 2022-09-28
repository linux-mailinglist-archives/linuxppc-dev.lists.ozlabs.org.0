Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581795EDEDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 16:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MczXd4xrLz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 00:34:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7SjoSg2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7SjoSg2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MczWw4jJ6z2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 00:34:04 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SELEWZ032622;
	Wed, 28 Sep 2022 14:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=GN56reUPbWbC6yaYNBo3OGMdXXx8P7+DUdvfrq3KzfA=;
 b=O7SjoSg2kBS47Z7lvhuzmZNWXXEJDPAGQupRTeJSRCyvzRvffiVGTuRCwzCC27pH9j10
 1JS1RmuykfO99SI0+cNVqBEsoWdCWqgHL1IuzVAOMavZSF1+nt5D15sQhTEdYO4T2S2B
 7lBYfpfqdVTj0o9OkgW2neQfOwBm8jy4xH96vbSD1MvoaktqjRdkUCDaxSk6nJB4TKAf
 pzrO04PPk5ZV6lvEGsXiItGShc5t0eXo1aaUtnZySj+oOUGvjQQRzf0wwjceZ8xMM/Wt
 IL07X1YeXI0V9EO45nOzjbhF030fwgV4bqxqOPf5Z0Jdredzwt4AVAMe8cqoyZBPZSJp kA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvmtr6mnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 14:33:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28SELvan003417;
	Wed, 28 Sep 2022 14:33:20 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvmtr6mkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 14:33:20 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SE6lYH011452;
	Wed, 28 Sep 2022 14:33:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03fra.de.ibm.com with ESMTP id 3jssh940wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 14:33:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SEXE8B40894916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 14:33:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EDFEA4051;
	Wed, 28 Sep 2022 14:33:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C797A4040;
	Wed, 28 Sep 2022 14:33:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.45.125])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 28 Sep 2022 14:33:11 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] tools/perf: Fix aggr_printout to display cpu field
 irrespective of core value
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <2353467d-c83d-f6ee-0972-1e94bc9f4f5d@linux.ibm.com>
Date: Wed, 28 Sep 2022 20:03:09 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <B48A46B1-D247-409A-893C-F41EE44E214B@linux.vnet.ibm.com>
References: <20220913115717.36191-1-atrajeev@linux.vnet.ibm.com>
 <2353467d-c83d-f6ee-0972-1e94bc9f4f5d@linux.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mbRuD9OP74abrPh9q22Ts4StwhufxKSX
X-Proofpoint-ORIG-GUID: ZE3Hhcjq4pWRYPLbuVcv_zzAFxKDzkDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280086
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16-Sep-2022, at 5:01 PM, Disha Goel <disgoel@linux.ibm.com> wrote:
>=20
> This Message Is =46rom an External Sender
> This message came from outside your organization.
>=20
>=20
> On 9/13/22 5:27 PM, Athira Rajeev wrote:
>> perf stat includes option to specify aggr_mode to display
>> per-socket, per-core, per-die, per-node counter details.
>> Also there is option -A ( AGGR_NONE, -no-aggr ), where the
>> counter values are displayed for each cpu along with "CPU"
>> value in one field of the output.
>>=20
>> Each of the aggregate mode uses the information fetched
>> from "/sys/devices/system/cpu/cpuX/topology" like core_id,
>> physical_package_id. Utility functions in "cpumap.c" fetches
>> this information and populates the socket id, core id, cpu etc.
>> If the platform does not expose the topology information,
>> these values will be set to -1. Example, in case of powerpc,
>> details like physical_package_id is restricted to be exposed
>> in pSeries platform. So id.socket, id.core, id.cpu all will
>> be set as -1.
>>=20
>> In case of displaying socket or die value, there is no check
>> done in the "aggr_printout" function to see if it points to
>> valid socket id or die. But for displaying "cpu" value, there
>> is a check for "if (id.core > -1)". In case of powerpc pSeries
>> where detail like physical_package_id is restricted to be
>> exposed, id.core will be set to -1. Hence the column or field
>> itself for CPU won't be displayed in the output.
>>=20
>> Result for per-socket:
>>=20
>> <<>>
>> perf stat -e branches --per-socket -a true
>>=20
>>  Performance counter stats for 'system wide':
>>=20
>> S-1      32            416,851      branches
>> <<>>
>>=20
>> Here S has -1 in above result. But with -A option which also
>> expects CPU in one column in the result, below is observed.
>>=20
>> <<>>
>>  /bin/perf stat -e instructions -A -a true
>>=20
>>  Performance counter stats for 'system wide':
>>=20
>>             47,146      instructions
>>             45,226      instructions
>>             43,354      instructions
>>             45,184      instructions
>> <<>>
>>=20
>> If the cpu id value is pointing to -1 also, it makes sense
>> to display the column in the output to replicate the behaviour
>> or to be in precedence with other aggr options(like per-socket,
>> per-core). Remove the check "id.core" so that CPU field gets
>> displayed in the output.
>>=20
>> After the fix:
>>=20
>> <<>>
>> perf stat -e instructions -A -a true
>>=20
>>  Performance counter stats for 'system wide':
>>=20
>> CPU-1                  64,034      instructions
>> CPU-1                  68,941      instructions
>> CPU-1                  59,418      instructions
>> CPU-1                  70,478      instructions
>> CPU-1                  65,201      instructions
>> CPU-1                  63,704      instructions
>> <<>>
>>=20
>> This is caught while running "perf test" for
>> "stat+json_output.sh" and "stat+csv_output.sh".
>>=20
>> Reported-by: Disha Goel=20
>> <disgoel@linux.vnet.ibm.com>
>>=20
>> Signed-off-by: Athira Rajeev=20
>> <atrajeev@linux.vnet.ibm.com>
> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>

Hi,

Looking for review comments for this change.

Thanks
Athira
>> ---
>>  tools/perf/util/stat-display.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/tools/perf/util/stat-display.c =
b/tools/perf/util/stat-display.c
>> index b82844cb0ce7..1b751a730271 100644
>> --- a/tools/perf/util/stat-display.c
>> +++ b/tools/perf/util/stat-display.c
>> @@ -168,10 +168,9 @@ static void aggr_printout(struct =
perf_stat_config *config,
>>  					id.socket,
>>  					id.die,
>>  					id.core);
>> -			} else if (id.core > -1) {
>> +			} else
>>  				fprintf(config->output, "\"cpu\" : =
\"%d\", ",
>>  					id.cpu.cpu);
>> -			}
>>  		} else {
>>  			if (evsel->percore && =
!config->percore_show_thread) {
>>  				fprintf(config->output, =
"S%d-D%d-C%*d%s",
>> @@ -179,11 +178,10 @@ static void aggr_printout(struct =
perf_stat_config *config,
>>  					id.die,
>>  					config->csv_output ? 0 : -3,
>>  					id.core, config->csv_sep);
>> -			} else if (id.core > -1) {
>> +			} else
>>  				fprintf(config->output, "CPU%*d%s",
>>  					config->csv_output ? 0 : -7,
>>  					id.cpu.cpu, config->csv_sep);
>> -			}
>>  		}
>>  		break;
>>  	case AGGR_THREAD:
>>=20


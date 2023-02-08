Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546668E6BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQrd2Phnz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:45:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfN32PmZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfN32PmZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQqf50NLz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:45:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3183VWJH009523;
	Wed, 8 Feb 2023 03:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=urNmqWzZ1vTXPmzRqLRyvBLP3bDtXum804ZouZ0vCn4=;
 b=HfN32PmZlGaf2YPMcmEN6M8LRYBvHshNQaKm+kR0165Txczg23qk4W3ETC4/u91Rq7w+
 CvWEO4DxC50YzWQtCQCEkX2rU/QAcHnoPd+cVKgV0w+OihL8Rn++7HwLsCy9rjzOKoYg
 AtSi8HZlt0GJuwsmdUn1TOVNT4J5rnWVdQqb87LgBeSCOn82+Ym5jSuSYtjpAv9hBLLk
 Pt6vvucFwbVuQX/hj5MyEFeikB3xqKRtCtk8ri1/+X0pYDxiAzxOv0iVymYQkKpmiHmf
 et5aYAsh4jisvpsyqufSid/8qfDqEpo5eMhifmDygncfV7hYUdSQP9205hyXgFpSxFjJ 3g== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm3wk88gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:44:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317ErpJ8005776;
	Wed, 8 Feb 2023 03:44:55 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06k29d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:44:55 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183iqMP24904394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:44:53 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E56BF20043;
	Wed,  8 Feb 2023 03:44:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D30B20040;
	Wed,  8 Feb 2023 03:44:51 +0000 (GMT)
Received: from [9.43.70.241] (unknown [9.43.70.241])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:44:50 +0000 (GMT)
Message-ID: <157932b6-be9b-dc92-be91-ba070ebddc75@linux.ibm.com>
Date: Wed, 8 Feb 2023 09:14:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tools/perf/tests: Add system wide check for perf bench
 workload in all metric test
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20230202164413.56743-1-kjain@linux.ibm.com>
 <3BB099AB-5FB4-40FF-A281-C06A42FBEBC7@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <3BB099AB-5FB4-40FF-A281-C06A42FBEBC7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CilQz_nhCCzZoAbMteP2NBnVmUwN472J
X-Proofpoint-GUID: CilQz_nhCCzZoAbMteP2NBnVmUwN472J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080030
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
Cc: linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/6/23 10:10, Athira Rajeev wrote:
> 
> 
>> On 02-Feb-2023, at 10:14 PM, Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Testcase stat_all_metrics.sh fails in powerpc:
>>
>> 92: perf all metrics test : FAILED!
>>
>> Logs with verbose:
>>
>> [command]# ./perf test 92 -vv
>> 92: perf all metrics test                                           :
>> --- start ---
>> test child forked, pid 13262
>> Testing BRU_STALL_CPI
>> Testing COMPLETION_STALL_CPI
>> ----
>> Testing TOTAL_LOCAL_NODE_PUMPS_P23
>> Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
>> Error:
>> Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
>> Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
>> Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
>> Error:
>> Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
>> ----
>>
>> Based on above logs, we could see some of the hv-24x7 metric events fails,
>> and logs suggest to run the metric event with -a option.
>> This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
>> parsing"), which delayed the metric parsing phase and now before metric parsing
>> phase perf tool identifies, whether target is system-wide or not. With this
>> change, perf_event_open will fails with workload monitoring for uncore events
>> as expected.
>>
>> The perf all metric test case fails as some of the hv-24x7 metric events
>> may need bigger workload to get the data. And the added perf bench
>> workload in 'perf all metric test case' will not run for hv-24x7 without 
>> -a option.
>>
>> Fix this issue by adding system wide check for perf bench workload.
>>
>> Result with the patch changes in powerpc:
>>
>> 92: perf all metrics test : Ok
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Looks good to me
> 
> Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Hi Arnaldo,
   Let me know if patch looks fine to you.

Thanks,
Kajol Jain

> 
>> ---
>> tools/perf/tests/shell/stat_all_metrics.sh | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>> diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
>> index 6e79349e42be..d49832a316d9 100755
>> --- a/tools/perf/tests/shell/stat_all_metrics.sh
>> +++ b/tools/perf/tests/shell/stat_all_metrics.sh
>> @@ -23,6 +23,13 @@ for m in $(perf list --raw-dump metrics); do
>>   then
>>     continue
>>   fi
>> +  # Failed again, possibly the event is uncore pmu event which will need
>> +  # system wide monitoring with workload, so retry with -a option
>> +  result=$(perf stat -M "$m" -a perf bench internals synthesize 2>&1)
>> +  if [[ "$result" =~ "${m:0:50}" ]]
>> +  then
>> +    continue
>> +  fi
>>   echo "Metric '$m' not printed in:"
>>   echo "$result"
>>   if [[ "$err" != "1" ]]
>> -- 
>> 2.39.0
>>
> 

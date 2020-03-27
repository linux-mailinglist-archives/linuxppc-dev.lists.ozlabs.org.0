Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6A1954D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 11:08:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pcxn0xsqzDr6Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pcvp5DhtzDr0L
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 21:06:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RA2fse179254; Fri, 27 Mar 2020 06:06:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 301fcyg3mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 06:06:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02RA3Haw180880;
 Fri, 27 Mar 2020 06:06:26 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 301fcyg3ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 06:06:26 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02R9ufGQ027025;
 Fri, 27 Mar 2020 10:00:54 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 2ywawah9ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 10:00:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RA0rwr46793202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 10:00:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A4E378066;
 Fri, 27 Mar 2020 10:00:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96D137805E;
 Fri, 27 Mar 2020 10:00:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.180.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 10:00:44 +0000 (GMT)
Subject: Re: [PATCH v6 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
To: Jiri Olsa <jolsa@redhat.com>
References: <20200320125406.30995-1-kjain@linux.ibm.com>
 <20200320125406.30995-10-kjain@linux.ibm.com>
 <20200324131141.GV1534489@krava>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <5f0c693a-42e4-0ff8-7fe5-8a35f5efe64a@linux.ibm.com>
Date: Fri, 27 Mar 2020 15:30:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324131141.GV1534489@krava>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_02:2020-03-26,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270087
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/24/20 6:41 PM, Jiri Olsa wrote:
> On Fri, Mar 20, 2020 at 06:24:04PM +0530, Kajol Jain wrote:
>> Patch enhances current metric infrastructure to handle "?" in the metric
>> expression. The "?" can be use for parameters whose value not known while
>> creating metric events and which can be replace later at runtime to
>> the proper value. It also add flexibility to create multiple events out
>> of single metric event added in json file.
>>
>> Patch adds function 'arch_get_runtimeparam' which is a arch specific
>> function, returns the count of metric events need to be created.
>> By default it return 1.
>>
>> This infrastructure needed for hv_24x7 socket/chip level events.
>> "hv_24x7" chip level events needs specific chip-id to which the
>> data is requested. Function 'arch_get_runtimeparam' implemented
>> in header.c which extract number of sockets from sysfs file
>> "sockets" under "/sys/devices/hv_24x7/interface/".
>>
>>
>> With this patch basically we are trying to create as many metric events
>> as define by runtime_param.
>>
>> For that one loop is added in function 'metricgroup__add_metric',
>> which create multiple events at run time depend on return value of
>> 'arch_get_runtimeparam' and merge that event in 'group_list'.
>>
>> To achieve that we are actually passing this parameter value as part of
>> `expr__find_other` function and changing "?" present in metric expression
>> with this value.
>>
>> As in our json file, there gonna be single metric event, and out of
>> which we are creating multiple events, I am also merging this value
>> to the original metric name to specify parameter value.
>>
>> For example,
>> command:# ./perf stat  -M PowerBUS_Frequency -C 0 -I 1000
>> #           time             counts unit events
>>      1.000101867          9,356,933      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
>>      1.000101867          9,366,134      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
>>      2.000314878          9,365,868      hv_24x7/pm_pb_cyc,chip=0/ #      2.3 GHz  PowerBUS_Frequency_0
>>      2.000314878          9,366,092      hv_24x7/pm_pb_cyc,chip=1/ #      2.3 GHz  PowerBUS_Frequency_1
>>
>> So, here _0 and _1 after PowerBUS_Frequency specify parameter value.
>>
>> As after adding this to group_list, again we call expr__parse
>> in 'generic_metric' function present in util/stat-display.c.
>> By this time again we need to pass this parameter value. So, now to get this value
>> actually I am trying to extract it from metric name itself. Because
>> otherwise it gonna point to last updated value present in runtime_param.
>> And gonna match for that value only.
> 
> so why can't we pass that param as integer value through the metric objects?
> 
> it get's created in metricgroup__add_metric_param:
>   - as struct egroup *eg
>   - we can add egroup::param and store the param value there
> 
> then in metricgroup__setup_events it moves to:
>   - struct metric_expr *expr
>   - we can add metric_expr::param to keep the param
> 
> then in perf_stat__print_shadow_stats there's:
>   - struct metric_expr *mexp loop
>   - calling generic_metric metric - we could call it with mexp::param
>   - and pass the param to expr__parse
> 
Hi jiri,
   	Thanks for the suggestion, Yes it make more sense to use like that.
Will update.

Thanks,
Kajol
> jirka
> 

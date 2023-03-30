Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8E96D0195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 12:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnKmR2VXFz3fS7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 21:44:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYlWHu21;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYlWHu21;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnKlW4Sjyz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:43:35 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U97oCQ006972;
	Thu, 30 Mar 2023 10:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zo/GCQB0mH1y9ZA9mG4P9nPARAyBB6418qpnlyoAZOc=;
 b=oYlWHu21vyAr+wF1ls8i6liE98oxdrbmfvgI+np4tplbq2dxvNGyDHEB7R7CmstWPoHy
 AMCIiIZXk4a1mjlbf7QZ5kl7RVPH7wvfIKRsFaHa6l6ryvk41nsQH1TsndQLb+6gf9En
 CWUDqWRE4OawQv/TYZe91yBayBqMrsw6Y9wO7IHgOXkNmCQjyyzF2wWfnWwPl7W2w/Qg
 kzEkACZ23v4L9+GfCt3MViNdeg59/NY5944CMAxUmf3wmZPDft3fnaBG5CrlD1dwFbvE
 9g2JPJdg/Tz0P6i+O4Y0DXaqZlAeni6JYbmpWacSgQimsCWFj9IzEcwbChP6musPgkzz iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp2xvv6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 10:43:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32UAhMso028180;
	Thu, 30 Mar 2023 10:43:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmp2xvv6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 10:43:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKpn9C010293;
	Thu, 30 Mar 2023 10:43:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6nrw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 10:43:19 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32UAhGW612452498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 10:43:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E67D82004B;
	Thu, 30 Mar 2023 10:43:15 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E17F20040;
	Thu, 30 Mar 2023 10:43:11 +0000 (GMT)
Received: from [9.43.72.95] (unknown [9.43.72.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 10:43:10 +0000 (GMT)
Message-ID: <22e4e2e2-df06-f6a9-cb68-c295db064a80@linux.ibm.com>
Date: Thu, 30 Mar 2023 16:13:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] perf vendor events power9: Remove UTF-8 characters from
 json files
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
References: <20230328112908.113158-1-kjain@linux.ibm.com>
 <CAP-5=fXU4F=LvE883EVjq0bWHKJ-LT12pTr827jqwGfH1RTXdw@mail.gmail.com>
 <ZCQ7+/9Yj5SDYsDn@kernel.org>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <ZCQ7+/9Yj5SDYsDn@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JIOGJO1L7_q__-zUpqPPvjwZu-vY-N16
X-Proofpoint-GUID: I-i3c4fi6A-SUDzfGhwdeS-TZbTUkK0K
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_04,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300086
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
Cc: maddy@linux.ibm.com, disgoel@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, jolsa@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.com>, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/29/23 18:54, Arnaldo Carvalho de Melo wrote:
> Em Tue, Mar 28, 2023 at 09:21:49AM -0700, Ian Rogers escreveu:
>> On Tue, Mar 28, 2023 at 4:30 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>>>
>>> Commit 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
>>> added and updated power9 pmu json events. However some of the json
>>> events which are part of other.json and pipeline.json files,
>>> contains UTF-8 characters in their brief description.
>>> Having UTF-8 character could brakes the perf build on some distros.
>>
>> nit: s/bakes/break/
> 
> I'll fix that later, thans.
>  
>>> Fix this issue by removing the UTF-8 characters from other.json and
>>> pipeline.json files.
>>>
>>> Result without the fix patch:
> 
> [perfbuilder@five ~]$ cat dm.log/summary 
>    1    23.25 ubuntu:18.04-x-powerpc        : Ok   powerpc-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
>    2    24.56 ubuntu:18.04-x-powerpc64      : Ok   powerpc64-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
>    3    25.06 ubuntu:18.04-x-powerpc64el    : Ok   powerpc64le-linux-gnu-gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0 
> BUILD_TARBALL_HEAD=9da5ab1d38cd17fb47cbe5a1f95bca63e6ca9796
> 

Thanks Ian and Arnaldo for reviewing it.

Thanks,
Kajol Jain

>>> [command]# file -i pmu-events/arch/powerpc/power9/*
>>> pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/other.json:          application/json; charset=utf-8
>>> pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=utf-8
>>> pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
>>>
>>> Result with the fix patch:
>>>
>>> [command]# file -i pmu-events/arch/powerpc/power9/*
>>> pmu-events/arch/powerpc/power9/cache.json:          application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/floating-point.json: application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/frontend.json:       application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/marked.json:         application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/memory.json:         application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/metrics.json:        application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/nest_metrics.json:   application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/other.json:          application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/pipeline.json:       application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/pmc.json:            application/json; charset=us-ascii
>>> pmu-events/arch/powerpc/power9/translation.json:    application/json; charset=us-ascii
>>>
>>> Fixes: 3c22ba524304 ("perf vendor events powerpc: Update POWER9 events")
>>> Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
>>> Link: https://lore.kernel.org/lkml/ZBxP77deq7ikTxwG@kernel.org/
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>
>> Acked-by: Ian Rogers <irogers@google.com>
>>
>> Thanks,
>> Ian
>>
>>> ---
>>>  tools/perf/pmu-events/arch/powerpc/power9/other.json    | 4 ++--
>>>  tools/perf/pmu-events/arch/powerpc/power9/pipeline.json | 2 +-
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tools/perf/pmu-events/arch/powerpc/power9/other.json b/tools/perf/pmu-events/arch/powerpc/power9/other.json
>>> index 3f69422c21f9..f10bd554521a 100644
>>> --- a/tools/perf/pmu-events/arch/powerpc/power9/other.json
>>> +++ b/tools/perf/pmu-events/arch/powerpc/power9/other.json
>>> @@ -1417,7 +1417,7 @@
>>>    {
>>>      "EventCode": "0x45054",
>>>      "EventName": "PM_FMA_CMPL",
>>> -    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only. "
>>> +    "BriefDescription": "two flops operation completed (fmadd, fnmadd, fmsub, fnmsub) Scalar instructions only."
>>>    },
>>>    {
>>>      "EventCode": "0x201E8",
>>> @@ -2017,7 +2017,7 @@
>>>    {
>>>      "EventCode": "0xC0BC",
>>>      "EventName": "PM_LSU_FLUSH_OTHER",
>>> -    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the “bad dval” back and flush all younger ops)"
>>> +    "BriefDescription": "Other LSU flushes including: Sync (sync ack from L2 caused search of LRQ for oldest snooped load, This will either signal a Precise Flush of the oldest snooped loa or a Flush Next PPC); Data Valid Flush Next (several cases of this, one example is store and reload are lined up such that a store-hit-reload scenario exists and the CDF has already launched and has gotten bad/stale data); Bad Data Valid Flush Next (might be a few cases of this, one example is a larxa (D$ hit) return data and dval but can't allocate to LMQ (LMQ full or other reason). Already gave dval but can't watch it for snoop_hit_larx. Need to take the 'bad dval' back and flush all younger ops)"
>>>    },
>>>    {
>>>      "EventCode": "0x5094",
>>> diff --git a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
>>> index d0265f255de2..723bffa41c44 100644
>>> --- a/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
>>> +++ b/tools/perf/pmu-events/arch/powerpc/power9/pipeline.json
>>> @@ -442,7 +442,7 @@
>>>    {
>>>      "EventCode": "0x4D052",
>>>      "EventName": "PM_2FLOP_CMPL",
>>> -    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg "
>>> +    "BriefDescription": "DP vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres ,fsqrte, fneg"
>>>    },
>>>    {
>>>      "EventCode": "0x1F142",
>>> --
>>> 2.39.1
>>>
> 

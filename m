Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC4B738F34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:52:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=juxGTMRq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXgK07yxz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=juxGTMRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmXSz1pQ9z3cZv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 04:43:31 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LISFsZ003550;
	Wed, 21 Jun 2023 18:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+pC+l0tVA8Whlpv+QpYxLtQdys13EVz05hYg5BH1rMY=;
 b=juxGTMRq+m0jRNPUJp9dLK6UkhbeT9L0kMp5WDSo+RzK46TLXW161qwchaJppB2yaM8T
 xnIgC0d+tc/yBKN6TfutAwYftwOiL5fWfecUlOmIUQYTOtJj7m4LsZFE07ubHDfRI58g
 CYKDvzmugz5lOmtgBuEsnz9MkwwXWqAFTPRRD/rZ5xZAchxh4e+RM+2aJ4RQpFMvD893
 qYczWbinQUW1cellZlDoHhAMTBnsMtrT1qQA5wHpQUwuODu3pS2+E8dlGQ2eROZCpir3
 5BxXUQpV6KIi2W5NifL7ykx2IktYoHaViA2BXQzbHyXernK+i9RSVSRx4WwUcMAEtbJs bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc6gtgcxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 18:43:15 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LIfknj025617;
	Wed, 21 Jun 2023 18:43:15 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc6gtgcwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 18:43:14 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L3OLgT009702;
	Wed, 21 Jun 2023 18:43:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f5317s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 18:43:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LIh8Wn12780192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 18:43:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCC7B20040;
	Wed, 21 Jun 2023 18:43:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 539A72004B;
	Wed, 21 Jun 2023 18:43:06 +0000 (GMT)
Received: from [9.43.103.191] (unknown [9.43.103.191])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 18:43:06 +0000 (GMT)
Message-ID: <ee0bd9de-c2c7-010f-5a4d-40e07ded8a3e@linux.ibm.com>
Date: Thu, 22 Jun 2023 00:13:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 15/17] perf tests task_analyzer: fix bad substitution
 ${$1}
To: Namhyung Kim <namhyung@kernel.org>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-16-atrajeev@linux.vnet.ibm.com>
 <ZIjMWUk/axKfMCM4@kernel.org>
 <CAM9d7cjrpaNk0UC22ntBSP+LzQwT2YAHwQ2o3z1aayAZNQ329g@mail.gmail.com>
 <5ab5cc25-03b0-ef7f-3dc0-be1b59a4147d@linux.ibm.com>
 <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
Content-Language: en-IN, en-US
From: Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <CAM9d7cgcETpnNgvgJ8a966bwc0phQuVMwABHzA8APk6Z9Er=OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qLUSCoUZZDCVSwlQ9gu_0Xixz3s5nGf1
X-Proofpoint-GUID: pmHnR0uV1xKMVx8S0l7dMyzi94kRNPmH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_10,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210155
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, Hagen Paul Pfeifer <hagen@jauu.net>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, ravi.bangoria@amd.com, maddy@linux.ibm.com, jolsa@kernel.org, Petar Gligoric <petar.gligoric@rohde-schwarz.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Namhyung,

On 21/06/23 20:53, Namhyung Kim wrote:
> Hello Aditya,
>
> On Wed, Jun 21, 2023 at 3:05 AM Aditya Gupta <adityag@linux.ibm.com> wrote:
>> Hello Namhyung,
>>
>> On 21/06/23 06:18, Namhyung Kim wrote:
>>> ...
>>>
>>> $ sudo ./perf test -v task
>>> 114: perf script task-analyzer tests                                 :
>>> --- start ---
>>> test child forked, pid 1771042
>>> Please specify a valid report script(see 'perf script -l' for listing)
>>> FAIL: "invocation of perf command failed" Error message: ""
>>> FAIL: "test_basic" Error message: "Failed to find required string:'Comm'."
>>> Please specify a valid report script(see 'perf script -l' for listing)
>>> FAIL: "invocation of perf command failed" Error message: ""
>>> FAIL: "test_ns_rename" Error message: "Failed to find required string:'Comm'."
>>> ...
>>> test child finished with -1
>>> ---- end ----
>>> perf script task-analyzer tests: FAILED!
>> Can you please check if your environment has libtraceevent devel
>> libraries (or did you compile with `make NO_LIBTRACEEVENT=1`) ? When
>> libtraceevent support is not there, perf record fails and so perf.data
>> doesn't contain the strings it's searching for and hence those errors
>>
>> The error you mentioned has been mentioned and fixed in patch 17/17 of
>> this series.
> Thanks for your reply but It has libtraceevent.  Also, shouldn't it
> skip if it's not?
>
> Thanks,
> Namhyung

The skipping is handled in the 17th patch in this series, and 
considering that patch has also been applied, it will skip the tests if 
perf wasn't built with proper libtraceevent support.

Back to the error, Sorry but I tested again on my system and am unable to reproduce the issue you are seeing when built with libtraceevent support.

This is what I did:

0. git clone --depth=1 https://github.com/torvalds/linux
0. cd linux/tools/perf
0. git am patch_15/17.patch

> I applied ONLY this patch (15/17) of this series, to a fresh linux tree

1. dnf install libtraceevent-devel
2. make clean && make
3. sudo ./perf test -v "perf script task-analyzer tests"       # Working fine, tests passed

4. dnf remove libtraceevent-devel
5. make clean && make                                          # There will also be a warning during build: "libtraceevent is missing limiting functionality"
6. sudo ./perf test -v "perf script task-analyzer tests"       # Fails with the error you posted, which was the case till now, it's skipped when the 17th patch is also applied and perf built without libtraceevent support

The error in the second case (without proper libtraceevent support) is expected, as it was the case till now, that is fixed by the 17th patch, try applying that also and build perf with `make NO_LIBTRACEEVENT=1`, it will skip then.

Can you guide me with the steps to reproduce the error ?

Sidenote: Just in case, please ensure you are running the perf as root here as `perf record -e sched:sched_switch -a -- sleep 1` requires root, which has been used in `prepare_perf_data`

Thanks,
- Aditya


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403D7FED42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 11:47:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=chOB2DKz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgtDv5XdGz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=chOB2DKz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgtD03X3qz3cN3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 21:46:39 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUAH0xW005280;
	Thu, 30 Nov 2023 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AE/2XERR7UPht8zuKb8qAW9heYjd6XiKMF9o3XqjiuU=;
 b=chOB2DKz9dfdwFJcSBCzT9H296uRgtJ6DPIQaQbSWvTcF0NHHae4KjfM0rlVjMCPn/u+
 uYHFHgXLP/6RisoK8YHu5RKe7PAd9CPorTIaFBYXZ6mLBhPRbgeOazUWAKVAywM3cHxY
 FnX3lopUJW+44Eam39Dp4050fXHL5jy/OCgxVwcdKWuEixwLcaKGmFrac8b0t3XMNwxy
 mrqimBhRFjMt3eIzxqmWvvWnMS3WncDsyjsGzyVgLwAiFwHOJm6xNOxTdmydJbx2Wsnr
 UJt5GPjswAbQgdk3LBnutGjJE0tSj6tXmu4TYfW+wn4pj2eX4Clyr7kH8g90hYF9OOM4 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uprgm8q1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 10:46:29 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AUAeXxC023656;
	Thu, 30 Nov 2023 10:46:28 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uprgm8q14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 10:46:28 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU7YD2Z030222;
	Thu, 30 Nov 2023 10:46:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8nwhue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 10:46:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AUAkO6O25755910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 10:46:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55B3F20043;
	Thu, 30 Nov 2023 10:46:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D88FA20040;
	Thu, 30 Nov 2023 10:46:21 +0000 (GMT)
Received: from [9.109.248.124] (unknown [9.109.248.124])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Nov 2023 10:46:21 +0000 (GMT)
Message-ID: <6f6d99fd-9f97-d56a-ef56-3b822ae26f1e@linux.ibm.com>
Date: Thu, 30 Nov 2023 16:16:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] perf test record+probe_libc_inet_pton: Fix call chain
 match on powerpc
Content-Language: en-US
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20231126070914.175332-1-likhitha@linux.ibm.com>
 <ZWeljhj9ZH4xrqjw@kernel.org>
From: Likhitha Korrapati <likhitha@linux.ibm.com>
In-Reply-To: <ZWeljhj9ZH4xrqjw@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QvQHJWsDOgW-gK1QL78ji5ZCyLg9NF-O
X-Proofpoint-GUID: Ick8DDAxu2XAnTHUlJ7fbRokj7GFkrwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_08,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300080
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
Cc: irogers@google.com, maddy@linux.ibm.com, Disha Goel <disgoel@linux.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, james.clark@arm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnaldo,

Thank you for pointing it. From next time I will take care of it.

-Likhitha.

On 30/11/23 02:26, Arnaldo Carvalho de Melo wrote:
> Em Sun, Nov 26, 2023 at 02:09:14AM -0500, Likhitha Korrapati escreveu:
>> The perf test "probe libc's inet_pton & backtrace it with ping" fails on
>> powerpc as below:
>>
>> root@xxx perf]# perf test -v "probe libc's inet_pton & backtrace it with
>> ping"
>>   85: probe libc's inet_pton & backtrace it with ping                 :
>> --- start ---
>> test child forked, pid 96028
>> ping 96056 [002] 127271.101961: probe_libc:inet_pton: (7fffa1779a60)
>> 7fffa1779a60 __GI___inet_pton+0x0
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>> 7fffa172a73c getaddrinfo+0x121c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>> FAIL: expected backtrace entry
>> "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/libc.so.6\)$"
>> got "7fffa172a73c getaddrinfo+0x121c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
>> test child finished with -1
>> ---- end ----
> Try to have quoted output, the ones separated by ---- at the beginning
> of the line indented two spaces, so as to avoid:
>
> perf test record+probe_libc_inet_pton: Fix call chain match on powerpc
>
> The perf test "probe libc's inet_pton & backtrace it with ping" fails on
> powerpc as below:
>
> root@xxx perf]# perf test -v "probe libc's inet_pton & backtrace it with
> ping"
>   85: probe libc's inet_pton & backtrace it with ping                 :
>
> # Please enter the commit message for your changes. Lines starting
> # with '#' will be ignored, and an empty message aborts the commit.
> #
> # Author:    Likhitha Korrapati <likhitha@linux.ibm.com>
> # Date:      Sun Nov 26 02:09:14 2023 -0500
>
>
> I'm copy and pasting from the original post, thanks!
>
> - Arnaldo
>
>> probe libc's inet_pton & backtrace it with ping: FAILED!
>>
>> This test installs a probe on libc's inet_pton function, which will use
>> uprobes and then uses perf trace on a ping to localhost. It gets 3
>> levels deep backtrace and checks whether it is what we expected or not.
>>
>> The test started failing from RHEL 9.4 where as it works in previous
>> distro version (RHEL 9.2). Test expects gaih_inet function to be part of
>> backtrace. But in the glibc version (2.34-86) which is part of distro
>> where it fails, this function is missing and hence the test is failing.
>>
>>  From nm and ping command output we can confirm that gaih_inet function
>> is not present in the expected backtrace for glibc version glibc-2.34-86
>>
>> [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep gaih_inet
>> 00000000001273e0 t gaih_inet_serv
>> 00000000001cd8d8 r gaih_inet_typeproto
>>
>> [root@xxx perf]# perf script -i /tmp/perf.data.6E8
>> ping  104048 [000] 128582.508976: probe_libc:inet_pton: (7fff83779a60)
>>              7fff83779a60 __GI___inet_pton+0x0
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>              7fff8372a73c getaddrinfo+0x121c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>                 11dc73534 [unknown] (/usr/bin/ping)
>>              7fff8362a8c4 __libc_start_call_main+0x84
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>
>> FAIL: expected backtrace entry
>> "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\(/usr/lib64/glibc-hwcaps/power10/libc.so.6\)$"
>> got "7fff9d52a73c getaddrinfo+0x121c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)"
>>
>> With version glibc-2.34-60 gaih_inet function is present as part of the
>> expected backtrace. So we cannot just remove the gaih_inet function from
>> the backtrace.
>>
>> [root@xxx perf]# nm /usr/lib64/glibc-hwcaps/power10/libc.so.6 | grep gaih_inet
>> 0000000000130490 t gaih_inet.constprop.0
>> 000000000012e830 t gaih_inet_serv
>> 00000000001d45e4 r gaih_inet_typeproto
>>
>> [root@xxx perf]# ./perf script -i /tmp/perf.data.b6S
>> ping   67906 [000] 22699.591699: probe_libc:inet_pton_3: (7fffbdd80820)
>>              7fffbdd80820 __GI___inet_pton+0x0
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>              7fffbdd31160 gaih_inet.constprop.0+0xcd0
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>              7fffbdd31c7c getaddrinfo+0x14c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>>                 1140d3558 [unknown] (/usr/bin/ping)
>>
>> This patch solves this issue by doing a conditional skip. If there is a
>> gaih_inet function present in the libc then it will be added to the
>> expected backtrace else the function will be skipped from being added
>> to the expected backtrace.
>>
>> Output with the patch
>>
>> [root@xxx perf]# ./perf test -v "probe libc's inet_pton & backtrace it
>> with ping"
>>   83: probe libc's inet_pton & backtrace it with ping                 :
>> --- start ---
>> test child forked, pid 102662
>> ping 102692 [000] 127935.549973: probe_libc:inet_pton: (7fff93379a60)
>> 7fff93379a60 __GI___inet_pton+0x0
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>> 7fff9332a73c getaddrinfo+0x121c
>> (/usr/lib64/glibc-hwcaps/power10/libc.so.6)
>> 11ef03534 [unknown] (/usr/bin/ping)
>> test child finished with 0
>> ---- end ----
>> probe libc's inet_pton & backtrace it with ping: Ok
>>
>> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>
>> Reported-by: Disha Goel <disgoel@linux.ibm.com>
>> ---
>>   tools/perf/tests/shell/record+probe_libc_inet_pton.sh | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
>> index eebeea6bdc76..72c65570db37 100755
>> --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
>> +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
>> @@ -45,7 +45,10 @@ trace_libc_inet_pton_backtrace() {
>>   		;;
>>   	ppc64|ppc64le)
>>   		eventattr='max-stack=4'
>> -		echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
>> +		# Add gaih_inet to expected backtrace only if it is part of libc.
>> +		if nm $libc | grep -F -q gaih_inet.; then
>> +			echo "gaih_inet.*\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
>> +		fi
>>   		echo "getaddrinfo\+0x[[:xdigit:]]+[[:space:]]\($libc\)$" >> $expected
>>   		echo ".*(\+0x[[:xdigit:]]+|\[unknown\])[[:space:]]\(.*/bin/ping.*\)$" >> $expected
>>   		;;
>> -- 
>> 2.39.1
>>

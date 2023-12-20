Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD481A906
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 23:21:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwShg24bfz3cb2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 09:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=renyu.zj@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sw6PV4FDWz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 19:37:16 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=renyu.zj@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VyteU4X_1703061428;
Received: from 30.221.146.20(mailfrom:renyu.zj@linux.alibaba.com fp:SMTPD_---0VyteU4X_1703061428)
          by smtp.aliyun-inc.com;
          Wed, 20 Dec 2023 16:37:09 +0800
Message-ID: <98276b4d-d842-4dac-ab06-2e0fd245f3a8@linux.alibaba.com>
Date: Wed, 20 Dec 2023 16:37:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: perf tools arch Arm CMN PMU JSON files build breakage on ubuntu
 18.04 cross build
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <ZBxP77deq7ikTxwG@kernel.org>
 <a21aa4e1-506a-916c-03bd-39d7403c7941@linux.ibm.com>
 <ZXxlERShV-TIGVit@kernel.org> <ZXxlj3g-KMG3iYjx@kernel.org>
From: Jing Zhang <renyu.zj@linux.alibaba.com>
In-Reply-To: <ZXxlj3g-KMG3iYjx@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Dec 2023 09:21:15 +1100
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
Cc: Ian Rogers <irogers@google.com>, kajoljain <kjain@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2023/12/15 下午10:41, Arnaldo Carvalho de Melo 写道:
> Em Fri, Dec 15, 2023 at 11:39:14AM -0300, Arnaldo Carvalho de Melo escreveu:
>> Em Mon, Mar 27, 2023 at 09:52:11AM +0530, kajoljain escreveu:
>>> On 3/23/23 18:41, Arnaldo Carvalho de Melo wrote:
>>>> Exception processing pmu-events/arch/powerpc/power9/other.json
>>>> Traceback (most recent call last):
>>>>   File "pmu-events/jevents.py", line 997, in <module>
>>>>     main()
>>>>   File "pmu-events/jevents.py", line 979, in main
>>>>     ftw(arch_path, [], preprocess_one_file)
>>>>   File "pmu-events/jevents.py", line 935, in ftw
>>>>     ftw(item.path, parents + [item.name], action)
>>>>   File "pmu-events/jevents.py", line 933, in ftw
>>>>     action(parents, item)
>>>>   File "pmu-events/jevents.py", line 514, in preprocess_one_file
>>>>     for event in read_json_events(item.path, topic):
>>>>   File "pmu-events/jevents.py", line 388, in read_json_events
>>>>     events = json.load(open(path), object_hook=JsonEvent)
>>>>   File "/usr/lib/python3.6/json/__init__.py", line 296, in load
>>>>     return loads(fp.read(),
>>>>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>>>     return codecs.ascii_decode(input, self.errors)[0]
>>>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 55090: ordinal not in range(128)
>>>>   CC      /tmp/build/perf/tests/expr.o
>>>> pmu-events/Build:35: recipe for target '/tmp/build/perf/pmu-events/pmu-events.c' failed
>>>> make[3]: *** [/tmp/build/perf/pmu-events/pmu-events.c] Error 1
>>>> make[3]: *** Deleting file '/tmp/build/perf/pmu-events/pmu-events.c'
>>>> Makefile.perf:679: recipe for target '/tmp/build/perf/pmu-events/pmu-events-in.o' failed
>>>> make[2]: *** [/tmp/build/perf/pmu-events/pmu-events-in.o] Error 2
>>>> make[2]: *** Waiting for unfinished jobs....
>>
>>>> Now jevents is an opt-out feature so I'm noticing these problems.
>>  
>>>     Thanks for raising it. I will check this issue.
>>
>> Now I'm seeing this on:
> 
> Jing,
> 
> 	Please take a look at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d9df8731c0941f3add30f96745a62586a0c9d52
> 
> 	For the fix for the ppc case above.
> 

I'm sorry for the breakage. Thanks for the catch! I will fix it soon.

Thanks,
Jing


> - Arnaldo
>  
>> Exception processing pmu-events/arch/arm64/arm/cmn/sys/cmn.json
>> Traceback (most recent call last):
>>   File "pmu-events/jevents.py", line 1285, in <module>
>>     main()
>>   File "pmu-events/jevents.py", line 1267, in main
>>     ftw(arch_path, [], preprocess_one_file)
>>   File "pmu-events/jevents.py", line 1217, in ftw
>>     ftw(item.path, parents + [item.name], action)
>>   File "pmu-events/jevents.py", line 1217, in ftw
>>     ftw(item.path, parents + [item.name], action)
>>   File "pmu-events/jevents.py", line 1217, in ftw
>>     ftw(item.path, parents + [item.name], action)
>>   File "pmu-events/jevents.py", line 1215, in ftw
>>     action(parents, item)
>>   File "pmu-events/jevents.py", line 599, in preprocess_one_file
>>     for event in read_json_events(item.path, topic):
>>   File "pmu-events/jevents.py", line 416, in read_json_events
>>     events = json.load(open(path), object_hook=JsonEvent)
>>   File "/usr/lib/python3.6/json/__init__.py", line 296, in load
>>     return loads(fp.read(),
>>   File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
>>     return codecs.ascii_decode(input, self.errors)[0]
>> UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 3071: ordinal not in range(128)
>>
> 

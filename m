Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BB7B9BD0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 10:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1PqK2NFNz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 19:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=james.clark@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 529 seconds by postgrey-1.37 at boromir; Thu, 05 Oct 2023 19:28:48 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Ppm0XWBz3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 19:28:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE706C15;
	Thu,  5 Oct 2023 01:20:01 -0700 (PDT)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A483F3F762;
	Thu,  5 Oct 2023 01:19:20 -0700 (PDT)
Message-ID: <db2937bf-ffd7-e227-25eb-8cfadd9e1e55@arm.com>
Date: Thu, 5 Oct 2023 09:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
Content-Language: en-US
To: Namhyung Kim <namhyung@kernel.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cj26Dpit3igZjybsbnotBiv_F8mEu62Aor+9bBhwVh55g@mail.gmail.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <CAM9d7cj26Dpit3igZjybsbnotBiv_F8mEu62Aor+9bBhwVh55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/10/2023 06:02, Namhyung Kim wrote:
> On Thu, Sep 28, 2023 at 9:11 PM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>
>> Running shellcheck on tests/shell/test_arm_coresight.sh
>> throws below warnings:
>>
>>         In tests/shell/test_arm_coresight.sh line 15:
>>         cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu* -print -quit)
>>                   ^--^ SC2061: Quote the parameter to -name so the shell won't interpret it.
>>
>>         In tests/shell/test_arm_coresight.sh line 20:
>>                 if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
>>                                      ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined
>>
>> This warning is observed after commit:
>> "commit bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")"
>>
>> Fixed this issue by using quoting 'cpu*' for SC2061 and
>> using "&&" in line number 20 for SC2166 warning
>>
>> Fixes: bb350847965d ("perf test: Update cs_etm testcase for Arm ETE")
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> You'd better add Coresight folks on this.
> Maybe this file was missing in the MAINTAINERS file.
> 
> Thanks,
> Namhyung
> 

get_maintainer already does a pretty good job with the defaults, but
maybe I can try to add all the Coresight Perf stuff in the maintainers file.

> 
>> ---
>>  tools/perf/tests/shell/test_arm_coresight.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
>> index fe78c4626e45..f2115dfa24a5 100755
>> --- a/tools/perf/tests/shell/test_arm_coresight.sh
>> +++ b/tools/perf/tests/shell/test_arm_coresight.sh
>> @@ -12,12 +12,12 @@
>>  glb_err=0
>>
>>  cs_etm_dev_name() {
>> -       cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu* -print -quit)
>> +       cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name 'cpu*' -print -quit)
>>         trcdevarch=$(cat ${cs_etm_path}/mgmt/trcdevarch)
>>         archhver=$((($trcdevarch >> 12) & 0xf))
>>         archpart=$(($trcdevarch & 0xfff))
>>
>> -       if [ $archhver -eq 5 -a "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
>> +       if [ $archhver -eq 5 ] && [ "$(printf "0x%X\n" $archpart)" = "0xA13" ] ; then
>>                 echo "ete"
>>         else
>>                 echo "etm"
>> --
>> 2.31.1
>>

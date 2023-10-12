Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FA7C7214
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 18:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5vhD54Hdz3vXp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 03:08:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=suzuki.poulose@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5vgh5Pmdz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 03:08:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2C6E13D5;
	Thu, 12 Oct 2023 09:08:21 -0700 (PDT)
Received: from [10.57.3.94] (unknown [10.57.3.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19813F7A6;
	Thu, 12 Oct 2023 09:07:38 -0700 (PDT)
Message-ID: <2219fc04-4484-b365-1281-a5307b368ec5@arm.com>
Date: Thu, 12 Oct 2023 17:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] perf tests test_arm_coresight: Fix the shellcheck
 warning in latest test_arm_coresight.sh
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 "David.Laight@aculab.com" <David.Laight@ACULAB.COM>, mike.leach@linaro.org,
 James Clark <james.clark@arm.com>, Namhyung Kim <namhyung@kernel.org>,
 tianruidong@linux.alibaba.com, Leo Yan <leo.yan@linaro.org>,
 yangtiezhu@loongson.cn
References: <20230929041133.95355-1-atrajeev@linux.vnet.ibm.com>
 <20230929041133.95355-2-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cj26Dpit3igZjybsbnotBiv_F8mEu62Aor+9bBhwVh55g@mail.gmail.com>
 <c59c586e-08ab-df66-7bcd-5249d2481298@arm.com>
 <4C5929B2-96B3-46D5-82ED-ADD6A0CDE97B@linux.vnet.ibm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4C5929B2-96B3-46D5-82ED-ADD6A0CDE97B@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12/10/2023 16:56, Athira Rajeev wrote:
> 
> 
>> On 05-Oct-2023, at 3:06 PM, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 05/10/2023 06:02, Namhyung Kim wrote:
>>> On Thu, Sep 28, 2023 at 9:11 PM Athira Rajeev
>>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>>

...

>> Thanks for the fix.
>>
>> Nothing to do with this patch, but I am wondering if the original patch
>> is over engineered and may not be future proof.
>>
>> e.g.,
>>
>> cs_etm_dev_name() {
>> + cs_etm_path=$(find  /sys/bus/event_source/devices/cs_etm/ -name cpu* -print -quit)
>>
>> Right there you got the device name and we can easily deduce the name of
>> the "ETM" node.
>>
>> e.g,:
>> etm=$(basename $(readlink cs_etm_path) | sed "s/[0-9]\+$//")
>>
>> And practically, nobody prevents an ETE mixed with an ETM on a "hybrid"
>> system (hopefully, no one builds it ;-))
>>
>> Also, instead of hardcoding "ete" and "etm" prefixes from the arch part,
>> we should simply use the cpu nodes from :
>>
>> /sys/bus/event_source/devices/cs_etm/
>>
>> e.g.,
>>
>> arm_cs_etm_traverse_path_test() {
>> # Iterate for every ETM device
>> for c in /sys/bus/event_source/devices/cs_etm/cpu*; do
>> # Read the link to be on the safer side
>> dev=`readlink $c`
>>
>> # Find the ETM device belonging to which CPU
>> cpu=`cat $dev/cpu`
>>
>> # Use depth-first search (DFS) to iterate outputs
>> arm_cs_iterate_devices $dev $cpu
>> done;
>> }
>>
>>
>>
>>> You'd better add Coresight folks on this.
>>> Maybe this file was missing in the MAINTAINERS file.
>>
>> And the original author of the commit, that introduced the issue too.
>>
>> Suzuki
> 
> Hi All,
> Thanks for the discussion and feedbacks.
> 
> This patch fixes the shellcheck warning introduced in function "cs_etm_dev_name". But with the changes that Suzuki suggested, we won't need the function "cs_etm_dev_name" since the code will use "/sys/bus/event_source/devices/cs_etm/" .  In that case, can I drop this patch for now from this series ?
> 

Yes, please. James will send out the proposed patch

Suzuki



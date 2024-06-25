Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D55519166D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 14:03:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ewk3c50O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7k4C2ZjCz3dTB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 22:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ewk3c50O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7k3W27ySz3d94
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 22:02:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719316953; x=1750852953;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=B9l0BIayFtO54fFICK7mPu8xZAkJYHVx2FObwn9vcM8=;
  b=Ewk3c50O7zWRMi8DhImJAwHUbFB8TPAm/srFg2XCzjDRV8FgGgtL7qGf
   OODlXfeTPpXe1WZYuz6m1sioWIyTcIEHT8DFctrlPsHqKMPq0QFxZkkQ0
   cBjvof0GVNMXccQDcUzkb/vZJ4qISc/ifIfaMiNLc1QknFXK1mLQO4CrE
   2rUF+t/btV6sivlmb09co69LWUcJdRm2BY+zTvZjvidkAQyh6EsSDK9DG
   kpMXyPBz3Qygev0hVdkghkQy1ruY3LD+gPuI2WHGoxs4HJ8fYxlk4QOVW
   +L7j2J95V9EH0hHdMSWpsnVZ7whRkJ9uKkrhdk49n6vzGFef0oxR8V5k0
   A==;
X-CSE-ConnectionGUID: nP90586GQRuLKbg5naSygw==
X-CSE-MsgGUID: cLGm1IpeTGumxd1iMQeKPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33784980"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="33784980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:02:19 -0700
X-CSE-ConnectionGUID: 63BfM6SNScqsG5vTAhBsww==
X-CSE-MsgGUID: yh+tJ62YRA2xCkNXkbfKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="43734681"
Received: from gcivario-mobl.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.48.191])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:02:15 -0700
Message-ID: <f65ff3cf-1724-45a1-ad88-200d72251042@intel.com>
Date: Tue, 25 Jun 2024 15:02:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] tools/perf: Fix the string match for
 "/tmp/perf-$PID.map" files in dso__load
From: Adrian Hunter <adrian.hunter@intel.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20240623064850.83720-1-atrajeev@linux.vnet.ibm.com>
 <722cb4bc-89d4-4e03-a80d-ffe05be52c05@intel.com>
Content-Language: en-US
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <722cb4bc-89d4-4e03-a80d-ffe05be52c05@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/06/24 14:57, Adrian Hunter wrote:
> On 23/06/24 09:48, Athira Rajeev wrote:
>> Perf test for perf probe of function from different CU fails
>> as below:
>>
>> 	./perf test -vv "test perf probe of function from different CU"
>> 	116: test perf probe of function from different CU:
>> 	--- start ---
>> 	test child forked, pid 2679
>> 	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.Msa7iy89bx/testfile
>> 	  Error: Failed to add events.
>> 	--- Cleaning up ---
>> 	"foo" does not hit any event.
>> 	  Error: Failed to delete events.
>> 	---- end(-1) ----
>> 	116: test perf probe of function from different CU                   : FAILED!
>>
>> The test does below to probe function "foo" :
>>
>> 	# gcc -g -Og -flto -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.c
>> 	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
>> 	# gcc -g -Og -c /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.c
>> 	-o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
>> 	# gcc -g -Og -o /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
>> 	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-foo.o
>> 	/tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile-main.o
>>
>> 	# ./perf probe -x /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile foo
>> 	Failed to find symbol foo in /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7/testfile
>> 	   Error: Failed to add events.
>>
>> Perf probe fails to find symbol foo in the executable placed in
>> /tmp/perf-uprobe-different-cu-sh.XniNxNEVT7
>>
>> Simple reproduce:
>>
>>  # mktemp -d /tmp/perf-checkXXXXXXXXXX
>>    /tmp/perf-checkcWpuLRQI8j
>>
>>  # gcc -g -o test test.c
>>  # cp test /tmp/perf-checkcWpuLRQI8j/
>>  # nm /tmp/perf-checkcWpuLRQI8j/test | grep foo
>>    00000000100006bc T foo
>>
>>  # ./perf probe -x /tmp/perf-checkcWpuLRQI8j/test foo
>>    Failed to find symbol foo in /tmp/perf-checkcWpuLRQI8j/test
>>       Error: Failed to add events.
>>
>> But it works with any files like /tmp/perf/test. Only for
>> patterns with "/tmp/perf-", this fails.
>>
>> Further debugging, commit 80d496be89ed ("perf report: Add support
>> for profiling JIT generated code") added support for profiling JIT
>> generated code. This patch handles dso's of form
>> "/tmp/perf-$PID.map" .
>>
>> The check used "if (strncmp(self->name, "/tmp/perf-", 10) == 0)"
>> to match "/tmp/perf-$PID.map". With this commit, any dso in
>> /tmp/perf- folder will be considered separately for processing
>> (not only JIT created map files ). Fix this by changing the
>> string pattern to check for "/tmp/perf-%d.map". Add a helper
>> function is_perf_pid_map_name to do this check. In "struct dso",
>> dso->long_name holds the long name of the dso file. Since the
>> /tmp/perf-$PID.map check uses the complete name, use dso___long_name for
>> the string name.
>>
>> With the fix,
>> 	# ./perf test "test perf probe of function from different CU"
>> 	117: test perf probe of function from different CU                   : Ok
>>
>> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 

Although it could use a Fixes tag


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073C780635
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 09:16:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ee1efWaw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRtTx212Hz2ysB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ee1efWaw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRtSy1T13z2ytK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 17:15:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692342962; x=1723878962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Xb+sScC9CG+Wcg8gmAQfZwVhPDsFYdn1wwo2UBGqVP0=;
  b=Ee1efWawLZiakg0o3tNQsUgMG8IFXLalVvdCK0//Q2r0zvtX55HuwrhU
   01mCV6CtDwXhkNLMdTcV+ppBswvHH0WTmklyKUI78GWJx3E8P9S9N0ZUJ
   gSDj/5N+vDla67ZwL5hcIrm4DR9+TZjWYtPart5gSW9km4hQAnVQ8Vr0c
   vCdEJgs+zoQl3PA+0NWSh9/qKJaH590HZmpvAZ5kGQSNnJw1wFmLjQjVB
   QDy/ox5MWtDg61rFNt5t9noorThjFRXDtEoad/JABQdykr7/rK/58eQl6
   JUChXgMrHwsv1NusbqRZjZvfiZXm+UQRrgpBP6UgoclJAbKEr0HWZgx81
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="404017313"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="404017313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800379388"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="800379388"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.212.27])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:15:51 -0700
Message-ID: <da3492ac-5473-f25b-f229-f213242321b1@intel.com>
Date: Fri, 18 Aug 2023 10:15:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH V2 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230817171852.55629-1-atrajeev@linux.vnet.ibm.com>
 <20230817171852.55629-2-atrajeev@linux.vnet.ibm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230817171852.55629-2-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/08/23 20:18, Athira Rajeev wrote:
> The testcase "Object code reading" fails in somecases
> for "fs_something" sub test as below:
> 
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
> 
> This can alo be reproduced when running perf record with
> workload that exercises fs_something() code. In the test
> setup, this is exercising xfs code since root is xfs.
> 
>     # perf record ./a.out
>     # perf report -v |grep "xfs.ko"
>       0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007de5efc B [k] xlog_cil_commit
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007d5ae18 B [k] xfs_btree_key_offset
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007e11fd4 B [k] 0x0000000000112074
> 
> Here addr "0xc008000007e11fd4" is not resolved. since this is a
> kernel module, its offset is from the DSO. Xfs module is loaded
> at 0xc008000007d00000
> 
>    # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
> 
> And size is 0x220000. So its loaded between  0xc008000007d00000
> and 0xc008000007f20000. From objdump, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
> 
> Hence perf captured ip maps to 0x112074 which is:
> ( ip - start of module ) + a0
> 
> This offset 0x112074 falls out .text section which is up to 0x10f7bc
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
> 
> To address this issue in "object code reading", skip the sample if
> address falls out of text section and is within the module end.
> Use the "text_end" member of "struct dso" to do this check.
> 
> To address this issue in "perf report", exploring an option of
> having stubs range as part of the /proc/kallsyms, so that perf
> report can resolve addresses in stubs range
> 
> However this patch uses text_end to skip the stub range for
> Object code reading testcase.
> 
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/tests/code-reading.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> index ed3815163d1b..911f8fa13677 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,14 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
>  	if (addr + len > map__end(al.map))
>  		len = map__end(al.map) - addr;
>  
> +	/* Check if the ip offset falls in stubs sections for kernel modules */

What arches have stubs - maybe expand the comment a bit e.g.
"Some architectures (such as blah blah) have stubs (trampolines) in kernel modules to manage long jumps"

> +	if (strstr(dso->long_name, ".ko")) {
> +		if ((al.addr < map__end(al.map)) && (al.addr > dso->text_end)) {

Why check al.addr < map__end(al.map) ?  addr must be on the map mustn't it?

Also please remove redundant parentheses.

> +			pr_debug(" - skipping\n");

"skipping" but why.  Maybe "skipping module address after text end"

> +			goto out;
> +		}
> +	}
> +
>  	/* Read the object code using perf */
>  	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
>  					al.addr, buf1, len);


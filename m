Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996207A1566
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:27:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ae+1+OVN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn2lC37Bbz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ae+1+OVN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn2kG6vHWz3dHL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:27:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694755623; x=1726291623;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=36IV7hYksJ1v6vHb3GyDuA/GQJujBm32nV6ivmAaysM=;
  b=Ae+1+OVNFFSxwvbkxBBPINGbV3E8kR04SPVBO74T26+3ax8ijx9LPoMQ
   tlkylGOWuq8bsmO+RS21tj1KlK/NZ7yN8J8cRiEWa+ro4eFbEBBThZWm8
   WcVl49KylNurQ9A/TZl0Ai93LiUBpTYZzS6W5QN9N/lVNmL5ClXLy24GT
   KAVwINF6+LpKuf1+wOCddkOloAsRymmfWkgWYjTVIV57I2GBMEUlWAJhZ
   CnwIKAZ0+Hy5CIaci7MyxoHCXH1vyWwID8fA9eGxBDyTqPpyAg8A0qjod
   7v5Kz7AlQmjCW0gpXkrxCHnrLF6Ka3jShy0Rqq1/p7H/dixlU0p6kFqrb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376498001"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="376498001"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 22:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779949358"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="779949358"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.249.45.225])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 22:26:52 -0700
Message-ID: <d4bf783c-191a-a80b-8001-3597c634e814@intel.com>
Date: Fri, 15 Sep 2023 08:26:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [PATCH V3 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230915052412.2643-1-atrajeev@linux.vnet.ibm.com>
 <20230915052412.2643-2-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230915052412.2643-2-atrajeev@linux.vnet.ibm.com>
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

On 15/09/23 08:24, Athira Rajeev wrote:
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
> Tested-by: Disha Goel<disgoel@linux.ibm.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> Changelog:
>  v2 -> v3:
>  Used strtailcmp in comparison for module check and added Reviewed-by
>  from Adrian, Tested-by from Disha.
> 
>  v1 -> v2:
>  Updated comment to add description on which arch has stub and
>  reason for skipping as suggested by Adrian
> 
>  tools/perf/tests/code-reading.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> index ed3815163d1b..45334d26058e 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,16 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
>  	if (addr + len > map__end(al.map))
>  		len = map__end(al.map) - addr;
>  
> +	/*
> +	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
> +	 * modules to manage long jumps. Check if the ip offset falls in stubs
> +	 * sections for kernel modules. And skip module address after text end
> +	 */
> +	if (!strtailcmp(dso->long_name, ".ko") && al.addr > dso->text_end) {
> +			pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
> +			goto out;

Double indent

> +	}
> +
>  	/* Read the object code using perf */
>  	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
>  					al.addr, buf1, len);


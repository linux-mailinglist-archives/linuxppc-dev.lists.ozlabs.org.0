Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F537A0CB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eN4VMf22;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmm2f68X0z3cRH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 04:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eN4VMf22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmm1g49RJz3cBd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 04:24:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694715864; x=1726251864;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vQEad+iVRYrnSICTqMKn5SStFtxk1n6bfGZFb++F47I=;
  b=eN4VMf22C1jkGZKk3qLT/+Dw6mJUICuFRENz4XxiEnXHCx2dpuao3Gcw
   EzAO5P/+M11El0VC2xU69gfA1CXOyfmnkIKAXFeVa2fDnluim5XuHqJtp
   2PMNzS7V0rtwhvf/R3QIGejVV/Kdpq8u35OMzA5s6YF6H3dDiil84b17A
   F2evrUi50DjO7evgNJT3uSr80wqhg4mZg98raHyF5QSUQR3TdnUTRfjqQ
   AXRzdZ+WI70hGAprABA/FcvBlWPs7jRQAhhIYMLlpdNTZWM1Y27qWr8nC
   xrzmw6Ud6NDFNOI+rS4A0I/w7alHA41QFtykf30t9krod8m4SN60bwRF8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378958688"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="378958688"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="814824645"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="814824645"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.36.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:24:10 -0700
Message-ID: <dd332de9-5b51-fe88-f0ed-012c8143d2be@intel.com>
Date: Thu, 14 Sep 2023 21:24:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [V2 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
 <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230907164529.36222-2-atrajeev@linux.vnet.ibm.com>
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

On 7/09/23 19:45, Athira Rajeev wrote:
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
> Changelog:
>  v1 -> v2:
>  Updated comment to add description on which arch has stub and
>  reason for skipping as suggested by Adrian
> 
>  tools/perf/tests/code-reading.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> index ed3815163d1b..3cf6c2d42416 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,18 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
>  	if (addr + len > map__end(al.map))
>  		len = map__end(al.map) - addr;
>  
> +	/*
> +	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
> +	 * modules to manage long jumps. Check if the ip offset falls in stubs
> +	 * sections for kernel modules. And skip module address after text end
> +	 */
> +	if (strstr(dso->long_name, ".ko")) {

Sorry for slow reply

!strtailcmp() is slightly better here

> +		if (al.addr > dso->text_end) {

We normally avoid nesting if-statements e.g.

	if (!strtailcmp(dso->long_name, ".ko") && al.addr > dso->text_end)

Make those changes and you can add:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>


> +			pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
> +			goto out;
> +		}
> +	}
> +
>  	/* Read the object code using perf */
>  	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
>  					al.addr, buf1, len);


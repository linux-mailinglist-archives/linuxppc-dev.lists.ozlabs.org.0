Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB1778A5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 11:51:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxU9WRxU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMfF32sTyz3cHS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 19:51:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TxU9WRxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMfD16V7Yz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 19:50:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691747410; x=1723283410;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4OvXogAMzq1MUbx9QUPRVTXSgzW8v3KRMM78CixHbJY=;
  b=TxU9WRxUqSmIinsWZhGdGCJHf+h3qtzSnwT0PbIwgTilWOHimsyajDVa
   T2OSJru/qRcLincactWjLYLA5COtcvUP+wnCQlmMYaS7Y/j7CGwhaB7/u
   bNUWhbrHCNasscoY/YRSgLH0neNXFFD62aQlJ/ExdfXBZSN4g8R/Z1WrS
   DbF4m2U020AeyhYrSdNHKDD80dyg6kDHogn9bqlhHawzsjm93vNJKe1N6
   SENr3xfDDbJ0VXYD1d5OIeY4j6ZjMpTWr+SXk9PTBUHmcqhhzfBl/jiyj
   7wybkaJgtvSyiYZ32msmfni05iC/NTLZkS1P+O8/NtstFxuYYZdDw1hPR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351962823"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="351962823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767614654"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="767614654"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.51.13])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:49:40 -0700
Message-ID: <f21cbbed-8e51-fae1-9e77-56b5d239bafd@intel.com>
Date: Fri, 11 Aug 2023 12:49:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH] tools/perf: Fix dso kernel load and symbol process to
 correctly map dso to its long_name, type and adjust_symbols
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230811051546.70039-1-atrajeev@linux.vnet.ibm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230811051546.70039-1-atrajeev@linux.vnet.ibm.com>
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/08/23 08:15, Athira Rajeev wrote:
> Test "object cocde reading" fails sometimes for kernel address
> as below:
> 
>     Reading object code for memory address: 0xc000000000004c3c
>     File is: [kernel.kallsyms]
>     On file address is: 0x14c3c
>     dso__data_read_offset failed
>     test child finished with -1
>     ---- end ----
>     Object code reading: FAILED!
> 
> Here the dso__data_read_offset fails for symbol address
> 0xc000000000004c3c. This is because, the dso long_name here
> is [kernel.kallsyms] and hence open_dso fails to open this
> file. There is an incorrect dso to map handling here. The
> key points here is:
> - dso long_name is set to [kernel.kallsyms]. This file is
>   not present and hence returns error
> - DSO binary type is set to DSO_BINARY_TYPE__NOT_FOUND
> - dso adjust_symbols is set to zero
> 
> In the end dso__data_read_offset() returns -1 and the address
> 0x14c3c can not be resolved. Hence the test fails. But the
> address actually maps to kernel dso
> 
>     # objdump -z -d --start-address=0xc000000000004c3c --stop-address=0xc000000000004cbc /home/athira/linux/vmlinux
> 
>     /home/athira/linux/vmlinux:     file format elf64-powerpcle
> 
>     Disassembly of section .head.text:
> 
>     c000000000004c3c <exc_virt_0x4c00_system_call+0x3c>:
>     c000000000004c3c:	a6 02 9b 7d 	mfsrr1  r12
>     c000000000004c40:	78 13 42 7c 	mr      r2,r2
>     c000000000004c44:	18 00 4d e9 	ld      r10,24(r13)
>     c000000000004c48:	60 c6 4a 61 	ori     r10,r10,50784
>     c000000000004c4c:	a6 03 49 7d 	mtctr   r10
> 
> Fix the dso__process_kernel_symbol function to set the
> binary_type and adjust_symbols. adjust_symbols is used by
> function "map__rip_2objdump" which converts symbol start
> address to objdump address. Also set the dso long_name during
> dso__load_vmlinux function.
> 
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Note: Found similar discussion here in thread:
>       https://www.spinics.net/lists/linux-perf-users/msg06337.html
>       where Adrian proposed the fix, but looks like this was
>       not added to the perf. Hence addeed Suggested-by from Adrian.
> 
>       Additional to the fix proposed by Adrian, the patch also
>       adds setting of adjust_symbols which is needed for
>       map__rip_2objdump to convert symbol start to objdump address.
> 
>  tools/perf/util/symbol-elf.c |  2 ++
>  tools/perf/util/symbol.c     | 15 ++++++++++-----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 252d26a59e64..9e7eeaf616b8 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1440,6 +1440,8 @@ static int dso__process_kernel_symbol(struct dso *dso, struct map *map,
>  		curr_dso->kernel = dso->kernel;
>  		curr_dso->long_name = dso->long_name;
>  		curr_dso->long_name_len = dso->long_name_len;
> +		curr_dso->binary_type = dso->binary_type;
> +		curr_dso->adjust_symbols = dso->adjust_symbols;
>  		curr_map = map__new2(start, curr_dso);
>  		dso__put(curr_dso);
>  		if (curr_map == NULL)
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index f849f9ef68e6..3f36675b7c8f 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -2204,15 +2204,20 @@ int dso__load_vmlinux(struct dso *dso, struct map *map,
>  	if (symsrc__init(&ss, dso, symfs_vmlinux, symtab_type))
>  		return -1;
>  
> +	/*
> +	 * dso__load_sym() may copy 'dso' which will result in the copies having
> +	 * an incorrect long name unless we set it here first.
> +	 */
> +	dso__set_long_name(dso, vmlinux, vmlinux_allocated);
> +	if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
> +		dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
> +	else
> +		dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
> +
>  	err = dso__load_sym(dso, map, &ss, &ss, 0);
>  	symsrc__destroy(&ss);
>  
>  	if (err > 0) {
> -		if (dso->kernel == DSO_SPACE__KERNEL_GUEST)
> -			dso->binary_type = DSO_BINARY_TYPE__GUEST_VMLINUX;
> -		else
> -			dso->binary_type = DSO_BINARY_TYPE__VMLINUX;
> -		dso__set_long_name(dso, vmlinux, vmlinux_allocated);
>  		dso__set_loaded(dso);
>  		pr_debug("Using %s for symbols\n", symfs_vmlinux);
>  	}


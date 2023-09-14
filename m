Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F137A0CA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:20:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JKLBn98j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmlxQ5YTQz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 04:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JKLBn98j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmlwW2JCsz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 04:19:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694715595; x=1726251595;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=De4HkXcpldj5d0/4spgjzJrO6UBeAYkur32cA5gYHKs=;
  b=JKLBn98jwBZPSc1v/P1c7SU5PZ8sqv9v9XJ94Wpd4JBNb6MnLE5hZHRj
   pyBgUT47Gc+JRH0/5xjRQ+KPlaHZgFnce9CHqn90KkHaHs7jDccMuCUBo
   FjBFnpJ0j6W0b1xl6Q4pzOXZ2TYzkk47PDla+nY6nzgQUc55bCuFa5ET8
   IyBK+l1cU2BIH9haU0bBtcNhJ4Gu3I8bz2xn3cg+cNh/xeC+fLVOlPGmg
   rp6brqAQKOCjPmOCANp68EGn4zbOrkL/pS+vOMjKXmXDLm0r6o6djnXzE
   FHnKMxYh9thscfalkCc8ZW238N6Vm+HjabL6W3CrllJYtSNnfCAXxgMIf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359295311"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="359295311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="834838103"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="834838103"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.36.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:19:41 -0700
Message-ID: <3a03f694-ab6a-3985-9386-203e7137ae7f@intel.com>
Date: Thu, 14 Sep 2023 21:19:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [V2 1/2] tools/perf: Add text_end to "struct dso" to save .text
 section size
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
References: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230907164529.36222-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/09/23 19:45, Athira Rajeev wrote:
> Update "struct dso" to include new member "text_end".
> This new field will represent the offset for end of text
> section for a dso. For elf, this value is derived as:
> sh_size (Size of section in byes) + sh_offset (Section file
> offst) of the elf header for text.
> 
> For bfd, this value is derived as:
> 1. For PE file,
> section->size + ( section->vma - dso->text_offset)
> 2. Other cases:
> section->filepos (file position) + section->size (size of
> section)
> 
> To resolve the address from a sample, perf looks at the
> DSO maps. In case of address from a kernel module, there
> were some address found to be not resolved. This was
> observed while running perf test for "Object code reading".
> Though the ip falls beteen the start address of the loaded
> module (perf map->start ) and end address ( perf map->end),
> it was unresolved.
> 
> Example:
> 
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
> 
> Here, module is loaded at:
>     # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
> 
> From objdump for xfs module, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
> 
> Here the offset for 0xc008000007f0142c ie  0x112074 falls out
> .text section which is up to 0x10f7bc.
> 
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
> 
> To identify such  address, which falls out of text
> section and within module end, added the new field "text_end" to
> "struct dso".
> 
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Changelog:
>  v1 -> v2:
>  Added text_end for bfd also by updating dso__load_bfd_symbols
>  as suggested by Adrian.
> 
>  tools/perf/util/dso.h        | 1 +
>  tools/perf/util/symbol-elf.c | 4 +++-
>  tools/perf/util/symbol.c     | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index b41c9782c754..70fe0fe69bef 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -181,6 +181,7 @@ struct dso {
>  	u8		 rel;
>  	struct build_id	 bid;
>  	u64		 text_offset;
> +	u64		 text_end;
>  	const char	 *short_name;
>  	const char	 *long_name;
>  	u16		 long_name_len;
> diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> index 95e99c332d7e..9e7eeaf616b8 100644
> --- a/tools/perf/util/symbol-elf.c
> +++ b/tools/perf/util/symbol-elf.c
> @@ -1514,8 +1514,10 @@ dso__load_sym_internal(struct dso *dso, struct map *map, struct symsrc *syms_ss,
>  	}
>  
>  	if (elf_section_by_name(runtime_ss->elf, &runtime_ss->ehdr, &tshdr,
> -				".text", NULL))
> +				".text", NULL)) {
>  		dso->text_offset = tshdr.sh_addr - tshdr.sh_offset;
> +		dso->text_end = tshdr.sh_offset + tshdr.sh_size;
> +	}
>  
>  	if (runtime_ss->opdsec)
>  		opddata = elf_rawdata(runtime_ss->opdsec, NULL);
> diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
> index 3f36675b7c8f..f25e4e62cf25 100644
> --- a/tools/perf/util/symbol.c
> +++ b/tools/perf/util/symbol.c
> @@ -1733,8 +1733,10 @@ int dso__load_bfd_symbols(struct dso *dso, const char *debugfile)
>  			/* PE symbols can only have 4 bytes, so use .text high bits */
>  			dso->text_offset = section->vma - (u32)section->vma;
>  			dso->text_offset += (u32)bfd_asymbol_value(symbols[i]);
> +			dso->text_end = (section->vma - dso->text_offset) + section->size;
>  		} else {
>  			dso->text_offset = section->vma - section->filepos;
> +			dso->text_end = section->filepos + section->size;
>  		}
>  	}
>  


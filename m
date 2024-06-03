Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3538D8788
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 19:00:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbPqqbwF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtKj52rN5z3cgf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 03:00:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gbPqqbwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 04 Jun 2024 02:59:28 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtKhJ2qGJz3cZv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 02:59:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717433969; x=1748969969;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ojs+BBl2wRyth1o2ZiKYXRCu771Apw2r+/u830cNuhg=;
  b=gbPqqbwFaPyoJ0FVRieiBQn5/jLz6+3b5XV0o+KybhWXb843hSYLa1VM
   9lPWMiTgUUENKiITROuBMQwCu+CODDkd/fvhXU/ZMGgW2xhte8HCf6/Pv
   QgQ/7T6wEbiNd2Jt1YUUzBmgSWHjCZ/rNMMRVmyfXWHFDN4GIq8L/In5e
   CmLaCpPFeCNtzJLrYLFo4eN2kTVExriHXhszhKOUgBS4MTKFpjBovUnPe
   tUCzlbzGe3naVTTdWyjk995Hda21VdMcP8bOT3qaoF3dir1ksVoeqTTq6
   hQQLkRvPUWLeWaV2DCHi7axTT/diuhBUGRwaGJfrV2YYla6aTEULqwm0D
   g==;
X-CSE-ConnectionGUID: lFViQ8tYTRCkGGn16Fr7CA==
X-CSE-MsgGUID: hEZvIxhsQn2GLLpe3uLkTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13748178"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13748178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 09:58:19 -0700
X-CSE-ConnectionGUID: smcFJOSgQqWWsoHaoyB43g==
X-CSE-MsgGUID: kVdT+ElDSQ2YskJCGdLL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37005745"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.94.248.18])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 09:58:15 -0700
Message-ID: <c383b404-727c-4564-a66e-0906348891b3@intel.com>
Date: Mon, 3 Jun 2024 19:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 11/14] tools/perf: Add support to use libcapstone in
 powerpc
To: Ian Rogers <irogers@google.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, namhyung@kernel.org
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-12-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXGPHMF+5cUu42ns0=qm9QCPg0LNUveLLnjdGHPCnVg3w@mail.gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <CAP-5=fXGPHMF+5cUu42ns0=qm9QCPg0LNUveLLnjdGHPCnVg3w@mail.gmail.com>
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/06/24 19:30, Ian Rogers wrote:
> On Fri, May 31, 2024 at 11:10 PM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>
>> Now perf uses the capstone library to disassemble the instructions in
>> x86. capstone is used (if available) for perf annotate to speed up.
>> Currently it only supports x86 architecture. Patch includes changes to
>> enable this in powerpc. For now, only for data type sort keys, this
>> method is used and only binary code (raw instruction) is read. This is
>> because powerpc approach to understand instructions and reg fields uses
>> raw instruction. The "cs_disasm" is currently not enabled. While
>> attempting to do cs_disasm, observation is that some of the instructions
>> were not identified (ex: extswsli, maddld) and it had to fallback to use
>> objdump. Hence enabling "cs_disasm" is added in comment section as a
>> TODO for powerpc.
>>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>>  tools/perf/util/disasm.c | 148 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 146 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>> index d8b357055302..915508d2e197 100644
>> --- a/tools/perf/util/disasm.c
>> +++ b/tools/perf/util/disasm.c
>> @@ -1540,12 +1540,18 @@ static int open_capstone_handle(struct annotate_args *args, bool is_64bit,
>>  {
>>         struct annotation_options *opt = args->options;
>>         cs_mode mode = is_64bit ? CS_MODE_64 : CS_MODE_32;
>> +       int ret;
>>
>>         /* TODO: support more architectures */
>> -       if (!arch__is(args->arch, "x86"))
>> +       if ((!arch__is(args->arch, "x86")) && (!arch__is(args->arch, "powerpc")))
>>                 return -1;
>>
>> -       if (cs_open(CS_ARCH_X86, mode, handle) != CS_ERR_OK)
>> +       if (arch__is(args->arch, "x86"))
>> +               ret = cs_open(CS_ARCH_X86, mode, handle);
>> +       else
>> +               ret = cs_open(CS_ARCH_PPC, mode, handle);
>> +
>> +       if (ret != CS_ERR_OK)
>>                 return -1;
> 
> There looks to be a pretty/more robust capstone_init function in
> print_insn.c, should we factor this code out and recycle:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/print_insn.c?h=perf-tools-next#n40

On a slightly related note, there is a compile error
been around for a while in util/disasm.c on Ubuntu 22.04

In file included from /usr/include/capstone/capstone.h:279,
                 from util/disasm.c:1354:
/usr/include/capstone/bpf.h:94:14: error: ‘bpf_insn’ defined as wrong
kind of tag
   94 | typedef enum bpf_insn {
      |              ^~~~~~~~

> 
> Thanks,
> Ian
> 
>>         if (!opt->disassembler_style ||
>> @@ -1635,6 +1641,139 @@ static void print_capstone_detail(cs_insn *insn, char *buf, size_t len,
>>         }
>>  }
>>
>> +static int symbol__disassemble_capstone_powerpc(char *filename, struct symbol *sym,
>> +                                       struct annotate_args *args)
>> +{
>> +       struct annotation *notes = symbol__annotation(sym);
>> +       struct map *map = args->ms.map;
>> +       struct dso *dso = map__dso(map);
>> +       struct nscookie nsc;
>> +       u64 start = map__rip_2objdump(map, sym->start);
>> +       u64 end = map__rip_2objdump(map, sym->end);
>> +       u64 len = end - start;
>> +       u64 offset;
>> +       int i, fd, count;
>> +       bool is_64bit = false;
>> +       bool needs_cs_close = false;
>> +       u8 *buf = NULL;
>> +       struct find_file_offset_data data = {
>> +               .ip = start,
>> +       };
>> +       csh handle;
>> +       char disasm_buf[512];
>> +       struct disasm_line *dl;
>> +       u32 *line;
>> +
>> +       if (args->options->objdump_path)
>> +               return -1;
>> +
>> +       nsinfo__mountns_enter(dso->nsinfo, &nsc);
>> +       fd = open(filename, O_RDONLY);
>> +       nsinfo__mountns_exit(&nsc);
>> +       if (fd < 0)
>> +               return -1;
>> +
>> +       if (file__read_maps(fd, /*exe=*/true, find_file_offset, &data,
>> +                           &is_64bit) == 0)
>> +               goto err;
>> +
>> +       if (open_capstone_handle(args, is_64bit, &handle) < 0)
>> +               goto err;
>> +
>> +       needs_cs_close = true;
>> +
>> +       buf = malloc(len);
>> +       if (buf == NULL)
>> +               goto err;
>> +
>> +       count = pread(fd, buf, len, data.offset);
>> +       close(fd);
>> +       fd = -1;
>> +
>> +       if ((u64)count != len)
>> +               goto err;
>> +
>> +       line = (u32 *)buf;
>> +
>> +       /* add the function address and name */
>> +       scnprintf(disasm_buf, sizeof(disasm_buf), "%#"PRIx64" <%s>:",
>> +                 start, sym->name);
>> +
>> +       args->offset = -1;
>> +       args->line = disasm_buf;
>> +       args->line_nr = 0;
>> +       args->fileloc = NULL;
>> +       args->ms.sym = sym;
>> +
>> +       dl = disasm_line__new(args);
>> +       if (dl == NULL)
>> +               goto err;
>> +
>> +       annotation_line__add(&dl->al, &notes->src->source);
>> +
>> +       /*
>> +        * TODO: enable disassm for powerpc
>> +        * count = cs_disasm(handle, buf, len, start, len, &insn);
>> +        *
>> +        * For now, only binary code is saved in disassembled line
>> +        * to be used in "type" and "typeoff" sort keys. Each raw code
>> +        * is 32 bit instruction. So use "len/4" to get the number of
>> +        * entries.
>> +        */
>> +       count = len/4;
>> +
>> +       for (i = 0, offset = 0; i < count; i++) {
>> +               args->offset = offset;
>> +               sprintf(args->line, "%x", line[i]);
>> +
>> +               dl = disasm_line__new(args);
>> +               if (dl == NULL)
>> +                       goto err;
>> +
>> +               annotation_line__add(&dl->al, &notes->src->source);
>> +
>> +               offset += 4;
>> +       }
>> +
>> +       /* It failed in the middle */
>> +       if (offset != len) {
>> +               struct list_head *list = &notes->src->source;
>> +
>> +               /* Discard all lines and fallback to objdump */
>> +               while (!list_empty(list)) {
>> +                       dl = list_first_entry(list, struct disasm_line, al.node);
>> +
>> +                       list_del_init(&dl->al.node);
>> +                       disasm_line__free(dl);
>> +               }
>> +               count = -1;
>> +       }
>> +
>> +out:
>> +       if (needs_cs_close)
>> +               cs_close(&handle);
>> +       free(buf);
>> +       return count < 0 ? count : 0;
>> +
>> +err:
>> +       if (fd >= 0)
>> +               close(fd);
>> +       if (needs_cs_close) {
>> +               struct disasm_line *tmp;
>> +
>> +               /*
>> +                * It probably failed in the middle of the above loop.
>> +                * Release any resources it might add.
>> +                */
>> +               list_for_each_entry_safe(dl, tmp, &notes->src->source, al.node) {
>> +                       list_del(&dl->al.node);
>> +                       free(dl);
>> +               }
>> +       }
>> +       count = -1;
>> +       goto out;
>> +}
>> +
>>  static int symbol__disassemble_capstone(char *filename, struct symbol *sym,
>>                                         struct annotate_args *args)
>>  {
>> @@ -1987,6 +2126,11 @@ int symbol__disassemble(struct symbol *sym, struct annotate_args *args)
>>                         err = symbol__disassemble_dso(symfs_filename, sym, args);
>>                         if (err == 0)
>>                                 goto out_remove_tmp;
>> +#ifdef HAVE_LIBCAPSTONE_SUPPORT
>> +                       err = symbol__disassemble_capstone_powerpc(symfs_filename, sym, args);
>> +                       if (err == 0)
>> +                               goto out_remove_tmp;
>> +#endif
>>                 }
>>         }
>>
>> --
>> 2.43.0
>>


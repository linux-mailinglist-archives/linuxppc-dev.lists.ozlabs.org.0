Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31375904157
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 18:30:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFkQwTUs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzDgQ1H0tz3cTw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 02:30:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFkQwTUs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzDff2bnVz3cT9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 02:30:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718123403; x=1749659403;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x88vPd67F51bwNIvdn5aIPG/KAt9yYbLHZCemaaxtC8=;
  b=nFkQwTUsRxJtO4fdF4eLJ4nrOL4DIotsOXSvOzLe8+2WnmGxR8KvAXnP
   GjS7GhivWUZZTdlLERJGfJxC5dVJpFkJMmO7cSfwijmQJ6UOqXz5Qo4ct
   P84LEs9W/c5Hc9kg94yJpH7MQZzviw6I13I73M1c8Y2NbcZJ6HmNXxi84
   l/y4LWUli54yT13Wi4R9VD/OHm3HZCaP2mh/FqbAyHVIZXhx5aWyguz+d
   R6MOAzVJaVXi2zXYlnEykfkcWehSlarOgGLiVxiYD0UarwiwYEQ4vjl5K
   kVdhYvnsK4ohxfuo9/sfJ9jv3kX0i2mIqJ1ZR8MRHQLK9CDwry+LUHp0g
   g==;
X-CSE-ConnectionGUID: g9IPizolQ8+1cQT42pd8Ow==
X-CSE-MsgGUID: TZ3NxLNdS1iX0AaF9RkH8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15018206"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="15018206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:29:58 -0700
X-CSE-ConnectionGUID: aW9cfQpQSjqJjDLJ6LBtXA==
X-CSE-MsgGUID: 0uVim8UwQsCsM1J9UsyyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40204656"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.41.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:29:54 -0700
Message-ID: <9dedd378-ce85-4329-b770-de47548bf380@intel.com>
Date: Tue, 11 Jun 2024 19:29:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 11/14] tools/perf: Add support to use libcapstone in
 powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-12-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fXGPHMF+5cUu42ns0=qm9QCPg0LNUveLLnjdGHPCnVg3w@mail.gmail.com>
 <c383b404-727c-4564-a66e-0906348891b3@intel.com>
 <81ED04E0-23B5-44AE-B84D-5766346F1D32@linux.vnet.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <81ED04E0-23B5-44AE-B84D-5766346F1D32@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, disgoel@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/06/24 15:20, Athira Rajeev wrote:
> 
> 
>> On 3 Jun 2024, at 10:28 PM, Adrian Hunter <adrian.hunter@intel.com> wrote:
>>
>> On 3/06/24 19:30, Ian Rogers wrote:
>>> On Fri, May 31, 2024 at 11:10 PM Athira Rajeev
>>> <atrajeev@linux.vnet.ibm.com> wrote:
>>>>
>>>> Now perf uses the capstone library to disassemble the instructions in
>>>> x86. capstone is used (if available) for perf annotate to speed up.
>>>> Currently it only supports x86 architecture. Patch includes changes to
>>>> enable this in powerpc. For now, only for data type sort keys, this
>>>> method is used and only binary code (raw instruction) is read. This is
>>>> because powerpc approach to understand instructions and reg fields uses
>>>> raw instruction. The "cs_disasm" is currently not enabled. While
>>>> attempting to do cs_disasm, observation is that some of the instructions
>>>> were not identified (ex: extswsli, maddld) and it had to fallback to use
>>>> objdump. Hence enabling "cs_disasm" is added in comment section as a
>>>> TODO for powerpc.
>>>>
>>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>>> ---
>>>> tools/perf/util/disasm.c | 148 ++++++++++++++++++++++++++++++++++++++-
>>>> 1 file changed, 146 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
>>>> index d8b357055302..915508d2e197 100644
>>>> --- a/tools/perf/util/disasm.c
>>>> +++ b/tools/perf/util/disasm.c
>>>> @@ -1540,12 +1540,18 @@ static int open_capstone_handle(struct annotate_args *args, bool is_64bit,
>>>> {
>>>>        struct annotation_options *opt = args->options;
>>>>        cs_mode mode = is_64bit ? CS_MODE_64 : CS_MODE_32;
>>>> +       int ret;
>>>>
>>>>        /* TODO: support more architectures */
>>>> -       if (!arch__is(args->arch, "x86"))
>>>> +       if ((!arch__is(args->arch, "x86")) && (!arch__is(args->arch, "powerpc")))
>>>>                return -1;
>>>>
>>>> -       if (cs_open(CS_ARCH_X86, mode, handle) != CS_ERR_OK)
>>>> +       if (arch__is(args->arch, "x86"))
>>>> +               ret = cs_open(CS_ARCH_X86, mode, handle);
>>>> +       else
>>>> +               ret = cs_open(CS_ARCH_PPC, mode, handle);
>>>> +
>>>> +       if (ret != CS_ERR_OK)
>>>>                return -1;
>>>
>>> There looks to be a pretty/more robust capstone_init function in
>>> print_insn.c, should we factor this code out and recycle:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tree/tools/perf/util/print_insn.c?h=perf-tools-next#n40
>>
>> On a slightly related note, there is a compile error
>> been around for a while in util/disasm.c on Ubuntu 22.04
>>
>> In file included from /usr/include/capstone/capstone.h:279,
>>                 from util/disasm.c:1354:
>> /usr/include/capstone/bpf.h:94:14: error: ‘bpf_insn’ defined as wrong
>> kind of tag
>>   94 | typedef enum bpf_insn {
>>      |              ^~~~~~~~
>>
> 
> Hi Adrian
> 
> I tried compilation on Ubuntu 22.04, but didn’t face this issue.
> The libcapstone version I have is libcapstone4 which doesn’t have the include for “bpf.h”
> What is the version of libcapstone in the setup where you are seeing this issue ?

Yes, sorry. I got confused.  Ubuntu was OK.  The original issue
was with Fedora 40, but even then it requires binutils-devel
and BUILD_NONDISTRO=1


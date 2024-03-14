Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B488587C1DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:11:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iXP13l2B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwYn03BMRz3dXg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 04:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iXP13l2B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwYmF6CDzz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 04:10:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710436222; x=1741972222;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uQAxpeExw4NPzD9m5SdNWiPsgYujqGrB4VUfTmi+fXg=;
  b=iXP13l2BGyK4EzPWxz+VOLQed9bC++miZibYjJFYmyOHoyAiji1D9Euz
   jqvA2oef9ZOqki3+8mstqdnlgWLBh1/NiplDE7yRWqE8RfxTFZv+TyV2W
   nnU+8Fjcj5KNQ00iqnkkGrxFK+Q0DRCb/dpGwNoVtyzHBWI8TnKckr99a
   KruKfkr/k8FUEi4vSH2mEnyG7c+Aiy9cxrJm4QRzmSNM4M1q89lcQkgAD
   EWMV7K7W56SXEvCml909U4ZjOjG3k0dvnQxkBbGvxHICjAISYD/AlDek7
   i4M9UWznvnUwPGLj+sekjiY18r7VU8KQ4tdU38g6N7vPR6YcVk7mMACNU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5457453"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5457453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 10:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="35486148"
Received: from laallen-mobl.amr.corp.intel.com (HELO [10.209.21.198]) ([10.209.21.198])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 10:10:12 -0700
Message-ID: <a789c10e-861e-48eb-96d6-aa129d352535@intel.com>
Date: Thu, 14 Mar 2024 10:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
Content-Language: en-US
To: John Baldwin <jhb@FreeBSD.org>, Vignesh Balasubramanian
 <vigbalas@amd.com>, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <971d21b7-0309-439e-91b6-234f84da959d@FreeBSD.org>
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <971d21b7-0309-439e-91b6-234f84da959d@FreeBSD.org>
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
Cc: matz@suse.de, keescook@chromium.org, felix.willgerodt@intel.com, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, linux-mm@kvack.org, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 09:45, John Baldwin wrote:
> On 3/14/24 8:37 AM, Dave Hansen wrote:
>> On 3/14/24 04:23, Vignesh Balasubramanian wrote:
>>> Add a new .note section containing type, size, offset and flags of
>>> every xfeature that is present.
>>
>> Mechanically, I'd much rather have all of that info in the cover letter
>> in the actual changelog instead.
>>
>> I'd also love to see a practical example of what an actual example core
>> dump looks like on two conflicting systems:
>>
>>     * Total XSAVE size
>>     * XCR0 value
>>     * XSTATE_BV from the core dump
>>     * XFEATURE offsets for each feature
> 
> I noticed this when I bought an AMD Ryzen 9 5900X based system for
> my desktop running FreeBSD and found that the XSAVE core dump notes
> were not recognized by GDB (FreeBSD dumps an XSAVE register set note
> that matches the same layout of NT_X86_XSTATE used by Linux).

I just want to make sure that you heard what I asked.  I'd like to see a
practical example of how the real-world enumeration changes between two
real world systems.

Is that possible?

Here's the raw CPUID data from the XSAVE region on my laptop:

>    0x0000000d 0x00: eax=0x000002e7 ebx=0x00000a88 ecx=0x00000a88 edx=0x00000000
>    0x0000000d 0x01: eax=0x0000000f ebx=0x00000998 ecx=0x00003900 edx=0x00000000
>    0x0000000d 0x02: eax=0x00000100 ebx=0x00000240 ecx=0x00000000 edx=0x00000000
>    0x0000000d 0x05: eax=0x00000040 ebx=0x00000440 ecx=0x00000000 edx=0x00000000
>    0x0000000d 0x06: eax=0x00000200 ebx=0x00000480 ecx=0x00000000 edx=0x00000000
>    0x0000000d 0x07: eax=0x00000400 ebx=0x00000680 ecx=0x00000000 edx=0x00000000
>    0x0000000d 0x08: eax=0x00000080 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>    0x0000000d 0x09: eax=0x00000008 ebx=0x00000a80 ecx=0x00000000 edx=0x00000000
>    0x0000000d 0x0b: eax=0x00000010 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>    0x0000000d 0x0c: eax=0x00000018 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>    0x0000000d 0x0d: eax=0x00000008 ebx=0x00000000 ecx=0x00000001 edx=0x00000000

Could we get that for an impacted AMD system, please?

	cpuid -1 --raw | grep "   0x0000000d "

should do it.

> In particular, as the cover letter notes, on this AMD processor,
> there is no "gap" for MPX, so the PKRU registers it provides are at a
> different offset than on Intel CPUs.  Furthermore, my reading of the
> SDM is that there is no guarantee of architectural offsets of a given
> XSAVE feature and that software should be querying CPUID to determine
> the layout.

I'd say the SDM is an aspirational document.  Intel _aspires_ to be able
to change the layouts whenever it wants.  That doesn't mean that it
could actually pull it off in practice.

In practice, the offset are fixed and Intel can't change them.

> FWIW, the relevant CPUID leaves for my AMD system:
> 
>    XSAVE features (0xd/0):
>       XCR0 valid bit field mask               = 0x0000000000000207>          x87 state                            = true
...

So, those actually aren't the relevant ones.  We need EAX (size) and EBX
(user offset) from all of the sub-leaves.

>> This is pretty close to just a raw dump of the XSAVE CPUID leaves.
>> Rather than come up with an XSAVE-specific ABI that depends on CPUID
>> *ANYWAY* (because it dumps the "flags" register aka. ECX), maybe we
>> should just bite the bullet and dump out (some of) the raw CPUID space.
> 
> So the current note I initially proposed and implemented for FreeBSD
> (https://reviews.freebsd.org/D42136) and an initial patch set for GDB
> (https://sourceware.org/pipermail/gdb-patches/2023-October/203083.html)
> do indeed dump a raw set of CPUID leaves.  The version I have for FreeBSD
> only dumps the raw leaf values for leaf 0x0d though the note format is
> extensible should additional leaves be needed in the future.  One of the
> questions if we wanted to use a CPUID leaf note is which leaves to dump
> (e.g. do you dump all of them, or do you just dump the subset that is
> currently needed).

You dump what is needed and add to the dump over time.

> Another quirky question is what to do about systems with hetergeneous
> cores (E vs P for example).
That's irrelevant for now.  The cores may be heterogeneous but the
userspace ISA and (and thus XSAVE formats) are identical.  If they're
not, then we have bigger problems on our hands.

> Currently those systems use the same XSAVE layout across all cores,
> but other CPUID leaves do already vary across cores on those systems.

There shouldn't be any CPUID leaves that differ _and_ matter to
userspace and thus core dumps.

> However, there are other wrinkles with the leaf approach.  Namely, one
> of the use cases that I currently have an ugly hack for in GDB is if
> you are using gdb against a remote host running gdbserver and then use
> 'gcore' to generate a core dump.  GDB needs to write out a NT_X86_XSTATE
> note, but that note requires a layout.  What GDB does today is just pick
> a known Intel layout based on the XCR0 mask.  However, GDB should ideally
> start writing out whatever new note we adopt here, so if we dump raw
> CPUID leaves it means extending the GDB remote protocol so we can query
> the CPUID leaves from the remote host.  On the other hand, if we choose a
> more abstract format as proposed in this patch, the local GDB (or LLDB
> or whatever) can generate whatever synthetic layout it wants to write
> the local NT_X86_XSTATE.  (NB: A relevant detail here is that the GDB
> remote protocol does not pass the entire XSAVE state across as a block,
> instead gdbserver parses individual register values for AVX, etc.
> registers and those decoded register values are passed over the
> protocol.)

So the gdb side says, "Give me PKRU" and the remote side parses the
XSAVE image, finds PKRU, and sends it over the wire?

> Another question is potentially supporting compact XSAVE format in
> for NT_X86_XSTATE.  Today Linux has some complicated code to re-expand
> the compat XSAVE format back out to the standard layout for ptrace() and
> process core dumps.

Yeah, but supporting the compacted format in NT_X86_XSTATE doesn't help
us at all.  We still intermingle user and supervisor state and that
needs to get repacked _anyway_.

In other words, no matter what we do, it's going to be complicated
because the userspace buffer can't have supervisor state and the kernel
buffer does have it.  The compacted format mismatch is the least of our
problems.

>  (FreeBSD doesn't yet make use of XSAVEC so we
> haven't yet dealt with that problem.) 

... or XSAVES, which is actually the most relevant here.

Backing up... there are two approaches here:

 1. Dump out raw x86-specific gunk, aka. CPUID contents itself.  There
    are a billion ways to do this and lots of complications, including
    the remote protocol implications
or
 2. Define an abstract format that works anywhere, not just on x86 and
    not just for XSAVE.

There's no (sane) middle ground.  The implementation here (in this
patch) is fundamentally x86-specific and pretends to be some kind of
abstracted x86-independent format.



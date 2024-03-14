Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9087C542
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:42:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.a=rsa-sha256 header.s=dkim header.b=sEhNz4ZB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twj7c3zvhz3vmD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:42:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.a=rsa-sha256 header.s=dkim header.b=sEhNz4ZB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebsd.org (client-ip=96.47.72.81; helo=mx2.freebsd.org; envelope-from=jhb@freebsd.org; receiver=lists.ozlabs.org)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwZLv2Hmmz3dH8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 04:36:54 +1100 (AEDT)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
	by mx2.freebsd.org (Postfix) with ESMTPS id 4TwZLq2tq7z45qb;
	Thu, 14 Mar 2024 17:36:51 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [IPv6:2610:1c1:1:606c::24b:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
	by mx1.freebsd.org (Postfix) with ESMTPS id 4TwZLq0vlZz4G9m;
	Thu, 14 Mar 2024 17:36:51 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
	t=1710437811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FRnGeCxFOtPEvgUPXcBs82NrDY5IYDYS2r+RYjKVpg=;
	b=sEhNz4ZBuiVsXmcilCwowh42gWx/ujdNrhfQgF9MTZYFlTaPNgT6u6CtyovNZK0Ny3h9mr
	CjC3HmvFbS3BkqOsuR2TOxuM6kBYn8pnaHaQ4RrKVpMDnPny1CpYXDZtxa1zLIZAcWi31H
	dyjuNpYOqU0wNqbJ3lIuEYxHTtKYl6lUX7XIzF4UyvBMJHmpJcGNGO5SP24p0a9wo6wJTr
	/P8LZAor9zCuZK2PUIk/anzVNzBpYTQTHb3pdXSzZZKKUACMsWvjUoJjy9IHsaA73UU1+z
	F1KVTzacJkz7b2ZE1J2ENR/X/qDRR9YZ+z0Mdt6SGn+gwOTkDJJr6G8QZrsaoA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1710437811; a=rsa-sha256; cv=none;
	b=PJKOWliNE9sARysvn+5wbnE2O6//dmWKHXlV8KLUAGyZVL7ruhitf1Yv22v2SuiB1cOfv2
	CFcknR6jm5Wd0uWqAkvHZx4OE9ppyXIYhWhOlJ3yaXvOGMYjqUbtzBa822N37nVaTHugkB
	Yi5GnZJF9OPyqDUB2cPOrlns4sLcOTrLpYWPzzL0C4cakDQv3yboQLvsM0hNVys8Ca+FE1
	cf72Qv++5EHsmMq4OYvmnXvM3KEcMWq7phQqb6jeImXXdUBzZUhVRq17uwqz/wLKZZXaIt
	914d2ab+00tzpHGfMelNG8uVgQLWotKFY53gT6SN9L2qx2iXe8tZkd6K9nw+Rw==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
	s=dkim; t=1710437811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FRnGeCxFOtPEvgUPXcBs82NrDY5IYDYS2r+RYjKVpg=;
	b=uNM9NnEpZukwPoUCmQi64Ps5+jKT7j+T+8xTlbM759DPqHIneuZ0wR4NKINoteUxbgJNvX
	dZtg3U0tYZM/JNO3w6oSigr0i4OCzfbaHAY3HWy0iPKcLLMZJRfxPOmK2mFW5kEY+H28Yj
	cTXHiLTARTTjEJPYbQnbR3jKkbC2I8tqB1XopkCpJRPzJbwHScQr6LG0KK/1NI+iWRAil7
	LXRBkTUE/AsW9N36R/6ZBD4XeddWzpJiqzfiLQ9yZyMC/hM6exKzQ/J4Er3RdlfZQpgbGD
	kUkj/Np/G7DTcG6hUeI3XuFFL8gEdgfQBOJzlcI1Fnyb0HIFW1GmpHR3oCTrfQ==
Received: from [IPV6:2601:644:937f:4c50:9159:2009:aff7:887a] (unknown [IPv6:2601:644:937f:4c50:9159:2009:aff7:887a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: jhb)
	by smtp.freebsd.org (Postfix) with ESMTPSA id 4TwZLn2VmVzMNv;
	Thu, 14 Mar 2024 17:36:49 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
Message-ID: <b86e4d31-70db-42de-bf54-4ffb03b5cba0@FreeBSD.org>
Date: Thu, 14 Mar 2024 10:36:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>,
 Vignesh Balasubramanian <vigbalas@amd.com>, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <971d21b7-0309-439e-91b6-234f84da959d@FreeBSD.org>
 <a789c10e-861e-48eb-96d6-aa129d352535@intel.com>
From: John Baldwin <jhb@FreeBSD.org>
In-Reply-To: <a789c10e-861e-48eb-96d6-aa129d352535@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Mar 2024 09:37:24 +1100
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

On 3/14/24 10:10 AM, Dave Hansen wrote:
> On 3/14/24 09:45, John Baldwin wrote:
>> On 3/14/24 8:37 AM, Dave Hansen wrote:
>>> On 3/14/24 04:23, Vignesh Balasubramanian wrote:
>>>> Add a new .note section containing type, size, offset and flags of
>>>> every xfeature that is present.
>>>
>>> Mechanically, I'd much rather have all of that info in the cover letter
>>> in the actual changelog instead.
>>>
>>> I'd also love to see a practical example of what an actual example core
>>> dump looks like on two conflicting systems:
>>>
>>>      * Total XSAVE size
>>>      * XCR0 value
>>>      * XSTATE_BV from the core dump
>>>      * XFEATURE offsets for each feature
>>
>> I noticed this when I bought an AMD Ryzen 9 5900X based system for
>> my desktop running FreeBSD and found that the XSAVE core dump notes
>> were not recognized by GDB (FreeBSD dumps an XSAVE register set note
>> that matches the same layout of NT_X86_XSTATE used by Linux).
> 
> I just want to make sure that you heard what I asked.  I'd like to see a
> practical example of how the real-world enumeration changes between two
> real world systems.
> 
> Is that possible?
> 
> Here's the raw CPUID data from the XSAVE region on my laptop:
> 
>>     0x0000000d 0x00: eax=0x000002e7 ebx=0x00000a88 ecx=0x00000a88 edx=0x00000000
>>     0x0000000d 0x01: eax=0x0000000f ebx=0x00000998 ecx=0x00003900 edx=0x00000000
>>     0x0000000d 0x02: eax=0x00000100 ebx=0x00000240 ecx=0x00000000 edx=0x00000000
>>     0x0000000d 0x05: eax=0x00000040 ebx=0x00000440 ecx=0x00000000 edx=0x00000000
>>     0x0000000d 0x06: eax=0x00000200 ebx=0x00000480 ecx=0x00000000 edx=0x00000000
>>     0x0000000d 0x07: eax=0x00000400 ebx=0x00000680 ecx=0x00000000 edx=0x00000000
>>     0x0000000d 0x08: eax=0x00000080 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>>     0x0000000d 0x09: eax=0x00000008 ebx=0x00000a80 ecx=0x00000000 edx=0x00000000
>>     0x0000000d 0x0b: eax=0x00000010 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>>     0x0000000d 0x0c: eax=0x00000018 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
>>     0x0000000d 0x0d: eax=0x00000008 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
> 
> Could we get that for an impacted AMD system, please?
> 
> 	cpuid -1 --raw | grep "   0x0000000d "
> 
> should do it.

    0x0000000d 0x00: eax=0x00000207 ebx=0x00000988 ecx=0x00000988 edx=0x00000000
    0x0000000d 0x01: eax=0x0000000f ebx=0x00000348 ecx=0x00001800 edx=0x00000000
    0x0000000d 0x02: eax=0x00000100 ebx=0x00000240 ecx=0x00000000 edx=0x00000000
    0x0000000d 0x09: eax=0x00000008 ebx=0x00000980 ecx=0x00000000 edx=0x00000000
    0x0000000d 0x0b: eax=0x00000010 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
    0x0000000d 0x0c: eax=0x00000018 ebx=0x00000000 ecx=0x00000001 edx=0x00000000

Here, I think the ebx value for the 0x09 leaf (PKRU) is the relevant difference
here, it is 0xa80 on your laptop and 0x980 on the AMD CPU.  (This is the
missing MPX gap on AMD.)

>>> This is pretty close to just a raw dump of the XSAVE CPUID leaves.
>>> Rather than come up with an XSAVE-specific ABI that depends on CPUID
>>> *ANYWAY* (because it dumps the "flags" register aka. ECX), maybe we
>>> should just bite the bullet and dump out (some of) the raw CPUID space.
>>
>> So the current note I initially proposed and implemented for FreeBSD
>> (https://reviews.freebsd.org/D42136) and an initial patch set for GDB
>> (https://sourceware.org/pipermail/gdb-patches/2023-October/203083.html)
>> do indeed dump a raw set of CPUID leaves.  The version I have for FreeBSD
>> only dumps the raw leaf values for leaf 0x0d though the note format is
>> extensible should additional leaves be needed in the future.  One of the
>> questions if we wanted to use a CPUID leaf note is which leaves to dump
>> (e.g. do you dump all of them, or do you just dump the subset that is
>> currently needed).
> 
> You dump what is needed and add to the dump over time.

That is what I started with, yes, but am attempting to anticipate future
problems in my list of caveats.

>> Another quirky question is what to do about systems with hetergeneous
>> cores (E vs P for example).
> That's irrelevant for now.  The cores may be heterogeneous but the
> userspace ISA and (and thus XSAVE formats) are identical.  If they're
> not, then we have bigger problems on our hands.

Yes, I agree on the bigger problems and hope we don't have to solve
them.

>> Currently those systems use the same XSAVE layout across all cores,
>> but other CPUID leaves do already vary across cores on those systems.
> 
> There shouldn't be any CPUID leaves that differ _and_ matter to
> userspace and thus core dumps.

Today that is true, yes.  I'm fine with making that tradeoff (along
with only dumping a subset of leaves) so long as the consensus is that
is an acceptable tradeoff to make.

>> However, there are other wrinkles with the leaf approach.  Namely, one
>> of the use cases that I currently have an ugly hack for in GDB is if
>> you are using gdb against a remote host running gdbserver and then use
>> 'gcore' to generate a core dump.  GDB needs to write out a NT_X86_XSTATE
>> note, but that note requires a layout.  What GDB does today is just pick
>> a known Intel layout based on the XCR0 mask.  However, GDB should ideally
>> start writing out whatever new note we adopt here, so if we dump raw
>> CPUID leaves it means extending the GDB remote protocol so we can query
>> the CPUID leaves from the remote host.  On the other hand, if we choose a
>> more abstract format as proposed in this patch, the local GDB (or LLDB
>> or whatever) can generate whatever synthetic layout it wants to write
>> the local NT_X86_XSTATE.  (NB: A relevant detail here is that the GDB
>> remote protocol does not pass the entire XSAVE state across as a block,
>> instead gdbserver parses individual register values for AVX, etc.
>> registers and those decoded register values are passed over the
>> protocol.)
> 
> So the gdb side says, "Give me PKRU" and the remote side parses the
> XSAVE image, finds PKRU, and sends it over the wire?

Yes.

>> Another question is potentially supporting compact XSAVE format in
>> for NT_X86_XSTATE.  Today Linux has some complicated code to re-expand
>> the compat XSAVE format back out to the standard layout for ptrace() and
>> process core dumps.
> 
> Yeah, but supporting the compacted format in NT_X86_XSTATE doesn't help
> us at all.  We still intermingle user and supervisor state and that
> needs to get repacked _anyway_.

Fair enough.

> In other words, no matter what we do, it's going to be complicated
> because the userspace buffer can't have supervisor state and the kernel
> buffer does have it.  The compacted format mismatch is the least of our
> problems.
> 
>>    (FreeBSD doesn't yet make use of XSAVEC so we
>> haven't yet dealt with that problem.)
> 
> ... or XSAVES, which is actually the most relevant here.
> 
> Backing up... there are two approaches here:
> 
>   1. Dump out raw x86-specific gunk, aka. CPUID contents itself.  There
>      are a billion ways to do this and lots of complications, including
>      the remote protocol implications
> or
>   2. Define an abstract format that works anywhere, not just on x86 and
>      not just for XSAVE.
> 
> There's no (sane) middle ground.  The implementation here (in this
> patch) is fundamentally x86-specific and pretends to be some kind of
> abstracted x86-independent format.

Well, are there other register notes that could benefit from an approach
like this?  Most other register notes I'm aware of on various architectures
either have a fixed layout (like the typical general purpose register notes),
or they have a fixed set of registers but the size of individual registers
can vary (thinks like SME or RISC-V's vector extension).  XSAVE is the only
one I'm aware of that packs multiple register sets into a single note.

To step back a bit, another approach that could be taken (and I'm not sure
it is worth it at this point) would to stop dumping a single XSAVE note
and dump a separate register note for each feature.  That is, dump a note
for AVX (the upper bits of ymmX), a note for PKRU, etc.  I think if I had
to pick a strategy at the very beginning that's what I would choose now,
but this isn't the very beginning and that sort of change is likely too
disruptive.  (This approach is what happens on other arches today in effect,
e.g. on AArch64.)

-- 
John Baldwin


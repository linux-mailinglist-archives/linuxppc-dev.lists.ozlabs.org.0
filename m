Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 830D78CA541
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 01:56:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mIUa6X+L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjvQf0FCWz3g44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 09:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mIUa6X+L;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjvPq5p0hz3dX8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 09:47:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716248855;
	bh=ZYBdGVZXsgtnUlETh21xLRTd4U6kYhG6FJAmkGjakT0=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=mIUa6X+LmfwXcoS/EPpABQ7W3oDXcRNGkwfGKvWhXgQOI5WdEhXy439lwCgXzf4bd
	 PZHhyLc47+wcR3WH34AlEN1gyB5jP2yYf//mQ1ZfQ4s/n+mt0b7kqNDicE6GRty60u
	 r/8t9FZLqwc3592okM3VN1r1kZLfufXeYTMH0x9+QtEuZZcaBO3veXaFCrKfPH1Ggr
	 r5SyX1fm2FJ0RaMRhIPlikWrewW/BaIT6sV60jhkRyJz+XyMLbmLXu9dD+ZolWjWs9
	 bp7xPxBWoUjsOnwSMpKH2NQfYfmdZ2rZhX5FXtfWyZFBzaGVwGiA2CDbS8ROR3Rw/t
	 6y07XQ8KszD2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjvPg3CGCz4wb1;
	Tue, 21 May 2024 09:47:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand
 <geoff@infradead.org>, cve@kernel.org, linux-kernel@vger.kernel.org,
 linux-cve-announce@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: CVE-2023-52665: powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2
In-Reply-To: <2024052016-footnote-smelting-842e@gregkh>
References: <2024051725-CVE-2023-52665-1d6f@gregkh>
 <87zfslufoo.fsf@mail.lhotse>
 <d8c56e37-38c6-454e-81be-a574b42c83be@infradead.org>
 <2024052016-footnote-smelting-842e@gregkh>
Date: Tue, 21 May 2024 09:47:33 +1000
Message-ID: <8734qc3v1m.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Mon, May 20, 2024 at 05:35:32PM +0900, Geoff Levand wrote:
>> On 5/20/24 16:04, Michael Ellerman wrote:
>> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> >> Description
>> >> ===========
>> >>
>> >> In the Linux kernel, the following vulnerability has been resolved:
>> >>
>> >> powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
>> >>
>> >> Commit 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian
>> >> builds"), merged in Linux-6.5-rc1 changes the calling ABI in a way
>> >> that is incompatible with the current code for the PS3's LV1 hypervisor
>> >> calls.
>> >>
>> >> This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
>> >> to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.
>> >>
>> >> Fixes run time errors like these:
>> >>
>> >>   BUG: Kernel NULL pointer dereference at 0x00000000
>> >>   Faulting instruction address: 0xc000000000047cf0
>> >>   Oops: Kernel access of bad area, sig: 11 [#1]
>> >>   Call Trace:
>> >>   [c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
>> >>   [c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
>> >>   [c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8
>> >>
>> >> The Linux kernel CVE team has assigned CVE-2023-52665 to this issue.
>> > 
>> > IMHO this doesn't warrant a CVE. The crash mentioned above happens at
>> > boot, so the system is not vulnerable it's just broken :)
>> 
>> As Greg says, with PPC64_BIG_ENDIAN_ELF_ABI_V2 enabled the system won't
>> boot, so there is no chance of a vulnerability.
>
> The definition of "vulnerability" from CVE.org is:
> 	An instance of one or more weaknesses in a Product that can be
> 	exploited, causing a negative impact to confidentiality, integrity, or
> 	availability; a set of conditions or behaviors that allows the
> 	violation of an explicit or implicit security policy.
>
> Having a system that does not boot is a "negative impact to
> availability", which is why this was selected for a CVE.  I.e. if a new
> kernel update has this problem in it, it would not allow the system to
> boot correctly.

I think the key word above is "exploited", implying some sort of
unauthorised action.

This bug can cause the system to not boot, but only by someone who
builds a new kernel and installs it - and if they have permission to do
that they can just replace the kernel with anything, they don't need a
bug.

> But, if the maintainer of the subsystem thinks this should not be
> assigned a CVE because of this fix, we'll be glad to revoke it.
>
> Michael, still want this revoked?

Yes please.

cheers

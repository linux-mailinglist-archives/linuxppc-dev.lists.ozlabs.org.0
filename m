Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F751E7111
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 02:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y4c359xPzDqb1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 10:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y4Z24RCkzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 10:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o1PcgC9S; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Y4Z15pqnz9sSr;
 Fri, 29 May 2020 10:04:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590710682;
 bh=1k66Zb1qj7uZTPSgBhIL++YFWp+iDlmiX28l8erpYqg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o1PcgC9S+oeama+IYyXAsikM6eJBkAXJmRybBTKTG3nSLKRN/+hbWjBYIkEGNOD3w
 tEHBgjs7AGq/z4oYtKerEUcCSRiMBzSmG4qjrOCA2nF+dJvQiTEw2KuxCYF5XU9DCr
 N+XSySMPJqa76fXQHmt2yDDly3t+AdPhuTsUJTNS49HueAQoCWdsPHKpdsfe5tweBU
 x7x+Yfzwv41BQJORdPCye2b0AifE/ScvPRRUiWwWgWy58CaJCnx2EvfEhMWEp1kpfJ
 D9lfo8oDfXHVRE8MlYZaKv42OkimVKzpeGxJbXVOr+VB9CdFzP5EGWfAqsH7fKsBZq
 4EA2vxLFfmfcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] powerpc/bpf: Enable bpf_probe_read{,
 str}() on powerpc again
In-Reply-To: <aace2e9e-c63c-a1a2-a1e1-c7a46904e8c5@iogearbox.net>
References: <20200527122844.19524-1-pmladek@suse.com>
 <87ftbkkh00.fsf@mpe.ellerman.id.au> <20200528091351.GE3529@linux-b0ei>
 <87d06ojlib.fsf@mpe.ellerman.id.au>
 <aace2e9e-c63c-a1a2-a1e1-c7a46904e8c5@iogearbox.net>
Date: Fri, 29 May 2020 10:05:05 +1000
Message-ID: <87y2pbip1q.fsf@mpe.ellerman.id.au>
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
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Brendan Gregg <brendan.d.gregg@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 5/28/20 2:23 PM, Michael Ellerman wrote:
>> Petr Mladek <pmladek@suse.com> writes:
>>> On Thu 2020-05-28 11:03:43, Michael Ellerman wrote:
>>>> Petr Mladek <pmladek@suse.com> writes:
>>>>> The commit 0ebeea8ca8a4d1d453a ("bpf: Restrict bpf_probe_read{, str}() only
>>>>> to archs where they work") caused that bpf_probe_read{, str}() functions
>>>>> were not longer available on architectures where the same logical address
>>>>> might have different content in kernel and user memory mapping. These
>>>>> architectures should use probe_read_{user,kernel}_str helpers.
>>>>>
>>>>> For backward compatibility, the problematic functions are still available
>>>>> on architectures where the user and kernel address spaces are not
>>>>> overlapping. This is defined CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE.
>>>>>
>>>>> At the moment, these backward compatible functions are enabled only
>>>>> on x86_64, arm, and arm64. Let's do it also on powerpc that has
>>>>> the non overlapping address space as well.
>>>>>
>>>>> Signed-off-by: Petr Mladek <pmladek@suse.com>
>>>>
>>>> This seems like it should have a Fixes: tag and go into v5.7?
>>>
>>> Good point:
>>>
>>> Fixes: commit 0ebeea8ca8a4d1d4 ("bpf: Restrict bpf_probe_read{, str}() only to archs where they work")
>>>
>>> And yes, it should ideally go into v5.7 either directly or via stable.
>>>
>>> Should I resend the patch with Fixes and
>>> Cc: stable@vger.kernel.org #v45.7 lines, please?
>> 
>> If it goes into v5.7 then it doesn't need a Cc: stable, and I guess a
>> Fixes: tag is nice to have but not so important as it already mentions
>> the commit that caused the problem. So a resend probably isn't
>> necessary.
>> 
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
>> 
>> Daniel can you pick this up, or should I?
>
> Yeah I'll take it into bpf tree for v5.7.

Thanks.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E014E9FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 10:20:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488BWv2T6CzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 20:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488BTy1HmyzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 20:18:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mBhwEQHD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 488BTw54LNz9sRR;
 Fri, 31 Jan 2020 20:18:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580462309;
 bh=cCI4WreJl9TPaQKBLWhchJurIy1jFBvqbedUEJxwYO0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=mBhwEQHDz1XN3CYCwbbKhv0GeXIMwF6PpEKmhsU6baEkq/O5znNz1kxwO04DdH2cV
 cQHk2ukvWfkffBL51JWySB3i6n7Xl7+K7RF1CR+iQJlUb4nIovevkPsf/8IiWcXORj
 GnpcWStMenr/9iLqB+KmRYUxsIRmXjpWUw5hp3ZUkzSpP5jJKbtBG4k1xfmDmVRV+b
 DxTrd/E5w6IIfyo7oKOaCcXqhx0VhKUuGDld1R6qNtw50PBEprXULq816EfAofOTaJ
 iSMjmoBQSKBOxBN5hak7fA5eN3jYxhDXL/fQxIQu/+805iAC1oUuQmmADCj4gw1uOq
 PWLBEBWRkYeDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alex Ghiti <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexei Starovoitov <ast@kernel.org>, linux-next@vger.kernel.org,
 Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH v2] powerpc: Do not consider weak unresolved symbol
 relocations as bad
In-Reply-To: <8a8d45c6-4ad2-c682-abfb-3d97188d0d45@ghiti.fr>
References: <20200118170335.21440-1-alex@ghiti.fr>
 <8a8d45c6-4ad2-c682-abfb-3d97188d0d45@ghiti.fr>
Date: Fri, 31 Jan 2020 20:18:25 +1100
Message-ID: <87wo98f0gu.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alex Ghiti <alex@ghiti.fr> writes:
> On 1/18/20 12:03 PM, Alexandre Ghiti wrote:
>> Commit 8580ac9404f6 ("bpf: Process in-kernel BTF") introduced two weak
>> symbols that may be unresolved at link time which result in an absolute
>> relocation to 0. relocs_check.sh emits the following warning:
>>
>> "WARNING: 2 bad relocations
>> c000000001a41478 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
>> c000000001a41480 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end"
>>
>> whereas those relocations are legitimate even for a relocatable kernel
>> compiled with -pie option.
>>
>> relocs_check.sh already excluded some weak unresolved symbols explicitly:
>> remove those hardcoded symbols and add some logic that parses the symbols
>> using nm, retrieves all the weak unresolved symbols and excludes those from
>> the list of the potential bad relocations.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>
>> Changes in v2:
>> - Follow Stephen advice of using grep -F instead of looping over weak symbols
>>    using read, patch is way smaller and cleaner.
>> - Add missing nm in comment
>>
>>   arch/powerpc/Makefile.postlink     |  4 ++--
>>   arch/powerpc/tools/relocs_check.sh | 20 ++++++++++++--------
>>   2 files changed, 14 insertions(+), 10 deletions(-)
>>
...
>
> Hi guys,
>
>
> Any thought about that ?
>
> I do think this patch makes the whole check about absolute relocations 
> clearer.
> And in the future, it will avoid anyone to spend some time on those 
> "bad" relocations
> which actually aren't.

Sorry I missed the v2. Will pick it up.

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F21953FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 10:30:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pc6C3HhWzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pc4842zbzDr5Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 20:28:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pwFG/ljX; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48pc475r8Kz9sRR; Fri, 27 Mar 2020 20:28:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48pc470M0Xz9sP7;
 Fri, 27 Mar 2020 20:28:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585301335;
 bh=IRsgNQ66CbgssQH+mXHNPgGmziAfxM9O6vI7DH89g8c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pwFG/ljX0KMUMsYVQq1DxEPIg0zp8ABADzk6Rofacwh72L2MmN0YIuy9q6psq6W5b
 x8NAggfWmnkkuLkaiXVBgYyHhrWI87CuNErcJ5cbbMcHT/RXBCbdIq3mj9Edx85yAL
 0XdTckJyQBJXr7cYbGS4vilBuLX6wkyI357NVK0oIXQxAUwAgQItsa6jTd6sIBOUE8
 78hla9Q9JhwsmIHgDGTHzagLY8LrNoNtcRKAwBjH+nHPjX/Yk22Xg8o0xf2IgMZccO
 mnTdpBmAr3aPze9mDqwVkhQ+Rd9ejv71SJq49cSaAzCj16Mub6dhVn2EN5ptlCxhCz
 E5Pf+PcVfTPGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alan Modra <amodra@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Explicitly retain .gnu.hash
In-Reply-To: <20200227062147.GC32593@bubble.grove.modra.org>
References: <20200227045933.22967-1-mpe@ellerman.id.au>
 <20200227062147.GC32593@bubble.grove.modra.org>
Date: Fri, 27 Mar 2020 20:29:02 +1100
Message-ID: <87369uw3hd.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alan Modra <amodra@gmail.com> writes:
> On Thu, Feb 27, 2020 at 03:59:32PM +1100, Michael Ellerman wrote:
>> Relocatable kernel builds produce a warning about .gnu.hash being an
>> orphan section:
>> 
>>   ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'
>> 
>> If we try to discard it the build fails:
>> 
>>   ld -EL -m elf64lppc -pie --orphan-handling=warn --build-id -o
>>     .tmp_vmlinux1 -T ./arch/powerpc/kernel/vmlinux.lds --whole-archive
>>     arch/powerpc/kernel/head_64.o arch/powerpc/kernel/entry_64.o
>>     ...
>>     sound/built-in.a net/built-in.a virt/built-in.a --no-whole-archive
>>     --start-group lib/lib.a --end-group
>>   ld: could not find section .gnu.hash
>> 
>> So add an entry to explicitly retain it, as we do for .hash.
>
> Looks fine to me.  You can also pass --hash-style=sysv to ld (since
> binutils-2.18) to disable generation of .gnu.hash.

Our current minimum is 2.21, so that's probably 5-10 years away :)

cheers

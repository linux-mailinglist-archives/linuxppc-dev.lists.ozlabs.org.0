Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86212740A49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 10:01:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9A74+6e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrYv938Wfz3bYx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 18:01:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s9A74+6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrYtJ3h9Bz305R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 18:00:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62967612C5;
	Wed, 28 Jun 2023 08:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145FFC433C8;
	Wed, 28 Jun 2023 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687939250;
	bh=xNYpql/mbDMJdR2SWmbZG+iiVageCV0++76tf283LJg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=s9A74+6e25CAiabKRHwYKKEnX8HMFF+U5iKp9CNHpm+GuPwwiPh90ZgvP0iM+rG2X
	 MJ+DGspTq2kjJkT2DGTlnQfesZ7YGgXHOICMSngLLjz6YRrUK2iMENLhfn80x//jEd
	 PPkzo+iQ5XZI42QimrOj1QmD6Mi2eh02+qWNMBwFrQdcdoTfpcdN7ExBjoskOiiFCm
	 BGkoHz6wJwxmUi1P+OwgVexrXGNlmu+06xSfE/xGySW9CVexleEHC7VTYkBF1KXprb
	 qMay2lfcsHis0CdDhnrvl4TNSqCRyqwI5HjrN0U0egWtZcMOrF/P5Sd019E/QnFA/T
	 vVBLXcEtMezfA==
Date: Wed, 28 Jun 2023 13:13:52 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH 17/17] powerpc/ftrace: Create a dummy stackframe to fix
 stack unwind
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <cover.1687166935.git.naveen@kernel.org>
	<b5ac4a99883624a74fdc2a5d141fddb2e53aa06d.1687166935.git.naveen@kernel.org>
	<1a54912a-7f84-8555-4fd5-6eb970b7e415@csgroup.eu>
In-Reply-To: <1a54912a-7f84-8555-4fd5-6eb970b7e415@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1687938061.pe8nix60m0.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 19/06/2023 =C3=A0 11:47, Naveen N Rao a =C3=A9crit=C2=A0:
>> With ppc64 -mprofile-kernel and ppc32 -pg, profiling instructions to
>> call into ftrace are emitted right at function entry. The instruction
>> sequence used is minimal to reduce overhead. Crucially, a stackframe is
>> not created for the function being traced. This breaks stack unwinding
>> since the function being traced does not have a stackframe for itself.
>> As such, it never shows up in the backtrace:
>>=20
>> /sys/kernel/debug/tracing # echo 1 > /proc/sys/kernel/stack_tracer_enabl=
ed
>> /sys/kernel/debug/tracing # cat stack_trace
>>          Depth    Size   Location    (17 entries)
>>          -----    ----   --------
>>    0)     4144      32   ftrace_call+0x4/0x44
>>    1)     4112     432   get_page_from_freelist+0x26c/0x1ad0
>>    2)     3680     496   __alloc_pages+0x290/0x1280
>>    3)     3184     336   __folio_alloc+0x34/0x90
>>    4)     2848     176   vma_alloc_folio+0xd8/0x540
>>    5)     2672     272   __handle_mm_fault+0x700/0x1cc0
>>    6)     2400     208   handle_mm_fault+0xf0/0x3f0
>>    7)     2192      80   ___do_page_fault+0x3e4/0xbe0
>>    8)     2112     160   do_page_fault+0x30/0xc0
>>    9)     1952     256   data_access_common_virt+0x210/0x220
>>   10)     1696     400   0xc00000000f16b100
>>   11)     1296     384   load_elf_binary+0x804/0x1b80
>>   12)      912     208   bprm_execve+0x2d8/0x7e0
>>   13)      704      64   do_execveat_common+0x1d0/0x2f0
>>   14)      640     160   sys_execve+0x54/0x70
>>   15)      480      64   system_call_exception+0x138/0x350
>>   16)      416     416   system_call_common+0x160/0x2c4
>>=20
>> Fix this by having ftrace create a dummy stackframe for the function
>> being traced. Since this is only relevant when ftrace is active, we nop
>> out the instruction to store LR in the LR save area in the profiling
>> instruction sequence on ppc32 (and in ppc64 with older gcc versions).
>> Instead, in ftrace, we store LR in the LR save area of the previous
>> stackframe, and create a minimal stackframe to represent the function
>> being traced. With this, backtraces now capture the function being
>> traced:
>>=20
>> /sys/kernel/debug/tracing # cat stack_trace
>>          Depth    Size   Location    (17 entries)
>>          -----    ----   --------
>>    0)     3888      32   _raw_spin_trylock+0x8/0x70
>>    1)     3856     576   get_page_from_freelist+0x26c/0x1ad0
>>    2)     3280      64   __alloc_pages+0x290/0x1280
>>    3)     3216     336   __folio_alloc+0x34/0x90
>>    4)     2880     176   vma_alloc_folio+0xd8/0x540
>>    5)     2704     416   __handle_mm_fault+0x700/0x1cc0
>>    6)     2288      96   handle_mm_fault+0xf0/0x3f0
>>    7)     2192      48   ___do_page_fault+0x3e4/0xbe0
>>    8)     2144     192   do_page_fault+0x30/0xc0
>>    9)     1952     608   data_access_common_virt+0x210/0x220
>>   10)     1344      16   0xc0000000334bbb50
>>   11)     1328     416   load_elf_binary+0x804/0x1b80
>>   12)      912      64   bprm_execve+0x2d8/0x7e0
>>   13)      848     176   do_execveat_common+0x1d0/0x2f0
>>   14)      672     192   sys_execve+0x54/0x70
>>   15)      480      64   system_call_exception+0x138/0x350
>>   16)      416     416   system_call_common+0x160/0x2c4
>>=20
>> This results in two additional stores in the ftrace entry code, but
>> produces reliable backtraces. Note that this change now aligns with
>> other architectures (arm64, s390, x86).
>>=20
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks. This patch can be dropped from this series. I posted a minimal=20
fix separately to aid backport:
http://lore.kernel.org/20230621051349.759567-1-naveen@kernel.org

I will post a separate patch to also nop out the duplicate stores in the=20
function profiling sequence.


- Naveen


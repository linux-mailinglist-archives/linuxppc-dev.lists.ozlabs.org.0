Return-Path: <linuxppc-dev+bounces-5640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3DDA20E62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9VZ0gsMz3064;
	Wed, 29 Jan 2025 03:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738081206;
	cv=none; b=gzKDiMlHgSWsQO4UG/BrxxURNE15ejQdKG/a9CjKEUtvHHul6e0lhxquhG/FLTRNrVtvaV8ZiLu7e5QzlRuNCrIXJWIkPcDDqQSP32EmX83dv8OrLPBOIza/BNWRAnWAS7Tq6iuEITvPUHuxJK854Wy/1R3zs7kylsu1hzSa43ctIDezJB41QH9i+Gat/zXsX17U8pdDiy2xOOs1CRIYMDbFthObgOltT3hsaGPyaTBK9SQ4fJuuzi4QNR3PxcNREX4NaVH60UCIkbqt48W2tReBRmruG4gvEcmvw2gTBvNzWZWubRmEASpikPhuMWepgLT+aepNdlfGdSsRte6EMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738081206; c=relaxed/relaxed;
	bh=aOeKKheSx30BRTn7J2E14MBuSBXqXg6YcqOwa10eyIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcwrE0icl9LRQoLE1SSsRLI8KafJ7QfeAdokswtGPieg/F6iW8kyMAB9kzrM7N2zVy31CqySnbBsSUB1NNtJ6eOYaY5KPFNVf9Peu9Mk2kvYoWG9v425qNDYP4FCLrTNBrOnQ8V/asRzb5IraYEqFqlI3ne8RfTh/bYAmvpHcNRI1n5vF0qrJzKgxwDIumWake/w/1L/YnqElQHanGJFB7z3vZukKDcAV5WLUSSnJ39wJSNOmpVDAOB5nSYN/346tbQU/pTIt+Bq5rfvLeIXxC6Sfnw9nio6c+b/yXTz/aRi7yo0SQKemHlUZOe51Y2PTUZYvZx3irfc5dOxm19BCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9VY2R4bz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj94J0X4Kz9sRs;
	Tue, 28 Jan 2025 17:00:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmQ22RbPmDdv; Tue, 28 Jan 2025 17:00:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj9400Ngcz9sSY;
	Tue, 28 Jan 2025 17:00:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F06038B76C;
	Tue, 28 Jan 2025 17:00:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id auU5-9tFQgiC; Tue, 28 Jan 2025 17:00:31 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 69DFB8B763;
	Tue, 28 Jan 2025 17:00:31 +0100 (CET)
Message-ID: <b12039ce-99da-41e9-ba2f-dc0e0c62f140@csgroup.eu>
Date: Tue, 28 Jan 2025 17:00:31 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc: properly negate error in
 syscall_set_return_value() in sc case
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Alexey Gladkov
 <legion@kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, strace-devel@lists.strace.io,
 linux-kernel@vger.kernel.org
References: <20250127181322.GA1373@strace.io>
 <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
 <20250128155201.GA11869@strace.io>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250128155201.GA11869@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 16:52, Dmitry V. Levin a écrit :
> On Tue, Jan 28, 2025 at 03:59:29PM +0100, Christophe Leroy wrote:
>> Le 27/01/2025 à 19:13, Dmitry V. Levin a écrit :
>>> According to the Power Architecture Linux system call ABI documented in
>>> [1], when the syscall is made with the sc instruction, both a value and an
>>> error condition are returned, where r3 register contains the return value,
>>> and cr0.SO bit specifies the error condition.  When cr0.SO is clear, the
>>> syscall succeeded and r3 is the return value.  When cr0.SO is set, the
>>> syscall failed and r3 is the error value.  This syscall return semantics
>>> was implemented from the very beginning of Power Architecture on Linux,
>>> and syscall tracers and debuggers like strace that read or modify syscall
>>> return information also rely on this ABI.
>>
>> I see a quite similar ABI on microblaze, mips, nios2 and sparc. Do they
>> behave all the same ?
> 
> Yes, also on alpha.  I don't think microblaze should be in this list,
> though.

Microblaze has

static inline void syscall_set_return_value(struct task_struct *task,
					    struct pt_regs *regs,
					    int error, long val)
{
	if (error)
		regs->r3 = -error;
	else
		regs->r3 = val;
}

So it has a positive error setting allthough it has no flag to tell it 
is an error. Wondering how it works at the end.

Alpha I'm not sure, I see nothing obvious in include/asm/ptrace.h or 
include/asm/syscall.h




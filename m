Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEB5229012
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPgm71g8zDqnw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 15:50:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPcG3XdNzDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 15:47:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WkXHIEq+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBPcG12CDz9sR4;
 Wed, 22 Jul 2020 15:47:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595396830;
 bh=3EpGqxGRwEaUDRN6AabSEZ8X+y0g9deDjj+pF+Rh6Lc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WkXHIEq+DxKmQBGY2WXUPfWESZhAKJyxvhQVyVC/b66jYIt+xec2QC8DlQWcaRgOz
 s75BygXyOL0Qloq2rO8afK9NraYho6y9VNib+CYESMp9l+YAOBnkb60JSlV/RlTh3d
 tpsMreD4Jvj2Z8sUy+oKhW8gC2UGM+ajLQmWK3E+/Tbk4hq1h6be5qo20gTU+9bhEn
 VuIrk9OdImPSTPlogTRcJq37VhU3Xounwa5AcovqQUAYuBptNpfyJ+XtHHsd/ADLxX
 Q0+m2dh9f0HgProf0c8CBIecIpDSJHr65P1MPW4/rKA5+M3Huy9/w57kUy5UVkN/c2
 JgmltTrXuC2Hg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/5] powerpc sstep: Add tests for Prefixed Add Immediate
In-Reply-To: <CACzsE9pB_zOydiJOOyxwZhCSnAU6Hj-YD45P6uGTjmZLZmqzLA@mail.gmail.com>
References: <20200525025923.19843-1-jniethe5@gmail.com>
 <20200525025923.19843-5-jniethe5@gmail.com>
 <CACzsE9pB_zOydiJOOyxwZhCSnAU6Hj-YD45P6uGTjmZLZmqzLA@mail.gmail.com>
Date: Wed, 22 Jul 2020 15:47:07 +1000
Message-ID: <87mu3sqexw.fsf@mpe.ellerman.id.au>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> On Mon, May 25, 2020 at 1:00 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>>
>> Use the existing support for testing compute type instructions to test
>> Prefixed Add Immediate (paddi).  The R bit of the paddi instruction
>> controls whether current instruction address is used. Add test cases for
>> when R=1 and for R=0. paddi has a 34 bit immediate field formed by
>> concatenating si0 and si1. Add tests for the extreme values of this
>> field.
>>
>> Skip the paddi tests if ISA v3.1 is unsupported.
>>
>> Some of these test cases were added by Balamuruhan S.
>>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>>  arch/powerpc/lib/test_emulate_step.c          | 127 ++++++++++++++++++
>>  .../lib/test_emulate_step_exec_instr.S        |   1 +
>>  2 files changed, 128 insertions(+)
...
>> diff --git a/arch/powerpc/lib/test_emulate_step_exec_instr.S b/arch/powerpc/lib/test_emulate_step_exec_instr.S
>> index 1580f34f4f4f..aef53ee77a43 100644
>> --- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
>> +++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
>> @@ -81,6 +81,7 @@ _GLOBAL(exec_instr)
>>
>>         /* Placeholder for the test instruction */
>>  1:     nop
>> +       nop
>>         patch_site 1b patch__exec_instr
>>
>>         /*
>> --
>> 2.17.1
>>
>
> Because of the alignment requirements of prefixed instructions, the
> noops to be patched need to be aligned.
> mpe, want me to send a new version?

No I'll just squash it in.

> --- a/arch/powerpc/lib/test_emulate_step_exec_instr.S
> +++ b/arch/powerpc/lib/test_emulate_step_exec_instr.S
> @@ -80,6 +80,7 @@ _GLOBAL(exec_instr)
>         REST_NVGPRS(r31)
>
>         /* Placeholder for the test instruction */
> +.align 6

I'll change it to .balign 64.

>  1:     nop
>         nop
>         patch_site 1b patch__exec_instr


cheers

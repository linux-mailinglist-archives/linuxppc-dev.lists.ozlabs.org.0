Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B88C49DBCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:45:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkt0n2g5rz3cnJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:45:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MPA6fxlZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MPA6fxlZ; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkt062Pwfz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:44:37 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so4601252pjy.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0CzpveXK5XtFoz+za4trHT+WN4EbOFc05ugqjjb2C6Y=;
 b=MPA6fxlZUJJXejSLwqrHsigH41HGzIcj9yk37UiV386waSOUc/JAuohAHOwjefj0pe
 SzMmD4VYHmHv/Tm058uP+RudZIzUHxSIDvu6TCRueqE6qtMQXd5/EWsWP0ErAqp8z844
 6McVi8t50AQrBP0LLM9nt5h7TT5PKn2UNMxlIX15WVnQ4TbyqLUjx5iMzJ/myEEo7fLz
 yfo4/1Su/A4OPUcwCdMSRwwO1geIib00c9MUkfSKFiRE5Z9BngBuA9DqtpgH8cc/LIjg
 O2nvoPDOyKaSEQYkk1txTbuf+RhMqw/PwlIDKxTOpwoAusrqhlUZiwESL/fJvyKdtEw0
 h33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0CzpveXK5XtFoz+za4trHT+WN4EbOFc05ugqjjb2C6Y=;
 b=GQA3ozrnx+CMc/ntG7hDzycDWoAoVsQFbgb34OHQURytaVZKNyhdveHFpzwmiA2XqG
 PKAkGkdTZIPp80h3CGygX2dhjyK5LwTKcgCh5aPa8SxFIvZD6o+lfmcMouqUT9Azyjvr
 XuoH2WYx3bduaQCxCGCUAkqDIEkP7us+KoczHJKZ7bufSqiWkD6D9N+dI6c5YCqHs4Ei
 v+LmLFsstbeFdXVgKG03pU0V6UxJt3RRX58Oiq+jhl9Xh8DFBjYGIYxwC2lTFp9O1G8A
 3Iw33U7Z3A0NbFIMmCUNzmXlCXav3pXIjyEYJLoBHh7g8hcdlfJv1XTwzD8NTwoeP0fh
 OCuA==
X-Gm-Message-State: AOAM530lQje/AcxyCq4NSjAiPdUp9MXMe6Gb5aBSAIQE934ydyiCc3nZ
 LAztekFF4rJg1wqcLllz2jAgtVFqKmI=
X-Google-Smtp-Source: ABdhPJxxKu1IaSK0Z8TIGd4qhs/dh/SfQGkOWraT+O5nVio3+J7r9itFFI9Z2yl29D9rCLQSKI5sIg==
X-Received: by 2002:a17:902:c948:: with SMTP id
 i8mr2070308pla.161.1643269474629; 
 Wed, 26 Jan 2022 23:44:34 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id h9sm4684837pfi.124.2022.01.26.23.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 23:44:34 -0800 (PST)
Date: Thu, 27 Jan 2022 17:44:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/uprobes: Reject uprobe on a system call
 instruction
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <20220124055741.3686496-3-npiggin@gmail.com>
 <874k5sm42l.fsf@mpe.ellerman.id.au>
In-Reply-To: <874k5sm42l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1643269209.jj1krtc1vx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of January 25, 2022 9:45 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Per the ISA, a Trace interrupt is not generated for a system call
>> [vectored] instruction. Reject uprobes on such instructions as we are
>> not emulating a system call [vectored] instruction anymore.
>=20
> This should really be patch 1, otherwise there's a single commit window
> where we allow uprobes on sc but don't honour them.

Yep true. I also messed up Naveen's attribution! Will re-send (or maybe=20
Naveen would take over the series).

>=20
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> [np: Switch to pr_info_ratelimited]
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/ppc-opcode.h | 1 +
>>  arch/powerpc/kernel/uprobes.c         | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/includ=
e/asm/ppc-opcode.h
>> index 9675303b724e..8bbe16ce5173 100644
>> --- a/arch/powerpc/include/asm/ppc-opcode.h
>> +++ b/arch/powerpc/include/asm/ppc-opcode.h
>> @@ -411,6 +411,7 @@
>>  #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b)=
 | (4 << 21))
>>  #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b=
) | (6 << 21))
>>  #define PPC_RAW_SC()			(0x44000002)
>> +#define PPC_RAW_SCV()			(0x44000001)
>>  #define PPC_RAW_SYNC()			(0x7c0004ac)
>>  #define PPC_RAW_ISYNC()			(0x4c00012c)
>> =20
>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes=
.c
>> index c6975467d9ff..3779fde804bd 100644
>> --- a/arch/powerpc/kernel/uprobes.c
>> +++ b/arch/powerpc/kernel/uprobes.c
>> @@ -41,6 +41,12 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *aupr=
obe,
>>  	if (addr & 0x03)
>>  		return -EINVAL;
>> =20
>> +	if (ppc_inst_val(ppc_inst_read(auprobe->insn)) =3D=3D PPC_RAW_SC() ||
>> +	    ppc_inst_val(ppc_inst_read(auprobe->insn)) =3D=3D PPC_RAW_SCV()) {
>=20
> We should probably reject hypercall too?
>=20
> There's also a lot of reserved fields in `sc`, so doing an exact match
> like this risks missing instructions that are badly formed but the CPU
> will happily execute as `sc`.

Yeah, scv as well has lev !=3D 0 unsupported so should be excluded.
>=20
> We'd obviously never expect to see those in compiler generated code, but
> it'd still be safer to mask. We could probably just reject opcode 17
> entirely.
>=20
> And I guess for a subsequent patch, but we should be rejecting some
> others here as well shouldn't we? Like rfid etc.

Traps under discussion I guess. For uprobe, rfid will be just another
privilege fault. Is that dealt with somehow or do all privileged and
illegal instructions also need to be excluded from stepping? (I assume
we must handle that in a general way somehow)


Thanks,
Nick

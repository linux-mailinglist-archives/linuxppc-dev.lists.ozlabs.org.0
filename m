Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8BC460B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 05:12:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jh5r2nTHzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 13:12:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HtHjI4e3"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jh466SbRzDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 13:11:18 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x10so11099628pgi.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2019 20:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=/NoLLex5GTaY2mqZb6tqXwSCW2TdUe2f3h+iNYnH5zk=;
 b=HtHjI4e3WaXurKekvUV8rlVcc1wq8E4a91TPt84QafHWT9dyEmC+b3lmAqoAE0lfaP
 i/3dm6oZBG7crKsRogiqT/98ZjKP5YBdaW+VFSEXIHZCjXg7Gp3w6jpLq5V3ohn8lfGo
 NP3gh4HgzWPuxtetfoPHXxfKKIJVEuKd0QUuTrpNB3O2l4Tt/LACxU4UPY26G3dzPebY
 pb/WNP/jLqbLYpn64lXcN7olrbNJgRCIFX0BE6DRteRBaxKs2dBMcaDF6OkFtryON0UI
 rV+osU9AHdSaAPqCm6yxcAzBVaAVy0Y0Z72ko4Vl1D2jpAQgIDIPYYBcgabBxaUk6wqg
 aMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=/NoLLex5GTaY2mqZb6tqXwSCW2TdUe2f3h+iNYnH5zk=;
 b=h73OWysligWUsK9IUt+Uumr5up+NOkv7IZS+WS4JTYEZLot3d/5beiyUElF/e/YWBO
 3VzbVZbPUEvHsnlryJnmmNjzwHDaAQ2M7+t+jewV43Eg0xGNV+4giR3SkbLej8Cq/COZ
 hyJ3dXRM5EBKLKs92S+oXu9WZh21I1svseOHmOqtmw9P/np8aCiksD1B+NxNwpKT4TDs
 NEXSpseQNhhcTtZ7/hOHxERQlWX/Y++woTZRHs3YJXuOiWjfsKasyV3gV8v76Ms3ITe1
 Y9Hc87tyKLWWR8JaDE0UESBY6n25mwM8fNFNRgLqvC1GklYI7pyM2mL4nAGcSRvFzTUg
 TTTg==
X-Gm-Message-State: APjAAAWXiUyLgiglQrKSDfYqg6zPZYoeUyzicJRHQKjAblUGHX/0834a
 /gVsW/0SEGxttIPku8/DiG4=
X-Google-Smtp-Source: APXvYqyRChiQAsnpbrLjPMyFKRvtKEnN9S7e7aAp1Uo6GN/tOoP7CKu614cSUdi4YfaOdPPkLyJFRg==
X-Received: by 2002:a17:90a:1b27:: with SMTP id
 q36mr1712160pjq.113.1569985874493; 
 Tue, 01 Oct 2019 20:11:14 -0700 (PDT)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b11sm18463635pgr.20.2019.10.01.20.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 20:11:13 -0700 (PDT)
Date: Wed, 02 Oct 2019 13:10:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 23/27] powerpc/64: system call implement the bulk of
 the logic in C
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20190915012813.29317-1-npiggin@gmail.com>
 <20190915012813.29317-24-npiggin@gmail.com>
 <20190923124751.GC18205@kitsune.suse.cz>
In-Reply-To: <20190923124751.GC18205@kitsune.suse.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1569985820.7ifh9y8ome.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek's on September 23, 2019 10:47 pm:
> On Sun, Sep 15, 2019 at 11:28:09AM +1000, Nicholas Piggin wrote:
>> System call entry and particularly exit code is beyond the limit of what
>> is reasonable to implement in asm.
>>=20
>> This conversion moves all conditional branches out of the asm code,
>> except for the case that all GPRs should be restored at exit.
>>=20
>> Null syscall test is about 5% faster after this patch, because the exit
>> work is handled under local_irq_disable, and the hard mask and pending
>> interrupt replay is handled after that, which avoids games with MSR.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>=20
>> v3:
>> - Fix !KUAP build [mpe]
>> - Fix BookE build/boot [mpe]
>> - Don't trace irqs with MSR[RI]=3D0
>> - Don't allow syscall_exit_prepare to be ftraced, because function
>>   graph tracing which traces exits barfs after the IRQ state is
>>   prepared for kernel exit.
>> - Fix BE syscall table to use normal function descriptors now that they
>>   are called from C.
>> - Comment syscall_exit_prepare.
> ...
>> -#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SP=
LPAR)
>> -BEGIN_FW_FTR_SECTION
>> -	/* see if there are any DTL entries to process */
>> -	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
>> -	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
>> -	addi	r10,r10,LPPACA_DTLIDX
>> -	LDX_BE	r10,0,r10		/* get log write index */
>> -	cmpd	r11,r10
>> -	beq+	33f
>> -	bl	accumulate_stolen_time
>> -	REST_GPR(0,r1)
>> -	REST_4GPRS(3,r1)
>> -	REST_2GPRS(7,r1)
>> -	addi	r9,r1,STACK_FRAME_OVERHEAD
>> -33:
>> -END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
>> -#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE && CONFIG_PPC_SPLPAR */
> ...
>> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysc=
all_64.c
>> new file mode 100644
>> index 000000000000..1d2529824588
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/syscall_64.c
>> @@ -0,0 +1,195 @@
>> +#include <linux/err.h>
>> +#include <asm/book3s/64/kup-radix.h>
>> +#include <asm/cputime.h>
>> +#include <asm/hw_irq.h>
>> +#include <asm/kprobes.h>
>> +#include <asm/paca.h>
>> +#include <asm/ptrace.h>
>> +#include <asm/reg.h>
>> +#include <asm/signal.h>
>> +#include <asm/switch_to.h>
>> +#include <asm/syscall.h>
>> +#include <asm/time.h>
>> +
>> +extern void __noreturn tabort_syscall(void);
>> +
>> +typedef long (*syscall_fn)(long, long, long, long, long, long);
>> +
>> +long system_call_exception(long r3, long r4, long r5, long r6, long r7,=
 long r8, unsigned long r0, struct pt_regs *regs)
>> +{
>> +	unsigned long ti_flags;
>> +	syscall_fn f;
>> +
>> +	BUG_ON(!(regs->msr & MSR_PR));
>> +
>> +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
>> +			unlikely(regs->msr & MSR_TS_T))
>> +		tabort_syscall();
>> +
>> +	account_cpu_user_entry();
>> +
>> +#ifdef CONFIG_PPC_SPLPAR
>> +	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
>> +			firmware_has_feature(FW_FEATURE_SPLPAR)) {
>> +		struct lppaca *lp =3D get_lppaca();
>> +
>> +		if (unlikely(local_paca->dtl_ridx !=3D lp->dtl_idx))
>=20
> sparse complains about this, and in time.c this it converted like this:
> if (unlikely(local_paca->dtl_ridx !=3D be64_to_cpu(lp->dtl_idx)))
> The removed code has a LDX_BE there so there should be some conversion
> involved, right?

Ah yes, thanks good catch.

Thanks,
Nick
=

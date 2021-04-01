Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1735107F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 10:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9wd8333lz3bsb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 19:02:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LYBtBnVl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LYBtBnVl; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9wch4ynfz2yQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 19:01:38 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id j25so860796pfe.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VuqpEl+COxSpxljOZtUJakmvEG5/ezz2fhanp9Quy0o=;
 b=LYBtBnVlJSsTvZ0wDUXosTU4G1ikc07HV2CSmX5/KXHqeoms8yNKR4YVhxpyLnmnSU
 icYlO0MaTxc+8bX1TbWJX8R1j7CdaPsBtp3g4/vXCmxEnQRBXqETzhtIjfIeotXNKvBN
 RbXIRE1rjsf1TXkoyxgIewKopOSUU95bYWviCpfHzbYxKF1oHfrsde6QMGJZ7Yqn1UOH
 fSMTuMbEadDX2gOzV/54ysjQRTPhKusXv3kNwcdPajac5QdmkpwJwGiJMEwK/kSUsVST
 omsbnkLvToLZFE2BB51rQp9zTQQKsTf4JOv9WJYkIbV9hHSDzCkAEi+XX26qQQD45Bkb
 X4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VuqpEl+COxSpxljOZtUJakmvEG5/ezz2fhanp9Quy0o=;
 b=CIJ/r65ndxG4igzzD+Z2cBRLye05LlG9t1UH8fV6B5Kx6AzkhIgxWnyQ0Qcy9qCE60
 4hkzUKL8uN3WYbnQJmdvpQ/mO0GFdi2b/BkkqvDojVVrEb2sx+IIipY0hwZNmH8D0X/o
 F4KSjVA2PtfPy8puSUkaOAX9ViLNrasxfdygwqroC/SX64gVr5hsCJwVRSQClAiNYnwQ
 nHkhrKIf5wXdLSiRRoks8w5DJSW/uA0V0+7V9MYzWqaJLdxU7RngTs5i3nT2SC8d8/8W
 h3dfKpjRVsdq3YfbZDlmOGMir/GF/+EmCjE5vQ7rZt9EeHTBMZv7aAAieBrBlncEhrc1
 Acvw==
X-Gm-Message-State: AOAM531fkwBMQHze/VA2XuMu7Ared0S6cS8Z2AfBf9rl9yDTXP8sp0Sp
 wnyYAPZt88QL9ZpmngCEs2g=
X-Google-Smtp-Source: ABdhPJwMz1GwlXfgz1SdhGlLswPr5wIx2hZQ7NHtvAFR2ElNpBNVDmIG+zYj5puoQmvjP6+Tp7fPPw==
X-Received: by 2002:a63:6683:: with SMTP id a125mr6320563pgc.382.1617264094938; 
 Thu, 01 Apr 2021 01:01:34 -0700 (PDT)
Received: from localhost ([1.132.249.187])
 by smtp.gmail.com with ESMTPSA id l22sm5084316pjl.14.2021.04.01.01.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 01:01:34 -0700 (PDT)
Date: Thu, 01 Apr 2021 18:01:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
To: Michael Ellerman <mpe@ellerman.id.au>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <20210330150425.10145-1-sxwjean@me.com>
 <875z17y79i.fsf@mpe.ellerman.id.au>
 <20210331212550.GD13863@gate.crashing.org>
 <87im5620f3.fsf@mpe.ellerman.id.au>
In-Reply-To: <87im5620f3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1617262858.ls37f2d81f.astroid@bobo.none>
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
Cc: ravi.bangoria@linux.ibm.com, aik@ozlabs.ru, peterx@redhat.com,
 oleg@redhat.com, paulus@samba.org, kan.liang@linux.intel.com,
 leobras.c@gmail.com, mikey@neuling.org, maddy@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, peterz@infradead.org,
 kjain@linux.ibm.com, msuchanek@suse.de, pmladek@suse.com,
 john.ogness@linutronix.de, alistair@popple.id.au, kvm-ppc@vger.kernel.org,
 jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@me.com>, Xiongwei Song <sxwjean@gmail.com>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of April 1, 2021 12:39 pm:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
>> On Wed, Mar 31, 2021 at 08:58:17PM +1100, Michael Ellerman wrote:
>>> So perhaps:
>>>=20
>>>   EXC_SYSTEM_RESET
>>>   EXC_MACHINE_CHECK
>>>   EXC_DATA_STORAGE
>>>   EXC_DATA_SEGMENT
>>>   EXC_INST_STORAGE
>>>   EXC_INST_SEGMENT
>>>   EXC_EXTERNAL_INTERRUPT
>>>   EXC_ALIGNMENT
>>>   EXC_PROGRAM_CHECK
>>>   EXC_FP_UNAVAILABLE
>>>   EXC_DECREMENTER
>>>   EXC_HV_DECREMENTER
>>>   EXC_SYSTEM_CALL
>>>   EXC_HV_DATA_STORAGE
>>>   EXC_PERF_MONITOR
>>
>> These are interrupt (vectors), not exceptions.  It doesn't matter all
>> that much, but confusing things more isn't useful either!  There can be
>> multiple exceptions that all can trigger the same interrupt.
>=20
> Yeah I know, but I think that ship has already sailed as far as the
> naming we have in the kernel.

It has, but there are also several other ships also sailing in different=20
directions. It could be worse though, at least they are not sideways in=20
the Suez.

> We have over 250 uses of "exc", and several files called "exception"
> something.
>=20
> Using "interrupt" can also be confusing because Linux uses that to mean
> "external interrupt".
>=20
> But I dunno, maybe INT or VEC is clearer? .. or TRAP :)

We actually already have defines that follow Segher's suggestion, it's=20
just that they're hidden away in a KVM header.

#define BOOK3S_INTERRUPT_SYSTEM_RESET   0x100
#define BOOK3S_INTERRUPT_MACHINE_CHECK  0x200
#define BOOK3S_INTERRUPT_DATA_STORAGE   0x300
#define BOOK3S_INTERRUPT_DATA_SEGMENT   0x380
#define BOOK3S_INTERRUPT_INST_STORAGE   0x400
#define BOOK3S_INTERRUPT_INST_SEGMENT   0x480
#define BOOK3S_INTERRUPT_EXTERNAL       0x500
#define BOOK3S_INTERRUPT_EXTERNAL_HV    0x502
#define BOOK3S_INTERRUPT_ALIGNMENT      0x600

It would take just a small amount of work to move these to general=20
powerpc header, add #ifdefs for Book E/S where the numbers differ,
and remove the BOOK3S_ prefix.

I don't mind INTERRUPT_ but INT_ would be okay too. VEC_ actually
doesn't match what Book E does (which is some weirdness to map some
of them to match Book S but not all, arguably we should clean that
up too and just use vector numbers consistently, but the INTERRUPT_
prefix would still be valid if we did that).

BookE KVM entry will still continue to use a different convention
there so I would leave all those KVM defines in place for now, we
might do another pass on them later.

Thanks,
Nick

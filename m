Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FBE366F5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 23:47:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K2SW2vwszDqbC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lhLeQMqg"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K2R15DZSzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 07:45:45 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id b7so3377otl.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cVozTrf+n+No2+PTJ1wirBXq6PcwFvgaQdrEcLKht+8=;
 b=lhLeQMqgV/nrfZ91Rg9sbeksEOhc0D6Sotr6YTVHBLrKwOHCzH3UuPssRKZc3FAWRU
 Zp9Af7QCZRwnaMnjyJL7wrjdudDWs7qyQPwIBO4IjHwHqV7qqE10l5wfZ9Qgi9wOk/9l
 Qxos/frtXjaiGh7JtvtjH4oyLVZWZr1EQmwUpq308LAejvUH1r+7pWHOuYfZvxatZos1
 2w5dDOyLJDOB0GpLTOfHsi/SzzJenmuEQGDOQOZCi43ATxAPtquw6W233LmOo/nmG1wB
 5IrsQ5OxJ/urB4fnoPF3rhZAXGhLhv4qqIlQoAacfNOPRhwoPRXEjfXG5Pv2tahTOeaP
 L/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cVozTrf+n+No2+PTJ1wirBXq6PcwFvgaQdrEcLKht+8=;
 b=iI4Z6g8F9B8UZbYV0ofl7XvdwYBb27MZoDsQMfuI74//sRA72KjDVZiv6lM4xVr3KO
 C12VuNf35OHafzyADN0xxdQfuzrpQVN98h9mIxBV5nzx8AOujcL56ZIzBPQZrr83zEfO
 2ek5SHkzAdFCl0xOjC+ouIvM1AQRed59SIe6PEf4tVUerMmb42E8qmRw3/qBOs+/EySU
 ubfKdWHOEJNmjg3HWEBpwlnydUD54RMU/4Eftb1Sc9mg/i/mlaOgM0AqslDvSuHhfhoI
 hsU78wuOvi8JZ+Hg72gzhhV1O7uZEdqaCxutEcrBxqLcYuYAzUuDZoY65uQlTQkRX5MU
 vP6Q==
X-Gm-Message-State: APjAAAVjdEqMLHDQQISWa+AfVHixQQaITokIcV7X3v2m+SgYHE46wdmP
 43OzgV7/GZrjGaxPsymG0UoK1PMQFJ+oDDf6DMSQsWKJ
X-Google-Smtp-Source: APXvYqxDEv6oHrojDEfOThhnFRDPmXIk4Elqo8n/56b9tuazxZ5raaLdgwYNHM2FufpUHQMx3+OpgnUuJ9mx/2W2jtI=
X-Received: by 2002:a9d:760c:: with SMTP id k12mr763622otl.194.1559771142309; 
 Wed, 05 Jun 2019 14:45:42 -0700 (PDT)
MIME-Version: 1.0
From: Radu Rendec <radu.rendec@gmail.com>
Date: Wed, 5 Jun 2019 17:45:31 -0400
Message-ID: <CAD5jUk-meCjEoqJqwriEZxfXQqWvObZUPq0MP=pSQmAbAbXMkw@mail.gmail.com>
Subject: PowerPC arch_ptrace() writes beyond thread_struct/task_struct
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Everyone,

I'm seeing some weird memory corruption that I have been able to isolate
to arch_ptrace() [arch/powerpc/kernel/ptrace.c] and PTRACE_POKEUSR. I am
on PowerPC 32 (MPC8378), kernel 4.9.179.

It's not very easy for me to test on the latest kernel, but I guess
little has changed since 4.9 in either the architecture specific ptrace
code or PowerPC register data structures.

What happens is that gdb calls ptrace(PTRACE_POKEUSER) with addr=0x158.
This goes down to arch_ptrace() [arch/powerpc/kernel/ptrace.c], inside
`case PTRACE_POKEUSR`, on the branch that does this:

    memcpy(&child->thread.TS_FPR(fpidx), &data,
            sizeof(long));

where:
    index = addr >> 2 = 0x56 = 86
    fpidx = index - PT_FPR0 = 86 - 48 = 38
    &child->thread.TS_FPR(fpidx) = (void *)child + 1296

    offsetof(struct task_struct, thread) = 960
    sizeof(struct thread_struct) = 336
    sizeof(struct task_struct) = 1296

In other words, the memcpy() call writes just beyond thread_struct
(which is also beyond task_struct, for that matter).

This should never get past the bounds checks for `index`, so perhaps
there is a mismatch between ptrace macros and the actual register data
structures layout.

I will continue to investigate, but I'm not familiar with the PowerPC
registers so it will take a while before I make sense of all the data
structures and macros. Hopefully this rings a bell to someone who is
already familiar with those and could figure out quickly what the
problem is.

Best regards,
Radu Rendec

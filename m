Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4A129CBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:26:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hg7Z70wczDqJc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oPvK6VPz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hg5g0Y2kzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 13:24:22 +1100 (AEDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31BFA20828
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577154260;
 bh=SPQ7Bj4a4eNp21OAcqYrY8SxuFJJaC2a6yGdIeeRS1o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oPvK6VPzi1k2yyEjQny+BqytBOGY+Pvm5TAIa+d74eS8hvsJFnqaOLMcPbR1MVHcg
 TJAbv69cwFBjDUU1LcTUwFGC1sdBHfjcRbhYXPuD/8fDpRJfQhxnnenWDdYNTNMhtK
 WQtdttyNyw+EIZ8phdY7Uk7eLt21kAD5fLV0wvro=
Received: by mail-wr1-f41.google.com with SMTP id j42so18585943wrj.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 18:24:20 -0800 (PST)
X-Gm-Message-State: APjAAAUQSrqE09u3H/I+GgdybNQ+H0+gWugePzUqnnxSiZggXsLH5t1C
 GUnLzINuOc+Bt+ELUZXiWN3G30e8xgn3EM0TRe8ZFA==
X-Google-Smtp-Source: APXvYqxjzD58lmej1/f4cJSP7HhlmKnh8jXfi6lwDjHJL4b+9GZQPe+XjiFw3YmwCo3ewdHy4fkwT46pqN+EiY2Rfws=
X-Received: by 2002:adf:f491:: with SMTP id l17mr32117348wro.149.1577154258620; 
 Mon, 23 Dec 2019 18:24:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <de073962c1a5911343e13c183fbbdef0fe95449e.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <de073962c1a5911343e13c183fbbdef0fe95449e.1577111365.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 18:24:05 -0800
X-Gmail-Original-Message-ID: <CALCETrXWHk9J-pYm+eopMuW3x7Jr_LnzRjr94gq8g66xOO6SBg@mail.gmail.com>
Message-ID: <CALCETrXWHk9J-pYm+eopMuW3x7Jr_LnzRjr94gq8g66xOO6SBg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/10] lib: vdso: move call to fallback out of
 common code.
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> On powerpc, VDSO functions and syscalls cannot be implemented in C
> because the Linux kernel ABI requires that CR[SO] bit is set in case
> of error and cleared when no error.
>
> As this cannot be done in C, C VDSO functions and syscall'based
> fallback need a trampoline in ASM.
>
> By moving the fallback calls out of the common code, arches like
> powerpc can implement both the call to C VDSO and the fallback call
> in a single trampoline function.

Maybe the issue is that I'm not a powerpc person, but I don't
understand this.  The common vDSO code is in C.  Presumably this means
that you need an asm trampoline no matter what to call the C code.  Is
the improvement that, with this change, you can have the asm
trampoline do a single branch, so it's logically:

ret = [call the C code];
if (ret == 0) {
 set success bit;
} else {
 ret = fallback;
 if (ret == 0)
  set success bit;
else
  set failure bit;
}

return ret;

instead of:

ret = [call the C code, which includes the fallback];
if (ret == 0)
  set success bit;
else
  set failure bit;

It's not obvious to me that the former ought to be faster.

>
> The two advantages are:
> - No need play back and forth with CR[SO] and negative return value.
> - No stack frame is required in VDSO C functions for the fallbacks.

How is no stack frame required?  Do you mean that the presence of the
fallback causes worse code generation?  Can you improve the fallback
instead?

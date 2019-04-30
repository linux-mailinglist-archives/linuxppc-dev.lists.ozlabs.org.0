Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B50FE2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:51:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tncV0741zDqWk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=luto@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfHCGrtU"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tnW26WBjzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 02:47:10 +1000 (AEST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DAC82147A
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556642828;
 bh=S48pNAsTw7BEZ36AW1e1TSyWImwtIKer4k1K+rKGgdc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OfHCGrtUbiFJqLJB8TSFf7ldICXZA8iqik5XHx+uu4ZsE2UzlSk2VQWW6WYUsnUZr
 hB6najoPJUOCFObaMzBNFOEjtzUHebohanEO9HfhAwUAKuM2Lq8Up3CVLv213XzgBu
 yfoLpbcuVy3Wm2yY972dudRHvVjBb4hHzg0rXing=
Received: by mail-wr1-f46.google.com with SMTP id a9so21825896wrp.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 09:47:08 -0700 (PDT)
X-Gm-Message-State: APjAAAUG7Y5FLtTwPo0XLWFis3of2ThWibyvio3G286GtyB7tFfZ7a9K
 No9iGr/6vdcT71zoJxP7eCBO5bREisRledtI1Ei6cw==
X-Google-Smtp-Source: APXvYqzHEqvh6x3xmyRtRqKnO98xcUmDJgjMNHD1klJcb2L6wbWRNt5Tm23i28W+RKElRE+GeRwRbM4AmqFkXIl8JL4=
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr2206324wru.199.1556642826765; 
 Tue, 30 Apr 2019 09:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190318104925.16600-1-sudeep.holla@arm.com>
 <20190318104925.16600-4-sudeep.holla@arm.com>
In-Reply-To: <20190318104925.16600-4-sudeep.holla@arm.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 30 Apr 2019 09:46:54 -0700
X-Gmail-Original-Message-ID: <CALCETrXEebRqX0W8MuS0SeaMDpEO5KdS3k7id279hZgHrmc8yA@mail.gmail.com>
Message-ID: <CALCETrXEebRqX0W8MuS0SeaMDpEO5KdS3k7id279hZgHrmc8yA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] x86: clean up _TIF_SYSCALL_EMU handling using
 ptrace_syscall_enter hook
To: Sudeep Holla <sudeep.holla@arm.com>
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
Cc: Haibo Xu <haibo.xu@arm.com>, Steve Capper <Steve.Capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jeff Dike <jdike@addtoit.com>,
 X86 ML <x86@kernel.org>, Will Deacon <will.deacon@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Bin Lu <bin.lu@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 18, 2019 at 3:49 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> Now that we have a new hook ptrace_syscall_enter that can be called from
> syscall entry code and it handles PTRACE_SYSEMU in generic code, we
> can do some cleanup using the same in syscall_trace_enter.
>
> Further the extra logic to find single stepping PTRACE_SYSEMU_SINGLESTEP
> in syscall_slow_exit_work seems unnecessary. Let's remove the same.
>

Unless the patch set contains a selftest that exercises all the
interesting cases here, NAK.  To be clear, there needs to be a test
that passes on an unmodified kernel and still passes on a patched
kernel.  And that test case needs to *fail* if, for example, you force
"emulated" to either true or false rather than reading out the actual
value.

--Andy

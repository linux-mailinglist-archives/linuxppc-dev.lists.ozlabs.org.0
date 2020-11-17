Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485E2B6EDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:40:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGWD5L0TzDqDq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rc7d6RpV; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbGC06YY4zDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:26:19 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id s2so10788160plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 11:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKqRulGkV2LShhH9uPn88VjpNW5CZTHrE9JvGus3Oq4=;
 b=rc7d6RpVSCFKI0Sw1a4e96tqeXAAx3vGFZlWfh7LaDZz9RDWtKddRpHbPhv1joM4Y+
 t7pJjDUE0QhMKmq3jkCns/Rs9IwuVlU83i1zJcRBfFMhEXWqAh9l7JmFmF6Jf2kbY9kf
 w9mHbaHaccZUY2g2OEHwM/bHf6kcnqnd8QjLEgtebYolgrVfOpbo5I/7OzBsFV50ot/f
 xiU4LIEg5oN3tHO+0kX9dQSg3okg9baFJjgsqoaOKnIDH2Fj+I9H7eBFdptO7Qt79jqa
 eEbI+u0+d4sY5nLNci8l5tEVRwB9KfeHIgKE+2R05EUjiEYls+lPVgyW5KRstQhnOsrI
 xXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKqRulGkV2LShhH9uPn88VjpNW5CZTHrE9JvGus3Oq4=;
 b=RlNhx8KfzSEL2jT1ZFfCxGXmQOqR0nzDxkcqZKNH2bxtqnJp2AjsRAzcetsqx061jM
 U9M2qtWqYJpQEBFiV2KLrNddbVc7coI1dW2A5k2SLplOG4Y8Im3Ik7bK+VoqW9IBLvTj
 T5aYxhHD2sn70AmyXWxAilFKJ9paWOTHTP4HaO7H6v19LCrk7qYpdTWKyxqYIq5K/Hf6
 uEp9KeZ+LVCmwiVTuYV7UArXAOrgwnfO90/JIx4DE800NcDbjjiWaWwfBMn50MjYpSl3
 a9gpSGl9kLt9LDSKiu0ula/fRua7ysM4nvMoAQPyBbwP9+9WV6wNV8bDFyJdwjWYrcnA
 Ig3A==
X-Gm-Message-State: AOAM533B9jyNYGYtzenXUvcq8lLxsAJkqrBDroLpfu2DSSc4J2rtVmU4
 K3KsWe44+QabQYSELPTCVjbMeGELWaznVH50ocnSng==
X-Google-Smtp-Source: ABdhPJzP+4QKYAkg72V6rtkdqvhBULrrFPf48iQQXuByQ+8n8CY8f02CDItGHV1Pop+VXIorLkJaUVOuAP+DkTwZCiw=
X-Received: by 2002:a17:90a:4881:: with SMTP id b1mr595006pjh.32.1605641176219; 
 Tue, 17 Nov 2020 11:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
 <20201117015438.GA299247@ubuntu-m3-large-x86>
In-Reply-To: <20201117015438.GA299247@ubuntu-m3-large-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 11:26:05 -0800
Message-ID: <CAKwvOdmDY=rZDuyjAdXQ9ukms_356mw0wovpxVUJ9Jvz9hEG_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 5:54 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Nov 16, 2020 at 05:41:58PM -0800, Nick Desaulniers wrote:
> > On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > Currently, '--orphan-handling=warn' is spread out across four different
> > > architectures in their respective Makefiles, which makes it a little
> > > unruly to deal with in case it needs to be disabled for a specific
> > > linker version (in this case, ld.lld 10.0.1).
> >
> > Hi Nathan,
> > This patch fails to apply for me via b4 on next-20201116 due to a
> > conflict in arch/Kconfig:1028. Would you mind sending a rebased V2?
>
> Hi Nick,
>
> This series is intended to go into v5.10 so rebasing it against -next
> defeats that; please test it against v5.10-rc4, where it still applies
> cleanly. The conflicts will be handled by other entities (Stephen Rothwell
> and Linus).

Got it.  Yeah, applies fine to v5.10-rc4.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Feel free to carry those with MPE's suggested change added.

>
> If you want to test it against -next, 'git am -3' will allow you to
> easily handle the conflict.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers

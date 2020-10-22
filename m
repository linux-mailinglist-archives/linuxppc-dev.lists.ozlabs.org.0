Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13B296621
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 22:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHK992TRlzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 07:44:29 +1100 (AEDT)
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
 header.s=20161025 header.b=tqQKw8yf; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHK710XpkzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 07:42:36 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id r10so1597149plx.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M48Z6dq4Jhpe3JgUiGHx76Ra14zyQBkL7sy6RyPYqsE=;
 b=tqQKw8yfbOISqEcFPoYrhOHz6zTw8moGivLgeSpH6f0nev+ZF8PFQMRwnMnPiwvD6g
 2gBXGMJYaL54tTYK5g+TKtdHkfBXvLVpDrbucm8WeMh/cRni7umcVePSKAIm8n5G5rAI
 CX8/3IyLiDixZaMxqEWCWeMfzy7F0y18Z+hmAy9xOuaq6yqONXa+U05Ewj99IE3n8aT/
 73k1NRkZ+DkydDcHzqhTk5bGvxCsQ3TBFHRFAj+B+6Z0+frbVMtGJgO3oPP8qizQQA4Z
 5kBBQAonmHQPr8ug1nzXxsvzxNLxOaebi1ERdsoRHeoDjmv2dpy0IeoX4UbIserB5qcV
 7OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M48Z6dq4Jhpe3JgUiGHx76Ra14zyQBkL7sy6RyPYqsE=;
 b=eMekVR6aziKUc41UgSGKJBs3tb8HolHqqFACuVgwV3oHArwpQb7m/nBvgTpE84/NBe
 hfdmpZfjHyQ8lpgBWENjAf2z+bqfIXTYOYwJj2DweXrNg53mkYtQbRNiEkwWFo3fxjU2
 6BO46s/lwfz+Zzprn6GP6QkUn3kWp+V0R0yylvbrSX+/eYZ01F73FJrQb++V33AktxRP
 XIStLW/9MmMVf1WW7HQT/V0/b3hPC3TDcY0yJ91LD9ZYoy4x7FwwT5HQTqrS6VDPbTFy
 Q55cq/W8MP+Kf7fCynoIJFzvV9OpfC+zJuG+klIb28IIGxeFwzAw9552edTNGx0yj7sT
 HTLA==
X-Gm-Message-State: AOAM531srCn1b6CWabacMKPbaB5mIc7wZ0rZZ/lncDfHKOjprSsI4Gp3
 moKZmkkQzPGn27KbfP5dJN5FIUUOKFqwwbAK7b2vfg==
X-Google-Smtp-Source: ABdhPJymmYg+WiV/imoEhD5kjgx0cbehw+o61MV9WBX9bVP1AO8BGWs9+9Ahs8UXNlMep72HHNrY+fjTzvqNpJg5KYI=
X-Received: by 2002:a17:902:c24b:b029:d3:f3e6:1915 with SMTP id
 11-20020a170902c24bb02900d3f3e61915mr4264388plg.56.1603399352926; Thu, 22 Oct
 2020 13:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
In-Reply-To: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Oct 2020 13:42:21 -0700
Message-ID: <CAKwvOdmUPA9XupXwYHy_qT7P+LrUc+wseT79K_oqw=3y6bwLfg@mail.gmail.com>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
To: Joe Perches <joe@perches.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

.On Wed, Oct 21, 2020 at 7:36 PM Joe Perches <joe@perches.com> wrote:
>
> Use a more generic form for __section that requires quotes to avoid
> complications with clang and gcc differences.
>
> Remove the quote operator # from compiler_attributes.h __section macro.
>
> Convert all unquoted __section(foo) uses to quoted __section("foo").
> Also convert __attribute__((section("foo"))) uses to __section("foo")
> even if the __attribute__ has multiple list entry forms.
>
> Conversion done using a script:
>
> Link: https://lore.kernel.org/lkml/75393e5ddc272dc7403de74d645e6c6e0f4e70eb.camel@perches.com/2-convert_section.pl
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>
> This conversion was previously submitted to -next last month
> https://lore.kernel.org/lkml/46f69161e60b802488ba8c8f3f8bbf922aa3b49b.camel@perches.com/
>
> Nick Desaulniers found a defect in the conversion of 2 boot files
> for powerpc, but no other defect was found for any other arch.

Untested, but:
Reviewed-by: Nick Desaulniers <ndesaulniers@gooogle.com>

Good job handling the trickier cases when the attribute was mixed with
others, and printing it in scripts/mod/modpost.c.

The only cases that *might* be similar to PPC are:
>  arch/s390/boot/startup.c              |  2 +-
>  arch/x86/boot/compressed/pgtable_64.c |  2 +-
>  arch/x86/purgatory/purgatory.c        |  4 ++--

So a quick test of x86_64 and s390 would be good.

Thanks for the patch.

>
> The script was corrected to avoid converting these 2 files.
>
> There is no difference between the script output when run on today's -next
> and Linus' tree through commit f804b3159482, so this should be reasonable to
> apply now.


-- 
Thanks,
~Nick Desaulniers

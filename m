Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBED1FFF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 09:06:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454MsK61gJzDqfZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 17:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.217.68; helo=mail-vs1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Mqt0jZPzDqWZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 17:04:57 +1000 (AEST)
Received: by mail-vs1-f68.google.com with SMTP id q64so1645331vsd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 00:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q015/QHSXrok6Bw3iqMxHNHZLCbCNdwdW05xVaqSbFA=;
 b=NZCS20joMVSqRJc10IQAdpYtc5ZT55nOmrlSpKK1djTz+yRvOgXp7YaOW130hDB1wt
 m6S6S7xeP+ttKsSnQYDC0Uq24LJw3DfsdhYzkwSPTux+V0m4b+DAkzeW5YgCLCobvmkP
 LPuMfXnC1ALo5aRaOhVEdi8MsFkwOTP6T3uc5mzZ5f229o3//EiXyfjJtWdU/W9t2eli
 +zvAmk4hTZ6gZQklX+so5Xo7URp+LFjfh2oOuPqiApVVV3NaONp/Ifsnn4Dk590k3Opx
 Nsf0QW970L+nAPOmnJ4zkflFCypimh+WVfuhABJmj6uUplSKOV3svCk1usGeH214OV3X
 TxTQ==
X-Gm-Message-State: APjAAAXrbvrt9XyI+NuSnBnVjdSum5roLDvYdjNIee7A750NC6tx0Nze
 HG+gPeXOo4VCmz+HmMJXsHI6YlJHiEc/aAATviM=
X-Google-Smtp-Source: APXvYqw6dkP3FpbWRddQ96QVJAiiTPvgI18vgQaVewrbrBgFk7NwzmrgB/94Q+BFkCvWo9DPpaDiVAnXWQvZ+5swDfg=
X-Received: by 2002:a67:f303:: with SMTP id p3mr11428563vsf.166.1557990294356; 
 Thu, 16 May 2019 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190515090722.696531131@linuxfoundation.org>
 <20190515090731.364702401@linuxfoundation.org>
In-Reply-To: <20190515090731.364702401@linuxfoundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 May 2019 09:04:41 +0200
Message-ID: <CAMuHMdVFaQLbH7F=Ard5MzUzG1FTfwLH=7xz=LpA3YaZyj2+Zg@mail.gmail.com>
Subject: Re: [PATCH 4.4 247/266] cpu/speculation: Add mitigations= cmdline
 option
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Hutchings <ben@decadent.org.uk>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Steven Price <steven.price@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Waiman Long <longman@redhat.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, Will Deacon <will.deacon@arm.com>,
 Jiri Kosina <jikos@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jon Masters <jcm@redhat.com>, Phil Auld <pauld@redhat.com>,
 Jiri Kosina <jkosina@suse.cz>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, Tyler Hicks <tyhicks@canonical.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg, Ben,

On Wed, May 15, 2019 at 1:12 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
>
> commit 98af8452945c55652de68536afdde3b520fec429 upstream.
>
> Keeping track of the number of mitigations for all the CPU speculation
> bugs has become overwhelming for many users.  It's getting more and more
> complicated to decide which mitigations are needed for a given
> architecture.  Complicating matters is the fact that each arch tends to
> have its own custom way to mitigate the same vulnerability.
>
> Most users fall into a few basic categories:
>
> a) they want all mitigations off;
>
> b) they want all reasonable mitigations on, with SMT enabled even if
>    it's vulnerable; or
>
> c) they want all reasonable mitigations on, with SMT disabled if
>    vulnerable.
>
> Define a set of curated, arch-independent options, each of which is an
> aggregation of existing options:
>
> - mitigations=off: Disable all mitigations.
>
> - mitigations=auto: [default] Enable all the default mitigations, but
>   leave SMT enabled, even if it's vulnerable.
>
> - mitigations=auto,nosmt: Enable all the default mitigations, disabling
>   SMT if needed by a mitigation.
>
> Currently, these options are placeholders which don't actually do
> anything.  They will be fleshed out in upcoming patches.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

> [bwh: Backported to 4.4:
>  - Drop the auto,nosmt option which we can't support

This doesn't really stand out. I.e. I completely missed it, and started
wondering why "auto,nosmt" was not documented in
kernel-parameters.txt below...

> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -2173,6 +2173,25 @@ bytes respectively. Such letter suffixes
>                         in the "bleeding edge" mini2440 support kernel at
>                         http://repo.or.cz/w/linux-2.6/mini2440.git
>
> +       mitigations=
> +                       Control optional mitigations for CPU vulnerabilities.
> +                       This is a set of curated, arch-independent options, each
> +                       of which is an aggregation of existing arch-specific
> +                       options.
> +
> +                       off
> +                               Disable all optional CPU mitigations.  This
> +                               improves system performance, but it may also
> +                               expose users to several CPU vulnerabilities.
> +
> +                       auto (default)
> +                               Mitigate all CPU vulnerabilities, but leave SMT
> +                               enabled, even if it's vulnerable.  This is for
> +                               users who don't want to be surprised by SMT
> +                               getting disabled across kernel upgrades, or who
> +                               have other ways of avoiding SMT-based attacks.
> +                               This is the default behavior.
> +
>         mminit_loglevel=
>                         [KNL] When CONFIG_DEBUG_MEMORY_INIT is set, this
>                         parameter allows control of the logging verbosity for

> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -842,3 +842,16 @@ void init_cpu_online(const struct cpumas
>  {
>         cpumask_copy(to_cpumask(cpu_online_bits), src);
>  }
> +
> +enum cpu_mitigations cpu_mitigations = CPU_MITIGATIONS_AUTO;
> +
> +static int __init mitigations_parse_cmdline(char *arg)
> +{
> +       if (!strcmp(arg, "off"))
> +               cpu_mitigations = CPU_MITIGATIONS_OFF;
> +       else if (!strcmp(arg, "auto"))
> +               cpu_mitigations = CPU_MITIGATIONS_AUTO;

Perhaps

    else
            pr_crit("mitigations=%s is not supported\n", arg);

?

Actually that makes sense on mainline, too.
Cooking a patch...

> +
> +       return 0;
> +}
> +early_param("mitigations", mitigations_parse_cmdline);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

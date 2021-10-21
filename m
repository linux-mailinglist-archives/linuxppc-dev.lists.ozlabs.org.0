Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F1435CB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 10:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZgCQ6Q3jz2ybM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:10:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.51; helo=mail-qv1-f51.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZgBx03sHz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 19:10:16 +1100 (AEDT)
Received: by mail-qv1-f51.google.com with SMTP id d6so387991qvb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 01:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hd/+QnCCQ1ttXjZzIuOwM5Awcbe5eGoYYrYqsyq6bCA=;
 b=j0CswXMw1kxN/5X6ee/O4stYowf+n+HPXMpfyAM6HiQztF9q89JZs7RWMz2ZPMy+pA
 POp+icU0W+cMqm86NmdFquwlgd++Ux/XVPRbEynA4nU/3PEBGb1Y7hu5RzynXsrvoTuy
 LjQXskr2qsugwYIlO0+GmR6wF7Fm5WqNuiBTmD4GSJTKlKs05fBd85A1+nRFg9YDzF0l
 AiTqXwbM2ZLl6vzRdNUGEp4fLkuNc4OM1ooy2vWO0M7bAr6uhbFmcGSfoaYrd2Ukodza
 Kr937wdjO4YECkMdkbEGujhSiPOMlg5PBqpbUqnKkphVmRnNWjXXwcNtSWqww6W5zwu2
 A4Jg==
X-Gm-Message-State: AOAM532HqBrWPsC/iGUe1+JKVlgsoA1zhR+NueAU+QWrhPgNs7BeVOVm
 gQoEC9ytjVRjaijzN+FiMpxpx+bw9PM64g==
X-Google-Smtp-Source: ABdhPJyhJqVR8t7KYMujQ+3ibZQOrX38JL4qBO358X40qV2b266+rcAP9+fghy725s2i3ERp3bqmpg==
X-Received: by 2002:a05:6214:80c:: with SMTP id
 df12mr3598130qvb.4.1634803808708; 
 Thu, 21 Oct 2021 01:10:08 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
 [209.85.222.177])
 by smtp.gmail.com with ESMTPSA id bq41sm2251091qkb.26.2021.10.21.01.10.08
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 01:10:08 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id bp7so6517813qkb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 01:10:08 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr4816956uac.114.1634803797383; 
 Thu, 21 Oct 2021 01:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <87y26nmwkb.fsf@disp2133> <877de7jrev.fsf@disp2133>
In-Reply-To: <877de7jrev.fsf@disp2133>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Oct 2021 10:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
Message-ID: <CAMuHMdURxrdjsXq7+q-AWTwxVUdmddOj2vvNHv6M=WtsU5nRvg@mail.gmail.com>
Subject: Re: [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV) with
 force_fatal_sig(SIGSEGV)
To: "Eric W. Biederman" <ebiederm@xmission.com>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Greentime Hu <green.hu@gmail.com>, H Peter Anvin <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Openrisc <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Zankel <chris@zankel.net>,
 Jonas Bonn <jonas@southpole.se>, Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Maciej Rozycki <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Eric,

Patch 21/20?

On Wed, Oct 20, 2021 at 11:52 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
> Now that force_fatal_sig exists it is unnecessary and a bit confusing
> to use force_sigsegv in cases where the simpler force_fatal_sig is
> wanted.  So change every instance we can to make the code clearer.
>
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

>  arch/m68k/kernel/traps.c        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

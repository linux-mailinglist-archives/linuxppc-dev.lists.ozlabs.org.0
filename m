Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8C9435CF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 10:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZghw1Wpxz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:32:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=philippe.mathieu.daude@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZghT4c1Dz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 19:32:25 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id v77so4178oie.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 01:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ceLayuoY70owN3NNsnQH6S+jy2K/HGM8B6O2q8i1GAk=;
 b=a/cMfD1YPQywsaWfimNXwn8bHDxHDuzYUydxvWSV3cG9HaY4/X+rhT8zoJZwoxsx4Y
 ngj4Xhrj3MwQujWRBJdDh7OtBiMfAYZE9ozgbWRSnGxT6j3GRPVn5TacOnh6wF499NgG
 pgfZWBzoy8qCl+U9BbCN45FowE7dqFjAQRimtw01oszN8RaVSe4tPfYm3iwcNMA1ijkL
 g21Ze+0xOKtuQxU9n/CPw+3Yijm4HgZwL6sgsx+DeJPyHYnM5wwwRxfeHffT41UEzKJS
 21HYekR9nCRqoeZyrX+028Dl8/Lsb8seoQmN8INsTiaAXOts2hY+71rHAFjnKpO6ri7q
 zO8A==
X-Gm-Message-State: AOAM530yI3SogauLi+uqAr9Yc3kJVcNlO0iJ9KAx880hCpxHvQyVVR0m
 aol5eyQ03EEeFMHXEI6djtZOuXN866QRSBT3O74=
X-Google-Smtp-Source: ABdhPJxII4gwyuuwZSE0+97ar6I7zWp2Jlu7LoTmQcOVpBv5Lkm+3ns6lcPNpIqYwJ3CoMM3pxGAXl0ujDP3wS4Hl9w=
X-Received: by 2002:aca:eb82:: with SMTP id j124mr3578574oih.46.1634805141944; 
 Thu, 21 Oct 2021 01:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <87y26nmwkb.fsf@disp2133> <877de7jrev.fsf@disp2133>
In-Reply-To: <877de7jrev.fsf@disp2133>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 21 Oct 2021 10:32:10 +0200
Message-ID: <CAAdtpL5+bjpy93DY5gf1ZM4k3BtP+JNJAUSSmvt8cq3shsJR4A@mail.gmail.com>
Subject: Re: [PATCH 21/20] signal: Replace force_sigsegv(SIGSEGV) with
 force_fatal_sig(SIGSEGV)
To: "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-xtensa@linux-xtensa.org,
 Oleg Nesterov <oleg@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, H Peter Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maciej Rozycki <macro@orcam.me.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 20, 2021 at 11:52 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
>
> Now that force_fatal_sig exists it is unnecessary and a bit confusing
> to use force_sigsegv in cases where the simpler force_fatal_sig is
> wanted.  So change every instance we can to make the code clearer.
>
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> ---
>  arch/arc/kernel/process.c       | 2 +-
>  arch/m68k/kernel/traps.c        | 2 +-
>  arch/powerpc/kernel/signal_32.c | 2 +-
>  arch/powerpc/kernel/signal_64.c | 4 ++--
>  arch/s390/kernel/traps.c        | 2 +-
>  arch/um/kernel/trap.c           | 2 +-
>  arch/x86/kernel/vm86_32.c       | 2 +-
>  fs/exec.c                       | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

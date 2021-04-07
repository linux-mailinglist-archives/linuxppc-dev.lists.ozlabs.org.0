Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEE35672E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 10:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFdLd2Jvqz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 18:47:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UDQs+QKz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UDQs+QKz; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFdL92Qggz2xfS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 18:46:56 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id c17so12393253pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZttKhZHU6qaVsRmUnPJpvZt0Hi/pFu56dbeZNbDXtU=;
 b=UDQs+QKztlc50Xzz9tDRt+AdeuvS//lqLAuKnWXU/KpkdRIyYns185alJd77pimmOQ
 Rm+SXfRq7Nbp44iFj09DlIBP8pB9Q/wr1Jktw0TsONZCLU6cUjKoAcBW9MELgEDcm9Fe
 pjdoHv/Z1K75roAdGxxxm60OLnxr6B3j/huNdwRUOBcR/NfWwdJ0T2Ry1GSBSm5M8gQG
 cPX3YXLL7dtqUWW4/37Lsyk3k7L76r1KootJDPbDvQIsbhQfbSpG/LRrVUU53kFzKElU
 mZPAf+0lfHR42X+g8hHRO6PYug2sgsVVq7CJaXGQetXBqPCEBbWZWj0if+0XEWIBGBV8
 f3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZttKhZHU6qaVsRmUnPJpvZt0Hi/pFu56dbeZNbDXtU=;
 b=kJEgWDjZF+JydiQlL1VEfNIsLPzHjvTXw9/dGS6xPxUOJdDpZTzXh/IIt7KpYeRPmg
 18N3Deu0pzEwIgX6XOStpwi+WX0YubFWPEP75mbEpAWRNXZHRSrhayRdnZY1vzgLnvc1
 KQENZ3vs3MY6O5Klj4eajE031NXCPr3s62XPccPMYLxKrwhh3o+CTdGbLAc18EZENad3
 ANdr4ChgnBwkcxrB0cqHNmtTuhaCdTisKPV6wWPU1TGS5C/v0O/Z5dXTdaJIzx9c2IIP
 yWaibIA+c7AKXmWUfvmPI6Y37tzXc9Mf0Ug10Deiq6MkNyyyAyUQTTx1VowULy8x2B9p
 hpHg==
X-Gm-Message-State: AOAM530MKzBsMC39Jjeb+GH+ILzOoUClaIYYJwz8IZ7EGtUB03nyIjzg
 LsfyJHG3VjwGSoVXgkm/mesvnJ59qJcANOYJRes=
X-Google-Smtp-Source: ABdhPJyOREH8pH5Yw3mdnLvelVM7fjh26m8MXKE2FHM7iVCNEkdX6M5hYPv1kbA5tQgLzWX2dL38Pt50r64dgAgPi18=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr2244351pga.203.1617785213524; 
 Wed, 07 Apr 2021 01:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
 <202104061143.E11D2D0@keescook>
In-Reply-To: <202104061143.E11D2D0@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 7 Apr 2021 11:46:37 +0300
Message-ID: <CAHp75Ve+11u=dtNTO8BCohOJHGWSMJtb1nGCOrNde7bXaD4ehA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
To: Kees Cook <keescook@chromium.org>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Iurii Zaikin <yzaikin@google.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, Joerg Roedel <jroedel@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Eric Biederman <ebiederm@xmission.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 7, 2021 at 11:17 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Apr 06, 2021 at 04:31:58PM +0300, Andy Shevchenko wrote:
> > kernel.h is being used as a dump for all kinds of stuff for a long time.
> > Here is the attempt to start cleaning it up by splitting out panic and
> > oops helpers.
> >
> > At the same time convert users in header and lib folder to use new header.
> > Though for time being include new header back to kernel.h to avoid twisted
> > indirected includes for existing users.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> I like it! Do you have a multi-arch CI to do allmodconfig builds to
> double-check this?

Unfortunately no, I rely on plenty of bots that are harvesting mailing lists.

But I will appreciate it if somebody can run this through various build tests.

> Acked-by: Kees Cook <keescook@chromium.org>

Thanks!


-- 
With Best Regards,
Andy Shevchenko

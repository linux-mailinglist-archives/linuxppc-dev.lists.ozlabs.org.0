Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8AA1431
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:53:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxGp40Q4zDqRk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:53:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JxBg6l29zDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:50:03 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id m10so2287096qkk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hJnFjek23O2V38kY7EYOvwYgJYYzBTv0EJwKFbs3Z3k=;
 b=BghE2lX1eXoB8DfoBQyuAkPG+mQGjeqlMaykAYKvMVNzmkWBAySS5qihHdhW7K0lhR
 0J/+NFeSqFHjgAzqK4XRMPi+ZBLn1FQH21E+/GuV7DJPKi2f0nNywUj0sgQlxa80QGAo
 aQHszixJzwYMRvmzxRkU6v9WV4dl+GA7p3wI/FPjpy3fdu0D56D8C51B3lRhNo5E+J3A
 zrMxGzAFhrGMuLYnhK/Q7n0sWeUyDrftSmDptDZUsVHlaMx6nGDKAiNd/P1xBwuhkufv
 XLwTBz31HYMPfn+Q1KQn5bWAJ3ihPI1gVfswZmX6bViB6E+qzaHTpM2WFMZi41z1H+Fz
 vHUA==
X-Gm-Message-State: APjAAAVbDD+cFjhyumV3m1pRadZpGj0z5OUhB+5KWyiGAJnj6I1vRv9o
 AAA/aHb2uMRTDFt3OTloYA/sRvKpKBxbMP09BQI=
X-Google-Smtp-Source: APXvYqzfksfAvkZZtTSqyDq8tB0+Rf1Wd2K6am1QAcyFlx3Qsw97Mog/htbrBH92YpGL+Cf/beVqCnNpQcD8Fvoer0Q=
X-Received: by 2002:a37:4051:: with SMTP id n78mr8064833qka.138.1567068600467; 
 Thu, 29 Aug 2019 01:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567007242.git.msuchanek@suse.de>
 <0ad51b41aebf65b3f3fcb9922f0f00b47932725d.1567007242.git.msuchanek@suse.de>
 <20190829064624.GA28508@infradead.org>
 <CAK8P3a2qgLTbud+2Fw8Rr0RXV8-xwBMiBg3hFuqqBinN1zS90A@mail.gmail.com>
 <b3f74049-be82-be3c-5156-69a18010537e@c-s.fr>
In-Reply-To: <b3f74049-be82-be3c-5156-69a18010537e@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 29 Aug 2019 10:49:43 +0200
Message-ID: <CAK8P3a1zXqUP0R2O88wnoc35tU9YzF5hZV0J2N6tXG27UJb0tw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/64: make buildable without CONFIG_COMPAT
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Christoph Hellwig <hch@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian@brauner.io>, Firoz Khan <firoz.khan@linaro.org>,
 Michal Suchanek <msuchanek@suse.de>, Joel Stanley <joel@jms.id.au>,
 Nicolai Stange <nstange@suse.de>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 10:38 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 29/08/2019 =C3=A0 10:01, Arnd Bergmann a =C3=A9crit :
> > On Thu, Aug 29, 2019 at 8:46 AM Christoph Hellwig <hch@infradead.org> w=
rote:
> >
> >>> @@ -277,7 +277,7 @@ static void do_signal(struct task_struct *tsk)
> >>>
> >>>        rseq_signal_deliver(&ksig, tsk->thread.regs);
> >>>
> >>> -     if (is32) {
> >>> +     if ((IS_ENABLED(CONFIG_PPC32) || IS_ENABLED(CONFIG_COMPAT)) && =
is32) {
> >>
> >> I think we should fix the is_32bit_task definitions instead so that
> >> callers don't need this mess.  I'd suggest something like:
> >>
> >> #ifdef CONFIG_COMPAT
> >> #define is_32bit_task()         test_thread_flag(TIF_32BIT)
> >> #else
> >> #define is_32bit_task()         IS_ENABLED(CONFIG_PPC32)
> >> #endif
> >
> > Are there actually any (correct) uses of is_32bit_task() outside of
> > #ifdef CONFIG_PPC64?
>
> There is at least  stack_maxrandom_size()
> Also  brk_rnd() and do_signal()

Right, makes sense.

      Arnd

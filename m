Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D03F4A1339
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:06:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JwDP4sclzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:06:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jw6l6MY5zDrJC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:01:35 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id u34so2705085qte.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TrDRlo6tswkQiQ3OI2OWjkWb4KwruICZsEfI0GzK7Ww=;
 b=l0wZdAa6xjwqemL5q5g7WcpD9exYGpZtq1ql5cM/fuEgAECUmFnN1qdqwpZ7uTZCoR
 YoPIW/a5WhrVhmeV6/siOCxf8CV2G+1YtpFvj8eBQfdQ9tSAlSgH5bms6RSFAtVNqtK1
 Z1njxD1bPuJH+z16RPbGro9dNukfz6rwGa9LFD7Amk57ZflaEI2WbTeL2sLImm/m1oqi
 SOvdY1fFbcpYerTNU9BuVJQnBc0DhhlmJIYE8ZV2+6LwA6IhvBOh2zFClXE/eU/H1Zxy
 woSaRquIqlmkMt5jIpiplTUBMfyR/1t0rFmzXa3cBHpPLGVIyKNdYyKe/EKNfE8cB4oL
 /qeQ==
X-Gm-Message-State: APjAAAWJhu84z4f62+aMJsk7j94Z8OZk0N+bk5D89v5eoHtqcGaeH7RB
 E0/B7VI1j5SOl6ghKWp7DeBiKiLpEcnaF8yYH2VdfwIvFfk=
X-Google-Smtp-Source: APXvYqwtnho1S9aTMw3n9PpmlnfWxuTW5C6zA+a08plX+sQKqxSz2EK+Fy0FMAYbRaCLp86xbGf9AV3saoTYB0mrL94=
X-Received: by 2002:ac8:35bb:: with SMTP id k56mr6444401qtb.142.1567065692859; 
 Thu, 29 Aug 2019 01:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567007242.git.msuchanek@suse.de>
 <0ad51b41aebf65b3f3fcb9922f0f00b47932725d.1567007242.git.msuchanek@suse.de>
 <20190829064624.GA28508@infradead.org>
In-Reply-To: <20190829064624.GA28508@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 29 Aug 2019 10:01:16 +0200
Message-ID: <CAK8P3a2qgLTbud+2Fw8Rr0RXV8-xwBMiBg3hFuqqBinN1zS90A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/64: make buildable without CONFIG_COMPAT
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Michael Neuling <mikey@neuling.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Christian Brauner <christian@brauner.io>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 8:46 AM Christoph Hellwig <hch@infradead.org> wrote:

> > @@ -277,7 +277,7 @@ static void do_signal(struct task_struct *tsk)
> >
> >       rseq_signal_deliver(&ksig, tsk->thread.regs);
> >
> > -     if (is32) {
> > +     if ((IS_ENABLED(CONFIG_PPC32) || IS_ENABLED(CONFIG_COMPAT)) && is32) {
>
> I think we should fix the is_32bit_task definitions instead so that
> callers don't need this mess.  I'd suggest something like:
>
> #ifdef CONFIG_COMPAT
> #define is_32bit_task()         test_thread_flag(TIF_32BIT)
> #else
> #define is_32bit_task()         IS_ENABLED(CONFIG_PPC32)
> #endif

Are there actually any (correct) uses of is_32bit_task() outside of
#ifdef CONFIG_PPC64?

I suspect most if not all could be changed to the generic
in_compat_syscall() that we use outside of architecture specific
code.

       Arnd

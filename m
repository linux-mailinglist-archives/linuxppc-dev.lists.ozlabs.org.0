Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361F23A7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:41:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4571mN4rcHzDqJQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 00:41:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4571h418jwzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 00:37:23 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id j1so8908694qkk.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 07:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z/2L5o2AoOKLKFPcdkjNIAmz2G/5ZFe52UTQRqPzuYk=;
 b=BOkVYBJvOxIh2qC9ookHCDi3d6ahReqBjc2UYJXtqK0LmoAZZF+JDT4fqLzkqYRO8Q
 kBimWDaJxK//xPQk6nkbWrSykfo9Lp7u8sbWiOi75jiZiw+0T2WmGmRGxxygEDCjXfiv
 3DDEwEdZiZxj0320JJ7H270y+5l8ty5FTAv6EUiA+oNW8/VtTHwywY2fRdEWluNzHrjY
 jAKPUC6+fMoqftU3Xh/lPu2kEKLSuMrRQqWB4a+dptVyNTkPdlMJI/1dylDY66F86va+
 /rM9TxlRP+WWFcWGpNgIAMLU8r5b/cFntJRCqWKEjCX6oRp5Il3LPS0Wa1B6OI3+TV5A
 araw==
X-Gm-Message-State: APjAAAVTnHsXim29JqoiWHubByI/DWGW40Od/6TAf32gZArHrDTEgud8
 LGUzrVGVWq/WC8pgM31enJwektkJa6W34eO9Rfc=
X-Google-Smtp-Source: APXvYqw/K0JoPhQjbioFloDoxv8hPwsc8PzdGxaBHlE2BolGJGFffF+O1yZKUKyE5ZdibkGoaW8RhPzIvapSmk2bhfM=
X-Received: by 2002:a05:620a:5ed:: with SMTP id
 z13mr21969541qkg.84.1558363041328; 
 Mon, 20 May 2019 07:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190520134605.29116-1-christian@brauner.io>
In-Reply-To: <20190520134605.29116-1-christian@brauner.io>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 May 2019 16:37:03 +0200
Message-ID: <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pid: add pidfd_open()
To: Christian Brauner <christian@brauner.io>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Linux API <linux-api@vger.kernel.org>,
 "Reshetova, Elena" <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Daniel Colascione <dancol@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, cyphar@cyphar.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 3:46 PM Christian Brauner <christian@brauner.io> wrote:
>
> In line with Arnd's recent changes to consolidate syscall numbers across
> architectures, I have added the pidfd_open() syscall to all architectures
> at the same time.

Thanks! I've checked that the ones you have added are all
done correctly. However, double-checking that you got all of them,
I noticed that you missed mips-o32 and mips-n64. With those added:

Acked-by: Arnd Bergmann <arnd@arndb.de>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735318E1C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 15:13:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l2gQ71ZgzF0B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 01:13:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=U6uraq1+; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l2cn3XXWzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 01:11:21 +1100 (AEDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EDB32078B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584799878;
 bh=z3bsHcwPw1dy+MZ69yHRllkviwuFf+1W8mJ1Vq6tZx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U6uraq1+O/wBDq9BdnirqCkla8fi4hhFooa9u8EOGpG/NUK8KcAg8m6t2KHRzRSTZ
 U1tt2IsiTDMVS0ltxGzSghSwm0SPd3Ix8AtBnYo+moOc67e2fIk/ICATj9ELG9zqHj
 KWOd3QQR+qDycpEtfRl0ifl4E+I1zEKfB5l1H1GU=
Received: by mail-lf1-f42.google.com with SMTP id c20so6743945lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 07:11:18 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2PPznzLZ+TYRboSXBPJGC24j1m6VBrLWW2kky4e4a7yjT8I/Te
 OQTi89fByjMAWcvqPecayz5dMSjBvIh4Zyi6W7E=
X-Google-Smtp-Source: ADFU+vt7yzzoIODXTl3pSLaF05QHM7NQajznhAWuFfmnjqd/dl0IS02TuRz56P5ko6Q0w3g4sq26da7i2uTfuhqRlWs=
X-Received: by 2002:a05:6512:1116:: with SMTP id
 l22mr8128251lfg.70.1584799876421; 
 Sat, 21 Mar 2020 07:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204408.010461877@linutronix.de>
 <20200320094856.3453859-1-bigeasy@linutronix.de>
 <20200320094856.3453859-3-bigeasy@linutronix.de> <tglx@linutronix.de>
 <CAJF2gTQDvmSdJB3R0By0Q6d9ganVBV1FBm3urL8Jf1fyiEi+1A@mail.gmail.com>
 <87zhc9rjuz.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zhc9rjuz.fsf@nanos.tec.linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 21 Mar 2020 22:11:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTTFYSwFYZArmJRkVJOKL2pWWgLj9nAQ_EdH2rU3jTdbw@mail.gmail.com>
Message-ID: <CAJF2gTTTFYSwFYZArmJRkVJOKL2pWWgLj9nAQ_EdH2rU3jTdbw@mail.gmail.com>
Subject: Re: [PATCH 2/5] csky: Remove mm.h from asm/uaccess.h
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 joel@joelfernandes.org, Will Deacon <will@kernel.org>, mingo@kernel.org,
 dave@stgolabs.net, Arnd Bergmann <arnd@arndb.de>, linux-csky@vger.kernel.org,
 torvalds@linux-foundation.org, paulmck@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>, kurt.schwemmer@microsemi.com,
 kvalo@codeaurora.org, kbuild test robot <lkp@intel.com>, balbi@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, netdev@vger.kernel.org,
 logang@deltatee.com, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 21, 2020 at 8:08 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Guo Ren <guoren@kernel.org> writes:
>
> > Tested and Acked by me.
> >
> > Queued for next pull request, thx
>
> Can we please route that with the rcuwait changes to avoid breakage
> unless you ship it to Linus right away?

Ok, I won't queue it.

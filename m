Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF93FF1CB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 18:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0n1j5vd5z2yWG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 02:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.48; helo=mail-ua1-f48.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0n1H6zXHz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 02:48:19 +1000 (AEST)
Received: by mail-ua1-f48.google.com with SMTP id l24so1253625uai.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Sep 2021 09:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhkscD4eQg3gMjYYcjIloMpyH+TEyxkuIO5LmcQoPWs=;
 b=GqMLFHMpfGtlMioMSPkc18SvX1VMP9+qPXQZn/6jq4DgrHHFG/y7RGFYVc8nqiAsTI
 7XAE1LU1eJAFs1/o+5STWHLsZKYCodEe/Ab1mdsgNOm9lNWGFlg2BA30mwWQz4LvBhKv
 XaHveb690jOj1JYELNis+kSOCGPf/Kp2VQ5eXhUVHZHR4Mrp8FRMFiMYDEJv6D2joYPm
 G379Ge9nwUI1Vhg11zcj3iALCJwUQUkowK3gwcxjgHEQMEUCyRT1nQQdM7Flj7o+kaPc
 NwsiF8LOVydIb6yDZvq3xNgatC1DBLHxEZKzO2JXx0zmNHAeMXCBSsj5H5bgXFw/MCd6
 nOzA==
X-Gm-Message-State: AOAM531GXZHohYtw5Z1XRVj35lPulMcpk1Ao1NmWem+eslvgcWRFKhSQ
 ox8q45EgMWIXzr05L2LJoXc4oWlq8n+/XZpQl18=
X-Google-Smtp-Source: ABdhPJyuhec501quue5johUkVxFJO20CoY6RBbUUFUt2/IiM8feEkGMBc4qTFxABKXXzXDsZOcNKxYozPx3hZ3ZWp0g=
X-Received: by 2002:ab0:4d5b:: with SMTP id k27mr2702126uag.78.1630601295450; 
 Thu, 02 Sep 2021 09:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210715193359.25946-1-john.ogness@linutronix.de>
 <20210715193359.25946-4-john.ogness@linutronix.de>
In-Reply-To: <20210715193359.25946-4-john.ogness@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Sep 2021 18:48:04 +0200
Message-ID: <CAMuHMdXa-ahzQX2FMb-YZ9Yc4Z=72JpaN8Z9bC5htmyvEDSh+w@mail.gmail.com>
Subject: Re: [PATCH printk v4 3/6] printk: remove safe buffers
To: John Ogness <john.ogness@linutronix.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, kexec@lists.infradead.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Yue Hu <huyue2@yulong.com>,
 Paul Mackerras <paulus@samba.org>, Eric Biederman <ebiederm@xmission.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi John,

On Thu, Jul 15, 2021 at 9:53 PM John Ogness <john.ogness@linutronix.de> wrote:
> With @logbuf_lock removed, the high level printk functions for
> storing messages are lockless. Messages can be stored from any
> context, so there is no need for the NMI and safe buffers anymore.
> Remove the NMI and safe buffers.
>
> Although the safe buffers are removed, the NMI and safe context
> tracking is still in place. In these contexts, store the message
> immediately but still use irq_work to defer the console printing.
>
> Since printk recursion tracking is in place, safe context tracking
> for most of printk is not needed. Remove it. Only safe context
> tracking relating to the console and console_owner locks is left
> in place. This is because the console and console_owner locks are
> needed for the actual printing.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Thank you very much for reducing kernel size by ca. 8 KiB!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

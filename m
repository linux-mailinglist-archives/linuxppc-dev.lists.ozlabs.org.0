Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAEF2CEBDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 11:09:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnT3034rTzDrQv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:09:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnT1Q190pzDqv5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 21:08:25 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id y74so5541377oia.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 02:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vJmJ6rt51XGfyHKdiHaiaw3R9dpFJvdi4CGbEaDzt0=;
 b=qEED/KwlEcDK4qeYiceyMqfwNJ9qVcaBPb3tgVAdx8pqcv6WLnshZFVUuVyDOZPykk
 Meb5QMFwNo5MDz7p5PzRXygbCA/fFcikX1I+B0BTXFlK8UoNdsbGKKGDfHNWQB2C8NHN
 uRDzJ7GtvWlShN/VwUM1Vzi2bSQWQOg5ZIg6dv6Nb1tXGQAj80HuUFOupWJ2sI603rc2
 1P1Kx5iUgB9F/krlrEpRs75tIxDIXq2/krFJznaIq8WWplKcHhUhUm6Og2C86OGZT+oo
 DpVX2SQqYMoeHBOV28e26Hloopk2oFE7IvV4ToIhCOjc0few7EAqVcROMkw5pfUxviv3
 IMJg==
X-Gm-Message-State: AOAM533dup+cTE97MRFKQ1HTC4ENsmt7wj2qlp4o4gGpZbwl04VLnHzm
 F084pH3UuJyQjyY/gUexTw2hNqVPScahVNZG6Yc=
X-Google-Smtp-Source: ABdhPJzA2Jell/icS2mx5nSxlBHT0Lu0M6uda7dE4x2w3itTDp6TarggWiWyTkMGUD/a98PKof7GXM0aCuiIqCCT8Yc=
X-Received: by 2002:aca:4cd8:: with SMTP id z207mr2633455oia.148.1607076502495; 
 Fri, 04 Dec 2020 02:08:22 -0800 (PST)
MIME-Version: 1.0
References: <0f0a25855391e7eaa53a50f651aea0124e8525dd.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <0f0a25855391e7eaa53a50f651aea0124e8525dd.1605847196.git.fthain@telegraphics.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Dec 2020 11:08:11 +0100
Message-ID: <CAMuHMdX5yUaCWYsM7WgatYSDLZMcSckugOQxBBnBZOB_eJm=1g@mail.gmail.com>
Subject: Re: [PATCH] macintosh/adb-iop: Always wait for reply message from IOP
To: Finn Thain <fthain@telegraphics.com.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Fri, Nov 20, 2020 at 5:54 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> A recent patch incorrectly altered the adb-iop state machine behaviour
> and introduced a regression that can appear intermittently as a
> malfunctioning ADB input device. This seems to be caused when reply
> packets from different ADB commands become mixed up, especially during
> the adb bus scan. Fix this by unconditionally entering the awaiting_reply
> state after sending an explicit command, even when the ADB command won't
> generate a reply from the ADB device.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Fixes: e2954e5f727f ("macintosh/adb-iop: Implement sending -> idle state transition")
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks for your patch!

> --- a/drivers/macintosh/adb-iop.c
> +++ b/drivers/macintosh/adb-iop.c
> @@ -84,10 +84,7 @@ static void adb_iop_complete(struct iop_msg *msg)
>
>         local_irq_save(flags);
>
> -       if (current_req->reply_expected)
> -               adb_iop_state = awaiting_reply;
> -       else
> -               adb_iop_done();
> +       adb_iop_state = awaiting_reply;
>
>         local_irq_restore(flags);
>  }
> @@ -95,8 +92,9 @@ static void adb_iop_complete(struct iop_msg *msg)
>  /*
>   * Listen for ADB messages from the IOP.
>   *
> - * This will be called when unsolicited messages (usually replies to TALK
> - * commands or autopoll packets) are received.
> + * This will be called when unsolicited IOP messages are received.
> + * These IOP messages can carry ADB autopoll responses and also occur
> + * after explicit ADB commands.
>   */
>
>  static void adb_iop_listen(struct iop_msg *msg)
> @@ -123,8 +121,10 @@ static void adb_iop_listen(struct iop_msg *msg)
>                 if (adb_iop_state == awaiting_reply) {
>                         struct adb_request *req = current_req;
>
> -                       req->reply_len = amsg->count + 1;
> -                       memcpy(req->reply, &amsg->cmd, req->reply_len);
> +                       if (req->reply_expected) {
> +                               req->reply_len = amsg->count + 1;
> +                               memcpy(req->reply, &amsg->cmd, req->reply_len);
> +                       }

So if we're not expecting a reply. It's ignored.
Just wondering: what kind of messages are being dropped?
If reply packets from different ADB commands become mixed up,
they are still (expected?) replies to messages we sent before. Why
shouldn't we depend on receiving the replies?

>
>                         req_done = true;
>                 }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

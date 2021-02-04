Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C2310021
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 23:37:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWths6QFvzDq9n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 09:37:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cIXN/L4+; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWtg70C4xzDvYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 09:35:45 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id o18so3657089qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 14:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c/LawSxYi3ooi+jx8tMFJRDuOSYkGLnBjCJsS5cMwW0=;
 b=cIXN/L4+RBamqknWxJ/9/w3hWJCbFughWGOh8tKQhhbr1vyJlN2/Y6ezV8omFtTe+N
 aMxqaH/cgxkKM5dGNBRLf/O0b/4f3Qa72sChKuupte1DJVR5Wi6XU2Rfbj3iMOw/4GCG
 m5COjHVSDa9MjZLGnXOok4XnBUElnZSftpk2vP822PAsjPzUzpPQtzoAUvrcI+Qn9gwx
 nbKHg3eKzrD7QogB2c0S4re7q9qa2c5fdX1sHtiYFIGIDODHUpM0x/1uQWNeuAMJEOob
 GejXnwd3DINbfqbhuGtj+v3E/MaxIlbhRt9f83hr8NnKEhWKJPL055oj3Fzuaqtf4PIH
 z9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/LawSxYi3ooi+jx8tMFJRDuOSYkGLnBjCJsS5cMwW0=;
 b=U7awFGam/BYsCIJPDiEXfeumBhrzcDIYqan7r7hXfDcErllj5XHGIYHeGtNXj4prYB
 RSUoN+41HfqwdH4fGJZ4TTZWu8mpa2EBfV1DZWdQkxuUXHbDuIJYA1n8PeZ73ohQeNUY
 Psg9xzBUHXexBltS7e/sfWV/2jtaVEiBv2EtSceHQWcFxMJihpEmnf0sMuoixx6Yj7Wv
 sBI7gcEZ6twVdKqb24JsGMzYDbO6MAkgtCqBw0uGU8WVhZyi/THEHuGaaD6pskmqDIhK
 PyP6NaBiOGUQe3zTLhWJ3p+Yh81nGZEnuqTi1KTIXYplSRjbIdgZN+G/dLAgZ5silIk0
 BilQ==
X-Gm-Message-State: AOAM531zWoixKH5vag/9dd9yTTanCd/0qoQZQBNFDME6cQYzSsl3G9s1
 dLnYdB63DBrx6eI3zbD/LufMvuFOJCL8CfAZQ8c=
X-Google-Smtp-Source: ABdhPJzPkXWd+YjJHiQnow5l7lj0QifzOMZJgw4xBeJPEZoWco8N8dgoxBaBvr+6FxemS1snSrLDFig/UxwA3WrBvGE=
X-Received: by 2002:ac8:5bc4:: with SMTP id b4mr1822554qtb.240.1612478141862; 
 Thu, 04 Feb 2021 14:35:41 -0800 (PST)
MIME-Version: 1.0
References: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
In-Reply-To: <PS1PR04MB29345AB59076B370A4F99F75D6B39@PS1PR04MB2934.apcprd04.prod.outlook.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 5 Feb 2021 09:35:31 +1100
Message-ID: <CAOSf1CGJ6ZeowMP8Zjo3TazYyaEGuEab4-QRKRJ2jjixUGGtCA@mail.gmail.com>
Subject: Re: [PATCH] arch:powerpc simple_write_to_buffer return check
To: Mayank Suman <mayanksuman@live.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 5, 2021 at 5:17 AM Mayank Suman <mayanksuman@live.com> wrote:
>
> Signed-off-by: Mayank Suman <mayanksuman@live.com>

commit messages aren't optional

> ---
>  arch/powerpc/kernel/eeh.c                    | 8 ++++----
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 813713c9120c..2dbe1558a71f 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1628,8 +1628,8 @@ static ssize_t eeh_force_recover_write(struct file *filp,
>         char buf[20];
>         int ret;
>
> -       ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> -       if (!ret)
> +       ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);

We should probably be zeroing the buffer. Reading to sizeof(buf) - 1
is done in a few places to guarantee that the string is nul
terminated, but without the preceeding memset() that isn't actually
guaranteed.

> +       if (ret <= 0)
>                 return -EFAULT;

EFAULT is supposed to be returned when the user supplies a buffer to
write(2) which is outside their address space. I figured letting the
sscanf() in the next step fail if the user passes writes a zero-length
buffer and returning EINVAL made more sense. That said, the exact
semantics around zero length writes are pretty handwavy so I guess
this isn't wrong, but I don't think it's better either.

>         /*
> @@ -1696,7 +1696,7 @@ static ssize_t eeh_dev_check_write(struct file *filp,
>
>         memset(buf, 0, sizeof(buf));
>         ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> -       if (!ret)
> +       if (ret <= 0)
>                 return -EFAULT;
>
>         ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
> @@ -1836,7 +1836,7 @@ static ssize_t eeh_dev_break_write(struct file *filp,
>
>         memset(buf, 0, sizeof(buf));
>         ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> -       if (!ret)
> +       if (ret <= 0)
>                 return -EFAULT;
>
>         ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 89e22c460ebf..36ed2b8f7375 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -76,8 +76,8 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
>                 return -ENXIO;
>
>         /* Copy over argument buffer */
> -       ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> -       if (!ret)
> +       ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
> +       if (ret <= 0)
>                 return -EFAULT;
>
>         /* Retrieve parameters */
> --
> 2.30.0
>

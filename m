Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD82B42C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 12:28:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZRf16vgCzDqBd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 22:28:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b42;
 helo=mail-yb1-xb42.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pzm7WGZ7; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZRYd4SPyzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 22:24:34 +1100 (AEDT)
Received: by mail-yb1-xb42.google.com with SMTP id c129so15311765yba.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zEN/VK7JhiGO6kCOiDOr14UUtqMiJCHR4xVc50CoCjc=;
 b=pzm7WGZ7CONRAMysKdxb/t4T7JEzvtqAJarsXPqYd+qvFbFyBl7luoZaS8rnTFl1wd
 c8QaLe6FAEmgW4a9XdVq/y0Z7NEVMFmO21PhwQVMWvkHv0dd8fGodE8BBBRxiXXVl/Fr
 1SFpXM/LDNxOThsP+pXX4tl2plO10/XMgqHncM9pQIZNCChNgdUJSQ89rqjgjFKMEsbY
 C/6rm7GjHmAoUz6JvfnIcpQZFWOJ7oXV1WU6JfT23JtKFUCmqeC3X4RGPDn5l9lM8EaI
 tGHLNZfqd004zb18SwrAQj7EY+RpZSBV3qZmiUnIg5S5xeXkrEm5sa9mOC3T5BX03WqV
 y4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zEN/VK7JhiGO6kCOiDOr14UUtqMiJCHR4xVc50CoCjc=;
 b=CKtjHeEQAQhuxY833Ll3RXabMKXALtRpOuq7A8BqcotAsr+radqEI2q0P69w8P1I/l
 YvFpTBK7T5wGWA9snauYMomM9G8Vf4bFYF3qQU+8r8Hvm93/86uP8BOAKVqOB2P7ZY6F
 watqUhddDRcN8uG+Jo3wgcxOeGkBdt3WClgYXZwZog/UCNG3nqU2JvRYdxvfQYE3G3Oa
 y3xZnQHkGKZ0cAahpLU0pKo+v5INR1hzjolNOcnmQIo7yF9bYOB7I4cDkRby7c6VQl3b
 lJwX13+r0iJAGiBMf0zHA3wfTZC7CAt+t0RquKp/2Y844f6hXJvcDPjf7PmVvhns+b3v
 pacg==
X-Gm-Message-State: AOAM530s2Zcv8/h1WKc9zL+M1JPaVbEAKX2c70uiW+lvtySWGQVg6h8z
 gsSjNuOOvrqZVKHJdNy3bjA+Rsy2KW5GIy39nhQ=
X-Google-Smtp-Source: ABdhPJyG5rS7dwR6Szg4FjXpfD8dGGDR/xAIJBV1mQ7dVxE8PirFoUJwqzlp/G0Rr4oMYQbmwEWu3YfjFkS3mEJ2N7A=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr11642564ybu.247.1605525871909; 
 Mon, 16 Nov 2020 03:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-2-ndesaulniers@google.com>
In-Reply-To: <20201116043532.4032932-2-ndesaulniers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2020 12:24:21 +0100
Message-ID: <CANiq72=XRGMAYRc6yXuLYtqAcwbLx_RpqLzPdM1BhOYjX0EQiA@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc: boot: include compiler_attributes.h
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 5:35 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> It was also noted in 6a9dc5fd6170 that we could -D__KERNEL__ and
> -include compiler_types.h like the main kernel does, though testing that
> produces a whole sea of warnings to cleanup. This approach is minimally
> invasive.

I would add a comment noting this as a reminder -- it also helps to
entice a cleanup.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

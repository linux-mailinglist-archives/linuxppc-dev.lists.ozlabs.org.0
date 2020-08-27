Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A8254C9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 20:08:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcrMD3068zDqjV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 04:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=V+YFpBqc; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcrK93RwxzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 04:06:53 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id j15so3417055lfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7U2YQUo5PvChApZK/cKK/V+bD5P2TFvYUwUUfL3IKr8=;
 b=V+YFpBqcArUu/7w7NBd4zYiujYYZd0XbXg3pMzUSnwQHkdzIY7nP3mP+VimDcTthyi
 LlD3xPgdurxv9ctSZwPOT/zU/BV4vftgYTphIZCwjwJtNjyaIwWnhXCoLDg9QLVljgtJ
 MDCUHybVVKKZURhQ+X8r3p5PJ1lUGBFZYBCuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7U2YQUo5PvChApZK/cKK/V+bD5P2TFvYUwUUfL3IKr8=;
 b=T5BhEc60nm7y9f5j/RpNvooMGLMQWeJ5zuhqjfbHKFVnQoVrnWOMlOuY0Y0Yz2Ww3F
 GXJeiWpLvNDIZXoOHcx+jRzB5kYvGNkeedjcVsJkCdkmf2aa2BbrEjzp/yUm9vF+338s
 NzbkPPfg+CuKH0dn6eamdL/Fbk+a3tB08O1QXWbLXrtPDNFNYQimPZSIFvnODfZ0oTmS
 suzwtzfJnunmG2rBWMoa5JGbtlMvICBRARBpLSDqQrZKx900/7St6zV3krdVP7YBenWy
 pg1tuOQ5TRpYF1dbBlkuSRe1cNdLcRok7JGZ7Z+BR5z944gUbna/3VeQqJncWiyDjtGX
 g1qQ==
X-Gm-Message-State: AOAM5325JmAlYti9ckDj4TbSQfTaBvgQhsF6QIIkRmxYlZomL7AhhhJg
 T87kS3YKBO5AFFo0V6u9pM2pVd6qcJmYWw==
X-Google-Smtp-Source: ABdhPJw3RcLzrjDItLS76jnrfCPp238/Xg9LgDiLRopP2sSBvr0Lbb+JaZ4OFQMsP/8emWpM2ywsVQ==
X-Received: by 2002:a19:df44:: with SMTP id q4mr10502525lfj.167.1598551606299; 
 Thu, 27 Aug 2020 11:06:46 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id w11sm680025lff.62.2020.08.27.11.06.45
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 11:06:45 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id u25so3405038lfm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 11:06:45 -0700 (PDT)
X-Received: by 2002:a05:6512:50c:: with SMTP id
 o12mr3180051lfb.192.1598551604725; 
 Thu, 27 Aug 2020 11:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-6-hch@lst.de>
In-Reply-To: <20200827150030.282762-6-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Aug 2020 11:06:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipbWD66sU7etETXwDW5NRsU2vnbDpXXQ5i94hiTcawyw@mail.gmail.com>
Message-ID: <CAHk-=wipbWD66sU7etETXwDW5NRsU2vnbDpXXQ5i94hiTcawyw@mail.gmail.com>
Subject: Re: [PATCH 05/10] lkdtm: disable set_fs-based tests for !CONFIG_SET_FS
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 8:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Once we can't manipulate the address limit, we also can't test what
> happens when the manipulation is abused.

Just remove these tests entirely.

Once set_fs() doesn't exist on x86, the tests no longer make any sense
what-so-ever, because test coverage will be basically zero.

So don't make the code uglier just to maintain a fiction that
something is tested when it isn't really.

                 Linus

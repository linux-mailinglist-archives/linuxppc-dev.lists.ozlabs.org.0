Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FFB25C707
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 18:37:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj60d6gcWzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 02:37:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=hYB6yqqQ; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4yM49P5zDr3S
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 01:50:18 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id x77so2199966lfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 08:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6uN+gKvfGO60O5JMjCBhAHk4zCyy59uX9CdJNtZFrNw=;
 b=hYB6yqqQVYLw5W4wbNtwYxGosDDACrqFPkFRzSxq5GUdwnRcqWSZf+3pDJZG3l4qpj
 XIsM8mhEThCQIKY5Q71Pb3tabJeQfFtxozky3wgH9Fge0iOyyl06stPcVEls4DGKyFgJ
 F0YpC38xMkAjv0zbD8B0d2Ya5VsmSKKtjzeEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6uN+gKvfGO60O5JMjCBhAHk4zCyy59uX9CdJNtZFrNw=;
 b=HdLVb18yzA9GaH7ZdX1Rc1ujQQGa1BvGPuJ8Fij92gRF3RTqN/v7gdtmjGjTdl4/0W
 nackqCPl/hZqQ3lje6MECbOTgcacW+uZnc31u/V5rVDKY+O0TFvMzi7Jhc6DLzxnUaki
 A1z8fvaOiANjsb83i9IhCqhdx+YiQ0dr3L7zFVaAvfwS+INaPdgg9lkjbHwmr3kodx0L
 HE9nLz1+PF6tRNz6jRAl5lIXsGBqNCGjoevmiagSQob26M+qXAV9jaK859a1l16HrnFX
 GTQvq/Rv92F1Tyu+XXYmHdn/EfcSmKS1WEev6aap+z1BPqLw+bQ2Ll14Ob95h9eTkXca
 oKYw==
X-Gm-Message-State: AOAM530NAVXhVaLeFE2ERwX8/kO4DpliNr+0fuJZBNABmM/TYo/0FwLH
 rBUP0Cm6CC+Y7ewwZO71JZnJ3cYyQM+BCg==
X-Google-Smtp-Source: ABdhPJy7itMivwEJF3ESopuSzh5+3MFJm7XE1GuqxgmodBgaxWfIVPWxBmJ7fjg25ObLcFHNMXbTuA==
X-Received: by 2002:ac2:4427:: with SMTP id w7mr1586183lfl.177.1599148212099; 
 Thu, 03 Sep 2020 08:50:12 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id c5sm664852lfb.24.2020.09.03.08.50.07
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 08:50:07 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id w11so2193547lfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 08:50:07 -0700 (PDT)
X-Received: by 2002:a05:6512:403:: with SMTP id
 u3mr1627887lfk.10.1599148206752; 
 Thu, 03 Sep 2020 08:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200903142242.925828-1-hch@lst.de>
In-Reply-To: <20200903142242.925828-1-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Sep 2020 08:49:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=jtTcwSox8RY-skN83c40WXZOfwid-91FDgRdk0xwrw@mail.gmail.com>
Message-ID: <CAHk-=wh=jtTcwSox8RY-skN83c40WXZOfwid-91FDgRdk0xwrw@mail.gmail.com>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
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
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 3, 2020 at 7:22 AM Christoph Hellwig <hch@lst.de> wrote:
>
> [Note to Linus: I'd like to get this into linux-next rather earlier
> than later.  Do you think it is ok to add this tree to linux-next?]

This whole series looks really good to me now, with each patch looking
like a clear cleanup on its own.

So ack on the whole series, and yes, please get this into linux-next
and ready for 5.10. Whether through Al or something else.

Thanks,

               Linus

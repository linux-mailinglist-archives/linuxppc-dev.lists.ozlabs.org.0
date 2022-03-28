Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91E4E97C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 15:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRtWs5g8Zz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 00:16:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zDVfDycj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e;
 helo=mail-yw1-x112e.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zDVfDycj; dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRtWD3D40z2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 00:16:23 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2e6650cde1bso147675747b3.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 06:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G5uuyZBXJwp7PyyisU+EIbTNtbVnmDYNzWqCp6rEsws=;
 b=zDVfDycjVsjtc8Wz/2yNBWq9/BgmdioNxQmtuqk12esMombnp3NIeZKjatpgrkguio
 9cwxgAbZvqI+rA/O0+PBotzJSY95vCE4+mTmJfv9RuebTcvU5bxKtk+jrQHABDaQpF7k
 IdHa4kcTNvMfyfR6vp5qMR2JNAALo/pryZ9SEenDdbTBWuCMGHpNpbvDUGnoPd5TTx4u
 RuDgiaWl6XpQTQiGFb+rjRUxr6QtXWsPbiIoo6YMjD3zPkaoeRD1KL+mX2wqzVI02ClX
 y3DSzpOW+tS+zb1kSSUOCvV5hTUR1p/rPmRfcdyrE2DhDsZDmyeepD+/Q18fYsg1XWBF
 eaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5uuyZBXJwp7PyyisU+EIbTNtbVnmDYNzWqCp6rEsws=;
 b=pmihdEIqdXr9JeuzXCpivc2y+QxajjlDUjW0bfI8x0XEjA3UOoB37k/DQFnbtsEqNl
 GllCLH11KVdihzlsZFTYsE4Ccn2rjVTMzfgKw8IX962hCUK6rfo+fL3AtPFMhGowvMDb
 yrQbTUexYVvk5dOAq16T59k/64EzxVFo520rq/upEEItgX8Svn5wdr2qsEq/0SpsYwdt
 sYZY1DfSUOn3hdi4vJeM6lkl2+OFPdErxiuu1WnN0XpJV4OURW3EMr2lwoOO3L/bGECL
 Ip+jZdkRU+kOryc6ZkTk5aKHNyAc/BtkklY3heV3CP6HQgXvlQQGV8t4IVyozSVqawSd
 w9TQ==
X-Gm-Message-State: AOAM530TlRhC/vqBtOZCWPIn3ptFrIBfiGNPNeK7mYTRNs+hSOP/vZbP
 BJTMkd7lHGWtGOXjhjLbU52iHwJf7CmSn0rrSf96AQ==
X-Google-Smtp-Source: ABdhPJxvrqtRZdCJx8IMb57QwLhs/eGoSivn6ijKcrdp4HASIgvKYZqWzG0jXBPQP0WpR0KIcwolNqKj4N73PTfigmM=
X-Received: by 2002:a81:b50d:0:b0:2e5:b653:7e97 with SMTP id
 t13-20020a81b50d000000b002e5b6537e97mr25986896ywh.140.1648473379829; Mon, 28
 Mar 2022 06:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Mar 2022 15:16:08 +0200
Message-ID: <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 23, 2022 at 6:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Let GPIO library to assign of_node from the parent device.
> This allows to move GPIO library and drivers to use fwnode
> APIs instead of being stuck with OF-only interfaces.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That's a nice patch.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

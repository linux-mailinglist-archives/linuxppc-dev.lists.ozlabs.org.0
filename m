Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E151DF10D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 23:25:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TKKX1rKyzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 07:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TKHc20fKzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 07:24:12 +1000 (AEST)
Received: by mail-io1-f67.google.com with SMTP id j8so12873440iog.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YCi9Dp13bDOmLIrC4hBxAOPuLUqxhaS10/WtAvU6TE=;
 b=P6w51dOfjvIyJskJL3ay5+/lWqshDDOMGarrqHLx1RdjIzOkjRwxxelGJfn121O7AM
 5G9G0lk75xCM+VXqzqL9XKoejMUK9pGraANb5IvUx6ufeLQbhdCqRkSN2/2DxjpX/VMI
 H4zSAAFCBWdMMRGffYECS8jPlCpO7xVlHRFk0XoRo7xiqkP6uHuS1ZSBswFW5NAr3D74
 3zj79SZ8sl7qzyS954MQwkZ79vS3Kipq3vqqpvZbpRBqOYHPiDS8MnBSjYxpdT6TuZ2Q
 0sxu/argBl94lanc51HNLsghYIsHE7wJbG3O2eFRme+jB1nM0LZNRHjonNbsd6/mGdQE
 Ly/Q==
X-Gm-Message-State: AOAM531CFcZFITe3L0yd8+3NqXCdr89Exi+JpeGSQGJOGDTgtkX2qyoe
 pdTTjnq81YRi5Hb8D9pr6W2QumCsyE0=
X-Google-Smtp-Source: ABdhPJz/8edq0ExkPiOOFkdoNN/k46wbMUxoT0WM/A7Ajr9HM8tGeS5I0981wZNVFdptJgc/Jqt1sQ==
X-Received: by 2002:a6b:700a:: with SMTP id l10mr4666410ioc.170.1590182649964; 
 Fri, 22 May 2020 14:24:09 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id s84sm5364189ill.5.2020.05.22.14.24.09
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 14:24:09 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id y17so9926288ilg.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:24:09 -0700 (PDT)
X-Received: by 2002:a92:c401:: with SMTP id e1mr15870971ilp.134.1590182649355; 
 Fri, 22 May 2020 14:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200518221904.GA22274@embeddedor>
In-Reply-To: <20200518221904.GA22274@embeddedor>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 16:23:46 -0500
X-Gmail-Original-Message-ID: <CADRPPNST6qhAHAEKXAnnJhQhoyb=r5O5YVs2KJW5qNgOjanu-Q@mail.gmail.com>
Message-ID: <CADRPPNST6qhAHAEKXAnnJhQhoyb=r5O5YVs2KJW5qNgOjanu-Q@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 18, 2020 at 5:16 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> The current codebase makes use of one-element arrays in the following
> form:
>
> struct something {
>     int length;
>     u8 data[1];
> };
>
> struct something *instance;
>
> instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
> instance->length = size;
> memcpy(instance->data, source, size);
>
> but the preferred mechanism to declare variable-length types such as
> these ones is a flexible array member[1][2], introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on. So, replace
> the one-element array with a flexible-array member.
>
> Also, make use of the new struct_size() helper to properly calculate the
> size of struct qe_firmware.
>
> This issue was found with the help of Coccinelle and, audited and fixed
> _manually_.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/soc/fsl/qe/qe.c | 4 ++--
>  include/soc/fsl/qe/qe.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied for next.  Thanks.

Regards,
Leo

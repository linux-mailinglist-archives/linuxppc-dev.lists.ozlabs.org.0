Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6BD66A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 17:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sNWg6668zDqpG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 02:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="piPpFXEn"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sNTV0ntgzDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 02:56:28 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id t10so8197347plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysKHeAWhWiDqGIO4lKEHL4zmOQ8xwTlvBSOxqXeT+Gg=;
 b=piPpFXEnmFYl2yN5xlBQ8v7jl+7es3ZESwSR23NsPFjmV+VSDOXWWzPfxkmdL5bPpI
 yxUz3Z//K3ZDelbiqMeDuDMpHXxUax1O6OeBwi0E9jYed6D7xqWrfkBbqfVNkW6e/Vbo
 HMUqA9aVLm6NH25Bk1mWbz22RvMIuTRjRoHIKO46oq7dW/bgMyZ5pN22PPv8C43YDdTx
 /QeE5zVtKwe63NL9k2LgAXCcAx+AVWKyKkxNHsO7fyG0l6WH15wEshK2jiwNJDk9x7oC
 o6A6NDynOkZRzaEb7dEfWYEtltI1XFyVLJYpsyNBdeC+PQ7i1OXwrAxiiJdh5BwK3PYs
 XKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysKHeAWhWiDqGIO4lKEHL4zmOQ8xwTlvBSOxqXeT+Gg=;
 b=p2g9coaXrmfQcQULcymc2vopR4IrISBH29iH+GfrTArh6nPEBP9ZY9cgZq/zhnrgH6
 yjE/CVD3h/Un/Bj4KI2yVyNBGeQQwX8Mhd3eFrY0sYYlBZIh9DQNy3kzxW1kvneWoy6f
 AJuEQnGSeXmlpsQlMBWSSXydON545AceAixvTh187xa4TM7YfXS0/cJ3cc9KzF8RMPDu
 u668a6iXnpiGzPVS1P4xNDYGxE2A6u7tnH1NNvxl+4syrFCUo7y1mF4ClO+eZnVM5n6w
 cE6oQJNMyL8ZgDN0tkY4UJ64ucKRsw50gwSJyTFzpPL2mSU7FpZDtMXfbsqy4wNQUzZG
 e4PA==
X-Gm-Message-State: APjAAAX1qePmABtG2m7VxaF8WLsIjYjnvE9PfBKk0JJbyomG5RSoSg5Y
 xm7uNPLEsLT9P5rn5tFzXt4kkvIQ/q1oL2jAhtlQRA==
X-Google-Smtp-Source: APXvYqz/xhBeS3yRQP8QI+260d6U9shHcuPTuMGyKyNKNIVgIxg2p2GheW0ZfaMUeplnFXv2gl+6LVj7eNvm2RFQGS0=
X-Received: by 2002:a17:902:9b83:: with SMTP id
 y3mr30287723plp.179.1571068583499; 
 Mon, 14 Oct 2019 08:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
 <20191014025101.18567-4-natechancellor@gmail.com>
 <20191014093501.GE28442@gate.crashing.org>
In-Reply-To: <20191014093501.GE28442@gate.crashing.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Oct 2019 08:56:12 -0700
Message-ID: <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 2:35 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sun, Oct 13, 2019 at 07:51:01PM -0700, Nathan Chancellor wrote:
> > r374662 gives LLVM the ability to convert certain loops into a reference
> > to bcmp as an optimization; this breaks prom_init_check.sh:
>
> When/why does LLVM think this is okay?  This function has been removed
> from POSIX over a decade ago (and before that it always was marked as
> legacy).

Segher, do you have links for any of the above? If so, that would be
helpful to me. I'm arguing against certain transforms that assume that
one library function is faster than another, when such claims are
based on measurements from one stdlib implementation. (There's others
in the pipeline I'm not too thrilled about, too).

The rationale for why it was added was that memcmp takes a measurable
amount of time in Google's fleet, and most calls to memcmp don't care
about the position of the mismatch; bcmp is lower overhead (or at
least for our libc implementation, not sure about others).
-- 
Thanks,
~Nick Desaulniers

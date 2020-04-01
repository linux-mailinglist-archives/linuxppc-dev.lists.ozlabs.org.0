Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478419AD81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 16:13:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sp7t6K3PzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 01:13:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MxAcpSTX; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sn653WZ1zDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 00:26:36 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id u10so6229wro.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gas058aqK6+R/Ga1N9ekMQIN3LpYhng+FzKXcG+s1xo=;
 b=MxAcpSTXhRRPml3perHEIkhBVICR+NnBhA+nk6CnYL8HJ7PiuaVnTX3sEclcUac7G3
 BZNRonT8GMtc3uMkYJLgvB+Cxb4WUWYDs94cYf8WRyk5z8nmTkisW1BV7k/sWkdtW460
 xHK6gw1yJEL2xcncljcOihooVW6Gjim9kyLhsI8GfPIjmzlgE1lugZhKyuLYGuytnVtf
 y+1HSJdPGfNwjrvczHpo8xRmx1L2uQbkClP3EVzOmeYW+3teWTB8dDBgxynbYAmsEur+
 ZX63MwB+y1masuUq4gV+irp5A7vFUnqGWSF0kewhXVIWAh38zVzUL26ryyWUG2l9xslZ
 Gfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gas058aqK6+R/Ga1N9ekMQIN3LpYhng+FzKXcG+s1xo=;
 b=HIRA7wNJMat3kh/tnTafoRQb0Ivtglarhqbwj/9ynFDvl7JsSThcKfhIJjHY9EWqhA
 O675X6p5UZbSn5X2UaOV4+oxyTeTMBtkcF+pJakYK0ivhXyp6m62jnYyzTGsBwPiawIT
 p8Kgtgv8MmJXr8igURbQuUF11bJvpJ24ENrMOwpGX12vAgTBfwMhlqMk/uKHkba7grCc
 nQOoB4aq/2O2Nr6lJfodjKpadhZSJ8UCKpwf+Hvt4pxTNK1rXy4xSiHLn2e1urBRsw2f
 KlDeriq6HOmVdrhixGPzbLqKdtokPXlWKdy6w7nEINBWepHHa+V7QjtYU6zZW8oGHu7S
 vSIA==
X-Gm-Message-State: ANhLgQ24jUd7zeP05pTHkVNdyUJpnZTpb5l76VatzXULuFlTAjBx2NFw
 IuW5q8P/W1glOGFkAnshzlaZPq2y1GXbQMdVzugtww==
X-Google-Smtp-Source: APiQypKvOPXALPD3SSV84Pz/SnUWcazAupS1BDPa+13hD4YVMP9IRrZj6C/ODuwzqTq+oio/Qu+jPtU/Sdqh60+hl54=
X-Received: by 2002:ac2:4a72:: with SMTP id q18mr15020714lfp.10.1585747116686; 
 Wed, 01 Apr 2020 06:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190812215052.71840-10-ndesaulniers@google.com>
 <48smMS2jDxz9sT6@ozlabs.org>
In-Reply-To: <48smMS2jDxz9sT6@ozlabs.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2020 15:18:25 +0200
Message-ID: <CANiq72kT9iYueBp58PXKgLCvBU+2PsgJ9VJ1xOVTw-srdwHtgA@mail.gmail.com>
Subject: Re: [PATCH 10/16] powerpc: prefer __section and __printf from
 compiler_attributes.h
To: Michael Ellerman <patch-notifications@ellerman.id.au>
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
Cc: Rob Herring <robh@kernel.org>, Song Liu <songliubraving@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Alexei Starovoitov <ast@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Network Development <netdev@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, Yonghong Song <yhs@fb.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, Apr 1, 2020 at 2:53 PM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Mon, 2019-08-12 at 21:50:43 UTC, Nick Desaulniers wrote:
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Applied to powerpc next, thanks.

Missed this one from August, thanks Nick for this cleanup!

Michael, you already picked it up, but you may have my:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel

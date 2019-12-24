Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BAF129C84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:00:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hfYt1X4dzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="oFYra1Gn"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hfX21h53zDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 12:58:41 +1100 (AEDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 777E62073A
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 01:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577152718;
 bh=wrDzBWpOKSiwcb+qBm67fhEmniMtsPe08K1CDqJG+aQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oFYra1GnrPYPW0VIb0ihhkc/X1ko+xfQht7/2IKlWIyfO6uNchY0GOmxSOCGWBnY+
 oQU08j1ThgwFiIxFVbPwHNZ4a4Bg8WDDE6yE6w4LCePbFzjER6HYQqZgnlhUqcpAns
 WZQxExfAhEzKuKRq9E0Du+n4NTas+PLc/RJdGJLU=
Received: by mail-wm1-f49.google.com with SMTP id a5so1273502wmb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 17:58:38 -0800 (PST)
X-Gm-Message-State: APjAAAW6je0P0ln2068TFX2nZZrIrmbNdvxvtZ3NAUSGVu20bobqESpv
 Brf1dqTGaAyNMxJqbDte+A+ew7H06YUm514P/jKW7A==
X-Google-Smtp-Source: APXvYqxwNlYNszeowAFN0oKu0h4yW9ADusJeScbE5XRItW37UFXluNES85cpW6MmdJIXJdPRzP47hHREp3dIH3wiI6I=
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr1469926wmi.89.1577152716961;
 Mon, 23 Dec 2019 17:58:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 17:58:24 -0800
X-Gmail-Original-Message-ID: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Message-ID: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> READ_ONCE() forces the read of the 64 bit value of
> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
> only the lower part is needed.

Seems reasonable and very unlikely to be harmful.  That being said,
this function really ought to be considered deprecated -- 32-bit
time_t is insufficient.

Do you get even better code if you move the read into the if statement?

Reviewed-by: Andy Lutomirski <luto@kernel.org>

--Andy

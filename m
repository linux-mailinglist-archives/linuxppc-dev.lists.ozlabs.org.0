Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49261129C89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:02:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hfcB5yFWzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="gQGYXs7X"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hfYN5bjczDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 12:59:52 +1100 (AEDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EFC320882
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 01:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577152790;
 bh=mZIM8/IGO6yj32EzkYlDoUvjeWHo1IO0ajLflWLHJ1E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gQGYXs7XTcbdCfx0BUILVDNAMT4zxirLNFz98MThf9EREN5BxfkbsJw1pENHZhpvR
 MLaDU2z5hlCSoTZKzvSyt5ddAtld9M3HziJaduUZk8pJMfEqoz5qyPbPWjvDQ7yqcS
 gb1Iu7wGTPj/8sHQNHy4Kn8t7wlqyf4zPSt/wAiA=
Received: by mail-wr1-f44.google.com with SMTP id q6so18549764wro.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 17:59:50 -0800 (PST)
X-Gm-Message-State: APjAAAUe9vHduTnOw2AjQwVhroHSzmZpfSWgtOO/4JklCHs2CTqLIjZ+
 QFj98t02i9tHBaqS6e3CrCFhKtQX66NSV3/29/EzCg==
X-Google-Smtp-Source: APXvYqxAMnRl94bz0dtBWu5DeU1T1h7ThWeUzu+q0KQ6Q4rmgmqNaGXBhJRposss35afzcm4hhvUi2inaUTSmKyfilU=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr31723699wrp.111.1577152789083; 
 Mon, 23 Dec 2019 17:59:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fdf1a968a8f7edd61456f1689ac44082ebb19c15.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <fdf1a968a8f7edd61456f1689ac44082ebb19c15.1577111367.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 17:59:36 -0800
X-Gmail-Original-Message-ID: <CALCETrUZ8rhvhJSYutypUoSf2tGBZPais79fx+8BHWH=Vk4dBw@mail.gmail.com>
Message-ID: <CALCETrUZ8rhvhJSYutypUoSf2tGBZPais79fx+8BHWH=Vk4dBw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/10] lib: vdso: Avoid duplication in
 __cvdso_clock_getres()
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
> VDSO_HRES and VDSO_RAW clocks are handled the same way.
>
> Don't duplicate code.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Andy Lutomirski <luto@kernel.org>

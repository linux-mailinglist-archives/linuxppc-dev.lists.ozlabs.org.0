Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA982129CBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:29:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hgCV1nnFzDqNW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:29:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="e5/A2TMz"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hg9n1WyCzDqH1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 13:27:56 +1100 (AEDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 948C521927
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577154474;
 bh=urdNwQ/OTeq2Z4hdgMEm4P258E+sy9JNDdnsxX/A+m0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e5/A2TMzWmvgBVcYJhSASriiw23lUwDkTKRRrtVzBPcnxYy86U7OFXx0HfahVlJoE
 gR4r6zzD7UbCJZ6hzzKPUkP9RiRaHMYXHegUwL+YEO5JXAbwTkd+koSfO5sdzwK5Kg
 cSsvwQzIEipkLbhYGIOw86xV4zgHkcuJxD1NzlXU=
Received: by mail-wr1-f42.google.com with SMTP id d16so18602043wre.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 18:27:54 -0800 (PST)
X-Gm-Message-State: APjAAAUzvDCpnNNf2CVNx9Hm+Q25NxFAvw4C1J4EuutfZUdA2Qt9FNum
 eIKG6Y4my4KxOkh3l96k9oqZpqrNA4yDxRvKMNeQLQ==
X-Google-Smtp-Source: APXvYqzX7Wx0WQQGQxSsSx/rylu702E8XhFQtmBzrPd/vN45dmJAZ0EePwEz406rgBkEgebEu04CDi9IHkjEhDWde+I=
X-Received: by 2002:adf:f20b:: with SMTP id p11mr31631213wro.195.1577154472974; 
 Mon, 23 Dec 2019 18:27:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <02861d0a05c2d48db4e9ee9093e2e2598093c372.1577111366.git.christophe.leroy@c-s.fr>
In-Reply-To: <02861d0a05c2d48db4e9ee9093e2e2598093c372.1577111366.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 18:27:40 -0800
X-Gmail-Original-Message-ID: <CALCETrW9hsrVVzudvRY22AqakcsrVzqp=SdwOTwW2zRBK+kEaA@mail.gmail.com>
Message-ID: <CALCETrW9hsrVVzudvRY22AqakcsrVzqp=SdwOTwW2zRBK+kEaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/10] lib: vdso: get pointer to vdso data from the
 arch
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
> On powerpc, __arch_get_vdso_data() clobbers the link register,
> requiring the caller to set a stack frame in order to save it.
>
> As the parent function already has to set a stack frame and save
> the link register to call the C vdso function, retriving the
> vdso data pointer there is lighter.

I'm confused.  Can't you inline __arch_get_vdso_data()?  Or is the
issue that you can't retrieve the program counter on power without
clobbering the link register?

I would imagine that this patch generates worse code on any
architecture with PC-relative addressing modes (which includes at
least x86_64, and I would guess includes most modern architectures).

--Andy

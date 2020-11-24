Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D92C2119
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 10:25:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgJXR0rJwzDqNn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i4p6UDUs; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgJVT0cDPzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 20:23:42 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id j15so17736768oih.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TX0s0mIR0wt/HcYW5SNqzmfoKqx6TwmdMniIzsTXvlM=;
 b=i4p6UDUsRImUT3ewIRw7Z/DjFfF7FfVS5iLPZTjK78SzqdWSYMl4rsf3hEglOjh7Hz
 LWU9XegimSQVcxPK1IRcdDM68+VgKn3nuJbf1vRoS3winwElp/CqCjr4Bhn9QKCv0t5z
 2gX+mUfERAuzIUaGA4HbvivhfSZGg3/a7PZPcqkL4QudhDVLFhwkeftkPJXvPQGZ9mK1
 rzGekuLYI/tj2VIZWFqrOsF2/Ipc7AwLoJPedOB/pxKkuI9PfW3knSthvb/Ne6sEbMRn
 c1YKIueYsacinbH716qHdAoLHMuAzZJl+t9btA4ckBft/agLCJlZ2p1OPtSkammjWtGp
 StrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TX0s0mIR0wt/HcYW5SNqzmfoKqx6TwmdMniIzsTXvlM=;
 b=r5JS1U4xprhgYQpBSN53CIVMIsxjCvPPy4Hc4v5GDJGndVeXVJR/QtNJ54euHzy1P+
 mFRuSqfyQeCgJub3jbZIf3fgQz9ywtJtHlQNJHqe+hE4UJ9p0vwtb1GZ6dI+25W2xySi
 UqnoG9+nduU40iOwIrpJgVmoElxlc6eWMB2Kygn0wAMBZ5bKPXXyn2pGT765+Ukcf+DB
 wTkFAowu1tyc7+TzX1uK2oXYvcNmWOB9r3SUNNiLY+LgggdOhaFThuLjSUWY33hxfbh4
 KFoi3Pegddt1XG6dZosWpk+PPHTg+jN9en6JLm7yVm5t0Nfjsbp3nSkRz2oG4hl5EHcy
 hqPg==
X-Gm-Message-State: AOAM532T6n3K4kE1DRqkk1eWJaKVg4jtoTLYA9WjcfBhJ1GKl0eWuvhg
 Z6hxpbtOhTFHJTepZczB4EfKSFHYa9Eq7+7cLlGLfkD3Et4=
X-Google-Smtp-Source: ABdhPJyOhS0omFAjIgJdkshqp0eVPfkhnPJIGLR2zFPBNOyY8wO2ECdElnB5crvqZ5axanNabYwDxjgyaZeqZvkhj4c=
X-Received: by 2002:a17:90a:4816:: with SMTP id
 a22mr3941316pjh.228.1606209496608; 
 Tue, 24 Nov 2020 01:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-3-aik@ozlabs.ru>
In-Reply-To: <20201124061720.86766-3-aik@ozlabs.ru>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Nov 2020 11:19:05 +0200
Message-ID: <CAHp75VfV4mG23C9Ep1vNLk2oBjB=LTQGyU=fhWPhw4PX-Ci-7A@mail.gmail.com>
Subject: Re: [PATCH kernel v4 2/8] genirq/irqdomain: Clean legacy IRQ
 allocation
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: Marc Zyngier <maz@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 8:20 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> There are 10 users of __irq_domain_alloc_irqs() and only one - IOAPIC -
> passes realloc==true. There is no obvious reason for handling this
> specific case in the generic code.
>
> This splits out __irq_domain_alloc_irqs_data() to make it clear what
> IOAPIC does and makes __irq_domain_alloc_irqs() cleaner.
>
> This should cause no behavioral change.

> +       ret = __irq_domain_alloc_irqs_data(domain, virq, nr_irqs, node, arg, affinity);
> +       if (ret <= 0)
>                 goto out_free_desc;

Was or wasn't 0 considered as error code previously?

>         return virq;

>  out_free_desc:
>         irq_free_descs(virq, nr_irqs);
>         return ret;

-- 
With Best Regards,
Andy Shevchenko

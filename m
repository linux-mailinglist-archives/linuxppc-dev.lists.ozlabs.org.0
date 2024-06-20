Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37F911AE1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 08:04:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=e+7RhTmF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W56JX4tw9z3g6X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:04:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=e+7RhTmF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4skZ6fPHz3cW1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 06:37:56 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso190086966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 13:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718915870; x=1719520670; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=e+7RhTmFBPaZuSGxr+MlJLtqKa1GuN47zdBw6H0tBkUH7Z3advnc9MGh9R3iUFE/OO
         ORr4JN7wv9DcSgP9BMtIn+cJB5HnbewY2bEqjI78h2b0U9tGXX3YLKVcCyJlbs9p82Tv
         9ud06CqryimIZF0UidbS8yXjCcVgnAdj9AhOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915870; x=1719520670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=IHf1aETe+bCSdiFtUioZzfuxqZw0ow5UR8g6tcFGIi1mDxAOO0caAoAcSfm4N6HeCP
         Ou+Tg5IJipSorna3VLPvKwfcdSr9eU+uC2I5OOzka8SHDSrSksnA8+pHFxkBkxiwGBeP
         aZ+ktFl47oaRsOAIrG0ufalNJoB0u8ZSV8VxqTPrdEnB8GVWMyGZ0tW5TwO6a5qfGT0h
         Up5QLVONDUGYtrwMCRywBBL2yUm9ZpPcc8fbHry5LvEIoxwgTXvDHSAq7tLWq790lym8
         RKRTnCXsNA//Ik/nmwoOyhdBRpxCBgsjn9J53hYGNDnodDBuNApjUKVUi45q73UMyQ1T
         FPjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtROg6E3dgBLDAks/8AmTS8lXEHurnVinmmv6KsmS7EnMoYdGCQTu8bJmm/cxLXuPJnNET6xjICwtj3tk9t29QMRqL88fZ7H+jSyVMEg==
X-Gm-Message-State: AOJu0Yy1VmNZyJtGvRjMXLuAH6tXz4QFhqkyMAMYdK3ad+ZuJU4JXq9N
	73XZK4Dr4mQoj47XeilItU9ZG+isTlCHYPJOz+Wco6FyeGrotGwwXu3XULgy47N8x3f84l9IHjN
	kzuPskYxV
X-Google-Smtp-Source: AGHT+IHfvsUXMzbyrXAc4nlSnMIzsrVB/BrVquhGzttKeWawfNCfZhK2ouw903ay8M6wHas95HbxvQ==
X-Received: by 2002:a17:907:cbc3:b0:a6e:a97c:fc93 with SMTP id a640c23a62f3a-a6fab602da1mr424197566b.16.1718915870041;
        Thu, 20 Jun 2024 13:37:50 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf433f7dsm8264666b.39.2024.06.20.13.37.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 13:37:49 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-424720e73e0so13302605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 13:37:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsFdSRx5GB6RjJuX2UU+VnTDIMO6wqnfAA2PoujMIM6N+kvXLN0ZYIwhhxaq0MtAYDaXqOAfvdJBRPiXhzdWWo/ploBcv6m5B069NUeQ==
X-Received: by 2002:a17:906:1348:b0:a6e:2a67:7899 with SMTP id
 a640c23a62f3a-a6fab63aaabmr312193466b.35.1718915542284; Thu, 20 Jun 2024
 13:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com> <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad> <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
 <ZnSPBFW5wL0D0b86@yury-ThinkPad>
In-Reply-To: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 13:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Jun 2024 15:58:23 +1000
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
Cc: linux-sh@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Bart Van Assche <bvanassche@acm.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jiri Pirko <jiri@resnulli.us>, Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Thomas Gleixner <tglx@linutronix.de>, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric Dumazet <edumazet@google.com>, Gregory Greenman <gregory.greenman@intel.com>, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, Leon Romanovsky <leon@kernel.org>, Will Deacon <will@kernel.org>, mpi3mr-linuxdrv.pdl@broadcom.com, Hugh Dickins <hughd@google.com>, iommu@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, linux-media@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, linux-arm-msm@vger.kernel.org, Wenjia Zhang <wenjia@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, Oliver Neukum <oneukum@suse.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, linux-pci@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hyperv@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, linux-rdma@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, ath10k@lists.infradead.org, David Disseldorp <ddiss@suse.de>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Edward Cree <ecree.xilinx@gmail.com>, Shuai Xue <xueshuai@linux.alibaba.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, Ping-Ke Shih <pkshih@realtek.com>, linux-scsi@vger.kernel.org, linux-net-drivers@amd.com, x86@kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-block@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-sound@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org, dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org, Karsten Graul <kgraul@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jun 2024 at 13:20, Yury Norov <yury.norov@gmail.com> wrote:
>
> FORCE_NR_CPUS helped to generate a better code for me back then. I'll
> check again against the current kernel.

Of _course_ it generates better code.

But when "better code" is a source of bugs, and isn't actually useful
in general, it's not better, is it.

> The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
> sense because in UP case nr_cpu_ids is already a compile-time macro:

Yury, I'm very aware. That was obviously intentional. the whole point
of the commit is to just disable the the whole thing as useless and
problematic.

I could have just ripped it out entirely. I ended up doing a one-liner instead.

                Linus

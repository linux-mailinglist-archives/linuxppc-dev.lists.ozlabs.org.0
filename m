Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989CF80669F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 06:37:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYtmTDp3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlR4l0PW0z3cl3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 16:37:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VYtmTDp3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlQpT6YQ0z3cS5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 16:25:20 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ce6dd83945so1359307b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Dec 2023 21:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701840315; x=1702445115; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=VYtmTDp3KC9b0muDlbIvGGuQLOeREuuK1sQu9iedfPGQYpG4O759FsCdHUHoYMVpHe
         SyR70MwP/hx3kGBmzfyOrpS8KxBIp3iPX1eV1JmazuZ/XkwFo7w+mgMXOw3Xg6RPSI2b
         4dPqxLSbG4cZq1bg4WZMd9T4DXWH57ByNcEY3FyUM5cuheLfST5WclOtmtlT/yBvBWC0
         dVtIENVn3pzZmxE2R8luiSMQb8g9gBkK6P+51jb5uXq6f+0SOEeevyTUGfhjX9sLeelb
         EdCrlnpgz2jW6xZiPnpVSDr6G9IJJOwtUSRMQ18/ts3s9EL7ylxZUOxTTg/4EWFd2pL9
         V/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701840315; x=1702445115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6huBbZbAII0X6eZV6S+b7knvK6KuHJo8Bh0bkLgUxxE=;
        b=tUnwm2A6vmFQl8r9NtzepONpYMn+f4yMafJwSt9k05KDxWrWPwOkZUQnPicszTg+di
         kYsNweaWROyb5BKFpdKu2tJZ6RHWGRsDULopwf88v8qYPC1gNH+hDrNydSOaC5vi2mar
         d7FAW3Y3E7XtwDYx8oaexz1aBFz7qxc0V7CczR8Xnbtl4+X9lH0Rwzyeaf2tIoPovlBL
         RNcYGEBlIFEh/zyPOGbCyh+Abo7k4dXCiLOu5ZUq0Q5AeGmMPXvZRUiBbXK7O5IGEEuW
         RQCmDstM7qH/FKP0IvmR2Ip2kmCV3PxCg/62Hsub6gj6grQMJ/hyVbzJS9sxBF+acWej
         G/2A==
X-Gm-Message-State: AOJu0YzIB4/FNwDGoz4VQONn/aJwCx2FuJRlnPlMCaalbbMpJeX7bHH8
	ag4D02YnNngLrH1TA9VgT/g=
X-Google-Smtp-Source: AGHT+IFMxfqg8FxPkhbWeYw87iiXO3hRoVhFhH1xtCbWG3FZaVDEj9UfTpo1oYq4IqfLZ3ft2t7YHQ==
X-Received: by 2002:a05:6a00:98e:b0:6ce:6420:e174 with SMTP id u14-20020a056a00098e00b006ce6420e174mr407397pfg.36.1701840315262;
        Tue, 05 Dec 2023 21:25:15 -0800 (PST)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id ka32-20020a056a0093a000b006ce455a7faasm5350125pfb.150.2023.12.05.21.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 21:25:14 -0800 (PST)
Date: Tue, 5 Dec 2023 21:22:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2 00/35] bitops: add atomic find_bit() operations
Message-ID: <ZXAFM2VZugdhM3oE@yury-ThinkPad>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231204185101.ddmkvsr2xxsmoh2u@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185101.ddmkvsr2xxsmoh2u@quack3>
X-Mailman-Approved-At: Wed, 06 Dec 2023 16:37:00 +1100
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
Cc: linux-sh@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Bart Van Assche <bvanassche@acm.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Jiri Pirko <jiri@resnulli.us>, Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexey Klimov <klimov.linux@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Thomas Gleixner <tglx@linutronix.de>, Karsten Keil <isdn@linux-pingi.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org, Dave Hansen <dave.hansen@linux.intel.com>, Eric Dumazet <edumazet@google.com>, Gregory Greenman <gregory.greenman@intel.com>, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat
 .com>, Leon Romanovsky <leon@kernel.org>, Will Deacon <will@kernel.org>, mpi3mr-linuxdrv.pdl@broadcom.com, Hugh Dickins <hughd@google.com>, iommu@lists.linux.dev, Martin Habets <habetsm.xilinx@gmail.com>, linux-media@vger.kernel.org, Stanislaw Gruszka <stf_xl@wp.pl>, linux-arm-msm@vger.kernel.org, Wenjia Zhang <wenjia@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, Oliver Neukum <oneukum@suse.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, linux-pci@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hyperv@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, linux-rdma@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>, ath10k@lists.infradead.org, David Disseldorp <ddiss@suse.de>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>, "James E.J. Bot
 tomley" <jejb@linux.ibm.com>, Akinobu Mita <akinobu.mita@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Edward Cree <ecree.xilinx@gmail.com>, Shuai Xue <xueshuai@linux.alibaba.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>, linux-scsi@vger.kernel.org, linux-net-drivers@amd.com, x86@kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-block@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-sound@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Maxim Kuvyrkov <max
 im.kuvyrkov@linaro.org>, Jens Axboe <axboe@kernel.dk>, Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, linux-bluetooth@vger.kernel.org, dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org, Karsten Graul <kgraul@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 04, 2023 at 07:51:01PM +0100, Jan Kara wrote:
> Hello Yury!
> 
> On Sun 03-12-23 11:23:47, Yury Norov wrote:
> > Add helpers around test_and_{set,clear}_bit() that allow to search for
> > clear or set bits and flip them atomically.
> > 
> > The target patterns may look like this:
> > 
> > 	for (idx = 0; idx < nbits; idx++)
> > 		if (test_and_clear_bit(idx, bitmap))
> > 			do_something(idx);
> > 
> > Or like this:
> > 
> > 	do {
> > 		bit = find_first_bit(bitmap, nbits);
> > 		if (bit >= nbits)
> > 			return nbits;
> > 	} while (!test_and_clear_bit(bit, bitmap));
> > 	return bit;
> > 
> > In both cases, the opencoded loop may be converted to a single function
> > or iterator call. Correspondingly:
> > 
> > 	for_each_test_and_clear_bit(idx, bitmap, nbits)
> > 		do_something(idx);
> > 
> > Or:
> > 	return find_and_clear_bit(bitmap, nbits);
> 
> These are fine cleanups but they actually don't address the case that has
> triggered all these changes - namely the xarray use of find_next_bit() in
> xas_find_chunk().
> 
> ...
> > This series is a result of discussion [1]. All find_bit() functions imply
> > exclusive access to the bitmaps. However, KCSAN reports quite a number
> > of warnings related to find_bit() API. Some of them are not pointing
> > to real bugs because in many situations people intentionally allow
> > concurrent bitmap operations.
> > 
> > If so, find_bit() can be annotated such that KCSAN will ignore it:
> > 
> >         bit = data_race(find_first_bit(bitmap, nbits));
> 
> No, this is not a correct thing to do. If concurrent bitmap changes can
> happen, find_first_bit() as it is currently implemented isn't ever a safe
> choice because it can call __ffs(0) which is dangerous as you properly note
> above. I proposed adding READ_ONCE() into find_first_bit() / find_next_bit()
> implementation to fix this issue but you disliked that. So other option we
> have is adding find_first_bit() and find_next_bit() variants that take
> volatile 'addr' and we have to use these in code like xas_find_chunk()
> which cannot be converted to your new helpers.

Here is some examples when concurrent operations with plain find_bit()
are acceptable:

 - two threads running find_*_bit(): safe wrt ffs(0) and returns correct
   value, because underlying bitmap is unchanged;
 - find_next_bit() in parallel with set or clear_bit(), when modifying
   a bit prior to the start bit to search: safe and correct;
 - find_first_bit() in parallel with set_bit(): safe, but may return wrong
   bit number;
 - find_first_zero_bit() in parallel with clear_bit(): same as above.

In last 2 cases find_bit() may not return a correct bit number, but
it may be OK if caller requires any (not exactly first) set or clear
bit, correspondingly.

In such cases, KCSAN may be safely silenced.
 
> > This series addresses the other important case where people really need
> > atomic find ops. As the following patches show, the resulting code
> > looks safer and more verbose comparing to opencoded loops followed by
> > atomic bit flips.
> > 
> > In [1] Mirsad reported 2% slowdown in a single-thread search test when
> > switching find_bit() function to treat bitmaps as volatile arrays. On
> > the other hand, kernel robot in the same thread reported +3.7% to the
> > performance of will-it-scale.per_thread_ops test.
> 
> It was actually me who reported the regression here [2] but whatever :)
> 
> [2] https://lore.kernel.org/all/20231011150252.32737-1-jack@suse.cz

My apologize.

> > Assuming that our compilers are sane and generate better code against
> > properly annotated data, the above discrepancy doesn't look weird. When
> > running on non-volatile bitmaps, plain find_bit() outperforms atomic
> > find_and_bit(), and vice-versa.
> > 
> > So, all users of find_bit() API, where heavy concurrency is expected,
> > are encouraged to switch to atomic find_and_bit() as appropriate.
> 
> Well, all users where any concurrency can happen should switch. Otherwise
> they are prone to the (admittedly mostly theoretical) data race issue.
> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

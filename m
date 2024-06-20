Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A295A911ADA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 08:02:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IXhdyg7M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W56GC3kCwz3fxD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IXhdyg7M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4pxm6FmJz3cQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:32:27 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6e40d54e4a3so920618a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 11:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718908345; x=1719513145; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=IXhdyg7MVgBxDF2O+F2Yex0w1Bi8vyr8rTOFqfQ16It/R2H6yvDtke5DfXKRwPmnjU
         AOL6R8q49gATRcBF5UN04RL7oPz4m+bKBY/86tG/dZDc7nuFy9z2Vwnxt3yTOEa7wtGr
         jLWXeTlcwEc2E91Iz+9qMFKYgXUJaiNnsHoxXeGMaB/f9jcvamMJPGbdUjy+5KbRdPsh
         oNfhXsu180mHOYms1swEHe9awPyvkFXarjHGCnIIJ66TDfhd8zjc0QCgL6A4PaSVs/gW
         nPan6WeyVxO3XISYsrM2eVtFssH3plVRxwI5QRCcTAENlCVcVKMPU/Nj9vY3tNT+GoRG
         ttVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718908345; x=1719513145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iVi8v7MOsNpmY/+YQC9/JqsYXXSSMQtfI1oW5IIrXg=;
        b=IUpG8iTQCvk7dIVL33txbCYY57KR9PTDW6HczZw8sUjJ0qVYu4uTsl1QUEEvmdtDld
         qd3Ft0VY0tytvNy8jLOOtd5RmlovYyNwSFN9x/Z7waPtGms4ulSRHFsvD5z8baY9GVF/
         OnW6m5uhs8MTA1vyD9ukrT6O0FslJ2P3LUyisvaW1GkNinjnFE8hatdyeuGwsrB5+ETB
         g7soyK4qkX3gSfo7bbpjtvXOZIRUY0HaTA5cDsRDPVeUQOsOzaU52LZDmphl8CWgwzHI
         aI4LqRZ7bA7TtrVd8twlMbLO+6/tq7s5F2of8gjt8yoHtSQ0UIf8lG1EPz8MVM/qV13Y
         l7cA==
X-Forwarded-Encrypted: i=1; AJvYcCX178xP/P+Zh1HJHfC4wFTzIJLMA7V5174t8CVevY+7JCZrp9Hkab1JxqFYXbhbF6PJL2xuyD0XFYsn+wZBk8HCuUHSO9AF9AYmg9KxTQ==
X-Gm-Message-State: AOJu0Yzf1P/cIJX1YafW2yHGoLRa97CrEyVNVHPvU0on98TCrHOaYeKK
	0mepzTBINEj/ZX4skUuVFw4RWBTnvx70cqtcd1jb/MfDQh7h/k+O
X-Google-Smtp-Source: AGHT+IGwYt1/AWmTgUMNjVMcs2dgiLwPkNhT8ZohuoeI/pLSbMfw85UksxqJbsocMe0+kY+O1HneTA==
X-Received: by 2002:a17:903:230c:b0:1f9:bb35:f313 with SMTP id d9443c01a7336-1f9bb35f5b7mr46779535ad.30.1718908344747;
        Thu, 20 Jun 2024 11:32:24 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e80ef6sm140498555ad.115.2024.06.20.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:32:23 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:32:21 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
Message-ID: <ZnR1tQN01kN97G_F@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
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

On Thu, Jun 20, 2024 at 11:00:38AM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 10:57, Yury Norov <yury.norov@gmail.com> wrote:
> >
> >
> > The typical lock-protected bit allocation may look like this:
> 
> If it looks like this, then nobody cares. Clearly the user in question
> never actually cared about performance, and you SHOULD NOT then say
> "let's optimize this that nobody cares about":.
> 
> Yury, I spend an inordinate amount of time just double-checking your
> patches. I ended up having to basically undo one of them just days
> ago.

Is that in master already? I didn't get any email, and I can't find
anything related in the master branch.

> New rule: before you send some optimization, you need to have NUMBERS.

I tried to underline that it's not a performance optimization at my
best. People notice some performance differences, but it's ~3%, no
more.

> Some kind of "look, this code is visible in profiles, so we actually care".

The original motivation comes from a KCSAN report, so it's already
visible in profiles. See [1] in cover letter. This series doesn't fix
that particular issue, but it adds tooling that allow people to search
and acquire bits in bitmaps without firing KCSAN warnings.

This series fixes one real bug in the codebase - see #33, and
simplifies bitmaps usage in many other places. Many people like
it, and acked the patches.

Again, this is NOT a performance series.

Thanks,
Yury

> Because without numbers, I'm just not going to pull anything from you.
> These insane inlines for things that don't matter need to stop.
> 
> And if they *DO* matter, you need to show that they matter.
> 
>                Linus

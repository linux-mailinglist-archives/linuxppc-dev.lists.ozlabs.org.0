Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1A911AE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 08:04:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zhbv5QgJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W56Hm1L64z3dFy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zhbv5QgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4sLL37Cmz3cX5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 06:20:24 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6e57506bb2dso985619a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2024 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718914823; x=1719519623; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=Zhbv5QgJfRFAiKUlEm+nP2qfOoO/HVe/hnHkaiDq3papBuwOWz8Loem/6Fc4NYpMTX
         Drbiedcl/eWAoj5PiItFiAcja4VF15swfVR36ip+jvTyG30OIckfC6042shVyMZPFWRh
         TivK107ldOdh2v5yRhbgYGVt/PFO/ZG4NinV3F2l7a0cHvIGWYmM86LzkteBQGibc8/Y
         I0AYT70BiLPkcYSF0K+8dSHTbmxF4u8WTqbCl9oDLmaFyc2t979+s0DvQr1Wu3CWht9a
         qgi9dPnAzx8VK1DMTIrtobqyeIyQczJ9g7tzjQnm9JkFuFHNkqAwbRKfsHcMEVVUhWAo
         w2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718914823; x=1719519623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyF3zFimLRvnxw2fNLWvvt4TaZ4/tRThw/CSNxiuI4k=;
        b=AQAT+HDlgdSiRQSOWJthtq2Q4mM2speZ1/hr5L6H1iZ8D1NNSe2r4F7jrCymlkXwJZ
         Ms+SnBDsq1OCTFiLZ/fzptMj47HJ1inDaupyHKMdj1xRNYGm68wlIafcHtfUqu1JZp/z
         WVa/ukWrMBCrNYeu2N98ZgC+W8WP/rjNFTVbqC0F8IQD/0s2LBQNfa16dENb+dXsfBTG
         qT/KbzN3HJJyuG/MqWHtAton96P2wh3G3EH9VW8n5WGo/JNg+kbXkf9vwnVYJCRVzKak
         E8Jl26CeN+mIkGaer8EIJF6+W20O0SVq8w6MyY034lrDBnxe/Yo/WdBoTQe0xavzL/Y4
         TrlA==
X-Forwarded-Encrypted: i=1; AJvYcCXR+y+Bn9+Usu2Z6ohr7soUO3ZYAmdoNZI4TyzK/m/xW1qDWqy9XITDCIzqEiNdCW0POQPpEJpwVG4FSyUELs8SQSNr61oGp9cdG8H1Ow==
X-Gm-Message-State: AOJu0Yxx61XEZD02B6samdWduEgjiff8oC5EX3v7SGXJwpons2rc59wF
	8O0QP+gxUL/w6UoHFELxVIhIUtW2dhQZPDIt+2BCWblfpTPHN/zu
X-Google-Smtp-Source: AGHT+IHgTaUdNjnFlceuqDZQb86IcFDSmpZVDJyq9iZqJozpl3uONt9e5qvEXl/03kBUwqlpGmD+xQ==
X-Received: by 2002:a17:90b:3ec6:b0:2c7:e420:a0ec with SMTP id 98e67ed59e1d1-2c7e420a3f5mr3603638a91.0.1718914823251;
        Thu, 20 Jun 2024 13:20:23 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dcc704sm81988a91.47.2024.06.20.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:20:22 -0700 (PDT)
Date: Thu, 20 Jun 2024 13:20:20 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
Message-ID: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
References: <20240620175703.605111-1-yury.norov@gmail.com>
 <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad>
 <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
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

On Thu, Jun 20, 2024 at 12:26:18PM -0700, Linus Torvalds wrote:
> On Thu, 20 Jun 2024 at 11:32, Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Is that in master already? I didn't get any email, and I can't find
> > anything related in the master branch.
> 
> It's 5d272dd1b343 ("cpumask: limit FORCE_NR_CPUS to just the UP case").

FORCE_NR_CPUS helped to generate a better code for me back then. I'll
check again against the current kernel.

The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
sense because in UP case nr_cpu_ids is already a compile-time macro:

#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
#define nr_cpu_ids ((unsigned int)NR_CPUS)
#else
extern unsigned int nr_cpu_ids;
#endif

I use FORCE_NR_CPUS for my Rpi. (used, until I burnt it)

> > > New rule: before you send some optimization, you need to have NUMBERS.
> >
> > I tried to underline that it's not a performance optimization at my
> > best.
> 
> If it's not about performance, then it damn well shouldn't be 90%
> inline functions in a header file.
> 
> If it's a helper function, it needs to be a real function elsewhere. Not this:
> 
>  include/linux/find_atomic.h                  | 324 +++++++++++++++++++
> 
> because either performance really matters, in which case you need to
> show profiles, or performance doesn't matter, in which case it damn
> well shouldn't have special cases for small bitsets that double the
> size of the code.

This small_const_nbits() thing is a compile-time optimization for a
single-word bitmap with a compile-time length.

If the bitmap is longer, or nbits is not known at compile time, the
inline part goes away entirely at compile time.

In the other case, outline part goes away. So those converting from
find_bit() + test_and_set_bit() will see no new outline function
calls.

This inline + outline implementation is traditional for bitmaps, and
for some people it's important. For example, Sean Christopherson
explicitly asked to add a notice that converting to the new API will
still generate inline code. See patch #13.

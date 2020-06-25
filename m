Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E5E20A796
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 23:37:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tCzX0XzHzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FDoOD71A; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tCXn422szDqw0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 07:17:56 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id u5so3634115pfn.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 14:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=FDoOD71AUBcdqMd1QpOGzqSOfHIfeqUX9WRT2uVYBig3mcL8Etxvpb8vKA19DXCEHk
 hGGyn1qQff5t9NyGd0lso3F1GiQRnyM9Thb1X3Q9nK5u7AM24Qpc5yMKBaX3ULrGDdmI
 aW3HUYFlAs8muNXQr2XbluBC6XcTXX0ykUXQ1EzqTydZoE90RxOfVwphYK6gTw5MJDP9
 mgw88O7NpAvmCyIxt25IifP2Bt29eyhNzOX/15SZvv0sU/nuxlLY/V8fYEtI3N0b3pKT
 gp2NuMwvUxbTosGypDo6A5687Z6EsY8/j4IN6ojCLjAHh/Y+rVlTIkural2QcqlX4Tvf
 Rmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CYdo0/N2hPQ38RsTOzG1HX78I9n3NR49FO824e6zLtQ=;
 b=l3301WUVI4xp2doqWGzznAZEMVQqqQH0DXG12oUHciMkr15sGxhHY0EZ41Jk3A4K3F
 dwDFo8cCZL/PLuJ9SyoIvIuclzhagBG5aexaETjVshAK1z04AYSzPvYtnLa1Usvmrv6S
 13K/oUsmSBshPXa9mggS+7fO1nWPzSEVwwT+cgZW8jIeVv3hIQcAHEBDu7LwcVNWRzHW
 XBc3yUIFCNmGq2T/71nhGGbahc/BfjswaASbiFjbSmIfv3DHi9q55a/9YMRBWSgs8zyv
 c2FTbLZvLuA2qAsCTgsmi04IvCXrRUVcFfN56RTO4gkTnKyTweEfjfYBI9AV+Gm+le58
 VTKg==
X-Gm-Message-State: AOAM5330OrULj1dxecVhiv94y53KT4urzL8MXWSbP/cIQ8ftWSfPTkzV
 G6MHD1ZDz45uYILzlFc+iiw=
X-Google-Smtp-Source: ABdhPJzJyZJ3I3aIXnZZyRAyJOt5+B79P9o0RtXQJRVeujxKDOJjiVciYAKydYrmNHnRZVpci1OEig==
X-Received: by 2002:a62:8c12:: with SMTP id m18mr36470728pfd.111.1593119872858; 
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id l2sm9885953pjl.34.2020.06.25.14.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 14:17:52 -0700 (PDT)
Date: Fri, 26 Jun 2020 06:17:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 17/17] arch: rename copy_thread_tls() back to copy_thread()
Message-ID: <20200625211749.GH1401039@lianli.shorne-pla.net>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-18-christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:16 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, linux-csky@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 01:43:26AM +0200, Christian Brauner wrote:

> diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
> index d7010e72450c..19045a3efb8a 100644
> --- a/arch/openrisc/kernel/process.c
> +++ b/arch/openrisc/kernel/process.c
> @@ -116,7 +116,7 @@ void release_thread(struct task_struct *dead_task)
>  extern asmlinkage void ret_from_fork(void);
>  
>  /*
> - * copy_thread_tls
> + * copy_thread
>   * @clone_flags: flags
>   * @usp: user stack pointer or fn for kernel thread
>   * @arg: arg to fn for kernel thread; always NULL for userspace thread
> @@ -147,7 +147,7 @@ extern asmlinkage void ret_from_fork(void);
>   */
>  
>  int
> -copy_thread_tls(unsigned long clone_flags, unsigned long usp,
> +copy_thread(unsigned long clone_flags, unsigned long usp,
>  		unsigned long arg, struct task_struct *p, unsigned long tls)
>  {

For the OpenRISC bit.

Acked-by: Stafford Horne <shorne@gmail.com>

Also, I would agree with what Kees mentioned about aligning the parameters.
Sure that would be more work but it would be appreciated.

-Stafford

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29056352557
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 04:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBNt71BgKz3c4v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 13:14:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CiQCdaLN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=senozhatsky@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=CiQCdaLN; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBNsg64Dkz3015
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 13:14:29 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id p12so430718pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 19:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JB5UehlmQzvZFx81WrZqpYM4CZPIjgwCICp/Q33dgPY=;
 b=CiQCdaLNqItRdaQBOeJkErTv3n7PjSNnp+YvdQJ1ecNwMtUhwCi8shAehVOT7sxQpo
 nP61ASpB1NgGt9ANL4exn/Z9n7DKxzMjicech11ff/+fm4VxApqGY66Vw5/l8MC+kRoI
 zt+/uQlTX7cj6PZaFPDSywCRWFA6eFe3lXxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JB5UehlmQzvZFx81WrZqpYM4CZPIjgwCICp/Q33dgPY=;
 b=qkzrVfgo7tFszPAxDP4Bh7AVtOQw3nLb1X+GDIR7w/IQLkN+yv5drIVoBqBSX4wcKL
 N7Yf3iJStluwqJRKf8nCosdIRpHAeSmkxdO5vvneBVZqRPYUqpM2p9lQy5F0+HFAkhlh
 5QGeQbeg1mMbwKomxKTuskL7341Ug08/noZ3EUndJ0QMzKaPBK6CgqeptUO59AMN+0+j
 639VsUeaavtRWboWBVNBrn97Z4aPpZBbjgR2EPJJKZLMvz0DBr9pzQvTF1HV5DygBieL
 5uJ/Z8aqArDcGtnCUOTQMY+TH6lug4bVNcnaSGmddZe76yZZ63FvE5kMZIu5+FEN4jNu
 24uw==
X-Gm-Message-State: AOAM532KhlwCX6Igz3Hqy+YyrkOZYe17yHL2evnrBXN7FYOsrhcV6KnY
 BYxE8jDoECyDqLk4QyJ/di5grQ==
X-Google-Smtp-Source: ABdhPJy0ejIbP6LV2LsRoOa1rVdM/WfylFauJ7ONnIZVqPdmEwYb/IrcKuqgQDFSQ2rNzG87UypcyQ==
X-Received: by 2002:a65:6a0e:: with SMTP id m14mr10107450pgu.448.1617329667742; 
 Thu, 01 Apr 2021 19:14:27 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:918a:96e1:2fd5:8e77])
 by smtp.gmail.com with ESMTPSA id e65sm6959948pfe.9.2021.04.01.19.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 19:14:27 -0700 (PDT)
Date: Fri, 2 Apr 2021 11:14:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
Message-ID: <YGZ9+kfQKxASmVDR@google.com>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de>
 <YGW63/elFr/gYW1u@alley> <87a6qiqgzr.fsf@jogness.linutronix.de>
 <YGXV8LJarjUJDhvy@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGXV8LJarjUJDhvy@alley>
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (21/04/01 16:17), Petr Mladek wrote:
> > For the long term, we should introduce a printk-context API that allows
> > callers to perfectly pack their multi-line output into a single
> > entry. We discussed [0][1] this back in August 2020.
> 
> We need a "short" term solution. There are currently 3 solutions:
> 
> 1. Keep nmi_safe() and all the hacks around.
> 
> 2. Serialize nmi_cpu_backtrace() by a spin lock and later by
>    the special lock used also by atomic consoles.
> 
> 3. Tell complaining people how to sort the messed logs.

Are we talking about nmi_cpu_backtrace()->dump_stack() or some
other path?

dump_stack() seems to be already serialized by `dump_lock`. Hmm,
show_regs() is not serialized, seems like it should be under the
same `dump_lock` as dump_stack().

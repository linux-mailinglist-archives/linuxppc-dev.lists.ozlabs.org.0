Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D092BDF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 17:15:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJPh75Gmtz3dSr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 01:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJPgk3fTXz30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 01:15:30 +1000 (AEST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58b966b4166so6334114a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2024 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538127; x=1721142927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udOmhMw6nVnLDB7CnXYCG2+/atZ0tO+NBuzOh1Ic4BU=;
        b=IJEChFYTsvLKU2KBLrfOHxWf2BF3YGcjFt8J5Z2YcorXVBHqOMJx1tDENPddy0yHVd
         0ue+8ew2ylEJZt43C8djFeDiU8eFF9du6m5e2eIaDe5pWcPbjCZ/K4VX06sCN7SyBM5V
         4/CRpi8oto7jX0IUrOiU/5rAEjgtrQbeo42gH6W9kzbxW1u4rYJCBjgC5AgbQRTck1Mq
         G1pYwwb+tCEq8GjUNP4I25AW4BC7/UW0zxrjEZASGSmP5Nd/Ze/5xapTxXkTWlD/cjz8
         r/EWZSVM88Ws1JbhdW0rpXlwUAVmrMxop8S/T32DRWvxoAoxt4IfyKYRdZRQ5WhC1ot0
         Kd3A==
X-Forwarded-Encrypted: i=1; AJvYcCU0S+zjXI1ntpLOqqvcZai6XoEzdPSiab8crSrAorpfCHTdS/dkxj9I4M+mAb/QQvm5uPx8QGS8SFGYQPxE1W2khMXR5Qa7+4C09aINdg==
X-Gm-Message-State: AOJu0Yyo1KbKwh2UMV9G3R7a/aJcZghnJCT5eWDM0lBdohjTbUueHqen
	fWQBIG46KOcUhLMs+HtKUqCmaJKf8K/YyF2hpGPLfQKvyVXrvc4K
X-Google-Smtp-Source: AGHT+IF35/Mch11jtk1xVIeWdVFdvciZZUw5TTShgdZrcKMKdHljQsWt+u2oBbViFk5ZTk6F/AOa7g==
X-Received: by 2002:a17:906:c083:b0:a6f:49b1:dec5 with SMTP id a640c23a62f3a-a780b705231mr177181466b.46.1720538126122;
        Tue, 09 Jul 2024 08:15:26 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a853a62sm83568866b.157.2024.07.09.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:15:25 -0700 (PDT)
Date: Tue, 9 Jul 2024 08:15:23 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH 1/4] soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
Message-ID: <Zo1UC/grXeIocGu5@gmail.com>
References: <20240624162128.1665620-1-leitao@debian.org>
 <202406261920.l5pzM1rj-lkp@intel.com>
 <20240626140623.7ebsspddqwc24ne4@skbuf>
 <Zn2yGBuwiW/BYvQ7@gmail.com>
 <20240708133746.ea62kkeq2inzcos5@skbuf>
 <Zow5FUmOADrqUpM9@gmail.com>
 <20240709135811.c7tqh3ocfumg6ctt@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709135811.c7tqh3ocfumg6ctt@skbuf>
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
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org, Roy.Pledge@nxp.com, llvm@lists.linux.dev, open list <linux-kernel@vger.kernel.org>, horms@kernel.org, oe-kbuild-all@lists.linux.dev, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Vladimir,

On Tue, Jul 09, 2024 at 04:58:11PM +0300, Vladimir Oltean wrote:

> On Mon, Jul 08, 2024 at 12:08:05PM -0700, Breno Leitao wrote:
> > I thought about a patch like the following (compile tested only). What
> > do you think?
> 
> To be honest, there are several things I don't really like about this
> patch.
> 
> - I really struggled with applying it in the current format. Could you
>   please post the output of git format-patch in the future?

This is the output of `git format-patch` shifted right by a tab.

> - You addressed dpaa_set_coalesce() but not also dpaa_fq_setup()
> - You misrepresented the patch content by saying you only allocate size
>   for online CPUs in the commit message. But you allocate for all
>   possible CPUs.
> - You only kfree(needs_revert) in the error (revert_values) case, but
>   not in the normal (return 0) case.
> - The netdev coding style is to sort the lines with variable
>   declarations in reverse order of line length (they call this "reverse
>   Christmas tree"). Your patch broke that order.
> - You should use kcalloc() instead of kmalloc_array() + memset()
> 
> I have prepared and tested the attached alternative patch on a board and
> I am preparing to submit it myself, if you don't have any objection.

Sure, not a problem. You just asked how that would be possible, and I
decided to craft patch to show what I had in mind. I am glad we have a
way moving forward.

Thanks for solving it.

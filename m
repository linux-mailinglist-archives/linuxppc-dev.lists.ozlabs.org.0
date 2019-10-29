Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867BE9344
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 00:04:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472nGB5LZzzF3fJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 10:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="G6q4TjVx";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472nDM5vpxzF3cj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 10:02:41 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f19so100501pgn.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 16:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gj4I2e9np+ABg1fiWmCdoCCuD7MPQ/dMJG48/Df5Wsc=;
 b=G6q4TjVx3CqtV8p29Cff7c6W3UG54qYCOtFDTbhSS7DDw+WW1bP2eBvamOedaig8uF
 h5lfsay39HinGe9j0BCEB+poHCn8Gui7WU2KQZEDyhpQspIIkHSvsmOBMLabEe6rruMR
 JSyRzTixew4bfZzX/dtSGZc1sfX6wlSlhVCUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gj4I2e9np+ABg1fiWmCdoCCuD7MPQ/dMJG48/Df5Wsc=;
 b=YHY5BCJ2I8bLZc6zACkthiBooHXzA6oufjyG76oEzbXVKnGm5MIZuXOwUJvZhVdAwG
 D6DGS0ts59FRCLcB3F+Cwm/n3ek7q1RyBzdSdbwfq9TnzWFLMTd2Pvx+/e5y5f1Q8E8V
 iA/UEQ2JnZz84Ml3iqd7KSREBZv89Nph2H1wHYtaebxE3+ZBYCwB0YZuv57NIAK0B+CF
 EL6vErhVUoM1lvlU05kqUTgrIJieQbnSqMUggM7svdvf4fXEPPeKl5/hXuH0414YXo0Z
 HpJLjxw5JChlfBWH2XfR6fi4og9WrEcpV43gEV9zE/G55c8zFwtl4Pd1pgOfFOW5cn+x
 rOBg==
X-Gm-Message-State: APjAAAXn5QkRf2/CMO5azPhqzWGz54FmIhIZpLYn9dbDMQ2PrVXUgPpj
 YxsczpXSrts3J2YbvjDynDMGLg==
X-Google-Smtp-Source: APXvYqyBdXhgu4rolc+XvhattXES8Ylc6xiH5n4bwmYlBM6lz3srQcJLE/1uWUceHnGoPi2duJMBVQ==
X-Received: by 2002:a63:f04d:: with SMTP id s13mr1081841pgj.298.1572390158329; 
 Tue, 29 Oct 2019 16:02:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c21sm175125pfo.51.2019.10.29.16.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 16:02:37 -0700 (PDT)
Date: Tue, 29 Oct 2019 16:02:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v4 0/4] Implement STRICT_MODULE_RWX for powerpc
Message-ID: <201910291601.F161FBBAB2@keescook>
References: <20191014051320.158682-1-ruscur@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014051320.158682-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 04:13:16PM +1100, Russell Currey wrote:
> v3 cover letter here:
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198023.html
> 
> Only minimal changes since then:
> 
> - patch 2/4 commit message update thanks to Andrew Donnellan
> - patch 3/4 made neater thanks to Christophe Leroy
> - patch 3/4 updated Kconfig description thanks to Daniel Axtens

I continue to be excited about this work. :) Is there anything holding
it back from landing in linux-next?

-Kees

> 
> Russell Currey (4):
>   powerpc/mm: Implement set_memory() routines
>   powerpc/kprobes: Mark newly allocated probes as RO
>   powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
>   powerpc: Enable STRICT_MODULE_RWX
> 
>  arch/powerpc/Kconfig                   |  2 +
>  arch/powerpc/Kconfig.debug             |  6 ++-
>  arch/powerpc/configs/skiroot_defconfig |  1 +
>  arch/powerpc/include/asm/set_memory.h  | 32 ++++++++++++++
>  arch/powerpc/kernel/kprobes.c          |  3 ++
>  arch/powerpc/mm/Makefile               |  1 +
>  arch/powerpc/mm/pageattr.c             | 60 ++++++++++++++++++++++++++
>  arch/powerpc/mm/ptdump/ptdump.c        | 21 ++++++++-
>  8 files changed, 123 insertions(+), 3 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/set_memory.h
>  create mode 100644 arch/powerpc/mm/pageattr.c
> 
> -- 
> 2.23.0
> 

-- 
Kees Cook

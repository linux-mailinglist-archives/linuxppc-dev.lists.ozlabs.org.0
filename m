Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3546517B05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 01:54:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ksg123v9Zz3byL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 09:54:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aiiI5Bei;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aiiI5Bei; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksg0L0FX4z2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 09:53:37 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id h1so13468587pfv.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 May 2022 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UDOACbbj5WREIX8e3PlJDPNFFtoKqYFtseP8RD8vKbA=;
 b=aiiI5BeiLWEedDLLuPNPrhF64B/2VBmPLlvt/NsNpILGAngUJeu+AOS7m7r+Vi1wX8
 togdbhDQdQEI8HHBOJJHM0bApqnIk2V0qZUEzEEUO19aAs/aZzv3uf8cQrRhIbLSDtDB
 p0T0nUtvhZLW8BHUpaSkIgoLJaJPOtzceucNWsLGk9pkxAQ1rX04rzQQiUu7AMEgZ/ti
 HpysFvH9boe0IyNqpQp17OIPxULrp9kuVOCC+gdXR8EmOaw4I2vAZOE/d/hJjG1RoLHd
 R3EXr5pS2T94a2ff/jxd0GmKcKKxR4R3Z+jnpnmp8t0Ikg0KvMrC1WS/B/FZDN0l/RFL
 +MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UDOACbbj5WREIX8e3PlJDPNFFtoKqYFtseP8RD8vKbA=;
 b=oO+FuT44FBbkHyAWDSLEYSz8AOusrZ54Lwese2FZDVn1pRJPcHVeJJeSpvfEjR0z2t
 RAiwPNpM0Q4X7pKfVwkFW1boiG2akFmLmogY/igZbIkOYloy9KZxY8D1NGUVqzt9sI2G
 wS+ue63bLCApQB2HEOIS74PvHuq31BE67YceCf5oV2wUj5yKWYjTb+WBa9sjd9HPs9/w
 o5beAOjpXOaSgzslm6SJr8K0ttb7eBbLjv2twCtvJy+GDx2OotDLM+KtZtmFVEGvGOEQ
 h6F2W2Rhope14Y9o0iJ6KtdeSlgidcHEzWTcV+omBrr5FIsHys6rfO24o5+DTznhnLzv
 9niw==
X-Gm-Message-State: AOAM530kjByz3YkP02tS2kg+vGJyixmwirDrDE+7DIFQBMKy+N+/LhMo
 B+omCBq8V0K6+Q7O1xVQgEA=
X-Google-Smtp-Source: ABdhPJw17aPMmpY9RCnKNdp/kXuQ/YqlyfJh8LSj+xBasBqWJP8qN4K89rRJ0/aSKvFd/OVteFN8Og==
X-Received: by 2002:a63:81c8:0:b0:3ab:6025:f43c with SMTP id
 t191-20020a6381c8000000b003ab6025f43cmr11646283pgd.189.1651535612981; 
 Mon, 02 May 2022 16:53:32 -0700 (PDT)
Received: from squeak.grove.modra.org
 ([2406:3400:51d:8cc0:8b0e:9a58:d20a:c45c])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm5244773pfk.78.2022.05.02.16.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 16:53:31 -0700 (PDT)
Received: by squeak.grove.modra.org (Postfix, from userid 1000)
 id 0B4E41140296; Tue,  3 May 2022 09:23:29 +0930 (ACST)
Date: Tue, 3 May 2022 09:23:29 +0930
From: Alan Modra <amodra@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
Message-ID: <YnBu+Rb/0XJBSTJW@squeak.grove.modra.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <20220502142705.GU25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502142705.GU25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 02, 2022 at 09:27:05AM -0500, Segher Boessenkool wrote:
> >   2) If a function changes LR or any non-volatile register, the save
> >      location for those regs must be given. The cfi can be at any
> >      instruction after the saves up to the point that the reg is
> >      changed. (Exception: LR save should be described before a bl.)
> 
> That isn't an exception?  bl changes the current LR after all :-)

The point is that in other cases the cfi can be as late as the
instruction that changes the reg.  For calls it must be at least one
instruction before the call.

Also, I'll note for the wider audience that delaying cfi is slightly
better than playing it safe as Michael has done in his patch in
describing the saves right at the save instruction.  Register save cfi
can usually be grouped together, resulting in fewer CFI_advance codes
in .eh_frame.

> Alan proposed a larger patch that changed to a single stack frame, but it needs changes to
> take into account the red zone.

Yes, now that you mention it, I see the obvious error in the patch I
wrote.  I did say it was untested!


-- 
Alan Modra
Australia Development Lab, IBM

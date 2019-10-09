Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1020D1B96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 00:21:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pTFq2ssYzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 09:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="M6LMWFhF"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pTCc0XFkzDqWk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 09:19:22 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d22so1754883pls.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Oct 2019 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=Nmp4QocRAfDAQzMGcBE0NVn/GYOh/1TSbHz3nLZx/+0=;
 b=M6LMWFhFvoWJoI2tj+mN5Ze4ehgZQNbbkJTdNGZFVxBzFMbwGKbYIIqZh2cUTfFApH
 4rqQ6cpsiBEpTIFRcTIVuJVxDcL4QNIdySkpNTSlFfqH5RCC+Z0AuBPqaTskMXLL96xE
 avqMQwrDm6BJiG21a+1FJh8j2Syiz3GCCFPHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Nmp4QocRAfDAQzMGcBE0NVn/GYOh/1TSbHz3nLZx/+0=;
 b=D5UGrQJdQxSauA5A2VcPfm+xgx6Zxf76sPfFP735lgA95TJKN2FjrmCEi2vf7mxEaD
 sa2yBg68hMJbAFd2gMl+lABM0HsCO5I1r78ylwqZ4lElBwKd5S9YgVFkBI0RvjxDg7+o
 nlSzaC+QJspqwbW1QD1JVIkTtr5B+lT7bB7C/N8ZF1hYiywg+p5pwp3BCts4SbZxvM5i
 Hw5WDoL5lG8Op3AxmsCr5LUWjvzXcG4b++4jozfQboW7K4x3LbWAm7XabnHemH9tyQ9A
 /nAHGyfF/o/qRmw8gA5HxDv4pxn8OrX5V3A/xlORsyvoh8fx9U8C9553knWna7oEXGuH
 9k2Q==
X-Gm-Message-State: APjAAAXnFeWuTzBM/bYMEbv+cUieblB1duQ/hRa/tqaNrJettyD8w7sv
 2obBrf4B4AHOLpW/aci+4j4Jlw==
X-Google-Smtp-Source: APXvYqxNtv7LKcc/vkVaDg0xlcdOoSY/dGgAmfiiTt0YpgJRF75erEGJ5g3x8XATMzXj7QUDu3100w==
X-Received: by 2002:a17:902:8b81:: with SMTP id
 ay1mr5516798plb.79.1570659558620; 
 Wed, 09 Oct 2019 15:19:18 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id z21sm3060263pfa.119.2019.10.09.15.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 15:19:17 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: christophe lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com, ajd@linux.ibm.com
Subject: Re: [PATCH 0/2] ocxl: Move SPA and TL definitions
In-Reply-To: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
References: <20191009151109.13752-1-clombard@linux.vnet.ibm.com>
Date: Thu, 10 Oct 2019 09:19:13 +1100
Message-ID: <871rvlr28u.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

As well as the checkpatch warnings noted on Patchwork
(https://patchwork.ozlabs.org/patch/1173804/ and
https://patchwork.ozlabs.org/patch/1173805/), I noticed:

Applying: powerpc/powernv: ocxl move SPA definition
.git/rebase-apply/patch:405: new blank line at EOF.                                                                                  
+               
warning: 1 line adds whitespace errors.

Regards,
Daniel

christophe lombard <clombard@linux.vnet.ibm.com> writes:

> This series moves the definition and the management of scheduled process area
> (SPA) and of the templates (Transaction Layer) for an ocxl card, using the
> OCAPI interface. The code is now located in the specific arch powerpc platform.
> These patches will help for a futur implementation of the ocxl driver in QEMU.
>
> The Open Coherently Attached Processor Interface (OCAPI) is used to
> allow an Attached Functional Unit (AFU) to connect to the Processor
> Chip's system bus in a high speed and cache coherent manner.
>
> It builds on top of the existing ocxl driver.
>
> It has been tested in a bare-metal environment using the memcpy and
> the AFP AFUs.
>
> christophe lombard (2):
>   powerpc/powernv: ocxl move SPA definition
>   powerpc/powernv: ocxl move TL definition
>
>  arch/powerpc/include/asm/pnv-ocxl.h   |  30 +-
>  arch/powerpc/platforms/powernv/ocxl.c | 378 +++++++++++++++++++++++---
>  drivers/misc/ocxl/afu_irq.c           |   1 -
>  drivers/misc/ocxl/config.c            |  89 +-----
>  drivers/misc/ocxl/link.c              | 347 +++++++----------------
>  drivers/misc/ocxl/ocxl_internal.h     |  12 -
>  drivers/misc/ocxl/trace.h             |  34 +--
>  7 files changed, 467 insertions(+), 424 deletions(-)
>
> -- 
> 2.21.0

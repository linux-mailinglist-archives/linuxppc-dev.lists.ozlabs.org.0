Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB13CC466
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 18:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRtVp4tngz3bXt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 02:15:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eEs06cLR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eEs06cLR; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRtVD53YKz2yNZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 02:14:43 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id a80so629094qkg.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GWmk/6Yg6G/wiV8hPSENTGAb03aKfobGAU5bm/AIcaE=;
 b=eEs06cLRffoRWR9geoOw9th4kL5gmdftURBoHo6blA+R9YhNLipFC3II6xCWFQX42o
 BK+anepFgOwGzwd1BqREZsllk1X9WYX8GXYzch2sKuk8QqV8gsBjoDBArINSzVhqknZ6
 OxtXR8gmkoCuB0P2UffTI9poHhO8TfBtT5FCYvHNlOQvlPP6ZS2tsXIOwcYUzjVFHRYv
 K3ztWUiADBaH6/fUTGRoAHu15wBHiLC2ANJY7aMVXbCPW4d0mTsXkF5L7Wj4lg4I7dLM
 AYTHDxDOAnpzXBQjtM6QsMSxDCrDNcB9C5Lnf5JK6q5aQkv5UGhENPnEML/mP3xC++h5
 WVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=GWmk/6Yg6G/wiV8hPSENTGAb03aKfobGAU5bm/AIcaE=;
 b=tYHNwOF2U//6KDXQLKpRxx2QwyGttGDqoDWjdnL7RMr8f9BhXHyrluyXmf1Pr8cm40
 DmhQxzaf1rZe62vSAHpQj9nxbXw2yEX+F0kaD11FsPKZxml9G0jUZ03nTrzVDRmQfc+i
 tVyDVXlmY5zy1joOQNzarOmcG80slhBr6ka5jz4vCrHm/Kb+rFdnabY77qllMUEgmD+E
 nCVignMGgnVKqN1jowJRmwUbj1Uj9KBTKwOr2SfM3TPGFDK5v410U1xjD8tFvhCHtO2a
 DPdAuvBTdUB+xjjaQl0F8kAt/Rs4rcmxiGMct5W0E9+jVJaeKeDzxP5/92WwbL3V+n4W
 d3MQ==
X-Gm-Message-State: AOAM530tbMIOPVk28iULpq64VnMcV2W17wsaH5stJQ9XLzqe09id7Guh
 bLpmuIBXMvHMUyUDvxhgM40=
X-Google-Smtp-Source: ABdhPJyaBAIDIOkCzcWYABB3+yuo7e93WzdHJVFHG+WjSR5sqpxtH7ny/BDWD5e0Nk/Muq98ttpiGw==
X-Received: by 2002:a05:620a:573:: with SMTP id
 p19mr5200084qkp.99.1626538479989; 
 Sat, 17 Jul 2021 09:14:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c16sm4456355qtv.32.2021.07.17.09.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 09:14:39 -0700 (PDT)
Date: Sat, 17 Jul 2021 09:14:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
Message-ID: <20210717161438.GA3038659@roeck-us.net>
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <CAOSf1CHuLhYO1rXiAhPz6xyQ-GgrjE-dj=Af6v7CWSH6QroEtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CHuLhYO1rXiAhPz6xyQ-GgrjE-dj=Af6v7CWSH6QroEtQ@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 18, 2021 at 01:54:23AM +1000, Oliver O'Halloran wrote:
> On Sat, Jul 17, 2021 at 8:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> > discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> > static").
> >
> > Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> > results in a variety of backtraces such as
> 
> ...and actually using it appears to require both manually enabling it
> in the qemu config and finding a random bios blob that is no longer
> distributed by the manufacturer. Cool.
> 
That is absolutely wrong. vof.bin provided by qemu in the linux root
directory works just fine, plus chrp32_defconfig minus SMP.

Guenter

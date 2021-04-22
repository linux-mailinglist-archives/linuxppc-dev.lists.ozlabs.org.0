Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCC368940
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 01:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRCmm0jbPz303n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 09:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=lftAUNTq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=lftAUNTq; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRCmK4khMz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 09:09:20 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so177385pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=I+ChA608q5PY2OZr5MkEs6pE5PCTHTer03gvn9b4wsk=;
 b=lftAUNTqFM1CixvAqF0/mXn2BtvZ8zs8b4UbV/ZoVc3MpnfmVQ1rzz78UrBE4iPPlk
 MkjlcDHV/7+vkzhw9DgvNrU6eh2/LJLyDJUecSH+gqXBStdHjzcoaucuOXj7rtG6v0Yi
 XQS2CU5y7uM5PKFFK8xaEjHvowH4P3oDz3DZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=I+ChA608q5PY2OZr5MkEs6pE5PCTHTer03gvn9b4wsk=;
 b=CdLB8K95pVuvclg7E9RqsNnuix8sHNtYIDx55xdg/BR/FDzccW9UtD8e8DfK3Ah9fL
 CnEFZJeRszHJ+7qhW2pna0Jkj63ZaIouHdiVeoZyeHAJkpUfqQC0UTpfqTnVNyPyoLbG
 rP64DlStDp60N4gtbawuAXyFfPPjcLtn1ZQ5JUHGeLpZfKLTnc9OFXa4exwJYXFcoIJd
 3pEya2KQW7uGmsJyWWA+FhELIwMHlnWtbkqTE60GqfpWC5oVrIzczMZQzklCKukUiqcm
 JZsZnPG4Jgn6Np+x/7wRq6xR1tjNwK7AF7JWIHQchDeFxlcK/OnW3sNS3nMPaKppIWnX
 eA6A==
X-Gm-Message-State: AOAM531cjPUrjr8pR1hdV5NIZHhErrRJcuQpqkxP4/UYf35WI4YQkGK8
 9i52ylBROMUxTTMxletjuIdlPQ==
X-Google-Smtp-Source: ABdhPJwCBaie9yuLL90yVwDtCXeYnxlBEOFwUMRH3KjeOBuPd80mSfqouLqOvdcMa/F/prJJgFlElw==
X-Received: by 2002:a17:902:e546:b029:ec:a7f5:2a88 with SMTP id
 n6-20020a170902e546b02900eca7f52a88mr1170687plf.21.1619132955742; 
 Thu, 22 Apr 2021 16:09:15 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-587a-8af2-ee3d-5684.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:587a:8af2:ee3d:5684])
 by smtp.gmail.com with ESMTPSA id h24sm5755525pjv.50.2021.04.22.16.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 16:09:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv/pci: remove dead code from !CONFIG_EEH
In-Reply-To: <20210422195405.4053917-1-ndesaulniers@google.com>
References: <20210422195405.4053917-1-ndesaulniers@google.com>
Date: Fri, 23 Apr 2021 09:09:12 +1000
Message-ID: <87lf99zzl3.fsf@dja-thinkpad.axtens.net>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
> possible candidate to convert to #ifdef CONFIG_EEH, but it seems that
> based on Kconfig dependencies it's not possible to build this file
> without CONFIG_EEH enabled.

This seemed odd to me, but I think you're right:

arch/powerpc/platforms/Kconfig contains:

config EEH
	bool
	depends on (PPC_POWERNV || PPC_PSERIES) && PCI
	default y

It's not configurable from e.g. make menuconfig because there's no prompt.
You can attempt to explicitly disable it with e.g. `scripts/config -d EEH`
but then something like `make oldconfig` will silently re-enable it for
you.

It's been forced on since commit e49f7a9997c6 ("powerpc/pseries: Rivet
CONFIG_EEH for pSeries platform") in 2012 which fixed it for
pseries. That moved out from pseries to pseries + powernv later on.

There are other cleanups in the same vein that could be made, from the
Makefile (which has files only built with CONFIG_EEH) through to other
source files. It looks like there's one `#ifdef CONFIG_EEH` in
arch/powerpc/platforms/powernv/pci-ioda.c that could be pulled out, for
example.

I think it's probably worth trying to rip out all of those in one patch?

Kind regards,
Daniel

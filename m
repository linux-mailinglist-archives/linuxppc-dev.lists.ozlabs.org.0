Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F077435300
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 20:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZKQ1562Vz3c72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:48:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X8tKojH7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X8tKojH7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZKPL4Q4rz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 05:48:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C8A610D0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634755683;
 bh=n8VrOe4I2yKWKENo2xOz+GrW26l+tosuZNQ1rYD5gKE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X8tKojH7Z8fdPyVTk4z+AoVAS3a9h5oYDEVDa7uI3b3vQWDC0RDkopnsSuFW09wMx
 S5ymoCHlxw+BZDcfi8a/SbXyaru92R/D/4JVacWcGVpk2lCHkMZKGKNpRCcpV4amQE
 0SC95mBmBf+xrbZsPKYOZ3Tw+i6Awvb4CDoD4fADso7xeFCGtNQbQjFeERWiYt5J4a
 XviC1MWcQkWkyhnJbBbb7MhB9KdUgixAetlN+ZjGulMI+TYlz6yOX8pi/IJu8QIrAm
 DPTPSRiUO2vc4Q2/LyUL9rJoQfRdVbdcu/SicgghaP/nLNsd5aIhVOahGYlBk3gw4h
 jokZEwKpwMQ/g==
Received: by mail-wr1-f41.google.com with SMTP id r10so273179wra.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 11:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM532Izt7zxxvzCH2EiOrM8D4J9xFqEu2GoIyAwpPXRU9RA4qIlX6q
 X2LGDJQA6R1endHT/2x81EhuqemR5el0NrCW/g==
X-Google-Smtp-Source: ABdhPJyDkQcU37hcsbyKe6namKZuEksRA+CPb1y/N+dx0XKOp77yba3905ZumF5lcfjyaXaZElnjUUGJ+2NqhJwXc9g=
X-Received: by 2002:aa7:cd0a:: with SMTP id b10mr942298edw.164.1634755670808; 
 Wed, 20 Oct 2021 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Oct 2021 13:47:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
Subject: Re: [PATCH 00/12] DT: CPU h/w id parsing clean-ups and cacheinfo id
 support
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 X86 ML <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 SH-Linux <linux-sh@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Borislav Petkov <bp@alien8.de>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 6, 2021 at 11:43 AM Rob Herring <robh@kernel.org> wrote:
>
> The first 10 patches add a new function, of_get_cpu_hwid(), which parses
> CPU DT node 'reg' property, and then use it to replace all the open
> coded versions of parsing CPU node 'reg' properties.
>
> The last 2 patches add support for populating the cacheinfo 'id' on DT
> platforms. The minimum associated CPU hwid is used for the id. The id is
> optional, but necessary for resctrl which is being adapted for Arm MPAM.
>
> Tested on arm64. Compile tested on arm, x86 and powerpc.
>
> Rob
>
> Rob Herring (12):
>   of: Add of_get_cpu_hwid() to read hardware ID from CPU nodes
>   ARM: Use of_get_cpu_hwid()
>   ARM: broadcom: Use of_get_cpu_hwid()
>   arm64: Use of_get_cpu_hwid()
>   csky: Use of_get_cpu_hwid()
>   openrisc: Use of_get_cpu_hwid()
>   powerpc: Use of_get_cpu_hwid()
>   riscv: Use of_get_cpu_hwid()
>   sh: Use of_get_cpu_hwid()
>   x86: dt: Use of_get_cpu_hwid()
>   cacheinfo: Allow for >32-bit cache 'id'
>   cacheinfo: Set cache 'id' based on DT data

I've fixed up the openrisc error and applied 1-10 to the DT tree.

The cacheinfo part is going to need some more work. I've found I will
need the cache affinity (of possible cpus) as well, so I plan to also
store the affinity instead of looping thru caches and cpus again.

Rob

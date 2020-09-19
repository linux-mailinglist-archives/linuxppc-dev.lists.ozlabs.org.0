Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE0270CFF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 12:27:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btn2j2gWxzDqld
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 20:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jeyu@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Dhs4E9cC; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Btn153ps6zDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 20:26:17 +1000 (AEST)
Received: from linux-8ccs (p57a236d4.dip0.t-ipconnect.de [87.162.54.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EEFFF207FF;
 Sat, 19 Sep 2020 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600511174;
 bh=QS+/7ck8Ms+3NScVBhWMouEzmGA4XUAFNHh7y81UkaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dhs4E9cCPWR5U6/L6w+Ot0AP6OfHcv183sxqnUkXXz/AnXJDt0AXHHvcqCMVei5i6
 GKnSZS2OKXzMu25vZ30nutYcHd1k1XhpuBjem46GWue0KNcO/LOyTnnK8hzbEj6OMj
 lh64cXJ94R44/ThRRJAbdzF0qE+FcmC0n0GycrxI=
Date: Sat, 19 Sep 2020 12:26:01 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] kbuild: preprocess module linker script
Message-ID: <20200919102601.GA22693@linux-8ccs>
References: <20200908042708.2511528-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200908042708.2511528-1-masahiroy@kernel.org>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-ia64@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Michal Marek <michal.lkml@markovi.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Masahiro Yamada [08/09/20 13:27 +0900]:
>There was a request to preprocess the module linker script like we
>do for the vmlinux one. (https://lkml.org/lkml/2020/8/21/512)
>
>The difference between vmlinux.lds and module.lds is that the latter
>is needed for external module builds, thus must be cleaned up by
>'make mrproper' instead of 'make clean'. Also, it must be created
>by 'make modules_prepare'.
>
>You cannot put it in arch/$(SRCARCH)/kernel/, which is cleaned up by
>'make clean'. I moved arch/$(SRCARCH)/kernel/module.lds to
>arch/$(SRCARCH)/include/asm/module.lds.h, which is included from
>scripts/module.lds.S.
>
>scripts/module.lds is fine because 'make clean' keeps all the
>build artifacts under scripts/.
>
>You can add arch-specific sections in <asm/module.lds.h>.
>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>Tested-by: Jessica Yu <jeyu@kernel.org>
>Acked-by: Will Deacon <will@kernel.org>

Acked-by: Jessica Yu <jeyu@kernel.org>

Thanks for working on this! 


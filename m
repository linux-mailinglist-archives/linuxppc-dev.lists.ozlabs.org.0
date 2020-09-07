Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147425FB7A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 15:32:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlTjT4CJZzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 23:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=KRrpWHcL; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlTgP53SbzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 23:30:41 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6570221481;
 Mon,  7 Sep 2020 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599485438;
 bh=5+5cu0m/GDXW1vdvbD9k7dHxXUwtrx3YfHl3e5jZzVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRrpWHcLtkZ3gsEWWQEUwiKCvFKuq+nxBQ17eXU7UnEmvJeWgaU3SCkt9a3hJWgsx
 FLThsuMmNCxz4K2Oz4Z8viDJXy/BmBg7IfsTrbiKWDEihgV76wvP8FTW7mluj45XcF
 jls9imQ81JnzCuK1kjqMeF696TtfPWoy3cmflzvQ=
Date: Mon, 7 Sep 2020 14:30:30 +0100
From: Will Deacon <will@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: preprocess module linker script
Message-ID: <20200907133029.GB12551@willie-the-truck>
References: <20200904133122.133071-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904133122.133071-1-masahiroy@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 Jessica Yu <jeyu@kernel.org>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 04, 2020 at 10:31:21PM +0900, Masahiro Yamada wrote:
> There was a request to preprocess the module linker script like we do
> for the vmlinux one (https://lkml.org/lkml/2020/8/21/512).
> 
> The difference between vmlinux.lds and module.lds is that the latter
> is needed for external module builds, thus must be cleaned up by
> 'make mrproper' instead of 'make clean' (also, it must be created by
> 'make modules_prepare').
> 
> You cannot put it in arch/*/kernel/ because 'make clean' descends into
> it. I moved arch/*/kernel/module.lds to arch/*/include/asm/module.lds.h,
> which is included from scripts/module.lds.S.
> 
> scripts/module.lds is fine because 'make clean' keeps all the build
> artifacts under scripts/.
> 
> You can add arch-specific sections in <asm/module.lds.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Jessica Yu <jeyu@kernel.org>
> ---

For the arm64 bits:

Acked-by: Will Deacon <will@kernel.org>

Thanks,

Will

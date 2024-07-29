Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216393F16F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 11:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXYQ50kfKz3d2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 19:45:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=cantor.telenet-ops.be (client-ip=2a02:1800:120:4::f00:10; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 561 seconds by postgrey-1.37 at boromir; Mon, 29 Jul 2024 19:45:27 AEST
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXYPg4qGrz3cNB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 19:45:26 +1000 (AEST)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4WXYBY4v2jz4wwl1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 11:35:49 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4441:3808:f850:4280])
	by andre.telenet-ops.be with bizsmtp
	id tMbo2C0080ZURL201MboMp; Mon, 29 Jul 2024 11:35:49 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sYMnE-003sYs-9i;
	Mon, 29 Jul 2024 11:35:48 +0200
Date: Mon, 29 Jul 2024 11:35:48 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.11-rc1
In-Reply-To: <20240729092807.2235937-1-geert@linux-m68k.org>
Message-ID: <bd4e9928-17b3-9257-8ba7-6b7f9bbb639a@linux-m68k.org>
References: <CAHk-=wiyNokz0d3b=GRORij=mGvwoYHy=+bv6m2Hu_VqNdg66g@mail.gmail.com> <20240729092807.2235937-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: dm-devel@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Jul 2024, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.11-rc1[1] compared to v6.10[2].
>
> Summarized:
>  - build errors: +7/-22

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/8400291e289ee6b2bf9779ff1c83a291501f017b/ (all 132 configs)

> 7 error regressions:
>  + /kisskb/src/arch/mips/sgi-ip22/ip22-gio.c: error: initialization of 'int (*)(struct device *, const struct device_driver *)' from incompatible pointer type 'int (*)(struct device *, struct device_driver *)' [-Werror=incompatible-pointer-types]:  => 384:14

mips-gcc8/ip22_defconfig

>  + /kisskb/src/drivers/md/dm-integrity.c: error: logical not is only applied to the left hand side of comparison [-Werror=logical-not-parentheses]:  => 4718:45

powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc64le_allmodconfig

>  + /kisskb/src/fs/btrfs/inode.c: error: 'location.objectid' may be used uninitialized in this function [-Werror=maybe-uninitialized]:  => 5603:9
>  + /kisskb/src/fs/btrfs/inode.c: error: 'location.type' may be used uninitialized in this function [-Werror=maybe-uninitialized]:  => 5674:5

m68k-gcc8/m68k-allmodconfig
mips-gcc8/mips-allmodconfig
powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc64_defconfig

>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_933' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38
>  + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_934' declared with attribute error: FIELD_GET: mask is not constant:  => 510:38

     inlined from 'xe_oa_set_prop_oa_format' at /kisskb/src/drivers/gpu/drm/xe/xe_oa.c:1664:6:

powerpc-gcc5/powerpc-all{yes,mod}config
powerpc-gcc5/powerpc-allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

(fix sent)

>  + /kisskb/src/kernel/fork.c: error: #warning clone3() entry point is missing, please fix [-Werror=cpp]:  => 3072:2

sh4-gcc13/se{7619,7750}_defconfig
sh4-gcc13/sh-all{mod,no,yes}config
sh4-gcc13/sh-defconfig
sparc64-gcc5/sparc-allnoconfig
sparc64-gcc{5,13}/sparc32_defconfig
sparc64-gcc{5,13}/sparc64-{allno,def}config
sparc64-gcc13/sparc-all{mod,no}config
sparc64-gcc13/sparc64-allmodconfig

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

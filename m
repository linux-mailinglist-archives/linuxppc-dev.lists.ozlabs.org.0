Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9EE21D602
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 14:34:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B534G6Rd5zDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 22:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B53216G7WzDqC6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:32:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=huZjoq5T; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B531z0mNJz9sQt;
 Mon, 13 Jul 2020 22:32:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594643545;
 bh=MqWMoeDNwlUAHlcs0wWO5CUaK7kc9jQIHbwysyqNKzE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=huZjoq5TXwq98uPA/wjGPFbbrESigMSKQbqC1SI/KU7B00Nn3h+zEMxwkqmlAUZL+
 CC65/DsbXm11/6KxT8nk2apPPcXW3uA7sT+WdfsSMSac1SdlqQJQf4emNH06cGQmro
 a0iHEaquMXdj6FSQCHaWaHyC0umMMAOXCfJqn1Y2vafN0UOMJCyL1aU8P9juC6TCpI
 FVUzJi1QCXPtSNISS2qaoIR3GaBo4TtzwVrg3jxn9VkfBL/55qy+wG7Rmh9HqYkj14
 vYQIAeiEqi4xeJE6EIrbMWxJ2kXganV4j2SeT9FWNGH+EVc84Ml7CyErbc9iFiWRJ3
 UTZk9VBuwglWg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: add DTB to 'targets'
In-Reply-To: <20200713075629.5948-1-masahiroy@kernel.org>
References: <20200713075629.5948-1-masahiroy@kernel.org>
Date: Mon, 13 Jul 2020 22:34:43 +1000
Message-ID: <87sgdvvbj0.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> PowerPC always re-builds DTB even if nothing has been changed.
>
> As for other architectures, arch/*/boot/dts/Makefile builds DTB by
> using the dtb-y syntax.
>
> In contrast, arch/powerpc/boot/dts/(fsl/)Makefile does nothing unless
> CONFIG_OF_ALL_DTBS is defined. Instead, arch/powerpc/boot/Makefile
> builds DTB on demand. You need to add DTB to 'targets' explicitly
> so .*.cmd files are included.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> I want to apply this to kbuild tree because this is needed
> to fix the build error caused by another kbuild patch:
>
> https://lkml.org/lkml/2020/7/7/134

OK.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 63d7456b9518..8792323707fd 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -366,6 +366,8 @@ initrd-y := $(patsubst zImage%, zImage.initrd%, \
>  		$(patsubst treeImage%, treeImage.initrd%, $(image-y)))))
>  initrd-y := $(filter-out $(image-y), $(initrd-y))
>  targets	+= $(image-y) $(initrd-y)
> +targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
> +		$(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
>  
>  $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
>  
> -- 
> 2.25.1

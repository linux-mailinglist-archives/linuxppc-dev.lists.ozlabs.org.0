Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA656531F05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 01:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6XrL3Z8Pz3c7b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 09:01:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nGUkzijZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35;
 helo=mail-oa1-x35.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nGUkzijZ; dkim-atps=neutral
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Xqd6KX1z308V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 09:00:44 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f16a3e0529so20326246fac.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/hOaZULQrF9LX4munHpY3wVXOQ9nYFe0ZRAvQXZ3vbE=;
 b=nGUkzijZu5ZFwvP8H84AwlAD1vdzdwA1fp5JhNnOjdcRC+ZxUoP+QYS9XM6GLQeWyk
 phuU243eWaA6M+lCDpQB8vQdh7UdO47A0ZJYAgW4Um8l1Je80E/ADeEln0UO4XBU06uk
 on8Kx0QGQnjxiqYAC4W9JuuCImAujkCxhohJ9HwGnvDEXHmXOp51TTJpBA0kMEvDsd2n
 XjWGc1x9K9Uo2HMgqryiDUOsGi2dZjT+EyH+RDMx5s3Jhl2IKdM5ql4zNVw3Tn+xZBSM
 iAI+2SAS0zaoEjNKFKND7vIAfWufy9XiIMFFVGaGrZQ9xEsjaYicgVQ/L7iaon8uSMaO
 GZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=/hOaZULQrF9LX4munHpY3wVXOQ9nYFe0ZRAvQXZ3vbE=;
 b=EEb8jmhfe2Jrnt51LkHDinDJBTaa+OkfxWIc7tBiuDVctbYjP0LZHhN/aUP2wAQ6Qh
 gZpo1ymS2akTZ9bqKjD1S15p85gJHAp230cWdYBFvbj2Rk/EIt/ruKSmm0Z6MHGbqO5c
 m6l3UsZPb/Byoa1svy/Xzeii8FZ9Jap/AFg2NteI2s2mSD3UFpwsv82fXbsv8vZbUK8j
 uBS04F4Lcrv91IYoRREDBdQYXnaKUZOClNWkLnG9BxnhaGFW1LnSvUylPzsaZ2htsd0o
 KHfAdShW6xaMFRhDzQk4T5GPzg2cvIz5FajuBgadxrpz8jZysFauE1Q7m9s0asAHCFkL
 mWQg==
X-Gm-Message-State: AOAM533bS5uG1M5ulmIAC84tZnKE0eVLA121uFyFLR4Axj51+ErceUy7
 XqtfPSV5DU5AOGwsVzRsWDY=
X-Google-Smtp-Source: ABdhPJwFYvmU9t0f1/cxvvqr52oJVOx3ly87DqZ/EmOOoCe4wzWaAPc48YIP+GgJ2Vc9YQqj1/y/lw==
X-Received: by 2002:a05:6870:15cc:b0:ee:456f:c1e5 with SMTP id
 k12-20020a05687015cc00b000ee456fc1e5mr788661oad.46.1653346841457; 
 Mon, 23 May 2022 16:00:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a056871054500b000e686d1386asm4315531oal.4.2022.05.23.16.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:00:40 -0700 (PDT)
Date: Mon, 23 May 2022 16:00:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <20220523230039.GA238308@roeck-us.net>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <CAJF2gTSCcYif4DEpvrJ6d02no3CU_viyE+OkhhjCV3VsGmcT5Q@mail.gmail.com>
 <0ecdb673-b9a8-40af-7dee-2ba7fe739e5f@roeck-us.net>
 <44686961.fMDQidcC6G@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44686961.fMDQidcC6G@diego>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 12:40:06AM +0200, Heiko Stübner wrote:
> Hi Guenter,
> 
> Am Montag, 23. Mai 2022, 18:18:47 CEST schrieb Guenter Roeck:
> > On 5/23/22 08:18, Guo Ren wrote:
> > > I tested Palmer's branch, it's okay:
> > > 8810d7feee5a (HEAD -> for-next, palmer/for-next) riscv: Don't output a
> > > bogus mmu-type on a no MMU kernel
> > > 
> > > I also tested linux-next, it's okay:
> > > 
> > > rv64_rootfs:
> > > # uname -a
> > > Linux buildroot 5.18.0-next-20220523 #7 SMP Mon May 23 11:15:17 EDT
> > > 2022 riscv64 GNU/Linux
> > > #
> > 
> > That is is ok with one setup doesn't mean it is ok with
> > all setups. It is not ok with my root file system (from
> > https://github.com/groeck/linux-build-test/tree/master/rootfs/riscv64),
> > with qemu v6.2.
> 
> That is very true that it shouldn't fail on any existing (qemu-)platform,
> but as I remember also testing Guo's series on both riscv32 and riscv64
> qemu platforms in the past, I guess it would be really helpful to get more
> information about the failing platform you're experiencing so that we can
> find the source of the issue.
> 
> As it looks like you both tested the same kernel source, I guess the only
> differences could be in the qemu-version, kernel config and rootfs.
> Is your rootfs something you can share or that can be rebuilt easily?
> 
I provided a link to my root file system above. The link points to two
root file systems, for initrd (cpio archive) and for ext2.
I also mentioned above that I used qemu v6.2. And below I said

> My root file system uses musl.

I attached the buildroot configuration below. The buildroot version,
if I remember correctly, was 2021.02.

Kernel configuration is basically defconfig. However, I do see one
detail that is possibly special in my configuration.

    # The latest kernel assumes SBI version 0.3, but that doesn't match qemu
    # at least up to version 6.2 and results in hangup/crashes during reboot
    # with sifive_u emulations.
    enable_config "${defconfig}" CONFIG_RISCV_SBI_V01

Hope that helps,

Guenter

---
BR2_riscv=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_KERNEL_HEADERS_4_19=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_TARGET_RUN_TESTSCRIPT=y
BR2_SHUTDOWN_COMMAND_POWEROFF=y
BR2_SYSTEM_DHCP="eth0"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_DTC=y
BR2_PACKAGE_DTC_PROGRAMS=y
BR2_PACKAGE_IPROUTE2=y
BR2_TARGET_ROOTFS_BTRFS=y
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
BR2_TARGET_ROOTFS_EXT2_GZIP=y
BR2_TARGET_ROOTFS_ISO_GZIP=y
BR2_TARGET_ROOTFS_SQUASHFS=y
# BR2_TARGET_ROOTFS_TAR is not set


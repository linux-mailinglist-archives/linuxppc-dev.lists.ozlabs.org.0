Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AFF1D6FDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 06:31:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QR0g4KDmzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 14:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LimDPPmi; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QQyp33P2zDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 14:29:37 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id s10so1980373pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 21:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7bbx1vjAcGJU7o+yFip4EyC/ilyC7OBp4VPSqw3/c2c=;
 b=LimDPPmibz9vtWmb0MKZHn8c9RdWix1P/AFk6SDLaoXlBVdMlC7Hfce2We+MkFAz4E
 R/2Wy61j9gG0ixy9mMyHuhS77QZ+W2IqUs+cNkzrG6dQaDcMMpIgqWZr6ft8gTO/HSMB
 oF3oavsgnI2fjkM2QAjIyKAHhhOTcnWFH16xKUZkqjczHwsm/iprxuSgfWtVik27j84r
 5n8U7fFfETauYry76p+6vX2RXQib8sKv+lhcWS2IP1EZ6KlTna+BQg/FRhPkbiW1PxTM
 QM0E7X94qZuWMPHXEPUx2ysbg6/oZL89r6bgB9KXLUanLbbSlSBCGfqIrn7x7qAQncoA
 /GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7bbx1vjAcGJU7o+yFip4EyC/ilyC7OBp4VPSqw3/c2c=;
 b=dbS2Jevr5YZRdJX32RDL3P0YqCp8kqiLvoCnAhDRCryAZQ90yOeHX0X1wF7Idpc29C
 udBuwMsqKrNvApQLbM+bqBfb3B0SWtgch9IqWZ8AhmW1BuacQYpyr4vFI04uKgw9ihLx
 ApNHw2fx8Z10MwRHjiexszcwtHbeykX6kY/TOO1ehze2RvWiLIjjcWtKKoObtcgMK/eD
 UC3ncmxF+8f/Sj0xKf/T2tMlYA4hARK/kvibZ6JtrH5S/GChnQLrYpoilJF16lbkukXV
 y3XyUYJb+5vhkSLIOCYPROYi1OvYSCbbJu1O8E15H60j0TQrgeF9l+x/HjSUpY1wMLYt
 TSOA==
X-Gm-Message-State: AOAM5307Njk1uAu+4A5FdY45utLY+C1ItcFUBGKMjcGvObnribsaJF92
 L4A63Zhzp4ivPGNIl2MvcG0=
X-Google-Smtp-Source: ABdhPJxbJqkFB3G+mfP7Q58PJuzXycNotbRv9vDLFxrEQ/xV/2+VRINR3zhBhOzJGROFI8CL8Y8+Lg==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr15841791pfi.199.1589776174113; 
 Sun, 17 May 2020 21:29:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 62sm7548040pfc.204.2020.05.17.21.29.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 May 2020 21:29:33 -0700 (PDT)
Date: Sun, 17 May 2020 21:29:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518042932.GA59205@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
> On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> > On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> > > From: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > Every single architecture (including !CONFIG_HIGHMEM) calls...
> > > 
> > > 	pagefault_enable();
> > > 	preempt_enable();
> > > 
> > > ... before returning from __kunmap_atomic().  Lift this code into the
> > > kunmap_atomic() macro.
> > > 
> > > While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> > > be consistent.
> > > 
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > This patch results in:
> > 
> > Starting init: /bin/sh exists but couldn't execute it (error -14)
> > 
> > when trying to boot microblazeel:petalogix-ml605 in qemu.
> 
> Thanks for the report.  I'm not readily seeing the issue.
> 
> Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
> 
See below. Yes, CONFIG_HIGHMEM is set.

The scripts used to build and boot the image are at:

https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel

Hope this helps,

Guenter

---
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_AUDIT=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_BLK_DEV_INITRD=y
# CONFIG_BASE_FULL is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_EMBEDDED=y
CONFIG_SLAB=y
CONFIG_KERNEL_BASE_ADDR=0x50000000
CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
CONFIG_XILINX_MICROBLAZE0_USE_FPU=2
CONFIG_XILINX_MICROBLAZE0_HW_VER="10.0.a"
CONFIG_HZ_100=y
CONFIG_MMU=y
CONFIG_HIGHMEM=y
CONFIG_PCI_XILINX=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_PARTITION_ADVANCED=y
# CONFIG_EFI_PARTITION is not set
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
# CONFIG_IPV6 is not set
CONFIG_BRIDGE=m
CONFIG_PCI=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_MTD=y
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=8192
CONFIG_NETDEVICES=y
CONFIG_XILINX_EMACLITE=y
CONFIG_XILINX_LL_TEMAC=y
# CONFIG_INPUT is not set
# CONFIG_SERIO is not set
# CONFIG_VT is not set
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
# CONFIG_HW_RANDOM is not set
CONFIG_XILINX_HWICAP=y
CONFIG_I2C=y
CONFIG_I2C_XILINX=y
CONFIG_SPI=y
CONFIG_SPI_XILINX=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_XILINX=y
# CONFIG_HWMON is not set
CONFIG_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_FB=y
CONFIG_FB_XILINX=y
# CONFIG_USB_SUPPORT is not set
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_EXT2_FS=y
# CONFIG_DNOTIFY is not set
CONFIG_CRAMFS=y
CONFIG_ROMFS_FS=y
CONFIG_NFS_FS=y
CONFIG_CIFS=y
CONFIG_CIFS_STATS2=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_DEBUG_INFO=y
CONFIG_KGDB=y
CONFIG_KGDB_TESTS=y
CONFIG_KGDB_KDB=y
CONFIG_DEBUG_SLAB=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEBUG_SPINLOCK=y

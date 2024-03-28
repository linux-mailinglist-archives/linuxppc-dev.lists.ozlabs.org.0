Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02088FD46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 11:41:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=XIydy6S8;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=176d5uBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V50TC3tscz3vg8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 21:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=XIydy6S8;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=176d5uBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay6-1.pub.mailoutpod3-cph3.one.com (client-ip=2a02:2350:5:425::1; helo=mailrelay6-1.pub.mailoutpod3-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 11726 seconds by postgrey-1.37 at boromir; Thu, 28 Mar 2024 21:40:13 AEDT
Received: from mailrelay6-1.pub.mailoutpod3-cph3.one.com (mailrelay6-1.pub.mailoutpod3-cph3.one.com [IPv6:2a02:2350:5:425::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V50Rd0l9rz3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 21:40:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=PSqQ0tUcd24FMa7LTSnOjznumgMgVETMUSxlbMzDyGI=;
	b=XIydy6S8dgWb8HmkJ3k6wh0/RlVPf3sfxGuBdSNfIpeWNXeiiQU+NfvXW/X9+NFT/8CUluyIj1pl+
	 xrwwoOUFkSlfym8kT0VFQfsy0VagKtqP4X/MgU5gKmNBVuaCDvDNqOqEYFbnQhfDL5GXlnCZ7zOOLc
	 ACc2qPRYR2y/FggxpXGKjnAfJOLaHZSGUcN7XBMxLfcjuwdhhoZbx7t/fii5SYNl6+s+Zf54IFiMOw
	 1Ifmvqcxcp4yOqStqzLEFI/Zn9L0YdEqkFGxe7o5VsTDyZJXrUGfcC3o2KPGRUh4ip6cQwI1Ub2IQE
	 VgtcDe2ontma++yvrzlfIO17dTktb5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=PSqQ0tUcd24FMa7LTSnOjznumgMgVETMUSxlbMzDyGI=;
	b=176d5uBvt7desytnCMCAugYv9YTukwo6PjTHPPtW6wVwX2G/GOqFtBLpCAxJdb/W2MOvfDlYuTnMn
	 mQwb+ZADw==
X-HalOne-ID: 135111f6-ecd4-11ee-9cc4-bd80189f112a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 135111f6-ecd4-11ee-9cc4-bd80189f112a;
	Thu, 28 Mar 2024 07:23:31 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:23:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] arch: Rename fbdev header and source files
Message-ID: <20240328072329.GA1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-4-tzimmermann@suse.de>
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
Cc: Andreas Larsson <andreas@gaisler.com>, sui.jingfeng@linux.dev, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, deller@gmx.de, Huacai Chen <chenhuacai@kernel.org>, javierm@redhat.com, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, arnd@arndb.de, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner 
 <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Wed, Mar 27, 2024 at 09:41:31PM +0100, Thomas Zimmermann wrote:
> The per-architecture fbdev code has no dependencies on fbdev and can
> be used for any video-related subsystem. Rename the files to 'video'.
> Use video-sti.c on parisc as the source file depends on CONFIG_STI_CORE.
> 
> Further update all includes statements, includ guards, and Makefiles.
                                                ^ missing 'e' 

> Also update a few strings and comments to refer to video instead of
> fbdev.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>

If the patch is changed to use the Kbuild file to pick the generic
variant of video.h then it is:

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I also added an unrelated sparc comment, that can be addressed another
time.

	Sam

> ---
>  arch/arc/include/asm/fb.h                    |  8 --------
>  arch/arc/include/asm/video.h                 |  8 ++++++++
>  arch/arm/include/asm/fb.h                    |  6 ------
>  arch/arm/include/asm/video.h                 |  6 ++++++
>  arch/arm64/include/asm/fb.h                  | 10 ----------
>  arch/arm64/include/asm/video.h               | 10 ++++++++++
>  arch/loongarch/include/asm/{fb.h => video.h} |  8 ++++----
>  arch/m68k/include/asm/{fb.h => video.h}      |  8 ++++----
>  arch/mips/include/asm/{fb.h => video.h}      | 12 ++++++------
>  arch/parisc/include/asm/{fb.h => video.h}    |  8 ++++----
>  arch/parisc/video/Makefile                   |  2 +-
>  arch/parisc/video/{fbdev.c => video-sti.c}   |  2 +-
>  arch/powerpc/include/asm/{fb.h => video.h}   |  8 ++++----
>  arch/powerpc/kernel/pci-common.c             |  2 +-
>  arch/sh/include/asm/fb.h                     |  7 -------
>  arch/sh/include/asm/video.h                  |  7 +++++++
>  arch/sparc/include/asm/{fb.h => video.h}     |  8 ++++----
>  arch/sparc/video/Makefile                    |  2 +-
>  arch/sparc/video/{fbdev.c => video.c}        |  4 ++--
>  arch/x86/include/asm/{fb.h => video.h}       |  8 ++++----
>  arch/x86/video/Makefile                      |  2 +-
>  arch/x86/video/{fbdev.c => video.c}          |  3 ++-
>  include/asm-generic/Kbuild                   |  2 +-
>  include/asm-generic/{fb.h => video.h}        |  6 +++---
>  include/linux/fb.h                           |  2 +-
>  25 files changed, 75 insertions(+), 74 deletions(-)
>  delete mode 100644 arch/arc/include/asm/fb.h
>  create mode 100644 arch/arc/include/asm/video.h
>  delete mode 100644 arch/arm/include/asm/fb.h
>  create mode 100644 arch/arm/include/asm/video.h
>  delete mode 100644 arch/arm64/include/asm/fb.h
>  create mode 100644 arch/arm64/include/asm/video.h
>  rename arch/loongarch/include/asm/{fb.h => video.h} (86%)
>  rename arch/m68k/include/asm/{fb.h => video.h} (86%)
>  rename arch/mips/include/asm/{fb.h => video.h} (76%)
>  rename arch/parisc/include/asm/{fb.h => video.h} (68%)
>  rename arch/parisc/video/{fbdev.c => video-sti.c} (96%)
>  rename arch/powerpc/include/asm/{fb.h => video.h} (76%)
>  delete mode 100644 arch/sh/include/asm/fb.h
>  create mode 100644 arch/sh/include/asm/video.h
>  rename arch/sparc/include/asm/{fb.h => video.h} (89%)
>  rename arch/sparc/video/{fbdev.c => video.c} (86%)
>  rename arch/x86/include/asm/{fb.h => video.h} (77%)
>  rename arch/x86/video/{fbdev.c => video.c} (97%)
>  rename include/asm-generic/{fb.h => video.h} (96%)
> 
> diff --git a/arch/arc/include/asm/fb.h b/arch/arc/include/asm/fb.h
> deleted file mode 100644
> index 9c2383d29cbb9..0000000000000
> --- a/arch/arc/include/asm/fb.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> -
> -#include <asm-generic/fb.h>
> -
> -#endif /* _ASM_FB_H_ */
> diff --git a/arch/arc/include/asm/video.h b/arch/arc/include/asm/video.h
> new file mode 100644
> index 0000000000000..8ff7263727fe7
> --- /dev/null
> +++ b/arch/arc/include/asm/video.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
> +
> +#include <asm-generic/video.h>
> +
> +#endif /* _ASM_VIDEO_H_ */

arch/arc/include/asm/video.h only exists to pick
include/asm-generic/video.h.

The simpler way to do this is to add a line to:
arch/arc/include/asm/Kbuild:
+ generic-y += video.h

While touching the file I suggest to move to the simpler way using the
Kbuild file.

The same goes for all the other video.h files that only picks the
asm-generic variant.




> diff --git a/arch/arm/include/asm/fb.h b/arch/arm/include/asm/fb.h
> deleted file mode 100644
> index ce20a43c30339..0000000000000
> --- a/arch/arm/include/asm/fb.h
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> -
> -#include <asm-generic/fb.h>
> -
> -#endif /* _ASM_FB_H_ */
> diff --git a/arch/arm/include/asm/video.h b/arch/arm/include/asm/video.h
> new file mode 100644
> index 0000000000000..f570565366e67
> --- /dev/null
> +++ b/arch/arm/include/asm/video.h
> @@ -0,0 +1,6 @@
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
> +
> +#include <asm-generic/video.h>
> +
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/arm64/include/asm/fb.h b/arch/arm64/include/asm/fb.h
> deleted file mode 100644
> index 1a495d8fb2ce0..0000000000000
> --- a/arch/arm64/include/asm/fb.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2012 ARM Ltd.
> - */
> -#ifndef __ASM_FB_H_
> -#define __ASM_FB_H_
> -
> -#include <asm-generic/fb.h>
> -
> -#endif /* __ASM_FB_H_ */
> diff --git a/arch/arm64/include/asm/video.h b/arch/arm64/include/asm/video.h
> new file mode 100644
> index 0000000000000..fe0e74983f4d9
> --- /dev/null
> +++ b/arch/arm64/include/asm/video.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + */
> +#ifndef __ASM_VIDEO_H_
> +#define __ASM_VIDEO_H_
> +
> +#include <asm-generic/video.h>
> +
> +#endif /* __ASM_VIDEO_H_ */
> diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/video.h
> similarity index 86%
> rename from arch/loongarch/include/asm/fb.h
> rename to arch/loongarch/include/asm/video.h
> index 0b218b10a9ec3..9f76845f2d4fd 100644
> --- a/arch/loongarch/include/asm/fb.h
> +++ b/arch/loongarch/include/asm/video.h
> @@ -2,8 +2,8 @@
>  /*
>   * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
>   */
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
>  
>  #include <linux/compiler.h>
>  #include <linux/string.h>
> @@ -26,6 +26,6 @@ static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
>  }
>  #define fb_memset fb_memset_io
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_FB_H_ */
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/m68k/include/asm/fb.h b/arch/m68k/include/asm/video.h
> similarity index 86%
> rename from arch/m68k/include/asm/fb.h
> rename to arch/m68k/include/asm/video.h
> index 9941b7434b696..6cf2194c413d8 100644
> --- a/arch/m68k/include/asm/fb.h
> +++ b/arch/m68k/include/asm/video.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
>  
>  #include <asm/page.h>
>  #include <asm/setup.h>
> @@ -27,6 +27,6 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
>  }
>  #define pgprot_framebuffer pgprot_framebuffer
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_FB_H_ */
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/mips/include/asm/fb.h b/arch/mips/include/asm/video.h
> similarity index 76%
> rename from arch/mips/include/asm/fb.h
> rename to arch/mips/include/asm/video.h
> index d98d6681d64ec..007c106d980fd 100644
> --- a/arch/mips/include/asm/fb.h
> +++ b/arch/mips/include/asm/video.h
> @@ -1,5 +1,5 @@
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
>  
>  #include <asm/page.h>
>  
> @@ -13,8 +13,8 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
>  
>  /*
>   * MIPS doesn't define __raw_ I/O macros, so the helpers
> - * in <asm-generic/fb.h> don't generate fb_readq() and
> - * fb_write(). We have to provide them here.
> + * in <asm-generic/video.h> don't generate fb_readq() and
> + * fb_writeq(). We have to provide them here.
>   *
>   * TODO: Convert MIPS to generic I/O. The helpers below can
>   *       then be removed.
> @@ -33,6 +33,6 @@ static inline void fb_writeq(u64 b, volatile void __iomem *addr)
>  #define fb_writeq fb_writeq
>  #endif
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_FB_H_ */
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/parisc/include/asm/fb.h b/arch/parisc/include/asm/video.h
> similarity index 68%
> rename from arch/parisc/include/asm/fb.h
> rename to arch/parisc/include/asm/video.h
> index ed2a195a3e762..c5dff3223194a 100644
> --- a/arch/parisc/include/asm/fb.h
> +++ b/arch/parisc/include/asm/video.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
>  
>  #include <linux/types.h>
>  
> @@ -11,6 +11,6 @@ bool video_is_primary_device(struct device *dev);
>  #define video_is_primary_device video_is_primary_device
>  #endif
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_FB_H_ */
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/parisc/video/Makefile b/arch/parisc/video/Makefile
> index 16a73cce46612..b5db5b42880f8 100644
> --- a/arch/parisc/video/Makefile
> +++ b/arch/parisc/video/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-$(CONFIG_STI_CORE) += fbdev.o
> +obj-$(CONFIG_STI_CORE) += video-sti.o
> diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/video-sti.c
> similarity index 96%
> rename from arch/parisc/video/fbdev.c
> rename to arch/parisc/video/video-sti.c
> index 540fa0c919d59..564661e87093c 100644
> --- a/arch/parisc/video/fbdev.c
> +++ b/arch/parisc/video/video-sti.c
> @@ -9,7 +9,7 @@
>  
>  #include <video/sticore.h>
>  
> -#include <asm/fb.h>
> +#include <asm/video.h>
>  
>  bool video_is_primary_device(struct device *dev)
>  {
> diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/video.h
> similarity index 76%
> rename from arch/powerpc/include/asm/fb.h
> rename to arch/powerpc/include/asm/video.h
> index c0c5d1df7ad1e..e1770114ffc36 100644
> --- a/arch/powerpc/include/asm/fb.h
> +++ b/arch/powerpc/include/asm/video.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
>  
>  #include <asm/page.h>
>  
> @@ -12,6 +12,6 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
>  }
>  #define pgprot_framebuffer pgprot_framebuffer
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_FB_H_ */
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index d95a48eff412e..eac84d687b53f 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -517,7 +517,7 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma)
>  }
>  
>  /*
> - * This one is used by /dev/mem and fbdev who have no clue about the
> + * This one is used by /dev/mem and video who have no clue about the
>   * PCI device, it tries to find the PCI device first and calls the
>   * above routine
>   */
> diff --git a/arch/sh/include/asm/fb.h b/arch/sh/include/asm/fb.h
> deleted file mode 100644
> index 19df13ee9ca73..0000000000000
> --- a/arch/sh/include/asm/fb.h
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_FB_H_
> -#define _ASM_FB_H_
> -
> -#include <asm-generic/fb.h>
> -
> -#endif /* _ASM_FB_H_ */
> diff --git a/arch/sh/include/asm/video.h b/arch/sh/include/asm/video.h
> new file mode 100644
> index 0000000000000..14f49934a247a
> --- /dev/null
> +++ b/arch/sh/include/asm/video.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_VIDEO_H_
> +#define _ASM_VIDEO_H_
> +
> +#include <asm-generic/video.h>
> +
> +#endif /* _ASM_VIDEO_H_ */
> diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/video.h
> similarity index 89%
> rename from arch/sparc/include/asm/fb.h
> rename to arch/sparc/include/asm/video.h
> index 07f0325d6921c..a6f48f52db584 100644
> --- a/arch/sparc/include/asm/fb.h
> +++ b/arch/sparc/include/asm/video.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _SPARC_FB_H_
> -#define _SPARC_FB_H_
> +#ifndef _SPARC_VIDEO_H_
> +#define _SPARC_VIDEO_H_
>  
>  #include <linux/io.h>
>  #include <linux/types.h>
> @@ -40,6 +40,6 @@ static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
>  }
>  #define fb_memset fb_memset_io
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _SPARC_FB_H_ */
> +#endif /* _SPARC_VIDEO_H_ */
> diff --git a/arch/sparc/video/Makefile b/arch/sparc/video/Makefile
> index 9dd82880a027a..fdf83a408d750 100644
> --- a/arch/sparc/video/Makefile
> +++ b/arch/sparc/video/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-y	+= fbdev.o
> +obj-y	+= video.o
> diff --git a/arch/sparc/video/fbdev.c b/arch/sparc/video/video.c
> similarity index 86%
> rename from arch/sparc/video/fbdev.c
> rename to arch/sparc/video/video.c
> index e46f0499c2774..2414380caadc9 100644
> --- a/arch/sparc/video/fbdev.c
> +++ b/arch/sparc/video/video.c
> @@ -4,8 +4,8 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  
> -#include <asm/fb.h>
>  #include <asm/prom.h>
> +#include <asm/video.h>
>  
>  bool video_is_primary_device(struct device *dev)
>  {
> @@ -21,5 +21,5 @@ bool video_is_primary_device(struct device *dev)
>  }
>  EXPORT_SYMBOL(video_is_primary_device);
>  
> -MODULE_DESCRIPTION("Sparc fbdev helpers");
> +MODULE_DESCRIPTION("Sparc video helpers");
>  MODULE_LICENSE("GPL");
video.c is always built-in, so the MODULE_ things can be dropped.
That is an unrelated clean-up so should not be part of this patch.


> diff --git a/arch/x86/include/asm/fb.h b/arch/x86/include/asm/video.h
> similarity index 77%
> rename from arch/x86/include/asm/fb.h
> rename to arch/x86/include/asm/video.h
> index 999db33792869..0950c9535fae9 100644
> --- a/arch/x86/include/asm/fb.h
> +++ b/arch/x86/include/asm/video.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_FB_H
> -#define _ASM_X86_FB_H
> +#ifndef _ASM_X86_VIDEO_H
> +#define _ASM_X86_VIDEO_H
>  
>  #include <linux/types.h>
>  
> @@ -16,6 +16,6 @@ pgprot_t pgprot_framebuffer(pgprot_t prot,
>  bool video_is_primary_device(struct device *dev);
>  #define video_is_primary_device video_is_primary_device
>  
> -#include <asm-generic/fb.h>
> +#include <asm-generic/video.h>
>  
> -#endif /* _ASM_X86_FB_H */
> +#endif /* _ASM_X86_VIDEO_H */
> diff --git a/arch/x86/video/Makefile b/arch/x86/video/Makefile
> index 9dd82880a027a..fdf83a408d750 100644
> --- a/arch/x86/video/Makefile
> +++ b/arch/x86/video/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-y	+= fbdev.o
> +obj-y	+= video.o
> diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/video.c
> similarity index 97%
> rename from arch/x86/video/fbdev.c
> rename to arch/x86/video/video.c
> index 4d87ce8e257fe..81fc97a2a837a 100644
> --- a/arch/x86/video/fbdev.c
> +++ b/arch/x86/video/video.c
> @@ -10,7 +10,8 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/vgaarb.h>
> -#include <asm/fb.h>
> +
> +#include <asm/video.h>
>  
>  pgprot_t pgprot_framebuffer(pgprot_t prot,
>  			    unsigned long vm_start, unsigned long vm_end,
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index d436bee4d129d..b20fa25a7e8d8 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -22,7 +22,6 @@ mandatory-y += dma-mapping.h
>  mandatory-y += dma.h
>  mandatory-y += emergency-restart.h
>  mandatory-y += exec.h
> -mandatory-y += fb.h
>  mandatory-y += ftrace.h
>  mandatory-y += futex.h
>  mandatory-y += hardirq.h
> @@ -62,5 +61,6 @@ mandatory-y += uaccess.h
>  mandatory-y += unaligned.h
>  mandatory-y += vermagic.h
>  mandatory-y += vga.h
> +mandatory-y += video.h
>  mandatory-y += word-at-a-time.h
>  mandatory-y += xor.h
> diff --git a/include/asm-generic/fb.h b/include/asm-generic/video.h
> similarity index 96%
> rename from include/asm-generic/fb.h
> rename to include/asm-generic/video.h
> index 4788c1e1c6bc0..b1da2309d9434 100644
> --- a/include/asm-generic/fb.h
> +++ b/include/asm-generic/video.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  
> -#ifndef __ASM_GENERIC_FB_H_
> -#define __ASM_GENERIC_FB_H_
> +#ifndef __ASM_GENERIC_VIDEO_H_
> +#define __ASM_GENERIC_VIDEO_H_
>  
>  /*
>   * Only include this header file from your architecture's <asm/fb.h>.
> @@ -133,4 +133,4 @@ static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
>  #define fb_memset fb_memset_io
>  #endif
>  
> -#endif /* __ASM_GENERIC_FB_H_ */
> +#endif /* __ASM_GENERIC_VIDEO_H_ */
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 708e6a177b1be..1f23e0c505424 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -12,7 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> -#include <asm/fb.h>
> +#include <asm/video.h>
>  
>  struct backlight_device;
>  struct device;
> -- 
> 2.44.0
> 

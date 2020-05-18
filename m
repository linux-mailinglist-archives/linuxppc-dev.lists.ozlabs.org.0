Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A61D71DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 09:32:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QW1M0vbrzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 17:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QVzd6W8GzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 17:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L+l/iVU2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QVzb1NrSz9sTC;
 Mon, 18 May 2020 17:30:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589787036;
 bh=MDlXD/dXZ4SIz/zEFqjB97s8wYmIXZm8GHRLFeTWLX8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L+l/iVU2gWPCIGALPHaECZGRU2y04a2OR6TKjipLsWcUM7Lbv+jnsNiC6OWf2/yyM
 6P95PMDpVoO/jcc53b3ysZ6L0PjqgrnldQwNWD6zEiPzaHTpQCgRYmmAfBEitEFx8u
 6AFGOR/UDa7EiHPHNLpWXCBh0VPywjQi8hZQl9JbPs2iV/IuoAY6yQcxBk2Wcz6USx
 6dVX4u0CJG0lB/uZNGTrziAn2+5PZi//WwVSZwK9WqklikDa3XDa8zkOlgvCWf29pu
 kGnBIhjZwVUSh5GE6+6oJMMxzI3q+faER2cErx/SWGYqXg0R7sM3AeNmxZkyiIJOi+
 2I15aoQJANd0g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
In-Reply-To: <20200517220524.4036334-2-emil.l.velikov@gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 17:30:53 +1000
Message-ID: <87d071aedu.fsf@mpe.ellerman.id.au>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, emil.l.velikov@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Emil Velikov <emil.l.velikov@gmail.com> writes:
> As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> seen no love over the years, are short on features and overall below par
>
> Users are encouraged to switch to the nouveau drm driver instead.
>
> v2: Split configs to separate patch, enable nouveau (Bartlomiej)
>
> Cc: Antonino Daplas <adaplas@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> ---
> Hi all unless, there are objections I would prefer to merge this via
> the drm tree.

Have you tested that the resulting kernels work on the relevant
hardware?

The old drivers may be crufty but they presumably have been tested by
people and at least somewhat work.

So I'd be inclined to leave the defconfigs alone until someone can test
that the new driver works at all.

I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
errors in it (see below). I can't actually tell if the display is
working because the machine is remote, and I can't go and check it at
the moment because the office is closed.

cheers


[  128.563251] nouveau 0000:f0:10.0: NVIDIA NV34 (034900b1)
[  128.565720] nouveau 0000:f0:10.0: bios: version 04.34.20.18.00
[  128.570994] nouveau 0000:f0:10.0: bios: OOB 1 00000cdd 00000cdd
[  128.571702] nouveau 0000:f0:10.0: bios: OOB 1 00000ce1 00000ce1
[  128.571723] nouveau 0000:f0:10.0: bios: OOB 1 00000cde 00000cde
[  128.571731] nouveau 0000:f0:10.0: bios: OOB 1 00000cdf 00000cdf
[  128.572438] nouveau 0000:f0:10.0: bios: OOB 1 00000ce5 00000ce5
[  128.572459] nouveau 0000:f0:10.0: bios: OOB 1 00000ce2 00000ce2
[  128.572468] nouveau 0000:f0:10.0: bios: OOB 1 00000ce3 00000ce3
[  128.579187] nouveau 0000:f0:10.0: bios: OOB 1 00000ce9 00000ce9
[  128.579210] nouveau 0000:f0:10.0: bios: OOB 1 00000ce6 00000ce6
[  128.579219] nouveau 0000:f0:10.0: bios: OOB 1 00000ce7 00000ce7
[  128.580230] nouveau 0000:f0:10.0: bios: OOB 1 00000ced 00000ced
[  128.580252] nouveau 0000:f0:10.0: bios: OOB 1 00000cea 00000cea
[  128.580261] nouveau 0000:f0:10.0: bios: OOB 1 00000ceb 00000ceb
[  128.581543] nouveau 0000:f0:10.0: bios: OOB 1 00000cf1 00000cf1
[  128.581567] nouveau 0000:f0:10.0: bios: OOB 1 00000cee 00000cee
[  128.581576] nouveau 0000:f0:10.0: bios: OOB 1 00000cef 00000cef
[  128.582456] nouveau 0000:f0:10.0: bios: OOB 1 00000cf5 00000cf5
[  128.582479] nouveau 0000:f0:10.0: bios: OOB 1 00000cf2 00000cf2
[  128.582487] nouveau 0000:f0:10.0: bios: OOB 1 00000cf3 00000cf3
[  128.583314] nouveau 0000:f0:10.0: bios: OOB 1 00000cf9 00000cf9
[  128.583336] nouveau 0000:f0:10.0: bios: OOB 1 00000cf6 00000cf6
[  128.583344] nouveau 0000:f0:10.0: bios: OOB 1 00000cf7 00000cf7
[  128.584186] nouveau 0000:f0:10.0: bios: OOB 1 00000cfd 00000cfd
[  128.584208] nouveau 0000:f0:10.0: bios: OOB 1 00000cfa 00000cfa
[  128.584217] nouveau 0000:f0:10.0: bios: OOB 1 00000cfb 00000cfb
[  128.585635] nouveau 0000:f0:10.0: bios: OOB 1 00000d01 00000d01
[  128.585658] nouveau 0000:f0:10.0: bios: OOB 1 00000cfe 00000cfe
[  128.585666] nouveau 0000:f0:10.0: bios: OOB 1 00000cff 00000cff
[  128.589405] nouveau 0000:f0:10.0: bios: OOB 1 00000d05 00000d05
[  128.589428] nouveau 0000:f0:10.0: bios: OOB 1 00000d02 00000d02
[  128.589436] nouveau 0000:f0:10.0: bios: OOB 1 00000d03 00000d03
[  128.590316] nouveau 0000:f0:10.0: bios: OOB 1 00000d09 00000d09
[  128.590338] nouveau 0000:f0:10.0: bios: OOB 1 00000d06 00000d06
[  128.590346] nouveau 0000:f0:10.0: bios: OOB 1 00000d07 00000d07
[  128.591173] nouveau 0000:f0:10.0: bios: OOB 1 00000d0d 00000d0d
[  128.591196] nouveau 0000:f0:10.0: bios: OOB 1 00000d0a 00000d0a
[  128.591205] nouveau 0000:f0:10.0: bios: OOB 1 00000d0b 00000d0b
[  128.593513] nouveau 0000:f0:10.0: tmr: unknown input clock freq
[  128.595886] nouveau 0000:f0:10.0: fb: 64 MiB DDR1
[  128.609034] [TTM] Zone  kernel: Available graphics memory: 500010 KiB
[  128.609058] [TTM] Initializing pool allocator
[  128.609106] nouveau 0000:f0:10.0: DRM: VRAM: 63 MiB
[  128.609115] nouveau 0000:f0:10.0: DRM: GART: 128 MiB
[  128.609134] nouveau 0000:f0:10.0: DRM: BMP version 5.38
[  128.609144] nouveau 0000:f0:10.0: DRM: DCB version 2.2
[  128.609155] nouveau 0000:f0:10.0: DRM: DCB outp 00: 01000122 00000004
[  128.609168] nouveau 0000:f0:10.0: DRM: DCB outp 01: 02010200 11b088b8
[  128.609177] nouveau 0000:f0:10.0: DRM: DCB outp 02: 02010201 11b00703
[  128.609222] nouveau 0000:f0:10.0: DRM: Loading NV17 power sequencing microcode
[  128.610947] nouveau 0000:f0:10.0: DRM: MM: using M2MF for buffer copies
[  128.613371] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  128.615065] nouveau 0000:f0:10.0: DRM: Setting dpms mode 3 on TV encoder (output 2)
[  128.707050] nouveau 0000:f0:10.0: TV-1: EDID is invalid:
[  128.707075]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707083]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707091]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707099]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707106]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707114]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707121]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707129]  [00] ZERO 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  128.707144] nouveau 0000:f0:10.0: DRM: DDC responded, but no EDID for TV-1
[  128.750558] nouveau 0000:f0:10.0: DRM: allocated 1440x900 fb: 0x9000, bo 000000002677d038
[  128.825341] nouveau 0000:f0:10.0: DRM: DDC responded, but no EDID for TV-1
[  128.885351] nouveau 0000:f0:10.0: DRM: Pixel clock comparison table not found
[  128.905884] Console: switching to colour frame buffer device 180x56
[  128.907251] nouveau 0000:f0:10.0: fb0: nouveaudrmfb frame buffer device
[  128.911832] [drm] Initialized nouveau 1.3.1 20120801 for 0000:f0:10.0 on minor 0
[  129.168778] nouveau 0000:f0:10.0: DRM: DDC responded, but no EDID for TV-1
[  131.014692] Adding 2947556k swap on /dev/sda4.  Priority:-2 extents:1 across:2947556k 
[  133.501059] sungem_phy: PHY ID: 4061e4, addr: 0
[  133.502214] gem 0001:03:0f.0 eth0: Found BCM5221 PHY
[  135.940863] gem 0001:03:0f.0 eth0: Link is up at 100 Mbps, full-duplex
[  135.941181] gem 0001:03:0f.0 eth0: Pause is disabled
[  136.224079] nouveau 0000:f0:10.0: DRM: DDC responded, but no EDID for TV-1
[  136.297015] nouveau 0000:f0:10.0: DRM: DDC responded, but no EDID for TV-1
[  139.465278] nouveau 0000:f0:10.0: DRM: Pixel clock comparison table not found

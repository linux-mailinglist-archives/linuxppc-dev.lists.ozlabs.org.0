Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9609C1CB21C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:43:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JY3Z5dwqzDr2m
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 00:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f43; helo=mail-qv1-xf43.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=VC30f4Kw; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JXys1yJLzDr3y
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 00:39:16 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id 59so803815qva.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 May 2020 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=Ux8aHSf0tngJTecnYTMuWyV4ISu9ejOIYJzvZliO8BI=;
 b=VC30f4Kw3ceH5+WduVix2Cb0phPBItfc6wsXqnX9rsfNwftioHKoEmijz2Auh3jw7f
 ZYNxePAeSluFW5F26pezuFkjhU2K2FBb5BAFFO874juGjdFVsTtg4XS3CfbxThK8bIcg
 EKYlzJWm5bU15VD+rOL4GEvyJMPc9mPjjzrSFUu/fPEVNOPho7N8z1LGFNaCy8YoNldF
 1077EvskSJm+ViJoCmMpeK0yzO0SA36V09qV1BVthZ8ivyHfNz6/0Th4lY/yv3IevcIW
 RAHrJgqvPy+nQk1F/PztjBkKJhdkLVrt3IT1fyMp7XsY4/tXEpexOG4b/ao6uIMFUX9R
 XQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=Ux8aHSf0tngJTecnYTMuWyV4ISu9ejOIYJzvZliO8BI=;
 b=sHs+yDvNQbCdMxf7os+h2I3vKKkOv8Lk41I63OdPnvxvs5BseqJfItIIwyuqGHlrX/
 i28msLb7OnfJ8J2D+zqnE4NHKujkHteh+XsERnf3LYrr6yY6vGaKvR/X1ezMK6p+b4Me
 J6dj+PAHCTOHpuDZFQ9sARoEMNIuoSdQqdCCuSyrJa8U1H689ia0Q2Tral/yKqxY9Dcg
 wCXlpx5mh8iy7e8Md7Qkpu+NQkc3Zj1LofAZj3Sk+aWUopima+NyYtYMy0zDK0KQBgke
 uAIGGgYpYamrny1aAO404BzXl4a4ToXl9kx4suOX/2QNgyCneyzHAUm0Z5qHh/xQ786i
 Gjug==
X-Gm-Message-State: AGi0PuZSAXQK3G8tvQWQpnPTWdU7O7HHHYoklSa0/vwWF79QYLuEIcgK
 HTrz9xW+oFO9CvFxDAexgq0yzQ==
X-Google-Smtp-Source: APiQypJQJpWBIqdfFRRzIfw1vkphnfEhls4xjd8VEsFhyf9p2AutpWAn2x7kBc5amu/ixh9Yl0JL8Q==
X-Received: by 2002:ad4:4566:: with SMTP id o6mr2863473qvu.136.1588948751326; 
 Fri, 08 May 2020 07:39:11 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id d4sm1602906qtc.48.2020.05.08.07.39.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 07:39:10 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: ioremap() called early from pnv_pci_init_ioda_phb()
Message-Id: <B183CDAA-DA88-4760-9C1B-F73A8F7840E7@lca.pw>
Date: Fri, 8 May 2020 10:39:09 -0400
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 Booting POWER9 PowerNV has this message,
   =20
"ioremap() called early from pnv_pci_init_ioda_phb+0x420/0xdfc. Use =
early_ioremap() instead=E2=80=9D

but use the patch below will result in leaks because it will never call =
early_iounmap() anywhere. However, it looks me it was by design that =
phb->regs mapping would be there forever where it would be used in =
pnv_ioda_get_inval_reg(), so is just that check_early_ioremap_leak() =
initcall too strong?

--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -36,6 +36,7 @@
 #include <asm/firmware.h>
 #include <asm/pnv-pci.h>
 #include <asm/mmzone.h>
+#include <asm/early_ioremap.h>
=20
 #include <misc/cxl-base.h>
=20
@@ -3827,7 +3828,7 @@ static void __init pnv_pci_init_ioda_phb(struct =
device_node *np,
        /* Get registers */
        if (!of_address_to_resource(np, 0, &r)) {
                phb->regs_phys =3D r.start;
-               phb->regs =3D ioremap(r.start, resource_size(&r));
+               phb->regs =3D early_ioremap(r.start, resource_size(&r));
                if (phb->regs =3D=3D NULL)
                        pr_err("  Failed to map registers !\n=E2=80=9D);

[   23.080069][    T1] ------------[ cut here ]------------
[   23.080089][    T1] Debug warning: early ioremap leak of 10 areas =
detected.
[   23.080089][    T1] please boot with early_ioremap_debug and report =
the dmesg.
[   23.080157][    T1] WARNING: CPU: 4 PID: 1 at mm/early_ioremap.c:99 =
check_early_ioremap_leak+0xd4/0x108
[   23.080171][    T1] Modules linked in:
[   23.080192][    T1] CPU: 4 PID: 1 Comm: swapper/0 Not tainted =
5.7.0-rc4-next-20200508+ #4
[   23.080214][    T1] NIP:  c00000000103f2d8 LR: c00000000103f2d4 CTR: =
0000000000000000
[   23.080226][    T1] REGS: c00000003df0f860 TRAP: 0700   Not tainted  =
(5.7.0-rc4-next-20200508+)
[   23.080259][    T1] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  =
CR: 48000222  XER: 20040000
[   23.080296][    T1] CFAR: c00000000010d5a8 IRQMASK: 0=20
[   23.080296][    T1] GPR00: c00000000103f2d4 c00000003df0faf0 =
c000000001689400 0000000000000072=20
[   23.080296][    T1] GPR04: 0000000000000006 0000000000000000 =
c00000003df0f7e4 0000000000000004=20
[   23.080296][    T1] GPR08: 0000001ffbb60000 0000000000000000 =
c00000003dee6680 0000000000000002=20
[   23.080296][    T1] GPR12: 0000000000000000 c000001fffffae00 =
c000000001057860 c0000000010578b0=20
[   23.080296][    T1] GPR16: c000000001002d38 c0000000014f0660 =
c0000000014f0680 c0000000014f06a0=20
[   23.080296][    T1] GPR20: c0000000014f06c0 c0000000014f06e0 =
c0000000014f0700 c0000000014f0720=20
[   23.080296][    T1] GPR24: c000000000c4bc30 c000000486b82000 =
c0000000015a0fe0 c0000000015a0fc0=20
[   23.080296][    T1] GPR28: 0000000000000010 0000000000000010 =
c000000001061e30 000000000000000a=20
[   23.080507][    T1] NIP [c00000000103f2d8] =
check_early_ioremap_leak+0xd4/0x108
[   23.080530][    T1] LR [c00000000103f2d4] =
check_early_ioremap_leak+0xd0/0x108
[   23.080552][    T1] Call Trace:
[   23.080571][    T1] [c00000003df0faf0] [c00000000103f2d4] =
check_early_ioremap_leak+0xd0/0x108 (unreliable)
[   23.080607][    T1] [c00000003df0fb80] [c00000000001130c] =
do_one_initcall+0xcc/0x660
[   23.080648][    T1] [c00000003df0fc80] [c000000001004c18] =
kernel_init_freeable+0x480/0x568
[   23.080681][    T1] [c00000003df0fdb0] [c000000000012180] =
kernel_init+0x24/0x194
[   23.080713][    T1] [c00000003df0fe20] [c00000000000cb28] =
ret_from_kernel_thread+0x5c/0x74

This is from the early_ioremap_debug dmesg.

[    0.000000][    T0] ------------[ cut here ]------------
[    0.000000][    T0] __early_ioremap(0x000600c3c0010000, 00010000) [0] =
=3D> 00000000 + ffffffffffbe0000
[    0.000000][    T0] WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:162 =
__early_ioremap+0x2d8/0x408
[    0.000000][    T0] Modules linked in:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted =
5.7.0-rc4-next-20200508+ #4
[    0.000000][    T0] NIP:  c00000000103f5e4 LR: c00000000103f5e0 CTR: =
c0000000001e77f0
[    0.000000][    T0] REGS: c00000000168f980 TRAP: 0700   Not tainted  =
(5.7.0-rc4-next-20200508+)
[    0.000000][    T0] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  =
CR: 28000248  XER: 20040000
[    0.000000][    T0] CFAR: c00000000010d5a8 IRQMASK: 1=20
[    0.000000][    T0] GPR00: c00000000103f5e0 c00000000168fc10 =
c000000001689400 0000000000000050=20
[    0.000000][    T0] GPR04: c00000000152f6f8 0000000000000000 =
c00000000168f904 0000000000000000=20
[    0.000000][    T0] GPR08: 0000000000000000 0000000000000000 =
c00000000162f600 0000000000000002=20
[    0.000000][    T0] GPR12: c0000000001e77f0 c000000005b30000 =
0000000000000000 0000000000000000=20
[    0.000000][    T0] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000001000=20
[    0.000000][    T0] GPR20: 0000000000000000 80000000000001ae =
0000000000000000 0000000000000000=20
[    0.000000][    T0] GPR24: 0000000000010000 c000000001061da8 =
0000000000000008 0000000000000008=20
[    0.000000][    T0] GPR28: 0000000000000000 c000000001061db0 =
0000000000000000 c000000001061eb8=20
[    0.000000][    T0] NIP [c00000000103f5e4] =
__early_ioremap+0x2d8/0x408
[    0.000000][    T0] LR [c00000000103f5e0] __early_ioremap+0x2d4/0x408
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c00000000168fc10] [c00000000103f5e0] =
__early_ioremap+0x2d4/0x408 (unreliable)
[    0.000000][    T0] [c00000000168fcf0] [c00000000101d010] =
pnv_pci_init_ioda_phb+0x420/0xdfc
[    0.000000][    T0] [c00000000168fe10] [c00000000101c9b8] =
pnv_pci_init+0x12c/0x264
[    0.000000][    T0] [c00000000168fe40] [c000000001016c40] =
pnv_setup_arch+0x2e4/0x330
[    0.000000][    T0] [c00000000168fe80] [c000000001009dd0] =
setup_arch+0x3a0/0x3ec
[    0.000000][    T0] [c00000000168fef0] [c000000001003ed0] =
start_kernel+0xb0/0x978
[    0.000000][    T0] [c00000000168ff90] [c00000000000c790] =
start_here_common+0x1c/0x8c
[    0.000000][    T0] Instruction dump:
[    0.000000][    T0] 7d39ba14 3c82ff3c 3c62ff54 7f06c378 7f88e378 =
7fc7f378 38a10068 e9290110=20
[    0.000000][    T0] 38849e90 3863e8f0 4b0cdf65 60000000 <0fe00000> =
2bbe000f 409d0018 3c62fff1=20
[    0.000000][    T0] irq event stamp: 0
[    0.000000][    T0] hardirqs last  enabled at (0): =
[<0000000000000000>] 0x0
[    0.000000][    T0] hardirqs last disabled at (0): =
[<0000000000000000>] 0x0
[    0.000000][    T0] softirqs last  enabled at (0): =
[<0000000000000000>] 0x0
[    0.000000][    T0] softirqs last disabled at (0): =
[<0000000000000000>] 0x0


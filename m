Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E831CB631
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 19:43:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Jd3R2w4KzDrK3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 03:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=JSzz8m5W; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jd1J2XChzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 03:41:39 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id o10so1961523qtr.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 May 2020 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lzCtOIL3fxtsc/ggQXBCCYm99v70Qawfxe/OIhcK9z8=;
 b=JSzz8m5WGwPSwYyNSH3WtmDa5URhF27fsXH1zxj47ud+1QYMtKsvmqHWPJrvTvM0KG
 4WUO6OpfnxvnmAUMaJxFkrEqGS0QLk4oFlvjw6Nf07edab4NSpc/6VEup2TLOujXCvBV
 kpkOw+Z6T8K78OqkXspMsIzntGGhFHU8s94bnjcw6hRtO3pGp80aPBe9mxJm/vciAFdM
 IZjgnM4hyB98QSaYqpO0pGFmvKvUhxU4euDx4ObN6R4tbEKTJaB41i4rFYlm+I3VbC95
 ekZ9VbILykgYDv9JjcyxJRGFdbaLTNYmMtDM1npm11Rx84d/8WW/0CbJXybKI3G1PioK
 VlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lzCtOIL3fxtsc/ggQXBCCYm99v70Qawfxe/OIhcK9z8=;
 b=SLvH401Hxn4h/qxkP5A1U+RjOhjmx7fDMPHOPjfVAzMw6SPNc/fvLGtQJCJUNvhQ7V
 IieyXBO1h09nFO+jN9LZTnLKxA4hY2xTnSEsIu4JNPajItyAq8h0EYgFRg8Xxnh0cCrd
 DRWg8rCiKe6oT7/PL6fG+g1rT2ZiIxk+JAwum1IuXicZskC5coJY2/FE0JpvRqriiIsc
 RSvS9RfttZcZs0oNW+z0gfUtTbmj2ZFLpPI2mY/l5ITLjC7pOGILBOef19MEZIqqMUWi
 oK4IrqWw7/GjZPwI4x5BvmrMdQjumG4XaNLJsZk/2RjtIXkMa2W9P+NvSGLTF9HU9VAz
 dNpg==
X-Gm-Message-State: AGi0Pual/xxTzhnDnxvotZSqiiXUkRawpLmKHZgkEZHUMhT4uWvwvbfw
 4hj0Lu7d1/TaPyMUopNimAAERg==
X-Google-Smtp-Source: APiQypL1yV20iqLRxl/7nh9IVmk+OS/1WrqE9l8T9UybY0EfUBD2HkAL2WS9RF20wNvk4y1BX9/g8w==
X-Received: by 2002:ac8:51cd:: with SMTP id d13mr4238746qtn.174.1588959694892; 
 Fri, 08 May 2020 10:41:34 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id b136sm1547715qkg.86.2020.05.08.10.41.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 10:41:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: ioremap() called early from pnv_pci_init_ioda_phb()
From: Qian Cai <cai@lca.pw>
In-Reply-To: <B183CDAA-DA88-4760-9C1B-F73A8F7840E7@lca.pw>
Date: Fri, 8 May 2020 13:41:32 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <229E1896-0C06-418A-B7DE-40AEBFB44F85@lca.pw>
References: <B183CDAA-DA88-4760-9C1B-F73A8F7840E7@lca.pw>
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



> On May 8, 2020, at 10:39 AM, Qian Cai <cai@lca.pw> wrote:
>=20
> Booting POWER9 PowerNV has this message,
>=20
> "ioremap() called early from pnv_pci_init_ioda_phb+0x420/0xdfc. Use =
early_ioremap() instead=E2=80=9D
>=20
> but use the patch below will result in leaks because it will never =
call early_iounmap() anywhere. However, it looks me it was by design =
that phb->regs mapping would be there forever where it would be used in =
pnv_ioda_get_inval_reg(), so is just that check_early_ioremap_leak() =
initcall too strong?
>=20
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -36,6 +36,7 @@
> #include <asm/firmware.h>
> #include <asm/pnv-pci.h>
> #include <asm/mmzone.h>
> +#include <asm/early_ioremap.h>
>=20
> #include <misc/cxl-base.h>
>=20
> @@ -3827,7 +3828,7 @@ static void __init pnv_pci_init_ioda_phb(struct =
device_node *np,
>        /* Get registers */
>        if (!of_address_to_resource(np, 0, &r)) {
>                phb->regs_phys =3D r.start;
> -               phb->regs =3D ioremap(r.start, resource_size(&r));
> +               phb->regs =3D early_ioremap(r.start, =
resource_size(&r));
>                if (phb->regs =3D=3D NULL)
>                        pr_err("  Failed to map registers !\n=E2=80=9D);

This will also trigger a panic with debugfs reads, so isn=E2=80=99t that =
this commit bogus at least for powerpc64?

d538aadc2718 (=E2=80=9Cpowerpc/ioremap: warn on early use of ioremap()")

11017.617022][T122068] Faulting instruction address: 0xc0000000000db564
[11017.617257][T122066] Faulting instruction address: 0xc0000000000db564
[11017.617950][T122073] Faulting instruction address: 0xc0000000000db564
[11017.618888][T122064] BUG: Unable to handle kernel data access on read =
at 0xffffffffffe20e10
[11017.618935][T122064] Faulting instruction address: 0xc0000000000db564
[11017.737996][T122072]=20
[11017.738010][T122073] Oops: Kernel access of bad area, sig: 11 [#2]
[11017.738024][T122073] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11017.738051][T122073] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11017.738110][T122073] CPU: 108 PID: 122073 Comm: read_all Tainted: G   =
   D W         5.7.0-rc4-next-20200508+ #4
[11017.738138][T122073] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11017.738173][T122073] REGS: c000000374f6f980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11017.738234][T122073] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11017.738278][T122073] CFAR: c00000000056f65c IRQMASK: 0=20
[11017.738278][T122073] GPR00: c00000000056f660 c000000374f6fc10 =
c000000001689400 c000201ffc41aa00=20
[11017.738278][T122073] GPR04: c000000374f6fc70 0000000000000000 =
0000000000000000 0000000000000001=20
[11017.738278][T122073] GPR08: 0000000000000000 ffffffffffe20000 =
0000000000000000 c0000008ee380080=20
[11017.738278][T122073] GPR12: c0000000000db550 c000201fff671280 =
0000000000000000 0000000000000000=20
[11017.738278][T122073] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11017.738278][T122073] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11017.738278][T122073] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11017.738278][T122073] GPR28: c000000374f6fd90 c000200c0c6a7550 =
0000000000000000 c000200c0c6a7500=20
[11017.738542][T122073] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11017.738579][T122073] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11017.738613][T122073] Call Trace:
[11017.738645][T122073] [c000000374f6fc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11017.738672][T122073] [c000000374f6fcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11017.738686][T122073] [c000000374f6fd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11017.738722][T122073] [c000000374f6fd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11017.738757][T122073] [c000000374f6fd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11017.738818][T122073] [c000000374f6fdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11017.738867][T122073] [c000000374f6fe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11017.738916][T122073] Instruction dump:
[11017.738948][T122073] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11017.739001][T122073] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11017.739052][T122073] ---[ end trace f68728a0d3053b5e ]---
[11017.828156][T122073]=20
[11017.828170][T122068] Oops: Kernel access of bad area, sig: 11 [#3]
[11017.828184][T122068] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11017.828209][T122068] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11017.828265][T122068] CPU: 88 PID: 122068 Comm: read_all Tainted: G    =
  D W         5.7.0-rc4-next-20200508+ #4
[11017.828303][T122068] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11017.828338][T122068] REGS: c000001ea20cf980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11017.828386][T122068] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11017.828437][T122068] CFAR: c00000000056f65c IRQMASK: 0=20
[11017.828437][T122068] GPR00: c00000000056f660 c000001ea20cfc10 =
c000000001689400 c000201ffc41aa00=20
[11017.828437][T122068] GPR04: c000001ea20cfc70 0000000000000000 =
0000000000000000 0000000000000001=20
[11017.828437][T122068] GPR08: 0000000000000000 ffffffffffe20000 =
0000000000000000 c0000018930e8880=20
[11017.828437][T122068] GPR12: c0000000000db550 c000201fff691100 =
0000000000000000 0000000000000000=20
[11017.828437][T122068] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11017.828437][T122068] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11017.828437][T122068] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11017.828437][T122068] GPR28: c000001ea20cfd90 c000200c0c6a4150 =
0000000000000000 c000200c0c6a4100=20
[11017.828808][T122068] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11017.828856][T122068] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11017.828901][T122068] Call Trace:
[11017.828921][T122068] [c000001ea20cfc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11017.828983][T122068] [c000001ea20cfcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11017.829030][T122068] [c000001ea20cfd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11017.829043][T122068] [c000001ea20cfd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11017.829056][T122068] [c000001ea20cfd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11017.829116][T122068] [c000001ea20cfdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11017.829153][T122068] [c000001ea20cfe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11017.829215][T122068] Instruction dump:
[11017.829234][T122068] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11017.829264][T122068] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11017.829281][T122068] ---[ end trace f68728a0d3053b5f ]---
[11017.928173][T122068]=20
[11017.928186][T122064] Oops: Kernel access of bad area, sig: 11 [#4]
[11017.928198][T122064] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11017.928211][T122064] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11017.928263][T122064] CPU: 120 PID: 122064 Comm: read_all Tainted: G   =
   D W         5.7.0-rc4-next-20200508+ #4
[11017.928303][T122064] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11017.928351][T122064] REGS: c000000978bef980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11017.928387][T122064] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11017.928416][T122064] CFAR: c00000000056f65c IRQMASK: 0=20
[11017.928416][T122064] GPR00: c00000000056f660 c000000978befc10 =
c000000001689400 c000201ffc41aa00=20
[11017.928416][T122064] GPR04: c000000978befc70 0000000000000000 =
0000000000000000 0000000000000001=20
[11017.928416][T122064] GPR08: 0000000000000000 ffffffffffe20000 =
0000000000000000 c0000018930eaa80=20
[11017.928416][T122064] GPR12: c0000000000db550 c000201fff667c80 =
0000000000000000 0000000000000000=20
[11017.928416][T122064] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11017.928416][T122064] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11017.928416][T122064] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11017.928416][T122064] GPR28: c000000978befd90 c000200c0c6a2550 =
0000000000000000 c000200c0c6a2500=20
[11017.928630][T122064] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11017.928657][T122064] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11017.928691][T122064] Call Trace:
[11017.928711][T122064] [c000000978befc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11017.928749][T122064] [c000000978befcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11017.928810][T122064] [c000000978befd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11017.928845][T122064] [c000000978befd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11017.928896][T122064] [c000000978befd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11017.928946][T122064] [c000000978befdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11017.928982][T122064] [c000000978befe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11017.928994][T122064] Instruction dump:
[11017.929014][T122064] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11017.929068][T122064] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11017.929085][T122064] ---[ end trace f68728a0d3053b60 ]---
[11018.018131][T122064]=20
[11018.018143][T122067] Oops: Kernel access of bad area, sig: 11 [#5]
[11018.018155][T122067] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11018.018178][T122067] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11018.018231][T122067] CPU: 60 PID: 122067 Comm: read_all Tainted: G    =
  D W         5.7.0-rc4-next-20200508+ #4
[11018.018254][T122067] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11018.018275][T122067] REGS: c000000e5a06f980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11018.018307][T122067] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11018.018336][T122067] CFAR: c00000000056f65c IRQMASK: 0=20
[11018.018336][T122067] GPR00: c00000000056f660 c000000e5a06fc10 =
c000000001689400 c000201ffc41aa00=20
[11018.018336][T122067] GPR04: c000000e5a06fc70 0000000000000000 =
0000000000000000 0000000000000001=20
[11018.018336][T122067] GPR08: 0000000000000000 ffffffffffe20000 =
0000000000000000 c0000018930ecc80=20
[11018.018336][T122067] GPR12: c0000000000db550 c000001ffffcf200 =
0000000000000000 0000000000000000=20
[11018.018336][T122067] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11018.018336][T122067] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11018.018336][T122067] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11018.018336][T122067] GPR28: c000000e5a06fd90 c000000007de7550 =
0000000000000000 c000000007de7500=20
[11018.018552][T122067] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11018.018574][T122067] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11018.018602][T122067] Call Trace:
[11018.018619][T122067] [c000000e5a06fc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11018.018652][T122067] [c000000e5a06fcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11018.018674][T122067] [c000000e5a06fd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11018.018686][T122067] [c000000e5a06fd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11018.018716][T122067] [c000000e5a06fd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11018.018747][T122067] [c000000e5a06fdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11018.018779][T122067] [c000000e5a06fe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11018.018808][T122067] Instruction dump:
[11018.018825][T122067] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11018.018850][T122067] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11018.018875][T122067] ---[ end trace f68728a0d3053b61 ]---
[11018.108865][T122067]=20
[11018.108875][T122070] Oops: Kernel access of bad area, sig: 11 [#6]
[11018.108887][T122070] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11018.108909][T122070] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11018.108949][T122070] CPU: 36 PID: 122070 Comm: read_all Tainted: G    =
  D W         5.7.0-rc4-next-20200508+ #4
[11018.108981][T122070] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11018.109002][T122070] REGS: c000000a3628f980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11018.109043][T122070] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11018.109077][T122070] CFAR: c00000000056f65c IRQMASK: 0=20
[11018.109077][T122070] GPR00: c00000000056f660 c000000a3628fc10 =
c000000001689400 c000201ffc41aa00=20
[11018.109077][T122070] GPR04: c000000a3628fc70 0000000000000000 =
0000000000000000 0000000000000001=20
[11018.109077][T122070] GPR08: 0000000000000000 ffffffffffe20000 =
0000000000000000 c0000008ee384480=20
[11018.109077][T122070] GPR12: c0000000000db550 c000001ffffe1e00 =
0000000000000000 0000000000000000=20
[11018.109077][T122070] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11018.109077][T122070] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11018.109077][T122070] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11018.109077][T122070] GPR28: c000000a3628fd90 c0000002f5243950 =
0000000000000000 c0000002f5243900=20
[11018.109256][T122070] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11018.109277][T122070] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11018.109296][T122070] Call Trace:
[11018.109314][T122070] [c000000a3628fc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11018.109346][T122070] [c000000a3628fcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11018.109377][T122070] [c000000a3628fd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11018.109417][T122070] [c000000a3628fd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11018.109447][T122070] [c000000a3628fd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11018.109478][T122070] [c000000a3628fdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11018.109510][T122070] [c000000a3628fe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11018.109548][T122070] Instruction dump:
[11018.109565][T122070] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11018.109599][T122070] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11018.109628][T122070] ---[ end trace f68728a0d3053b62 ]---
[11018.238625][T122070]=20
[11018.238635][T122069] Oops: Kernel access of bad area, sig: 11 [#7]
[11018.238646][T122069] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D256 =
DEBUG_PAGEALLOC NUMA PowerNV
[11018.238668][T122069] Modules linked in: brd ext4 crc16 mbcache jbd2 =
loop kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci libahci tg3 =
mdio libata libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[11018.238708][T122069] CPU: 48 PID: 122069 Comm: read_all Tainted: G    =
  D W         5.7.0-rc4-next-20200508+ #4
[11018.238732][T122069] NIP:  c0000000000db564 LR: c00000000056f660 CTR: =
c0000000000db550
[11018.238761][T122069] REGS: c000001bf2e8f980 TRAP: 0380   Tainted: G   =
   D W          (5.7.0-rc4-next-20200508+)
[11018.238793][T122069] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE> =
 CR: 22002282  XER: 20040000
[11018.238827][T122069] CFAR: c00000000056f65c IRQMASK: 0=20
[11018.238827][T122069] GPR00: c00000000056f660 c000001bf2e8fc10 =
c000000001689400 c000201ffc41aa00=20
[11018.238827][T122069] GPR04: c000001bf2e8fc70 0000000000000000 =
000000001ab703be ffffffff00018a2f=20
[11018.238827][T122069] GPR08: 000000006c4a22da ffffffffffe20000 =
0000000000000000 0000000000000002=20
[11018.238827][T122069] GPR12: c0000000000db550 c000001ffffd8800 =
0000000000000000 0000000000000000=20
[11018.238827][T122069] GPR16: 0000000000000002 0000000010040800 =
000000001001ccd8 000000001001cc80=20
[11018.238827][T122069] GPR20: 000000001001cc98 000000001001ccc8 =
000000001001cca8 000000001001cb48=20
[11018.238827][T122069] GPR24: 0000000000000000 0000000000000000 =
00000000000003ff 00007fffebb67390=20
[11018.238827][T122069] GPR28: c000001bf2e8fd90 c0000015bff0c950 =
0000000000000000 c0000015bff0c900=20
[11018.239055][T122069] NIP [c0000000000db564] =
pnv_eeh_dbgfs_get_inbB+0x14/0x30
[11018.239086][T122069] LR [c00000000056f660] =
simple_attr_read+0xa0/0x180
[11018.239105][T122069] Call Trace:
[11018.239122][T122069] [c000001bf2e8fc10] [c00000000056f630] =
simple_attr_read+0x70/0x180 (unreliable)
[11018.239155][T122069] [c000001bf2e8fcb0] [c00000000064a2e0] =
full_proxy_read+0x90/0xe0
[11018.239186][T122069] [c000001bf2e8fd00] [c00000000051fe0c] =
__vfs_read+0x3c/0x70
[11018.239207][T122069] [c000001bf2e8fd20] [c00000000051feec] =
vfs_read+0xac/0x170
[11018.239228][T122069] [c000001bf2e8fd70] [c00000000052034c] =
ksys_read+0x7c/0x140
[11018.239240][T122069] [c000001bf2e8fdc0] [c000000000038af4] =
system_call_exception+0x114/0x1e0
[11018.239272][T122069] [c000001bf2e8fe20] [c00000000000c8f0] =
system_call_common+0xf0/0x278
[11018.239292][T122069] Instruction dump:
[11018.239309][T122069] 7c0004ac f9490d10 a14d0c78 38600000 b14d0c7a =
4e800020 60000000 7c0802a6=20
[11018.239342][T122069] 60000000 e9230278 e9290028 7c0004ac <e9290e10> =
0c090000 4c00012c 38600000=20
[11018.239377][T122069] ---[ end trace f68728a0d3053b63 ]---
[11018.738011][T122072] Kernel panic - not syncing: Fatal exception
[11020.409414]

>=20
> [   23.080069][    T1] ------------[ cut here ]------------
> [   23.080089][    T1] Debug warning: early ioremap leak of 10 areas =
detected.
> [   23.080089][    T1] please boot with early_ioremap_debug and report =
the dmesg.
> [   23.080157][    T1] WARNING: CPU: 4 PID: 1 at mm/early_ioremap.c:99 =
check_early_ioremap_leak+0xd4/0x108
> [   23.080171][    T1] Modules linked in:
> [   23.080192][    T1] CPU: 4 PID: 1 Comm: swapper/0 Not tainted =
5.7.0-rc4-next-20200508+ #4
> [   23.080214][    T1] NIP:  c00000000103f2d8 LR: c00000000103f2d4 =
CTR: 0000000000000000
> [   23.080226][    T1] REGS: c00000003df0f860 TRAP: 0700   Not tainted =
 (5.7.0-rc4-next-20200508+)
> [   23.080259][    T1] MSR:  9000000000029033 =
<SF,HV,EE,ME,IR,DR,RI,LE>  CR: 48000222  XER: 20040000
> [   23.080296][    T1] CFAR: c00000000010d5a8 IRQMASK: 0=20
> [   23.080296][    T1] GPR00: c00000000103f2d4 c00000003df0faf0 =
c000000001689400 0000000000000072=20
> [   23.080296][    T1] GPR04: 0000000000000006 0000000000000000 =
c00000003df0f7e4 0000000000000004=20
> [   23.080296][    T1] GPR08: 0000001ffbb60000 0000000000000000 =
c00000003dee6680 0000000000000002=20
> [   23.080296][    T1] GPR12: 0000000000000000 c000001fffffae00 =
c000000001057860 c0000000010578b0=20
> [   23.080296][    T1] GPR16: c000000001002d38 c0000000014f0660 =
c0000000014f0680 c0000000014f06a0=20
> [   23.080296][    T1] GPR20: c0000000014f06c0 c0000000014f06e0 =
c0000000014f0700 c0000000014f0720=20
> [   23.080296][    T1] GPR24: c000000000c4bc30 c000000486b82000 =
c0000000015a0fe0 c0000000015a0fc0=20
> [   23.080296][    T1] GPR28: 0000000000000010 0000000000000010 =
c000000001061e30 000000000000000a=20
> [   23.080507][    T1] NIP [c00000000103f2d8] =
check_early_ioremap_leak+0xd4/0x108
> [   23.080530][    T1] LR [c00000000103f2d4] =
check_early_ioremap_leak+0xd0/0x108
> [   23.080552][    T1] Call Trace:
> [   23.080571][    T1] [c00000003df0faf0] [c00000000103f2d4] =
check_early_ioremap_leak+0xd0/0x108 (unreliable)
> [   23.080607][    T1] [c00000003df0fb80] [c00000000001130c] =
do_one_initcall+0xcc/0x660
> [   23.080648][    T1] [c00000003df0fc80] [c000000001004c18] =
kernel_init_freeable+0x480/0x568
> [   23.080681][    T1] [c00000003df0fdb0] [c000000000012180] =
kernel_init+0x24/0x194
> [   23.080713][    T1] [c00000003df0fe20] [c00000000000cb28] =
ret_from_kernel_thread+0x5c/0x74
>=20
> This is from the early_ioremap_debug dmesg.
>=20
> [    0.000000][    T0] ------------[ cut here ]------------
> [    0.000000][    T0] __early_ioremap(0x000600c3c0010000, 00010000) =
[0] =3D> 00000000 + ffffffffffbe0000
> [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at =
mm/early_ioremap.c:162 __early_ioremap+0x2d8/0x408
> [    0.000000][    T0] Modules linked in:
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted =
5.7.0-rc4-next-20200508+ #4
> [    0.000000][    T0] NIP:  c00000000103f5e4 LR: c00000000103f5e0 =
CTR: c0000000001e77f0
> [    0.000000][    T0] REGS: c00000000168f980 TRAP: 0700   Not tainted =
 (5.7.0-rc4-next-20200508+)
> [    0.000000][    T0] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  =
CR: 28000248  XER: 20040000
> [    0.000000][    T0] CFAR: c00000000010d5a8 IRQMASK: 1=20
> [    0.000000][    T0] GPR00: c00000000103f5e0 c00000000168fc10 =
c000000001689400 0000000000000050=20
> [    0.000000][    T0] GPR04: c00000000152f6f8 0000000000000000 =
c00000000168f904 0000000000000000=20
> [    0.000000][    T0] GPR08: 0000000000000000 0000000000000000 =
c00000000162f600 0000000000000002=20
> [    0.000000][    T0] GPR12: c0000000001e77f0 c000000005b30000 =
0000000000000000 0000000000000000=20
> [    0.000000][    T0] GPR16: 0000000000000000 0000000000000000 =
0000000000000000 0000000000001000=20
> [    0.000000][    T0] GPR20: 0000000000000000 80000000000001ae =
0000000000000000 0000000000000000=20
> [    0.000000][    T0] GPR24: 0000000000010000 c000000001061da8 =
0000000000000008 0000000000000008=20
> [    0.000000][    T0] GPR28: 0000000000000000 c000000001061db0 =
0000000000000000 c000000001061eb8=20
> [    0.000000][    T0] NIP [c00000000103f5e4] =
__early_ioremap+0x2d8/0x408
> [    0.000000][    T0] LR [c00000000103f5e0] =
__early_ioremap+0x2d4/0x408
> [    0.000000][    T0] Call Trace:
> [    0.000000][    T0] [c00000000168fc10] [c00000000103f5e0] =
__early_ioremap+0x2d4/0x408 (unreliable)
> [    0.000000][    T0] [c00000000168fcf0] [c00000000101d010] =
pnv_pci_init_ioda_phb+0x420/0xdfc
> [    0.000000][    T0] [c00000000168fe10] [c00000000101c9b8] =
pnv_pci_init+0x12c/0x264
> [    0.000000][    T0] [c00000000168fe40] [c000000001016c40] =
pnv_setup_arch+0x2e4/0x330
> [    0.000000][    T0] [c00000000168fe80] [c000000001009dd0] =
setup_arch+0x3a0/0x3ec
> [    0.000000][    T0] [c00000000168fef0] [c000000001003ed0] =
start_kernel+0xb0/0x978
> [    0.000000][    T0] [c00000000168ff90] [c00000000000c790] =
start_here_common+0x1c/0x8c
> [    0.000000][    T0] Instruction dump:
> [    0.000000][    T0] 7d39ba14 3c82ff3c 3c62ff54 7f06c378 7f88e378 =
7fc7f378 38a10068 e9290110=20
> [    0.000000][    T0] 38849e90 3863e8f0 4b0cdf65 60000000 <0fe00000> =
2bbe000f 409d0018 3c62fff1=20
> [    0.000000][    T0] irq event stamp: 0
> [    0.000000][    T0] hardirqs last  enabled at (0): =
[<0000000000000000>] 0x0
> [    0.000000][    T0] hardirqs last disabled at (0): =
[<0000000000000000>] 0x0
> [    0.000000][    T0] softirqs last  enabled at (0): =
[<0000000000000000>] 0x0
> [    0.000000][    T0] softirqs last disabled at (0): =
[<0000000000000000>] 0x0
>=20


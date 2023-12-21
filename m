Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4781B3AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:34:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=XsaP5MHd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swmxp470Qz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=XsaP5MHd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swmwy02gzz2xTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:33:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1703154802; x=1734690802;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=arYnRdf1QdNyi//6LefTyoCxnnz8QHpTtprbXj91ge0=;
  b=XsaP5MHdfS8C6PHObdOkuhKTAe2fj1VaY9zUg6bZ+Qxyta/0hLQ10yVs
   cL2HXklCNn+4cTljkx6CbUwRXxkxAoTxzX6Eh3aPee0lpyyf17WdCeBqt
   8RjLCku84nJu8YNTaMdHs0DDvloHU8gIQwNrIf5H+NodLKGuNAF5UdyuE
   7aR1TsdkNs08KH9t8tFP0mSxQvbRj3IPmNetIEpT5gRdxWBhQJ8s7z7uC
   /QL53S/CCtbVMRNwLLhm6yxtfMs/4WCO2whlWDRxy5bfYHzD0sK4NbW9V
   b+zeKrgyhbAdnlOrXWYoSJXOm+0hguUs9wYuJs+oeOUwvuDFeUoxzfHZA
   w==;
X-IronPort-AV: E=Sophos;i="6.04,293,1695679200"; 
   d="scan'208";a="34629820"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Dec 2023 11:33:13 +0100
Received: from [192.168.2.128] (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 51BBA280075;
	Thu, 21 Dec 2023 11:33:13 +0100 (CET)
Message-ID: <207e08e3942f88dc9809686e9b602224bb65930e.camel@ew.tq-group.com>
Subject: Re: powerpc: several early boot regressions on MPC52xx
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Thu, 21 Dec 2023 11:33:12 +0100
In-Reply-To: <5ac30d2e-8688-436c-8357-1ee287a5719b@csgroup.eu>
References: <46a002f7fe894c7c7ed8324e48e9cd226e428894.camel@ew.tq-group.com>
	 <277b815c-0d73-4f33-ba00-d89b9a0cdb35@csgroup.eu>
	 <c24f49402864ab7f828f583886a1b469fc3607fe.camel@ew.tq-group.com>
	 <5ac30d2e-8688-436c-8357-1ee287a5719b@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar
 K.V" <aneesh.kumar@kernel.org>, "Naveen N.Rao" <naveen.n.rao@linux.ibm.com>, Anatolij Gustschin <agust@denx.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-12-20 at 14:55 +0000, Christophe Leroy wrote:
> > Le 19/12/2023 =C3=A0 14:34, Matthias Schiffer a =C3=A9crit=C2=A0:
> > > > [Vous ne recevez pas souvent de courriers de matthias.schiffer@ew.t=
q-group.com. D=C3=A9couvrez pourquoi ceci est important =C3=A0 https://aka.=
ms/LearnAboutSenderIdentification ]
> > > >=20
> > > > On Mon, 2023-12-18 at 19:48 +0000, Christophe Leroy wrote:
> > > > > > Hi Matthias,
> > > > > >=20
> > > > > > Le 18/12/2023 =C3=A0 14:48, Matthias Schiffer a =C3=A9crit :
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > I'm currently in the process of porting our ancient TQM5200=
 SoM to a modern kernel, and I've
> > > > > > > > identified a number of regressions that cause early boot fa=
ilures (before the UART console has been
> > > > > > > > initialized) with arch/powerpc/configs/52xx/tqm5200_defconf=
ig.
> > > > > >=20
> > > > > > "modern" kernel =3D=3D> which version ?
> > > >=20
> > > > Hi Christophe,
> > > >=20
> > > > I was testing with torvalds/master as of yesterday, and bisected ev=
erything from 4.14 to identify
> > > > the commits related to the issues. For my current project, 6.1.y or=
 6.6.y will likely be our kernel
> > > > of choice, but I'd also like to get mainline to a working state aga=
in if possible.
> > > >=20
> > > > > >=20
> > > > > > > >=20
> > > > > > > > Issue 1) Boot fails with CONFIG_PPC_KUAP enabled (enabled b=
y default since 9f5bd8f1471d7
> > > > > > > > "powerpc/32s: Activate KUAP and KUEP by default"). The reas=
on is a number of of_iomap() calls in
> > > > > > > > arch/powerpc/platforms/52xx that should be early_ioremap().
> > > > > >=20
> > > > > > Can you give more details and what leads you to that conclusion=
 ?
> > > > > >=20
> > > > > > There should be no relation between KUAP and of_iomap()/early_i=
oremap().
> > > > > > Problem is likely somewhere else.
> > > >=20
> > > > You are entirely right, the warnings about early_ioremap() were a r=
ed hering. I can't reproduce any
> > > > difference in boot behavior anymore I thought I was seeing when cha=
nging the of_iomap() to
> > > > early_ioremap(). I assume I got confused by testing for too many va=
riables at once (kernel version +
> > > > 2 Kconfig settings).
> > > >=20
> > > >=20
> > > > > >=20
> > > > > > > >=20
> > > > > > > > I can fix this up easy enough for mpc5200_simple by changin=
g mpc5200_setup_xlb_arbiter() to use
> > > > > > > > early_ioremap() and moving mpc52xx_map_common_devices() fro=
m the setup_arch to the init hook (one
> > > > > > > > side effect is that mpc52xx_restart() only works a bit late=
r, as it requires the mpc52xx_wdt mapping
> > > > > > > > from mpc52xx_map_common_devices(); I'm not sure if there is=
 a better solution).
> > > > > > > >=20
> > > > > > > > For the other 52xx platforms (efika, lite5200, media5200) t=
hings are a bit more chaotic, and they
> > > > > > > > create several more temporary mappings from setup_arch. Eit=
her they should all be moved to the init
> > > > > > > > hook as well, or be converted to early_ioremap(), but I can=
't tell which is more appropriate. As a
> > > > > > > > first step, I would propose a patch that fixes this for the=
 simple platforms and leaves the other
> > > > > > > > ones unchanged.
> > > > > > > >=20
> > > > > > > > (Side note: I also found that before 16132529cee58 ("powerp=
c/32s: Rework Kernel Userspace Access
> > > > > > > > Protection"), boot would succeed even with KUAP enabled wit=
hout changing the incorrect of_iomap(); I
> > > > > > > > guess the old implementation was more lenient about the inc=
orrect calls that the kernel warns
> > > > > > > > about?)
> > > > > >=20
> > > > > > Interesting.
> > > > > > Again, there shouldn't be any impact of those incorrect calls. =
They are
> > > > > > correct calls, it is just an historical method that we want to =
get rid
> > > > > > of on day.
> > > > > > Could you then provide the dmesg of what/how it works here ? An=
d then
> > > > > > I'd also be interested in a dump of /sys/kernel/debug/kernel_pa=
ge_tables
> > > > > > and /sys/kernel/debug/powerpc/block_address_translation
> > > > > > and /sys/kernel/debug/powerpc/segment_registers
> > > > > >=20
> > > > > > For that you'll need CONFIG_PTDUMP_DEBUGFS
> > > >=20
> > > > As it turns out, whatever issue existed with KUAP at the time when =
it was changed to enabled by
> > > > default for 32s (which was in 5.14) has been resolved in current ma=
inline. Current torvalds/master
> > > > boots fine with KUAP enabled, and only CONFIG_STRICT_KERNEL_RWX bre=
aks the boot.
> > > >=20
> > > > > >=20
> > > > > > > >=20
> > > > > > > > Issue 2) Boot fails with CONFIG_STRICT_KERNEL_RWX enabled, =
which is also the default nowadays.
> > > > > > > >=20
> > > > > > > > I have not found the cause of this boot failure yet; is the=
re any way to debug this if the failure
> > > > > > > > happens before the UART is available and I currently don't =
have JTAG for this hardware?
> > > > > >=20
> > > > > > Shouldn't happen before UART is available, strict enforcement i=
s
> > > > > > perfomed by mark_readonly() and free_initmem() in the middle of
> > > > > > kernel_init(). UART should be ON long before that.
> > > > > >=20
> > > > > > So it must be something in the setup that collides with CONFIG_=
KUAP and
> > > > > > CONFIG_STRICT_KERNEL_RWX.
> > > > > >=20
> > > > > > Could you send dmesg of when it works (ie without
> > > > > > CONFIG_KUAP/CONFIG_STRICT_KERNEL_RWX) and when it doesn't work =
if you
> > > > > > get some initial stuff ?
> > > >=20
> > > > Here's the UART output of a working boot (CONFIG_STRICT_KERNEL_RWX =
disabled; I have slightly
> > > > extended tqm5200.dts to enable UART output of the cuImage wrapper):
> > > >=20
> > ...
> > > >=20
> > > > When boot doesn't work, the last messages I see are from the cuImag=
e wrapper ("Finalizing device
> > > > tree... flat tree at ...). The panic is expected, there is no rootf=
s/initramfs in my current setup.
> > > >=20
> >=20
> > Ok, so let's focus on CONFIG_STRICT_KERNEL_RWX then.
> >=20
> > The most efficient would be if you were able to activation your UART=
=20
> > console earlier and/or implement some PPC_EARLY_DEBUG stuff to see wher=
e=20
> > it fails.
> >=20
> > In your dmesg output, "Kernel memory protection not selected by kernel=
=20
> > config" is when the strict RWX gets activated when selected. Your UART=
=20
> > is enabled before that so if there was a problem with some driver=20
> > writing in a RO area, it would be seen.
> >=20
> > One thing that came into my mind is that your CPU may have only 4 BATs=
=20
> > instead of 8. But I hacked the definition for the e300c2 CPU and my=20
> > board still boots with only 4 BATs so it is not that.
> > The thing is that to work properly, BATs should at least cover all=20
> > kernel. But I built your kernel with your .config and GCC 11.3 and I go=
t=20
> > something that fits within 8M with the RO part stopping at 4M, so you'l=
l=20
> > have one 4M BAT set RO, then another 4M BAT set RW, one 8M and one 16M=
=20
> > BAT. It won't cover your entire 128M memory but shouldn't be a problem,=
=20
> > just less performant.

Hi Christophe,

this seems indeed have something to do with the issue. mmu_mapin_ram() cont=
ains a
strict_kernel_rwx_enabled() check that explains the early boot failure (and=
 as this is a runtime
check, I can actually make the kernel boot by passing rodata=3Doff on the c=
mdline!). I've added debug
output show me the addresses in mmu_mapin_ram(): base=3D00000000 top=3D0800=
0000 border=3D00400000.
Modifying mmu_mapin_ram() to always use the !strict_kernel_rwx_enabled() pa=
th makes the kernel boot
until mark_readonly().

Removing MMU_FTR_USE_HIGH_BATS from mmu_features or changing find_free_bat(=
) to only use 4 BATs
regardless of MMU_FTR_USE_HIGH_BATS results in a working kernel, but it is =
unclear to me why that
would be necessary, as the MPC5200B manual clearly states that it has 8.

Regards,
Matthias

> >=20
> > So what ? You said the size of the kernel is a problem for your=20
> > bootloader. Could it be that ? When built with CONFIG_STRICT_KERNEL_RWX=
,=20
> > __end_rodata is aligned to 0xc0400000 whereas without=20
> > CONFIG_STRICT_KERNEL_RWX __end_rodata is at 0xc038c000 and so the end o=
f=20
> > the kernel (seen from System.map) is 0xc0055e000 with=20
> > CONFIG_STRICT_KERNEL_RWX and 0xc04de000 without it.
> >=20
> > One thing you can try is to see if it works without=20
> > CONFIG_STRICT_KERNEL_RWX but with CONFIG_DATA_SHIFT forced to 22 which=
=20
> > is the value set when CONFIG_STRICT_KERNEL_RWX is selected.
> > To be able to set that value, you'll have to hack arch/powerpc/Kconfig=
=20
> > directly and force it to select value 22 regardless of=20
> > CONFIG_STRICT_KERNEL_RWX



> >=20
> > Christophe

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

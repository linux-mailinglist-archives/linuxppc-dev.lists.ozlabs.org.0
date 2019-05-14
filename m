Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 915251C18A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:49:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4534w66PHFzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 14:49:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4534tQ3XjxzDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 14:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="PKjr3tAk"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4534tP4W7Bz9sBp;
 Tue, 14 May 2019 14:47:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1557809261;
 bh=VtJj0VOx2h4g4hoSssZkg+Fv5J3it7yXwE9F2jfbRXQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=PKjr3tAk0seVlBPi9lGb1QcKoeCg8yR9oDAWmXrwdk9n8/7GpEKkmS5KHbjWcLjo0
 hggpRmeGRqC9zDAj9t/xTPQLqYWUJY/yRScyUC1XRz7uowBvqNdxaCUEXokZ0wV3RZ
 xevBr09EEpwDVRgf+XeLGqygvVVB8i3CGM2ie1Z33O2cpFccVPmJA6+/XVsWC5thFb
 NflNiXwWbo6RwRlfgpEbMYQ7EON+7h85JWonKslC6GQRMDdJPg2eGyb20tMV7st9+Q
 j0Qgxgip5Ywan7nF1kfV4VL9dGN1RvllTPI1mnzlzGElsVy+m9ehZzNgHhIPFfZ0Gs
 bBfUCkJ35eb6g==
Received: by neuling.org (Postfix, from userid 1000)
 id 916652A2592; Tue, 14 May 2019 14:47:41 +1000 (AEST)
Message-ID: <4ae1ab46779c5724d129bbeb62859e288ff7dffa.camel@neuling.org>
Subject: Re: [PATCH v2] powerpc: Fix compile issue with force DAWR
From: Michael Neuling <mikey@neuling.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au
Date: Tue, 14 May 2019 14:47:41 +1000
In-Reply-To: <f1015de7-faf1-ae6d-d1f9-9c904f19c58b@c-s.fr>
References: <20190513071703.25243-1-mikey@neuling.org>
 <f1015de7-faf1-ae6d-d1f9-9c904f19c58b@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-05-13 at 11:08 +0200, Christophe Leroy wrote:
>=20
> Le 13/05/2019 =C3=A0 09:17, Michael Neuling a =C3=A9crit :
> > If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
> > at linking with:
> >    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined
> > reference to `dawr_force_enable'
> >=20
> > This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
> > DAWR on P9 option").
> >=20
> > This puts more of the dawr infrastructure in a new file.
>=20
> I think you are doing a bit more than that. I think you should explain=
=20
> that you define a new CONFIG_ option, when it is selected, etc ...
>=20
> The commit you are referring to is talking about P9. It looks like your=
=20
> patch covers a lot more, so it should be mentionned her I guess.

Not really. It looks like I'm doing a lot but I'm really just moving code a=
round
to deal with the ugliness of a bunch of config options and dependencies.=
=20

> > Signed-off-by: Michael Neuling <mikey@neuling.org>
>=20
> You should add a Fixes: tag, ie:
>=20
> Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")

Ok

>=20
> > --
> > v2:
> >    Fixes based on Christophe Leroy's comments:
> >    - Fix commit message formatting
> >    - Move more DAWR code into dawr.c
> > ---
> >   arch/powerpc/Kconfig                     |  5 ++
> >   arch/powerpc/include/asm/hw_breakpoint.h | 20 ++++---
> >   arch/powerpc/kernel/Makefile             |  1 +
> >   arch/powerpc/kernel/dawr.c               | 75 +++++++++++++++++++++++=
+
> >   arch/powerpc/kernel/hw_breakpoint.c      | 56 ------------------
> >   arch/powerpc/kvm/Kconfig                 |  1 +
> >   6 files changed, 94 insertions(+), 64 deletions(-)
> >   create mode 100644 arch/powerpc/kernel/dawr.c
> >=20
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 2711aac246..f4b19e48cc 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -242,6 +242,7 @@ config PPC
> >   	select SYSCTL_EXCEPTION_TRACE
> >   	select THREAD_INFO_IN_TASK
> >   	select VIRT_TO_BUS			if !PPC64
> > +	select PPC_DAWR_FORCE_ENABLE		if PPC64 || PERF
>=20
> What's PERF ? Did you mean PERF_EVENTS ?
>=20
> Then what you mean is:
> - Selected all the time for PPC64
> - Selected for PPC32 when PERF is also selected.
>=20
> Is that what you want ? At first I thought it was linked to P9.

This is wrong.  I think we just want PPC64. PERF is a red herring.

> And ... did you read below statement ?

Clearly not :-)

>=20
> >   	#
> >   	# Please keep this list sorted alphabetically.
> >   	#
> > @@ -369,6 +370,10 @@ config PPC_ADV_DEBUG_DAC_RANGE
> >   	depends on PPC_ADV_DEBUG_REGS && 44x
> >   	default y
> >  =20
> > +config PPC_DAWR_FORCE_ENABLE
> > +	bool
> > +	default y
> > +
>=20
> Why defaulting it to y. Then how is it set to n ?

Good point.

>=20
> >   config ZONE_DMA
> >   	bool
> >   	default y if PPC_BOOK3E_64
> > diff --git a/arch/powerpc/include/asm/hw_breakpoint.h
> > b/arch/powerpc/include/asm/hw_breakpoint.h
> > index 0fe8c1e46b..ffbc8eab41 100644
> > --- a/arch/powerpc/include/asm/hw_breakpoint.h
> > +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> > @@ -47,6 +47,8 @@ struct arch_hw_breakpoint {
> >   #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL |
> > \
> >   				 HW_BRK_TYPE_HYP)
> >  =20
> > +extern int set_dawr(struct arch_hw_breakpoint *brk);
> > +
> >   #ifdef CONFIG_HAVE_HW_BREAKPOINT
> >   #include <linux/kdebug.h>
> >   #include <asm/reg.h>
> > @@ -90,18 +92,20 @@ static inline void hw_breakpoint_disable(void)
> >   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs
> > *regs);
> >   int hw_breakpoint_handler(struct die_args *args);
> >  =20
> > -extern int set_dawr(struct arch_hw_breakpoint *brk);
> > -extern bool dawr_force_enable;
> > -static inline bool dawr_enabled(void)
> > -{
> > -	return dawr_force_enable;
> > -}
> > -
>=20
> That's a very simple function, why not keep it here (or in another .h)=
=20
> as 'static inline' ?

Sure.

> >   #else	/* CONFIG_HAVE_HW_BREAKPOINT */
> >   static inline void hw_breakpoint_disable(void) { }
> >   static inline void thread_change_pc(struct task_struct *tsk,
> >   					struct pt_regs *regs) { }
> > -static inline bool dawr_enabled(void) { return false; }
> > +
> >   #endif	/* CONFIG_HAVE_HW_BREAKPOINT */
> > +
> > +extern bool dawr_force_enable;
> > +
> > +#ifdef CONFIG_PPC_DAWR_FORCE_ENABLE
> > +extern bool dawr_enabled(void);
>=20
> Functions should not be 'extern'. I'm sure checkpatch --strict will tell=
=20
> you.

That's not what's currently being done in this header file.  I'm keeping wi=
th
the style of that file.

> > +#else
> > +#define dawr_enabled() true
>=20
> true by default ?
> Previously it was false by default.

Thanks, yeah that's wrong but I need to rethink the config option to make i=
t
CONFIG_PPC_DAWR.=20

This patch is far more difficult than it should be due to the mess that
CONFIG_HAVE_HW_BREAKPOINT and CONFIG_PPC_ADV_DEBUG_REGS creates in ptrace.c=
 and
process.c. We really need to fix up=20
https://github.com/linuxppc/issues/issues/128

> And why a #define ? That's better to keep a static inline.

Changed.

>=20
> > +#endif
> > +
> >   #endif	/* __KERNEL__ */
> >   #endif	/* _PPC_BOOK3S_64_HW_BREAKPOINT_H */
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefil=
e
> > index 0ea6c4aa3a..a9c497c34f 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -56,6 +56,7 @@ obj-$(CONFIG_PPC64)		+=3D setup_64.o
> > sys_ppc32.o \
> >   obj-$(CONFIG_VDSO32)		+=3D vdso32/
> >   obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
> >   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
> > +obj-$(CONFIG_PPC_DAWR_FORCE_ENABLE)	+=3D dawr.o
> >   obj-$(CONFIG_PPC_BOOK3S_64)	+=3D cpu_setup_ppc970.o cpu_setup_pa6t.o
> >   obj-$(CONFIG_PPC_BOOK3S_64)	+=3D cpu_setup_power.o
> >   obj-$(CONFIG_PPC_BOOK3S_64)	+=3D mce.o mce_power.o
> > diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
> > new file mode 100644
> > index 0000000000..cf1d02fe1e
> > --- /dev/null
> > +++ b/arch/powerpc/kernel/dawr.c
> > @@ -0,0 +1,75 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// DAWR infrastructure
> > +//
> > +// Copyright 2019, Michael Neuling, IBM Corporation.
> > +
> > +#include <linux/types.h>
> > +#include <linux/export.h>
> > +#include <linux/fs.h>
> > +#include <linux/debugfs.h>
> > +#include <asm/debugfs.h>
> > +#include <asm/machdep.h>
> > +#include <asm/hvcall.h>
> > +
> > +bool dawr_force_enable;
> > +EXPORT_SYMBOL_GPL(dawr_force_enable);
> > +
> > +extern bool dawr_enabled(void)
>=20
> extern ????

oops
>=20
> > +{
> > +	return dawr_force_enable;
> > +}
> > +EXPORT_SYMBOL_GPL(dawr_enabled);
>=20
> Since dawr_force_enable is also exported, I see no point in having such=
=20
> a tiny function as an exported function, was better as a 'static inline'.

Yep, changed to static inline.

> > +
> > +static ssize_t dawr_write_file_bool(struct file *file,
> > +				    const char __user *user_buf,
> > +				    size_t count, loff_t *ppos)
> > +{
> > +	struct arch_hw_breakpoint null_brk =3D {0, 0, 0};
> > +	size_t rc;
> > +
> > +	/* Send error to user if they hypervisor won't allow us to write DAWR=
 */
> > +	if ((!dawr_force_enable) &&
> > +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> > +	    (set_dawr(&null_brk) !=3D H_SUCCESS))
>=20
> The above is not real clear.
> set_dabr() returns 0, H_SUCCESS is not used there.

It pseries_set_dawr() will return a hcall number.

This code hasn't changed. I'm just moving it.

>=20
> > +		return -1;
> > +
> > +	rc =3D debugfs_write_file_bool(file, user_buf, count, ppos);
> > +	if (rc)
> > +		return rc;
> > +
> > +	/* If we are clearing, make sure all CPUs have the DAWR cleared */
> > +	if (!dawr_force_enable)
> > +		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> > +
> > +	return rc;
> > +}
> > +
> > +static const struct file_operations dawr_enable_fops =3D {
> > +	.read =3D		debugfs_read_file_bool,
> > +	.write =3D	dawr_write_file_bool,
> > +	.open =3D		simple_open,
> > +	.llseek =3D	default_llseek,
> > +};
> > +
> > +static int __init dawr_force_setup(void)
> > +{
> > +	dawr_force_enable =3D false;
>=20
> The above is not needed, the BSS is zeroised at kernel startup.
>=20
> > +
> > +	if (cpu_has_feature(CPU_FTR_DAWR)) {
> > +		/* Don't setup sysfs file for user control on P8 */
> > +		dawr_force_enable =3D true;
>=20
> Strange comment, word "don't" doesn't really fit with a 'true'
>=20
> > +		return 0;
> > +	}
> > +
> > +	if (PVR_VER(mfspr(SPRN_PVR)) =3D=3D PVR_POWER9) {
>=20
> You could use pvr_version_is(PVR_POWER9) instead of open codiing.

All this code hasn't changed. I'm just moving it.

Feel free to clean it up but lets fix a real problem here.

>=20
> > +		/* Turn DAWR off by default, but allow admin to turn it on */
> > +		dawr_force_enable =3D false;
> > +		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
> > +					   powerpc_debugfs_root,
> > +					   &dawr_force_enable,
> > +					   &dawr_enable_fops);
> > +	}
> > +	return 0;
> > +}
> > +arch_initcall(dawr_force_setup);
>=20
> Wouldn't it also make sense to move set_dawr() from process.c to here ?

Yep, done.

>=20
> > diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> > b/arch/powerpc/kernel/hw_breakpoint.c
> > index da307dd93e..95605a9c9a 100644
> > --- a/arch/powerpc/kernel/hw_breakpoint.c
> > +++ b/arch/powerpc/kernel/hw_breakpoint.c
> > @@ -380,59 +380,3 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
> >   {
> >   	/* TODO */
> >   }
> > -
> > -bool dawr_force_enable;
> > -EXPORT_SYMBOL_GPL(dawr_force_enable);
> > -
> > -static ssize_t dawr_write_file_bool(struct file *file,
> > -				    const char __user *user_buf,
> > -				    size_t count, loff_t *ppos)
> > -{
> > -	struct arch_hw_breakpoint null_brk =3D {0, 0, 0};
> > -	size_t rc;
> > -
> > -	/* Send error to user if they hypervisor won't allow us to write DAWR=
 */
> > -	if ((!dawr_force_enable) &&
> > -	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> > -	    (set_dawr(&null_brk) !=3D H_SUCCESS))
> > -		return -1;
> > -
> > -	rc =3D debugfs_write_file_bool(file, user_buf, count, ppos);
> > -	if (rc)
> > -		return rc;
> > -
> > -	/* If we are clearing, make sure all CPUs have the DAWR cleared */
> > -	if (!dawr_force_enable)
> > -		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> > -
> > -	return rc;
> > -}
> > -
> > -static const struct file_operations dawr_enable_fops =3D {
> > -	.read =3D		debugfs_read_file_bool,
> > -	.write =3D	dawr_write_file_bool,
> > -	.open =3D		simple_open,
> > -	.llseek =3D	default_llseek,
> > -};
> > -
> > -static int __init dawr_force_setup(void)
> > -{
> > -	dawr_force_enable =3D false;
> > -
> > -	if (cpu_has_feature(CPU_FTR_DAWR)) {
> > -		/* Don't setup sysfs file for user control on P8 */
> > -		dawr_force_enable =3D true;
> > -		return 0;
> > -	}
> > -
> > -	if (PVR_VER(mfspr(SPRN_PVR)) =3D=3D PVR_POWER9) {
> > -		/* Turn DAWR off by default, but allow admin to turn it on */
> > -		dawr_force_enable =3D false;
> > -		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
> > -					   powerpc_debugfs_root,
> > -					   &dawr_force_enable,
> > -					   &dawr_enable_fops);
> > -	}
> > -	return 0;
> > -}
> > -arch_initcall(dawr_force_setup);
> > diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> > index bfdde04e49..9c0d315108 100644
> > --- a/arch/powerpc/kvm/Kconfig
> > +++ b/arch/powerpc/kvm/Kconfig
> > @@ -39,6 +39,7 @@ config KVM_BOOK3S_32_HANDLER
> >   config KVM_BOOK3S_64_HANDLER
> >   	bool
> >   	select KVM_BOOK3S_HANDLER
> > +	select PPC_DAWR_FORCE_ENABLE
> >  =20
> >   config KVM_BOOK3S_PR_POSSIBLE
> >   	bool
> >=20
>=20
> Christophe
>=20


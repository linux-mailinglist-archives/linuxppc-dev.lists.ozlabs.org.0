Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03076A3076
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 09:14:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KW1n6jVMzDr7N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 17:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KVzR3L01zF09S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 17:12:18 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB971B6DB;
 Fri, 30 Aug 2019 07:12:14 +0000 (UTC)
Date: Fri, 30 Aug 2019 09:12:12 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 5/5] powerpc/perf: split callchain.c by bitness
Message-ID: <20190830091212.4d1d619f@naga>
In-Reply-To: <20190830084225.527f4265@naga>
References: <c77eec3d99fd0251edf725a3d9e1b79f396eba6e.1567117050.git.msuchanek@suse.de>
 <4d996b0a225ca5b7d287ae46825d7da4a1d6e509.1567146554.git.christophe.leroy@c-s.fr>
 <20190830084225.527f4265@naga>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Michael Neuling <mikey@neuling.org>, Arnd Bergmann <arnd@arndb.de>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Christian Brauner <christian@brauner.io>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 08:42:25 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Fri, 30 Aug 2019 06:35:11 +0000 (UTC)
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>=20
> > On 08/29/2019 10:28 PM, Michal Suchanek wrote: =20

> >  obj-$(CONFIG_PPC_PERF_CTRS)	+=3D core-book3s.o bhrb.o
> > diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callc=
hain_32.c
> > index 0bd4484eddaa..17c43ae03084 100644
> > --- a/arch/powerpc/perf/callchain_32.c
> > +++ b/arch/powerpc/perf/callchain_32.c
> > @@ -15,50 +15,13 @@
> >  #include <asm/sigcontext.h>
> >  #include <asm/ucontext.h>
> >  #include <asm/vdso.h>
> > -#ifdef CONFIG_PPC64
> > -#include "../kernel/ppc32.h"
> > -#endif
> >  #include <asm/pte-walk.h>
> > =20
> >  #include "callchain.h"
> > =20
> >  #ifdef CONFIG_PPC64
> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *=
ret)
> > -{
> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > -	    ((unsigned long)ptr & 3))
> > -		return -EFAULT;
> > -
> > -	pagefault_disable();
> > -	if (!__get_user_inatomic(*ret, ptr)) {
> > -		pagefault_enable();
> > -		return 0;
> > -	}
> > -	pagefault_enable();
> > -
> > -	return read_user_stack_slow(ptr, ret, 4);
> > -}
> > -#else /* CONFIG_PPC64 */
> > -/*
> > - * On 32-bit we just access the address and let hash_page create a
> > - * HPTE if necessary, so there is no need to fall back to reading
> > - * the page tables.  Since this is called at interrupt level,
> > - * do_page_fault() won't treat a DSI as a page fault.
> > - */
> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *=
ret)
> > -{
> > -	int rc;
> > -
> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > -	    ((unsigned long)ptr & 3))
> > -		return -EFAULT;
> > -
> > -	pagefault_disable();
> > -	rc =3D __get_user_inatomic(*ret, ptr);
> > -	pagefault_enable();
> > -
> > -	return rc;
> > -}
> > +#include "../kernel/ppc32.h"
> > +#else
> > =20
> >  #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
> >  #define sigcontext32		sigcontext
> > @@ -95,6 +58,30 @@ struct rt_signal_frame_32 {
> >  	int			abigap[56];
> >  };
> > =20
> > +/*
> > + * On 32-bit we just access the address and let hash_page create a
> > + * HPTE if necessary, so there is no need to fall back to reading
> > + * the page tables.  Since this is called at interrupt level,
> > + * do_page_fault() won't treat a DSI as a page fault.
> > + */
> > +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *=
ret)
> > +{
> > +	int rc;
> > +
> > +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > +	    ((unsigned long)ptr & 3))
> > +		return -EFAULT;
> > +
> > +	pagefault_disable();
> > +	rc =3D __get_user_inatomic(*ret, ptr);
> > +	pagefault_enable();
> > +
> > +	if (IS_ENABLED(CONFIG_PPC32) || !rc)
> > +		return rc;
> > +
> > +	return read_user_stack_slow(ptr, ret, 4);
> > +}
> > +
> >  static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
> >  {
> >  	if (nip =3D=3D fp + offsetof(struct signal_frame_32, mctx.mc_pad)) =20
>=20
> I will leave consolidating this function to somebody who knows what the
> desired semantic is. With a short ifdef section at the top of the file
> it is a low-hanging fruit.

It looks ok if done as a separate patch.

Thanks

Michal

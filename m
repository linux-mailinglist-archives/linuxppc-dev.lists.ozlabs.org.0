Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC753A45B5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LPRk5j3qzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2019 04:06:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LPNJ00MYzDr0s
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Sep 2019 04:03:26 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11A4BAFCF;
 Sat, 31 Aug 2019 18:03:22 +0000 (UTC)
Date: Sat, 31 Aug 2019 20:03:18 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v7 0/6] Disable compat cruft on ppc64le v7
Message-ID: <20190831200318.74c32b57@naga>
In-Reply-To: <c6e61aee-7ffb-60db-ccf8-e805d2707eb5@c-s.fr>
References: <cover.1567198491.git.msuchanek@suse.de>
 <c6e61aee-7ffb-60db-ccf8-e805d2707eb5@c-s.fr>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Hari Bathini <hbathini@linux.ibm.com>, "Eric W.
 Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 31 Aug 2019 08:41:58 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 30/08/2019 =C3=A0 23:03, Michal Suchanek a =C3=A9crit=C2=A0:
> > Less code means less bugs so add a knob to skip the compat stuff. =20
>=20
> I guess on PPC64 you have Gigabytes of memory and thousands of bogomips,=
=20
> hence you focus on bugs.
>=20
> My main focus usually is kernel size and performance, which makes this=20
> series interesting as well.
>=20
> Anyway, I was wondering, would it make sense (in a following series, not=
=20
> in this one) to make it buildable as a module, just like some of binfmt ?

I think not.

You have the case when 32bit support is not optional because you are
32bit and when it is optional because you are 64bit. These cases either
diverge or the 32bit case suffers the penalty of some indirection that
makes the functionality loadable.

The indirection requires some synchronization so the 32bit code cannot
be unloaded while you are trying to call it, and possibly counting
32bit tasks so you will know when you can unload the 32bit code again.

This would add more code which benefits neither performance nor size
nor reliability.

Also you can presumably run 32bit code with binfmt-misc already but
don't get stuff like perf counters handled in the kernel because it is
not native code anymore.

Thanks

Michal

>=20
> Christophe
>=20
> >=20
> > This is tested on ppc64le top of
> >=20
> > https://patchwork.ozlabs.org/cover/1153556/
> >=20
> > Changes in v2: saner CONFIG_COMPAT ifdefs
> > Changes in v3:
> >   - change llseek to 32bit instead of builing it unconditionally in fs
> >   - clanup the makefile conditionals
> >   - remove some ifdefs or convert to IS_DEFINED where possible
> > Changes in v4:
> >   - cleanup is_32bit_task and current_is_64bit
> >   - more makefile cleanup
> > Changes in v5:
> >   - more current_is_64bit cleanup
> >   - split off callchain.c 32bit and 64bit parts
> > Changes in v6:
> >   - cleanup makefile after split
> >   - consolidate read_user_stack_32
> >   - fix some checkpatch warnings
> > Changes in v7:
> >   - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
> >   - remove leftover hunk
> >   - add review tags
> >=20
> > Michal Suchanek (6):
> >    powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
> >    powerpc: move common register copy functions from signal_32.c to
> >      signal.c
> >    powerpc/perf: consolidate read_user_stack_32
> >    powerpc/64: make buildable without CONFIG_COMPAT
> >    powerpc/64: Make COMPAT user-selectable disabled on littleendian by
> >      default.
> >    powerpc/perf: split callchain.c by bitness
> >=20
> >   arch/powerpc/Kconfig                   |   5 +-
> >   arch/powerpc/include/asm/thread_info.h |   4 +-
> >   arch/powerpc/include/asm/unistd.h      |   1 +
> >   arch/powerpc/kernel/Makefile           |   7 +-
> >   arch/powerpc/kernel/entry_64.S         |   2 +
> >   arch/powerpc/kernel/signal.c           | 144 +++++++++-
> >   arch/powerpc/kernel/signal_32.c        | 140 ---------
> >   arch/powerpc/kernel/syscall_64.c       |   6 +-
> >   arch/powerpc/kernel/vdso.c             |   5 +-
> >   arch/powerpc/perf/Makefile             |   5 +-
> >   arch/powerpc/perf/callchain.c          | 377 +------------------------
> >   arch/powerpc/perf/callchain.h          |  11 +
> >   arch/powerpc/perf/callchain_32.c       | 204 +++++++++++++
> >   arch/powerpc/perf/callchain_64.c       | 185 ++++++++++++
> >   fs/read_write.c                        |   3 +-
> >   15 files changed, 566 insertions(+), 533 deletions(-)
> >   create mode 100644 arch/powerpc/perf/callchain.h
> >   create mode 100644 arch/powerpc/perf/callchain_32.c
> >   create mode 100644 arch/powerpc/perf/callchain_64.c
> >  =20


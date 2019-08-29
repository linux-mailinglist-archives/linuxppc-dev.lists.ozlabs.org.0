Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCBA276D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 21:45:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KCkR5M2kzDrNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 05:45:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KChX5ztpzDs09
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 05:43:24 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CF54ABE7;
 Thu, 29 Aug 2019 19:43:21 +0000 (UTC)
Date: Thu, 29 Aug 2019 21:43:19 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/4] powerpc: make llseek 32bit-only.
Message-ID: <20190829214319.498c7de2@naga>
In-Reply-To: <CAK8P3a3DHqhbVToqRYqTmfCcSdT5sXb=1SO5jY9jDONDa6ORkA@mail.gmail.com>
References: <cover.1567072270.git.msuchanek@suse.de>
 <061a0de2042156669303f95526ec13476bf490c7.1567072270.git.msuchanek@suse.de>
 <CAK8P3a1wR-jzFSzdPqgfCG4vyAi_xBPVGhc6Nn4KaXpk3cUiJw@mail.gmail.com>
 <20190829143716.6e41b10e@naga>
 <CAK8P3a2DHP+8Vbc4yjq5-wT9GpSxvndCa8gnvx0WcD8YAUAsMw@mail.gmail.com>
 <20190829161923.101ff3eb@kitsune.suse.cz>
 <CAK8P3a3DHqhbVToqRYqTmfCcSdT5sXb=1SO5jY9jDONDa6ORkA@mail.gmail.com>
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
Cc: Michael Neuling <mikey@neuling.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Nicolai Stange <nstange@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Firoz Khan <firoz.khan@linaro.org>, Breno Leitao <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Brauner <christian@brauner.io>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Aug 2019 16:32:50 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Thu, Aug 29, 2019 at 4:19 PM Michal Such=C3=A1nek <msuchanek@suse.de> =
wrote:
> > On Thu, 29 Aug 2019 14:57:39 +0200 Arnd Bergmann <arnd@arndb.de> wrote:=
 =20
> > > On Thu, Aug 29, 2019 at 2:37 PM Michal Such=C3=A1nek <msuchanek@suse.=
de> wrote: =20
> > > > On Thu, 29 Aug 2019 14:19:46 +0200 Arnd Bergmann <arnd@arndb.de> wr=
ote: =20
> > > > > On Thu, Aug 29, 2019 at 12:23 PM Michal Suchanek <msuchanek@suse.=
de> wrote:
> > > > > In particular, I don't see why you single out llseek here, but le=
ave other
> > > > > syscalls that are not needed on 64-bit machines such as pread64()=
. =20
> > > >
> > > > Because llseek is not built in fs/ when building 64bit only causing=
 a
> > > > link error.
> > > >
> > > > I initially posted patch to build it always but it was pointed out =
it
> > > > is not needed, and  the interface does not make sense on 64bit, and
> > > > that platforms that don't have it on 64bit now don't want that usel=
ess
> > > > code. =20
> > >
> > > Ok, please put that into the changeset description then.
> > >
> > > I looked at uses of __NR__llseek in debian code search and
> > > found this one:
> > >
> > > https://codesearch.debian.net/show?file=3Dumview_0.8.2-1.2%2Fxmview%2=
Fum_mmap.c&line=3D328
> > >
> > > It looks like this application will try to use llseek instead of lseek
> > > when built against kernel headers that define __NR_llseek.
> > > =20
> >
> > The available documentation says this syscall is for 32bit only so
> > using it on 64bit is undefined. The interface is not well-defined in
> > that case either. =20
>=20
> That's generally not how it works. If there is an existing application
> that relies on the behavior of the system call interface, we should not
> change it in a way that breaks the application, regardless of what the
> documentation says. Presumably nobody cares about umview on
> powerpc64, but there might be other applications doing the same
> thing.

Actually the umview headers go out of their way to define the llseek
syscall as invalid on x86_64 so that the non-llseek path is taken.=20
mview-os/xmview/defs_x86_64_um.h:#define __NR__llseek __NR_doesnotexist
It is probably an oversight that this is not done on non-x86. I am not
even sure this builds on non-x86 out of the box.

> It looks like sparc64 and parisc64 do the same thing as powerpc64,
> and provide llseek() calls that may or may not be used by
> applications.

And if they are supposed to build with !compat it should be removed
there as well.

>=20
> I think your original approach of always building sys_llseek on
> powerpc64 is the safe choice here.

That's safe but adds junk to the kernel as pointed out in the reply to
that patch.

Thanks

Michal

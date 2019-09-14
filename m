Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A973BB2AFA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 12:23:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VpWS3NQvzF5wG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 20:23:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VpTd6bbvzF5sq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 20:22:11 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD0AAB012;
 Sat, 14 Sep 2019 10:22:06 +0000 (UTC)
Date: Sat, 14 Sep 2019 12:22:02 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v7 5/6] powerpc/64: Make COMPAT user-selectable disabled
 on littleendian by default.
Message-ID: <20190914122202.307707c0@naga>
In-Reply-To: <87h85us0xy.fsf@mpe.ellerman.id.au>
References: <cover.1567198491.git.msuchanek@suse.de>
 <c7c88e88408588fa6fcf858a5ae503b5e2f4ec0b.1567198492.git.msuchanek@suse.de>
 <87ftlftpy7.fsf@mpe.ellerman.id.au> <20190902114239.32bd81f4@naga>
 <87h85us0xy.fsf@mpe.ellerman.id.au>
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
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Diana Craciun <diana.craciun@nxp.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "Eric W.
 Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 03 Sep 2019 10:00:57 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> > On Mon, 02 Sep 2019 12:03:12 +1000
> > Michael Ellerman <mpe@ellerman.id.au> wrote:
> > =20
> >> Michal Suchanek <msuchanek@suse.de> writes: =20
> >> > On bigendian ppc64 it is common to have 32bit legacy binaries but mu=
ch
> >> > less so on littleendian.   =20
> >>=20
> >> I think the toolchain people will tell you that there is no 32-bit
> >> little endian ABI defined at all, if anything works it's by accident. =
=20
> >
> > I have seen a piece of software that workarounds code issues on 64bit
> > by always compiling 32bit code. So it does work in some way. =20
>=20
> What software is that?

The only one I have seen is stockfish (v9)

>=20
> > Also it has been pointed out that you can still switch to BE even with
> > the 'fast-switch' removed. =20
>=20
> Yes we have a proper syscall for endian switching, sys_switch_endian(),
> which is definitely supported.
>=20
> But that *only* switches the endian-ness of the process, it does nothing
> to the syscall layer. So any process that switches to the other endian
> must endian flip syscall arguments (that aren't in registers), or flip
> back to the native endian before calling syscalls.

In other words just installing a chroot of binaries built for the other
endian won't work. You need something like qemu to do the syscall
translation or run full VM with a kernel that has the swapped endian
syscall ABI.

Thanks

Michal

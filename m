Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EDA1C96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:22:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K4Yq4qqJzDrYj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 00:22:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K4Vp6qcdzDr7M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 00:19:30 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45BD3AEEE;
 Thu, 29 Aug 2019 14:19:25 +0000 (UTC)
Date: Thu, 29 Aug 2019 16:19:23 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/4] powerpc: make llseek 32bit-only.
Message-ID: <20190829161923.101ff3eb@kitsune.suse.cz>
In-Reply-To: <CAK8P3a2DHP+8Vbc4yjq5-wT9GpSxvndCa8gnvx0WcD8YAUAsMw@mail.gmail.com>
References: <cover.1567072270.git.msuchanek@suse.de>
 <061a0de2042156669303f95526ec13476bf490c7.1567072270.git.msuchanek@suse.de>
 <CAK8P3a1wR-jzFSzdPqgfCG4vyAi_xBPVGhc6Nn4KaXpk3cUiJw@mail.gmail.com>
 <20190829143716.6e41b10e@naga>
 <CAK8P3a2DHP+8Vbc4yjq5-wT9GpSxvndCa8gnvx0WcD8YAUAsMw@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
Cc: Michael Neuling <mikey@neuling.org>, Allison Randal <allison@lohutok.net>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <christian@brauner.io>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Aug 2019 14:57:39 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Thu, Aug 29, 2019 at 2:37 PM Michal Such=C3=A1nek <msuchanek@suse.de> =
wrote:
> > On Thu, 29 Aug 2019 14:19:46 +0200 Arnd Bergmann <arnd@arndb.de> wrote:=
 =20
> > > On Thu, Aug 29, 2019 at 12:23 PM Michal Suchanek <msuchanek@suse.de> =
wrote:
> > > In particular, I don't see why you single out llseek here, but leave =
other
> > > syscalls that are not needed on 64-bit machines such as pread64(). =20
> >
> > Because llseek is not built in fs/ when building 64bit only causing a
> > link error.
> >
> > I initially posted patch to build it always but it was pointed out it
> > is not needed, and  the interface does not make sense on 64bit, and
> > that platforms that don't have it on 64bit now don't want that useless
> > code. =20
>=20
> Ok, please put that into the changeset description then.
>=20
> I looked at uses of __NR__llseek in debian code search and
> found this one:
>=20
> https://codesearch.debian.net/show?file=3Dumview_0.8.2-1.2%2Fxmview%2Fum_=
mmap.c&line=3D328
>=20
> It looks like this application will try to use llseek instead of lseek
> when built against kernel headers that define __NR_llseek.
>=20

The available documentation says this syscall is for 32bit only so
using it on 64bit is undefined. The interface is not well-defined in
that case either.

Thanks

Michal

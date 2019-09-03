Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A33A5E5C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 02:02:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MnG05Rt1zDqd0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 10:02:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MnCt6JDHzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 10:00:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46MnCs4mlgz9s7T;
 Tue,  3 Sep 2019 10:00:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v7 5/6] powerpc/64: Make COMPAT user-selectable disabled
 on littleendian by default.
In-Reply-To: <20190902114239.32bd81f4@naga>
References: <cover.1567198491.git.msuchanek@suse.de>
 <c7c88e88408588fa6fcf858a5ae503b5e2f4ec0b.1567198492.git.msuchanek@suse.de>
 <87ftlftpy7.fsf@mpe.ellerman.id.au> <20190902114239.32bd81f4@naga>
Date: Tue, 03 Sep 2019 10:00:57 +1000
Message-ID: <87h85us0xy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Allison Randal <allison@lohutok.net>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Mon, 02 Sep 2019 12:03:12 +1000
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> Michal Suchanek <msuchanek@suse.de> writes:
>> > On bigendian ppc64 it is common to have 32bit legacy binaries but much
>> > less so on littleendian.=20=20
>>=20
>> I think the toolchain people will tell you that there is no 32-bit
>> little endian ABI defined at all, if anything works it's by accident.
>
> I have seen a piece of software that workarounds code issues on 64bit
> by always compiling 32bit code. So it does work in some way.

What software is that?

> Also it has been pointed out that you can still switch to BE even with
> the 'fast-switch' removed.

Yes we have a proper syscall for endian switching, sys_switch_endian(),
which is definitely supported.

But that *only* switches the endian-ness of the process, it does nothing
to the syscall layer. So any process that switches to the other endian
must endian flip syscall arguments (that aren't in registers), or flip
back to the native endian before calling syscalls.

>> So I think we should not make this selectable, unless someone puts their
>> hand up to say they want it and are willing to test it and keep it
>> working.
>
> I don't really care either way.

Sure. We'll see if anyone else speaks up.

cheers

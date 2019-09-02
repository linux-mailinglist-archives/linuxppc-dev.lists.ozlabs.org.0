Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F80A5E4D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:55:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mn5j6r8MzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 09:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mn3q08D0zDqYL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 09:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mn3n2Lzbz9s7T;
 Tue,  3 Sep 2019 09:53:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v7 5/6] powerpc/64: Make COMPAT user-selectable disabled
 on littleendian by default.
In-Reply-To: <20190902130008.GZ31406@gate.crashing.org>
References: <cover.1567198491.git.msuchanek@suse.de>
 <c7c88e88408588fa6fcf858a5ae503b5e2f4ec0b.1567198492.git.msuchanek@suse.de>
 <87ftlftpy7.fsf@mpe.ellerman.id.au>
 <20190902130008.GZ31406@gate.crashing.org>
Date: Tue, 03 Sep 2019 09:53:56 +1000
Message-ID: <87k1aqs19n.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Hari Bathini <hbathini@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Mon, Sep 02, 2019 at 12:03:12PM +1000, Michael Ellerman wrote:
>> Michal Suchanek <msuchanek@suse.de> writes:
>> > On bigendian ppc64 it is common to have 32bit legacy binaries but much
>> > less so on littleendian.
>> 
>> I think the toolchain people will tell you that there is no 32-bit
>> little endian ABI defined at all, if anything works it's by accident.
                ^
                v2

> There of course is a lot of powerpcle-* support.  The ABI used for it
> on linux is the SYSV ABI, just like on BE 32-bit.

I was talking about ELFv2, which is 64-bit only. But that was based on
me thinking we had a hard assumption in the kernel that ppc64le kernels
always expect ELFv2 userland. Looking at the code though I was wrong
about that, it looks like we will run little endian ELFv1 binaries,
though I don't think anyone is testing it.

> There also is specific powerpcle-linux support in GCC, and in binutils,
> too.  Also, config.guess/config.sub supports it.  Half a year ago this
> all built fine (no, I don't test it often either).
>
> I don't think glibc supports it though, so I wonder if anyone builds an
> actual system with it?  Maybe busybox or the like?
>
>> So I think we should not make this selectable, unless someone puts their
>> hand up to say they want it and are willing to test it and keep it
>> working.
>
> What about actual 32-bit LE systems?  Does anyone still use those?

Not that I've ever heard of.

cheers

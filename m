Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03636730E73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 06:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KB2Fyunh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhVSr5nxXz3brm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KB2Fyunh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhSPz6MwXz300q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:26:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhSPm1K9Bz4wjB;
	Thu, 15 Jun 2023 13:26:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686799607;
	bh=bmc6oqF5FNKBZGg1/rZAHOUSx4X5esqFgaD2hQBXRq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KB2FyunhTuXf+jozautVWXZthKKCB+waS3cucwpJbJk0s24v4KKDQVWgg9Q1V6jR3
	 0vEX2OWPXK/8QOdVINYGXUEXFhmEMCe6tR8/kJ2gs4NvUNlqzJka9/WRx2Av26B2bo
	 vITH1k1S5enB4XE2YnFXxPCt6IWEd6YUcRno10b5k49kD4HUIdaDZUg9pyurS1KRTV
	 HGZpbW1b+az+ld9IyfWGAhCPNIYxUEB/mIcl6YmKDvB1j32ka+tFJzfZQQ8K4TE/RF
	 jdgpZreP8tke/E0lPR+QDG6MJzN4Q+6VqMmtmB3YLVvYFkFLRyyYqL9Imhecexc6g6
	 0X6N/8mTgEXyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric DeVolder <eric.devolder@oracle.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v1 00/21] refactor Kconfig to consolidate KEXEC and
 CRASH options
In-Reply-To: <8a97f096-2bdc-0298-a1c5-8d48dbf94179@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <202306131314.EFA558B7@keescook>
 <8a97f096-2bdc-0298-a1c5-8d48dbf94179@oracle.com>
Date: Thu, 15 Jun 2023 13:26:35 +1000
Message-ID: <87ilbpflsk.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 15 Jun 2023 14:58:14 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, ziy@nvidia.com, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric DeVolder <eric.devolder@oracle.com> writes:
> On 6/13/23 15:21, Kees Cook wrote:
>> On Mon, Jun 12, 2023 at 01:27:52PM -0400, Eric DeVolder wrote:
>>> The Kconfig is refactored to consolidate KEXEC and CRASH options from
>>> various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.
>> 
>> This looks very nice!
>> 
> Thank you Kees!
>
>>> [...]
>>> - The boolean ARCH_HAS_<option> in effect allows the arch to determine
>>>    when the feature is allowed.  Archs which don't have the feature
>>>    simply do not provide the corresponding ARCH_HAS_<option>.
>>>    For each arch, where there previously were KEXEC and/or CRASH
>>>    options, these have been replaced with the corresponding boolean
>>>    ARCH_HAS_<option>, and an appropriate def_bool statement.
>>>
>>>    For example, if the arch supports KEXEC_FILE, then the
>>>    ARCH_HAS_KEXEC_FILE simply has a 'def_bool y'. This permits the
>>>    KEXEC_FILE option to be available.
>>>
>>>    If the arch has a 'depends on' statement in its original coding
>>>    of the option, then that expression becomes part of the def_bool
>>>    expression. For example, arm64 had:
>>>
>>>    config KEXEC
>>>      depends on PM_SLEEP_SMP
>>>
>>>    and in this solution, this converts to:
>>>
>>>    config ARCH_HAS_KEXEC
>>>      def_bool PM_SLEEP_SMP
>>>
>>>
>>> - In order to account for the differences in the config coding for
>>>    the three common options, the ARCH_SUPPORTS_<option> is used.
>>>    This options has a 'depends on <option>' statement to couple it
>>>    to the main option, and from there can insert the differences
>>>    from the common option and the arch original coding of that option.
>>>
>>>    For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
>>>    KEXEC_FILE. These require a ARCH_SUPPORTS_KEXEC_FILE and
>>>    'select CRYPTO' and 'select CRYPTO_SHA256' statements.
>> 
>> Naming nit: "HAS" and "SUPPORTS" feel very similar, and looking at
>> existing configs, "ARCH_SUPPORTS_..." is already used for doing this
>> kind of bare "bool" management. e.g. see ARCH_SUPPORTS_INT128
>> 
>> It looks like you need to split "depends" and "select" so the options
>> can be chosen separately from the "selectable" configs.
>> 
>> How about naming this ARCH_SELECTS_<option>, since that's what it's
>> there for?
>> 
> I'm OK with this. Let's see if others agree?

Yeah please rename one or both of them. At a glance the difference
between HAS and SUPPORTS is very non-obvious.

I like Kees' suggestion to use ARCH_SUPPORTS and ARCH_SELECTS.

cheers

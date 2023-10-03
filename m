Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0997B7115
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:36:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=srXfPsAw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EcUcSEYh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RPB66t3z3vjy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:36:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=srXfPsAw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EcUcSEYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.26; helo=wnew1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0P8P0323z3bpd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:55:32 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 66DFB2B0020A;
	Tue,  3 Oct 2023 12:55:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 03 Oct 2023 12:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696352123; x=1696359323; bh=bM
	N3ahYNWDfnd39aNSh3WGWAh25s8Cnm4TD3ZVFC+Qc=; b=srXfPsAwKo7LL9NfzZ
	ZItCto4wxQFdX2Ds/QUIfXcIE68COCFLlMXykreKXi75ko4ATOQbJvAGslC8kSuZ
	wNtj+47ZX6iCzbpT1jEuOXWHD5ZyBGvYKs+pUETvCJ12NkEnZHiweqIjRI/yWhc4
	ljwntdK0mND7A0Gn/3Kr9JCfJNZ7rf9F0CsEXEY1SoniFgkPLZD+FrezdVP+3dDZ
	YdgCxQKY8bSbX6+YutOAJhlELThomcIbwa/alKeicNv4Wq/40uqjQlOx89o6mYX3
	OFOWaLXQExfvNxdFGryYmNJ+5/4yKUy33Vsz/t+SC68okj9ywHR1yme0w/ZQ3NV0
	a3eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696352123; x=1696359323; bh=bMN3ahYNWDfnd
	39aNSh3WGWAh25s8Cnm4TD3ZVFC+Qc=; b=EcUcSEYhWMQwyrhir+g5g31Hgm39M
	EWL5N9E+aQSymOo0iJYm4k87C7EHcOKm4X0omB5xbtPFD+TX575loxNOIqJUOh9e
	qI0jdEqmGjyZmbUF0LagoGQAe2phUR+4BpXikHJ6Emd8nLjqKisBsNo2lVR3IIiG
	r6BoDO4JV+BIxq02KEwDaj8OqpfPhPpVQB5Vc2EJEcjsVRqVRKwYXurljWVWHgoz
	DCuFq+Os6TmEtMV18PFTi15Zso9YytX7/ZjKbu1QnVAPti01It3iIOyQ7K8aiB59
	oAUwH8ZTZHa01rpn6ANpn/SsKh2cmMiED/QK5nDTh6LKCYWxdMS74zwEg==
X-ME-Sender: <xms:eUccZb5jpCQ1L_VpEXS5ffys7UxBL4kr8p_8cxQFdFQzA4W3bfYYug>
    <xme:eUccZQ5IuUrlgYNty4cvwj_liKVUdhmTFjrzWMhhA-4hKFU9WkVrNtm4G3JcCCE4J
    TABzdnOVnI8NnaEhXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeejgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:eUccZSea6M-vbkLWtRlxBrICjW4w3maEXJlLBg6BGEg3iRNBOmQH5g>
    <xmx:eUccZcIYYLMtmvgNXBhbyezZbbau0FaCohP0oM2XsGnvgv9bQ5csoA>
    <xmx:eUccZfKaRAEmGGd6jK5cgyNwVkQ4mbICOjMLM_AmPXyMEvFnrCgzKg>
    <xmx:e0ccZZRPPQXF-lklqyo6OsUpfMBJpzzJniuMs7wduw3grDX6cmvMcz1mfdA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 48524B60089; Tue,  3 Oct 2023 12:55:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
In-Reply-To: <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
 <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
Date: Tue, 03 Oct 2023 18:54:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sohil Mehta" <sohil.mehta@intel.com>, linux-api@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for all
 architectures
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.co
 m>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel
 .org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 3, 2023, at 18:35, Sohil Mehta wrote:
> On 9/14/2023 11:58 AM, Sohil Mehta wrote:
>> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
>> recently added support for map_shadow_stack() but it is limited to x86
>> only for now. There is a possibility that other architectures (namely,
>> arm64 and RISC-V), that are implementing equivalent support for shadow
>> stacks, might need to add support for it.
>> 
>> Independent of that, reserving arch-specific syscall numbers in the
>> syscall tables of all architectures is good practice and would help
>> avoid future conflicts. map_shadow_stack() is marked as a conditional
>> syscall in sys_ni.c. Adding it to the syscall tables of other
>> architectures is harmless and would return ENOSYS when exercised.
>> 
>> Note, map_shadow_stack() was assigned #453 during the merge process
>> since #452 was taken by fchmodat2().
>> 
>> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
>> syscall tables.
>> 
>> For Alpha, map_shadow_stack() takes up #563 as Alpha still diverges from
>> the common syscall numbering system in the other architectures.
>> 
>> Link: https://lore.kernel.org/lkml/20230515212255.GA562920@debug.ba.rivosinc.com/
>> Link: https://lore.kernel.org/lkml/b402b80b-a7c6-4ef0-b977-c0f5f582b78a@sirena.org.uk/
>> 
>> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
>> ---
>
> Gentle ping...
>
> Are there any additional comments? It applies cleanly on 6.6-rc4.
>
> Or does it seem ready to be merged? It has the following
> acknowledgements until now:
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

If you like, I can pick this up for 6.7 through the asm-generic
tree. If you think this should be part of 6.6, I would suggest
to merge it through the tree that originally contained the
syscall code.

      Arnd

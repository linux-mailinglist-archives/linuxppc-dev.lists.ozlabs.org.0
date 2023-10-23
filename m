Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D674F7D3BB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 18:05:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YxgVjGh0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=goUABzr4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDg5H5P2Xz3cHf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 03:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YxgVjGh0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=goUABzr4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDg4K2bbQz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 03:04:32 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8937F5C035C;
	Mon, 23 Oct 2023 12:04:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 23 Oct 2023 12:04:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698077069; x=1698163469; bh=om
	I9l4fCxrjkUcM6JOxkmrHVP/pj0MGxudyGyoWqQuM=; b=YxgVjGh0doHzbzLi6q
	PClGd5HsxejBbgx4/5RYmtv09+HQiwZyaplfE0ewOGHiZzudSB0S0OL4Jiqq0uno
	HLmpLafWY0qN31re7VYCs5H6sSnmT22PQ/FroqKVZiCs5uHKY8oFQ4unPLZ/8cZ8
	O3WvNiXOfjxKatsocYQ/Jy/kFCsfdj9aK7yXnJ2qoaQEY4+YNBKvOBqKd34f8Mzg
	+9wsurB+1CVTUSJi2XymLm4v7rGK+FMAXIK03s6+HdkrM5s4RUEdsyuZb+fp0NVu
	EC5Nf2uyZcEkgvV7qC8wKZmmCNnbMvTbCNH7D2eD2/4uqUfXGaMowPbfcQCg6/xu
	jpdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698077069; x=1698163469; bh=omI9l4fCxrjkU
	cM6JOxkmrHVP/pj0MGxudyGyoWqQuM=; b=goUABzr458FRgBTpbBm0q4IpvczdQ
	KTIemYL/NQhTZLhC/R8Z0ECg7u4Rzies++Bue1MGJNA98zrqnpWljNwQpoGs3A2C
	9KzYFHanyP9UlexGaMOIS5xcW/XDhcr8gJMd6nGFY8ojDRdRHCwrSJtQzU1NxG1u
	2M4Yxn9QZzcuk0Bo99b9Ro9Bf/XkUlEZ4U4vIRS6cEL9QibvirBy2+fzQMP1M16X
	8tCg2cYkJMgX6RpYI47knEJ0GcEWwVcd2pkpRAQdc/nBAiET6Mb6xynZ5eVU0Fth
	ZpzCQEhPJi0wC+zg9GGFGpRQx32w8YTxcFQhKPoQQi7J4hWuMSFDcadHQ==
X-ME-Sender: <xms:ipk2ZVhT4Q7U3rlVPfW6JKAMtC2N9okTbizpJ3P3Oap_eMJvxcPZrw>
    <xme:ipk2ZaCo5zM_znjZySQclLg6gH4Ce9b1PyWyyo-56ccAgas4botCTMAJRpvpOjTjF
    -mcRos6BJhhm8WMcEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeeigdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ipk2ZVHkAmZgTGbdYztn-3M84qLcVS8pe1rA4bds0EXimFGYSKjFRQ>
    <xmx:ipk2ZaRo6wVWBh9dfhMu9_4kRJVuwNrd8B1V16--Pj3fDp5R2XUXhw>
    <xmx:ipk2ZSyqsvA_VFvYy1yKK8DuNSTwo8Z7XkmtezqUoocM4oqGoW5u8w>
    <xmx:jZk2ZeGTfhPPESNsU1_qLoddAy-LAJrJ7kEMiBqqu0ThAmA8qoLoig>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 78236B60089; Mon, 23 Oct 2023 12:04:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <67ddd260-d424-4229-a815-e3fcfb864a77@app.fastmail.com>
In-Reply-To: <20231023-thievish-imitation-c7c4b36d76f1@spud>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023-thievish-imitation-c7c4b36d76f1@spud>
Date: Mon, 23 Oct 2023 18:04:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Ard Biesheuvel <ardb@kernel.org>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 23, 2023, at 17:37, Conor Dooley wrote:
> On Mon, Oct 23, 2023 at 01:01:54PM +0200, Arnd Bergmann wrote:

>> index 25474f8c12b79..f571bad2d22d0 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -687,9 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
>>  	select KEXEC_ELF
>>  
>>  config ARCH_SUPPORTS_KEXEC_PURGATORY
>> -	def_bool KEXEC_FILE
>> -	depends on CRYPTO=y
>> -	depends on CRYPTO_SHA256=y
>> +	def_bool y
>
> This being the problem, KEXEC_FILE is 64-bit only.
>
> IIRC I commented on this same thing during the original conversion
> patches.

Does it work with this patch on top?

--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -687,7 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
        select KEXEC_ELF
 
 config ARCH_SUPPORTS_KEXEC_PURGATORY
-       def_bool y
+       def_bool ARCH_SUPPORTS_KEXEC_FILE
 
 config ARCH_SUPPORTS_CRASH_DUMP
        def_bool y


     Arnd

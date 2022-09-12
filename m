Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7C5B57AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:58:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR29C3prlz3blj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 19:58:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=n3V9ypZz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F7leqZoM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=n3V9ypZz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F7leqZoM;
	dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR28T53Chz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:57:44 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id C60F42B058C8;
	Mon, 12 Sep 2022 05:57:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 12 Sep 2022 05:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662976659; x=1662980259; bh=AanEH5/4SF
	+uGN62tgMr3BbxltTx5TbWLBHzNtC4kbc=; b=n3V9ypZzfNfMP8MOIVf4kP7DRE
	S5M7aXfZPym/XTrXhZgSFPP2Z6XOk3hnb8i8JJZcluzIS5qMCA0/qvAMR98TQrnX
	iqG06sGvBMXudjAYJrjdE0OdYxNp3SoMeSnfnkJBNj4RXYYC/yM6lorSd2L5rarA
	WoL2GVVLKrJwIyffcnM4ADWBWKMADQdyJsW/grq3VxbDsoiwg2nJp3/CXhooEbRW
	Xe5DokAY0l5LvKxYOfbXkUrZvBILXfB8+CkHatl7oa8SC+LD06rSGVdntAbCElZK
	/y/wyWrHCcVig8ESBlqCjzTflGkpOQbtktfW9lX+5bdFFqnotnDI/IF251OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662976659; x=1662980259; bh=AanEH5/4SF+uGN62tgMr3BbxltTx
	5TbWLBHzNtC4kbc=; b=F7leqZoMMjhiewo3f4p7mrCQyIGrRAt4uM4UBAsMsaAQ
	8oiyac5rYp7rUQdltlUuYun/te+wHdHRWBwWs5ip5CSjoPzwXQmGbOJBXCaI7X4v
	I1qzEZHjkA/58aIddgdIwFTnaqPUMq/OEy5A2pZPUKjfWlzci1dMlR1m0F7mO7r8
	WMUS7E//AeXHgjJk64Z6ShxyAilCXDx/2ZP1k5Nrrab3+rmWd1QeYBUzjjtwPdXp
	11YIvParduDNqoG6q+dgNePXVbA6u8L69vmXi9VNLWguJto5BllwXbMxXk+zaj5C
	zWflty31HtMYUTjg3nhL/M/r1AAtrG8tR4mcge7eIw==
X-ME-Sender: <xms:kwIfY7gcT0uBokqIAE59GdZ_ztFvdsVgv4IJBk4hdyUFAlU4GCCjsA>
    <xme:kwIfY4CmEnbMR6oi_UHGeApI0j1lfAXOD3ukPHNWGlIjwbAhNVJeQyFuLtIWfijH2
    5rdMG8ZgWVzE-rUuFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduvddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffgeffuddtvdehffefleethfejjeegvdelffejieegueetledvtedtudelgfdu
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:kwIfY7E86Hzy6OA03VjewWIIhiDM7VKs7-dGXfeRZMR4kR65AyKHew>
    <xmx:kwIfY4RJeIu4uxhdy_l88tE_nIde-iZGIJT51PgXpjLnQV8Dtu5e-w>
    <xmx:kwIfY4ypN-6HxYTBuLolI0YoPPahd3UV3IRi0cCIN2O3fRbXfA7pag>
    <xmx:kwIfY-begzSki_7i3rCv8OwzfCGcMVFi11U9WFoIISM3M79Q-T_EzV5rA8g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6757B60086; Mon, 12 Sep 2022 05:57:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <e14f1d52-e37d-4a00-a879-d755a5095d48@www.fastmail.com>
In-Reply-To: <CMUACJ7N6P9U.2UABBGZM71SQ6@bobo>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-3-rmclure@linux.ibm.com>
 <CMUACJ7N6P9U.2UABBGZM71SQ6@bobo>
Date: Mon, 12 Sep 2022 11:57:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicholas Piggin" <npiggin@gmail.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 02/20] powerpc: Use generic fallocate compatibility syscall
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 12, 2022, at 10:38 AM, Nicholas Piggin wrote:
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> The powerpc fallocate compat syscall handler is identical to the
>> generic implementation provided by commit 59c10c52f573f ("riscv:
>> compat: syscall: Add compat_sys_call_table implementation"), and as
>> such can be removed in favour of the generic implementation.
>>
>> A future patch series will replace more architecture-defined syscall
>> handlers with generic implementations, dependent on introducing generic
>> implementations that are compatible with powerpc and arm's parameter
>> reorderings.
>>
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Remove arch-specific fallocate handler.
>> V2 -> V3: Remove generic fallocate prototype. Move to beginning of
>> series.
>> ---

>> @@ -16,6 +16,11 @@ typedef u16		compat_ipc_pid_t;
>>  #include <asm-generic/compat.h>
>>  
>>  #ifdef __BIG_ENDIAN__
>> +#define compat_arg_u64(name)		u32  name##_hi, u32  name##_lo
>> +#define compat_arg_u64_dual(name)	u32, name##_hi, u32, name##_lo
>> +#define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
>> +					 ((u64)name##_hi << 32))
>
> Is there a reason not to put this in asm-generic/compat.h?
>
> Possibly you want to put this with the other compat definitions and
> above the asm-generic include. The generic header expects the arch to
> include it after defining what it wants to override.

Yes, makes sense. I think the riscv people added this to asm-generic,
they tried to do only the minimal parts.

In theory, any architecture could have its own calling conventions
for each syscall and have them in the opposite order for one
endianess. I checked the seven non-generic implementations of the
sys_fallocate() syscall and all except powerpc have the same
ABI as the generic one.

The powerpc difference is that in little-endian mode, only
the 'len' argument is swapped but the 'offset' argument is
still high/low:

long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
                                    u32 len1, u32 len2)
{
       return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
                            merge_64(len1, len2));
}

It's probably best to first fix this by using merge_64(offset1,
offset2) and allow that patch to be backported to stable kernels,
before changing it over to the generic code in a separate patch
within that series.

A related issue seems to exist in ppc_fadvise64_64(), which
uses the wrong argument order on ppc32le compat tasks, in addition
to having at least three different calling conventions across
architectures.

      Arnd

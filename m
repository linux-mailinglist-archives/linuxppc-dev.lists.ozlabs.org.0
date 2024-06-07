Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CE9005F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 16:12:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YyrtcjUX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YRsTiXvq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwjpH3VM3z3cXL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 00:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YyrtcjUX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YRsTiXvq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwjnT6N9Zz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 00:12:13 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6B36B13800D4;
	Fri,  7 Jun 2024 10:12:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 07 Jun 2024 10:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717769530; x=1717855930; bh=INQDVUt3zv
	kdBbSzkPvyjoHwhwcMzQA7bETzh/itaN8=; b=YyrtcjUXNNnFS59RukiM2VgRDV
	7NzuuzQnmtFqKzlZoI6yOs7QLxWYq2iwRhw3mKKxvCRKa6LCMqRN+dOZ/jYOYr2S
	xaBy781VNVw7/8PnWD8dewvpQ0iUoILS8HKhAF4zLrRH+7HQ6Zlqayda9oTtPSZt
	Rfy6raVdB55pVAiLBue3tpVWZ4wS26pkYUix6nfmaUse0LUUOGUCh2dgSTqCY9RW
	4sLsc/ftzjC1NqnRty68kISenbb0/hKXvO6GQnGIRdTCT28p2IdGtErcJBX9hu7s
	Ia7FWIVrU+AG4Y0e5ezduYoTM8x8fcIcPeRSMFZvpjtGy3C8HHw9bF+xgLbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717769530; x=1717855930; bh=INQDVUt3zvkdBbSzkPvyjoHwhwcM
	zQA7bETzh/itaN8=; b=YRsTiXvqVEiSCF5FjBDzt4UspukrE6jRNuQrOQTL+zfd
	QX0qERkqzp/UV11ZVEf+88FyR0D52HKgakrg6nhnQFDP5wWPGhUEHYqvQ2z9XyAc
	SBfE5S9XsHMeGzfU6VfBaRL38/SiU1Z04zjgQ0vTOU8fN97eS5+TW0ZtDKsRy717
	XPpSi1siN1eifuIRbYRnEVcGLmHVOB2IGuGjsAKQruRWbi8vEOLaQPszzGivVY52
	uU26p6Fc2fPN8kJ/JJRUuUrLVrkRdTeRJOwNNFHNQbdD+H26IuJHuehEPsxVffOH
	u93XYskDZa6gfqupgxuiluS+vk+Xu75w4xpXcl+sWw==
X-ME-Sender: <xms:ORVjZv3zJ0YztQZcHJsy_txTMcc4h7eyPzJ51gQAIgNgNRDSgmOffg>
    <xme:ORVjZuFMal_-XCJFWzUMS-ZaEPu4s0H0YB-ukvHK5pR8Olo5WQjW6wmaMTd3m3U4t
    x_JE-7JF9pDHnRlkEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ORVjZv45IRbbg0GLh6zoKd-Bz1XyjfNc5JYAiV8W9hT5AemWrLC39g>
    <xmx:ORVjZk1RS0UkNN5y33fPqqrTeB-k3ND6cn7QuycKjfgOBJHFQufp1w>
    <xmx:ORVjZiGQXCFqb5tGyNOPm7ZRcTRDIGtjORriP1hGK8h2hEUHhCiGQg>
    <xmx:ORVjZl-gOVsrm3-xW_11CdcRTMRpdIveiHbh9xscMlrqoro8VCe31w>
    <xmx:OhVjZq9s-3CG3GOJlRiOBjDMpI9Z5a5d2QKyYdbwZi5urMECgoMurNzn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31CB8B6008D; Fri,  7 Jun 2024 10:12:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
MIME-Version: 1.0
Message-Id: <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>
In-Reply-To: <87frtoq5yz.fsf@mail.lhotse>
References: <20240607061629.530301-1-arnd@kernel.org>
 <87frtoq5yz.fsf@mail.lhotse>
Date: Fri, 07 Jun 2024 16:11:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 7, 2024, at 14:42, Michael Ellerman wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> I'm fairly sure this worked in the past, but I did not try to bisect the
>> issue.
>
> It still works for me.
>
> I use the korg toolchains every day, and kisskb uses them too.
>
> What commit / defconfig are you seeing the errors with?
>
> Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
> here and it built OK.
>
> I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
> that makes a difference.
>
> The patch is probably OK regardless, but I'd rather understand what the
> actual problem is.

I tested again and found that the problem is actually part of my
local build setup, which overrides the 'CPP' variable in the
top-level makefile that I use for building multiple kernels
concurrently.

This ends up clashing with this other line that only
powerpc sets:

arch/powerpc/Makefile:CPP               = $(CC) -E $(KBUILD_CFLAGS)

It's rare that someone overrides CPP, so quite possibly I'm
the only one that has seen this so far, but it also seems like
it should be possible to do that.

This patch seems to work as well for me, and is a little
more logical, but it's also more invasive and has a
higher regression risk:

8<---------
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..9ad4ca318e34 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
-KBUILD_CFLAGS  += -mlittle-endian
+KBUILD_CPPFLAGS        += -mlittle-endian
 KBUILD_LDFLAGS += -EL
 LDEMULATION    := lppc
 GNUTARGET      := powerpcle
 MULTIPLEWORD   := -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
-KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
 KBUILD_LDFLAGS += -EB
 LDEMULATION    := ppc
 GNUTARGET      := powerpc
@@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)               += $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
-KBUILD_CFLAGS  += -m$(BITS)
+KBUILD_CPPFLAGS        += -m$(BITS)
 KBUILD_AFLAGS  += -m$(BITS)
 KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
 endif
@@ -176,7 +176,6 @@ KBUILD_CPPFLAGS     += -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS  += $(AFLAGS-y)
 KBUILD_CFLAGS  += $(call cc-option,-msoft-float)
 KBUILD_CFLAGS  += $(CFLAGS-y)
-CPP            = $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 1b93655c2857..3516e71926e5 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -59,7 +59,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 
 # Filter flags that clang will warn are unused for linking
-ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
+ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 CC32FLAGS := -m32
 LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
--------->8

     Arnd

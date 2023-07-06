Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F703749D53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:22:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DYU9YRbr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TfDw4vxX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxcdD3pw3z3cV9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:22:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DYU9YRbr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TfDw4vxX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxbDS3Xmcz303l
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 22:19:02 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id E8A865C02FA;
	Thu,  6 Jul 2023 08:18:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Jul 2023 08:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688645938; x=1688732338; bh=pm
	sCsD6NfrkTosVBZWjph1ykYGb9O3Dg+fhXVNC3Rvk=; b=DYU9YRbrNhTzBJuXfZ
	xZ+Y1O2XI7KfQRyTQF1V8a0rVq8MYc2l4H0B6U1/rBwlwbNvVvTCBUCgruY6Pxoc
	VaYF1h3LDB2oPT+5yxaP3YTkLrgAaErAuxO/cxKMd7pHGKSppM0I++Q5lIWr9nzw
	bxdZIxAaU+xs/SLqpbCdozn2UEGm5TT6M5c3WNNmobtsyNNvBu6KcsHLTywYQsSR
	HtmKZFhQxqax14K0B8DsN6GQIZQck5yQSMFP6o4GM2GDC2jn0q3rPBVQqtylth+I
	ISX60SEJu5ruEE8cuZmgIMGJq3+lbX3zaRBPrORf/LsaMI4hGMUkAx+lAYjUt2zg
	o7Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688645938; x=1688732338; bh=pmsCsD6NfrkTo
	sVBZWjph1ykYGb9O3Dg+fhXVNC3Rvk=; b=TfDw4vxXnxU9vNA6hgCsyajS/OCts
	wQszxsaApShKlVvMRQdDbyNtIWQ+FkjIpzybYwnCBdjxcaVoWSCXr3brSE996vlG
	1PKuiTvK/Eri8Cf5hnKLtqQy7v1D4Lrf+WDqzYrF2UBnOYiJw7iDiRnBmDhmYUyP
	yR48T+Z9lKy0yu8WGApPh8AMbRFKyjIagsFjtaFjxi31mrREHRRtg9G+fJ35WLER
	RTm5PTA/LfOkjDr0eolviLd3yvayhNR0dgWpj/KjK8FNFM6KUmlR6EChEssKMFxK
	vPabKnTuSWQ0naxSVR4eWja+X3+iE1xWMOlFN7AHnoLKi74y/DdDnk2ug==
X-ME-Sender: <xms:MbGmZCnXRz8rvIIm-02xlguovFCy3cCMiGr6P8JkTytqrGFEIwkBXg>
    <xme:MbGmZJ2Op6wwSngvS53MLCr6dcHZ91rJIsWui0mJbwQRHkh8Mm2a0SzG137XXoPI5
    B0vrIBwLhW2ykG5mdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MbGmZAoflaPhHqipkdsi5mRnq0UbEnAE7k1e13rOugyz-CK1O69kqA>
    <xmx:MbGmZGmffC6G5IeDL4PkqNLjcETC6c9EAQF_I979pIoiYgbQnbq4DQ>
    <xmx:MbGmZA36VwFVduytTatUjarqPPwSpX4vSvCVpKuq7oPx5XBXNbHlZw>
    <xmx:MrGmZI5pH4RZaybwhVCry2F9J71hviXYyMNQoff1YN9MX9L3C13eWQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3EF87B60086; Thu,  6 Jul 2023 08:18:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <c057ba7a-3cc2-44ac-a961-fa062b909876@app.fastmail.com>
In-Reply-To: <20230705142004.3605799-2-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-2-eric.devolder@oracle.com>
Date: Thu, 06 Jul 2023 14:18:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric DeVolder" <eric.devolder@oracle.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org
Subject: Re: [PATCH v4 01/13] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Zhen Lei <thunder.leizhen@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, tsi@tuyoix.net, Alexander Gordeev <agordeev@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Baoquan He <bhe@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Juerg Haefliger <juerg.haefliger@canonical.com>, borntraeger@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Xin Li <xin3.li@intel.com>, Nicholas Piggin <npiggin@gmail.com>, Russell King <rmk+kernel@armlinu
 x.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Zi Yan <ziy@nvidia.com>, hbathini@linux.ibm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nick Desaulniers <ndesaulniers@google.com>, sourabhjain@linux.ibm.com, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
> +
> +config CRASH_DUMP
> +	bool "kernel crash dumps"
> +	depends on ARCH_SUPPORTS_CRASH_DUMP
> +	select CRASH_CORE
> +	select KEXEC

Today's linux-next now runs into a warning on arm64 and
presumably others, with the same problem as on arm earlier:

WARNING: unmet direct dependencies detected for KEXEC
  Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
  Selected by [y]:
  - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]

I think the easiest way to make this reliable would be
this fixup:

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index d82a7ce59c051..e58ca6128d6ee 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -91,6 +91,7 @@ config KEXEC_JUMP
 config CRASH_DUMP
        bool "kernel crash dumps"
        depends on ARCH_SUPPORTS_CRASH_DUMP
+       depends on ARCH_SUPPORTS_KEXEC
        select CRASH_CORE
        select KEXEC
        help

   Arnd

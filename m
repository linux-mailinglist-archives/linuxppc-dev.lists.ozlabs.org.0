Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4373D73304D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:45:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dr7CzoJH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjHRP1Bq6z3bpt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:45:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dr7CzoJH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjHQS0nsgz30MS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:45:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7401961EB6;
	Fri, 16 Jun 2023 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29582C433C8;
	Fri, 16 Jun 2023 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686915898;
	bh=SBlkM7J7cvJwutjgEGnThrak9ds+eyJewMFlSVnYUvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dr7CzoJHNGeu3w3PgQKLWgVwS9T8cogmFWxroVNKHQZDVRo1UlUd3ic6QqjbwPyzL
	 OrTkekqfG41TcJ3iuPiKUyrB43uuzPMT/0N+uNrFSxpmmBrDSUdTB52vLORYSlSGYC
	 zBPrNwFYpqJ6pHwJkfuoCJg83QW4DoAAZMoW7rg5cWa/X5mOB3ohe76UHlwkbmHF3A
	 /s/K3g9D3SAsQdF/x03HA66saxLvv2vv83w0xLa5tpsgpmppcvsyNqXALWojA66hpv
	 A4m1rairPJ1Asf5I3bxm4yZMgl9hnWw00dt40QPDw754Cvio4MJWVbW7zmCUuCnxMU
	 OmX7v0eMaso5Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] kprobes: remove dependcy on CONFIG_MODULES
In-Reply-To: <20230616085038.4121892-13-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-13-rppt@kernel.org>
Date: Fri, 16 Jun 2023 13:44:55 +0200
Message-ID: <87r0qbmy14.fsf@all.your.base.are.belong.to.us>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> kprobes depended on CONFIG_MODULES because it has to allocate memory for
> code.

I think you can remove the MODULES dependency from BPF_JIT as well:

--8<--
diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
index 2dfe1079f772..fa4587027f8b 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -41,7 +41,6 @@ config BPF_JIT
        bool "Enable BPF Just In Time compiler"
        depends on BPF
        depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
-       depends on MODULES
        help
          BPF programs are normally handled by a BPF interpreter. This opti=
on
          allows the kernel to generate native code when a program is loaded
--8<--


Bj=C3=B6rn

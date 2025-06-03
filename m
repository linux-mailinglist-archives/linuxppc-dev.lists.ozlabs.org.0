Return-Path: <linuxppc-dev+bounces-9089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14DACC259
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 10:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBPVc1kNdz2yKq;
	Tue,  3 Jun 2025 18:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748940472;
	cv=none; b=Q4LstxmZPlqBJauew/NStrEcxVCgR65XpCeUe9KOXv4+qeXGqhlFiuCYQnUiAr+Eo+xSVidCvK0+s3BrsWhvENqV9Hknt9FMX6PF4JJWUmcOadPpBX19d2PghfxgJAw/rn6zTAftT6aOpU2RBdEi9AhHBa9c4Sw48GeUj04mTW8FbnTyjMkcDpygG7mzDhZ3LfhZBRXYyP/1R+Z595AXjWDtmNXTuvDy6WouGvJRfTUHnTxCy8fZx84YRpFTn42petaOmxHMANs1hLf/BISRjGg37QIjJFc5hAKkFgOK8ReBhI5EKVZvTvnQYq9ntZw8vafzTW6qAr5Y2ZjuJZB8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748940472; c=relaxed/relaxed;
	bh=ll9HQg8JHducpOZaqvXxVZxIxZ1+gNQW3g36PYXusgc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D184apIpf1wni7JVgE0RuYSD4T475R6a5+fXCGywzEpHebNxGRbHWeGuoBW6gSKieenwgX11yuSEGYUjS3lNotB24AZmizhBVfg/UULvsUy27LKuJbFzf1FBIXMN/5e9VGJKvm+yLSuZS8RzD31582fig3vEHTpgBzvbO2SJfwB0qrZuLm/uHoWBh/Z9mk5LsS5F6ijceemIoziHvze6tKEnWWWDbrKeF/TUoifqUE1xv2IKMYetAgmgTbWj7uQV6cBNCu/6pxuNmk4szgRx6T9C8oEH//2DGgz5bnqKzXWGGqG7XVdn5cbHhqFfoEgFifaH316+MHorVo07vL+p8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=PCOFvjCs; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=PCOFvjCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBPVb1CR5z2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 18:47:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ll9HQg8JHducpOZaqvXxVZxIxZ1+gNQW3g36PYXusgc=;
	t=1748940471; x=1750150071; b=PCOFvjCs62+bZT4aOU9C/znSe4j5RqsCUHpL3BM8e+Uwat2
	l+zn3D1v/9CjOm1Nd+EkPtK28S10hC/vfdYQ8E96VFPo+GpP1ve637LYR8aDBNDNnKwa11Un1y/vB
	pFFJwyEQQ5LiVsUrrQVlReXeto10hW3v2IiYe3qqyPWpumx8elJr8FZ9PNk1QK1g1CYHo9HsA6P6w
	RCZn3ikA1zQicKy3nhFQXGyVBybwTAWbi/e/jOR8shK/HwByVCJOoGxm/mLBssw/TsbV46fadwj1O
	j/3zZZDF7IeMiP340EExHdkxGeHy+j6ZdsgEw3DU1HYVJ830OGckL2kFqOTQ9OsQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uMNIR-00000009mC8-119O;
	Tue, 03 Jun 2025 10:46:59 +0200
Message-ID: <b4fe62d12be677dc047ee2fce4a65284a5f915e8.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: Johannes Berg <johannes@sipsolutions.net>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev	
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, Andreas Larsson	
 <andreas@gaisler.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Borislav Petkov	 <bp@alien8.de>, Brian Cain <bcain@kernel.org>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren	 <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens	 <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen	 <chenhuacai@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, John Paul Adrian Glaubitz	
 <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>,  Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Naveen N Rao <naveen@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley	 <paul.walmsley@sifive.com>, Rich Felker <dalias@libc.org>,
 Richard Henderson	 <richard.henderson@linaro.org>, Richard Weinberger
 <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Stafford Horne
 <shorne@gmail.com>, Stefan Kristiansson	
 <stefan.kristiansson@saunalahti.fi>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,  Vineet Gupta
 <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon
 <will@kernel.org>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Date: Tue, 03 Jun 2025 10:46:57 +0200
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
References: <20250602181256.529033-1-masahiroy@kernel.org>
	 <20250602181256.529033-2-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-06-03 at 03:12 +0900, Masahiro Yamada wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.

OK, whatever you say ;-)

>  arch/um/kernel/Makefile         | 2 +-

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes


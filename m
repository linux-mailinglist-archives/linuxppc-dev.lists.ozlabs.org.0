Return-Path: <linuxppc-dev+bounces-10276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272BB07C90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jul 2025 20:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bj43S0pn1z30Vn;
	Thu, 17 Jul 2025 04:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4d48:ad52:32c8:5054:ff:fe00:142"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752689716;
	cv=none; b=M7F1M62bnLUbR06RTD+GkXECAMsDNMGkFw7zUfTcffzxD2kJqg1hMgBJVD910ds7nW7VjkA17AhMqZFOcL8LVkrjLBxMrliTM41BYIbIcxWBS4i2nrhvOHIM2KCjcg7A47BQxrT4pboWTGiAkUGJ9VOjInuQbwN+xEGH6H0bmog0T2j081WC/M9hmokD+V2XWDTHlVVIGGVD6UfCwPQ4HOzY4UC65Vu52IfwyOtUlriVVbc0TN4ce33oj7WNvwHKZKtV/KBNLPM/WjijwPOwOASHWoMNss4Hk3mG1GLwpFUV7zgi6taFfQzWPf18HYMMma43pn867to64zUg4vWUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752689716; c=relaxed/relaxed;
	bh=j/rIFur3u1rTJo3mQ89YHapN8kPR0kc82DFGfxLgJOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iONcGPp+QOPN3GxmuVr8SKK3pAf5JkfQtj+pCpX43bo1VH/byfqSoSNQaMHVgIhr/eVx49Z9iN29ijZG623UVSpNCAq6XM9FgkaRJkaxHSTGvbs51uSlZ4eY3Sw8TVfbyIjwJ7GVmsiR4dgz/sTlIGCsCDD0t+q8OG1i9awK9vwYMZJOQsnKzS2kd4LnoJn9UXl6sbnVtGu6vAPtBH+A/IixLrFRcIap2m4VMW/l+N8tviP9cylAuAB9m/X7XLCHFcVWmvoFVx7R+oHIiJD/eeRArZI4DKYRErqbxVb7J4OOaeWnxOGC7KVXq1HSnB1ue2UDh+m9ry3yuG9hSRVb0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=nRf9s6BL; dkim-atps=neutral; spf=none (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=nRf9s6BL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 958 seconds by postgrey-1.37 at boromir; Thu, 17 Jul 2025 04:15:12 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bj43N3fM2z30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 04:15:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j/rIFur3u1rTJo3mQ89YHapN8kPR0kc82DFGfxLgJOY=; b=nRf9s6BLgyLZd19Zq0n8/XzeaT
	LdIYLNiW4z4oi4MA3w2BCBek25oSOrhZ8XcpzyleTM/5SuM2dnCE8X2IN1fY4XF02MN0u0o/w7o+/
	BXK5tT7Nngm6VEQKAzarLu64KjC1zHm0osARGnNBRaSOJzAQTBVqTSgVCUR5io769aa33pkqg0Klq
	UjjCl8EoyWky+K3kmjxhwmz+159ClWBAoAk+GeDtMb/6pA/oHGkodOfSrEn4YCwUGtQ02pz9D/Oym
	S4R+vEsvs+G9YBBJckDetnAWXJTk+T1i0vJw0SDz0Cd6j6QJIV/W8Xmfday5WtRq/NdxL7Nikft3h
	+JKcvcMg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49400)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uc6Nh-0008HA-0J;
	Wed, 16 Jul 2025 18:57:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uc6NT-0001JC-1H;
	Wed, 16 Jul 2025 18:57:11 +0100
Date: Wed, 16 Jul 2025 18:57:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 1/1] uapi/termios: remove struct ktermios from uapi
 headers
Message-ID: <aHfn9z9_oIVgNGgx@shell.armlinux.org.uk>
References: <20250716164735.170713-1-hpa@zytor.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716164735.170713-1-hpa@zytor.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 16, 2025 at 09:47:32AM -0700, H. Peter Anvin wrote:
> diff --git a/arch/arm/include/asm/ktermios.h b/arch/arm/include/asm/ktermios.h
> new file mode 100644
> index 000000000000..4320921a82a9
> --- /dev/null
> +++ b/arch/arm/include/asm/ktermios.h
> @@ -0,0 +1 @@
> +#include <asm-generic/ktermios.h>

Isn't this what arch/arm/include/asm/Kbuild's generic-y is for?

Ditto for other arches.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


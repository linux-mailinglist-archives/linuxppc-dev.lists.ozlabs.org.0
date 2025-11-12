Return-Path: <linuxppc-dev+bounces-14133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74600C5452E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 21:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6Dqg1DvTz2yvR;
	Thu, 13 Nov 2025 07:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762977823;
	cv=none; b=TbhRQdQqfqZroPhVYiW3wdoxafF53Z5z8TKzwQUd7dB+8C5r8h/WAaucXW9XqsU/4Q5k7u6jrvriyCzOBYPtM9+vsiQDzl7VFSg+vU2zQpgFYp4uxI2aTRQ3zQR8sr8Guv53bQEYux6vXYDHKHgt37ur4yOAxaptqLvi4kfi6sYhbdjRaTolP7AgPq2OVFxx5SmIch11xJoM1O9H/w9o3ndquEvf+ns6TFQcbTd950EaCyAlGMIFMn3zAFG9drzvd7DMlJIOQyDncC4DO9SWNIte9n8+mmZHWMcIc/WlPPL3YV8NplkMykusr09X0q8fzShugaE6AQURzz4UyMK6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762977823; c=relaxed/relaxed;
	bh=H57JN/9iHGXxmrsKYOTMMOs+sS4zb60ocLeJI0CgIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftzTOlg3JirGBWNkYNb7fzKrJm2TPNRzD89UZmRglRPkWkdq8i9dUimWMBXQd7nboR2aPZ0FRAdcl0RgOO4vsx7Lqq2ImDYvnau1+g7fcpizDEJLkIFb7Yu2K3gog8QmCRa+Iobn0HBiZOQF2Ek1EQkVWCrHk4JqnrVZix4tTBsGkVkey6sIYZFqVo9mvNO3181hkZdNorA6LcqY7ffmh6amzhw0HhQLNI38eTR41owvgNN87W5d0q2Ha3YDMcrp7HDPOuzVcPpUlrr8f2+Ivxe8qo1bm456gb+K+8VFMmH5g8H07du1NqVgGbe7fZ2aS2WQ6Vrvs6l6uWnErsrdJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJlDjxq7; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJlDjxq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nsc@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6Dqf17t1z2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 07:03:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8BA601AF;
	Wed, 12 Nov 2025 20:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88134C116B1;
	Wed, 12 Nov 2025 20:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762977818;
	bh=zAvG1Qo2HuWOnUmKk3EcMjBeNxBNM8ZFtr9UpT/34Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJlDjxq7IfTUQQ7KUoqeZvLJ7e7liS62fkRaIr+cTAEO3z6jy+mhhshvOmd3bh8vc
	 LKQO04khJh2oTe+f9rb+O0G37uBzgRuvleSSc1k+8vfLQQV7cKjeurjC9gI6nKycv6
	 PtFT/rC0/q2cqD1G9etafq9EthszRCQfMIRlsYu7HBTVjs9du5ebCl4+i2pradypdg
	 uuGbRqvggNZ1Vq8SYiqLM6ZaYk0XhBHTie0iiVMSMc61PWlcq5ZLMdJpdkHbN/3sxg
	 o1Sg+B3yFgDuYTpbiL1bDCgFQIu50KZMRUyF2kc3V/3zdo4GQF+AkhnVV8Fo5aIP9W
	 TUrrjnu0wLLlw==
Date: Wed, 12 Nov 2025 20:55:55 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <aRTmSzzOmdhBy_lO@derry.ads.avm.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> It is possible that the kernel toolchain generates warnings when used
> together with the system toolchain. This happens for example when the
> older kernel toolchain does not handle new versions of sframe debug
> information. While these warnings where ignored during the evaluation
> of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> will later fail.
> 
> Example warning:
> 
> .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> collect2: error: ld returned 1 exit status
> 
> Make sure that the very simple example program does not generate
> warnings already to avoid breaking the userprog compilations.
> 
> Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas


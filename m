Return-Path: <linuxppc-dev+bounces-15703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EFD1D134
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drfGL2j6Zz2xlP;
	Wed, 14 Jan 2026 19:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768378890;
	cv=none; b=kyntscpXr159cLN1bf1Nd+xvD5+CpDJvGcg6SzgD4xO/1bFMcbSj3L/gbuKN6pOLTGcnpcG0zXnhclmauw4rRjgG1BcrDWuctPmTi5RqJeJu+amTs5+a+PrWknah+V/vla2f+ud6Rk3TmisWpJaa5dpjLsl8vpNwscs1CzmxWgAgudUDAkKlUeIb750S8Urp19SeHbqHtVMnJhvnC9GNPw99aZyCcUhEL8ONGoYS2OpUauLrPKAvCXs6N6n6vjIFj72qIWaEe6SmKr9x2USqj6RmombFO1GSJOGXOtlxceY+YbM0DrHg+pF8eBV7c+oH4We9trMNgOWi/ZGd8NCw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768378890; c=relaxed/relaxed;
	bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7Yeelp3yJxEN/siZ6xKU3iO5o6mNDgGiO3i/V1FcrHaMzAjeJwlCNIbcj/1phOzwTYA28MYg8s6+G2vTmUAWD4fSaGyAt2YIreJ9sUWVDUWwXNecUL/juuf8g8MffUv4IEC5BPB8i7AtZo5d1Bu9lfgqLucRAxPOd/l5+XmZULcCQQ4uL1Hqw19GfddAeOQtbXc4O2XV8iBxzOnPjgzJPk6b8bWPX+Rrny6GjpWStxp1zMpuTCz7CvNMQ9rzikLHYYtiK0uAMLZMWzbcKpZ8qx5Kqrbda7vvuO51I7DlOw3QMyrSRN9BNKjpig1upGsxqdajr7uNYtbVXlMClZxEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QKZMf7w9; dkim-atps=neutral; spf=pass (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QKZMf7w9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drfGJ5ZkXz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:21:27 +1100 (AEDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso4537811f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 00:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768378824; x=1768983624; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
        b=QKZMf7w94nGUgS1L2QqfiggY/cijhd3wFrtmo1dsfC0d3XjNVAgZgMvMv0/S3vNNrm
         bgNbDTYMb1UvEnGTdWILYQ00Q2DIzp3nSSpJEi0kQ4X9b0Z33lby8nq/lepT5n0lnW4H
         cpQe9pxlkKEm2CL7oeeZTma8u3BDxFtI//TzAMwegOb167rPSFEhf6vvkoPewuzQirOz
         hzoNmwbCcctAYXeuWuTGpAetD18h1o8NlwEwc1H2UdzmCIKca89fTgnB9S0PNuA8PH+C
         L0MZAW2J6ECBSXpgHSG9+BXs3cS7gyl+3lAg4WLfhQMeJU8O4CCYP7xUm6wh7M7yVLNZ
         7efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378824; x=1768983624;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOjWICKElajAktcnLTxDO0a0hjOrXuTPJG+TIiIDMlE=;
        b=DiAI4YE9JAN6sw9uizn1SR03fjm4YL2ZYy0xEKprJnqKSZPYKzYcyJ7xBnq+sWVpc7
         GgxefQ0uWq1J/oWXs/ciDmZD214i7ztaIlPaDqnU6a4b0ZAqygl2mKKq90NjrtytaPBp
         +3X7Yeo5SAs149C2NuysJ7fNi4hatDDjgAFhrVJiwVA0vBPIpF7HqTasUIZjJGaalIk7
         +YkqDAGspvUVVxSWv/4MbZA3XgmHmbwM9ZEbYCQ7rnkd2rUAKRNkiZdB8ythnSiKzKsF
         g835YaIGVxSg/2cbkULCgx4tB894DTjD9MJ/CgMbvHr7qydhq/Q5MEBqoJ9tkr5fiOrW
         CBOA==
X-Forwarded-Encrypted: i=1; AJvYcCVnLQhxZEje53PGnDl8RkHAW8JR2dcYL/oA9fDNUxebzBKDPPfg6/e7EkzQbHwMfZdw44KOJPNsYZMGao4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrRlwtE7laHZ4clYt4ooO/Yn4Ej92EY946lKlpYGMsGooPmucx
	AdCegwLzsTu4EymoaovYAt/lPdYeV/KovmulSMITFBQDgidCgu270HPDAGO/hThI8TY=
X-Gm-Gg: AY/fxX4gUl4BKAZ9s3FzjsyjBWI9SP16mdFBfbTbpotMprWSRaXzUz8AYF9e/a5XyHH
	gPJLKpNqJYvNRSiKq4NmemUceIqljZtvk10P8yuNbBduP9rijuPxpKRwufE+nLXw2ejk0EVHRRg
	S3YtD35LKkzJdsAZt5ANa7EwRnFs1fFI7KPj8rWmiRqmJ/R1xu13ttIL4acNfwaRvhgcdVb3Frb
	RDkFnVeLmFUwOR3+M8xoRpK/A0JTBsnZJDqE4kN+WBGlet4L8x6yQ54IEI5VfezeVJSy7y0R6Bx
	o2y3bY1qULABZTisHaJobIGOOGJFd09Dy/fSmaqvjYA/AZFsJyQL6XIQzUqEb6ea5D1VPdmHQbz
	CH+QeI85HdpY6NYYEH4qABVqT7pYr9SGL5ouI/RcpKgolTkisXra9qdsAH2J/pJsted/rPsY5zD
	ojtuP2mIQTXGdiDg==
X-Received: by 2002:a05:6000:40e1:b0:432:5b81:498 with SMTP id ffacd0b85a97d-4342c4f4a32mr1782744f8f.23.1768378823922;
        Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm49346913f8f.8.2026.01.14.00.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:20:23 -0800 (PST)
Date: Wed, 14 Jan 2026 09:20:20 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Daniel Thompson <daniel@riscstar.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 00/19] printk cleanup - part 3
Message-ID: <aWdRxBbJOEIZ-KjE@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan>
 <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
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
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue 2026-01-13 21:32:33, Marcos Paulo de Souza wrote:
> On Tue, 2026-01-13 at 09:41 -0300, Marcos Paulo de Souza wrote:
> > On Mon, 2026-01-05 at 14:08 +0000, Daniel Thompson wrote:
> > > On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> > > > Hi Marcos
> > > > 
> > > > On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza
> > > > wrote:
> > > > > The parts 1 and 2 can be found here [1] and here[2].
> > > > > 
> > > > > The changes proposed in this part 3 are mostly to clarify the
> > > > > usage of
> > > > > the interfaces for NBCON, and use the printk helpers more
> > > > > broadly.
> > > > > Besides it, it also introduces a new way to register consoles
> > > > > and drop thes the CON_ENABLED flag. It seems too much, but in
> > > > > reality
> > > > > the changes are not complex, and as the title says, it's
> > > > > basically a
> > > > > cleanup without changing the functional changes.
> > > > 
> > > > I ran this patchset through the kgdb test suite and I'm afraid it
> > > > is
> > > > reporting functional changes.
> > > > 
> > > > Specifically the earlycon support for kdb has regressed (FWIW the
> > > > problem bisects down to the final patch in the series where
> > > > CON_ENABLED
> > > > is removed).
> > > > 
> > > > Reproduction on x86-64 KVM outside of the test suite should be
> > > > easy:
> > > > 
> > > >     make defconfig
> > > >     scripts/config \
> > > >         --enable DEBUG_INFO \
> > > > 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> > > > 	--enable DEBUG_FS \
> > > > 	--enable KALLSYMS_ALL \
> > > > 	--enable MAGIC_SYSRQ \
> > > > 	--enable KGDB \
> > > > 	--enable KGDB_TESTS \
> > > > 	--enable KGDB_KDB \
> > > > 	--enable KDB_KEYBOARD \
> > > > 	--enable LKDTM \
> > > > 	--enable SECURITY_LOCKDOWN_LSM
> > > >     make olddefconfig
> > > >     make -j$(nproc)
> > > >     qemu-system-x86_64 \
> > > >         -m 1G -smp 2 -nographic \
> > > > 	-kernel arch/x86/boot/bzImage \
> > > > 	-append "console=ttyS0,115200 kgdboc=ttyS0
> > > > earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait"
> > > 
> > > Actually I realized there was a simpler reproduction (hinted at by
> > > the
> > > missing "printk: legacy bootconsole [uart8250] enabled" in the
> > > regressed
> > > case). It looks like the earlycon simply doesn't work and that
> > > means
> > > the
> > > reproduction doesn't require anything related to kgdb at all.
> > > Simply:
> > > 
> > >     make defconfig
> > >     make -j$(nproc)
> > >     qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel
> > > arch/x86/boot/bzImage \
> > >         -append "earlycon=uart8250,io,0x3f8"
> > > 
> > > With the part 3 patchset applied I get no output from the earlycon
> > > (without the patch set I get the early boot messages which, as
> > > expected,
> > > stop when tty0 comes up).
> > 
> > Hi Daniel, sorry for the late reply! Lots of things to check lately
> > :)
> > 
> > Ok, I reproduced here, thanks a lot for testing kgdboc, it's a quick
> > way to check that the new register_console_force is not working. Let
> > me
> > take a look to find what's wrong. Thanks a lot for finding this
> > issue!
> 
> Ok, I did a bisect and found out that the issue lies in the last
> commit, where CON_ENABLED was removed. After it, I then checked what
> was wrong, since everything was being plumbed correctly (tm), and then
> I found that it was not:
> 
> On _register_console, the function try_enable_default_console is called
> when there are not registered consoles, and then it sets CON_ENABLED
> for the console. Later on, try_enable_preferred_console it checks if
> the console was specified by the user, and at the same time it had
> CON_ENABLED set.
> 
> It worked by chance, but now, we don't have this flag anymore, and then
> we are not _marking_ the console on try_enable_default_console so
> try_enable_preferred_console returns ENOENT.

Great catch! Yeah, it worked just by chance.

> So, without any console kgdb is activated much later in the boot
> process, as you found it.
> 
> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it.

Yes, I have some patches in early stages of developnent of another
feature which would help here.

> For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.

I agree. I am going to review this patchset first. Then I'll try to
clean up the patches which remove the ugly side effect from
try_enable_preferred_console(). Then we could discuss how
to move forward. It might make sense to push this patchset
first without the last patch...

> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

Do not worry at all. It was a well hidden catch. It is great that
Daniel found the regression in time...

Best Regards,
Petr


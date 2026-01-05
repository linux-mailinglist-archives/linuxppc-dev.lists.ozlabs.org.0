Return-Path: <linuxppc-dev+bounces-15283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D041ECF56F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 20:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlQ4P382Cz2yJ5;
	Tue, 06 Jan 2026 06:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767617605;
	cv=none; b=IuYzG0po7JipRS9DdvFAEzdq7+zXcSBq4etmMJJiTg35KTDsGhbAU+/FSMHwxVgBUPcnnZN9JdRywecztUxoFtCY3p0ns3+cpuWYqmTKN6iCFaUKVxXXumUkwO7IU5Cx2v9DUZU60s6sUN3MZnyqrA6B5F3Ledx6PO1JL9UC88BS5bibDfutIesFsClO30gJ1h55klOC+yDArXHibPqP7gxvjYpg2i3w8BRz1v2OK/ddkOwXV59XXh37yRoE0Z3GMipuWoSd+dCmZWtQ378nxw9d2FX58KPpcrwqNoou8FSouXTs6gmfyZBWC+1HzfJFO1cABDljcJsJQpAf0aJigA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767617605; c=relaxed/relaxed;
	bh=DIfhp3vJVBySXs5/naEXyaaROJC4kEOY5dOC0TJhcN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP5F60wSdncw6AC9BBdJfCnKoV/b+xpNr55KPZK3OV0LOwtxORG3fhEvwR5GmGrBvUMZc0+bv1fKT4PrhamIG0HfhNYDxVN0PrK+tGtYLmIVVuAyxOxOz3bafASudLEd240VNsS4sBwVLXUEpkOTHjcU3vyahiTxnzIiyYwkwpVtj8FeIAIdQKdS0KSY8RB8CyCZWY5GeOLLPk7mtwiP58se8Ql3bu8b+oN6TLiTRddbvPbaE6VuqbT2Yi9K0kaNhlPDj5GUEC6S89hmGycNuzkwXrLZ4dMoekg/tUWP8KY3SQmq+Jt6MYbzNEqYbOJ8SW4xAt1qjbYN1srLqQrT6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iTAy4x1d; dkim-atps=neutral; spf=pass (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=daniel@riscstar.com; receiver=lists.ozlabs.org) smtp.mailfrom=riscstar.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iTAy4x1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=riscstar.com (client-ip=209.85.221.42; helo=mail-wr1-f42.google.com; envelope-from=daniel@riscstar.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlDkC3039z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:53:21 +1100 (AEDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so5733920f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 04:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767617538; x=1768222338; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DIfhp3vJVBySXs5/naEXyaaROJC4kEOY5dOC0TJhcN0=;
        b=iTAy4x1dwyjpvg0uaT/WzA/vMK1rYPC4iHuNcZmprAvTPc1EAppEGrcDsUtI/P1Cbx
         CnDKAaHwC/5nHBuDyumgpLW+SfGiMHCRcolpMh2MUppRJczIOiY42YJN8s/JIa5cgaL6
         CfuZ3LFIErppy7kHL52SRyKipGnMn3inXkrJiB98XT0UsPte0VPltX1ONZlaiTFSDdD8
         viKjHYiG2ZG58hwvx3leAxhvI6EjvDg0dLbZA3LVwcNBFrnfDdZHwzpbvdLqDwO0QWeA
         ae+CbCM8zWoOQgX5DkUiqhaxcVdWqf2W4HcNcf0w0qTXnRMsljgLIacn1CY6LBos0bS4
         AMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767617538; x=1768222338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIfhp3vJVBySXs5/naEXyaaROJC4kEOY5dOC0TJhcN0=;
        b=ukI7/CiUCi27RZQ4cJd4+lIy0eSbDkw9iaH1mZFqHbB75yVJLiAHEnsHtpOheqDMx4
         qqwgXjXZQ4frAtr1lq8etzxzGzij361jrr7EDPFq63xbsjpUDZfr4r8Zh7lz1HDK+wag
         JQ0ufDlQ9hnzBlJjSMJO1kX0/TymBV2Y0cPB5VPXNYHBiF7ChOmZYE+jCFCnztkaNcFi
         VvoQwWUZ7avNwfbz+buxLN/tTJhAhQoQ2KIy+AJL8n5x0xbF8yf60baFrmndlBDiMcF/
         dZTdN3NYg7s1iu4vZ7prIiqxVDtuRwDFV3H9NPS7E7Bl7RMl3BJ9K5h45GM1nAX5YnzC
         vyIA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+bnY6qCJwfIVp3GmKcEW7xD16BWQSKxpiGK7CNJc/lQ8VMpL6z/Iit3Gyxoq7kD5szMeKaZgd9PYVC8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhgCZlxzMfwETkbrPKSGeRDO6W/24J9+8okDWoEfib3sP/ksLM
	E+FguYeB73sB8mHvpfJB/xvsAYFSV7TbpWdkZVhC8N1MVb5MNDIdBm1EZKJheLqEhng=
X-Gm-Gg: AY/fxX52PKJsBMjw/CWuNebRSfkdUcTACq7+oBC/US7dlZZUNFPQvBvXUhg1QamX4Aa
	3uw/n8E3U3+dgqjpNxHEwZrt1+m2eLv9rSSfYQk6pHrrxBcIm0BkdYfSFgWpbBDA5lAC8VzclLP
	XlgLctCTfgE5OFW4Pnc8l3XS6c+J1En9tCX1PUlOhqWTJO+RjN2irG/gLqFDTJ0gusBc9BYFD1G
	pRTe7DCVFlXJ0kUxJJ392TgXEmjU1T9PNQWWffky9fkSk52nmK0PIM0J7aPfckIoan7Ru7xCivd
	kaNP0AUkbOLtUk3V7Dykb0OKR0MCpOOYrbe9xL9oQb7xkK/0jzcZmla8ubTQtd9jh3uV5Dl7o84
	ee4c+sdgQmAQ3iSWak24Z4zNn6zp1axD3wcKuQvWwJzxg3VkGMU6VDZMZeq7NT3yo1tZ2p9N4S7
	Ken4sBp/DqgDZCxtjj6QHiIXKs0MKHYSQuZw5CB1wDppW7ZsS+oBbuiK0mwVRgs2aqHFi57qbrl
	FB+uDCM+/YRzyP8QP3+mXE3Mrtaumu/NHoqphVVYfknd+lPK2Y6cqSbeChaaBwxexixTSwJSklD
	Laxm72Y=
X-Google-Smtp-Source: AGHT+IE4Mz004OZ0As7rWOFq5sPjHYJ4N8Pzam8+bOUXJdXGQOskOlJaecSDta7VRdPfx5XGGjwohQ==
X-Received: by 2002:a05:6000:1844:b0:432:8504:b8a9 with SMTP id ffacd0b85a97d-4328504b8e1mr37753933f8f.62.1767617537725;
        Mon, 05 Jan 2026 04:52:17 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm100029761f8f.5.2026.01.05.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:52:17 -0800 (PST)
Date: Mon, 5 Jan 2026 12:52:14 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
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
Message-ID: <aVuz_hpbrk8oSCVC@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Marcos

On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza wrote:
> The parts 1 and 2 can be found here [1] and here[2].
>
> The changes proposed in this part 3 are mostly to clarify the usage of
> the interfaces for NBCON, and use the printk helpers more broadly.
> Besides it, it also introduces a new way to register consoles
> and drop thes the CON_ENABLED flag. It seems too much, but in reality
> the changes are not complex, and as the title says, it's basically a
> cleanup without changing the functional changes.

I ran this patchset through the kgdb test suite and I'm afraid it is
reporting functional changes.

Specifically the earlycon support for kdb has regressed (FWIW the
problem bisects down to the final patch in the series where CON_ENABLED
is removed).

Reproduction on x86-64 KVM outside of the test suite should be easy:

    make defconfig
    scripts/config \
        --enable DEBUG_INFO \
	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
	--enable DEBUG_FS \
	--enable KALLSYMS_ALL \
	--enable MAGIC_SYSRQ \
	--enable KGDB \
	--enable KGDB_TESTS \
	--enable KGDB_KDB \
	--enable KDB_KEYBOARD \
	--enable LKDTM \
	--enable SECURITY_LOCKDOWN_LSM
    make olddefconfig
    make -j$(nproc)
    qemu-system-x86_64 \
        -m 1G -smp 2 -nographic \
	-kernel arch/x86/boot/bzImage \
	-append "console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait"

In a successful test the kdb prompt will appear after only a few lines
of output:
~~~
[    0.000000] Linux version 6.19.0-rc4-00020-g4b7f3b144021 (drt@wychelm) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #2 SMP PREEMPT_DYNAMIC Mon Jan 6
[    0.000000] Command line: console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000003ffe0000-0x000000003fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '')
[    0.000000] printk: legacy bootconsole [uart8250] enabled
[    0.000000] kgdboc: Going to register kgdb with earlycon 'uart'
[    0.000000] KGDB: Registered I/O driver kgdboc_earlycon
[    0.000000] KGDB: Waiting for connection from remote gdb...

Entering kdb (current=0x0000000000000000, pid 0) on processor 0 due to NonMaskable Interrupt @ 0xffffffff9101491f
[0]kdb>
~~~

After this patchset is applied the earlycon triggers do not work
correctly and we get:
~~~
[    0.000000] Linux version 6.19.0-rc4-00019-g882df99205ba (drt@wychelm) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #3 SMP PREEMPT_DYNAMIC Mon Jan 6
[    0.000000] Command line: console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000003ffe0000-0x000000003fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '')
[    0.000000] kgdboc: No suitable earlycon yet, will try later
...
~~~


Daniel.


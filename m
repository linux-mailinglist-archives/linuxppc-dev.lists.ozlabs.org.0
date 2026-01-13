Return-Path: <linuxppc-dev+bounces-15632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931FD18DBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr86T6WCpz2xjK;
	Tue, 13 Jan 2026 23:42:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308177;
	cv=none; b=o2W+AJldGX8qW6lSJKPx0JWtGwAaV4Ow2Wyw0S9oQjzJiS+CfPmsaQuFgSak4dgXOe0oJKnCTf9JKlIhiK/Tozsq94pcYhAYRJMsXh4uPhYdYNxVlOpblbU+UUzfOM0+VzrNOHFpl5Kqpx72tLFdMeGi+f9wHvOklJDnOsdwVNw3xGNhnJ+WEDzKnFPUCqy4FeLmoWAY8DTzRAiYKMJiqtxOGR7mijCmeKy9BUhlQBt2qtvoDLcLsB9YnlRo61iME9B0BjLVHrf/9m/ByQ02pGAveYwrZfZ89IFTRqXDpGadPtO7k9pjOQcJ0qWWPktKGPHdLY7a6nlY5HCkWfyr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308177; c=relaxed/relaxed;
	bh=2dC4SplNK0CZduFW6/ZkQ29d/9pNlTULD+NHFTfquXY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hFAA1y900nF/g9Hg12xkE9Mbcx3HFM6ao1QH37zciWSHbLi+w8T5FpuMa0mhgl+TnDjyqjV9TDKMO/SHTrRb/OJTTtKvzxDICxF+uVrRtb1uBtCQXKoDyqjhsjzIWtumsy+Zz3PaqYkbd/+o7p9TvxkDy8UpN100sJpOFimyhDdFZDziBTwuIZKKTjrb8ymi5xTL3kSm+XWP9sN9B/U995uyhKNbe9wlfHVgqenHJ3N2W9VLXoMPT3l6ESlw5wez0FBocGg0M0UIzm5tvjW4eY5lS4rzsH8KmMR2SNOOmVMJCbkbzpQDt+7bnGYlJhm3Eu/j89SiwqIwVjgLFg4DbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UU5c4o3+; dkim-atps=neutral; spf=pass (client-ip=209.85.128.45; helo=mail-wm1-f45.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UU5c4o3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.45; helo=mail-wm1-f45.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr86S3FKyz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:42:55 +1100 (AEDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so63071995e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768308113; x=1768912913; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2dC4SplNK0CZduFW6/ZkQ29d/9pNlTULD+NHFTfquXY=;
        b=UU5c4o3+mzlnznAjd7j+l02PjBX9GGYPzXH75r2gn0V3AQRRqYBtWGemtir/8Ze9wP
         xv3lUyfxSFWFEtwdcKVu53iyJafWquOY5HoLwTaWpBxkiKEmq9yF+IOUX5rcbRWhdx92
         V3fKu+06fYfPYUBRk5lgWx7Iv0y8LCdVsjOS7lqdXHX+tOcDsNYl+Hu5SfJXYqYYEVVg
         3D+Jcy1mlc7Wtu9beM/BuPCQhB5rAP9IC4g2HAsmj4MtH8KKRWy56vdoN3Vkr+B5hy0p
         49Hg2kEeCcgZG9xKFF+eXy1ZXHZRJlynBfzFJsVw5R6FdhtlUmFFk9Fb2VFqJAjMTYmu
         lWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308113; x=1768912913;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dC4SplNK0CZduFW6/ZkQ29d/9pNlTULD+NHFTfquXY=;
        b=BK5FzO6jaPEV3fRZY6VJXLo58dyTt4Om6djgP8uLKUcxGhGrAyis5Rkfz0zKdBmhb4
         sTLZ69aAB+9Yti6zBPUDsW0+R2cBaJ8dDlqdA3ty9+an+NYYQo6tk2HjEJdYbCoYErXp
         JOrXo6lIJifCoSWlQqs5JoX7PuLatXeTa1u07mrQ0vzV2uIqm3B3jm/ySLsDaB0NCSig
         89I+stSWuF0CrrKJBQQrMGREpPD5SQ7sRbDjbdU9ZzLBsKtwk/VrO+R0PiXdM6AzRSz9
         Oyevn7CIyGL3+T/0qtdP/sCrTAL4ozC6nJv6uuRjqrjHBE2YORWk5xbp9CbF1/MT3DRl
         gXSg==
X-Forwarded-Encrypted: i=1; AJvYcCWjMhXSuWacHhzirGC1J2xHVURFDkwvwxDYy2wdkcrDpAIPE4D1f9lqaPx0ffb5KEK8liyVaAU/HFOwZLo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy33e3tZ7zF1Rgdj4529Z3+n9p4rvxXTbs29vGrs+CAk9+3b3p2
	5Ep2/oqIbL0pKd+sD1nycmnrhaw2RNCDuLvBJdZrnMKHz5eTAKqEtlgnUsNTfzczmtE=
X-Gm-Gg: AY/fxX7r0W9fr4tf0NXPsL6VB2xJYs+O1Vqa0n7RLWZ9FtNP4nFocqFkDZgERb8O56y
	IBWG+fhs7yr8BmGvoqagmw+lnSOvLVEAme6XQj9+Rpzkb/ktdfjqNIbY7cmfI40zWhmIlOS8WKw
	cbK54MC6+a6v5Z9gZek6vJsDO7xFNkn2SAMfGBbCKgfvCAC8S0D8ecQIpcroqP92honlsyajdoF
	lrF+Wml7vEtpwiAhYWxmOtNciRHEplistRxebydEUCCJrmIjPkCczNAsgLguqlXHul4sPPGOkm8
	7wQWEDFEhzKKo6yTYrfV7hyIQb3wtYrmcgJrf+JMeQBhgXDrAgQ4x0+ih+HBw5BBUYRfhSmA+Hy
	eEaPmIAGxDPMB3bwxQrRDEqj7FgLlZt8Vow78RwKWJrnxrKYgQTYSohVqXi7JQR0WW2oXaoETE+
	ufZchXJTnr/xcA8zlKxdCJ1TgQrcregrc4UAbHk1GPlg==
X-Google-Smtp-Source: AGHT+IFNQeuw9WMG2h1Davmi36cm1P3WLycSIMCVChnxdfpM9EbZrc4Y9nv7bv2r6hTzREDcGxTpbg==
X-Received: by 2002:a05:600c:a08:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47d84b4900bmr279773315e9.30.1768308112530;
        Tue, 13 Jan 2026 04:41:52 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5013bd680a1sm10831771cf.16.2026.01.13.04.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:41:51 -0800 (PST)
Message-ID: <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
Subject: Re: [PATCH 00/19] printk cleanup - part 3
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov	
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson	 <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek	 <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness	 <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>,  Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook	
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"	
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy	 <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
	linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, 	linux-fsdevel@vger.kernel.org
Date: Tue, 13 Jan 2026 09:41:34 -0300
In-Reply-To: <aVvF2hivCm0vIlfE@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
	 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2026-01-05 at 14:08 +0000, Daniel Thompson wrote:
> On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> > Hi Marcos
> >=20
> > On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza
> > wrote:
> > > The parts 1 and 2 can be found here [1] and here[2].
> > >=20
> > > The changes proposed in this part 3 are mostly to clarify the
> > > usage of
> > > the interfaces for NBCON, and use the printk helpers more
> > > broadly.
> > > Besides it, it also introduces a new way to register consoles
> > > and drop thes the CON_ENABLED flag. It seems too much, but in
> > > reality
> > > the changes are not complex, and as the title says, it's
> > > basically a
> > > cleanup without changing the functional changes.
> >=20
> > I ran this patchset through the kgdb test suite and I'm afraid it
> > is
> > reporting functional changes.
> >=20
> > Specifically the earlycon support for kdb has regressed (FWIW the
> > problem bisects down to the final patch in the series where
> > CON_ENABLED
> > is removed).
> >=20
> > Reproduction on x86-64 KVM outside of the test suite should be
> > easy:
> >=20
> > =C2=A0=C2=A0=C2=A0 make defconfig
> > =C2=A0=C2=A0=C2=A0 scripts/config \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --enable DEBUG_INFO \
> > 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> > 	--enable DEBUG_FS \
> > 	--enable KALLSYMS_ALL \
> > 	--enable MAGIC_SYSRQ \
> > 	--enable KGDB \
> > 	--enable KGDB_TESTS \
> > 	--enable KGDB_KDB \
> > 	--enable KDB_KEYBOARD \
> > 	--enable LKDTM \
> > 	--enable SECURITY_LOCKDOWN_LSM
> > =C2=A0=C2=A0=C2=A0 make olddefconfig
> > =C2=A0=C2=A0=C2=A0 make -j$(nproc)
> > =C2=A0=C2=A0=C2=A0 qemu-system-x86_64 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -m 1G -smp 2 -nographic \
> > 	-kernel arch/x86/boot/bzImage \
> > 	-append "console=3DttyS0,115200 kgdboc=3DttyS0
> > earlycon=3Duart8250,io,0x3f8 kgdboc_earlycon kgdbwait"
>=20
> Actually I realized there was a simpler reproduction (hinted at by
> the
> missing "printk: legacy bootconsole [uart8250] enabled" in the
> regressed
> case). It looks like the earlycon simply doesn't work and that means
> the
> reproduction doesn't require anything related to kgdb at all. Simply:
>=20
> =C2=A0=C2=A0=C2=A0 make defconfig
> =C2=A0=C2=A0=C2=A0 make -j$(nproc)
> =C2=A0=C2=A0=C2=A0 qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel
> arch/x86/boot/bzImage \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -append "earlycon=3Duart8250,i=
o,0x3f8"
>=20
> With the part 3 patchset applied I get no output from the earlycon
> (without the patch set I get the early boot messages which, as
> expected,
> stop when tty0 comes up).

Hi Daniel, sorry for the late reply! Lots of things to check lately :)

Ok, I reproduced here, thanks a lot for testing kgdboc, it's a quick
way to check that the new register_console_force is not working. Let me
take a look to find what's wrong. Thanks a lot for finding this issue!

>=20
>=20
> Daniel.


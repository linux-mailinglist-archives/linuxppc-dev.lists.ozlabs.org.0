Return-Path: <linuxppc-dev+bounces-15671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9CD1BD25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 01:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drRtq4rPQz2xqL;
	Wed, 14 Jan 2026 11:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768350835;
	cv=none; b=lFywX10CDakR6gXCY2P5jHG5RtpgJ76N+GLvarnkE6hZ9mY9BlNrK4W4i03s8EqXEfvFoz0D2GFpFlTyT+v2DkhvlyQtbRMmcIalYBYAGd7ZcaO4D1zdKhVdS6SKntEqnrHnPpTcBwR3Y/5wOJh7s7rv3B5rrGwNIEUwm/cZt4cJUkTBsbRA5dp4IGFnqv0CKXgmbMqXbU9hMSGlKCOGkaIDr5WsyWMh+qCrEQK2S+lV0IG8jd+5zs3of0GiaR3Txr+jHzzZ/ZJHWZgUPZwWhDXF1QTp5aasZZJLExQ5WeZcS6jTTQjwy/8kDXwc1e30djRG7aocPbIiNDPycOMTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768350835; c=relaxed/relaxed;
	bh=gaWdSFFdOKkEXTHGFmdiT7EpMTfrWly43NlKkw7Tnic=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SiH/8hKWaHiC+17sHj7BMe8Xg00SDZXoggtqisKfSWVamigYwFkqgQdHFucf2NQrgcP6v2DBqUoPqFQ82YLF09kNHSmmN8WEdNdl938WiBK4oKcyQMsL99N7VRATpw6TvTBv4MH8y4px9GVyznK/m3EtXbpSHFFX4iEUXeJkkk1oZWH8GhiIRMDEfn7FvA1J9/3SbIMEsWBOa6rmZV/qJZH+beWJzsFGefc9JU/uiECQmlFQfUuJY4M+OhnoIAegCsVrslH68OsdmX9dxMzVdBwtvEiY9juv3LtsmS0QUUNurFWqKJ9+CGtEbmXdHV0dhdwBY39gQEB6lRfsvBTlMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HtmKnDxc; dkim-atps=neutral; spf=pass (client-ip=209.85.128.52; helo=mail-wm1-f52.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HtmKnDxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.52; helo=mail-wm1-f52.google.com; envelope-from=mpdesouza@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drRtm6ShGz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 11:33:51 +1100 (AEDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ed987d51aso12094955e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 16:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768350768; x=1768955568; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaWdSFFdOKkEXTHGFmdiT7EpMTfrWly43NlKkw7Tnic=;
        b=HtmKnDxcr7wwGtDd5mMV3qukUO6v0LO3SsO7klCC8ptT8AqY19u+deWl5nxHemiKFb
         Xt/JecNn72xm6KDiyw1PZUwb14n8qqdG5blyS7IcATz6h1Jkw+BnbJ+0hey+/ZANXilC
         WsrhGZPwVVRrjPxUQRYAQbIG4ebvVj7XRvjwRiHnGcZuK1/gKieiAkmlzF3reSPqNXIM
         H9Otg5zq+z7PhAH+HgNxRufdPOy7Y2XHB6aknNFZhkgZ/SDSsIXZfaL/DVYY41obmSGU
         q0ih83tWioHLwa+00ySeBrzRds8jcxY0Y8KPNAnaJeoeJb3FwwCmDS+H0T+VAfbd2+6K
         neaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768350768; x=1768955568;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gaWdSFFdOKkEXTHGFmdiT7EpMTfrWly43NlKkw7Tnic=;
        b=goXDqs7oKXFnnMYw827V1TOyw7Kq1Xx4FpLTBBd1rcYc8wcsy9nMA4ojdG865f5J55
         qwriQmc5Y/wRsZyX9UdL6Nw2hoCO24IjOfX39bwuCYIirz6QH0pM5vZ6xfjbvWPUW4C4
         hJ6KSo7iIAy2mB5mJjAvd2GuXJSy6okavJQeVGtEBeF7C0hDFIZt4a1AAAcTA3WMwP31
         W3GrfWvnM66Cojzsj0snHmH7xx1rtJHiFoCVlgQYH0gSxPhaSqbQK4tyHx+bdmwhmXdP
         VF96zo5neCaxmBwL/XmP+seKsKfnU7BjFBPPR2e3Gd2dw7Ys4rPzu/uvyBS0NyHDL0sg
         FS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6T/N8IMmFe6blPt/4JXVIH2XXHfzYY2MfiLqJmp7YuKyRWA06l427Sc58MbV0Ku4U6rbQN5gQfvKtS/A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9KHzfVY4mHIrw4g09YQA4heORzr97GGqnkI4esHjr8pso1WW9
	eqLsOMshN4C7ztFYR8gjunNOdHwfVpaLTwhb4mB5Tr6zLcNYdjPdRMyuHrYDVGSNjX0=
X-Gm-Gg: AY/fxX72HVJDsnYjZ8QTnLyYe4ddCXsOXyDmkexju84AxfWU2OAEsOpSHDV0nV2VVr0
	gUr4LhK9y1nLt2oJzTNAJf4q6w4JyTO3R5YtpUbgBK/JWqD/EH35hQPc+GoTReCbyLS4LuVIOR6
	9UyIBRpnpaAXAB/oG8bbbCbCrCw5nsBFVD6Pj/lM8cviGvcVDWW1/kCXktbDld39OhEE9K0n5V4
	t+K4YAMqn3RYeIyWv3Iyf8bpa/o/A9A9UTdCZWxjiKu6YKJ0WEt9XzM4RjHea/gZJ/f87aNdvJS
	lILrpwcA7Siv8eaUIK2NbukexvywSFNSF1xZjUCv0KEyAgLrxrVfBpT7zk2qCWJt3lT0siP028q
	75Gua6ibKW4p+mFn3dE4pyXwS/9zUK1ulfNjq7JIbLWBg2gA6bqsMokv1YSx9S2/65Up6P1MZ+U
	nIyJwvf38a6UpkEivuR//t2E39ELz+Igcvo1fS6RkMFA==
X-Received: by 2002:a05:600c:a101:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-47ee48b510fmr2972975e9.16.1768350767989;
        Tue, 13 Jan 2026 16:32:47 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm48257391f8f.22.2026.01.13.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 16:32:47 -0800 (PST)
Message-ID: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
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
Date: Tue, 13 Jan 2026 21:32:33 -0300
In-Reply-To: <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
		 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
	 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
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

On Tue, 2026-01-13 at 09:41 -0300, Marcos Paulo de Souza wrote:
> On Mon, 2026-01-05 at 14:08 +0000, Daniel Thompson wrote:
> > On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> > > Hi Marcos
> > >=20
> > > On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza
> > > wrote:
> > > > The parts 1 and 2 can be found here [1] and here[2].
> > > >=20
> > > > The changes proposed in this part 3 are mostly to clarify the
> > > > usage of
> > > > the interfaces for NBCON, and use the printk helpers more
> > > > broadly.
> > > > Besides it, it also introduces a new way to register consoles
> > > > and drop thes the CON_ENABLED flag. It seems too much, but in
> > > > reality
> > > > the changes are not complex, and as the title says, it's
> > > > basically a
> > > > cleanup without changing the functional changes.
> > >=20
> > > I ran this patchset through the kgdb test suite and I'm afraid it
> > > is
> > > reporting functional changes.
> > >=20
> > > Specifically the earlycon support for kdb has regressed (FWIW the
> > > problem bisects down to the final patch in the series where
> > > CON_ENABLED
> > > is removed).
> > >=20
> > > Reproduction on x86-64 KVM outside of the test suite should be
> > > easy:
> > >=20
> > > =C2=A0=C2=A0=C2=A0 make defconfig
> > > =C2=A0=C2=A0=C2=A0 scripts/config \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --enable DEBUG_INFO \
> > > 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> > > 	--enable DEBUG_FS \
> > > 	--enable KALLSYMS_ALL \
> > > 	--enable MAGIC_SYSRQ \
> > > 	--enable KGDB \
> > > 	--enable KGDB_TESTS \
> > > 	--enable KGDB_KDB \
> > > 	--enable KDB_KEYBOARD \
> > > 	--enable LKDTM \
> > > 	--enable SECURITY_LOCKDOWN_LSM
> > > =C2=A0=C2=A0=C2=A0 make olddefconfig
> > > =C2=A0=C2=A0=C2=A0 make -j$(nproc)
> > > =C2=A0=C2=A0=C2=A0 qemu-system-x86_64 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -m 1G -smp 2 -nographic \
> > > 	-kernel arch/x86/boot/bzImage \
> > > 	-append "console=3DttyS0,115200 kgdboc=3DttyS0
> > > earlycon=3Duart8250,io,0x3f8 kgdboc_earlycon kgdbwait"
> >=20
> > Actually I realized there was a simpler reproduction (hinted at by
> > the
> > missing "printk: legacy bootconsole [uart8250] enabled" in the
> > regressed
> > case). It looks like the earlycon simply doesn't work and that
> > means
> > the
> > reproduction doesn't require anything related to kgdb at all.
> > Simply:
> >=20
> > =C2=A0=C2=A0=C2=A0 make defconfig
> > =C2=A0=C2=A0=C2=A0 make -j$(nproc)
> > =C2=A0=C2=A0=C2=A0 qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel
> > arch/x86/boot/bzImage \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -append "earlycon=3Duart8250=
,io,0x3f8"
> >=20
> > With the part 3 patchset applied I get no output from the earlycon
> > (without the patch set I get the early boot messages which, as
> > expected,
> > stop when tty0 comes up).
>=20
> Hi Daniel, sorry for the late reply! Lots of things to check lately
> :)
>=20
> Ok, I reproduced here, thanks a lot for testing kgdboc, it's a quick
> way to check that the new register_console_force is not working. Let
> me
> take a look to find what's wrong. Thanks a lot for finding this
> issue!

Ok, I did a bisect and found out that the issue lies in the last
commit, where CON_ENABLED was removed. After it, I then checked what
was wrong, since everything was being plumbed correctly (tm), and then
I found that it was not:

On _register_console, the function try_enable_default_console is called
when there are not registered consoles, and then it sets CON_ENABLED
for the console. Later on, try_enable_preferred_console it checks if
the console was specified by the user, and at the same time it had
CON_ENABLED set.

It worked by chance, but now, we don't have this flag anymore, and then
we are not _marking_ the console on try_enable_default_console so
try_enable_preferred_console returns ENOENT.

I have added logs for both cases first the case with the patchset
applied but the last one patch, and it works:

$ vng --append "console=3DttyS0,115200 earlyprintk=3DttyS0,115200
kgdboc=3DttyS0 earlycon=3Duart8250,io,0x3f8 kgdboc_earlycon kgdbwait" --
verbose

Decompressing Linux... Parsing ELF... Performing relocations... done.
Booting the kernel (entry_offset: 0x000000000450d530).
XXX register_console earlyser
XXX try_enable_default_console earlyser enabled
XXX try_enable_preferred_console earlyser user_specified 1 returned -
ENOENT
XXX try_enable_preferred_console earlyser user_specified 0 returned 0
because flags was ENABLED

^^ here, returning 0 means that the console was accepted and will be
registered

XXX __register_console earlyser registered
XXX register_console uart
XXX try_enable_default_console uart enabled
XXX try_enable_preferred_console uart user_specified 1 returned -ENOENT
XXX try_enable_preferred_console uart user_specified 0 returned 0
because flags was ENABLED
XXX __register_console uart registered

^^^^ same here

Going to register kgdb with earlycon 'uart'
Entering kdb (current=3D0x0000000000000000, pid 0)=20


Now, the logs of the patchset with the last patch also applied:


Decompressing Linux... Parsing ELF... Performing relocations... done.
Booting the kernel (entry_offset: 0x000000000450d530).
XXX register_console earlyser
XXX try_enable_default_console earlyser enabled
XXX try_enable_preferred_console earlyser user_specified 1 returned -
ENOENT
XXX try_enable_preferred_console earlyser user_specified 0 returned -
ENOENT
XXX register_console uart
XXX try_enable_default_console uart enabled
XXX try_enable_preferred_console uart user_specified 1 returned -ENOENT
XXX try_enable_preferred_console uart user_specified 0 returned -ENOENT

^^^^ here, it should have registered the console

XXX console_setup hvc0
XXX __add_preferred_console hvc added, idx 0 i 0
XXX console_setup ttyS0,115200
XXX __add_preferred_console ttyS added, idx 0 i 1
Poking KASLR using RDRAND RDTSC...
XXX register_console tty
XXX try_enable_preferred_console tty user_specified 1 returned -ENOENT
XXX try_enable_preferred_console tty user_specified 0 returned -ENOENT


^^^ again, it fails because we don't flag the console with CON_ENABLED
as before.

XXX register_console hvc
XXX register_console ttyS
XXX try_enable_preferred_console ttyS user_specified 1 returned 0 with
user specified
XXX __register_console ttyS registered
[    0.000000] Linux version 6.18.0+ (mpdesouza@daedalus) (clang
version 21.1.7, LLD 21.1.7) #374 SMP PREEMPT_RT Tue J
an 13 21:08:34 -03 2026 reserved
[    0.000000] earlycon: uart8250 at I/O port 0x3f8 (options '')     =20
[    0.000000] kgdboc: No suitable earlycon yet, will try later       =20


So, without any console kgdb is activated much later in the boot
process, as you found it.

I talked with Petr Mladek and it would need to rework the way that we
register a console, and he's already working on it. For now I believe
that we could take a look in all the patches besides the last one that
currently breaks the earlycon with kgdb and maybe other usecases.

Sorry for not catching this issue before. I'll use kgdb next time to
make sure that it keeps working :)


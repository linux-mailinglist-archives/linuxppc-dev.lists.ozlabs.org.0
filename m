Return-Path: <linuxppc-dev+bounces-15284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A1CF56FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 20:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlQ4y1k7Jz2yMJ;
	Tue, 06 Jan 2026 06:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767622176;
	cv=none; b=SQMSz/UWme7EU1wUg9QVxA5PQRW2rAYdVIiPNdInl48TczXkj+d2Ch7BoYEwW6lkXKI/Ao5iA+bfSM55fCjWFCAho+6yNxeiM/CPUu1UlfVJta5g/bZGjgxOMzO8BTIONhLCwb8Ikf2BJZ0w4MtQYPCPtlaltVfManf4PGQFCzST6Zg7wGNCe1JS2N5qu0qPiYekwYJOBsentPUvr20xw2OM05k7MpuQI5NmwsFRC2oI0rqh/HNGjahTkP+QbXTmxls539PscXusrFGrtWpuiVEKeihTEerXlhhhNOOcMQ/ya+2bKpAGj8b/NPx1cS+lVXsf86ZsL2ZKLnu+5pTrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767622176; c=relaxed/relaxed;
	bh=Kq3TtsxUy/q4IZcqauYlg+KhZOOjIgyB7YRbMBjceZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2dkzepZ4L2QnNv6Lfrm2EtEirDoUF+l13LovrGNNt8EyV8y/HBYsteLIQ/Z8GGRtI4uiqS0HNpZ1R6ISaRZ1XIxtQP5Kllyapb2sqldwlnEI9XAKB7XF37xJhjBHqcZ3vOm1WfavU82dWHCyFdmnUUoN+utz0kIYkOJ8BKUvnVpbhn1VOVGagKPerB1ax4Y+V3Eu+Z1P33q8O9LuzJDdGU0HUrP996ddxyEvSdfLD3o2oM9t9ops+Q/mWq4J/lWCaFdc/wIJd6sLu30Lngx/OcTvlbGktg1ZRJeZ+qPLKN6krf5qS0AR7WhRbonu+hjiukukCGNFY37SN1xGF4v6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=r7bv+vxS; dkim-atps=neutral; spf=pass (client-ip=209.85.221.46; helo=mail-wr1-f46.google.com; envelope-from=daniel@riscstar.com; receiver=lists.ozlabs.org) smtp.mailfrom=riscstar.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=r7bv+vxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=riscstar.com (client-ip=209.85.221.46; helo=mail-wr1-f46.google.com; envelope-from=daniel@riscstar.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlGQ639yQz2yCL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 01:09:32 +1100 (AEDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so6752261f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 06:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767622109; x=1768226909; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq3TtsxUy/q4IZcqauYlg+KhZOOjIgyB7YRbMBjceZQ=;
        b=r7bv+vxSRZXDtOaFUq/fs5wbHPeAQoFoawzLEgfYpgNRh6C+NDJEGp1R+R5x01mi+l
         mfa9ni/Db3IIo8DTE9VFq78kq51VDNDRf7HZs3UnZ+d0u20/0MtobP5kO2+GAFY6aIFC
         HtGXvJWKrWO1L35sRZ+KpGGY3YSoazyIc47wsYSa553FyIIy0s3FKFx9c4dIw/Yu40KL
         RTFkQBUE2tW4c3h1jb2ilutcjf5H8JWxZx+2bijH3tqDmE1YnvoNT2TLwZgDAUB+C5Yq
         RqPX6PnKO4KSdyB8CXmemxSvt7aCq/DUAYhExqaZT7tCuueeDTMVkdxCL4Dq80RDuogQ
         eB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767622109; x=1768226909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kq3TtsxUy/q4IZcqauYlg+KhZOOjIgyB7YRbMBjceZQ=;
        b=Y2gaAfGPvGlPOnoYIloDVrBHQxCuKyJqD2Rz28PMTXJ+5mGjetdrWT0FWKSqM4mUi2
         PWZRQdKeqpUohIwCUM6LluZ4TDViN7XN3Ss5dYt9WgzmZMhUnGp8wftCpMRXXieszxzP
         y0PADTu4CgLWogsDudvPBAVCEG8fK67Q+Wtn0pHpdRxZvyGbwJic2zox7mk74ndLK0nF
         iPuLPNlBgK/6IhB6eLIO7xhoOcngq22gxQcTi9sGWuElhU1VqRUZ9A4OJxmfeFdDVOcy
         xfN62Xj6lpW5VUtZT9+A0AngMa1q53+ztb90Mjfn7qWr7QVuisVTSjGCvCjbWMMyL/CB
         hgYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYqQe3ITKN37SF2OiJ6LUfOfW1pqWP8X27GF+aDN4ZLRUfMXbLohWsJckDQmpj4kSLR29rCrYq9wA+kvY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1wzgieOluPzZcUfyvtSfly153ZMAHjCsMxc0NLnrVWkk+qE+q
	KVKe5eP+ng+EWzO6O+4ffgtFxgbAUvYx9zHyGBcbzWCX3AiUIAe1K3ZMVvmqyoei9Cg=
X-Gm-Gg: AY/fxX77fksRbamcLiNyehCm/v3wOqfEoao4ZhnmrkyRhrELBBbyPvA6Or4k8J3uorl
	y4ZxIEXZ/hYrnJHYh0uclziUu7RjlD7VhskEpIdDl71tC8uw8ykqA007MOzaTK0qHD7tRJlNB5r
	abKSM3/+yJhPzQhVq4mSroboi6zS7hYgDGLjJWO7LZnO/8a8MJmZlRJJjucUtvxMaW9vopTQdbe
	TG4z6XzIEpStud1N4bFklF1EEztHWfNYyWFi5U1KbIcaB8oHxBoqw88GQJczwW4Hf/VQ9LSUz+O
	lrKY9PQ/33MPWPjtnVge33JocXOEF65G2npzxMIRBtQMNGAPbuIPJLsA68mIj0bqqT6OcGNpk+B
	Rg6i7p/T8xmqQeA5U/h2aKIzdYPalIQ3ogNXD9V0Dd9ckG4geBnfd/bEkB9D/pHwW+Ek5MMOyKj
	0seISPo92guU5Sb2MVUR+mJEGXo6zIWGw13ROKByosd1JLkn4Wti8je3FW+njn7/6DJy/kUeHBP
	y4g9g1rQxf4s275vmOA74O+tqBPNu7IERsj0N3eZy9DPkPz2N6XLorYUjTN6MCv91TTfKYa
X-Google-Smtp-Source: AGHT+IFtm/KgnS/DHXZ241C9Tii09D9IuHplpok3aN88rFmOsLWOymloQBuensoLNVO5jV8TaARwoQ==
X-Received: by 2002:a5d:4842:0:b0:432:84ee:186d with SMTP id ffacd0b85a97d-43284ee2de1mr31846134f8f.62.1767622109438;
        Mon, 05 Jan 2026 06:08:29 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1b1sm100250524f8f.3.2026.01.05.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:08:29 -0800 (PST)
Date: Mon, 5 Jan 2026 14:08:26 +0000
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
Message-ID: <aVvF2hivCm0vIlfE@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan>
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
In-Reply-To: <aVuz_hpbrk8oSCVC@aspen.lan>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 05, 2026 at 12:52:14PM +0000, Daniel Thompson wrote:
> Hi Marcos
>
> On Sat, Dec 27, 2025 at 09:16:07AM -0300, Marcos Paulo de Souza wrote:
> > The parts 1 and 2 can be found here [1] and here[2].
> >
> > The changes proposed in this part 3 are mostly to clarify the usage of
> > the interfaces for NBCON, and use the printk helpers more broadly.
> > Besides it, it also introduces a new way to register consoles
> > and drop thes the CON_ENABLED flag. It seems too much, but in reality
> > the changes are not complex, and as the title says, it's basically a
> > cleanup without changing the functional changes.
>
> I ran this patchset through the kgdb test suite and I'm afraid it is
> reporting functional changes.
>
> Specifically the earlycon support for kdb has regressed (FWIW the
> problem bisects down to the final patch in the series where CON_ENABLED
> is removed).
>
> Reproduction on x86-64 KVM outside of the test suite should be easy:
>
>     make defconfig
>     scripts/config \
>         --enable DEBUG_INFO \
> 	--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> 	--enable DEBUG_FS \
> 	--enable KALLSYMS_ALL \
> 	--enable MAGIC_SYSRQ \
> 	--enable KGDB \
> 	--enable KGDB_TESTS \
> 	--enable KGDB_KDB \
> 	--enable KDB_KEYBOARD \
> 	--enable LKDTM \
> 	--enable SECURITY_LOCKDOWN_LSM
>     make olddefconfig
>     make -j$(nproc)
>     qemu-system-x86_64 \
>         -m 1G -smp 2 -nographic \
> 	-kernel arch/x86/boot/bzImage \
> 	-append "console=ttyS0,115200 kgdboc=ttyS0 earlycon=uart8250,io,0x3f8 kgdboc_earlycon kgdbwait"

Actually I realized there was a simpler reproduction (hinted at by the
missing "printk: legacy bootconsole [uart8250] enabled" in the regressed
case). It looks like the earlycon simply doesn't work and that means the
reproduction doesn't require anything related to kgdb at all. Simply:

    make defconfig
    make -j$(nproc)
    qemu-system-x86_64 -m 1G -smp 2 -nographic -kernel arch/x86/boot/bzImage \
        -append "earlycon=uart8250,io,0x3f8"

With the part 3 patchset applied I get no output from the earlycon
(without the patch set I get the early boot messages which, as expected,
stop when tty0 comes up).


Daniel.


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1220735E5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 22:19:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ML1POuSF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlLhS5NSWz30fF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 06:19:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ML1POuSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=nadav.amit@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlLgZ3Yncz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 06:18:32 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-544c0d768b9so3195443a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=ML1POuSF5TNYpNiqkU7Wmm/FZLBDFoP32DY+WPylpmv43DoaA/AoXnTGG2wwzhld3j
         kjkKToRZCKl1S0ycKV+IUNrHAQ8Dvck3h+D7ZuCxy/PFvkOP44vPViwvWsYYl0BBuNgy
         b/5HPeUCxmK/jPGro6a0V6gtwlQJxSWG+MjbaRDV7mR48t508gCxLWi7cw8WSlTAdLEO
         3p+win9LgLE5lOsK+rw7eJ7na0iRAHUh7i2pWPNrn0k/YllS2kfgOgB31VmT4hCseChr
         k2Wm+WLNvD9nhPcsjkRc0OVcXyGOSUiyWGCOpqitL1ReK2kli6NusXAAxFAtCrHDui7k
         NzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205909; x=1689797909;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmEEut0OCJI0jheFei8v4KFIgPFEx+9Zr0oYZPTVJvw=;
        b=J4EeK1E/5Zd+SN2ghRODX28pSpjVLJb6LN3jYcjcSXL5LLL/qDxqeWL7vLwBeYMOlC
         1t9lHIhaxh8+CxPy9qi+b2Xlc26T68EAR913flIwwOiTbJphpKb7ICx2/csd24A1Ccku
         HXrbTbREoLCB5eWl6JnIfyU0+Bdb2ioXE2dOUVsX21c58sZkvapTRSatRb35Jw+zTO26
         nRJeh+cZuge1zEYyOOnCQi2yQNOyQ2GN25m61qgz0So4uG3mmWUy5vK6/j/DZpdjUTIJ
         WEN5i+p/F26lVbaXX7RaA1Kky4taXS1A8iXX6R6kbKHaIZvQ7FmCq5RvU+7GLKZqMAYF
         vL6A==
X-Gm-Message-State: AC+VfDyIzooHHFSrJfYEbaBUcsCMTsdPB0zAdDNF7EScjeLzbHPPXm86
	1JcbwXeHprGsIhssjWppYIM=
X-Google-Smtp-Source: ACHHUZ4MAGz/Bbdlo+4DcmVI4O990mBmojRaVLNYuDWhcs7i7MC/1uf1G62Dkn3iaVvHJNN3c8J+8g==
X-Received: by 2002:a05:6a21:78a9:b0:10a:cb95:5aa3 with SMTP id bf41-20020a056a2178a900b0010acb955aa3mr14231287pzc.7.1687205909086;
        Mon, 19 Jun 2023 13:18:29 -0700 (PDT)
Received: from smtpclient.apple ([66.170.99.1])
        by smtp.gmail.com with ESMTPSA id k18-20020a637b52000000b005538bf7e3d6sm87568pgn.88.2023.06.19.13.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:18:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
Date: Mon, 19 Jun 2023 13:18:15 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <7F566E60-C371-449B-992B-0C435AD6016B@gmail.com>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
To: Andy Lutomirski <luto@kernel.org>,
 Song Liu <song@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
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
Cc: Mark Rutland <mark.rutland@arm.com>, the arch/x86 maintainers <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm <linux-mm@kvack.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf <bpf@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jun 19, 2023, at 10:09 AM, Andy Lutomirski <luto@kernel.org> wrote:
>=20
> But jit_text_alloc() can't do this, because the order of operations =
doesn't match.  With jit_text_alloc(), the executable mapping shows up =
before the text is populated, so there is no atomic change from =
not-there to populated-and-executable.  Which means that there is an =
opportunity for CPUs, speculatively or otherwise, to start filling =
various caches with intermediate states of the text, which means that =
various architectures (even x86!) may need serialization.
>=20
> For eBPF- and module- like use cases, where JITting/code gen is quite =
coarse-grained, perhaps something vaguely like:
>=20
> jit_text_alloc() -> returns a handle and an executable virtual =
address, but does *not* map it there
> jit_text_write() -> write to that handle
> jit_text_map() -> map it and synchronize if needed (no sync needed on =
x86, I think)

Andy, would you mind explaining why you think a sync is not needed? I =
mean I have a =E2=80=9Cfeeling=E2=80=9D that perhaps TSO can guarantee =
something based on the order of write and page-table update. Is that the =
argument?

On this regard, one thing that I clearly do not understand is why =
*today* it is ok for users of bpf_arch_text_copy() not to call =
text_poke_sync(). Am I missing something?


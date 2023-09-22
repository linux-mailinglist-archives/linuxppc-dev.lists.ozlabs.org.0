Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8B7AAD45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:56:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CjAAOHnW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsR2k62dWz2yNX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CjAAOHnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsR1v0fDnz3cTc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:55:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE00D62227
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0043C4339A
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695372943;
	bh=8QkGhwghTGYPhExKboS3z0PsUiDKGGvXCleAsd5SH5o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CjAAOHnW+m8+RDAztDmFbJSI8mdUHvPboMtroHiybyvatO27zYyfR1Wv55g8Fv01I
	 te0s9HGkJ0VGUxcVzi6S21q5ZnP3kW3G91E9EzkcgwFh/S+KI1A7tuuEMTGE3HIqBt
	 6nRrji+IFh6kZxhnMEpdwcEddc5XEiLgoKEsYESe9+KRFo95Dw/rmUlDTh3/54BTTX
	 9KM5MArpAD0s7o4CKVI6Ii4apE868YOc1Vz8d3/fGW7P9s5e+247+f0d/ycaOQufD9
	 8mHhukuVVMeyYfCV4bv8fVCeskg+IFFN9ztlmxGPfhc3ExSSu6BsWAGJwgW8ktELWJ
	 FSaXLLenObg+g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50433d8385cso1700138e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 01:55:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw60o4YTn1/kgaBhvfH1C+YWMeAeOZRzVJYtfpEkjknUL8cVQdz
	V9RCJCvTwBT+HSpuCEl+eGVvDIthkKVhzJlebX4=
X-Google-Smtp-Source: AGHT+IF8cgUepodrWyUy99Ge6z4o9GbKwpmdAjZ3R33ypUsIeilkKxYeO+uhK8l2iNZFEKGHs3hnsEm9jfUciGjro48=
X-Received: by 2002:ac2:5bc5:0:b0:503:79e:fb7b with SMTP id
 u5-20020ac25bc5000000b00503079efb7bmr6817575lfn.68.1695372941964; Fri, 22 Sep
 2023 01:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com> <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
In-Reply-To: <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Fri, 22 Sep 2023 01:55:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
Message-ID: <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-
 arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 12:17=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/09/2023 =C3=A0 00:52, Song Liu a =C3=A9crit :
> > On Mon, Sep 18, 2023 at 12:31=E2=80=AFAM Mike Rapoport <rppt@kernel.org=
> wrote:
> >>
> > [...]
> >> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> >> index 519bdfdca595..09d45ac786e9 100644
> >> --- a/include/linux/execmem.h
> >> +++ b/include/linux/execmem.h
> >> @@ -29,6 +29,7 @@
> >>    * @EXECMEM_KPROBES: parameters for kprobes
> >>    * @EXECMEM_FTRACE: parameters for ftrace
> >>    * @EXECMEM_BPF: parameters for BPF
> >> + * @EXECMEM_MODULE_DATA: parameters for module data sections
> >>    * @EXECMEM_TYPE_MAX:
> >>    */
> >>   enum execmem_type {
> >> @@ -37,6 +38,7 @@ enum execmem_type {
> >>          EXECMEM_KPROBES,
> >>          EXECMEM_FTRACE,
> >
> > In longer term, I think we can improve the JITed code and merge
> > kprobe/ftrace/bpf. to use the same ranges. Also, do we need special
> > setting for FTRACE? If not, let's just remove it.
>
> How can we do that ? Some platforms like powerpc require executable
> memory for BPF and non-exec mem for KPROBE so it can't be in the same
> area/ranges.

Hmm... non-exec mem for kprobes?

       if (strict_module_rwx_enabled())
               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KERNE=
L_ROX;
       else
               execmem_params.ranges[EXECMEM_KPROBES].pgprot =3D PAGE_KERNE=
L_EXEC;

Do you mean the latter case?

Thanks,
Song

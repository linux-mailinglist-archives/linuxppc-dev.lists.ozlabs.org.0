Return-Path: <linuxppc-dev+bounces-7438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C57AA7A975
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 20:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT9NN5q4Jz3041;
	Fri,  4 Apr 2025 05:33:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743705204;
	cv=none; b=gElpSVjWCQoS7ZifxoJf4n4kU8HzmJ0mU0+eME4R1gwLuBwy9rbcFLPv0nAdGRV1L0eT/l2FZjRUWpSqVMpVHUyQ3gQoMdngjMPxEndZ7e2/TQXmoZJK8TBkb+3sLOPOzlu/jlKgBCiv/sbSzJsJ61VYL7THebtmGT/HanU4mik7+fuicGSp6OlTq2aZHAkr2ZnERkIN9YOfbAe8mtigolzgNH5vlwIU2K0nyuR7Y1F9JVmsSP57dUXWDGMOFWjnKEpJ4eSmQDA5vLnSWihYPo5Z9uAvNwG6NOW4ElN34QzixkzducUweNIRt9tPEhmeuQsGUILtOgIxZF+eGB5fOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743705204; c=relaxed/relaxed;
	bh=cnwALjO3aDbkSmpoYAsVQQnivE8vuaMUt3NU2BV0WpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGq9oYWneIlnUZWumUzv2qjDnmaULZvt/7HHdUFp+ur28if4WUH2if/ydxPzp8bW+fJv4w8wLQNdiB6znoJ3Jypz5zZ6uM8wyfEdhmk9TkGS2udvI5D+fnw17RrixPoOLtFnGTpidSwCTnyCs/JLwikYKqf63VnyPDD72+t/adli+KeL+eK1NRs11guR8KYBP7+Doxmui7olTunC6EUzMAOYBcN0+618qEOMsoIkiAclNMtzODuN+MGo/tr76blvPMNT4J9EzQQwTj1PEZCp6BZxc7NpGy1/f9n5mbOYRhnwv87y7Hz0GXhxOSG+8LLoaz0tQ9F2+447VgdedgJq9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jgdO38Ci; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jgdO38Ci;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT9NM6FVwz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Apr 2025 05:33:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67C4C6113B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 18:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18858C4CEE8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743705201;
	bh=cnwALjO3aDbkSmpoYAsVQQnivE8vuaMUt3NU2BV0WpE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jgdO38CidHQniGNcR2sC+ZzVsOXUoH2K8myjWri0T5HcvYipuNDs4lgbcjHvjrVbh
	 Sf4iHxjzExRpnkhaiv9r1/BlKPWqicyCYSo/A9e0eiCPOgW8fU713U4suVTJhYK77V
	 dsO3+khmZl8Akd2TefzKtWoAnySfDabJ7ty8IdgFdM1wIFeHYgKFKbGJlAp1cQeBa2
	 sJnCeMlBuPBpHDuR/Z4A6lknbntvHiv1MPdW4Cazd/CGy6TldjLbOHAblnF//lcwX1
	 5JItb5IqAxiBQhkie2JWZvYfIAv+cT1AuLTi1X39M7SXbfUYGksv+Tf7TjSrQt0gq7
	 Mc79aJKNZz1VA==
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47664364628so13083451cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Apr 2025 11:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIMUMKPksVwCeM1RAvzGdSANOKal/ct/J963WCMe55mq2L6KrhDRrU8iyr33JPhbOl2BemUEvn4wIoT3Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKTwi0sIECKbBWFJIbYXfD3ZipbxbG5yOM9iwb75Ft5k9ICzTd
	6/90zI320KCrt2nWjMPXjg1BclmH9IDNK7rskshywMRwfqkxdfO/qEdPMGLa7Gec7H4g97GeEj6
	rBc2SjDTWBIridt4Sm9QCC7F8PR0=
X-Google-Smtp-Source: AGHT+IHgqFl4p0VnWKCuwK4rFjCAD/b6TIqBMSxHhJBCN3hmAIwPBR6+/F4WvUV54T0a874dqQqU8P7Nh1AXWgX0j7w=
X-Received: by 2002:a05:622a:143:b0:474:f5fb:b11a with SMTP id
 d75a77b69052e-47924c30da0mr4866911cf.3.1743705200315; Thu, 03 Apr 2025
 11:33:20 -0700 (PDT)
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
MIME-Version: 1.0
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
 <20250331100940.3dc5e23a@gandalf.local.home> <Z-vgigjuor5awkh-@krava> <xcym3f3rnakaokcf55266czlm5iuh6gv32yl2hplr2hh4uknz3@jusk2mxbrcvw>
In-Reply-To: <xcym3f3rnakaokcf55266czlm5iuh6gv32yl2hplr2hh4uknz3@jusk2mxbrcvw>
From: Song Liu <song@kernel.org>
Date: Thu, 3 Apr 2025 11:33:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5yBLMPJy3YNoJKUfP+BEsKOgJZ_BjrJnyUQ=tMPqC7ag@mail.gmail.com>
X-Gm-Features: AQ5f1Jq42L8RxZ6GWC42lUCb9tBQ42cKWAQbaPbYFETXEgk6sAOuDqqvH--crIo
Message-ID: <CAPhsuW5yBLMPJy3YNoJKUfP+BEsKOgJZ_BjrJnyUQ=tMPqC7ag@mail.gmail.com>
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
To: Naveen N Rao <naveen@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Hari Bathini <hbathini@linux.ibm.com>, bpf@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Miroslav Benes <mbenes@suse.cz>, 
	=?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 3, 2025 at 8:30=E2=80=AFAM Naveen N Rao <naveen@kernel.org> wro=
te:
[...]
>
> We haven't addressed this particular interaction in the powerpc support
> for ftrace direct and BPF trampolines. Right now, live patching takes
> priority so we call the livepatch'ed function and skip further ftrace
> direct calls.
>
> I'm curious if this works on arm64 with which we share support for
> DYNAMIC_FTRACE_WITH_CALL_OPS.

We still need to land [1] for arm64 to support livepatch. In a quick test
with [1], livepatch and bpf trampoline works together. I haven't looked
into the arm64 JIT code, so I am not sure whether all the corner cases
are properly handled.

[1] https://lore.kernel.org/live-patching/20250320171559.3423224-1-song@ker=
nel.org/

Thanks,
Song

> > >
> > > Hmm, I'm not sure how well BPF function attachment and live patching
> > > interact. Can you see if on x86 the live patch is actually updated wh=
en a
> > > BPF program is attached?


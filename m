Return-Path: <linuxppc-dev+bounces-14727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A116CCB7C7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 04:37:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSFWW3jRbz2y8c;
	Fri, 12 Dec 2025 14:37:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765510631;
	cv=none; b=J1V8f1PxiivxflqVG7N0GfEbZ7kTmG53Oo/7apVy5SH8eOAnb/TFBksdl9Xrgu6mPXfNip6+PfNCcbhvbwYbJkTfoMnVilkSoY2QPhr/qOxYxO3j0vR8ziK/T1Fqk9upclEMmRw0P16+3XYGdW1ns6+n3g11we7On5naifBDR8RHFZGhEyIzmY6eigE0isDoUMuVd10QWlxLR9SSYCGHYbCA91J+5/okt0ALxEtVZKdW5PmtwfHOGqNq5ek4+pba/gDuHZ6YtFtRqYAInY/lXx+GtxCTCVPTzCyuuvw6u6ueYT8k+Yc+Q/DoQGXOIIlYO6H6UmI8GAa6XGL6xS/AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765510631; c=relaxed/relaxed;
	bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLMzQTb3LZVplj7IkIblUG9se6AGDco23c3b4dZwZGJf0BW+S+9EnR+DYCSp65+KKyfH5HkoKD1rqmbyozPzrtWPXy/BIf/kOFxgxmrPF+B9yswluCIPXTX9E3bu5H2eMeR7usfre+h4ZwYLX5EY459Zb2Fp/uDK/1wxPsfT+VzfmhhrI0DCVGDFnMkCQzYhXJbamydlMZdepC5XQN23WSNiKGOtb0NTodj1enlhD4ENG8JhccG0H0oa1LBnglPWLxyWfIx3+RSP8j6iYoJx+fkkgBE6XR3/Xk+j40BO2PPMotbgUx/kXfabtu0KGqEVSsc+IRcWgcUDzN2sdQdBOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a8Lq0jvy; dkim-atps=neutral; spf=pass (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org) smtp.mailfrom=soleen.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a8Lq0jvy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSFWT41Gyz2xNk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 14:37:08 +1100 (AEDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b728a43e410so125524766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 19:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1765510564; x=1766115364; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=a8Lq0jvytinY4CsCRIN3NWkSzIw5TaJDKkaL8HvvqUVxSRfm76oFWPklzsCRusAJec
         S2IIJJx7HJyBE9hLjpRqC7EAaH3A/pZaFgGuWr5hUdA3YIR76AflfXoIeUB6PA9Yd67j
         Idup5PdGJx3NiFnyxjt+38CAa9J30aG+aoEYncHuUU+PKSyihXSnR0fKT+lR17Mw0Ydk
         QV2JZdLnK3DdHSGjoLwgeJ9LSw/KzTOmNH/ckI2mUW8DzmYJHi4fdneKgZDr+CWewhCR
         bq770fIxffie36dcwT5w/F2gr+bctL3s3gs/tS0jrT0AV3q0n/cq6e2/fUXH6GxE50mM
         4pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510564; x=1766115364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ofnmmsc+p8cbk8w5KbuxpSjDMLzqoPAmhlHL6cy9Bx0=;
        b=hPq5sL2yatxkNLkSTHMYyQs4FF2URt4JwN2dYjRY4nzPiCycslxpkEMkgm9/JjnhCr
         44W1Fsi3Sm7G8a3h8SAOKJz9P/PMcKvTzSi3dtQVsBDF9P70Jfywi84Pv5uftUc7cLce
         o8rjUT3LCzOlG8OLPAGWaK6qKAPzcJM71qNb53tTmrXiH6XKhRedNW7tWpf3nneSTaiV
         TE7DLdzbhv7BGm2oSsNEEbgqvyc1ihdlfUQybmlfJftgMqsyf07hFIKwMRj3fHOcMrJd
         PFco+a8Pl0NewaeE8LTnr47r8qw+oMCUM912dOWfvo5/tpyBkrqdjempUSRyu6stia9A
         DnWg==
X-Forwarded-Encrypted: i=1; AJvYcCWAFOh4xi9dPKOiYwr37VXeUOFiYSgcGOgPVERKsKlbURWFuxqgRI6b0rqFxqnj1HXKTSLLikceJQb2DDI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywOIcQDqyCGr1ioPDyZ60Vaz4E0Kg7khoz/MITTuvfrjKsYM5e
	ofEQqtkn7XCeKlS0h+Bg7HYprgVFQvLBZriq1pznNf3HRtk61MMJmoC2PdpJU87JprZpcB68CEu
	1xz4Q9YAZcX/Qtft2W1vbZEB1nZwE8gPES9iScuh25w==
X-Gm-Gg: AY/fxX4Lo+PoIq3JRoBBJ/a7LpYa3kolKMAXkVsvrwIT9Mwbasar/kbZO+PxQEi2Aag
	tg5cDFG7m4Tsh8F5j21CYffs3MvmJDKfPwk07kNNwVIBMiIt3pozE7JCURtqOD3U5kB8DGVHJnl
	m2tEVLMBBh8pQ8fxd0hk9h8Q1fxe9HQEMwgxMnVP47JzLi8smbjSBed4NdRyyxBsTwJ5dy65nK8
	CLsQReTAxJ0/e5M1zoVz3to3UXo0+U71h3JGJQEfeY+R63dQ1WLgfysjHLLEt+72p08wFplG9cG
	gyvWDTpmNemDwgOSGWZZUbTFNzQSGw==
X-Google-Smtp-Source: AGHT+IES7BBbTn7tqCPfnDPHjSNdpqaXrpbRG6DqnnJ1DEXLbtMv8wmJUtOWcZP/vd9EsPmBwealpv5uJAbWVaKwNko=
X-Received: by 2002:a17:906:794f:b0:b72:8489:7e65 with SMTP id
 a640c23a62f3a-b7d23c1e339mr40812866b.31.1765510564545; Thu, 11 Dec 2025
 19:36:04 -0800 (PST)
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
References: <20250909091335.183439-1-ajd@linux.ibm.com> <336c0402c59363956d0c4eefc1b8a059e1fcc8e4.camel@linux.ibm.com>
 <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
In-Reply-To: <20250925161726.2b34890070e6d8dcf8ad3ba9@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 12 Dec 2025 12:35:27 +0900
X-Gm-Features: AQt7F2oPlCrCn0vgeBqPFjk6oJGdLPXS9LGfuM7Cqn1iLUHRy15krGx13xCnA8U
Message-ID: <CA+CK2bDDZi0TR9fhAuKpxz+XJU6-rOS_iM-akU=oTb5wVoVxMQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/12] Support page table check on PowerPC
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	sweettea-kernel@dorminy.me, nicholas@linux.ibm.com, 
	christophe.leroy@csgroup.eu, alexghiti@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 26, 2025 at 8:17=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 26 Sep 2025 08:42:35 +1000 Andrew Donnellan <ajd@linux.ibm.com> w=
rote:
>
> > On Tue, 2025-09-09 at 19:13 +1000, Andrew Donnellan wrote:
> > > Support page table check on all PowerPC platforms. This works by seri=
alising
> > > assignments, reassignments and clears of page table entries at each l=
evel in
> > > order to ensure that anonymous mappings have at most one writable con=
sumer,
> > > and likewise that file-backed mappings are not simultaneously also an=
onymous
> > > mappings.
> > >
> > > In order to support this infrastructure, a number of helpers or stubs=
 must be
> > > defined or updated for all powerpc platforms. Additionally, we separa=
te
> > > set_pte_at() and set_pte_at_unchecked(), to allow for internal, unins=
trumented
> > > mappings.
> > >
> > > On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible=
_page()
> > > requires the address. We revert previous changes that removed the add=
ress
> > > parameter from various interfaces, and add it to some other interface=
s,
> > > in order to allow this.
> > >
> > > Note that on 32 bit systems with CONFIG_KFENCE=3Dy, you need [0] to a=
void
> > > possible failures in init code (this is a code patching/static keys i=
ssue,
> > > which was discovered by a user testing this series but isn't a bug in=
 page
> > > table check).
> > >
> > > (This series was initially written by Rohan McLure, who has left IBM =
and
> > > is no longer working on powerpc.)
> >
> > Is this likely to make it in in time for 6.18, or should I respin it po=
st merge
> > window?
>
> The latter, please.

Andrew Donnelan, looks like the merge window missed again, could you
please re-send this series so we could get it into 6.20?

Thank you,
Pasha


Return-Path: <linuxppc-dev+bounces-3252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081F69CE0F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 15:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqf7F333Zz30Gf;
	Sat, 16 Nov 2024 01:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731679833;
	cv=none; b=O4Ac2Lk4DyUcXmBKR4i401DvIjRtYFNnynWxlDSTGdy/TQWfjvhkAPAyxVNLHQif+qJUWNrecvqjiYpUdMUSx4n05jr/JkXw1ZrZRh1ocIetzj+YO6juNJsiuhgnfTPWYUkHnCaaBUQkDv5WnkoWAgaMpBY61aFfEJL3MZ8UeAhUUCDK4Xor7r8QFUI2J83Us/4T0jD/VEtPcMnDef0/428ZlhgmQyY1GHzTdJxCFYicRqH7W3+LqcCv+6gQmZJbEUEtFDxqwcKfKwL1eq2pVA0Y2HfKfd9pk+b+wJ9T8uiKIDC+cZ/6IldfyjoJVWyXC+ttbteL5DA2BfOfBG85qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731679833; c=relaxed/relaxed;
	bh=Azw1mPi5RTAs/z/WphJ5T0OvsAFn4DtEwlfly20R5OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cd5KoohXgyDLIFnNRuaMxdT9OEDcxgb63VOKi7/Lj3rGG23oGh3Y4folUQVVHjchFGWDbE0UKGcHaCN5FySo8bKwFm2zOvk9S6uF2McAlwOvbJtKj413zeGuvq6yF6I1kMh7fXOg+q0kL/yW1Z3zcs8uCnefPyHIyeygLyay28Tvy1Ukgg1CrGRpqrcerKWkOhn21g4GPb6qXKcwsyDFfdVJ8Gfz3sx8naEmQk6UL93zC8vGJ6UHG7WdUREFcojPAiQayIQ/aDC9+7ey16S7UJgFtLFiiAqrpkoETCRlyI0YLhi+rpXjlEyubgHQcpgUEgMTl5NPFbJjASNK0D4UAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4LGXIKQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4LGXIKQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqf7D0lHJz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 01:10:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0F58A4291F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 14:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B03C4CED7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731679827;
	bh=8CSwi+zLM3ewH0q5v5yP7A9xGFhlcIhP7HN+w9H2H84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F4LGXIKQnejA/xtyDR+CZAuDhnASsY/r7MFj28/Q50y5I/BIOT3N6+t7VWbBMGOT8
	 4P46s4uf3LW/HD5irCXeQJr7iAqGWkWlvDVrxhthCiZTMz479sWgAilGub1OWcCXTZ
	 hBDZqwNuNPx7kTfVypIADM01/zVb5cAVk0p8BoxLbsgiQHWJmUJJZUQrpXI9lL/d4P
	 KHs8rqYZk9wpDPZ7RpSKnFEf7WkJNrmhBQgxSZjCFpIvjKYyMWMaMW4311dOqcthwy
	 gZJawSiE2nlKmzKx3LjG5p3M6zB+Y5nTmEShxpcqHzPKcrFOTLCjoEk7PH4XRB8dmh
	 CNnQ2YFK9X1ag==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3808e94734so1834701276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 06:10:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVk/2wphOUqecE1zUU+Tj1xsvW8XadDdDNmadE+S9KzYgKdn1OWSb995Xao1SP2imtr2qLYZIi/aK8/6MA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZ5Up02/NW3xhbL67VTvIMG1IyheJq0Wo4qGH7rpGCY/YssjRv
	w5oLHaUr0MydZjj/s1kdw+2dxvchKw2h0D2jHAiHzpOkjGmgePlWh3+KWf61Ioy18kTu2au4mJH
	kk8uHkB9BIT9QCrHkDRA7b3wTTg==
X-Google-Smtp-Source: AGHT+IHryldJ3ukfy6/K9XYjT+zG+pVX4OOyz2cm6ONsY6VlQexu1ggrxHZf21CfHDkABwxYg58gi7ylStJXS609Zfc=
X-Received: by 2002:a05:690c:6707:b0:6de:a3:a7ca with SMTP id
 00721157ae682-6ee55cbc10cmr35436367b3.32.1731679826592; Fri, 15 Nov 2024
 06:10:26 -0800 (PST)
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
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au>
 <20241114125436.GL29862@gate.crashing.org>
In-Reply-To: <20241114125436.GL29862@gate.crashing.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Nov 2024 08:10:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OCMa1P_AAxL7LxRjo7iJ368wwYFOhZ_-rSYbs=0QbWA@mail.gmail.com>
Message-ID: <CAL_Jsq+OCMa1P_AAxL7LxRjo7iJ368wwYFOhZ_-rSYbs=0QbWA@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Saravana Kannan <saravanak@google.com>, 
	linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024 at 6:59=E2=80=AFAM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Nov 07, 2024 at 10:35:58PM +1100, Michael Ellerman wrote:
> > "Rob Herring (Arm)" <robh@kernel.org> writes:
> > > While OpenFirmware originally allowed walking parent nodes and defaul=
t
> > > root values for #address-cells and #size-cells, FDT has long required
> > > explicit values. It's been a warning in dtc for the root node since t=
he
> > > beginning (2005) and for any parent node since 2007. Of course, not a=
ll
> > > FDT uses dtc, but that should be the majority by far. The various
> > > extracted OF devicetrees I have dating back to the 1990s (various
> > > PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
> >
> > I have various old device trees that have been given to me over the
> > years, and as far as I can tell they all have these properties (some of
> > them are partial trees so it's hard to be 100% sure).
>
> Many SUN systems won't have such superfluous properties.  But does
> anyone use such systems at all anymore, and do people use dtc with
> those :-)

There's still a few presumably. Sparc is omitted from this warning
already because I suspected a problem which was confirmed on v1 thanks
to the DT dumps here[1].

Rob

[1] https://git.kernel.org/pub/scm/linux/kernel/git/davem/prtconfs.git/


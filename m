Return-Path: <linuxppc-dev+bounces-5368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D42A1593B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 22:53:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZYQF6wCCz30Gy;
	Sat, 18 Jan 2025 08:53:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737150805;
	cv=none; b=KaZDkQVtuXBctyvhJg4GlVEd+ltxaj8cHTYKo5wyp2ClTDJvjHz4o1nPPgk/v264YRkEiCOWN0zLzOZ+liKCN6bMxRJ+Azr1/iAA/mkmu+0Sdk1+f0Sl7xsO/EZlCwDUneZlwF+5gImF8t1fCFd3Q6+2I/lDKJq35ntamC3idfvbRJNUI+VJBaGcS7ZcUuPtJ40EI8Ch7+7PIhrZyqJgimmlB9AQxOU9PUDuqvFsq1aaLwqxWnqsWeHESojNat9rsHv4ZJYE78DK/p/QbN8dbAnHAWxkkqtt/3h8K9EQwKw1B5cD22u+WKcsmX4fqbL19Iks9Gt01mmbDaXikLXHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737150805; c=relaxed/relaxed;
	bh=b5NzGPhviz5+DgYW3x7VHCB9qxaEkA6l+/qHYekHnUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6AChpYm2KxyXEAdFvv+p4+F7kzeaoJaGRQo4kswWfYd8Tns65RCmK0eREI/maZY5mmGivikvVk/mfn+ps517YauHYcRvd8Yq+AplEsYC08S1kb8QbSpx6YHA/A268GnjLZv8B34BHK6o9Bqtdah8hIbBFWiGPnM4qJR04YoNKGZ8ottuG2RP7+PA7YnSgZfvMj6wImhvlVDq98aTjMO7A1Hl3NmkW7xZ5ea2lli+ETBSKijbzhdrq/q+lgI8D1T2rX7DUGzuOhLHcfEVXq9qlaPvohxglRQGjhAHI0vtgA1ZjXqNrqOUdlxfjbnwokHMD12Cv3LTJzxIfAhd/KCCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTeJY7ei; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BTeJY7ei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZYQF0j5Gz30DD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 08:53:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDB5EA43427
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 21:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50287C4CEE3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737150801;
	bh=VW5EyfFdiwwuLumv4qmz2SIBbEEyifpOA4x4vJSJnOI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BTeJY7eis3QPTHOrIqrCUqPaZKSgRO45l8lvl8bmx7p0FANWbtahXXsot+G64UvXf
	 yeDzTB6sPrMj/SwvklROwdM88T2IOCoJNmVdbY36TGxs8ljLRZ2u4jt0M9Ip5xb1yY
	 8R88hqHYhWXRYgC/oW0vXmPw0Dbsy35YvsvFsWWAn+mvQusJznFQwgp7h52ds4A38u
	 CIAzA6KacWg+q0wH0dJtxULE5o1XQ5YSzLjdMo3Au/1ATL174wgjShlUN0RSJLxoD/
	 eKlVINLBpnV1tUTW3C7/Awphx3lfLKhuOBZ0NE7tgjT/FWNOhmiV3a6765pNLIwKb/
	 sl8lr+rbheSCA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2825941e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 13:53:21 -0800 (PST)
X-Gm-Message-State: AOJu0Yxb4MzTGIQGtYdxI60NPjdCwrQMbEXIJGJfW9t4PajTanrXzm3f
	bNmpOXJ+7vyxxp6lnRWcoau2ue9kBNPe1fmXTvMTRnqER3oe8JzINSiwjiiLAPCLBaC11k8OEc0
	DJhlAls1uhvh5lT3g+EKJeAlEeg==
X-Google-Smtp-Source: AGHT+IHaU1I94JDdQh3feZHpzfFPRJXXC5A4Hok1wxyjaXGDCJg7IdNzuWujIr7uz1tyy+76i7bsZqcdYD7FJPrR6bs=
X-Received: by 2002:a05:6512:10c8:b0:542:297f:4f65 with SMTP id
 2adb3069b0e04-5439c1be350mr1718121e87.0.1737150799671; Fri, 17 Jan 2025
 13:53:19 -0800 (PST)
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
References: <875xmizl6a.fsf@igel.home>
In-Reply-To: <875xmizl6a.fsf@igel.home>
From: Rob Herring <robh@kernel.org>
Date: Fri, 17 Jan 2025 15:53:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJtJTCv7_VcxfXU8sYPgmXGNu7OCbHWJ4t55RFgb1U2sw@mail.gmail.com>
X-Gm-Features: AbW1kvbNrUoWsyD6xho-P-IFqdqZFIx-qVsYXBVwZXGZEVJ1kqBEIKuqaOXT0rE
Message-ID: <CAL_JsqJtJTCv7_VcxfXU8sYPgmXGNu7OCbHWJ4t55RFgb1U2sw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linuxppc-dev@lists.ozlabs.org, saravanak@google.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 11:19=E2=80=AFAM Andreas Schwab <schwab@linux-m68k.=
org> wrote:
>
> Similar to the PowerMac3,1, the PowerBook6,7 is missing the #size-cells
> property on the i2s node.
>
> Depends-on: 045b14ca5c36 ("of: WARN on deprecated #address-cells/#size-ce=
lls handling")
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/powerpc/kernel/prom_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>


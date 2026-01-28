Return-Path: <linuxppc-dev+bounces-16367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCHyMhA4eml+4gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 17:23:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87180A588B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 17:23:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1SJC25BTz2xpg;
	Thu, 29 Jan 2026 03:23:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769617419;
	cv=none; b=Qwvg93qv5HJ3uIZXz4XH7wIVShnycpV4r/xZ3fgHsG136IbIvucfxpw9gISpa7UcQv/IQNfstUQpGFpybQk7Smf8HQWcaeHuMFCcNz0XmiUqPFdz/5iLTPxnYFPSYFnijexnIDEdMcpdORl+m/rc3gbb+gCk4GxUQh7U4VC5jnc6TyYSMbfv14rj7knqWqwD1iPptyjavfNB4Hrd9b2UirSJ9O6lOW/Y2QTz1JoTBpwrl/FYJ0zwiu8oH961LzESKrdNPzgDmE/sWnaMKRe5AAxQsJS78AzXUj/ApA/6LJuxySCQNn0TOwR1LyWIxoggWxOHXM6RACDfLbkxxRiuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769617419; c=relaxed/relaxed;
	bh=FBiM6EfypgGCPYNu6ecZ/LHtdy/qzg+P6Bhx7u9HIR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HyXBXsR3KmMR3x+iWN6XFLfWkbcMx7X/BsDrhYq8oEzSHv1zKV62WhgejWwm8DDKQrwA7qYCc4QrJaYbU7H77uFPfXuFdiCCx689J+C09p5lxo2wk/mq7LZI4CKgUmzPUp9xgs3GsAI0NoFYy3bpR4ivPQdaq4tDqSKdW+uYF4Crk/Hqnzcq8xT+d8L3r0lYgAXhfS69SYgxNANTPzMEIDmslodF6kkcmA658ViHlid1xhRo6FQuVGtjQEsp9jpGLTPh9L7J8vzrYZlmOZSiF6X9D84BQJ+GTHSkPYuMjSylwuPGH1L6UbN00kHAOS4Ktiznz/1EqUAenT5AaSWxog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4YeAKvJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4YeAKvJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1SJB3TdBz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 03:23:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDA3E42B75
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 16:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECFDC4AF0B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769617415;
	bh=D2EVtZ3Bdu41Pl2Ma9t3PpB00ixzoM6dRSpGiADfFr8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p4YeAKvJ4CZPDV0CsW0tDcLM3yF13+bVmuMOKrOUdHxL/dAc9E1ENqMe/DfaNGZ/a
	 GbrOCgII7DSINitopjirki2BpP4rvUcFtluq+uCWyB2TmvlT2UVhf74mLBOEN6QaL5
	 3RgM1b2CEYOnNgF4Te+C7jNxS931uJ+Oo4/CDSdQdHMf2YJvjFdRFYmw14kwr3KtGB
	 tSyUt7wkBg8WYTY20X+0bRYKs1UXdPexCrG9pWp1NO1hmwoZ/NZO85DUMjY4AB52Gq
	 1HkofEsz5iL58XThDLBHRvejF7V3ika6W7z4WNKFquhecCKCKOOaYL7QPUkqejByhs
	 QDC3X27Y+pbyA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso127548a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 08:23:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/lq+T2Hs6eXOARTIhiAS+E3h8f2AX3dlkTqDbu28PcrPaBOfY1HSjlsvlRKa6uA6ho+rokw76dnMPgSo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpwkZ9KPdiF4N0ifbznNE9faV0KsMNq00MpXRtLvsXR178D8Yy
	25AnxZGXab+vU6diibj4jYi5YjJsGrwrt2vmxiljnknmnFcah4ogsOZ47vS0iNjuqwAoVJJy90+
	ruog7RgHYGJCRozSOJvRw2AS9qE7tWw==
X-Received: by 2002:a17:907:7f89:b0:b87:65c5:602f with SMTP id
 a640c23a62f3a-b8dab3304eemr370934466b.34.1769617414310; Wed, 28 Jan 2026
 08:23:34 -0800 (PST)
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
References: <20260128140222.1627203-1-robh@kernel.org> <1fca424a-6215-4303-a0cd-623063945ce6@kernel.org>
In-Reply-To: <1fca424a-6215-4303-a0cd-623063945ce6@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 28 Jan 2026 10:23:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLAREg7ZNK55fsLFcPkj7L4o5nRRvDCHiBu_UfRgEuJvA@mail.gmail.com>
X-Gm-Features: AZwV_Qhwv8z718O3HYAh8VI3E2MSxN46iPZvhgrJUI-6gJD0GIquFnIPc1OVxUU
Message-ID: <CAL_JsqLAREg7ZNK55fsLFcPkj7L4o5nRRvDCHiBu_UfRgEuJvA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: dts: fsl: Drop unused .dtsi files
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16367-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:richardcochran@gmail.com,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 87180A588B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 9:43=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 28/01/2026 =C3=A0 15:02, Rob Herring (Arm) a =C3=A9crit :
> > These files are not included by anything and therefore don't get built =
or
> > tested.
> >
> > There's also no upstream driver for the interlaken-lac stuff.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   .../boot/dts/fsl/interlaken-lac-portals.dtsi  | 156 -----------------=
-
> >   arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi |  45 -----
>
> Those two files were added by commit 8c43d2b0ca10 ("powerpc: Add T4 LAC
> device tree binding & defs") together with
> Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt
>
> Should the Documentation file be removed as well ?

Yes, once there is no user, I will remove the binding.

>
> Regardless,
>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Thanks!

Rob


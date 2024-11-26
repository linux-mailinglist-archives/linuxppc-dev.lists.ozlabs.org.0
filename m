Return-Path: <linuxppc-dev+bounces-3559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0DE9D90B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 04:36:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy7Xr4vMKz2yNn;
	Tue, 26 Nov 2024 14:36:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732592204;
	cv=none; b=nZqmxcIpsNAniyM8t3NAMMWSjTTC6nO51grPR5iOysbp7unxBDBx+RwWZ8I83ZjHtu9KqGJ0/tI8HCVQbK5/FgxkuNb/qeHzCy0wlQwvaNqO/e5xATxCl9dQHiVW/obWbZzEEi2V6H3V0NBJJPUz3vSTjLw0Shkf+/F8kmpqHUOIhcTsfJXh8osCJGx0KwHkAbLuCsL2PMrI0m44PNZbpazhNBTCtOgoZY7Vpd54j5HRhROVN9VjL78XWLiiP0HyncaAXYpiP6KrnUup9F88QLgQ3pGt2wB9CwQ6xN+BonOEppbJLtcjc2IASd4+vFw9uERqDV8ma1k2ayCicbsRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732592204; c=relaxed/relaxed;
	bh=vHiA1DRTO6Lz/YaaxntcT3ZGiZJBg9vrvS0JqD9lF8E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H3zLibTjFmio5wz7MqiZuXmB1LroJpKPVp44sNpguFiNxHNDt+2np/fP3QPkV+KT+4rYhWvtZfK4V6vI+cJXSkND5DWOyRJa1AVV+eM0UjkieMdTTQviq5CJ/RQ2JnFZy6vNV3E3rg124yeJ0LHayC5Z+r+1kcndRK2i/UVN7nERmffXAhnA0CL72olT0HtmHd0atsoSkGr7wWfzHEOd1s17+swzYTSGH4UMQJY1SXuB7pdxjY2VTEYFNhHhR0fK1qQzRiqKwEnKGeHZ0JZyhLPmhv42/lMrlsqRnmR+3kn4mk7jLEBZgYALpcmv83fy3GQH4v7gnGiLR1xtPaR82Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UArujJNC; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UArujJNC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy7Xq4qgxz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 14:36:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732592198;
	bh=vHiA1DRTO6Lz/YaaxntcT3ZGiZJBg9vrvS0JqD9lF8E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UArujJNCgfKANdoEUFU/xDCir05HT5vCMXOIZj8M45wg/RePEIz0kM/Y5TQ+vJ+i5
	 XUQ9uh+k1oZEA4MJ28mW7EJdLbPRW9OTcQ4OFjpNemNAqgpKeRM3UGFzBaU0gytSqt
	 Xhy/IM3n3qPp9zy9MDhV8D9KQRg+MLTfl+lWNNbCynmFM+szYgXaYG85nSsxTzGuTB
	 XAXf6KSPoPTAUaROrcmCIofctWQ0AGGacFAUFXOvQ0XGkfiPYc30WAZb+3EWTrY9na
	 fNWfNvjrPJacvtMc6mkYlA/cxYV+lN6axkowIbJBdUAmCfHRtZYZyAZ/sb6t0QLqzI
	 5DnoaG//47g+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy7Xj6YMGz4xft;
	Tue, 26 Nov 2024 14:36:37 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
In-Reply-To: <87jzdfcm3l.fsf@mpe.ellerman.id.au>
References: <20241106171028.3830266-1-robh@kernel.org>
 <87jzdfcm3l.fsf@mpe.ellerman.id.au>
Date: Tue, 26 Nov 2024 14:36:32 +1100
Message-ID: <87plmi7jjz.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Rob Herring (Arm)" <robh@kernel.org> writes:
>> While OpenFirmware originally allowed walking parent nodes and default
>> root values for #address-cells and #size-cells, FDT has long required
>> explicit values. It's been a warning in dtc for the root node since the
>> beginning (2005) and for any parent node since 2007. Of course, not all
>> FDT uses dtc, but that should be the majority by far. The various
>> extracted OF devicetrees I have dating back to the 1990s (various
>> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
>
> I have various old device trees that have been given to me over the
> years, and as far as I can tell they all have these properties (some of
> them are partial trees so it's hard to be 100% sure).
>
> So LGTM.

Turns out I was wrong.

The warning about #size-cells hits on some powermacs, possible fixup
patch here:

  https://lore.kernel.org/linuxppc-dev/20241126025710.591683-1-mpe@ellerman.id.au/

cheers


Return-Path: <linuxppc-dev+bounces-2981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953069C0434
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkg4d1cPGz3blv;
	Thu,  7 Nov 2024 22:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730979361;
	cv=none; b=CxL2hTYzwrt4tH9h/M9HD7SkNTIxGpHfKuapWL7rHVnF+KEwx1aHUs7rH4mD6YMfF5d+YtFOLgWNO4jEPIGGybR7a1U1t1en23GAF35Ei4m9rd6o6EIJr3xQiPJV25WwxCotv1Hitj79ZeGrmlftl+unZxnimtBuMQZUHVrVL8TyVoTaodO9rTQmxw+OdvH0GhZ9n2W5BLUXl1OGhAgoXc/CBjtA8zdLkPc94GyMDFyeY3knWNcRlCahBsUuHBR33r8uJaholizdV0gX8SVPh0gJFh+QJdZgjcenlYIwSZMHU3xLrOwxduSZpJ0hUojcscvxMJJUXm+TfFxFa88U6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730979361; c=relaxed/relaxed;
	bh=Qu3sLBuA2l/huyDUtQbZTBU6aoM9vYd0HPB2dAFL//0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kg+HdN1jW4XWBtryN941C9/2dQhPk1l/Ni8dn5gfpAIpuDzAa49dsAfIBzqH16c7BFInl1URJaf5D2UAhtRk5ozP+togrFIxH7rYd8YLYwM6lh8RNKlIcdeBXgKRkosVu0sSM8ipghMvN+P6N5/DNEFUonwqUQegecl82wDZULf3ZjPsQ6gUsBPZ4f+cY7QmJp2/F+2aQQZfmZjirGXtodEwdkNrd4WbI9S3KWI6Odwl0cHsWqomhWB6lHaSaSZSeaACXguP/UKKkKrxT9PgDtATt9MQ5Ghpg0SjUqT0CPKTW74/IkZac2IsqVkEs9ioBJV33SnZYuNNog32DXDRIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Natq8Mpc; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Natq8Mpc;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkg4c1x1Xz3blN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730979357;
	bh=Qu3sLBuA2l/huyDUtQbZTBU6aoM9vYd0HPB2dAFL//0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Natq8MpcvRLo8792rq10uzgXADLxKDmvQR4WmIHLsNxlKVbDwwFth3TYqjZr4rF4f
	 gbBSMOgDumUl8QS5BAsImk31g+X1EIm7PcQ7W1hQf3D5i/bZWR0wEiH1qNLjHIOD89
	 sb6MEmnQXSOUhDinrRe0qAMVoeR7Mbf+mqXGn2upl0UP93H8E36bVAS9UNDw8U6ykS
	 7lLZyEqWobbNGobltBU3x358guCheZHNAlhYLEq4lLNDuOhDlRvYYGhVneQWCbEkVV
	 LIxlox5M6HKta8CaHTeKnEy0FEzFicWDFg4P1t2Mcs0P4mN32rBKNBEKLHNWb1UWw8
	 tCwLk+K4i2zeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkg4Y5S1pz4x1w;
	Thu,  7 Nov 2024 22:35:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
In-Reply-To: <20241106171028.3830266-1-robh@kernel.org>
References: <20241106171028.3830266-1-robh@kernel.org>
Date: Thu, 07 Nov 2024 22:35:58 +1100
Message-ID: <87jzdfcm3l.fsf@mpe.ellerman.id.au>
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

"Rob Herring (Arm)" <robh@kernel.org> writes:
> While OpenFirmware originally allowed walking parent nodes and default
> root values for #address-cells and #size-cells, FDT has long required
> explicit values. It's been a warning in dtc for the root node since the
> beginning (2005) and for any parent node since 2007. Of course, not all
> FDT uses dtc, but that should be the majority by far. The various
> extracted OF devicetrees I have dating back to the 1990s (various
> PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.

I have various old device trees that have been given to me over the
years, and as far as I can tell they all have these properties (some of
them are partial trees so it's hard to be 100% sure).

So LGTM.

cheers


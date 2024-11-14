Return-Path: <linuxppc-dev+bounces-3163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B219F9C8060
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 03:07:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xpk7r1TjMz2yhg;
	Thu, 14 Nov 2024 13:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731550072;
	cv=none; b=kPlPofMpiVs1gExehapS9P/pOsAfhXvchTSo/YJyqx6FoNMx0+y1NF8ONcb8kumQaRJnzejIWZ616u8M6fQSo9kpJyAxUK361Zya9dOLgVYpKEd27Ws5g/SjA8nnHWzY11y2niaNJEj0p3BW7L3LXJFkGfhlcwi1YaSrxE97gGrkH0kn1zynFwC7mQYDN62vi5/QqKIrio2SUmS+LiKvzvAf5vlbsvzae65VWhUHPNSnvjPSUftgoWTOhaP4FvdBZDuH7vAq1MbJrW+RRL4GDPRF1cIphHXTWIXH6ba9eJu45ECU28DZKbsZMlWiIQMMBLuRD8f6Jylqibr0zZzGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731550072; c=relaxed/relaxed;
	bh=BBfagTzfNiRjzEL6QJhFtCCEuOrztefDgMR7OwNToOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YDGDpvWAhjg+q3vqNA0pSRV0loTACJScorAcNlSjFmXTCxcZtCetKgWuHyndGpgck8ACo/pNlY4PJiv8Ar0RjZ4Caed8Zsshht83aRuPFtWaFLuh+/D2gDPtcKAtI6JPFkgMVxQLNpnh2G/ZsiNc4EsOmsfQsAzZKeo4fGYHHE2/PguppO4tXvC52sOE4aXOfZVq7WqeXmyatK0uQQLbfDPJynuWyo05mBbtK1OTZURhUlwMy/7oD9iPjTgRilcoC1f87zhe7Egs90ieJwooaME5ruUw8eOGJvrJSivtCxSbRpN2xUXZHHBHxqP0ED1q3D+R3rl8fY+BbYmcK66n7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AFAy1znJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AFAy1znJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xpk7p6CdTz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 13:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731550068;
	bh=BBfagTzfNiRjzEL6QJhFtCCEuOrztefDgMR7OwNToOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AFAy1znJh6ppKfBr4FJa0ACTelaEk8pXJsDu8CS3b2wQm+PJYmzITG/Ntgwi6snio
	 BpMtbHlgSXuvYotDSHnriKnophoLxPHJck3I1ztJ5QnMHLMIe6plxj5ivLMe5S6eZf
	 j8RPk3oTBtQ8SQca8/FMbcnGWZcqklbXIifxkoIb5YA7dy+qfv8NvrQczYYTa9R+Np
	 6Cv2GVWJnpq/Y0MBm722o3umVRoBgi95qcCBYG2lXMkefPWV3dedjZZBUIQVTExEaE
	 EC1VBbzFB60eT4/0UA/qyEBY4VRst2WF04R0eoKyN+7Iu1ar5ROmGxSLlSv3xSbzpY
	 U/JNmL/8vFO9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpk7l64Qxz4wcT;
	Thu, 14 Nov 2024 13:07:47 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>, linuxppc-dev@lists.ozlabs.org, Conor Dooley
 <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells
 handling
In-Reply-To: <CAMuHMdWk83QpTcbuBz=m6UZ+ShFM4rTt_UL-frzR3LmAf_Tb2Q@mail.gmail.com>
References: <20241106171028.3830266-1-robh@kernel.org>
 <87jzdfcm3l.fsf@mpe.ellerman.id.au>
 <CAMuHMdWk83QpTcbuBz=m6UZ+ShFM4rTt_UL-frzR3LmAf_Tb2Q@mail.gmail.com>
Date: Thu, 14 Nov 2024 13:07:49 +1100
Message-ID: <874j4ava8a.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> On Thu, Nov 7, 2024 at 12:37=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
>> "Rob Herring (Arm)" <robh@kernel.org> writes:
>> > While OpenFirmware originally allowed walking parent nodes and default
>> > root values for #address-cells and #size-cells, FDT has long required
>> > explicit values. It's been a warning in dtc for the root node since the
>> > beginning (2005) and for any parent node since 2007. Of course, not all
>> > FDT uses dtc, but that should be the majority by far. The various
>> > extracted OF devicetrees I have dating back to the 1990s (various
>> > PowerMac, OLPC, PASemi Nemo) all have explicit root node properties.
>>
>> I have various old device trees that have been given to me over the
>> years, and as far as I can tell they all have these properties (some of
>> them are partial trees so it's hard to be 100% sure).
>
> Apparently CHRP LongTrail only had #address-cells in the root node.
> Interestingly, /cpus does have a (zero) @size-cells property.
> http://g33rt.be/migrated/Linux/PPC/root.html
> http://g33rt.be/migrated/Linux/PPC/DeviceTree.html
>
> No idea if any of them are still alive.

OK. We could fix that up in prom_init() if necessary - there's already a
bunch of workarounds in there for longtrail.

cheers


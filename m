Return-Path: <linuxppc-dev+bounces-6078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86806A30815
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 11:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yscdj4SWmz2y34;
	Tue, 11 Feb 2025 21:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739268633;
	cv=none; b=PUnqVuGUinuHTxbKThXb++jLg8xVPjEpx6RlmUWfvUZcfT0P3GmVifSSS0wpap/WX72ss8EtY6jp+4pyUSAtVzD7QZT8OyrlZQNnkB7tt3P6zrFTujGoydmsRKwMVxrZWsLU4FjbkZwFUI/r8jjuzxjQw8TChn2jQMxejRuSjJsaUPxhaiO6m9o+A1kHr95Y8s5S5jacEjK3vcYO9Ioram0ApHMROExbVATTloKrco4Prt3NSYIDHmYTKloAPrbU2NsiZaRaJ7FRCYaiCv/uGPPgDgQLzaUIALQmak70SrXJ5cAnlfAOtNErpZ5Ug31dn5OKA8+HjFq0abpv/+hYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739268633; c=relaxed/relaxed;
	bh=V+gMOYvoWIt5nU3jlhjNHZLeP9/GydXZtu5uaVnrrrk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=abIILiZkjSjSmF82bO5Wkj5vDN1Q97YYaOMx4McuZSn5w8NVmDI+yapYNphZ5GrUTWaJSrW8Dt97/x8PBEt/Q2EtlvifY5TjucwSrTY422vFCH+L1TRuFYSxkA/0uZG/NZgrkOe2/qt2hFZnbWckpBplWRr7VyfAlSLuNJ/Jo2+5Dy0JFpw6gSlDN+KAkNKIlMbD4bqM7HzdYz1n+86MrGq5gJxmHaHJ8uOCu2yiTK0ClX61g6HAp/6pbfi91p9JNKJO9ABs2xBNSt+9ZjAwkLSRezTfKoZEAZ1rJXrGksOr2FEUI7DdUcvWyw/TnHxePr8fNtq5yCdszRgVHaDpsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ueTynWnd; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ueTynWnd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 69004 seconds by postgrey-1.37 at boromir; Tue, 11 Feb 2025 21:10:30 AEDT
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yscdf3G1Bz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 21:10:28 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739268607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+gMOYvoWIt5nU3jlhjNHZLeP9/GydXZtu5uaVnrrrk=;
	b=ueTynWnd5MLaFyH1IO4YEHlbzsyJtELwNLq0Ww8MRFrSSbuyu9HduE5tXsBV7l8wRvIuXe
	YxosfzDMHZn8mkfgGY7QP3LP3ALT2PQn1TFFT802TfTpQnoX5o2HGnJUuRo4Zysi9u7wue
	AJzo80aRIIFIvy/nCiWJRYIcKDe+CtQ=
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
Date: Tue, 11 Feb 2025 11:09:54 +0100
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C108CDE-EDFC-4F62-B749-FAFBECD86FCB@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>> Isn't our file just a copy of the one from binutils ? Shouldn't we =
adjust it based on commit =
https://github.com/bminor/binutils-gdb/commit/2ce18a16268a ?
>=20
> It looks like it's a copy and the name is spelled the same as in my =
patch:
>=20
>  "Mimi Phuong-Thao Vo"
>=20
> What's missing to get this merged?

Anyone?

Thanks,
Thorsten=


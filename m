Return-Path: <linuxppc-dev+bounces-14574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B00C9DF30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 07:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLp4n5p1Tz2xPy;
	Wed, 03 Dec 2025 17:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764744217;
	cv=none; b=grvEf0jVkLTwV2SolMWJ/JtgksNtHtnFCgYdMVtOEM7vDUXAt+0YDGEN82QiQfbfeVr/FnCYiw7fcsIJzrlogdnmNIVtK0FoFPaLtII9+yOuf3WCTfNY+0UNYd7mMw/va4/Ckv1x1qBgCzIuE5kPIjGE+GWIlGmOmuKZ0i6kOsFfGtClvRN/JWyQCM3kXnWRh5bse0c29xFdvgSkoMcelwLExqNGYgl1nc7IgrBCjIl3OIgONt6YLwJlQueoaH1lCpLqiM+p/QKlaSVaRx+r7zFO4oHuD0Wa615LtsOs9bwUVY96Tpn0kQy32PehVnJ1etlLm9+JhOxmdqRq63vA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764744217; c=relaxed/relaxed;
	bh=VIWYRzfS1twmazzAfIIbUMzCunM8gdmAWLojEEM4vJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZA5xUaNWlPBdkImMB2+6R69irFeXH7ijQduzwYoDKgdcoCp3+Mn/ZTU2oyCmz/xpDOuP58wb43SRNYHHGqqKUM1xn/GOsQOMf6LDg6mstjKzFdxQb2eAtvHY+Ox90WC4NrrNOC3zZcSBfmJRVqOFCQcofgU5yPGY/1ANVYYQg26Ke7gVnXKCymNEh7ehfsTZQs8uYD3c+56czDslQIC+wT27wc+q/myItdhWTa1Tzg/vLVsQHUpAg5wsvTuSvKMoJsLfiYHWLu5XHxqRhnV8gL8pyKZ0nTeSl0lMBj2eDK9m/wOnOsWY0/5gbRjjjb3pD5XA5YOGw5Poqibim1ydMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QCi1UDpV; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QCi1UDpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLp4n19Ybz2xNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 17:43:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CBC560172;
	Wed,  3 Dec 2025 06:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD62C116C6;
	Wed,  3 Dec 2025 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764744213;
	bh=GTlpfWHOi3dA9DE03KbWK4Dunv4X05i9+9J/Gp4hCuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCi1UDpV/5WCtc00oIe+SN2cCmuqQgi7kjyV/6JNbLjMOkNUpHJbyePS0KLxtYyvY
	 i//ELb8oGlwPVTmG4zJKYrtamRCEh4JNK5ZckZFhDNKC0spER8p9IVdcsXaheZkSZ/
	 EazOcg+wR6dPkBwJYrPKTeJK4Vzgayj7qS0dU2qXoE8FVQisqfwyOvN/47M1+pVNl8
	 EoSm/sFyE19ECR1B/+zzfwaBJZh5JQW0uqJzE31F+4GzexHe3CU4HrwI92ZvsNQCbp
	 fsCSxVBil0jrPH+j85EE5Gg00awaSv4Tk5nL5uDX3c2E+jjgKotqikQm+TqkCQYoE9
	 sCroIQuMdbhOw==
Message-ID: <9d03b3b1-ab1e-45b3-b832-0268685e5d20@kernel.org>
Date: Wed, 3 Dec 2025 07:43:30 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bus: fsl-mc: Convert to bus callbacks
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
 <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
 <2025120253-bullseye-diaper-8bd9@gregkh>
 <crbruv2pp24ljufun5ki3ow3ips326tpuitxch464b2iuhwwem@i2yf5wynizvl>
 <667c52f6-ee74-4d8b-b683-c1c7027467d0@kernel.org>
 <l6m65shnnd2ulgzmbaydtowrdmuskjvy6c7lxjgie6x5okxgt5@fa56vfytbszn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <l6m65shnnd2ulgzmbaydtowrdmuskjvy6c7lxjgie6x5okxgt5@fa56vfytbszn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 02/12/2025 à 23:34, Uwe Kleine-König a écrit :
> Hello Christophe,
> 
> On Tue, Dec 02, 2025 at 06:47:52PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Le 02/12/2025 à 17:07, Uwe Kleine-König a écrit :
>>> I wonder what the merge plan for this series is. The last changes to
>>> drivers/fsl-mc were merged by Christophe Leroy (added to Cc:)
>>
>> As per https://lore.kernel.org/all/2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36hlxefu6jnz6g@zlorxu7niqnq/
>>
>> Also see commit 586739b1e8b1 ("MAINTAINERS: add the linuppc-dev list to the
>> fsl-mc bus entry")
> 
> Ok, the fact that was unexpected by me is, that you, as the one who
> picks up patches, are not listed in MAINTAINERS. But it seems to work
> fine.

Yup, the maintainer is Ioana but she has no git tree. I usually take the 
patches once she has reviewed or acked them.

> 
>> It is a bit late for v6.19 though, will go in v6.20 ?
> 
> I'm in no hurry, getting it into 6.20 is completely fine for me. Thanks
> for picking my patches up.
> 
> Best regards
> Uwe



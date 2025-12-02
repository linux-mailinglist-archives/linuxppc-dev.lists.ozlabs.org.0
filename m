Return-Path: <linuxppc-dev+bounces-14568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2CC9C75A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 02 Dec 2025 18:48:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLSsr6N1Mz3c3D;
	Wed, 03 Dec 2025 04:48:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764697680;
	cv=none; b=Ybnqb8js9yjWcV0aukiDnykCxPwL1PpQqxQmqYrLmMSgrhQQ6IxGUUMtjcyAWBWLaX4vwZQjSMc/bROFb+gt9OcI7WTzELtuil557ESpVrSGC2+cAJRRdZnPNF1qCmiRKWF0Ju3FdzwvjDmodMX7bfTbxAVwvi8nnj15CtMtXNNfYfGimLVh5P8E9rkkkKZq7qD0ny7XDR2DKdufr3tF0Hncr7XerCNzZ+mEMPXxTyATd+Gz7EhYApTBDznUytLKbibDsVb9qAH9fGdzu8aSyaOprsRj5s9nviAeX7PI/Qrkcqho0EzP6MEX1Ls/QzTcV7oEn3MmW4PTIoWo4MPY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764697680; c=relaxed/relaxed;
	bh=nyW4hBuKT4DUMCvScIH9AYPufow4NIeVsN/tIs+Cxns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfU2c2cPtiQ4YbGOXQt2ozZssOisuEb9lPHWG/jfY2GCBrsr3pkFPqbmHbyvuSO43J42LRnmE80trBeraHd2mezNYL5IVeyuSG8EpJg8EC9eywML5zNbSczFoiCZJOwjxgbO86skeytkUjB/HY5Nk+DDYnePxYCPFNJcoOmtgT/Tq2wEULmuH0ni2ww0vE+8OTEI82zBpd8D321h89PLuiAqz81BLpuI9F8n66/ZTc/lb1u7qFOBe/wEPgJpexzRkGlPcalXK4UxnOtl1YYArw2bddA4wWlOYdicqPpwGRItjp7FzDr5OuEOJWeURB+BBidZoVaKelZ3rjYPdZcM4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Osv4asDe; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Osv4asDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLSsr0b2vz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 04:48:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8CFB60153;
	Tue,  2 Dec 2025 17:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A23C4CEF1;
	Tue,  2 Dec 2025 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764697676;
	bh=V6CPgfEOWgWhEKNNBBe88IGhDLntTt4zNGMQF8kRW6c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Osv4asDeE308tuIGgca8X0s8ILsvbe9KvfD/g5gZ0PUdrVSU/6RSK/ZgpfuXoC2BT
	 1wgZxLy55DcyPdN/NqkX2WX7ZhoDRrKjAFkWXC1lXPW4u/TWkc/KMQsv9+MK+XOlf5
	 REV+66rW1akEcslbub3lLwXJLnAAtTI8d61uXwFIRf4pqnWllKxKzdv+LZ6rqaPRtm
	 WGpl3vjkA6MX7Do0MT3zZOizZlxLOLbobqqA+r3DNmbTcxZxBlG9MsXP9kgTH+059o
	 hXx8NDs7ekb30QDeCGo0jsplAH92jNxbPJX8iy9RKXABGFOIpGLpS8gFSrykf7uyrc
	 9mz9RhkKrTEuQ==
Message-ID: <667c52f6-ee74-4d8b-b683-c1c7027467d0@kernel.org>
Date: Tue, 2 Dec 2025 18:47:52 +0100
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
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <cover.1764684327.git.u.kleine-koenig@baylibre.com>
 <848fffe5c479d899c04a4c99ccb5f0128ccc942d.1764684327.git.u.kleine-koenig@baylibre.com>
 <2025120253-bullseye-diaper-8bd9@gregkh>
 <crbruv2pp24ljufun5ki3ow3ips326tpuitxch464b2iuhwwem@i2yf5wynizvl>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <crbruv2pp24ljufun5ki3ow3ips326tpuitxch464b2iuhwwem@i2yf5wynizvl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 02/12/2025 à 17:07, Uwe Kleine-König a écrit :
> Hello Greg,
> 
> On Tue, Dec 02, 2025 at 03:48:05PM +0100, Greg Kroah-Hartman wrote:
>> On Tue, Dec 02, 2025 at 03:09:20PM +0100, Uwe Kleine-König wrote:
>>> With the eventual goal to drop .probe(), .remove() and .shutdown() from
>>> struct device_driver, convert the fsl bus to use bus methods.
>>
>> We can drop those functions?  Ok, that would be nice, didn't realize it
>> would be possible!
> 
> I think we discussed that some time ago when I tackled making the
> remove callbacks return void. When I said I want to make
> device_driver->remove also return void I think it was you who said
> to better convert the users to bus functions. So that's me doing what
> you said :-)
> 
> I wonder what the merge plan for this series is. The last changes to
> drivers/fsl-mc were merged by Christophe Leroy (added to Cc:)

As per 
https://lore.kernel.org/all/2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36hlxefu6jnz6g@zlorxu7niqnq/

Also see commit 586739b1e8b1 ("MAINTAINERS: add the linuppc-dev list to 
the fsl-mc bus entry")

It is a bit late for v6.19 though, will go in v6.20 ?

Christophe


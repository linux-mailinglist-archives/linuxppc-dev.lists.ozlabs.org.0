Return-Path: <linuxppc-dev+bounces-255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E695943B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 07:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpb1Z6Hwxz2xfK;
	Wed, 21 Aug 2024 15:46:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T9H/2WAu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 593 seconds by postgrey-1.37 at boromir; Wed, 21 Aug 2024 15:46:42 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpb1Z4W72z2xSl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 15:46:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10E45A41010;
	Wed, 21 Aug 2024 05:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589A9C4AF09;
	Wed, 21 Aug 2024 05:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724218605;
	bh=u6wlsGPaSbN9mix3uszAEpIzPI363xr5NjNow1rz6BA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T9H/2WAuntRz/eTIOAmelXDyCsguiLrb7bV5S0oWsYfpER0pR23CkmaiYif+mb9IK
	 bKkAbc1UC7X7uSF9ViOcTmdUts1R4OoQNpYpsGFwlaN7afrbhIQ7EyFRYQKGbFP7dD
	 LVb3XMUh2XIyVjdj7GR+SN1YbGp6tdPvUVzCe0+bdFrdgtSzf77nO4qZoQTU4OLnDh
	 xZnJZWLCjfxZeMXXlvmlsEhHzbqHpCQbRh5j3Qg/qDZ/oqg2XxtTHcgyK+GRj/Odyf
	 x43gWQpmZ1vuoHVvo3OXryp8sFHVYy22gE8V9oad7lRnyqapiVJ4gtHYok6z+Q7bss
	 W1liuyBukGHAg==
Message-ID: <aae0353c-0d5c-4acf-be44-3690a0c50613@kernel.org>
Date: Wed, 21 Aug 2024 14:36:44 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
To: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-ppc@kolla.no,
 vidra@ufal.mff.cuni.cz
References: <20240820030407.627785-1-mpe@ellerman.id.au>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240820030407.627785-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/24 12:04 PM, Michael Ellerman wrote:
> The overflow/underflow conditions in pata_macio_qc_prep() should never
> happen. But if they do there's no need to kill the system entirely, a
> WARN and failing the IO request should be sufficient and might allow the
> system to keep running.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to for-6.11-fixes. Thanks !

-- 
Damien Le Moal
Western Digital Research



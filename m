Return-Path: <linuxppc-dev+bounces-195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA3957B6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnth140Xnz2xZt;
	Tue, 20 Aug 2024 12:29:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EeULGUlN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnth13tZ1z2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:29:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724120945;
	bh=JYhMS9u8ZTJ8sPzxbwWOaXQOggyNI+Esur8+zhF4uWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EeULGUlNGbiOIbjPTsblY2BbDNvAaXAc1D2RMq6U02zOeMbZrfWww5zut3YH32j0L
	 p+3+MJpQkoxz7vfFT7celZVVdPsVyYT1TDG6nXvRVqsrjIHOhs6SRTPXivjD9RSlU3
	 5PRSGtSVhqWm0IeZlvSNx5YmrEuT2SnuOPrIIdJ+TwE5Zs0mUGCMf8jv1AUUz9q7Dv
	 Ii/OFYII8RHZW2eOs0lcgfMNr98ap0dDS4wrdyBJKxy89lrsLET7g8A21I/+Xty5DF
	 wtTPM4O1psszqJaXOlcu6blf1OPv8OQqe/V1R/pe+OUl+tio+bCc3w83h7Prn6e3gO
	 tmOnVmFZd2Zvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wnth131JNz4wd6;
	Tue, 20 Aug 2024 12:29:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Damien Le Moal <dlemoal@kernel.org>, cassel@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-ppc@kolla.no,
 vidra@ufal.mff.cuni.cz
Subject: Re: [RFC PATCH] ata: pata_macio: Use WARN instead of BUG
In-Reply-To: <737ad178-1198-4103-b1ee-46a67ecf12e4@kernel.org>
References: <20240819101913.489513-1-mpe@ellerman.id.au>
 <737ad178-1198-4103-b1ee-46a67ecf12e4@kernel.org>
Date: Tue, 20 Aug 2024 12:29:05 +1000
Message-ID: <87bk1osz9q.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Damien Le Moal <dlemoal@kernel.org> writes:
> On 8/19/24 19:19, Michael Ellerman wrote:
>> The overflow/underflow conditions in pata_macio_qc_prep() should never
>> happen. But if they do there's no need to kill the system entirely, a
>> WARN and failing the IO request should be sufficient and might allow the
>> system to keep running.
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  drivers/ata/pata_macio.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>> Not sure if AC_ERR_OTHER is the right error code to use?
>
> Given that this would trigger if the command split has is buggy, I think that
> AC_ERR_SYSTEM would be better. Can you resend with the change and no "RFC" ?

Will do.

cheers


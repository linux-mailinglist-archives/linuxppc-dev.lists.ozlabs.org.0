Return-Path: <linuxppc-dev+bounces-3388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15889D03BC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:28:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjJ4sQXz3bsq;
	Sun, 17 Nov 2024 23:25:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846340;
	cv=none; b=dwo7WjCdHjUEj4MDN70e2Mqlvxiutrff/VfWFYE//aXd2VqVkV/YaXKvue6efk6lfVur9FKwDeCwn9z1mjX6T+3qA1u9SX0IhFF0L5KlSNucsk2NjkDVW4/F5A2a0PSpy2mJTDqimqeelyCti5qxBy/hijbnGFvoUSL9BsH4i22XvFZwzrFv2V0lQzZRCa2FhBsWdHndbpvyTrZAuXmI8EBDxPZjHdl06UyDNgkzTQtzalpkNfMUxXzDb2HkKvItkj2E55HQsp1FT9wldl/FRYEcG/0bfbtLXVXYW+6Zfi/mdn8VaRfWYobPStEo/exTEFzlPrxlfJjsH7SaykXbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846340; c=relaxed/relaxed;
	bh=EjOLBTm8qIVwqFQ5mRUKY4dTcr0ZMFt3/mFMTBHvnF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bPrau8nvLE2eu6pVquGFmjOqRRqI3PqHC8br3UUFopbrZTl4nA0NiUbgy/mBpB1Ygxl17GnJa+kiimXk0IcoF5Ljj6xkDTmivT7ScUsErz9OB+21kPHutPDGDW+LXxFqQ9ZVaokBJs113ZBhbl41k8MQw3QwhR8xbGBn468CZY3OInFA9dSAx3PHR2V0Nc/g2QewpmcUXhP8l5i7q3Ehzk2xGqkGnUZbH/iuP242cB8DWuXHtO/7endKgjt+bF26cjV1++RHZc6edi4xbbIrS9x8NQpMonJUnqnyF0ZK7WhL876P/KywYDsP3DetcFEE3AWCZZOUNSNP8fTTfJzYWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pOO/s//2; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pOO/s//2;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjG51Vbz3bny
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846335;
	bh=EjOLBTm8qIVwqFQ5mRUKY4dTcr0ZMFt3/mFMTBHvnF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pOO/s//2bzWDv6KajHsDX2odFSy+UCz6LHeHejry3vt6e8Ccit3FEXYVrYLNiVqio
	 pNqFnR97xO0zWo9yaR/nhrjojsdYZis4BxdNR5NkfhjeqXUZhi6ysXyT6Mnk6jCr4a
	 VlXCewU4YR3QYHmc0qjYLXP+s1Wfw+B0Mnw8uoN4krz8uY65ZnXrhSr/pisVnMGDMw
	 RPe8hnbFDUYDE1xvOkqbMcjZxwaKX8DXfmDjBTUyW9OJyKr8XjD5PAo+f639tpPT1U
	 muvzkay4HYDVJ3rup7aoIf8VKBxiNxvOReN+xgmc+xFohgrsf56jX+z0TUxjk5TOPz
	 htZ35Z5Rp13qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqjC4zv0z4xfh;
	Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241027222219.1173-2-thorsten.blum@linux.dev>
References: <20241027222219.1173-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] powerpc: Use str_enabled_disabled() helper function
Message-Id: <173184539744.890800.16412147962073098528.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 27 Oct 2024 23:22:17 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Use str_enabled_disabled() helper function
      https://git.kernel.org/powerpc/c/19e0a70e6c3c1bf800b8ce9eb45864aa9e1e2781

cheers


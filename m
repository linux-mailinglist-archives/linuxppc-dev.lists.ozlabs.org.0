Return-Path: <linuxppc-dev+bounces-14494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C6EC87935
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 01:22:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGKyV6trMz2yrZ;
	Wed, 26 Nov 2025 11:22:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:67c:2050:0:465::102"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764116562;
	cv=none; b=W1/CA31runeRRYWOXRdDNgpFh/VUjR0MOciWgcidT/G5xf+TWfYCrlAXaMkNFEXgoiUhQu0zGyCRtAJx/pTiAZIKq4hNnPFQCvL6DoBWNQy8Lj4d0XDTG3qnQ0gRiriLdqBaJWoB05X5MjIVU7ILlUE7uWFNZ8qTc+Zh7wbKsB9kcUl/JPMaHUeftfdzVJX2JJwKvE6wQVyW2LOdk9bDXE/g17XfCgIvk4XYaJjeDE07kBD7MKdnYLSakEWHqgwCpnyuN+MiwjitiJtjGRFkaDefA5tPT6br6L4+2Ocaupqa/PfEsy+/oci3zju+lT2ijWmuEdMdkoPfoPMDl7QNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764116562; c=relaxed/relaxed;
	bh=vpfrYYt9VH4ZHSXHnX2GiOC1U7mFKdrkL0zGl1+vDMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGI0xOGs5pxnbmlYh5dMsoKyOMLBVYq8t9ZVmIVza5kPED2sUzJ4ONB9C3gI5ZKiKUiY6XvN7gZ1yrK5gEYSZBNMu0RgVh4OPJpNDVt8w7e7fvWOIzSYwMSIFDdQAepK7Pch4A+ghTj+2PF/eHIj2/j8yfa8HoqzEUl71rPhzXlXPmO/T+vNytN6/TxUQDl3akcIqwP/ZqnEbh+2YC4N3lWml36BGAadhiu+iuIPmJMGbdmkdym04kCnP+wrph1pSxdUEgDTIW45c9fhjW7eeMRrZ4lKlb20t3GWGnJxQLj1c4emR1Kj1uuRKa8B4owmL0JcPXWgXi6aMh9pxGfWeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=mC/f8CEs; dkim-atps=neutral; spf=pass (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=mC/f8CEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 368 seconds by postgrey-1.37 at boromir; Wed, 26 Nov 2025 11:22:40 AEDT
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGKyS5J6wz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 11:22:40 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dGKq82bs9z9t1n;
	Wed, 26 Nov 2025 01:16:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764116180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpfrYYt9VH4ZHSXHnX2GiOC1U7mFKdrkL0zGl1+vDMk=;
	b=mC/f8CEs0exMjehgw6nAaEeOlXMtx+WqfBqRr+bObAy3mO6/QhmxFE5qFKWKW06aySKzDe
	d3+uruqIbuLvos3KtE4LW2WnITLzv/KuF3d11+F0Npo26LYI7I02+jSBvhwKhQWKr45qFo
	nTAB7ltcJxa6ECX67hwX9BgcXovM7DevUpgmeWoSsxs+cKhF6SfRNVxz1Kbo2S/adENBl2
	OvBcaVDKmWQ/kzRt/lJ9qjtcElwjuH0/Vsii2ypMdHTtdjKY8v9bkWFP0BObbaC1Fzy52d
	nbH+5gO3IozMXwp6cV/DCK+HCbugEAyJUgko+EVRwfCWtbf8C8OMb2p+qZdPaw==
Message-ID: <7e955a64-2fe6-4b8e-b49e-c3f827029b2b@mailbox.org>
Date: Wed, 26 Nov 2025 01:16:16 +0100
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
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20251123.131330.407910684435629198.rene@exactco.de>
 <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
Content-Language: en-US, de-DE
From: Erhard Furtner <erhard_f@mailbox.org>
In-Reply-To: <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b5caa0122b17562bad9
X-MBO-RS-META: poewz48d1z6n4r6wgh4otp7nj5ig8b7u
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/23/25 15:57, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 23/11/2025 à 13:13, René Rebe a écrit :
>> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
>> save/restore symbols, that the linker generates on demand into the
>> .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
>> too. They are needed for the amdgpu in-kernel floating point support.
> 
> Would have been interested to know with which version of GCC the problem 
> started.

I can reproduce the modpost errors on GCC 15.2 and GCC 11.5.

Same kernel .config builds ok with CLANG 20.1.8 however.

> By the way you seem to fix the problem for modules, but does it also 
> work when amdgpu is in kernel ? I would have expected a need to add 
> functions in arch/powerpc/lib/crtsavres.S as well, just like following 
> commits:

If I build amdgpu statically into the kernel I don't get the modpost 
errors, the build finishes successfully. Only building amdgpu as module 
leads to these errors Rene reported.

Regards,
Erhard


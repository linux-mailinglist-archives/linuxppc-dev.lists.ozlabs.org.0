Return-Path: <linuxppc-dev+bounces-2532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1C9AD911
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 03:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYnfL6DD6z2yQj;
	Thu, 24 Oct 2024 12:00:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729731658;
	cv=none; b=FOTBiC9PGd1UMj8aIHHkdjiD3Ad6+SnMXI91jfrHkvQ4YRqcJiCn0YJciXSDs8mFoSD7YL7sdUwlmw/1neG7wMJyZPfGxpep5iieo38cDpPw07iWq5hRYRO940PFzTkaGlACjP5UMKift/z/65OvjuKMJC3apxcPngkJYMwV4SHkkFMnnSH7XUVXtzRGSKNR9IftLsquti11RKYgPtlMJNEx/Qx0zL60N/tAi8yASCRok1EynHqkkhjk7G5pKvWMQLOwOPqZY4OUyEB0r0xzo4MK3MwraHHVo8yfG4w+dHZGkvAZPN5KBDoSmjHSWPqA2RkS0Se5rHqvqZUGu7KfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729731658; c=relaxed/relaxed;
	bh=QPP8lMdImGnpze+KLmb8tb9ZW/JrJc8aKQY7EcZ6aeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KydsPyDoufYmpSlNsLCC+yBxxX76qllJOQT9VkmWYhnZ0rSA1Hdoh3H5tVjdSpH4Eg/91E7+Ml7NIbpl6STXWSmSwSmSDN2I5UT1aMfNSmNTc11ENCqxX6/tRps1Bzr9awSMJpFUMEckYZ2knarnL7aQxUrYhwcLEq3d/kSaYuqunIdq2EfvMKgvzFOrV8M2WHPUg9Dda5EvzwE+2alrjFQcMlMd4dsUYmCWpogtRqhazKMJYMkAuObkPykzl2OmvAzkIsbfK5i+q7ruQHBIgXm5UyLx9nVGVaCBeM4K3b7qyAQ3eHSf0BuoQz/Y4h6DSNR7m2I/Qb2K3Hh+KG7lIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GntUxvsy; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GntUxvsy;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYnfJ4KSrz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 12:00:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729731655;
	bh=QPP8lMdImGnpze+KLmb8tb9ZW/JrJc8aKQY7EcZ6aeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GntUxvsyQdRW3VfYIphe+gObilkKDKMv+qFKK0StjmO1Vedbrka55JqmXjpfvSWyz
	 tVoOQDpsnXzgUb1mK5TGlCys0cQVFIF67F2pRlBOEqMLt905bgcjTf5cRCScA+4KNH
	 mWf1yst7JW9o2TPNw8cComNZtbqNiNXkAylmC2vbM3wvpKj4Ks3vbNY8lmBZyVxiCh
	 t76Ba8ozScVi0gJe2sE1NbNurDcBf7RGHfZND0OIeZKpDunAAuELp96NacsCKd3roa
	 bKROttIuAVAerBOHOsjskk4GFEvDsfrpGd82Y9J4n8ySP77tVICjBJt5l7Ovla9/QP
	 mysekkA0fVpYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYnfG3qnsz4w2N;
	Thu, 24 Oct 2024 12:00:54 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org,
 sshegde@linux.ibm.com, mchauras@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: symbol lookup length fixed
In-Reply-To: <20241023212225.1306609-2-mchauras@linux.ibm.com>
References: <20241023212225.1306609-2-mchauras@linux.ibm.com>
Date: Thu, 24 Oct 2024 12:00:53 +1100
Message-ID: <878que2u2i.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
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

Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:
> Currently xmon cannot lookup symbol beyond 64 characters in some cases.

Can you mention which commands? It looks like it's "ls" and "lp".

> Fix this by using KSYM_NAME_LEN instead of fixed 64 characters.
>
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>  arch/powerpc/xmon/xmon.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index e6cddbb2305f..22b8b5cc4df0 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -3662,7 +3662,7 @@ symbol_lookup(void)
>  	int type = inchar();
>  	unsigned long addr, cpu;
>  	void __percpu *ptr = NULL;
> -	static char tmp[64];
> +	static char tmp[KSYM_NAME_LEN];
  
I think you could use the existing tmpstr buffer.

It is global so it's a little hard to track down all the users, but I
think it's only used briefly in get_function_bounds(),
xmon_print_symbol() and scanhex(). ie. none of the uses persist across
function calls.

We don't want to have two 512 byte static arrays lying around if we can
get by with one.

cheers

>  	switch (type) {
>  	case 'a':
> @@ -3671,7 +3671,7 @@ symbol_lookup(void)
>  		termch = 0;
>  		break;
>  	case 's':
> -		getstring(tmp, 64);
> +		getstring(tmp, KSYM_NAME_LEN);
>  		if (setjmp(bus_error_jmp) == 0) {
>  			catch_memory_errors = 1;
>  			sync();
> @@ -3686,7 +3686,7 @@ symbol_lookup(void)
>  		termch = 0;
>  		break;
>  	case 'p':
> -		getstring(tmp, 64);
> +		getstring(tmp, KSYM_NAME_LEN);
>  		if (setjmp(bus_error_jmp) == 0) {
>  			catch_memory_errors = 1;
>  			sync();
> -- 
> 2.47.0


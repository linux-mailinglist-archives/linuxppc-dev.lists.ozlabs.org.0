Return-Path: <linuxppc-dev+bounces-10552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E3B19ACF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 06:44:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwP9L3pjFz3069;
	Mon,  4 Aug 2025 14:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c206:3008:6895::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754282678;
	cv=none; b=WU4pJwHgmwqA37FxGaRu0qTuwN3cvNAQzpcZ4mmQ6J6Z2sdEaTMAZEqk2NwnxAALFGrCmYO8c5i3Kr4rPHnyLcE+R86pXz38LNf58Dh1u5BGwZGFK2TbCdZJLSJV80UikrO/416ffdfp/WqoIMoZJyi8q+QgZH33DfnS62yFfJKB+7x35AlC3dI5z1NXVHdzqYxA0IiGIx154vHCuI0JRgz7+ZBFCssaOrBf1XtHfr/axp+CC6fFolGl0tuCKi7r/7yZxgg9VE52AlJaphwuTN0FeNCt6R3/mIhF1RXJLxQI8I5yAIhdW4oQ7X/CmRjbAchbRa8z2L6SO1T3lt6zQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754282678; c=relaxed/relaxed;
	bh=NFXyhfUs5Te3lCJdt/qxRZhkKJ703L35yMDkdigijmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCDOv7K538+PwNKfS7aH0jWXfkARSuM9rsCzdWnBwOSxz8pMkbP91E3aAoa59Zx4FINimI860+cJALVPg0JLtx0w5nc2+07C4PDQXUx5WKhA5F/63svYeSOyR182TT5xHzpFse4gBUnJ5OS0S3XYp2XrniGt/ipFkNl7SBOgJhIiISGsFTcOxrWFcmzOl/11hxF5urLSl+HO3JRftRINKaeOqeijLytMJcuTTK+ghJOGTjzOpCjzN40C/1Z4WG+uk/wL+oNUSN9iOHqOFAgFHC45HvprnSmTJeYkNMVTw/osZ81aGy1/9rdA0J4CGMru8rCebBpfilfkMd38jeS9WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
Received: from psionic.psi5.com (psionic.psi5.com [IPv6:2a02:c206:3008:6895::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwP9K3DNsz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 14:44:37 +1000 (AEST)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 8D25B3F108;
	Mon,  4 Aug 2025 06:44:24 +0200 (CEST)
Message-ID: <3de7cc4d-cb88-4107-9265-066cbedd4561@hogyros.de>
Date: Mon, 4 Aug 2025 13:44:21 +0900
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
Subject: Re: [PATCH 4/7] crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-5-ebiggers@kernel.org>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250803204433.75703-5-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/4/25 05:44, Eric Biggers wrote:

> Taken together, it's clear that it's time to retire these additional MD5
> implementations, and focus maintenance on the MD5 generic C code.

[...]

> -	ldd	[%o1 + 0x00], %f8
> -	ldd	[%o1 + 0x08], %f10
> -	ldd	[%o1 + 0x10], %f12
> -	ldd	[%o1 + 0x18], %f14
> -	ldd	[%o1 + 0x20], %f16
> -	ldd	[%o1 + 0x28], %f18
> -	ldd	[%o1 + 0x30], %f20
> -	ldd	[%o1 + 0x38], %f22
> -
> -	MD5

This is a literal CPU instruction that ingests sixteen registers (f8 to 
f23) and updates the hash state in f0 to f3.

I can see the point of removing hand-optimized assembler code when a 
compiler can generate something that runs just as well from generic 
code, but this here is using CPU extensions that were made for this 
specific purpose.

This is exactly the kind of thing you would point to as an argument why 
asynchronous hardware offload support is unnecessary.

    Simon


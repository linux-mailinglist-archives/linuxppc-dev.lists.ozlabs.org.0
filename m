Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4E3AFBA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 06:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Cf13rKnz303j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 14:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hfgyHKDG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hfgyHKDG; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8CdY3kw8z2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 14:11:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8CdW5jQwz9sf9;
 Tue, 22 Jun 2021 14:11:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624335103;
 bh=w4jHRr1SfCtm9a1lrT4EpKjhYNuImkB/Yap5zTQk0o8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=hfgyHKDGJcGmhemc9L8V8OjHY8Z1Tf3LpRQHoPZ/bP/ZcjSgJPg08wcEuJ7aJq5h2
 HakdfrYfDzsbWRHp725pk1C1tZGWirIfQVxudM5wA4ISUINNc8x+vWTggO+1lpmIh2
 btCEy9uvssPeOlurYak1Fi4X/L4i1n3NQdnY4C9ODzzAzhPXsw6/WqKeZLIQipw3kC
 xH/+1ORgE3BmItz+/h0gAUO5Tlijk4AtVWLargdWhG/ATqbdCnltpkLHy0ZqPMcJ0G
 DrxoVd6xNT3DWCwBsva8amdkZVzxb73O11SDJ8L4j0ytBZrqcJhbaaO5iWuz9XKgje
 ftPHIc2w84Qjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/prom_init: Convert prom_strcpy() into
 prom_strscpy_pad()
In-Reply-To: <87lf73iddy.fsf@dja-thinkpad.axtens.net>
References: <20210621064938.2021419-1-mpe@ellerman.id.au>
 <87lf73iddy.fsf@dja-thinkpad.axtens.net>
Date: Tue, 22 Jun 2021 14:11:39 +1000
Message-ID: <87bl7y35dw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Hi
>
>> -static char __init *prom_strcpy(char *dest, const char *src)
>> +static ssize_t __init prom_strscpy_pad(char *dest, const char *src, size_t n)
>>  {
>> -	char *tmp = dest;
>> +	ssize_t rc;
>> +	size_t i;
>>  
>> -	while ((*dest++ = *src++) != '\0')
>> -		/* nothing */;
>> -	return tmp;
>> +	if (n == 0 || n > INT_MAX)
>> +		return -E2BIG;
>> +
>> +	// Copy up to n bytes
>> +	for (i = 0; i < n && src[i] != '\0'; i++)
>> +		dest[i] = src[i];
>> +
>> +	rc = i;
>> +
>> +	// If we copied all n then we have run out of space for the nul
>> +	if (rc == n) {
>> +		// Rewind by one character to ensure nul termination
>> +		i--;
>> +		rc = -E2BIG;
>> +	}
>> +
>> +	for (; i < n; i++)
>> +		dest[i] = '\0';
>> +
>> +	return rc;
>>  }
>>  
>
> This implementation seems good to me.
>
> I copied it into a new C file and added the following:
>
> int main() {
> 	char longstr[255]="abcdefghijklmnopqrstuvwxyz";
> 	char shortstr[5];
> 	assert(prom_strscpy_pad(longstr, "", 0) == -E2BIG);
> 	assert(prom_strscpy_pad(longstr, "hello", 255) == 5);
> 	assert(prom_strscpy_pad(shortstr, "hello", 5) == -E2BIG);
> 	assert(memcmp(shortstr, "hell", 5) == 0);
> 	assert(memcmp(longstr, "hello\0\0\0\0\0\0\0\0\0", 6) == 0);
> 	return 0;
> }
>
> All the assertions pass. I believe this covers all the conditions from
> the strscpy_pad docstring.
>
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Thanks.

I'll also drop the explicit nul termination in patch 2, which is a
leftover from when I was using strncpy().

cheers

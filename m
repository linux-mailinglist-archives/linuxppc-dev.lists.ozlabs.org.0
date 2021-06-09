Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8E3A0CF9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 09:00:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0J0j5yRNz3bwH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 17:00:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WqmS2PWp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WqmS2PWp; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0J09107Hz2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 17:00:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0J050vVJz9sCD;
 Wed,  9 Jun 2021 17:00:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623222021;
 bh=NcW9k3mEhFcLnpfdBhTiKVFjQVnBYmdtXkbmWJJSRKs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WqmS2PWpYR2KIotfUJDQ4mruJq2/5DeAxRPLE6DXdBW4XXpUeWZ2DWZ8DZ5M4NjCU
 NaIiQe6BlYswZEV0+OqlOJ90a5y/XJRhBL4RW/Rm3nyh6Vpu3RC8H1esTNRRku3mO7
 BQec9spRS3vgVLqYQLD5bDdalqxOrvorMgubyn+63J/XPifIWWrP4rFmPJXanDCWZm
 8eHGMRD2FMg8q77y7UO62JX6eMFzkAh3DkScoqsMgyDrDABDIqOjKNSAlzlr2+anVm
 7RZWRnoOsTaw3wbf/LtuuVx3pY1IEWmW/YJ1tFB8i/c3PUvT6cN+T07buw115w399Y
 GbXJw9pqAlIsA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] powerpc/prom_init: Move custom isspace() to its
 own namespace
In-Reply-To: <YL5Tm7jZaaQ0POH5@smile.fi.intel.com>
References: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
 <YL5Tm7jZaaQ0POH5@smile.fi.intel.com>
Date: Wed, 09 Jun 2021 17:00:16 +1000
Message-ID: <87o8cfed4v.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> On Mon, May 10, 2021 at 05:49:25PM +0300, Andy Shevchenko wrote:
>> If by some reason any of the headers will include ctype.h
>> we will have a name collision. Avoid this by moving isspace()
>> to the dedicate namespace.
>> 
>> First appearance of the code is in the commit cf68787b68a2
>> ("powerpc/prom_init: Evaluate mem kernel parameter for early allocation").
>
> Any comments on this?

Looks fine. Thanks.

I just missed it because it came in a bit early, I tend not to pick
things up until rc2.

I tweaked the formatting of prom_isxdigit() slightly now that we allow
100 column lines.

Have put it in my next-test now.

cheers

>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>> index 41ed7e33d897..6845cbbc0cd4 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -701,13 +701,13 @@ static int __init prom_setprop(phandle node, const char *nodename,
>>  }
>>  
>>  /* We can't use the standard versions because of relocation headaches. */
>> -#define isxdigit(c)	(('0' <= (c) && (c) <= '9') \
>> -			 || ('a' <= (c) && (c) <= 'f') \
>> -			 || ('A' <= (c) && (c) <= 'F'))
>> +#define prom_isxdigit(c)	(('0' <= (c) && (c) <= '9') \
>> +				 || ('a' <= (c) && (c) <= 'f') \
>> +				 || ('A' <= (c) && (c) <= 'F'))
>>  
>> -#define isdigit(c)	('0' <= (c) && (c) <= '9')
>> -#define islower(c)	('a' <= (c) && (c) <= 'z')
>> -#define toupper(c)	(islower(c) ? ((c) - 'a' + 'A') : (c))
>> +#define prom_isdigit(c)		('0' <= (c) && (c) <= '9')
>> +#define prom_islower(c)		('a' <= (c) && (c) <= 'z')
>> +#define prom_toupper(c)		(prom_islower(c) ? ((c) - 'a' + 'A') : (c))
>>  
>>  static unsigned long prom_strtoul(const char *cp, const char **endp)
>>  {
>> @@ -716,14 +716,14 @@ static unsigned long prom_strtoul(const char *cp, const char **endp)
>>  	if (*cp == '0') {
>>  		base = 8;
>>  		cp++;
>> -		if (toupper(*cp) == 'X') {
>> +		if (prom_toupper(*cp) == 'X') {
>>  			cp++;
>>  			base = 16;
>>  		}
>>  	}
>>  
>> -	while (isxdigit(*cp) &&
>> -	       (value = isdigit(*cp) ? *cp - '0' : toupper(*cp) - 'A' + 10) < base) {
>> +	while (prom_isxdigit(*cp) &&
>> +	       (value = prom_isdigit(*cp) ? *cp - '0' : prom_toupper(*cp) - 'A' + 10) < base) {
>>  		result = result * base + value;
>>  		cp++;
>>  	}
>> -- 
>> 2.30.2
>> 
>
> -- 
> With Best Regards,
> Andy Shevchenko

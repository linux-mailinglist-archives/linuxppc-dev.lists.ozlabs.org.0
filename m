Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B61873AE980
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 14:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7qMP3gB9z306c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 22:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=jnA8Sw7H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=jnA8Sw7H; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7qLx2S2wz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 22:57:43 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so8159253pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=0bWYaf9cBnr1uiIPV06eAL+29RQifYViiJjHT5s1Pwc=;
 b=jnA8Sw7Hmu/ycr+ur2WsChTHflbpZ0CAh/oLWfQXMZML0ip5WpK+NInOPi+1STL8xo
 FshiJKCCGrul7D+ClHn7rmqlJgKIWOXOy6lcaBB6jdnpDNogYrnNbMOf/xtVmKsfSBEP
 LqRl7LeoPc20r8XDdNgxv116FSkx4ClehV86Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0bWYaf9cBnr1uiIPV06eAL+29RQifYViiJjHT5s1Pwc=;
 b=aYES7phtcsIkp15dLIncS9M6L3/luinptj1GdC8VxFcpjYMPGoB/Kq2WVO0mevbbeX
 DR1t/ntxYjMIAD/5v457ibRZhAk9bgOVQvO46wzeJYx3XVRFsmU0uQpiRVGoafcQXJKW
 RfdxU5ZJE6zgPzh8JBd41QCkPkzsl4zjWQXbD9FkIC4DXThsQyyQCqyJ1Xm/RSQpvcoj
 mg+nW3NLk/5Z3yT5Xe2KSEWNMG5SyoXeCnHMFHzypfxlKQLweQpyOSwYOOFLnd/2NBfC
 9iKM54GB/FkzFlAOwnLy6G4LqE8baacsBFORu94HqtIbxLM921CNC0SMb1mM/8B+cAX8
 +iKw==
X-Gm-Message-State: AOAM531vQj6Dsz5tqOZFLgOTsZrx7dBYLap/kk303DeO+dk8aaiHCXBW
 FA1wkYlDoViK3ag0diyjMU3LIg==
X-Google-Smtp-Source: ABdhPJzEpFLQxUJnVr6dTKFPsK1zjEcAHnYR1UQn/5WoEGg319Jkqn2WPS/iMh9CSBeratugax+WCg==
X-Received: by 2002:a17:902:b7c9:b029:122:ee2d:25f1 with SMTP id
 v9-20020a170902b7c9b0290122ee2d25f1mr10833535plz.14.1624280258192; 
 Mon, 21 Jun 2021 05:57:38 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id u10sm15377790pfh.123.2021.06.21.05.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 05:57:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/prom_init: Convert prom_strcpy() into
 prom_strscpy_pad()
In-Reply-To: <20210621064938.2021419-1-mpe@ellerman.id.au>
References: <20210621064938.2021419-1-mpe@ellerman.id.au>
Date: Mon, 21 Jun 2021 22:57:29 +1000
Message-ID: <87lf73iddy.fsf@dja-thinkpad.axtens.net>
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

Hi

> -static char __init *prom_strcpy(char *dest, const char *src)
> +static ssize_t __init prom_strscpy_pad(char *dest, const char *src, size_t n)
>  {
> -	char *tmp = dest;
> +	ssize_t rc;
> +	size_t i;
>  
> -	while ((*dest++ = *src++) != '\0')
> -		/* nothing */;
> -	return tmp;
> +	if (n == 0 || n > INT_MAX)
> +		return -E2BIG;
> +
> +	// Copy up to n bytes
> +	for (i = 0; i < n && src[i] != '\0'; i++)
> +		dest[i] = src[i];
> +
> +	rc = i;
> +
> +	// If we copied all n then we have run out of space for the nul
> +	if (rc == n) {
> +		// Rewind by one character to ensure nul termination
> +		i--;
> +		rc = -E2BIG;
> +	}
> +
> +	for (; i < n; i++)
> +		dest[i] = '\0';
> +
> +	return rc;
>  }
>  

This implementation seems good to me.

I copied it into a new C file and added the following:

int main() {
	char longstr[255]="abcdefghijklmnopqrstuvwxyz";
	char shortstr[5];
	assert(prom_strscpy_pad(longstr, "", 0) == -E2BIG);
	assert(prom_strscpy_pad(longstr, "hello", 255) == 5);
	assert(prom_strscpy_pad(shortstr, "hello", 5) == -E2BIG);
	assert(memcmp(shortstr, "hell", 5) == 0);
	assert(memcmp(longstr, "hello\0\0\0\0\0\0\0\0\0", 6) == 0);
	return 0;
}

All the assertions pass. I believe this covers all the conditions from
the strscpy_pad docstring.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>  static int __init prom_strncmp(const char *cs, const char *ct, size_t count)
> @@ -2701,7 +2719,7 @@ static void __init flatten_device_tree(void)
>  
>  	/* Add "phandle" in there, we'll need it */
>  	namep = make_room(&mem_start, &mem_end, 16, 1);
> -	prom_strcpy(namep, "phandle");
> +	prom_strscpy_pad(namep, "phandle", sizeof("phandle"));
>  	mem_start = (unsigned long)namep + prom_strlen(namep) + 1;
>  
>  	/* Build string array */
> -- 
> 2.25.1

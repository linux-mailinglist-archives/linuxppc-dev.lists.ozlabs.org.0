Return-Path: <linuxppc-dev+bounces-14661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1824BCA95DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 22:16:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNPMV2rLfz2xKh;
	Sat, 06 Dec 2025 08:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764969414;
	cv=none; b=DU4gcEi8M51QoA1WQEwZly/hFIaRvrvpKRLKaWpts4xSaHDIW7so5EhYYTpFuHNWtWz5jdvr9XYoheugTmxPQVb076Cdclfpt8wXXvr1zlCv2Ne4UN3Ruu0haKob1dZNk+vaRJ7YFXmV0CuzWhe6epROKq63BrOqDA7w6sHBbGYcHpzYdHcxN+H1OJ6QNPsnieSakr9/nJ3sk2DeUbDVFY9SQ8D0gZeZQXSwG36FYW3FNoMUYRi7k75gkMovGs/3lT2AIoOR/LL6SgMjqGWg7f2I029qIvHSVZmUh70rEmfJbHEHzR212wzAFaZPix6BxfKX13VsQjnhhetqJfTu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764969414; c=relaxed/relaxed;
	bh=6Nxf+UbxVML8lqm9dUwCL46TJXN3lpM/MynhhK+ht9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQPc2OWhH6XYopJYHmDYJuaRl/GEhOW0AZfV5f5Cl3JcTR+IFUyFq6Ruhmw2HnU3bMg/qowPHmOAMjI9EjWPxFOacPfzBAPrh8/dE4kmoFjsP41/brMUbRdGDfI1/WpifBE2NTa8V5Bqj6f7/gvlo/8Qbd06apzbtre7zbtYZX5iX91h0a/xM1fDpupGDRYgqHjAtGOC9AQ4/yDWww+AD8JMOhC1IJLZlMO5tjFVQ5mvMie5erjq2v5rGvIk9pvpEsfjvLQxuxq1xnUB2OZwB3Rd9i/3ehwh9Me+AyfZMGkrUIA4bQCKE7ZNcwRHfIbbhHgZ5xDJfZFcVfCRFFnMgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EFQ3+zc2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EFQ3+zc2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNPMS0l8zz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 08:16:50 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477563e28a3so19255635e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 13:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764969405; x=1765574205; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Nxf+UbxVML8lqm9dUwCL46TJXN3lpM/MynhhK+ht9M=;
        b=EFQ3+zc2BIBh/hjEUIE6Jaev0ZY9xKg9O5Jk4cUQj4BjmcOyD3tOsoNCN8WrXpLU9q
         8rk8BLYBWSelgd7MiDpvobnCv/hzL7rqhBpOYqvWGpE0W/RPR06Op+8M/DvvUBppGQQR
         l+3KM7K914BGWiVTlb7xHJjyDfhaVRSeHanRwmveLFMcr/dADXKicywauI/kIxlBpBwZ
         cPvHV4ZnDPzTgHhC2twfbeQUxY/ROAGphRhDxqxwt6e4/LW6NjhkwbS16NBNQ4pxU6C1
         U/mHW9lLo72cOfaypmFdVKh3WJpNr0sTcSmk+FeB7l18Goy6yy9oz9doV7vJCMB48CbW
         t2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764969405; x=1765574205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Nxf+UbxVML8lqm9dUwCL46TJXN3lpM/MynhhK+ht9M=;
        b=HJZ8A2Z0e99tcHbsk5lubrnPxblaIw/YJHbtRIuXzScHopHdG97/V5rjQM88kGl4bo
         fBqvnk3ksPddNb7teulW624ns4VWPUXWz+CQ8jCVz7N/1CRh9SXFPqS6AxUAoh9pw5Vd
         kKMRcKpKWDi1kb47uQ5B+26WV+o2YA9aRj6OLqxZEyB7FpxXzQap7cwqb2c07/L6UqmP
         jP7eIQvmoBhURpz98XIMtWuPeB8krEyQVnpnhdoE3VyxTCmnCw+Jy9XI15VLaB22/1Uq
         m1dlS5PpIU79rpPMEMH3L75nzyNP8G8hjcixzQnuXSdEtEj//KLLAGQyJorCJm6U8ugO
         dMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpnXP51ID1evD9dOnYpy/gkp1A+myF90OIEwnCJ5XdaGkrkYX1s1iB0isBnK55eO12GAqhfhYWkXICacY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOwbHKRXhA19o1gMIw/3ChSMMB61Ugs5ZkO2zXd3yCRsNRoEe3
	di0Kra6h8rsSElSiMy3dhpN3ypsDFmkie9ZXm5pVyufE85wTRZGx3/D8
X-Gm-Gg: ASbGnct74dixGl3enwcHbdt4Fd9oKv4KtCrbc922+vhxGE4X8jXQh5QScfMLosbJAsq
	yqydasm8ZyA0EKzBHMGiRTtvn7u+jPSCDYBrpTflXsQsIbjzmRS8zd1APsrai+4hISgNz2as4Db
	8mr8xQ5mYmPxqgNKzxRy119Hvg57EX2LGBLFK6gtPf1Agj5lFOz+OpStHeh9TDBZe67eCgP5S5A
	8iBgs6U/BZTo9ILXN+vdzWuJUuBCigiR0GoHOb/bvLVBlxUVIZQpsTkIWuC30dNImWRKmWnbFLa
	hEy9Pv8wGIg9FIoM5T+fKe8QbuWpzHf36HcmZyFaDa6JkUMfT4KKXHf3xikKVmb7BfeWFPZegxN
	DBbj4obx/qgcYpL55L9zBCYFeqm+HoLRoizjHiXY2PC0lQnH0r6yyWnO+McbLiU92hL7v+y2vPT
	D6QjM1IwKeuq+3kthcz+er/erHwLlfvrwQKWIwlg0JevUmpZmAql9agpw3P95gE1IL3oqtWGa4r
	B6wZMyegAc8XArxI6TPti2uR+sk61K/9A1XVT8oz8ewocJDX6m2Ow==
X-Google-Smtp-Source: AGHT+IFZChau8OMeC1OLCqeCPNebVKaNk3vumCCd23Bu0iJLrPIjbfoD1uBKQKJb6ckkVpzXZJNNzw==
X-Received: by 2002:a05:600c:5306:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47939e22a9emr7139775e9.11.1764969405296;
        Fri, 05 Dec 2025 13:16:45 -0800 (PST)
Received: from ?IPV6:2003:ea:8f47:b600:41b3:37ed:a502:9002? (p200300ea8f47b60041b337eda5029002.dip0.t-ipconnect.de. [2003:ea:8f47:b600:41b3:37ed:a502:9002])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222506sm11795875f8f.28.2025.12.05.13.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 13:16:44 -0800 (PST)
Message-ID: <10441fbd-8022-402e-8551-e0f8ec0449f0@gmail.com>
Date: Fri, 5 Dec 2025 22:16:42 +0100
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
Subject: Re: [PATCH RFC] powerpc: switch two fixed phy links to full duplex
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <64533952-1299-4ae2-860d-b34b97a24d98@gmail.com>
 <5d302153-c7f6-48dc-95cc-0dc4f25045c6@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <5d302153-c7f6-48dc-95cc-0dc4f25045c6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/5/2025 6:50 PM, Andrew Lunn wrote:
> On Fri, Dec 05, 2025 at 06:21:50PM +0100, Heiner Kallweit wrote:
>> These two fixed links are the only ones in-kernel specifying half duplex.
>> If these could be switched to full duplex, then half duplex handling
>> could be removed from phylib fixed phy, phylink, swphy.
>>
>> The SoC MAC's are capable of full duplex, fs_enet MAC driver is as well.
>> Anything that would keep us from switching to full duplex?
> 
> What do we know about the device on the other end of the link? Maybe
> that is what is limiting it to 10Half?
> 
I found no hint that anything is connected to this ethernet port on
the two boards. Hard to find any information because the boards are
>15yrs old. Seems this are dummy entries, just to let fs_enet load.

> 	Andrew

Heiner


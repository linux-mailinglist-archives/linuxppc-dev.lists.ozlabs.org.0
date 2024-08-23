Return-Path: <linuxppc-dev+bounces-453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A949795CBD5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 13:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqzBH1v7Dz2ytp;
	Fri, 23 Aug 2024 21:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724414343;
	cv=none; b=b6fu7n+ZvZ1IpTqxjgHpPQX3txJEvfL9WD9opzMYcI+zGGlNoqBqRPjdWTXjXyH+MEcJVlR4m0knhybSidE8pY/rMbbA7etWOYegQLYDhDuNjktehWCc3HrlFOXwUqZ1q9jaczaU8D6KC1ItOSRaz3+2gC7l9XDBw8+e1ZS35/i6F1ZoA+IYQQ+hQibShNDeCwCNkF7SVDjgDPVwFz4ypTTQiZBhjT9y0zF2NoEcrgaAwVecF/p+SlUQhpsBkATF2oIhaApCljGu42L20lD3OMVaKHtMrUB18cbbxltFClYU7fzmNPdwRlDvGdgXJu2d5fBfjoB40Bq6Wkms5ziuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724414343; c=relaxed/relaxed;
	bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=RxKrNK3pXJmeZRS0LRg6mqCd/sngHCP6b+JBPmDE0uMpenaGb3aDTI/AY7o7nsJ9EcEYgKPpDvwAxZmbusDuIVNyYL0Zt3wfGbBYnodikQG3uUl7YgE7aEJH42UhGEHFVM3jVVuGY8vIIkYy/ZpukVaDK8jRHZKjHumzu3G5D68ugPHYO2L1R5ey9PfC++q+IBkYFIyPOBA95Bu/rSSIR1QRnDyuryvhdhOiHGYWCvPGEgyAQEvk8cBfZHM6ck8SBtWj2KuGLd+sktQndBUOJvJhJ9o+Fv5/S4HxHDQLz2bd2xgb3PJGwWaPsYD38WDKfcGQpHF4c2f9jcoBdCKqUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.50; helo=mail-vs1-f50.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqzBG2yKNz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 21:59:01 +1000 (AEST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-498e40756baso669404137.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 04:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414338; x=1725019138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOuGLLp2dNTeHW8uT+dUzwnOGJ7gbf7VhrhQyr4Xe6I=;
        b=R5jnjaSpnt6ERACy266+1AbIuUASo5wxeSEeui3jLSmH0AtQ0M/Kr69r+9Q13lbFfm
         MX0ahvS2c9oUR6eNKRLS+mA3eggv0Z9YUJlvWMHNPPQLw0jyXcxONGHE0yz1efCsVpTv
         zMHASbEEIeHJY4ALIN5unhMr7ClV9nN0MDNUEDhVwEFnEvrtyxZ5olbMwZL8IWAKkI2W
         kg9qoAaggqyRQF2LlyG6EV6/LfNhni1hCGi1eduddSw1EeOTgXfHCWIR475J8c3kekyu
         DSHxNe4UnwmsdIDvz43QAuw0CO2WjaqfGV/D9l27emEcbvuO9AcWKMXU8eyRgyJRpvyY
         /8EA==
X-Forwarded-Encrypted: i=1; AJvYcCV0er+CAFD+gxWhrxrScoySVQeGCA8lDn440p7INXmVzWaGd2ttJfxP9QFHF2gsh/Tef18+paHyr4HsSkc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4Nze/jD3DbZ6gcJVqqzU0lQ7jimwOvWrOz4yY/tNsGTkDXTdP
	4T0aXoHZjXsSeTEp/ZPTkBHL/2NQ/RZvytUDSnQogASNy/ZZ5BPp
X-Google-Smtp-Source: AGHT+IGTnsj+vzaB6DUYSRe4ILJB8y8mubsJfwnJ5TjC90dt1P9FzBdqUNam7n18s/aSRrNdBhBpzA==
X-Received: by 2002:a05:6102:26ca:b0:48f:40c1:3cd0 with SMTP id ada2fe7eead31-498f4633bafmr2258426137.12.1724414338017;
        Fri, 23 Aug 2024 04:58:58 -0700 (PDT)
Received: from [192.168.2.219] ([65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d6db58sm17621556d6.65.2024.08.23.04.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 04:58:57 -0700 (PDT)
Message-ID: <dc4a1941-6671-4e89-90c2-3a1c19fd3e1c@vasilevsky.ca>
Date: Fri, 23 Aug 2024 07:58:44 -0400
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
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
 <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
 <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <c74e24213fd98b252a2a1ff02a107005e50f4f7b.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-23 03:16, John Paul Adrian Glaubitz wrote:
> It should be disabled on m68k and sh by default as well.

Sure, I can change that. What's the reasoning, so I can explain in my commit message?

-Dave


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 495C8254B60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 19:01:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcpsT1MYzzDqjV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 03:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kaSyKh7H; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcpps6gQDzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 02:58:59 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id r19so2913875qvw.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=4lP1m2wCcvTQNwrrvMb+fUlGbZ8odWO50SoVe80zCxo=;
 b=kaSyKh7HI3u4s0eBdtnJNK0ZUKE6CNMcz+NZdiygEczZb899X3Nk/Y6QgofhiDNtz9
 AjV8YF7raIJLEextGFFfITIIjqIvH6s9kQK0CVxQxXxy0EfmVa/YEfxinqX2HWivu5Lj
 gUbULS7BK9n9c9SzSBvy+j4xZWiHZ2/xSDDq9bQy5qb5/UlSxJPQbBmvK8A2BY0sZBi2
 RQGIjkmM+VEhFDPQXBbtdQ7dG8YE4R2xLWyxw7cNKXJEEeuHWFL10o4mOoJ4XU7w1Bjg
 5GYuBWtoBK0gYnrfUv09mQAI9lKl6FPhWfxG4lkUe/H3zgH9FR+vfyNh8suI34rZZYGo
 oKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4lP1m2wCcvTQNwrrvMb+fUlGbZ8odWO50SoVe80zCxo=;
 b=Q5nalC1XIb5l8cNn4Y/loIeKacixs/FGYzz2NvsmoLesEBANJbB9kWXRmlI345GF8G
 3KSNZ8rhA8q3OlhjcvBIaSrtsJWhtoVVPUrEKOknWZH9c3xCZGVbmXXUVYBKDR/cO87P
 8UUx6jEyLPiDsXa2nj/LUTSUBpgSz1ZyGgNhJVcRb2qcQ7Fa1B2nWVM+t0CSM7EticAj
 yPvr12Oe2ZVMA3/bkDOoNZsUAsT5dA3HVSUiu2k+k6U3yr29FjBqMtcldcfrbP2ug1zp
 8wG8rZcLw5zYQp4bMdJcf0AK043ONsgBduRGSJ3onwcTHuM8JLRjumPLR+bu/aOHNx7J
 g2bg==
X-Gm-Message-State: AOAM531w1VSVjp2dYRvKSw4AuK8oylR7L+N8S7h08P1zkqM50GiXJdNZ
 VSuenWoGN/0c2dT4Mm7WdtSmrlrtuwI=
X-Google-Smtp-Source: ABdhPJzX3nUlPhvQfJkPj4YVC3ZQ/pGZthIDM2Mr08cuHyjfc7B0y0K2pF7+ktofBB5ccGMqeaY/kw==
X-Received: by 2002:a0c:ca86:: with SMTP id a6mr19570503qvk.209.1598547537653; 
 Thu, 27 Aug 2020 09:58:57 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id g13sm2119490qki.62.2020.08.27.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 09:58:57 -0700 (PDT)
Message-ID: <c2d2974f7fd46f54c2cf690b48b9ace35257baed.camel@gmail.com>
Subject: Re: [PATCH v1 03/10] powerpc/kernel/iommu: Use largepool as a last
 resort when !largealloc
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Thu, 27 Aug 2020 13:58:51 -0300
In-Reply-To: <75fb1e8b-2506-ffd8-64af-4abfefe03d2f@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-4-leobras.c@gmail.com>
 <75fb1e8b-2506-ffd8-64af-4abfefe03d2f@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-08-22 at 20:09 +1000, Alexey Kardashevskiy wrote:
> > +			goto again;
> > +
> 
> A nit: unnecessary new line.

I was following the pattern used above. There is a newline after every
"goto again" in this 'if'. 

> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thank you!



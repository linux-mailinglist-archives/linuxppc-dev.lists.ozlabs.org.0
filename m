Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B296210C36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 15:30:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xhtH3PVYzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 23:30:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A1rO08Qk; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xhqx2LLwzDqxs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 23:28:12 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id m9so10970314qvx.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=Y/vZ0IaH6Uw3eP/ISe3M+HbULBx3TPd+u4JIT5Z3fII=;
 b=A1rO08QkgPZhsED3RVZ+ZqDVen4OR0gzB2qMM0S8Kku4IJn6vBsKt27YiE4kHW8KFm
 p1KAW+mE+L/3x6XxIJFQJfFntNSqKuY6n+rDDL0P061Q7FuOVf/BRnHYUCr/uVVPHtx6
 vFQWI4Wv5ktyjLp/PCN69/7jC7WDYdaSbd0AFkuYcmiO/iIHHxaiQttsc6v3cczcywhM
 Duze3SKjWqbuT/HdoyFmH5vRByF1YRHXen4RvRzwnmLbn7tR6w73wdZQ8UrPHDZoF/C/
 LKtAQkekuwjXHp6AdqoGNTI09FGVRWq24j8IaK16749iCejHcuArxfqcvUZDqjYDPTl9
 fiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Y/vZ0IaH6Uw3eP/ISe3M+HbULBx3TPd+u4JIT5Z3fII=;
 b=JqV1DoXsoJ5PPC5VjpFcKsdfXfPNogXHy4AELf1vkCQvzeGnl80+Ad7ZDNHryj8rZb
 +lC+KERyCJBQOxRVkrW2+Bdx9K5RixwZUg7LskCceHPeOnCTVrSV4NSgDeyGspxPLAKP
 ch8uHJbYN1GDfePzekP2EFPTD3+9+9pl4K31krbuxO/yPYbVDr/tiPVhudPXUqLA83ED
 Ehk2v4AZct7Ejr7UqaNyWz/HvkX9FZPjndwI846ylQI67vw62tDowNNUJDatfrF7Sm5p
 lAKHuaVxJsOrk9LUhVTXeTkYTVq8IseAQ7rrM4vShsIeAzA9rAGAYP894cGG0bfJXcCe
 0STg==
X-Gm-Message-State: AOAM531IZYDkCfzqcshqgS/UMAfl4XXd0vmEr1TBT0I+LNyl7JGO7U0z
 52aBdXvnqNlW1YgBI9INBkg=
X-Google-Smtp-Source: ABdhPJw3huwWuQG/EdrGuTHYYm3gTieFnFjw1EBMeRiZdWUlp7fgVj5eowMXqInAwJJRpPTtZncaZA==
X-Received: by 2002:a0c:99e1:: with SMTP id y33mr22349026qve.90.1593610089419; 
 Wed, 01 Jul 2020 06:28:09 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id i8sm5333510qtr.90.2020.07.01.06.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:28:08 -0700 (PDT)
Message-ID: <01443a2f1d58a595ddff03fd14fd56f4c26171bf.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] powerpc/pseries/iommu: Create defines for
 operations in ibm,ddw-applicable
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 10:28:03 -0300
In-Reply-To: <b0caaaa0-14c9-51de-bb92-5be8ccaa418d@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-2-leobras.c@gmail.com>
 <b0caaaa0-14c9-51de-bb92-5be8ccaa418d@ozlabs.ru>
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

On Wed, 2020-07-01 at 18:16 +1000, Alexey Kardashevskiy wrote:
> 
> On 24/06/2020 16:24, Leonardo Bras wrote:
> > Create defines to help handling ibm,ddw-applicable values, avoiding
> > confusion about the index of given operations.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 40 +++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 6d47b4a3ce39..68d2aa9c71a8 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -39,6 +39,11 @@
> >  
> >  #include "pseries.h"
> >  
> > +#define DDW_QUERY_PE_DMA_WIN	0
> > +#define DDW_CREATE_PE_DMA_WIN	1
> > +#define DDW_REMOVE_PE_DMA_WIN	2
> > +#define DDW_APPLICABLE_SIZE	3
> 
> #define DDW_APPLICABLE_SIZE  (DDW_REMOVE_PE_DMA_WIN + 1)
> 
> thanks,

Thanks for the feedback!
About this (and patch #2), would it be better to use enum ?
enum {
	DDW_QUERY_PE_DMA_WIN,
	DDW_CREATE_PE_DMA_WIN,
	DDW_REMOVE_PE_DMA_WIN,

	DDW_APPLICABLE_SIZE
}
IMO, it looks better than all the defines before.

What do you think?

Best regards,


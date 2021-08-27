Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D53F9E59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 19:54:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx6mD20R0z304S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 03:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mbHJscYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mbHJscYr; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx6lV4M84z2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 03:53:39 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id z7so441374qvi.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Z/pvACIwYDrhsFAHjFo4egknO444SCb0xOTzLp4O58U=;
 b=mbHJscYr7Tjgrd2ruQiWjuPvHFjRq2vgB0nivh5McxWX2Waf8TcBwcU042EoYUQ5Xg
 FjE8pJu6MkdOgHIOwfVnsfii9Ft+LXmkse5dMtxVW+yBm5GquPJTOei+kkTBqhBVs3h0
 L56GG8WFpMayYXvj/ThCYp+4D0lwt2TyIeUdeG3FyxZooraQL4um8+DK3K6INtZhss1k
 uDKonUGGsrr6ba4YShpHYC4XFJws3bRf6+WQCEVEPgBzEfgzR6Tn3VrJRZ8sb8mY/+QY
 1CUjOYwqrqV1lcQ+is4XqAYfs+uAhKAvN8Z142H3XOujxaNjBbPmR3RrUAiltcGYFIP/
 Ep+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Z/pvACIwYDrhsFAHjFo4egknO444SCb0xOTzLp4O58U=;
 b=h/oSqIqEg2gzbfghlKfAG48C0gbOCOTsRcq3MxpUwc0fFAAyh9sWAgnUFidmpiFkFf
 gmP3y6n2kk9eleHofRHytck3oSxSrHgiRnKh6WF2NAWzgtMo6WY/mXQ8CP4Ya3qqGPQA
 v4rBAnMeCH0xirX7rf+/KTD71ypAwGX+esjym15aa1UFZ0v4h9ZSEZD2UUd1Vpfu6NIf
 rUJBQxYjmSaFqbE8SfCcWxn1kJeAQTyEsOlSyU1ZxUeZRcaJwEf0JXZAvhmpCLnCdzmH
 3gUGb0Vemr935uDySnCas/9c3F6B/YjfuvSeQkvgK6WyFzXc96f+UTzsTKdAvA52Ye7X
 k/EQ==
X-Gm-Message-State: AOAM531uX5V3um5z17sn4sjiWO+xreeKwD+iXcDSh3fLqxtcwebS1KQl
 5QqM2baN2qIkNxl4gYybp2I=
X-Google-Smtp-Source: ABdhPJwvu4tpIJSvU+55fpUd2TRX4HwRspEJrI/S9qzAMG9oM4gxSimheFWtMXbC+qd9Cv3iY+GUHw==
X-Received: by 2002:a05:6214:14f2:: with SMTP id
 k18mr11106035qvw.19.1630086814590; 
 Fri, 27 Aug 2021 10:53:34 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f1:e948:8e69:9cd6:5512:12f4?
 ([2804:431:c7f1:e948:8e69:9cd6:5512:12f4])
 by smtp.gmail.com with ESMTPSA id x21sm5033736qkf.76.2021.08.27.10.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:53:34 -0700 (PDT)
Message-ID: <dab10177d5fa144ad271b4efb59fe3e5dc61b56d.camel@gmail.com>
Subject: Re: [PATCH v6 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, David Gibson <david@gibson.dropbear.id.au>, Nicolin
 Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Date: Fri, 27 Aug 2021 14:53:47 -0300
In-Reply-To: <3d79480a-20df-ea1a-e17f-8bf2c8a8a2be@linux.ibm.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
 <20210817063929.38701-11-leobras.c@gmail.com>
 <3d79480a-20df-ea1a-e17f-8bf2c8a8a2be@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
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

Hello Fred,

On Fri, 2021-08-27 at 19:06 +0200, Frederic Barrat wrote:
> 
> I think it looks ok now as it was mostly me who was misunderstanding
> one 
> part of the previous iteration.
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 

Thank you for reviewing this series!

> Sorry for the late review, I was enjoying some time off. And thanks
> for 
> that series, I believe it should help with those bugs complaining
> about 
> lack of DMA space. It was also very educational for me, thanks to you
> and Alexey for your detailed answers.

Working on this series caused me to learn a lot about how DMA and IOMMU
works in Power, and it was a great experience. Thanks to Alexey who
helped and guided me through this!

Best regards,
Leonardo Bras


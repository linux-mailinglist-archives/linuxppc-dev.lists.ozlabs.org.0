Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961F8357CA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 08:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGBNw3LC0z3bpW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 16:36:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TonDbdLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TonDbdLo; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGBNR16Y3z301s
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 16:35:49 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id x27so381300qvd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=jPyP0x12pCFmur4fSxPFpC42drbEe8/klrnOBPcUQ9Y=;
 b=TonDbdLoGuzCQYW6VZPTUp4OKlzW+XMz9OnV2DBOK+ri1XyokkDFLmSh+3JEmfT9Lo
 Y4JXAY9xGjvG3szjF+VAdPnPIfCkB4hSq4t2BVi7Dhhy0M7WpOAhdwHqQOr168kDWfAd
 ZehzAz+3nsryGNXn1RulD2P4cXZZbyjF5S90bR8YSS5DaZVOjpS47bywfDHS3Lu+gt3h
 7r05v2hL8vtk08TZCBCfzPkSloSd/cCwI0WmCkX+961kNewZw6McDCSgHazQDA1o3tMj
 j/8tjM580Wl8atMCytj61fTcNYRGYb+fUMaUdE7QN+/XZ0Bdoc9yqqeuuT5n+vNZPNnc
 2jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jPyP0x12pCFmur4fSxPFpC42drbEe8/klrnOBPcUQ9Y=;
 b=kAroMi96YLNBwuJsaeuMYfwit5gYLEMDbh+8tL20W6RJkjOuVgjjTrK2iUBcT7eLbH
 6VSlmgv1pzs+6gMwY2MEauIBH/eF+UlX4AwvjOiEvpWlF5TFu1IBz7veCQsj2WiQaCdS
 ypNttd/K5+omBJcqKbwZYux4ObHvoqNl8oTlqdIfUEfFtbx+mzLB1NUDpq8Vuu+PWxg5
 S62UOWZ6tuhsxVig8jdZCRYXAq593FPqMxXt0w91G76I67+tEOfmllTLadIXrrKLITlF
 TtRDUkumEhN/M9IKonviCTR3GMNw4C6sTMiUz1ONNSf6Dr6aOimctnRiSd9ocZ1WrwrE
 4nBA==
X-Gm-Message-State: AOAM533F8nsLs0Ac1eLdJrmHbSqfmJqYmJ03uz4gWmBalNsLx8P5TTO4
 /LHow/pLwTYVOwV4xbtemRU=
X-Google-Smtp-Source: ABdhPJyC3Sl6smpCYyyOsTthueVG+CAPYVjsM+e2Fz7WoIrMzYOS7cF9nwkCpaxn/6a2UgiGCT8zgw==
X-Received: by 2002:a0c:a9c5:: with SMTP id c5mr7391386qvb.6.1617863746094;
 Wed, 07 Apr 2021 23:35:46 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id 14sm292213qkf.119.2021.04.07.23.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 23:35:45 -0700 (PDT)
Message-ID: <eed000bfa26686f616b91a7ac5a54ff8e3f2cbd0.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, brking@linux.vnet.ibm.com
Date: Thu, 08 Apr 2021 03:35:41 -0300
In-Reply-To: <942acb9b23d87594d0b758cc0daf713be836f8e6.camel@gmail.com>
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <942acb9b23d87594d0b758cc0daf713be836f8e6.camel@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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

On Thu, 2021-04-08 at 03:20 -0300, Leonardo Bras wrote:
> > > +#define QUERY_DDW_PGSIZE_4K	0x01
> > > +#define QUERY_DDW_PGSIZE_64K	0x02
> > > +#define QUERY_DDW_PGSIZE_16M	0x04
> > > +#define QUERY_DDW_PGSIZE_32M	0x08
> > > +#define QUERY_DDW_PGSIZE_64M	0x10
> > > +#define QUERY_DDW_PGSIZE_128M	0x20
> > > +#define QUERY_DDW_PGSIZE_256M	0x40
> > > +#define QUERY_DDW_PGSIZE_16G	0x80
> > 
> > I'm not sure the #defines really gain us much vs just putting the
> > literal values in the array below?
> 
> My v1 did not use the define approach, what do you think of that?
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210322190943.715368-1-leobras.c@gmail.com/
> 
> 
(of course, it would be that without the pageshift defines also, using
the __builtin_ctz() approach suggested by Alexey.)


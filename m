Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B808211400
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 22:01:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xsZ45w5FzDqmd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 06:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R8izmvOs; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xsWk1pQSzDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 05:59:46 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id 80so23439612qko.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=1KDftEyYVRiS9ZEzfScQMAJ2sbqz9RMLT/3XY4aQ61g=;
 b=R8izmvOsjShErqn7Oa8o40j+Fu8NE1UX2e9H71y/iTbqbAGQStg+JvbPgX4SJ1BiPL
 awHqBbs16V7lWIJVV9ZbdWySup4WrCttq32FRTa5dAzV/hcfauZSDlpaFXmuL8DAe8Gp
 AuBQJkGA7LiNNLGSNifvfD0KJB2vjOmWm4MAroXtMQTst0OY/qOs5xxFjXH8Uk5Byi/a
 nsZBEAWfKfF9fag6dA+oyMYAUyA+DhXdpk+LDTr32pI9IpWp2S0lbiKCSGU1k9qaTL1Z
 qspnBqSNrL4F6C96CoI2sV2MDIZXdr5jznXIVfKmJ8mQfrCcEYXdFE4jBZOGL7T7wbIN
 b5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1KDftEyYVRiS9ZEzfScQMAJ2sbqz9RMLT/3XY4aQ61g=;
 b=rOxlLaZEjN49uz7FzdAWFyARZLgsejJjD8MzeYy9ARwEFuQsZAxsnhaK5kB1pbSyiN
 FGPVVxR7BD2D4IpMv8iFD5duTo/iujPMOSWZKsa7t8d/sIsGryXKf1AQdUKz6rhuA/AR
 C63yl+qpJjU6euRAXjef8g6qpX6Rp1uF+lUklIHSkLVr0sc66hlrLK0WXiSWDegVW7Vh
 oArehaIQj/tFmdv6zjRnW2TXcYBmOVV9Cpuo/nZiyUG6uwDS5RqDMAbqTO12OPJ4nB0C
 7pn7PuO6q8xkBqfWQu6053uDYOc+0/kA1kKzp78cWurjSB+KwhhQrNdrb5nWXzCJzSwC
 7YUg==
X-Gm-Message-State: AOAM531SEZozA1y3BKY38ZYb6gnIxtauLatFNKp4aP3U5AfHCG1rKvds
 9aoTjhZgfR8bOJJxvsvbtGY=
X-Google-Smtp-Source: ABdhPJzpE22b15q/w6oFEQhSU2P63xA5KfnWuBl6ktUwg9E/2QuaJ/Nacnp7SIJSh5bQr2/Tp18tkw==
X-Received: by 2002:a37:b4f:: with SMTP id 76mr25159611qkl.283.1593633582779; 
 Wed, 01 Jul 2020 12:59:42 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id m26sm4445117qtc.83.2020.07.01.12.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 12:59:42 -0700 (PDT)
Message-ID: <ca699edfe2382bef01d1af26b5c7264571ef6adb.camel@gmail.com>
Subject: Re: [PATCH v2 6/6] powerpc/pseries/iommu: Avoid errors when DDW
 starts at 0x00
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 16:59:37 -0300
In-Reply-To: <76047748-9ddd-5ba3-fe4d-85c7c08bd521@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-7-leobras.c@gmail.com>
 <1069466fa3a373e92d9db18957674b1d9c6e9cf2.camel@gmail.com>
 <76047748-9ddd-5ba3-fe4d-85c7c08bd521@ozlabs.ru>
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

On Wed, 2020-07-01 at 18:04 +1000, Alexey Kardashevskiy wrote:
> 
> On 27/06/2020 03:46, Leonardo Bras wrote:
> > On Wed, 2020-06-24 at 03:24 -0300, Leonardo Bras wrote:
> > > As of today, enable_ddw() will return a non-null DMA address if the
> > > created DDW maps the whole partition. If the address is valid,
> > > iommu_bypass_supported_pSeriesLP() will consider iommu bypass enabled.
> > > 
> > > This can cause some trouble if the DDW happens to start at 0x00.
> > > 
> > > Instead if checking if the address is non-null, check directly if
> > > the DDW maps the whole partition, so it can bypass iommu.
> > > 
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > 
> > This patch has a bug in it. I will rework it soon.
> 
> I'd rather suggest this:
> 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20180725095032.2196-2-aik@ozlabs.ru/
> 
> Although it does not look like you are actually going to have windows
> starting at 0. Thanks,

Yeah, agree. 
I am thinking of dropping this one, as I don't see much good to be done
here.

Thank you!


Return-Path: <linuxppc-dev+bounces-11735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF0B43C7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 15:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHfpZ5fKBz2yrZ;
	Thu,  4 Sep 2025 23:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756991110;
	cv=none; b=jNhf3IKCBQ9iFasKXw1TWgWxfAj6zsF3n/kybZeIv5iT61cLwG0xBHBYIzIczXNuUMJHGKBK2kLteLCaGZmUAkAs0Hw+9zTk0fTdCP9rXIiuPkJeRk0jHyuWIg0/u61PCdfVXuJg95geXpxe31+S3UDEOu10Kv3QZK+3quFGtzwl2erVjdmJa2eSpgzUFS6okaD+eDgFbEAU1KzrQmSGeTO0pqgMh3faEfEQiywRfngbClhKpv+D+yWj9UOwCIseZE60HJPHuvJ7mKb50tqO/OeOEMwmkPeoDS+FxDTsDb49Lg2boRp4AnEbdyqBwzIQ3H2eJAzNP82Z44YxL1Geew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756991110; c=relaxed/relaxed;
	bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZYt+769RbaOBz3sWt4svjGdFYDl5U8hvoC7lUDxbPpQI0OaG7OjiRyLmcmzTtyZDWQm6CddCutlosDbwhr2RzhPbdaSZEVGOe4JsaGdCq7UnlcVAe5zwwep8J6USYz/m6BX+oSMG9/g9zJE+mdagxYfjS1oQy03NTkQ6CrtbX30tZdR2MC9wAQhmw+0cezzjsJD6Jf/533ky4BDySdBiCxS3kC/A3BnjQjiSvhFlH7oYhW3GzZHP9btINMwbMOIW3FJY/7s4zOEhBARllY/6zvtCndba0vBSfSA705QiKHKbPDN5h0wg+fz5djM+Sq7jAvfPfWx7Rd7Y/dzg9gHrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N02mjv3+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=richardcochran@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N02mjv3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=richardcochran@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHfpY5DWlz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 23:05:09 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e96d8722c6eso1174697276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756991106; x=1757595906; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=N02mjv3+SZaV+wMuHHpbmOYGMJYRAAYcmNicIGHUUhjRvXsn9K+LYEt7spSylOAXxY
         TpTUDWHD0zFELuFdroA959uOjNrZr02QFP9LCVPo7bFiiVxI6EWgHlt9D0p+Ikx1cF0I
         hsN1KuMKhDw7t0p4iLvBId9j3Lmasr6oMIXQNSBAkvTQ1T5Fs2RQkxEETPnX9Je6Zm3h
         i8Mx+OrfKovqbwf+E/te7Viwue/bN4pgLnbCwjX0KZYKkAF4yHAI4ZTxVzh7SXo02ACa
         aAAoQvOHN1g0XaKoxMQD9OmgDKjjQxOndj1AyPZocunlFxLPmHhGNcS1kU9y4hTPVTfc
         88FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991106; x=1757595906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=xDgUEJt4ZZ66WVmDn4x5C3t0N6Et1VrXMuuLzU9jmEI9DrVMVkNwwKo/rxI87pxLMj
         RlOLFrbDD9ib6E1UWAcp+55OJM80pFeS+UhrkKwVa+Uwx2U4bAgzJx2JyBebZ4L6QW+R
         h0CX0fiq/TXVzFjXyaHsvL4YHQuSziB+iaOXlHbRnwq7z4Iipm5mxZvzMHDsbbXe2lG+
         0oBblhu1O/SLuMdqkKg0P7RM21qeWi0UWkgYPYuvNXrN/D6AyQfsoHGVJf89sIkzi9e6
         Q3coAvJ04kS2NddEpb5JgVb+A6MgUFieiFKW9YBvgWjcEqV2FkEbPjRj+eMK9d/Hvvjd
         oqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKpU0MQxhNlZ8AuVew59j/ihZ2Cf1NpXYq1s3uNXJZjOgIFjRNyKxu9o3FSACo/ddAgI+WaCk3g/jR0DE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxqbpp2/sOQ0XhrVTikWpwXuDJssDzybyU5oIbtqbhArLjtU7cO
	t7mmILDZ0BcCMMMx2ZKUGK4xZopOfSIBwi5tYlhC9hf+voJndNnwHDdj
X-Gm-Gg: ASbGncva+SLXIT97rUAF61QEYDTwRkR32iqcyyqq/2yhFVBzGwakXEt5AknonLAnKes
	aui5DK3WLk4fE3LMoqT7y+EYMsSURrplYFfUITKBCUUik0CdgtqzHH1ObdImw/SYga1A5JZ68ku
	e8Sjv2Y84OoXP9mWgevjG60YlMdQC9XRARc8E+ggRwGiGxgWIlunpV2/yb8wFiczh88xu+FWk8X
	3uUmnKgc4BKQPfRD+IZy21t2H2Im/fHve1dV7NcYcHWQ4X3x77IgIxy+8chkwp1il3CbkdslOgT
	UKKgFEcJDDqnTn5njv1DlqsXOppT+Z9cOzxylPTOdzGjMIZpMez1PD3k7JjCR9iAI4Myljv6Ylw
	OjAbCKfcICIY9mIwj5M/XU8axkuBEGrBhOokbBEiA7Jh1ZJSYEKiqnViQfrI1KTQ=
X-Google-Smtp-Source: AGHT+IHmWVZV9smFiDb5EAWgukKWH2yUMaPX0VME1uD4yW4vCM5Ef44xf0wr2EDvqQBA5WuTd7GVIQ==
X-Received: by 2002:a05:690e:164b:b0:600:b3e5:d4ff with SMTP id 956f58d0204a3-601782d338bmr2063081d50.31.1756991105967;
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf6d877sm2261100276.15.2025.09.04.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Date: Thu, 4 Sep 2025 06:05:02 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	"Y.B. Lu" <yangbo.lu@nxp.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
 <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 01:55:43AM +0000, Wei Fang wrote:
> Vladimir helped explain its purpose in the thread, do you still think
> it is pointless?

Vladimir gave practical examples for the use case, so no objection
from my side.  I just wanted to understand how this is useful.

Next time, it would be helpful to have that info in the cover letter.

Thanks,
Richard



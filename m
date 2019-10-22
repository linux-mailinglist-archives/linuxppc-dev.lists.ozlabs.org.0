Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80875E01EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 12:19:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y8dF6jYkzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 21:19:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="h/3Uo75y"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y8b36jCszDqJR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 21:17:50 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id y3so16554803ljj.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UPQHJmcEnXeH/iiZIyJlOmriHnC0d9InpVAG+IS31RU=;
 b=h/3Uo75yRFQRRe+mjVmd8cMUmSai80wzLccdR09BlGw6HnocUgAczaz4IgYFRWgG3H
 OJdRbFB9Mz9fLShfMfIQz/v973qofYhFRWlTSouwX+s3dVq2XD/i9xdJL7HBCWbL6ait
 GeYoY67YnMUOYKMguf97VQFeB/gYvg8+cWRaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UPQHJmcEnXeH/iiZIyJlOmriHnC0d9InpVAG+IS31RU=;
 b=fA3TtaNxe0SXs644VtSRWli8yTjKZEqIdh4fLyKZYPJO0c6kWWumcyAj0XFqVI2821
 PJj36RXes8dXr91CDirygrG8y4CWkA8qTwmVLTATzT94MgD/7VOLnB8fE2thrbsh4aDq
 R6svGiW1LTdmWhIxathomGo52q0izW4+HBCpRPdkp8BCtQA/IJq6WBYdXmKfIqk4Fqk3
 8xbSfduyeFPrc+A7jnbSfGcsSuo4zmq3qlGHBw1kGYUIl2Y//Imvkia8gpfoZUdLCPj0
 M9//AL60mgDPXCwMDCds5h5iVLzc7PdJWpnIYoZ0mpaabpXylMvd+Rithr7dtvRgIBLY
 SMvw==
X-Gm-Message-State: APjAAAWTb6tD3lqRwYaZrtdGOSgilvFXiaEGUWuSSn2LEZmOgWcg4lEW
 IJX9Lqv89fCqtBP7IZn2yFwfIg==
X-Google-Smtp-Source: APXvYqwrLO6yXk3q5+ZZIbKEWNFhquBa+3kRuXdGYBzSGzi6Tc86djtM/ixn33Sd74ROetfVBAw3WQ==
X-Received: by 2002:a2e:8716:: with SMTP id m22mr10796456lji.102.1571739466229; 
 Tue, 22 Oct 2019 03:17:46 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id b19sm7866434lji.41.2019.10.22.03.17.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 03:17:45 -0700 (PDT)
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Qiang Zhao <qiang.zhao@nxp.com>, Leo Li <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
 <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
 <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
 <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
 <VE1PR04MB676825D5709839AEF75ED44C91680@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <43033011-1a2a-dea3-e3c9-75895f997407@rasmusvillemoes.dk>
Date: Tue, 22 Oct 2019 12:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB676825D5709839AEF75ED44C91680@VE1PR04MB6768.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/10/2019 04.24, Qiang Zhao wrote:
> On Mon, Oct 22, 2019 at 6:11 AM Leo Li wrote

>> Right.  I'm really interested in getting this applied to my tree and make it
>> upstream.  Zhao Qiang, can you help to review Rasmus's patches and
>> comment?
> 
> As you know, I maintained a similar patchset removing PPC, and someone told me qe_ic should moved into drivers/irqchip/.
> I also thought qe_ic is a interrupt control driver, should be moved into dir irqchip.

Yes, and I also plan to do that at some point. However, that's
orthogonal to making the driver build on ARM, so I don't want to mix the
two. Making it usable on ARM is my/our priority currently.

I'd appreciate your input on my patches.

Rasmus


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1D753830
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 12:30:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O5ufoN9b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2SRq3fkmz3cBG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 20:30:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O5ufoN9b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2SQw3tC1z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 20:29:58 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so15989635e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689330592; x=1691922592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
        b=O5ufoN9bQiWKXDmCStIX+Io10WRu2B69Deqb5KVzrXV2sqgY9JCnNvyATagBuE+ark
         IS32r2PfYWd5XlLUlJoSJAAAXm5+hxTEjMb0ZCe5fK3NGofpUv7OKY9G8Xf6nBs65XhV
         mN24wwtq2SFoDgOh1XzRQP48JVgtE3qQg6DtMC8WgMhj9t2D3law3WPvQE1ujYDEF2HF
         HQ2Wfv1wVIeu2S+ZqWDReHbCASDvhIqXVdLZ+6qiMuNgb/mQI71489JITRwjOarUlIKd
         T4bv/caHqvEm2PmjsCWaoXFBLjd4pTJ0r4FnJChubfG5R2bSvz1FrPJ8nXiDNobJSVlf
         ylLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330592; x=1691922592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh5IM3hcbkTlsZ0QohBnPm9+/WljTdptQDAe3KRHGao=;
        b=RlYNYylRb6uvNXfcSkJ3UUe94rmGys9gJEt/tcEvOO4xeWjl0LeaJPWESR/cCcHSXY
         Vx+f2DQ9kT3EHJPLORXRb+PYzQV5MxaMRA7JaW9EcJ94qwkUeZXLvfFeWrmZt7KDI4O5
         bdI1vwi4Bk2HOIXrOpUMXbgQrrCYnBD2QdJpSifUtvCa0cyi5Q2dt3+9QOTkmM6pH46k
         YOVjMsERygSQiwe/X4HTzDbgTFDoeNc5tBRaQ1sFdkX47dTGsSXxI/Qwsk3GG1+pcnP1
         TUsKn3FQ8dLWiOzTB1zp5/4fN5cOSjbQXBEujU64oR/aeFsfnd2ji+/UyoQktLg5IetO
         TDiQ==
X-Gm-Message-State: ABy/qLbFofpgmuLivgXOstGQYS+QpZcNHGLWrqpStVrwF6XgzU4J3a94
	1kYyP6Zw3WoqSpN547MN9Q+1tg==
X-Google-Smtp-Source: APBJJlFnsQ9uvLjsHZQ9SREHQ216HPPGjASy9AiZYJZlWwyGhQieiRuOjHKJ7s1mAu1WpSfMQoCtmw==
X-Received: by 2002:a05:600c:2254:b0:3fa:984d:7e9f with SMTP id a20-20020a05600c225400b003fa984d7e9fmr3534844wmm.6.1689330592448;
        Fri, 14 Jul 2023 03:29:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p26-20020a7bcc9a000000b003fbb5506e54sm1094832wma.29.2023.07.14.03.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 03:29:50 -0700 (PDT)
Date: Fri, 14 Jul 2023 13:29:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 00/18] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Message-ID: <b3c23ea3-f46c-43b9-b12a-9f55de2294c6@kadam.mountain>
References: <20230714075155.5686-1-tzimmermann@suse.de>
 <CAMuHMdWoeyJPAgPgFi545SJFcaVCgZi1-zW2N5cBeU9BnHgo1w@mail.gmail.com>
 <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a3ab8d-5e8c-db2c-fcde-5c2b1bac32aa@suse.de>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, javierm@redhat.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 12:24:05PM +0200, Thomas Zimmermann wrote:
> > 
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
> > >    fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
>
>
> I wasn't happy about this either. But I could not come up with a description
> that fits into the 74-char limit for each commit. They only differ in the
> method of memory allocation. Do you have any ideas?

fbdev: Remove FBINFO_DEFAULT from static structs
fbdev: Remove FBINFO_DEFAULT from kzalloc() structs
fbdev: Remove FBINFO_DEFAULT from devm_kzalloc() structs

regards,
dan carpenter


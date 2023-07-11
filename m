Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BB74FBF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:56:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MSfjWEV8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0ySX4ZV9z3c2k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 09:56:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MSfjWEV8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=azeemshaikh38@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0yRd1Jtdz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 09:55:22 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-56fff21c2ebso72130397b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689119719; x=1691711719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0eHGvYiAjOvtyvlgCffZ7LMt7sWot3qzaN4MmhWSwE=;
        b=MSfjWEV84b6m+wWASrmm8K6FRsBtMeZS3FlTe9y4uvc1YIBJjTuCZP3KFHss/DtA5c
         LvcUBDcq/TBFSzX8SXKmDnKdOA0r0iq17ka12owKtEE2Je3WwoUvP0GJqqB5KKFge0Zq
         ucmcyjo/BjsGAzLRCkbw4sZksSw8IDXbSI/sEIqzKXOqgqLfHpgdEx47ytYuTJIQXerO
         dffN1kB3r4kLLai3L2D8IFO3RDR2j8os0AqoEKX4TUO2sVAoEJvD3JGzBm5rQdnw7R83
         FmiWA/NzH6BntazM+8i+lFYtbIEsmt0DBlWs6dO/dZ3o7RKinmYo6qCh5AQgFf5Dbh3D
         IjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689119719; x=1691711719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0eHGvYiAjOvtyvlgCffZ7LMt7sWot3qzaN4MmhWSwE=;
        b=F7vZGHI4fFH7wQDKvJr4nAYSTqAFYwXbc6LBvwEgY8wzNWCYb5ofE5foY+i1vklyMq
         Uu8jzuYQtIaGQUZX582Pj+lqvL5tXCHlDMa1YYJ/ZENXg8oHDxlINrfsB+dsPjjLOYPD
         lBqNjhDw6PhulRQ4XFN6KCzd7yedNjmDM3YuznVk/4cpli02kmMKcAr159owGTTYaHs2
         uBdqwY+Ej4vB6r3f0dJ1UOv+sWV3Xzm76kojZ9m3DECgnBq4F+PMO8OkNhpzMgPAqIwN
         X1l+jbcerWy9Hx8dBjDXyV8mWmZXrikFUkTXXsyZgt3d8ufbp8MZWLDJB6y3RrpSHtn6
         +i0w==
X-Gm-Message-State: ABy/qLYnKMb9eWbE8LHeZ1dJzGQ1eUhG4CxW92U05sxP6RI0DPUm/5xu
	RYGfOdP3KLj73l36okR98TNeYhqvPlUC2Og9BFo=
X-Google-Smtp-Source: APBJJlHO7JQH+4wLoUl6AYA0Mh0njxShJB6/nHwg1DNX32M6H9lyeiBsJcVDVsV5Gf28FRFr1PQL1GcRjUrWma+QFkc=
X-Received: by 2002:a0d:cec3:0:b0:57a:4719:859e with SMTP id
 q186-20020a0dcec3000000b0057a4719859emr14085154ywd.50.1689119719362; Tue, 11
 Jul 2023 16:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
 <202305231020.37C95FD@keescook> <CADmuW3UAHODqC5YAmjK1sOuo3C56noOa6hsHA+2Es2R9MT36_g@mail.gmail.com>
 <AM0PR04MB62891F29BB182FA2B24A37098F30A@AM0PR04MB6289.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB62891F29BB182FA2B24A37098F30A@AM0PR04MB6289.eurprd04.prod.outlook.com>
From: Azeem Shaikh <azeemshaikh38@gmail.com>
Date: Tue, 11 Jul 2023 19:55:08 -0400
Message-ID: <CADmuW3VO5nrpkYuRDur74w0DZFPWJP1ErXzCgxOCS+Z0DjFbzA@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with strscpy
To: Leo Li <leoyang.li@nxp.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Sorry for the late response.  But I found some old discussions with the conclusion to be not converting old users.  Has this been changed later on?
> https://lwn.net/Articles/659214/
>

@Kees Cook what's your advice here?

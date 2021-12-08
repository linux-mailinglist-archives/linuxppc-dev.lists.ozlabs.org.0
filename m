Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E5746DD88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 22:19:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8VRl74TDz3cDZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 08:19:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.54; helo=mail-wm1-f54.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8VRH1TZpz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 08:19:21 +1100 (AEDT)
Received: by mail-wm1-f54.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5164276wms.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Dec 2021 13:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lGCJse956z74hTTB9jr5bIXKoOQXyIcPGQuNGuBUSrc=;
 b=S5WjDwkoU5m5qblS0ErgGbZ0AonxF3i1jdP35Wrqj4Awqvm8oCXrMBwxskU2/yjgPQ
 CcWpQFDTTHHEpMywv8L1QxFvkxld7EZBg50CQta9dwav7ynxx3c7cMjvtRbssHjaHM7M
 NUc+YqGx+cLlmdLo46rAUydeLH7xAnsmQnGGtM+yQ15bbwxeHL4i2/+y+UmnKOaSBeaL
 04aRaJf7ueZ9HtqUliDcrKeXmMnXWDc+QwRiY0x9FB9AjXtlz7WL9YUiBsY9zd2LhbMa
 WjsUQm9KV6S4JjEd9Hj7AQL47+orvaW5R3dPvFfkqUFxnivYY0ftPP7Wg/zTdzyT7Jgc
 xJuQ==
X-Gm-Message-State: AOAM533sWbJnS85Nj/8qKUOJJPc1xSZqk9xHp+45i1KuipFCyTqDFIxc
 RUrd5jeoahgdv1gX8vEYRO8=
X-Google-Smtp-Source: ABdhPJxE5TjdbwCurdu70/FRp2HcLs5d8u7RmvO/weZBI7PJ6qkZyX+gZ8rmDU5YmXvXj7xM6jowcw==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr1393564wmi.167.1638998357263; 
 Wed, 08 Dec 2021 13:19:17 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id r17sm8019876wmq.5.2021.12.08.13.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 13:19:15 -0800 (PST)
Date: Wed, 8 Dec 2021 22:19:13 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] sizes.h: Add SZ_1T macro
Message-ID: <YbEhUeUy7PlOk2iR@rocinante>
References: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Toan Le <toan@os.amperecomputing.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe,

> Today drivers/pci/controller/pci-xgene.c defines SZ_1T
> 
> Move it into linux/sizes.h so that it can be re-used elsewhere.

Sounds like a good idea!

By the way, there was an earlier version of this patch, did something
happened?  I think you simply extracted these changes from the other
series, correct?

> diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
> index 56d0d50338c8..716dcab5ca47 100644
> --- a/drivers/pci/controller/pci-xgene.c
> +++ b/drivers/pci/controller/pci-xgene.c
> @@ -49,7 +49,6 @@
>  #define EN_REG				0x00000001
>  #define OB_LO_IO			0x00000002
>  #define XGENE_PCIE_DEVICEID		0xE004
> -#define SZ_1T				(SZ_1G*1024ULL)
>  #define PIPE_PHY_RATE_RD(src)		((0xc000 & (u32)(src)) >> 0xe)
>  
>  #define XGENE_V1_PCI_EXP_CAP		0x40
> diff --git a/include/linux/sizes.h b/include/linux/sizes.h
> index 1ac79bcee2bb..84aa448d8bb3 100644
> --- a/include/linux/sizes.h
> +++ b/include/linux/sizes.h
> @@ -47,6 +47,8 @@
>  #define SZ_8G				_AC(0x200000000, ULL)
>  #define SZ_16G				_AC(0x400000000, ULL)
>  #define SZ_32G				_AC(0x800000000, ULL)
> +
> +#define SZ_1T				_AC(0x10000000000, ULL)
>  #define SZ_64T				_AC(0x400000000000, ULL)
>  
>  #endif /* __LINUX_SIZES_H__ */

Thank you!

Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

	Krzysztof

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ECB3303F3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 19:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dtqvj6Rgfz3cmB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 05:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.51; helo=mail-lf1-f51.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtqvN3DgVz30Gq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 05:37:03 +1100 (AEDT)
Received: by mail-lf1-f51.google.com with SMTP id x4so9200483lfu.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Mar 2021 10:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ThbITLkHOU2/dQSeUt335dQeSvRoHsbaI5Fk6bsL6es=;
 b=gffbjK5lwiIPJPByZfogvBXI0P0RsJFTxG7yQkf0w7MkoRuuNv3gsirnVfi0ql9U7h
 hxXBNPUlTUAlB8lLoAVChjEw4T99zgx/noWm1hYfTqiA0JABJ3NpqFOAycf8KQwOt1CB
 88/49mte+87wHE6iXM9lJJdwQIsgJ/phiPDfw+tGNuseahdkZ/qHozNvc55k7JY5swXW
 +LbT9eD1sVafMYEQG9eS/wsGLEwfbZHKCrn3oCqqARYLYoXiWA9oA9OA7AgWsKS+XmmF
 +cztrNYLACJhc9c8JHy1yU/e47g5cbVWXHmOIswatszGFNWvvSbNEqJbPSBIyC+M1f8z
 Dfmw==
X-Gm-Message-State: AOAM533M+nrdIN2/vr3fLt3pLhpFe5FOKOD8bCO8aieVZJpO+Czq2+iN
 hoKV/xAF3jTIJWYbRf9GkPk=
X-Google-Smtp-Source: ABdhPJwzkmkqC/Pw8HWTIEHGBNMbMZdlHNa4mm3nBRwXwyxM6V/4OrZHbwQtOm9tb4iSU0SGC7jDEQ==
X-Received: by 2002:ac2:4465:: with SMTP id y5mr12100641lfl.70.1615142219485; 
 Sun, 07 Mar 2021 10:36:59 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id g2sm1179250ljk.15.2021.03.07.10.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 10:36:58 -0800 (PST)
Date: Sun, 7 Mar 2021 19:36:57 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Message-ID: <YEUdSZpwzg0k5z2+@rocinante>
References: <20201216131944.14990-1-zhengyongjun3@huawei.com>
 <20210106190722.GA1327553@bjorn-Precision-5520>
 <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
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
Cc: robh@kernel.org, roy.zang@nxp.com, minghuan.Lian@nxp.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[...]
> I would request NXP maintainers to take this patch, rewrite it as
> Bjorn requested and resend it as fast as possible, this is a very
> relevant fix.
[...]

Looking at the state of the pci-layerscape-ep.c file in Linus' tree,
this still hasn't been fixed, and it has been a while.

NXP folks, are you intend to pick this up?  Do let us know.

Krzysztof

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741DB645A80
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 14:14:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRyRl21NSz3bgr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 00:14:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VMJLjAN+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VMJLjAN+;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRyQp21Ggz3bbB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 00:13:37 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id l11so24855135edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Dec 2022 05:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KIJTn6uf5ipjBKv9CY5vtV1Hkp+oVF6IKDi1Z1ze17U=;
        b=VMJLjAN+QCvNePbdKUldGx4XeyoaC26IemMCfR80C0u4Il56h62+63la6BndXvHG+u
         7EFhxaqVTPyvlxk3lLlUG+/FX7te2J6nWv7N/IRi3n0hyk1TVEh3PbjvFSbTJVRH5FIm
         204Ws5Xo2Cm/3UvrVgpnoXIMAWUTMpv3AtBphjio4u6wQfioOOTisL0AiwHy3GOX+vy2
         6i4sCSCtAtkfYi8/YwjLxg8G/HjwLZSPch5/0hxlPEc0axnRMGgxipmWLznIIEdze2AA
         6YX6ZXqjDvsYNHc9UQHlg5MTbCsnj26iYo8WT9M7KuUZu1F6Tuj77clfbPx+a5IxQMk5
         m8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIJTn6uf5ipjBKv9CY5vtV1Hkp+oVF6IKDi1Z1ze17U=;
        b=rN3ClIjTfwYkIRP+R+XnRaaghkM+xXAdwaPFwclLyzKv7INU9k6JELpANstaYjzx2K
         AsXmhLUN0CtuXPaM0aZAgE45XgdggCo6onijSGTVj589VzinsCAxBjKd6A6l7CG/PONA
         mbMD85ngFzng4vUy1ZqqgRw4J/Y5oIRqAj2k6UbPoQieXUtoUrQ/Nz7mTsLDCIUi58XX
         2c5nqoEG5WzmcP5BFulINNlMd+XvtOsybH0xegy1kDXZC7YCWHP/89wZa1ZXsLVMT+9V
         989n8wMXrOsREGFvE8AS40Hziee6Jxo1klicx2lLj9kLGgOt5EZ29P0oldgyHaSqdO0E
         o8nQ==
X-Gm-Message-State: ANoB5pmv6mN2d6APxBF94ycLxQMjzj5lPRhKX8hJjeHN6sBIy9+tmIWU
	fN8Ujx/G72m5Y2N6/XNsqUo=
X-Google-Smtp-Source: AA0mqf5dEGRQGRPIJU+djVze2ytX4k7QuRVTwoOo+q8OUe7Dpgl3TXGIbeQddai1A9gh6sueqqq3ng==
X-Received: by 2002:a05:6402:2993:b0:462:845:ba98 with SMTP id eq19-20020a056402299300b004620845ba98mr1778270edb.12.1670418813147;
        Wed, 07 Dec 2022 05:13:33 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id dk21-20020a0564021d9500b0045723aa48ccsm2176388edb.93.2022.12.07.05.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 05:13:32 -0800 (PST)
Date: Wed, 7 Dec 2022 15:13:30 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA
 dt-binding
Message-ID: <20221207131330.pehewfwmr6pv2sln@skbuf>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
 <87a647s8zg.fsf@mpe.ellerman.id.au>
 <20221201173902.zrtpeq4mkk3i3vpk@pali>
 <20221201234400.GA1692656-robh@kernel.org>
 <20221202193552.vehqk6u53n36zxwl@pali>
 <20221204185924.a4q6cifhpyxaur6f@skbuf>
 <84ce6297-5aff-4d6e-8d31-da3f25dc8690@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84ce6297-5aff-4d6e-8d31-da3f25dc8690@arinc9.com>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Rob Herring <robh@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 10:15:16PM +0300, Arınç ÜNAL wrote:
> As Jonas (on CC) pointed out, I only see this being used in the swconfig b53
> driver which uses the label to identify the cpu port.
> 
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/generic/files/drivers/net/phy/b53/b53_common.c;h=87d731ec3e2a868dc8389f554b1dc9ab42c30be2;hb=HEAD#l1508
> 
> Maybe this got into DSA dt-bindings unchecked before it was decided to move
> forward with DSA instead of swconfig on Linux.

Yes, but swconfig is not DSA and their bindings are not compatible
anyway (swconfig lacks an ethernet = <&phandle> property that would
allow DSA to work). Still waiting for Pali to clarify what he had in mind.

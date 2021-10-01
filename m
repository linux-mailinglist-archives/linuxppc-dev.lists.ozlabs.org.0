Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A741EA0C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 11:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLQH338Dxz3c56
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 19:46:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=VvNWzCBK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=VvNWzCBK; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLQGG2T2Mz2yQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 19:45:41 +1000 (AEST)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8CDD44076E
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633081535;
 bh=nyiRnY3elhBK73ooOJVOmC06zf7y6SkVvSwcrbkre8k=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=VvNWzCBK1u+EHfVcuw9ufCyerXXjOAThwphROSK1zH7ge7hXvoc53jy9ZggaWYr9y
 kU20TK+ERhFIwfQRIW5geDRbA3rBO0iJBwJTd85o2wDb8raZSxObs+nrQdr64IKlAh
 l8/Gat9XrRUAteq+HwyOXgN3flOzz+CDoyFERV/yzEiNVQzObfh/2hrX5qWj6pF216
 P9SWIrJe++D1fkqkd6Zpnd+yzXuOLViZiTXEaSijg4W9dYWC8+ZvNHRRl8Z5mcaM52
 Ihgbvu3mkBSQVOVkvgvw3gacGAtUHx94/RUvqpLJiyoImb/0gqLHAzazRT4RdWgGKN
 93eB3KvfEMkHg==
Received: by mail-lf1-f71.google.com with SMTP id
 i40-20020a0565123e2800b003f53da59009so8450403lfv.16
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 02:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nyiRnY3elhBK73ooOJVOmC06zf7y6SkVvSwcrbkre8k=;
 b=z+/kZGECponTCB/Pi7/ZgwPbvF0t2T05qapB3w8PnGyELBAdnGf5ZRWBtZ80qyy4tw
 uTt3l98kisT3dzrWz2TRQdV5sLmhVJU/IosmonBAQd+YrKzS8r8dFik585hc+G4di5GZ
 0MCtWRzZ1y4xme+49jQ2SG1xBiP8LBIg2O9P8aVRYL0wnoA9G5jb1eyN7fuSNz23PdLe
 oKJ4+FOzdxwBZASZGsX8OOW6mnYDxKBid2WP1wgAHXzudy1LK3mtxpSSudh2QzNl/6mQ
 MqDygN04z2Cvo+oyJav4YUuW4ps1ojksU+AdaoSQotF985nUd9t/ZySpD7+vZ0Myq2ow
 smKw==
X-Gm-Message-State: AOAM530tLWC+EoyErxe05wBZpeNhzfLQYIfJlUJ5QHyVHXlEygwTvEJW
 eZUHlCUGHD1+45KrliuOx5yXArqG54bFzoh5KZGAEazy732AWqxswwCzXF9u0C+RwiwtF8R8eL5
 jpgZf3lAH5YWRrYGJ1tyGUFa02y4vhefYtr+GWGXZ23E=
X-Received: by 2002:a05:651c:228:: with SMTP id
 z8mr10685024ljn.507.1633081534984; 
 Fri, 01 Oct 2021 02:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKxIyWWFkeio1hNSB5XH6CFTmHBcLzDsp3ogVtdLYpiKKaILO3Bn+smaXb0XrSby27toXy1g==
X-Received: by 2002:a05:651c:228:: with SMTP id
 z8mr10685010ljn.507.1633081534783; 
 Fri, 01 Oct 2021 02:45:34 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
 by smtp.gmail.com with ESMTPSA id c14sm485059lfc.49.2021.10.01.02.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 02:45:34 -0700 (PDT)
Subject: Re: [PATCH 0/5] convert ifc binding to yaml and drop "simple-bus"
To: Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20211001000924.15421-1-leoyang.li@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4697aa5c-35de-8331-e7a9-831837618477@canonical.com>
Date: Fri, 1 Oct 2021 11:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001000924.15421-1-leoyang.li@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/10/2021 02:09, Li Yang wrote:
> Convert the ifc binding to yaml schema, in the mean while remove the
> "simple-bus" compatible from the binding to make sure ifc device probes
> before any of the child devices.  Update the driver and existing DTSes
> accordingly.
> 
> DTS changes should be merged together with the driver/binding changes
> if DTS maintainer is ok with it or after the driver changes are applied.
> 

It's discouraged to merge DTS along with drivers (e.g. soc folks don't
accept such pull requests), so I propose to apply it in the next cycle.

Best regards,
Krzysztof

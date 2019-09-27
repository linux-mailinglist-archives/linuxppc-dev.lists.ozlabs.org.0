Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA3C0A00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 19:09:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fyvW0Dc3zDqxm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 03:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fysJ6RWpzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 03:07:29 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id w6so5780217oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 10:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JmlKF4hMEHfzpRwq7atJ+qTxrDo2w2v+Z7AeG3RAxUE=;
 b=VsgDERdarHav1RKPZMcd7UZCD6uxdwLB8DpUkSqdOmEvlfTwN5phLwaVUqjdQsAjQD
 jMC1hWn61JfJU5ULEuRXiYzSwL3r8rZp/LPfrckxERbJLBj7STQXpBKACFNUFnT7LD/Q
 xQYPtzX0aOEYVrBaVMrxIRQCnqGMPzjGtr3g/nhZUG9/ujlny/PMoIAjIbrxhgAJVoiK
 dXqDc47e4YaH4h7C96mt+JAdLmiiSdQTjaBX4VX8ebColEqkyb/lmL/x2HpLZ/1njRJP
 vA/RS0eVYvk72AL+N4JCBRjl/NS+G7zdBfwLHbQ+a7Xo4oAb+5Oko9//znvO5BmTyOTm
 AATw==
X-Gm-Message-State: APjAAAWW55eQ9/xK9xORCBWxvxb/DoduMw6b/6mX0jFjdh6j7h7OZ/Rs
 u9hHMoxLa6GvgPXL3w0znw==
X-Google-Smtp-Source: APXvYqy6XbAKw09JULTK3jY2nEL2mm1ktOd1lHG8UV4Z/DmKhKvtYR9KJiuaxJ397QE0WXhXkgIvaA==
X-Received: by 2002:aca:f3d4:: with SMTP id r203mr7634907oih.164.1569604046646; 
 Fri, 27 Sep 2019 10:07:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m25sm1763994oie.39.2019.09.27.10.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 10:07:26 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:07:25 -0500
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v4 05/11] dt-bindings: pci: layerscape-pci: Add
 compatible strings for ls1088a and ls2088a
Message-ID: <20190927170725.GA28135@bogus>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-6-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924021849.3185-6-xiaowei.bao@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, devicetree@vger.kernel.org,
 jingoohan1@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 gustavo.pimentel@synopsys.com, andrew.murray@arm.com, leoyang.li@nxp.com,
 shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 24 Sep 2019 10:18:43 +0800, Xiaowei Bao wrote:
> Add compatible strings for ls1088a and ls2088a.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - No change.
> v3:
>  - Use one valid combination of compatible strings.
> v4:
>  - Add the comma between the two compatible.
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

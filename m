Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C091D02EB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 01:11:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MD8Q2ywKzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 09:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MD6H4MTCzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 09:09:59 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id x7so18893060oic.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 16:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TjYd3leSKKn51ZfY7qRcr7llrPytDm0GdCIEZD2j8C0=;
 b=JZJWmMd4nx6PA8uaOyVTEhgyXXV1C8JsQIYVKRjuOzF+KlDGfiEKBTzCt3ISW42kqE
 sKODv+Mw0MIXB6h+Tu7yGLZ3PeP9rEnG5FKhMSALYR1xLHiSjDEKGRnbjPxghl4lZ/SM
 9JLhsW0dTq7+v8DM6hGuuUhRgJ/RTgk/84R3vBxAgHlq/G8RHDS1iihRyhvATgcTGEDm
 1yNgPkCLFk5ckZ/KomE7LBV/BvNQ1w/vyk2/Lhy6e1UOtGZNODF+8P5z6KwYvLOFLpHM
 c1gICRY6z82QQFsnuxQi/DsCxiSZhcNRejWBnw+JhaDa1KpvSECz+3dn+ICniG6oaikS
 AIaA==
X-Gm-Message-State: AGi0Pub78EOh+KjvHEDIJKtEXl58yiaGgHphU+8w1ruMo/4GllTadIxC
 rKVveJW55VKIW5ZkWhn+Qg==
X-Google-Smtp-Source: APiQypIp6z6XpDyeSpU/MQIh4PPKcXp8UTWOTpvjD0Pwk05Fb3joF3Y1t4vigT4+SMH68vOz8q6/qQ==
X-Received: by 2002:aca:c68b:: with SMTP id w133mr23020989oif.27.1589324996924; 
 Tue, 12 May 2020 16:09:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 34sm385316otq.67.2020.05.12.16.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 16:09:56 -0700 (PDT)
Received: (nullmailer pid 16218 invoked by uid 1000);
 Tue, 12 May 2020 23:09:54 -0000
Date: Tue, 12 May 2020 18:09:54 -0500
From: Rob Herring <robh@kernel.org>
To: Prakhar Srivastava <prsriva@linux.microsoft.com>
Subject: Re: [RFC][PATCH 1/2] Add a layer of abstraction to use the memory
 reserved by device tree for ima buffer pass.
Message-ID: <20200512230954.GB2654@bogus>
References: <20200504203829.6330-1-prsriva@linux.microsoft.com>
 <20200504203829.6330-2-prsriva@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504203829.6330-2-prsriva@linux.microsoft.com>
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, bhsharma@redhat.com, tao.li@vivo.com,
 zohar@linux.ibm.com, paulus@samba.org, vincenzo.frascino@arm.com,
 will@kernel.org, nramas@linux.microsoft.com, frowand.list@gmail.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 serge@hallyn.com, devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 hsinyi@chromium.org, tusharsu@linux.microsoft.com, tglx@linutronix.de,
 allison@lohutok.net, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 04, 2020 at 01:38:28PM -0700, Prakhar Srivastava wrote:
> Introduce a device tree layer for to read and store ima buffer
> from the reserved memory section of a device tree.

But why do I need 'a layer of abstraction'? I don't like them.

> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> ---
>  drivers/of/Kconfig  |   6 ++
>  drivers/of/Makefile |   1 +
>  drivers/of/of_ima.c | 165 ++++++++++++++++++++++++++++++++++++++++++++

Who are the users of this code and why does it need to be here? Most 
code for specific bindings are not in drivers/of/ but with the user. It 
doesn't sound like there's more than 1 user.

>  include/linux/of.h  |  34 +++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 drivers/of/of_ima.c

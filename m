Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEE1E3D0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 22:17:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zdnj3bM9zDqcG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:17:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=paul.walmsley@sifive.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sifive.com header.i=@sifive.com header.b="biNiyBsU"; 
 dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zW8l1RsTzDq6y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 02:18:11 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id s75so12978441ilc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ounxj9cfL6O+QVspuA41qPrL+dtHlnd6zlmABTsVbws=;
 b=biNiyBsUq1oC7u5yogZy8N29MX7ATTQIXUIPIqqI6g2N8EA9QhwEC0gQemO8Cy5L6a
 UCFg3RDAYG9lnvohF8+tXuDf+IXq7fLq3dVHXnLyE5vPEUz/DrCR7X3R288BYePyqXg3
 oYLT/wTPksWncWN9bXdK0yZ0nbFI3oEoJl84Ht2i67n/365THu308Y+OSHFJ18vXXUqR
 ENefMt09zBo4nBburoq/NmiNK2bRI59OT7KW1kTA/yDrLysLajr6fUNNc1LVC2TMXMzE
 JIj7P2KKqLbrHsjaQFkGpARY6E99HHxeUwRHMbgsRgF/uSl1vSWl2lvW9K349Ga0HXcy
 1zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ounxj9cfL6O+QVspuA41qPrL+dtHlnd6zlmABTsVbws=;
 b=eGKYqBky+MMkaF4i6Sn/I6RRPIX9h3D567PxenWHBENXn/VdV4OPO0ZnTmSQAnJRUu
 0JFeqTdYhOJ2ckWELvEVXTFsMlnInwN/MH/XJl4M4iabJCfDil2QWY/y1/FK9ho9ID8e
 xuIa3Sa/ECpou06gEFZwyLw7xXTwbWVuoQj5U0FYufBBb90c6myWBV223VVc8tBR39bl
 9NcaWTRBIVab0HORiEyfu3pm7gir0Zyfzv+TNMVOVy6IJTphu3u0/lDZEyw3lQTg1Uu9
 7ivWfjHBHZJvcxxM5Cp9l4d9WdkuI4nnDTetthq1wcdGkK9aJy2lb+y/JQxcph2Ysj7f
 cD+w==
X-Gm-Message-State: APjAAAVjz9i8Oz6b8CeX3zzqd0lwgOHt996DsfUhOUpIQldPQ9EtAScX
 BPVbKQdWxqafgFqD4ZgJr1KPxQ==
X-Google-Smtp-Source: APXvYqxQ1LtEDnMpoN971luqOI7TbH4CJsi6LuiXRaB4c6bbMVkSBP/cjpjqc6MBqdQnstOla4Sq8g==
X-Received: by 2002:a92:8fc6:: with SMTP id r67mr43423606ilk.5.1571930288560; 
 Thu, 24 Oct 2019 08:18:08 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id y5sm7755183ilm.63.2019.10.24.08.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 08:18:07 -0700 (PDT)
Date: Thu, 24 Oct 2019 08:17:59 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/2] asm-generic: Make msi.h a mandatory include/asm header
In-Reply-To: <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
Message-ID: <alpine.DEB.2.21.9999.1910240810420.20010@viisi.sifive.com>
References: <cover.1571911976.git.michal.simek@xilinx.com>
 <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-165076562-1571930279=:20010"
X-Mailman-Approved-At: Fri, 25 Oct 2019 06:41:16 +1100
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
Cc: Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, palmer@sifive.com,
 linux-mips@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, hch@infradead.org,
 Firoz Khan <firoz.khan@linaro.org>, Wesley Terpstra <wesley@sifive.com>,
 James Hogan <jhogan@kernel.org>, helgaas@kernel.org,
 linux-snps-arc@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, git@xilinx.com, longman@redhat.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Vineet Gupta <vgupta@synopsys.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-165076562-1571930279=:20010
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 24 Oct 2019, Michal Simek wrote:

> msi.h is generic for all architectures expect of x86 which has own versio=
n.
> Enabling MSI by including msi.h to architecture Kbuild is just additional
> step which doesn't need to be done.
> The patch was created based on request to enable MSI for Microblaze.
>=20
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
> https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/

[ ... ]

> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuil=
d
> index 16970f246860..1efaeddf1e4b 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -22,7 +22,6 @@ generic-y +=3D kvm_para.h
>  generic-y +=3D local.h
>  generic-y +=3D local64.h
>  generic-y +=3D mm-arch-hooks.h
> -generic-y +=3D msi.h
>  generic-y +=3D percpu.h
>  generic-y +=3D preempt.h
>  generic-y +=3D sections.h

Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # build only, rv32/rv64

Thanks Micha=B3,


- Paul
--8323329-165076562-1571930279=:20010--

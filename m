Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 076A6424BCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 04:26:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPwDm6QHDz2ywK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 13:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sp/MggvY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Sp/MggvY; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPwCK6ZLMz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 13:25:17 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id n11so2496703plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 19:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=Sp/MggvYZ1fkKseKOIqheZEqgIYO9U7l3Fb+F7r4AF1HJvKza55doAM4VFHekfLjFx
 l0h9QKBGfCRkc0EqNboiOVTNmHzg/SEEuLqwArpOJayKxQme+kLkxEIGqZgvnMWmieNx
 fhuC+ZFrD2D0fjMPYFbqmZAg8gVdJN6nAW585b1RLttDiggeBCq69kYRXGKHA2qSZytw
 hSaCB+BvsDGvSowzyJ3w/Myei9Krute/Mf+n+VyS3y75NZoqIH2HR+hkZeD1eiqFJV9a
 +rouVDBNrFLQuldI1V/ceTpSLwESV/R60I9q1ajynvnJIpy9PEOAXakMQE5+aA6KEYjv
 CNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=xXRjrlUEgL9ryi0Yu7Kowb/6SDZyeu2W2DQwPX2mlGnXYFLF5yBxuTGe3YTdRl+J1R
 kd9caDWBwbMUjOcZ0ARplM010N42QG8jD3+Hh8gneH4XINYn7WG0ho9gQxy7aalr7mCx
 kTXwQG1xp+vk30VvKczlMN8scn4R8uvuuXWaJUi5aS6lgaQSo6geUW6AV9GciwB/7zG7
 hwJl1P/WUprjhttbZB7mh41vgZQjTdGGMOT68umvIo66sia69Vv+FBWRIiF0SBqwXIrj
 +Uc4IxSP/z2OANXiAAIoUKIcgtPpHTOHEtSD15G6BlbE8iuvkpnRKDTPuNaFBPssKM02
 nTFw==
X-Gm-Message-State: AOAM532PJ9MjRsNkOE1mug4WleBE1aRrE8161uP5UlleJsk4OBRNy4LS
 q9rnVOHd48JeoJEgO2yo9T0=
X-Google-Smtp-Source: ABdhPJwHRb5SJb8sNMUH9CwZYyScBHBUSvA5u2yjHWxgkKCOzGkTQ5PtC45GQtM+mqCrbUx1dMutLQ==
X-Received: by 2002:a17:90a:8b8d:: with SMTP id
 z13mr2492694pjn.214.1633573515375; 
 Wed, 06 Oct 2021 19:25:15 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id k14sm22015549pgg.92.2021.10.06.19.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:14 -0700 (PDT)
Message-ID: <ad0c1e14-62f9-0b9c-0b84-d31a213d53de@gmail.com>
Date: Wed, 6 Oct 2021 19:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-4-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-4-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/6/2021 9:43 AM, Rob Herring wrote:
> Replace open coded parsing of CPU nodes 'reg' property with
> of_get_cpu_hwid().
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

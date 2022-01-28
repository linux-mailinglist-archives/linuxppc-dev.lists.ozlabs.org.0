Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC44249FB5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 15:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlfVt4xyfz3cR4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 01:10:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KnoYpCRO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KnoYpCRO; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlfVG0Q80z30Kn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 01:09:55 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id a13so11110756wrh.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 06:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=;
 b=KnoYpCROJNJ4KeVjiMHVRjI3Nw6MBdLiVMYBKyWi5SjTGkUNhmLXnrLxkxBTE/uvzm
 1i7z3jyz9HYmoZNAG5Loy00qH2mtg+iFqBgPPlltZlvuAUpVQzHJC/Zh5YvuO8bbiuKV
 EhY0GkfgFO0pVCtVfHeoBwIMjXpF7AfmFwBBlSPZrfauweTohE5pmPCqYrkC4s7Xusfz
 4HPmI5qzz1+q+sdmUh4Ity1hlHsWh5wpsKT4x8GRkQTfDY1KyAL6lGRKpMiXEM/O84+/
 bEb7k6+NG5FdGoGanjw1rOia/TgJAtC6p47O0pODeUAm6OEJWTT+h5i60wvVX+nLYbKo
 twmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=;
 b=m6fZGOutJVohCr0PfD0lD9MAye0Ubztu7R/q3TK6bem7+1zTB7HSFfuX1aoE4EkJoe
 HpmkfKF13ka8EHXmB3byGCC8DAotzcSltNXy/onrOcdxcwUcnTnB8gInL61cDi0wbIS7
 bEgRqRoJZT6xS2fLp3Vo7rFsfu5yuoW9T+5qy9ffQCLV3GBldCx6XzWVpoW+Is1WIGd2
 4TlEQ3rN3FGJwTFHf2Uv4Y0jDq0oA1AocHCVKwG+e/iR3DOB8aLRJsTmRfQfCoINjedp
 aBCXBQbN4QXwW/st4H7JxysOfY2eZjfdek5GDF0Q8yy/FZwJix0Jh9aQSSVFpizVpRfD
 Sq4Q==
X-Gm-Message-State: AOAM533ei/GTBL1J5yW/PMJUaSDj1ZmeTFNgMv/VIldA9NUbQMgVPAoK
 oRL69Glht8BdfTMYdt86S45hiw==
X-Google-Smtp-Source: ABdhPJwcwaW5k4PCVMl0xIx5mubfMQwAXKgrPRB+Y2ibDaLBwjoVmYeQufxi/ZaCrtP5AiArmXZMSw==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr7395000wrd.477.1643378989779; 
 Fri, 28 Jan 2022 06:09:49 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w22sm4811774wra.59.2022.01.28.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:09:49 -0800 (PST)
Date: Fri, 28 Jan 2022 14:09:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 4/5] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
Message-ID: <20220128140947.n2xea77txqohfbfj@maple.lan>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <af8519537d2a5c36b71a2f48ba9b81c07c93a5c4.1643282353.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8519537d2a5c36b71a2f48ba9b81c07c93a5c4.1643282353.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 11:28:09AM +0000, Christophe Leroy wrote:
> Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC to allow architectures
> to request having modules data in vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>

Thanks for diligence in making sure kdb is up to date!

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

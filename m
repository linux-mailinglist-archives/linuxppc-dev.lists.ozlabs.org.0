Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3346779913
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:00:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TcFfpXwk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMx5S6cT2z3cN3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:00:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TcFfpXwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=richard.genoud@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM6nL03SRz2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 23:13:40 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-317b31203c7so846755f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691673216; x=1692278016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBhUjYJB57IDpg//HzidEUQPRD9Ij3Hoz+KbD9Efgcg=;
        b=TcFfpXwkBBPAq0NBcNrHsW1c4sUY58+9ahJLEhkfjGTFzc/3cK5PhxciefozZVoGCN
         8na+Im8VyJNUDuFMuhvWkb2uI8sPstepuuYnTAMbH5JdvIQKKL/2xppZY/r9weya0Vru
         ckycSiYtcy7a6oGn8DNutV7PZNLnXAHSvKPR2qiLBu/L51/NZPvDo/tcjWzKQf1wILYS
         AHs226d6QpPHbJm+qK8m+gYOOdLJ1mhizwn3rROyUf/ip73pNS+eZMciSBSXeJfe7oZV
         82fAIxmzjYyqg0mN6d2ZQ87sorCGJ6q9NBuMDfwDioBu6EYolGINwVmGit2p0hhGl6qr
         a6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691673216; x=1692278016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBhUjYJB57IDpg//HzidEUQPRD9Ij3Hoz+KbD9Efgcg=;
        b=gHFOJwvnTIW4icm5sr/iqPbGjgCX6Xvw86g17cptkqaLBFmracxb0dbHlgiSDlFAv2
         mu9tqOXHB33Rar7sSFMwL8OEn26/2BhBCpLvBXuVy7x/c+8TvoVc4ovs+XDILkxDX0OB
         oEhrxUMtiPINCkbO3D4mh1ksc1SSDJJOrar+8bwxPXyrslrjRS8FidcCzUfJd66bpgi8
         3VFMS7oRNt6CwRSvT2dlSdz67dIb2Tekhdqy1pEaGS8Sfg+rCpdTv0f7+JzWyLX56eoK
         6cv288xJmJyGMO0Xe/EEIII46hQrabIf4DQ0LpIkrWauTFxIU7nMVraZlyST9z+YjWCE
         FYBw==
X-Gm-Message-State: AOJu0Yznqat8jcdZR+A1lIBTex+DU9Vnx0f08serFuzdIdEVA66tcW40
	KPkXoAgH2t34BbXbj+MY8NQ=
X-Google-Smtp-Source: AGHT+IHklVUeXSY1U4xhUe1yFTSP/55+Ie6PL6bdURE+H3ONkkC3Ip3iEN3BpJCHe2n8zJjS/PMpHw==
X-Received: by 2002:a5d:5489:0:b0:317:5d1c:9719 with SMTP id h9-20020a5d5489000000b003175d1c9719mr2064130wrv.9.1691673216090;
        Thu, 10 Aug 2023 06:13:36 -0700 (PDT)
Received: from [192.168.2.41] ([46.227.18.67])
        by smtp.gmail.com with ESMTPSA id y14-20020adff6ce000000b00317e9f8f194sm2167545wrp.34.2023.08.10.06.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 06:13:35 -0700 (PDT)
Message-ID: <23d8d0c1-1a67-b641-f09d-f17f9678081e@gmail.com>
Date: Thu, 10 Aug 2023 15:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] tty: Explicitly include correct DT includes
Content-Language: fr
To: Rob Herring <robh@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko
 <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Peter Korsgaard <jacmet@sunsite.dk>,
 Timur Tabi <timur@kernel.org>
References: <20230724205440.767071-1-robh@kernel.org>
From: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <20230724205440.767071-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 12 Aug 2023 06:59:44 +1000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 24/07/2023 à 22:54, Rob Herring a écrit :
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Acked-by: Richard GENOUD <richard.genoud@gmail.com> # for atmel_serial

Thanks !

Regards,
Richard

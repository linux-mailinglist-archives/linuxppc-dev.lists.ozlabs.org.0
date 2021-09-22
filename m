Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A52414B73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:11:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF0Zm11s1z306D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:11:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=pXZSUvVQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=pXZSUvVQ; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF0Z11Pscz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:10:32 +1000 (AEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 909EE402CF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632319825;
 bh=iNMj8PKQUNev51ZEKfGzcirSHdmbfqXjl4kbh441iow=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=pXZSUvVQiIfVXeX8xYOrvwkl+7j6DtX83UHJoIB9B8Vysa1o2i0M0SLHO0Idtc2qj
 bA/59FtM2vfZBQvdvHDXv0wdsZt9gNdU2Ehj+ALKniqfgKpsTh9EmCq9SSuRmzu0aq
 mURqX8L7HbfLMa2nk/HBEAfTNgm/OrinDKSye/pTRNODOLERWCLhIS+DLR1CTxyoC4
 exhWMPZGjMh7rry2Kp/1/mFij0XUknirLTRI4SLVN/WU9+hG21RiV3pJoZ0T43vohj
 OhSB49p2nDZyS6lFyQPK+/6WsxVbeROgADEGcgSE1luC7pcNpKWgyQpufHy9NvUjs2
 NQE/yDa5GnsfA==
Received: by mail-ed1-f72.google.com with SMTP id
 d1-20020a50f681000000b003d860fcf4ffso3149718edn.22
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iNMj8PKQUNev51ZEKfGzcirSHdmbfqXjl4kbh441iow=;
 b=Es6M8IaDneeKLAQzoSzGSTtcZ7MYCORcMNIlXAngZ7+S0bIK0NwPZiPTAlHMTfNsLS
 SS1yJHx4buPm3ozErgVacikY60oHoXABzLG0yIKOXufaq0ZvAbw4d2CWpIF/NrKTOE9u
 WxSB54Aovv67GgU5OgO4rnY25VlPRazYz+xdhsKY3BH/9IT7eyJF7eWeXqiRnkVDke0b
 dN3TooamIWIV0NP9CC2EVrQMX4GsD6Rq4ZUuKZ9uS/V55MMcVCfH822v9FUmZLbjgsO+
 PfVVlQel/fCuNmmkWBIRp/AqVPHMtJbys4/ueH+fs0QmngOMvzduqe2ZGPza4gl1jzlm
 6QWg==
X-Gm-Message-State: AOAM530X2re5mTgrWGamGkv/NpPB69s+HQGuSsQMP2ZAn9nmB9InzBt7
 5gBn9x1a9lNObe3grRrCq/BHJq+TG9ICU4xUEVT+qy97VUedSuDSDUz5WogkDKhJBJ1Kbv/G3v+
 Nr1MPg4pilTDRh6OqqNlgtCCwHWetPLQtyklFMTL9XzI=
X-Received: by 2002:a05:6402:64e:: with SMTP id
 u14mr43168066edx.184.1632319823967; 
 Wed, 22 Sep 2021 07:10:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpsp4VMavM5vx191UsZKZeFxUGy6aFJnlOU4UVgDRR9QT2MJHyEjJZbwqlRc/RX1AObv+5Hg==
X-Received: by 2002:a05:6402:64e:: with SMTP id
 u14mr43167991edx.184.1632319823063; 
 Wed, 22 Sep 2021 07:10:23 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id i6sm1112859ejd.57.2021.09.22.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 07:10:22 -0700 (PDT)
Subject: Re: [RESEND PATCH 1/2] powerpc/powermac: add missing
 g5_phy_disable_cpu1() declaration
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
 <ee9fc44e-daab-10e6-f293-fb45b43ff5b1@csgroup.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <32efc1e8-7c00-3550-4a39-af343397013a@canonical.com>
Date: Wed, 22 Sep 2021 16:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ee9fc44e-daab-10e6-f293-fb45b43ff5b1@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 22/09/2021 15:52, Christophe Leroy wrote:
> 
> 
> Le 22/09/2021 à 10:44, Krzysztof Kozlowski a écrit :
>> g5_phy_disable_cpu1() is used outside of platforms/powermac/feature.c,
>> so it should have a declaration to fix W=1 warning:
>>
>>    arch/powerpc/platforms/powermac/feature.c:1533:6:
>>      error: no previous prototype for ‘g5_phy_disable_cpu1’ [-Werror=missing-prototypes]
> 
> 
> While you are at it, can you clean it up completely, that is remove the 
> declaration in arch/powerpc/platforms/powermac/smp.c ?
> 

Sure, I'll send a v2. Thanks for pointing this out.


Best regards,
Krzysztof

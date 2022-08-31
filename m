Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E95A778B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHbTx2Gphz3c4K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDUHucZH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eDUHucZH;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHbTG5Gdfz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 17:31:29 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id b26so6791592ljk.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SowT+GgtM4rpf2Tm7Xdg2PLTWLyEuq4YWLGVJCfBBo4=;
        b=eDUHucZHmNWPS4dcTDAvSB+3Gf6B84OpnmrxcPBg31ZikUd8NxfnOhl5KSqS8dqwTH
         By91LHkdLFJWxuU3BZip5eaLMrQ3CxsdmPbKI+MBD5j0nW1JUI4YzW3nktfZKPaQBcHx
         KtZG8TaSTS9srPQOsqMP85vqWbBerDKMiFGow/qtjx4HobjfONZP21xmc1c5FfT+xX+j
         nIg8aDpdTtf7gCUwKdLU6g4jzLSvaiPTv8zA9dKiV3jUY+6cVOhIcxEpmKsLBKokL/TW
         zbez57XmSuj33sarUwUCCEpvsSsp5xK9z8nlhK8VXyG0a1y862EP0dyou+0fo27AGZu0
         Oc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SowT+GgtM4rpf2Tm7Xdg2PLTWLyEuq4YWLGVJCfBBo4=;
        b=Yb8PDcuvesPYxt92lo8JH4Mp5ORa5+cQd14n8gp/RKp2NxSRGwKTU1zUIicWfYmaKZ
         vgE7+h99cpgiHME+g9GPROFzl3SGBV8DT6rjvUkaPmhG4CF3xDnKmK7N0EgTQ7iKvk6I
         ThUN2BdKbflZi8f34JN4ZBUS2S7IosXDtv4EpR+IL4F/woH6HL8A5WC2QnwIU1JOOI1T
         e1QsW7SHHbQbLpC1zFcRGdpV3rsvT5RbSdfqnjeJXE13DZvEzT9gS6/etHgteRIj5N4i
         X8+qv1MoCsyTtk+Ufxpd7jWFdVPIE2PiL7ypvaBKA2QroXyYOwyixqylBskERZCe+yF8
         2Ihg==
X-Gm-Message-State: ACgBeo22mwcqXfgMBHlap6XN/IYD9bJCWLsGvM8+uaWefAxCh/YypVG1
	YaT9ALP+DryOKC6J7OLicZxzoA==
X-Google-Smtp-Source: AA6agR4/QCHMtUzdlfGAL1xvdig57DJ6Ktw8Nv3Fk/1Sl/NMSIE1w3emriDGwD5pekMf0VCiwhuuGw==
X-Received: by 2002:a05:651c:199f:b0:261:d789:cd6c with SMTP id bx31-20020a05651c199f00b00261d789cd6cmr8281851ljb.450.1661931083551;
        Wed, 31 Aug 2022 00:31:23 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c7-20020a056512104700b0049468f9e697sm1135488lfb.236.2022.08.31.00.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:31:23 -0700 (PDT)
Message-ID: <373fdedb-447e-b552-df83-737267068296@linaro.org>
Date: Wed, 31 Aug 2022 10:31:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: syscon-reboot: Add priority
 property
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830230012.9429-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/08/2022 02:00, Pali Rohár wrote:
> This new optional priority property allows to specify custom priority level
> of reset device. Default level was always 192.

You still did not explain why do we need this. You only explained what
you did here, which is obvious and visible from the diff. What you
should explain is why you are doing it, what problem you are solving.

Best regards,
Krzysztof

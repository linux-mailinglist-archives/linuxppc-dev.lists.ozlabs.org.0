Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4118079E017
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:35:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=El+zWm86;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlrKf1Qpvz3cC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:35:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=El+zWm86;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlrJl72zWz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 16:34:14 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52a3ff5f0abso8264437a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 23:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694586845; x=1695191645; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=El+zWm86NiNDplwyzn4k9JEiXZCb7nJYXyPiR87RZExhZvi9fvnL4pzQP8FiPeJiJT
         RVdTHfEBY/BanVtvFQ1JK+Le0Voy2njFeT2NQJdQltcW747ItgzcAIHrd6ayzVwGXfm+
         YlFXdlwK/ImnqyqkCnEqPDQTlQKBZM0QmVB25XLFiBaw5NimBXJ5L0CmihMVeSR8EA7L
         DHo02onMfFP73W6eRhI2pQESrpkGG7pz3VmyKta8vYC1JUWYu3YQNWYuvxbraP1+gNHO
         HfQxJO1P4N14Ju0fTJSGjR7HxVQvpjujkxLSW9VjDLRlCNefZQSzCfAtjFad8v9p6z9Y
         xqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694586845; x=1695191645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xivZoRLvn+KlDMwpBnyJeJwebEb3d7RlJsAeQ2v9Xg=;
        b=luc9uCgfpxwZUPRCXjfduvXRW2LWK/Y5gh+zI7xpQca4A+EQ6cDFEAHpsWX16j/n8O
         W6iWWaTL9ZpjH7pF16bcYXlQiEtAWO7SmKwLiB76akjTtUvW/0OQj82w1qRffhTyf7gZ
         JPlVe9ARK6M6ibAjMPSMJiecdC+oY8fwQZqXdJyBmGFR/99SbY5L9oi0geBO9KxdgYu1
         hGqpPDo6+BMCZKF7wtKbXb/onENXOiHnS17Vuz9ihDOaJDZ324x5vCFOwQiCzyB0DJFs
         FNy/R9xAur0r+hWFylhUqDGdbUqeVD4WLl3hI9r/vFkI4HlG1MNTjyZfvoBZ9YjZgRrE
         SHTw==
X-Gm-Message-State: AOJu0YxqVlDtgsMZRSompIPdsTSpWTtgy0OaQS2IjHxBWh+iyyGQ6pXp
	Ndj/BotUa6Urf+ikL/5ON5H73g==
X-Google-Smtp-Source: AGHT+IH7pVsLeTcuGo1IKYmY0OKmMz3guLsV/+W9YMk15RXLnYgeiGl9YmdqiaV6jYyLCb+FD4rIbg==
X-Received: by 2002:a05:6402:74f:b0:514:9ab4:3524 with SMTP id p15-20020a056402074f00b005149ab43524mr1452889edy.7.1694586845587;
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-241.abo.bbox.fr. [176.131.211.241])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d392000000b00522828d438csm6829049edq.7.2023.09.12.23.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:34:05 -0700 (PDT)
Message-ID: <7a34d350-9583-9e81-5706-9932a03441eb@linaro.org>
Date: Wed, 13 Sep 2023 08:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/5] arch/powerpc: Remove trailing whitespaces
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de, deller@gmx.de
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-4-tzimmermann@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230912135050.17155-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/9/23 15:49, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/powerpc/include/asm/machdep.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


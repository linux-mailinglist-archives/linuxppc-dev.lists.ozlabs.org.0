Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4064887905
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 15:19:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ya4VarR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V21YH3Zbtz3vj7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 01:19:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ya4VarR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V21XF4D4kz3vZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Mar 2024 01:18:53 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so2073914b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203531; x=1711808331; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgW1njvW4Wz+IGlNA3VNeEiCX2abnmGJkt4zaObGyJk=;
        b=Ya4VarR+J9d6+LicyoCyE7kv+WJnZCaARfMmuXSLG0h/ZoTvmGryEvqQNia/M5WYds
         0g/lLwKEGIwu+8AjcI5CMe1sPq8ZgaWV3aNGYSfWHVm0uThXrCX09SbMyjHyL05DMLHL
         e8mfC8CJ0qkqHTu5cXBv2/mbjJN03HSIYQd4Ex2QiXVlPWigj9sbjfeAyY7ZmmTeH8zt
         axCoGXcRdkf7Y871sZV21b0H+uZ2sY3E08IJ5R+bfl83RxJDrzQ90jLPLKsPVSdd+51W
         +aE/wFMPLiqketPDNkIm1xII9wlEmbOHKNJsRhYzvO4meaVGCwJI2szJ2FGqgQS6MyEn
         H8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203531; x=1711808331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgW1njvW4Wz+IGlNA3VNeEiCX2abnmGJkt4zaObGyJk=;
        b=r16qqv9ethUK77hlapscB08CSY7oF6YRHupI3/pemKVIud+6OZ58XGKyx1xAcFQVXt
         xKhx5U9PrbNPU+bwE/MDFzC5V1rKCIAJJxe26De84QpPyXnsOJl5G+8fNU30USxoIdJJ
         mVbwCX+9o/8QanbC7ZmLQvDwxhl6/7bo6DY34VH/WDVPTIcyl9XXy2zvwU7vdbyheIr4
         mBdSI+iBt85mGZchesetxdnth3+bkt31XTrhkHWVnfPPmQ/H4qfVor8/nXOU0+U+Hlsm
         mamXj1i+44PBBPkrXIGqODecdf9PwE7bcHNPKc3xIxfFNfvf5Z3w+5PCsfyTyLuib3Fp
         Hf9g==
X-Forwarded-Encrypted: i=1; AJvYcCX0QvFIibx/MIuBTq5egsdK5+CJxB4anpwC+lWZtJ0rAzMe30C8d05oBSDpw5cBRdfUoNUKccYNXLFcorKAHki+iaZ9ofWtIO8wNCpgvQ==
X-Gm-Message-State: AOJu0Yyyc2nbuwQHaROqUvy5XWLBmtFi0rX+KLbLpZ4RyHNuvRsEAJBp
	Ww6XpX6koft5JptwRuB96blEBxbLZN4BWDzN/cr632OIjE2NEYC0qxQBGyK0
X-Google-Smtp-Source: AGHT+IFGFxIRoqvGpXqMnnxrsXWZplVYwU/7PbCEWKy5oSpPf7AjWoIraV8DBpA54k91DPSWX32lJg==
X-Received: by 2002:a05:6a20:6a0b:b0:1a3:ab77:a10f with SMTP id p11-20020a056a206a0b00b001a3ab77a10fmr2712655pzk.55.1711203530856;
        Sat, 23 Mar 2024 07:18:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i63-20020a62c142000000b006e77d7edc56sm1474298pfg.111.2024.03.23.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:18:50 -0700 (PDT)
Date: Sat, 23 Mar 2024 07:18:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: hwmon: ibm,p8-occ-hwmon: move to
 trivial devices
Message-ID: <79f53936-608b-436a-af9f-9f47b1ef16cf@roeck-us.net>
References: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
 <20240322-hwmon_dtschema-v3-5-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322-hwmon_dtschema-v3-5-6697de2a8228@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 08:24:39PM +0100, Javier Carrasco wrote:
> This binding meets the requirements to be converted to dtschema
> via trivial-devices.yaml.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A8B904E1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 10:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tI2bW5oZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzdty5kBnz3fVm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 18:27:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tI2bW5oZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzdtG6Jhkz3dVK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 18:26:28 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-35f225ac23bso3069867f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718180779; x=1718785579; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD/AnD8jYjxQt+A8JZVZ4x+a3sskE6EWblVU1rCcOAs=;
        b=tI2bW5oZm9jBFF/kLuoEqv5Vws4chMwNkPLIanxrMlabeNpZFq4n/f32vsrtZlLOv5
         Y1LkisEAdbkmTRpcdM455M3Ie6flKI0MoISYf4HehUYnf9QxifyHf6e3DbaKynHYFYiQ
         8pKul/1BlIm2d0uaRTPw0TlTVyfMVxloTUsaUD1ODDsw8JNJBHV0v1ZKrp7srMqFa7dN
         RPrr9kFH7+QMtCxd3XvpwEdHF0KWYJ9rWshnXedUNozzkXqQb8ArvsUAPERwpm7SzwtD
         sGPRSZpI2QanjXtwYp6OI+2PyaTnZk4SY3Bf96hzapSUMsY1m1fsiQlrgzSapC9sXULo
         OXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718180779; x=1718785579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD/AnD8jYjxQt+A8JZVZ4x+a3sskE6EWblVU1rCcOAs=;
        b=J6DU+dkMArfMkNlyG9uKH7uFk/xbi+MnjeIiPT+Jtma+UChekiB2omn0l3hqOvCfJH
         1GoD32+eNo0TgHlLPaavEcHAw9331baZrFElPdp1WNhDheNRmFsFKGQNrIJei7diMVqe
         6cw3qffUHPFfV2/ACBayQCEUV2CRVnEkKXuuauNeer/h39og1B6xa45qm+yPtPJSd/fC
         WAwCGnwYzXn9JZVso4zo8/fC1EnBumGaAsixdSOY4oo4eXcbQcHQFAeCBKAA6vJfKwi0
         hoX6ea3wiUfjvafXXn5dt2LEcR15yHLzDNJEz8IZnh8TEtkFJmJiXrbSsmtDMX79CZSi
         oM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw5bhP1sKiD0xKA37XPv27OA5SCo0UcyxKWDRwsQnWefChnTT5B25eLic+tjt9S7EoFSY6Daml8yoqzuOPBzXKuD46j3x5oUA2f5Ohjg==
X-Gm-Message-State: AOJu0YwK4LLMMC8vjQNbleor9vS0gIcUZC8WaYjbijopZAY83wWKn4LU
	fyZR2QdmY48OtPENh2gUGX2gkh7OXj2z8E5YJLFBbsBGg00gHXrwBDo6kIJGWls=
X-Google-Smtp-Source: AGHT+IErb8RFlvw6xH91ueUYnFs5XI7s0QBkhIDzPd1VcUWd7DB8bzcwthOaKdk+oT+Uq6R345A4uA==
X-Received: by 2002:adf:e6c2:0:b0:35f:225e:400f with SMTP id ffacd0b85a97d-35fe1c0a063mr870657f8f.30.1718180779272;
        Wed, 12 Jun 2024 01:26:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2d756539sm3702255f8f.90.2024.06.12.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:26:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Esben Haabendal <esben@geanix.com>
Subject: Re: (subset) [PATCH v3 1/3] memory: fsl_ifc: Make FSL_IFC config visible and selectable
Date: Wed, 12 Jun 2024 10:26:14 +0200
Message-ID: <171818062457.17232.8716946182820856760.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530-fsl-ifc-config-v3-1-1fd2c3d233dd@geanix.com>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com> <20240530-fsl-ifc-config-v3-1-1fd2c3d233dd@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 30 May 2024 16:46:36 +0200, Esben Haabendal wrote:
> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
> driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
> be selectable for platforms using fsl_ifc with NOR flash.
> 
> 

Applied first patch only, because:
1. I did not get acks for the defconfigs,
2. I do not consider stable defconfig as a hard-bisectability requirment, thus
it can break within one release as long as next is not affected.

The last statement is kind of not true, because next is now affected, so,
Esben, I think you should resend the defconfigs to respective platform
maintainers. To recall: arm64 goes via your SoC subarch/platform maintainers,
not arm64 maintainers.

Applied, thanks!

[1/3] memory: fsl_ifc: Make FSL_IFC config visible and selectable
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9ba0cae3cac07c21c583f9ff194f74043f90d29c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

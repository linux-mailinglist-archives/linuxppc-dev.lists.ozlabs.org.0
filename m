Return-Path: <linuxppc-dev+bounces-8455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95595AB090F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 06:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtwXP73pkz2yLJ;
	Fri,  9 May 2025 14:10:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746759595;
	cv=none; b=ZDwwbclQTdKaOHP739lpvFtBUgSW+TJ7qeCwJ1SBcwDN/Fk4nEpgAYwum/Pu1dwi6OnvH9ktUjPbYr+V4Yn7jh/zSrIRBtNF1kc1uWqf0v/GS85ihpfLiXKbntPFHW0NBpUj9/0lKDFrhM56G1pw4se5ZwO7Wzpj3Mds/Xmp3M21Xp/Xxsw3iBqMr7ElF4drDrZWKw9Kyqm8AN3mVbOSezj6IvjOYiye4R8+sch59eZzZtaTUB3WFBeDcdN6+NxhZAYYqoBky5pk8OimO9i5Z7IpDgQaFc6NVao1syv1QqKJaA9iOTa5K7seQ/sRbfGL/tqxyx1Zwsd15ed4p5hZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746759595; c=relaxed/relaxed;
	bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hf3UNA+o8lQvrh58f660urejaWyh1XOetrrgMejecnNf5yh/XgJBw9Ovq6Fe//S6N186Yx4u1+Rd3HdrcgxgJQvnvkcUnqtBLWB7x3QTPiibiRTA3OG2gd1Y7T7LUF8t2ykJPNOpOeHn8YxklDfutRbuQRuhb1ig+7Kcn2d6R/a69LFix17+HppD1fJsNAjCQV+M2Y5P9ysTcVRpoXdnTxeHBB7z9ijG84vDmwTB74jq0g6yOSH29gYCY6n3dJ0ANOZTSKP83C8KTXe10XLj+RngOFFVNfaCEPglJcKwb8CRckuuKoGLEuAJvkUSjAC4WNZN/YIN3pPuU6/+NAIy+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aw8wvXs+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=wilfred.opensource@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aw8wvXs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=wilfred.opensource@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zttyd6zytz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 12:59:52 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22e331215dbso21931155ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746759590; x=1747364390; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=;
        b=aw8wvXs+0kXNq4A8eEUmyDJSEr9SQDusHkp+ZLpzv6jCZahnx4M1rMUAyx6UJXbkYT
         lcE4htcOuLkRvpfbRfh5PvtNr6kRPvnxzXxhzavEJ6vyhe3obyKIzcnpDLfso/Sp9aid
         DPZVc7bFys5uqsX9Ou9VsTso2km6ALdkRgAQ9S5iEVlEjKBZ2dwjfJ25j2xLr21JOlm5
         LtFb+aR40I+2dfhNEWNj8v+RnBQM8kmk+DTLe/Nr+VItDwrRqlaDvkBIIs//EtxSxflX
         AR0zcnVzByr2VHMSQ/woNOlPkbwQQgPwKDV++15vhoIb/Q8NIjmuKrSMg/Sb4hBPZDjn
         5K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746759590; x=1747364390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxQEcAvzVs5hRAXlrlOyX5QOnKVlWvMiWvM9EPXP2kg=;
        b=CLg9wj4KMd8MNRbSqK4aqSR+jHcRdiInRwbgQ/TZHs5OaQ1bQSt3b9svq+pclVStWd
         wZ+4egS64VOI/uIWYyAxR5BRbDvzHvUusj9dskZ0EK92Mm0+VFA6wt2qa6IpIFb/pvNl
         yhVj86zeFPW4xC2Eb03367hcTrM0zJaE221LtxDbJYytgfG2N71ohAVo2KWHWUfB2yCo
         IWRMjb+VqSLwWbEknCHjXayea6DR2UeFY/q9+2jabxnc4IGWQjzsKj8H6L5lDQ85bHUR
         6p/cBL31vj9wmEMtV2LId5zcI+fDUt7rZC72vSm3n/g+9bok/vfLQwiTxVS6fVu5Z4ix
         z8vg==
X-Forwarded-Encrypted: i=1; AJvYcCWkmA6fm3CtMLwaf9CFwzNZD1Akt1CGg4jsVKmx4YDsgtF/HuuZd6KjCiccILl+sVqbhFlz/yrqTla23XU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyvo0/Rqr5xztIE4XrCai/HC1mvnDsoUk92DaNbUQ/ak2eJPEBJ
	gWoxLgGeuLzYbEeolz+Q6yc8X4jr+ZPri9olGT7x7ryz7guJ7fre
X-Gm-Gg: ASbGncteE+aqsfOMYQlEGnMOV3SCANGZFtVCibMvZYAarpjjlb2vgLEryTQUdeI3Cnw
	6Glo3vkPtcmsHgtkwLVXRcIaMl4BJlj5PZZLs9SLmLiWZ17l1UWHL7kH/D6wfJwwyEIqMhO4LEZ
	7c5wEwBr1uGND2xym7oF5bZ6a5IVXIwDkHg27k/HX4VkMc8MHOvlAfRK6tX57NnQ+kfcLrWbWp1
	Sxcav357dz6NsHfXVc8MqF/iy7LUuDjyOvcrdoObZQCMKooPz9ws4N8utjTAFeI3QHPAhB8u0xi
	p5Ze1tY5Qzds4UaxIF4r0wq7bP4y4SbLuYl8nHPksQ/lJPLN9zUPflo=
X-Google-Smtp-Source: AGHT+IFKUhpmwc9Rxvi6M/bPhs3f04cu9R3C2Hy466xXe6CJzKmuEEz15S5GyyqX36uHXpmQGFCOwA==
X-Received: by 2002:a17:903:3d06:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22fc93dc352mr25153235ad.21.1746759590482;
        Thu, 08 May 2025 19:59:50 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828b216sm6976305ad.168.2025.05.08.19.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 19:59:49 -0700 (PDT)
Message-ID: <ad737e02dd4b7958ecac1d67ac2f3da7a238d012.camel@gmail.com>
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in
 a platform specific way
From: Wilfred Mallawa <wilfred.opensource@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas	 <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kw@linux.com>, Rob Herring <robh@kernel.org>, Zhou Wang
 <wangzhou1@hisilicon.com>,  Will Deacon <will@kernel.org>, Robert Richter
 <rric@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,  Marc Zyngier
 <maz@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	 <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Date: Fri, 09 May 2025 12:59:40 +1000
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
	 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-05-08 at 12:40 +0530, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform
> specific
> way to recover them from error conditions such as Fatal AER errors,
> Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and
> call it
> from pcibios_reset_secondary_bus() if available.
>=20
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and
> bring it
> back to the working state if possible. If any error occurs during the
> slot
> reset operation, relevant errno should be returned.
>=20
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>
>=20
Hey Manivannan,

I've been testing this by adding support for the reset_slot() callback
in the dw-rockchip driver. Which has now fixed issues with sysfs issued
bus resets to endpoints. So feel free to use:

Tested-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Regards,
Wilfred



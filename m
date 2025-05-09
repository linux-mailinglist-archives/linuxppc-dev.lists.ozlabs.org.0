Return-Path: <linuxppc-dev+bounces-8456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB43DAB0910
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 06:11:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtwXk4cVBz2ySg;
	Fri,  9 May 2025 14:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746759906;
	cv=none; b=VbOThRmtzTCZuO5iz/XoPbYKJIZBTeU6ZfFVhAdOPjQJXnKV3Xoy3PFClHidtnnAWe7y/HPbLHII8NLDtoFtEsNmV03oLp9HSWpua4FSN3Q/7JJKnNFDtQ68LYwvTaZQo1D3bIi79u8y073hW66xyzLIFJfV2VrKyNW0dake5HrT6imE4hndGuW3b8qwY4Qv/Pd1+ypSFh425/Ua/oBt/tW2N4wtd+gyV5nJiUREreOyaQFmjdrp0zjfKDIVXdzzLoNpdwc/0EsW9DgdROmrxHrDMCrgaZg2hTl0xMrP8gfT5yXcbHo30bEKIE0ECYcp47t5Le4IfJsCSwtVlUkI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746759906; c=relaxed/relaxed;
	bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W75OnyRqxilUIGlqlUlkGr8PCYrpMHoNoA97xEusl0ZVjXei0MP1by3vP9yVO2OFJb+jp4Ny2uBoblzNVSrI6QnFMxYJNZlmR9kO0KjA8z/9/f1RAgqYIw1OG7K7pt/omT0Bt74kbtZV31ENh6mAB+aVIT9N0tm+Q/Sa6dbTSclvbCO3RNk//Ip+w+2VF+hYrl6mNMFmGTABd5nS9ru1QQnn9fFqsP6c8I7frhHY/jE+7yqGmaZjFB4GzgKNKqHYikNhn4GYwz6Q3LvXX3sEY3EO9vQa+qfI36ZOVvPT8SE551dcOtEoGrwRuAqPvRTIh39XixVGZQsF/UEoY/fNvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DSo944cn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=wilfred.opensource@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DSo944cn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=wilfred.opensource@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ztv4d3qdwz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 13:05:04 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-74237a74f15so832869b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 20:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746759901; x=1747364701; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=;
        b=DSo944cnZNFAFgkR9aT6vq4AhI1gJBkNBzV1mHvXVhM2uihA0X8QZRAdaFGgW18EDn
         WQvUtpGXoqCouFwlqIKLLHVwN1IFylCVUvqg2LCR/5oBU2VBtd58FN+RX2u4p94a2Enb
         ZuwJGZ8lz2sALyo+xQsl6p40p3FGva45aKzKnRjryRetRlRe0m6Sret8Ifx8odkHaDPu
         LTIu880rq0gant+l1/w6Cs1b0hgPuMFhkA8eHsEkWjwtUKU5lER9ZAjReDG6hhnSohYf
         OY6vaBHYLm3UAsl2bwh0heYharxss/8NSiQ4VPJo8EBMOhSaqCXN7Scrl7o/8ySksesT
         62UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746759901; x=1747364701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4t2Ei0gDk5QvwRDY4Z4sHn1iXc6O7O7DItvDoocJa0w=;
        b=Fx+p84q4dGGXVd5EL+t5P+BbtEh8+IkPgpS5bPgc1UfMh473t/YXAKfbwcEeIN3kI9
         Udh0mmFCWCl2sXXihrCeJCyDZJJ98qjo8O++X72QzFxc6EM1i79NnAIDCHN9itJi8hAu
         h94XhzIm7hg35sTjmYs2KPambFEh1MbKZUM0+Ca78p7H15jDKWWk70EaXLvpp0sp4lFL
         sDoNXJBfAptjxCPRGtbcrAJ/K+a0wiTpcbyg3wiFnM7gQNYa+66ylcXlA6vjKDWbiM0j
         gWHKzIsaJfJPQF5E30QcAFHJgHcC7AjqhEkEM4Ek9p4UmHlqhBrQti79Vr0WdNFZjQfY
         j5pA==
X-Forwarded-Encrypted: i=1; AJvYcCUKOJ2jbvxWPw/tzdown2rusIO+kaFxv3V9jWXGDa2hQULytbt2Ky2PmFeNhgdJctQaQT2wzZhWWUyJbGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQku7t/U+6hx9SLxn6g2h8a9FflizTJui3ygJ5gS2kQNWyvn3T
	bKWEzOXxIP2CFu9/UIKlXIE/cAwBZE/qrtDEJ41LA6+7taVCMa6L
X-Gm-Gg: ASbGnctcvFAOmOgwt1g5FOnZ/FTtMMavzcTleZIzBScmYTuE0n0AWtEl/SZ2XBat5j4
	xAmiUT9S7K/sw+Ewusk8HA/5qdKgBpghTypEw2QlvNgqNV921CJSBthfiJxPpKK8ILihEwDeS4H
	clKSkErHuNa3bz3kQ5Obzya166kbbeusx92ONyOBIMwcOV/IMnqLiF4UliTsKuhzVnOwqLRmkiW
	z/fkecVB1jSxDZRkO0z3Q4sy+zq24eXxuhVb6PxEYpjValYE20dRHZw0cgzF9GX5evK7le/I3Cz
	F18m+g6MLmVz2QMX33BRtV9edflNmqo/TqNFpLwN8aRwOYrxBkDLqTQ=
X-Google-Smtp-Source: AGHT+IEwAifDsncJZmqJw68TT82q/qBue7rdP4C6uwfIpHf3Dur7C2E/ejrTbFWgc33C/qpZMOKFqQ==
X-Received: by 2002:a05:6a21:670d:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-215abc75623mr2418406637.35.1746759901018;
        Thu, 08 May 2025 20:05:01 -0700 (PDT)
Received: from [192.168.0.69] ([159.196.5.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f141sm775938b3a.117.2025.05.08.20.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 20:05:00 -0700 (PDT)
Message-ID: <09c558f2128c5f8ca1d4e51b0ba04646170d2de1.camel@gmail.com>
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
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
Date: Fri, 09 May 2025 13:04:50 +1000
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
	 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
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
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO
> which
> is quite misleading.
>=20
> Signed-off-by: Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>


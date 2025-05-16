Return-Path: <linuxppc-dev+bounces-8605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257DDAB9AD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 13:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzPkx5G71z2y8p;
	Fri, 16 May 2025 21:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747394425;
	cv=none; b=jdSdkn0vZqhTCu/Ee7+lSKlEhxrNVzB3ZWO8maht00RE/4ZFPDk5g17d2K++NxjQj4QMBsBCIByIrpgRlF6G2Dd6X+pShlrgHldOwvC39aSFj1yEClDtkGgqIuiDcSxUlv2oZ8oQFHKRe5ivjobURD9g1DwiyLzWcYXd6vF2xcrzUhI/0252jskcJ3lc6EiRpEklfYk2fJDXxVJw6pIzAMAHqTEKwjvzUq/P9DkJ46YSRfopl5vO2V/TUUDiCICO5cmKkCIRKMgP7eprVR/8TjAy5TnHzq8f9oWXcOV0zjz2aw6+e2dAGHckl5lJhyeEnk4n5UkH5KbffDGbqw8/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747394425; c=relaxed/relaxed;
	bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMYXciP5w/zZxBedsroPNScAVPCAF+k8wtTR5prL/hSlUxNqtx7PZ2bdf+/hZdYxuD1BIOWC0r6FlQlr99iQOUaK+6TJRkBa7txl4BTa1vG2pmkam7Ja/tcRNp0cj4GlbY45tl4ngarzp5m4BEqgkxgvfScX5yzKhtyUJuJKkLPmBUTt8RP6XigTe5IK13JMrcPSR/5oU3szPwSzr9I0YSA7x7ZQ1Lo78EsY4On5i0welG0zNCMmlsK8sG0/QLGiukqTlciX7Pk2rNIkm8FYF4tbVpjVT8hb6u0iYaGHO1I41gpyPGuuPNDz1B4GRO1APHb1gGMf6M/3pRsZmtAQqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BTbr1cSs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BTbr1cSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzPkw5RZKz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 21:20:23 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-231e8553248so2597505ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 May 2025 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747394421; x=1747999221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
        b=BTbr1cSs0KksedMHfTkpMBqaR5+w5t8MsE6pwqpvYMXOx1+/EN82/gtM+Y8Uh7QrW/
         dy2TeILMv8dzzVufdeLNEaY5RvJ5MWsZI2Vk6D3FD+tiMtyiNUmYI/KYJ3Zrgr6yVc2b
         KygQto3PTpBZllBhXeQhZALcnfv/1mfLxyb6q2XbcGVDkHLi2cG5hzySBAhWNMCW6Q8B
         wFlb/x6aiUBvEqa5dQTDBCWzTaxafXTena6U4uH+Mp+KK9hqr6WkFOU1SFIKgVnRI79z
         c/+EZcqKVFLdD/fwGct7aFcbExZSrxcmsJt1LsEMqQr9Hm7Kg1+p8k3FSvLb+dVxdjYz
         RTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747394421; x=1747999221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
        b=wgD6C8Fj9p3YrTEFLv/qX7k6u/k8RUnuyIhK/L7UzNcl9Osahw0VHOcZmD08nYoz7E
         LnN7pA/IE0t6DhVAAlCywHgN2S6PDIRNBYROCHC7vYr4Gt8YPdT95SZ8ZFftVq0FiUdv
         vpdczuCv0JCc7ACPR9Mfz5nhPhA4cK7XCI5hIM2cGxvs0m/T8YQgpF4r9cWy+2NkjiPF
         BHhVsQnjpE0plvfTHqqOHSr2aPhC4zEzzJf7iFOi3xkRaDUdRJvPC2dP4ShhOHazR5CZ
         p/dnnPOWYXNwGiddg479rqimNEjNgc01E2B+mcz8tQlMP2SyQKjUivp1tHQXHx3QJ9wN
         OBuw==
X-Forwarded-Encrypted: i=1; AJvYcCULKvhOu6n/lGa38mkQRdQOE0S1fGBPEH8WqCeR1LcYG4U9lbKnxsKjmexpj5EVvHm0L+Z2Grvem7E22uo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWPOAKMUpwncG5nMUcckjIZrFjzXjr8qHuMsZHghzFq8kYHvm/
	YZjTADS0VkHfb/FkPyeyjONdIyYOi82BvHoar4c+GB9MO+9BX1p5MqiVk4alggbCHBUdFhDiFpi
	19cE3Cbz7x4dzp95dl3wuL3wJ1M4b15k=
X-Gm-Gg: ASbGncumxcPwMPwWeJU3tgICjo08BgRWDPWp6YvUnLrnz/7j3SqQ7aAWQ5kZS05O6F8
	BBSCP1w9AbKpnm8DIGqm8ZD1u27gWh63VIaDirzqTPw+t/XfJLzvM9VA2miVC0hRQsUSbWbXBCO
	5+ZCnJf+YdOjSprNZWCkR0TMkEZTwATA==
X-Google-Smtp-Source: AGHT+IF/3Di+oLsBLaPYpxcv7LfBBu85vy0Q3yZ/dHsMufRKupnaU8hUSwUIBVs/d7/PRc2cuA5Zbi/WvmJkmILfBEU=
X-Received: by 2002:a17:902:ecd2:b0:224:2384:5b40 with SMTP id
 d9443c01a7336-231de31b3dbmr32958375ad.24.1747394421207; Fri, 16 May 2025
 04:20:21 -0700 (PDT)
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
References: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 May 2025 14:22:09 +0300
X-Gm-Features: AX0GCFtrJluGbPO8r8cq7EZ0iKopTI7pXoYtTZfmc5c4e3CQG0UEAmnKOrj0Sus
Message-ID: <CAEnQRZBfxz7xkC6GSfL6OJ3g6HeFicQdicj48W=JwKYB8HyGRg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: update platform driver name
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 16, 2025 at 11:06=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> XCVR driver is not only used for i.MX8MP platform, so update driver name
> to make it more generic.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


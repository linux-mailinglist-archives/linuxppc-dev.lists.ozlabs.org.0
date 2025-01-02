Return-Path: <linuxppc-dev+bounces-4595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B9A000C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 22:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPKp72G92z2xFq;
	Fri,  3 Jan 2025 08:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735853919;
	cv=none; b=L5m0/1EleLvO9bHS4JTJYkydJVxPSpFZ/3df+Ln7jwAeQLN1OKYsMctl7pAE5yCrK0lTrA3WUbPhTN8FB7ZKRQmZfROjbG4bTUNSoJV7E4cEH5HbzhH1kcU5H0VoI58nlNdDapUy8/7RkYZ3kDsg9/lLfnptSpA9KXiR1qkIoJcDtqAsgAxB6I7+4M4eX6AS61so9cDX1/kaJIXfXClj84ZjQcN1aCDgDGF5uJOnMbYOYIh4NCWt6YeghlNvKIdQOiQQ3T6g8GQNufzJQLAyKCiE7nkKCb5G6F0QdNgaFWjGBDeZ0oxasws4CitWhFO2w6yTzhGgQBN1uqyqcz4qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735853919; c=relaxed/relaxed;
	bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZO/UBm50Qp2SaNpIRJx2Ga3QeXzHoH/czEVMK0cDHGt7kQU1zNGtP4ZuRw6egReh/0fSaO1UPN8RMjHlWG0S5nv7WGFQGjVaJr4zMWkR429Oty30J1NziOn4iPnkffmCFKps2gmOOcKP856T4wO+iI0z+RSiPWBK9VAwtsTdSPqGRfHR5ZkB2X5Ltsu1b5nKU1JqCCx7NiBaz8WM/TI3foYTL9BTpsPAOEdB7hiBMq6uFyL+jWXRisM0FilUeybENtTyFxQpt4c/YeZzMzpfs5W7FO6WCnwpPq4mzrO4228GG8XYUfIPUUYszZrjjlg8f93EHTUwmsWS3BWBbxbKLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PLDPCtVU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PLDPCtVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPKp60sXLz2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 08:38:37 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30227ccf803so137889401fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 13:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853914; x=1736458714; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
        b=PLDPCtVU7bl9apz5TJVfAkuit1y/VNIy48gOimTQPfL1SJYFLgqsurOzVqseur6QAQ
         b1YDsl3bie1wd5O/X8yBuX3LKlufsH9otLiKps37rGNfGhqflHYDh+YyXRw5wAOlIR3z
         snR7xWp/6ac9949YJNhE02DA0wNaqAxmEbdV9qP6FMJXi0G3vzgL/FbTErrRCGtJ9+PS
         QeGecxR2yzsZ5cTFdshcWsSdUniDmX+RFaJbnM9BluVQJjYk3kR3Ll4H9geKB5ibHF31
         WFX8S6OMCtUoQXeXwt/qj2DQATWpv4uLqvaFbQcWHoi2Js0HW9KvK6uKpp0AuUrvbLII
         +4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853914; x=1736458714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QAvkI6HxTL5269JiZxSPsPSVibxMR8kD9bdLWJznEE=;
        b=SzWRHOLK4jWn3vmnEBiWhbAwCx5GvxrnjFrQsTPr3dxylQPXJ6Al64cIDYd+8HjgGw
         h85CQpK2jnOBqklaSR+pZOjSBfylfB2WSrlvSr3tnHLyqKUopuYnZKF/3kgSFstsfRlX
         8uLQHxIK4iDK8C6zQehH0zi5HE9BDjtRjlFlOtCrA8sXfKEQXK3cMLU0bY9F5nFXOH3D
         +5aLF7ScPOyLXss41LYHM15eWeAKCkKAZswwC7mhL/IVSS+8yyDjrUyAj86C9aykRGfT
         lbTtwLcXzZXfzuZZ9vGD4CirTeNWUKbHtpTMKwBL7bJecsO7/fe9j0okWuduvV/VyMaD
         7Vsw==
X-Forwarded-Encrypted: i=1; AJvYcCUiskibZrTeG6pWxrPw7okIv/6HV7+HPyeCCPXtVxkJuvj8Vbej0YVTuaiPpB69pe+HnQS5Gxuo0rMeD7A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwW4JUycsZJcWHhAhcqncpCvF68XXp5aJM+WtbUHYOlq3jmwQNo
	d96uPPk4dECEeOzlp6DZQPzqHg29PnuDK0r/K+GTQkOezKeqFZFSbnTo5XXFt3G8kRU37tXg00B
	OKlSRALvR5eQbBnyZWpsuEar1z5PA4/Tv0qD1HQ==
X-Gm-Gg: ASbGncvXVuA042jYon0gYxOn/oseDM5NAvhoARmgCFdrGEz0M3hMkxjzrGPd8WjKgsB
	OacrUYMrO5HEjjEXsnCO1wwN+HploA3nz9FA6
X-Google-Smtp-Source: AGHT+IGgIsXivWdreYxsNQCB/NDjR4aFqFJyr5ZVnW9Z9Bg0saPdaxlqhTNHFFgWt31bWtKnl3+Z4uC7x6U9BW4+fD8=
X-Received: by 2002:a05:6512:b0d:b0:540:2576:d0d8 with SMTP id
 2adb3069b0e04-54229561a90mr12900419e87.40.1735853913704; Thu, 02 Jan 2025
 13:38:33 -0800 (PST)
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
MIME-Version: 1.0
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net> <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:38:22 +0100
Message-ID: <CACRpkdZVKC9HhUT8LqNnOU5NSE_S-ucuZRWACesEejDWwCyV5w@mail.gmail.com>
Subject: Re: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
To: j.ne@posteo.net
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 2, 2025 at 7:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> GPIO input, output, and interrupts have been tested on a MPC8314E board.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can Bartosz simply apply this and the binding patch and get these
two patches off our tail?

Yours,
Linus Walleij


Return-Path: <linuxppc-dev+bounces-10315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA347B09D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 09:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bk2Dl2j7Xz2y8W;
	Fri, 18 Jul 2025 17:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752825399;
	cv=none; b=Fguai8ko9ZaFUSbIKt5dQLYYxKHX+im4XGST7F8cLIgmdPLzW38rX11FmUYMReAdYrgzfdCC1o7DEHhbuNDDDLE2QTiPgVBGi14fPyqgExoEF0HxlxkhjGWBpDSJCKRJz6lb/OwnuuKLyI7A4dXGbTSZB6tG0zbMFWSg3lIs2JD8ukw6RxMPfi8owcQZ/qCzX6J0tc86tb8i5ikTR0gW0k9PCzr6mA30dCLmRbyUkVVRIgtZGPhb+Gqpu6hWnREgrLYTgq5S83GsYgEzVihgTlJgS3x54TXkkT82OYqBrnNWNPSyEVwUc3r9NkIFVcpsH3v02D8gDUzFC/L4XbWARw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752825399; c=relaxed/relaxed;
	bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUKtERkn1b1PM3w1uX0Pt/0wJuxZyXqR+zGW0awlZ1k2ggtFNxQLTgeExDoXyuAJTIBllNdN+7RVMAlYkcQDCDVIzDsfgnMex6vo3kqGbbVnLof5UuoJmfJ/HIA6gO9hZn5fqCVJOqXoiWzy8Vm6jAB5PwnBFRh+nWdCzgrxxHuphrFTrJpQY0izuDWqWCSL/bobdhZ997qpc4ErZlqZfobeprY0/lxYJd2uMLJArvL1txe8zb3n39ObYEF8SpcsSKoylZvV1aFgnchGojfaU0YRLQA0378wC5qVYPqeKPyb6oHBtUZCKm1FYbDpZ+y9sbuEfwcy9uXysiUWy4CoPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZlkaQP/Q; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZlkaQP/Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bk2Dj4TL4z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 17:56:35 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1436875f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825393; x=1753430193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=ZlkaQP/Q3Ahe3RyI9LGwr6gL8399G2To5Y/aUcEr/5HO2mQr5TKP5hnSBfzci/AupP
         5ODYCkde1bajpenlI5SQhqW4GjFHSyLXMC5l6IeXoVJaqtqJ5QEIvqq/ypaqQnb/z31D
         I9FdzJnnPow2tzNPEh/0eSVBCh8EwpG959SZ+OIsZMWszBi1qylChMoWebj1z0UAKL0g
         znfpyXYlSFdLlJRtX4epNGsY1oqRuTYBvUOeOd1Pc+PFj1W9o8bHYdtvmxXwmKfyX4KD
         owfq5ucukjmUik2guSM8l3jokcIAyoqxmwbLojsa3rAQboW4U3q9jADZq2oJA5GRyeLW
         tEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825393; x=1753430193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=cayLlFgwnWyKB2UyWJvbhWGiFf9ooMF98T9tYvhd5tzlybjmBr6ZHo44U7nCOOlylm
         1MhZ/ZA9X71d0WMFOP9sx+Ehst2D+BWC4y2tkNw/g4uGQQ8lC0iZpGA+g0MBboxmsvWc
         nRjQhd6Sj5LzcGQkrOmTKHSaHj0oPpPvkZQ13Byk1phfhHg7XkZgW1ucPAaRagU984N4
         aTXWCy1/ogc2lzUxfh8MBuRd0tQD80ha3TOtFjoQhb8PX/44U+huWMwjMrI+RBhNYs7a
         KU9ubr3US7aHTh8h3cEuzNl68PWqLw8d35wyePOFbiP+redRMOMg9SEk21AZFKpdxSe6
         UNLg==
X-Forwarded-Encrypted: i=1; AJvYcCXSghUdnY4gQiFZQvaFyF9tQx+lfDQ8Up46npvkA5eBssQI7EqhSoCqr+XGhnMtVutzCqUj7kNYTAjJX/g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyTBDVZyGVBaJbi3qf7RDAf8kB6WPlQ3zT8+Au0VTf+eeaUfAtq
	ojZClWjy8mPnE5+aJ1zhexScq5yIKLJIYYKUqDG4mMHn0da35p7/Sw4ITqfAYgMSsWQ=
X-Gm-Gg: ASbGncu31gqfYkcSB1lJ8PHjUWU/ld9MAjZsfZ2bXxXDOxHTZkbuqXiah85jZ1y+lUf
	o/BpRpSz66CEmBjgEA5UoAsFmV8NOKeZVDmEi7r+Sg/zeLrVoAPoG1AxuCFDAeeXZ5f44U32bdG
	THlTo0F1L6Bq1aEatgLVdBfbRWA+02Dv4u4F44Y1VnLolWCe9wBGA8mrH0Vs3MeVczWICz0KfJe
	ZdrK5QFusAwtl60gVrhMNJ5rytNcdDouxC7EUUbB4EN8TLghZB7dWp3YnpHoRKXuuWPR1LHdAX1
	ARmiA+JIyyYLj/+9kKvT3jORjDh3IwxYNzAobnFVggQVB7y/15LT3peiE4uk9YVTaQ3k0nA/mwE
	NisqtXne0Z6Vbuj6YID6E
X-Google-Smtp-Source: AGHT+IFR7z0xrtW7kV+L/PWsVn19Mve34KO13llGmq0De9UTBvi6IEowVSVAnjHLfBTTi45HhGu+EQ==
X-Received: by 2002:a05:6000:1a85:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b60e4f2c6amr7520566f8f.38.1752825392621;
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Date: Fri, 18 Jul 2025 09:56:01 +0200
Message-ID: <175282531516.45055.8482528409833116992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
References: <20250714201959.2983482-1-robh@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:19:51 -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Create a trivial GPIO schema
      https://git.kernel.org/brgl/linux/c/2ace85b5bbd065a4e037970154854dc2b41d7b31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


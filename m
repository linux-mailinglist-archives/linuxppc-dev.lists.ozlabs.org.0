Return-Path: <linuxppc-dev+bounces-2472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B39A930C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 00:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXTzc1rx3z2yNR;
	Tue, 22 Oct 2024 09:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729527730;
	cv=none; b=i3rsG7TZmBDJQD66TeiJx1Ys2huXAjfnNImuWjhsTwB9D4A42+fctzhY1XGTKiR6lVWfRyaJTJ5Gn9wmvNXLVQh2+VtVDyh8QRTzJzOMzEs6xBJjSJW+PI/a2pNYTzZziAKXa+CKD+q1gr5Vev83gVL8DOhpzJhza4GSk7rn+CxWhG29fO3HJmWyb3xrcLtbEfgpBxGAGsPY3HDVaXB6FrDdGbCSqj5LFw6Rne4iRxj7gaTvPEGzmGWlJ7MPyhTyCB0iRw0L33lBVPWxM7mQOzQ0opGhNPKcOIV7HXmJeoeghvXZR19gbVvCWVxm3NnfaX6ST3xMfkAnvUltYMEAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729527730; c=relaxed/relaxed;
	bh=SkYtr7pn2JG2itofY99ImXF2puZ7hGJei8s9vBda418=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQBnBIQllQCxTNEPXvx2u2E9ASLF0sCzDyE2E7f6K99mzrYJbeJg5sTsNLe09MoQi19Eq0kGAx/G+szvqUp8q5YM8A+nMeY+JdZq9yV2AghMLwXkdpDEWP0wdtjuYxUpFYCJ4jyFHVzykOzVN0fRf0UAOyD78FNza/Fbtm1+nCG7Ivakca9rKWtAkWXXzaQLqRw+vIrave/D4gr0pe26QTKKLTDXnN6DyGP/9+v4gq5ysPovwbHka8k3VxL6on2Curu5EDiozXrl+qL5ufdZer1htnbKl41xO7kyD91PdyR36f8MmfNzNZU9iINDaUrCEwMy1HlOuq8lzIIR+bUqmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TZJHkajo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=eli.billauer@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TZJHkajo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=eli.billauer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXLDd18dJz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 03:22:07 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so46076605e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729527721; x=1730132521; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkYtr7pn2JG2itofY99ImXF2puZ7hGJei8s9vBda418=;
        b=TZJHkajoIhoJz1HF68ybgY6xixRarCjp9xJIJ8DBciv0CDDzIga6jbbTfpe6tSXZbI
         qqEtnAByWGjiqdZYERDgqdaGvx+1vSafH7bY4311D2ixnJrXZiMXrws1KrmoXpl7HhF4
         nASiEUJ1h+rzofwPBQ3nApGp8pxFtb2ssmpJfNoOgksGbTkPgzgDiaec2hmJUjJqqhhA
         nePwLiZ9FIQeUYnHyr+568KLeUiWP0+2PH1bl5+dLL9Smipulc3fZ/GKich866Hqs8da
         x1TpJyZCA3niViIN5WLmYo5yeZkWRffk112OQIlcMx7kS9C9oAbTaxD3yGDzX+dnTN0Q
         BTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729527721; x=1730132521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkYtr7pn2JG2itofY99ImXF2puZ7hGJei8s9vBda418=;
        b=Ttk/WCaJSdyJeQwa1rDBFba8fYVVti6DABFOFOc74gj3IisfWFBcGy3bWdvJ5IgE5i
         dkXlPjoaBj0QhYzxOY+LvUVCbqyzhQGzhuyap+54MLQejJeYIWCNSuJtPehq0gu6YTLQ
         jAFAmmhfroAq+s34oFCswP3ds5hxZJAigFiDllSrLy3rJxgKWSRJK2TT1lWGA2dr7lOi
         FGqMVGD9b8nNigcUW/sbRZKSV1UENjdNgxcZwSTCi9F3RtvlJokh0u4Jk6rwzB6YZ+eO
         efIJDbLlKLZCTHrN7zB3PY98xQYrC/vJsd1CWPbzHKshZ2rS2dGGmijHJqmMmXhgDv/Z
         wwdA==
X-Forwarded-Encrypted: i=1; AJvYcCUOY5AzLWNtSTAqHss00zy5NvBonC6wTF51ndKm0hdwUVzhIV6A++dv9LpkDakIt6L6UWjRxXxDqcc/Hj0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzptacYalMt0savNZvEqmJDLV7BqAnn3x11o2SNrpi0SC5GwDPd
	mWFZMCtQdWdIiFyX4BCIvQ6QuUPiRPdi8PF7aNSC3o2t3WFxQEkF
X-Google-Smtp-Source: AGHT+IG/G4pnevziazcEE6yb0lEv7rA3+D30JnmHzQovUaRt1On42hhF8Vy1euEwCBGzVoLz0DLWwA==
X-Received: by 2002:a05:600c:474e:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-4316162875bmr97112055e9.10.1729527721163;
        Mon, 21 Oct 2024 09:22:01 -0700 (PDT)
Received: from [85.64.140.6] (85.64.140.6.dynamic.barak-online.net. [85.64.140.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58f2c3sm62284305e9.27.2024.10.21.09.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 09:22:00 -0700 (PDT)
Message-ID: <0ba9356c-63fb-2ec6-59a8-fd7bccff7bb8@outbound.gmail.com>
Date: Mon, 21 Oct 2024 19:21:30 +0300
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] char: Switch back to struct platform_driver::remove()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mattia Dongili <malattia@linux.it>, Michal Simek <michal.simek@amd.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, linuxppc-dev@lists.ozlabs.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <20241021104511.405661-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Who am I to object? :)

Thanks,
    Eli

Acked-by: Eli Billauer <eli.billauer@gmail.com>


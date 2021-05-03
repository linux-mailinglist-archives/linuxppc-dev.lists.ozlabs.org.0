Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A851371330
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 11:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYdVP0P5lz30CL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=L2Okofnh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=L2Okofnh; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYdTt2nXvz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 19:49:05 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2so7199465lft.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
 b=L2Okofnh+nI4KG9D4jS3dPq7uMy7zX3MoaDNsLku2rv1p+JCuCycrUhGQh3bN4jLao
 Z2Tb+ZyHD6Z33j6r11oEs60V4DQX4UEaRNtVuh+dfkUofHMt34GzzhFIaiZxkBhTGXOK
 WolPbOJhWmGB3mhsuTtxXCtcXSXJ2Uz6A88uJD5/ANWNgGeSAKZOHFIAJ+AMqoqWg81l
 WsU5TSq3ktxz/R0cjDVvz47BrNsgljf96EO59UaOhnnunTQ0vRpmMHQeHkEmFeNTAJYn
 ut8PZdGMT+DOEEpC2A8g0Cg21jj7+3AWVikbjJtQgqXCEzDx/TPEs1Eb14TG1oOUEBV1
 sp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxJLb+ygPOSc1s4jkTCr3WpnkstsUG9OT+AgF9yJyJM=;
 b=YkzhB7uVuLE343StWw/Z2vY+8wGM3mU/GtpMW9TwKaf+Op6voXjVDUbdWOLJh9mLzk
 HxAcdyaCW3US6jclpQERpvXh9lacrOLumsztpz1pt7oylpe/tKzLXnvKskUQJ43MlU5/
 9puuxXITJM5ggbfyvU+NbWdCDPbcQmiPAUZuRcCkMNV5hWQ9LRN4B7Pv7mEonIz5U2K7
 n295jndnDAV84OWNbcwYquwZS48EV9biOMr4emZ3Qd6WQ+OisaMs/j+NbhJqys88A54f
 C09t/1biuQQz6v22ZwUz1buA2cDv1tYP3DJwowN8ncxVsaf5jlKGDbLQJ2CiaNsbWDAR
 ZmoQ==
X-Gm-Message-State: AOAM533JRR7vaU2kMeDb6Bbg5Sk5MjHklRMCNtHO7tRQlk0qmwijLTN0
 /3GDFBiGanldzlvwlQK8laiNwA==
X-Google-Smtp-Source: ABdhPJzhF/j+aryEsz1w0KLEzdyFZwzZ6xWzP9d/ftzoOA567IhOefWHg93LARjh8yYYNHONoC3+UQ==
X-Received: by 2002:ac2:532d:: with SMTP id f13mr5151750lfh.81.1620035337449; 
 Mon, 03 May 2021 02:48:57 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id n27sm1093460lfh.271.2021.05.03.02.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 02:48:56 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id D372F1025F5; Mon,  3 May 2021 12:49:00 +0300 (+03)
Date: Mon, 3 May 2021 12:49:00 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210503094900.idmjc4zbrxr5sn73@box.shutemov.name>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list.

Distrowatch does. I used it for checking. But you need to check it per
distro. For Debian it would be here:

https://distrowatch.com/table.php?distribution=debian

-- 
 Kirill A. Shutemov

Return-Path: <linuxppc-dev+bounces-1016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0C96CA70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzcbm2P0Cz2yGQ;
	Thu,  5 Sep 2024 08:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725459654;
	cv=none; b=FuqZAHeVuOv222zkulI4qHl2jx9/iT629c6YpCSlrzvWd+K3oMw+m98lQG/mDTgCy//eSReeYOxigilyEuZ8bIrUfw5q/NGEtS12wgssdMRwbE0X55JYLh0UqY0IWGD5E1jlCJg/3KtwpOpoXD17bfPGFdTBkotXxq/AM4CPVGnnGWrI+L3AYQkBm74nB8795YACI5QBgTgQTLpYKFiRqJV/yaJv338a4VFFyGTinwQnte1XXOQxQgeG98R8IucAJtzbfxb4qysq+Aq4n1g3dCFsjooNqRsquYfsdchfLamTgG7XzJ4474Kpq3KybnAioZ70uRwencfx4bGYjArqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725459654; c=relaxed/relaxed;
	bh=XEaydlTYxgFPTPFEB0dzIiGoTyUBH5i3vydc6ziFKbI=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=nLOnyzndRmGBDy2ZxX4SD+XlDSz00kMvE8Zn5+9F4uO7rgfaekNQQmoaBHUGmgC/fRLnweULgkYseTffdXI/54KKqeRK/kHwFYpDsuQ6Nu5yL/E4SOf7sw6It2YMJsKPVMuSanfHfvTj4FyWYg7HY9jIL6wRcvOZjXHAnTBHoLgMCV+0gK02TLs0RROkdgihL3C4V10xq/EPpC/fHvwLnJlsdoXtiOtWgv+du2OUWEdQ5dwpbxGDej4XJku+LT3PznMxmWgHpOK67TjkfTFh+Q6nmqmV1AUi3Gn0eS1DUCJzDPOR+lVqFMmyfO+Rb1ru+OLwUxWZyW68oYRfDt74iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FG3xGvP5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ricardo.marliere@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FG3xGvP5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ricardo.marliere@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzPmQ4GPKz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 00:20:54 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-428e1915e18so55144435e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725459651; x=1726064451; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEaydlTYxgFPTPFEB0dzIiGoTyUBH5i3vydc6ziFKbI=;
        b=FG3xGvP5Jw3z7LPEZSjrRnovGArHMi/qwXKMbwIrfA8u5qmCofpXRok7TncdOQJLVC
         PDUL0Gmqu62UJJA0yMfa2sPLYvF6YmEkhXFWQzuyKofTc4BagyGWMTRNqQk/KbgaJZSH
         pPla3s58AvhtduVY/VGYwNtfh9Lu9c8pm3ttPf15SmeFQQEP/EWtSnjl4XpaEa33bwgB
         W+ky3RrqS95PRm9AGy052Nteba5+VCRyFV80jZo/5mq7QC6drp9CgbjL4s3EjHEp26lQ
         pyOXXOcRNGjEUBZV7dNHXlWIUEQ0nBVNWwTeiju/6UyeZUNO6pphNPl0JStHwSbSz+Di
         Uv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725459651; x=1726064451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEaydlTYxgFPTPFEB0dzIiGoTyUBH5i3vydc6ziFKbI=;
        b=p6jeUeSUA9p8Dx6uV/BTj3u0cZbHhVRhSv04qjBq7z2pIdGXTDLocATsCnMyut3GhR
         FA1jTjF0zz4AGDfU9XeBcsF9Qeke0HX6WRRITaoSgAKPLEMrkrxtBLTMNjoePvDex7OP
         4pVscWtFkrowz8wcwa/YPAl0dGKUHCecoXj1V566NuNsYbwLSEVUdi0O+rMhdxdVxQhM
         V85LBsaMSe//D+Gj4MJ8Pz0HZDkiTxln8Y9uSC/BSUjFNFvS1lJQKGZxGZCHDB5OCw+s
         LOQMix1FMlyRo5qv0ocZl1ZFTrldcVV2rIEsPkoVmlUtq0GfQnaJ5JySvL/sGTtclnTO
         05Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWGZOYR23wd037q8+XK6SOV82CybVoS50fUIeFJCTfxoXppRapttoqvBrW8luf79ibHRhHpmFWrnduxKaY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzN1NYkoO6VCajrKTi8yBeNfGUdqIiff+7geVEXp5YZQZDeS7PZ
	H7t2yjxoINTyfysmAtIV6c2WZttGQ22H1NgbeQrQEqVZLdsnWnl1ePNAZRvCH10=
X-Google-Smtp-Source: AGHT+IFvu23YtmgmJJOspMRG+OZzhhFnyd0zrYzvQFOKRrEcNpovBjG71JDZ6FXxaqiyKIbVMYTcMQ==
X-Received: by 2002:adf:e592:0:b0:371:8c19:f5e6 with SMTP id ffacd0b85a97d-374bf1c95d5mr10916746f8f.40.1725459650472;
        Wed, 04 Sep 2024 07:20:50 -0700 (PDT)
Received: from localhost (189-18-187-19.dsl.telesp.net.br. [189.18.187.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea3550esm14128085ad.124.2024.09.04.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:20:50 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:20:43 -0300
From: "Ricardo B. Marliere" <ricardo.marliere@suse.com>
To: Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] bus: fsl-mc: constify the struct device_type usage
Message-ID: <gbwslua37jhptbwb2siui7jsdhyibfxvhkze7yxy4rra7jgdcb@btm7hfsbahwi>
References: <20240904-class_cleanup-fsl-mc-bus-v2-1-83fa25cbdc68@suse.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904-class_cleanup-fsl-mc-bus-v2-1-83fa25cbdc68@suse.com>

On  4 Sep 24 11:17, Ricardo B. Marliere wrote:
> Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
> core can properly handle constant struct device_type. Move all the
> device_type variables used in the bus to be constant structures as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo.marliere@suse.com>
> ---
> v1->v2:
> - Added missing specifiers regarding:
> https://lore.kernel.org/oe-kbuild-all/202403091124.VOzGG1lj-lkp@intel.com/
> https://lore.kernel.org/oe-kbuild-all/202403090918.89zrHUF2-lkp@intel.com/
> https://lore.kernel.org/oe-kbuild-all/202409041701.8NfSraMa-lkp@intel.com/
> 
> v1: https://lore.kernel.org/all/20240309-device_cleanup-gregkh-v1-1-8ca586ef17ba@marliere.net/

Actually, v1 is at:
https://lore.kernel.org/all/20240219-device_cleanup-fsl-mc-v1-1-d206b8b90f2b@marliere.net/



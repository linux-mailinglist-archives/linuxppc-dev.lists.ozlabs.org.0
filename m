Return-Path: <linuxppc-dev+bounces-6956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59BA5F441
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 13:25:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD6CL47dfz300g;
	Thu, 13 Mar 2025 23:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741868718;
	cv=none; b=dlQWggplYDUYBlfTYLH5yQxUqfakjGnP08G0KC3+RERLBqsWFzzdO40ABQw5tN/kGRcXUK/nBx4h2rmkVst9XinqmSv3j80AWMQlVD9Apj118SDd70wxElHAx7gADHCexlrCQA+PPBdgZJqYMAK81T/UFFJ5lClcW9mjCBOzgvaFwqU1ekJfoEfQ+iTEoJl4+NBXO9B/Cl4g2bOMsHx0g8Kxb6JfDaLzKRL/O5qrPnZkLYfELgPzqR4E8h8oLvMJI1MLodzcklCsjlutC42GFNVnomQNSVe661RJuiV+YIXKNtvbTiST9LJk1FCWSwVVgDqhiMaNbsNcYmwgvQ/oMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741868718; c=relaxed/relaxed;
	bh=vqnyp4/Fq34N9hxm5escP8zbq+JL1T7eSigGpRdWCnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6N6x766N8KEkqvmGwg+njxycO0khOKCig1rlGljF1EdQPEItf0klnhHNrwX5PuSgC3VmoyVCFXDeaTXNIH4dUuD8C6LALz+JbNTw1eErlhMPOqJvOzSNCCzovIPmf2XWV4fEYN6yj2IKC6CAqWCasXKYTCShxf6NPw3Xxo0sEMRyE349RaezXLCDxupFBOEgbV3pxX7zxeN8a+mn5qYUD+q7ZnJsmNEnlY+cHXjCBgRIVjzjsLuPfTBftk0QGqSAhxfqV82ujXVmAUqJPwQbLvIGTapnQN3VqP0QVOLFC/lDK409FO7ouabNZYFwfon3XNoGoFqAuUY47CykJzf4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDz7LQrx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDz7LQrx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD6CK4cN8z2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 23:25:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 37EE6A4707D;
	Thu, 13 Mar 2025 12:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED05C4CEDD;
	Thu, 13 Mar 2025 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741868713;
	bh=VMUOnEKoimQN6pwJj0HJ250fPvnAR+FrAocdRJsHq8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDz7LQrxn+5uMzYuKmUsr/MzQI/7LjUYAH6U0Rv69RHDL6kJTg7T/TlyBDu9nRw3f
	 +yscSRgZu10unC9voBYFntcNfukiIMd+J2bcz0am9R1N+EDQUjRDdCzHDa7E6jAT9G
	 elRWWLQjvLtJ+557HYrrxSzTWHiUmMyB6V6XwrGmcTe4DZAObyymSQ9P/m4v3yKCOP
	 xCAlBAwGAQVNMI3WMjv8hvbMIBFI0Nh29MW5H2CicZPp09a6Qz/dohbQ8rK8OUI9pq
	 70yUl1cBUcyKqDoTT3szQWbiaOW9pyrWRuXo8DTYexs+TSxJGXCTYPsEmUMP7nS12s
	 c+V7rKX2dyaMg==
Date: Thu, 13 Mar 2025 12:25:04 +0000
From: Will Deacon <will@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
Message-ID: <20250313122503.GA7438@willie-the-truck>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114329.284104-8-acarmina@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
> diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
> index 28be048db3f6..044c5e24a17d 100644
> --- a/arch/arm64/include/asm/bug.h
> +++ b/arch/arm64/include/asm/bug.h
> @@ -11,8 +11,14 @@
>  
>  #include <asm/asm-bug.h>
>  
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define __BUG_FLAGS(flags)				\
> -	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
> +	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));

Why is 'i' the right asm constraint to use here? It seems a bit odd to
use that for a pointer.

Will


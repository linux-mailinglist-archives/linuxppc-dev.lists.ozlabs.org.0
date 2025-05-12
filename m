Return-Path: <linuxppc-dev+bounces-8503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97DAB36D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 14:16:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zwz9Q11Zlz2y8W;
	Mon, 12 May 2025 22:16:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747045999;
	cv=none; b=UyIAi2sjoOpUBa12TiWpbbfmvuAaDLDKtG0wsFAwCxkJhnAwmeFjY7NSTe5qanPEpc+U+NoaATx2SUCOUkTgBdFKje369mHXJrfBxpf/qsoB5nvK1bh58jIojyDOEm1n9nGs0ap20BWmZbbPqK0MnwoS2D6Kx73sWmiJuvvpirS3cm3qaySJ0d5ye4nq99fwKYJjWjbwXq3RJJVMynMCWcTLVnBm66EL7J9iv4OV/IlYnu0mFXJAGcuM5otq1DmAOACWne/HeEXOZvOy++rY32TzJpw1gH441VVMib4sPNislE+YzUxuE0O0rT6l3KFPZH143iKxAKd6Z6XYFmcuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747045999; c=relaxed/relaxed;
	bh=/XdrAti4wFCJU0L47hWwyopDkiiX2eOTeX450V75Xqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToOl5ESFJoZ7WAe041Uo5zwxk50bms9Pljai77/Dy/vgYRbPPxMDJknzOkGQmZiY6bakMZQkiRak2+8Zx8hXseeCdX8GDplszg/vdoMw6O5OkJwtaEhCzYOLs2EPa6kP7a62f1AN5g/HMLrOqhz0wMeGccVH8mT/dIOryO2ERbAPH60beKliPRLzRhN8dBei5PYT58f1QeP5jI6mFNxBusb1k7yjn4fwnNalMfP0igledT4rpwGmPs81putJ6pm3Oi3zpjqPqxBn/ZSk7Tsx7at+03RByRVXUCdG6k5/pJ0QoWImUW4i9OyjvSzYkn3/tMUTX69q4QsQGAz+QwPmFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hirqtRRU; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=jacek.lawrynowicz@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hirqtRRU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=jacek.lawrynowicz@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 12 May 2025 20:33:17 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwwtP2JLxz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 20:33:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747045998; x=1778581998;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LNx6d+LGN0UuAE1Kev9HiY5qljRgbBixlBjM7cy0ht4=;
  b=hirqtRRUdbGGk5tRWCc/+qSSguwBRqOIffwWzKMp/DxYGMGBbpd/N5WF
   StcVRdS0XWEF3CeYkK+QezyhYv0MFiaSHcG9hXJV5UMFCXJ061PI2AQzk
   LVHTjOgyjP9LwHtlPzvjJXFhamIDTVzwVHHBsz7ZR5y0P1BPRt2UCA5nZ
   BwEvRRyL/gg4nHfZRLGA1lgQRTqLlhk2Doo0Gkhim6tI9NBF3EvqJq4SZ
   Quyl7vQLJQwZTgY/y09qUsHZw098gbt3ocXbCZPp2nwtg1omX2l2AWThN
   FjGwn1JWceHa1kryHLi7VG0GFo4HHi2K+LoyUsAtvV8N/BBOJvWvv6LCK
   A==;
X-CSE-ConnectionGUID: 8al+byODSt+/rVD8NFaaMw==
X-CSE-MsgGUID: gAEVnsNkR6Cy86LkPxZSFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48832459"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48832459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:32:10 -0700
X-CSE-ConnectionGUID: /G0itieJSEKZW5XGggzgTA==
X-CSE-MsgGUID: y/nPGEjAS+ypF8F9DpOSLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="174474865"
Received: from snowacki-mobl1.ger.corp.intel.com (HELO [10.245.253.141]) ([10.245.253.141])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:32:04 -0700
Message-ID: <60cf19a2-4f55-4330-991d-5ec76ab5a5f3@linux.intel.com>
Date: Mon, 12 May 2025 12:32:01 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] accel/ivpu: Use effective buffer size for zero
 terminator
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 Markus Burri <markus.burri@bbv.ch>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-3-markus.burri@mt.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250508130612.82270-3-markus.burri@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 5/8/2025 3:06 PM, Markus Burri wrote:
> Use the effective written size instead of original size as index for zero
> termination. If the input from user-space is to larger and the input is
> truncated, the original size is out-of-bound.
> Since there is an upfront size check here, the change is for consistency.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index f0dad0c9ce33..cd24ccd20ba6 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -455,7 +455,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
>  	if (ret < 0)
>  		return ret;
>  
> -	buf[size] = '\0';
> +	buf[ret] = '\0';
>  	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
>  		     &process_quantum);
>  	if (ret != 4)



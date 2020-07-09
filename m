Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D830521A888
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 22:04:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2nDv1psjzDr9v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 06:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=jacek.anaszewski@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GkZHcqMU; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2nB409rrzDr7j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 06:01:26 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id o18so3589554eje.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=GkZHcqMUxKmjdVenudvdvqrkXbo+JquPTX2QSgtNobUDUV+vraMZmE9cpIcAdHZJUq
 BsNZoufFprGyxI+wF74biz7ZS11pt7kce+6MsuFWiTDxGPiFDCBKH/FQV0TSZY+pJnKZ
 aQgYU21P8pRSAHEIpMjQaSk+/2UWcXpEmWTHqU2pnGGc+WJE2vTWQaeOqT9pS6Wvbnc+
 FHkBOL1YGb2IRejD/iE8bAHlYDJJb7i6xs3ZqMC0TUpFxaYPBos1PzAaPH3oFvaWN425
 C2K8MZOf+/7LZ1SzGQPQTHQjCyQFHQkVSe9p2Uwwgk+FPt9rtQwguKi6C2OAdfptqC2j
 oImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d0gYY+wvsRxBQmwzqJnWeCjIuXvxeaWsWRCnx0ubZOg=;
 b=bukDOwH9+Rs70xfELBa26LBti8rbLRjVGs3oWJt9HRkQGzGy0B9fMykTq0hHU9XncY
 j2Zzz9ULhBrmfLuiwehfvA4sdrqjB7o5Ai2zZrrF6ngxTLhHdQ2Pvh3QcgtNMvmLTCye
 thD0Ek5uCFKV9kJo9FeM7MllUKI9SdESXO2dKXjkg43xF+OI38HW8WJYhwEqGOX3WJC0
 TxPE0MjOe3PC5JIaJ8X4Ks9XKKNql/lL8MfBbReMhbeLeI/B+ex/o30IGVSgnfUyyl4w
 0uqul5i8GVB4yDwGkitWwB4sE6ERe5YmGuYY3rLrtmfGHUjoUqAs2VL0DqOTv2xdVmhf
 LchA==
X-Gm-Message-State: AOAM533t4zuxgMj3tzFhViq2nIH5YfViuvDW3kpFO4f3J1A+Wq9jwbXr
 dsjeE6OkSH+b1/2RgCZqkPQ=
X-Google-Smtp-Source: ABdhPJxPlnTPprrTFBMP+KVIniKNlWppnSrNKOcRmi8sX8QVrNf9GjrPlFc+WTiAQakw0xXsLbAzEQ==
X-Received: by 2002:a17:906:3a04:: with SMTP id
 z4mr51246240eje.441.1594324883183; 
 Thu, 09 Jul 2020 13:01:23 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2066:8db:696f:8073?
 ([2a01:110f:b59:fd00:2066:8db:696f:8073])
 by smtp.gmail.com with ESMTPSA id t2sm2728139eds.60.2020.07.09.13.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 13:01:22 -0700 (PDT)
Subject: Re: [PATCH 11/20] Documentation: leds/ledtrig-transient: eliminate
 duplicated word
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-12-rdunlap@infradead.org>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <16035116-2154-d0fe-6655-a829a9d36ceb@gmail.com>
Date: Thu, 9 Jul 2020 22:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707180414.10467-12-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dan Murphy <dmurphy@ti.com>,
 linux-mm@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Douglas Anderson <dianders@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/7/20 8:04 PM, Randy Dunlap wrote:
> Drop the doubled word "for".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> ---
>   Documentation/leds/ledtrig-transient.rst |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200701.orig/Documentation/leds/ledtrig-transient.rst
> +++ linux-next-20200701/Documentation/leds/ledtrig-transient.rst
> @@ -157,7 +157,7 @@ repeat the following step as needed::
>   	echo 1 > activate - start timer = duration to run once
>   	echo none > trigger
>   
> -This trigger is intended to be used for for the following example use cases:
> +This trigger is intended to be used for the following example use cases:
>   
>    - Control of vibrate (phones, tablets etc.) hardware by user space app.
>    - Use of LED by user space app as activity indicator.
> 

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

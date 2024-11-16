Return-Path: <linuxppc-dev+bounces-3316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4109CFD20
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 08:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr5rv4B4hz30W5;
	Sat, 16 Nov 2024 18:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731743983;
	cv=none; b=JnVZm8x7doehrfRsmI2Sge5Ki0zfPY3X48cTZaqYSnA4gQtzwPHob+8mtlAKICCLK3FEsf5VrjQwh5HsUVOxJMYpHQ8jc+iGDNRcrov009nK4VBm3JL7l7Or1mwzzsDDoiClkT4I4BB287HJjbE4PYMM2RrYp03cnhOJSgTvE6yCmz5nbbrok308XqcrGQfgtDrCPKk8arhTk0ZimZtOvgdBY1CeucqOR4h/XVmh4rHBFHBv8MnoQy/b6uLT+zpSVXwsim3V4GlukawNh9cSh08tCfBrBmheZ9+gNST5t/KvIZ4GuJgWYYIrV80wYmfop766OfWfQEzRQVUjWzB/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731743983; c=relaxed/relaxed;
	bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeB4QANiuhhwWLY4LOmJoavWddxsymP0Z88k8sqf7QLL990gZkfNJuIJm/qi30fAJx4QGWLzc9IIToAuaHyBbk8S5TUiwlvyoaiMDL8hc59HjUAxI9UmAcXHlfDssH7Gvcp3cL34BsRqm5+/vQvRqqvdTczaY8+nDYhGYO49uEMY4LemasTaMrs9vZdNFzs0pfN08qQMeJmkB/FQkrWsDuRH3fD/Xs2Ld19F9PvvRjIZsVb23zJDJut//WPZkgn5pGmeKuf7e8NQiqQ5QRQJnqCPnaHJ60fxyGf+2zvj6DBn5k5CLCYChdz67G/aJpf4kcaQB21yi+ttvoxRMl4uvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UWFcCUSh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UWFcCUSh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr5rr3j7Sz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 18:59:39 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4315eac969aso14377245e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 23:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731743974; x=1732348774; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
        b=UWFcCUShlXiAUOznkc2TXTVjoO72/c+R6Eb087y192v7GLKTF4rD7AZTatVHXqHc59
         wPR/dCbZWKbogO6sUmZz0Z0fv/RyKhv4W2Ws3vEqf6N06V7UOSmQq+f3W3RjIQLFjDGC
         gHVTw8o2/jI12pvgBaTj8lgMFYxhG464F3I4hnXMmUZT/fKYD3avmslvzj7LEozUIdOQ
         PF50EQjWJu9TMYYAi0vnuQu/omu+0n0sxK+PWM0x0npLQ/UJGvn6cIzslJn100YQBpRW
         Yt/C8X/93s7ufUuYXJPh+Hh7EU4/hSr3ghi2HfLz8Tqa6T34Ez556XQ3AK2T3mNE+C8k
         jqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731743974; x=1732348774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrsdExZKqTlwoTRHJD0ZdQo7yx2uU25FrNS0bU2S5+Y=;
        b=ik8NY4VFLubmGLPg4E3REZ0zh+Q36M7uRbPwlAug+9mzxDOSvYqfmSxv3aPKLE1dIh
         6bJ67uyvv4GiOaDRP0vcsGMo4DwuivfnHFIRKIWL86NVrLOGdK2bIh/hWmh7Wz5N+XFn
         B4zW1FvUkWOhqoQ/Sg28lrqS/pNi5mG1P2bhwSraeTa1RpC4tWDCEjA+8k7+8Q2EX1RM
         8LSm8wh1MnNaIsTCzlP1lMHqryR1RLHxp2q4DcRtf6waNEKhT9a6u+O9oimEhoKKhQWf
         lEW8KZp0YJWDwlfEpkDIvpIMfyBJiUgaZkE5QYsdemWr5CmbpJSNPMjoHwAyp334DY/B
         My3A==
X-Forwarded-Encrypted: i=1; AJvYcCWutQ9HQp1ty1tKt80YOcxynYHLF6HEXR0/ZayqxE1eO1G6iSv8svVbxi8WgChyxFirtx9/T/U7Ve0q568=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/lf/F6Xr2elRzPatM2EN7l6x91BjrwWMKituqn8QFZS7QYFmK
	mK13oU92SUxolbKDZHDQfevfJT9HD4Bkvs6jgd9dJwXXhe8zBzn/lfELc8p0ksU=
X-Google-Smtp-Source: AGHT+IHwPca/r8TengkDOJBkzNMy5+IC+M/DjfY5vaIp0XwfqGKX+JdkORZRtZVKPaDZkydKQ4+r2A==
X-Received: by 2002:a05:600c:19cb:b0:431:559d:4103 with SMTP id 5b1f17b1804b1-432defe3203mr49400585e9.7.1731743973417;
        Fri, 15 Nov 2024 23:59:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm81445685e9.20.2024.11.15.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 23:59:32 -0800 (PST)
Date: Sat, 16 Nov 2024 10:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Louis Peens <louis.peens@corigine.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 19/22] livepatch: Convert timeouts to secs_to_jiffies()
Message-ID: <896c656f-6d8c-4337-8464-7557c43a80ab@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>
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
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-19-19aadc34941b@linux.microsoft.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 15, 2024 at 09:22:49PM +0000, Easwar Hariharan wrote:
> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>  {
>  	pr_info("%s\n", __func__);
>  	schedule_delayed_work(&work,
> -		msecs_to_jiffies(1000 * 0));
> +		secs_to_jiffies(0));

Better to just call schedule_delayed_work(&work, 0);

>  	return 0;
>  }

regards,
dan carpenter


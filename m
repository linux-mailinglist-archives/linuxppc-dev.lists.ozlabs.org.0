Return-Path: <linuxppc-dev+bounces-3327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CF9CFE3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 11:40:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr9QW2S9Dz3bcS;
	Sat, 16 Nov 2024 21:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731753635;
	cv=none; b=Dr2qlv9z+61kIP+yt1kxLGTetoyRlsLroDBKpBRnjZPJyVlic8CRhe0o6TApRyYf2oBTR9CsXQejfWeOMgrXs+ht/O5cVx2Ph6D88PSGIyALxHrTpwTUE3Jl+MEpzyH3gW0UwQrryYL5eiWrMISekwthxV2jxwHyGLaNR1L0EeBsgVGLdrcJls912jIwMlZyCJmRCz2zV6QHbPkEKiaBpxpv5eHAhU2paE++UmZR03cvEGvEDbX1MjpdETHAAqYU72w4urdQgLc+xWIILQC7C/CILajs1vB5jZINcvDi6/qKk2T2ZiI1kYW3VzxvQgs8ezfSEtXmIKE9vIFB/WXsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731753635; c=relaxed/relaxed;
	bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0IrN+vIaXJEK6H4b4PxjVxL/qWW6NvgrY49H3zq0ZW5RRuZWvLCahOhjoVjDjVZ/h97y3su0dsT6TLhLwL8frqoIZq+58OlliQfOkMERVGaPz/ml/5MafW9cJOzgM1BpVttovUdc6AH+x9bENRLzkPe4ClzKqPt0buToEAPrr/Dr0ltLz7C4HTwvIqZ8c6+h8DVApCdC7X1I06dQwjLTKgcB+7kTZa+NxLwSCzFiWFByJFmo1vwyE68rmB+JAEgsUXLUejvK60rMQKE4EFY4cRtqOaQ+OTCTiO4BjgUkJYqZe4WiVRBJALnaQCs5JCVOC3A2omNoaC1gXY8qpHWPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KlG2uH1E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KlG2uH1E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr9QT61Tdz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 21:40:31 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so23100455e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731753625; x=1732358425; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
        b=KlG2uH1EiJnRTOIWwMRien59oW6ult987aUm+OjSBdThvNZcWFMY4J0A9PQWnZmHHg
         fO/OCBt04skoTQ/rvVjdsYPZdpTxf/OYNJXrrSf8I2IsutfjsipROV5dWbbO+NggEMzO
         6rjI2jKkT1cupt6Ix+n3snzbZdE8H4db0MO3H00K4rng4wdqWpIdlYVoFe/nhTaObHFK
         mrPnpkrKioSoan1mEzLWHl5Pzupttoa5Q2EzCC7dilGKz52UFxmVGIc8YV3krEyRs2ZT
         vxILP0/z+//e0+cWw1jnesA5dw4jbqnXd2cDILYOrXaNbthGc8386XeEJ+M0K/pJsLGT
         YmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731753625; x=1732358425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSXFKM+ARjNBrckMO4jvpnEJoLVPjxN4kzAqYuwUUFc=;
        b=kl/u20W4MvjhRb8jJYxEcTkRKKr9lmPPG/9pKfLAJmMG30ctExpIn5itBp8oOHC23E
         OES5ub2MBb51rJwKD/EfmIZIHU33LV6fCb+LuvtjGRFogPo+yY/GK0ocEs6oQqYrbP6y
         mbD+aPmNDW4hwBkOnovx3mtipI9qjOgVfE92oxpyGXHuerpnj7ikBi3F4G81xJzVIK+y
         49maApsMjCn113WoDXpYRhv2OpxAoZGUOlhPG64/tC4G+6XfMPtt5Z46umm+LdvyHnnB
         6fiHPgSbq6hVVkd3+mcZV84sVLHkfp9adMDL8zyIdyh5aMRHwf1Nmbarr9XFSo4Sp70N
         bYEA==
X-Forwarded-Encrypted: i=1; AJvYcCUebtEIUqZjFCoj3pn+lztaDEv27asZRxs2E7t1uESAq5Ah8eVcfAlJ9VvFxH7EpS46BWAwpsroIhzYyKM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU9Uggm8PgtOmrgHd8c8a50e7fheIAQbVOKaXhC2PELJXohlvS
	Pa3bPfIqPg08An/OMwn9D5JlYRUoaqSldxKoKXKi4f06QnPRD3zCPOmufpfSjCE=
X-Google-Smtp-Source: AGHT+IH8fBA+4s5F3P6X/kjn5LT5A4plOne9CKmDoZ8QUK+uLzjM3K0QAglApJbsapoZYtb9Ft2RHQ==
X-Received: by 2002:a05:600c:1d1c:b0:431:4e82:ffa6 with SMTP id 5b1f17b1804b1-432df78c5b5mr46184285e9.24.1731753625076;
        Sat, 16 Nov 2024 02:40:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da2800absm87243245e9.25.2024.11.16.02.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 02:40:24 -0800 (PST)
Date: Sat, 16 Nov 2024 13:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
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
Subject: Re: [PATCH v2 05/21] powerpc/papr_scm: Convert timeouts to
 secs_to_jiffies()
Message-ID: <e4872a15-ff3d-4619-9b03-c7f0b6230934@stanley.mountain>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-5-911fb7595e79@linux.microsoft.com>
 <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
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
In-Reply-To: <b6a059d8-7b23-455d-9ecd-eb3cdddd22a2@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 16, 2024 at 11:06:55AM +0100, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 9e297f88adc5d97d4dc7b267b0bfebd58e5cf193..9e8086ec66e0f0e555ac27933854c06cfcf91a04 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -543,7 +543,7 @@ static int drc_pmem_query_health(struct papr_scm_priv *p)
> > 
> >          /* Jiffies offset for which the health data is assumed to be same */
> >          cache_timeout = p->lasthealth_jiffies +
> > -               msecs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL * 1000);
> > +               secs_to_jiffies(MIN_HEALTH_QUERY_INTERVAL);
> 
> Wouldn't it now fit on a single line ?
> 

Some maintainers still prefer to put a line break at 80 characters.  It's kind
of a nightmare for an automated script like this to figure out everyone's
preferences.  In this particular file, there are some lines which go over 80
characters so sure.  Earlier in the patchset one of these introduced a line
break that wasn't there before so I think maybe Coccinelle is applying the 80
character line break rule?

There are sometimes where the 80 character rule really hurts readability, but
here it doesn't make any difference.

regards,
dan carpenter



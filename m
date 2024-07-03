Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D63FA925523
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 10:13:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z7vr4N5w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDXbk6n8xz3dDh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z7vr4N5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDXb12QQYz3c5W
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 18:13:00 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ee7885aa5fso16480631fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719994372; x=1720599172; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
        b=Z7vr4N5wK+PfsmDoosEdi+DaRH73JwLFlPEV0Txd5IAup9sdGnHIjSLqzMiJqQSPjs
         aYRIaYPZ5J9V8IHHEpbYuugL3wOUUU1ucYB0QCaf4iZTcnA2LsxRAIvdq6K/17WmuETs
         Sitb8MEpETBMr2Aj5b4A44ugHnvmw69/SG43UGKvryiFRSEdCaQtoqlRHmExaQ38Eect
         h9wFfJ+O8X1pJKTa8eZMjIUn7LJEVtRie3dWmM6QpQBepMBMS/UhAL87xWE1NOyxl4fi
         SKPADxswY33CIuMJtVUZONbBvfy8v6VwFaVhW5ogl6IMaXtg1JKq6gTDVjUlIHaPzQQ0
         kpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994372; x=1720599172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdyT6ioPy1VNeKmL4j3XjcoiZwneAHmBRTL0mGefOq4=;
        b=vQpDUrqLus9Uu6g7se47LSvIAZFl2Z6VCzoq3WzqExSU7WOuPUp1bRu2nwCzGli0rS
         E/KqKBcA+zKF5bVCt5GpZN3E1DRN1qFLnNLTJHEGmm6OBhqOxMXr5Ue0TC79HRPtqIQJ
         asxrIY/olOAsp1CQ0PiF7/kJHxgkJCs89hnEcpsPi8WqJaVS1sdTB2fFZmT3qUjhEzUY
         zfcOQ64ztx8Uy5ic7xEl68McuWv/P5NDOJ211Elw+b06uYxxpK3RN52kbCv6dEwi34fQ
         nmyWvQe1ExWlTv7MDBhG2nE2tHcFgW3vzMHjIX0CuppkB3lqYk/p74RUajae2aE7+dWT
         NqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy5iSUilF181XjnVF+AS8J1H8lfCqlpghO1GOmTCM9jFMdt5pW0QRXLa/4+q9ojmf2GmJtRJjB3YOXzuhJNuNdgpUAfuRQPB+jiG0/nA==
X-Gm-Message-State: AOJu0YynS8HLOZdWLJTZgvQoGQDkZUymmsiqjPxbkoRYFhUz8Bz3KDkR
	zEcxLvU8UtihN3puRNCRqOfRjg3hdawHcqXLFh/FI1ziRk4kx9BwS+20tMgCw/U=
X-Google-Smtp-Source: AGHT+IFCrx5O8SyoDb7pv8NJaiksMiDUk0MIzdtkS+naCkfqpA17Gjg/ppieWiNLDo4J+A42AblrZQ==
X-Received: by 2002:a05:651c:2010:b0:2ec:550e:24f3 with SMTP id 38308e7fff4ca-2ee5e337c3emr70900071fa.10.1719994372235;
        Wed, 03 Jul 2024 01:12:52 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb0c2e10dasm15659175ad.223.2024.07.03.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:12:51 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:12:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <ZoUH8S4j164Ovfiq@pathway.suse.cz>
References: <20240702122639.248110-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702122639.248110-1-jfalempe@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2024-07-02 14:26:04, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new struct kmsg_dump_detail, that will hold the
> reason and description, and pass it to the dump() callback.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> 
> v2:
>  * Use a struct kmsg_dump_detail to hold the reason and description
>    pointer, for more flexibility if we want to add other parameters.
>    (Kees Cook)
>  * Fix powerpc/nvram_64 build, as I didn't update the forward
>    declaration of oops_to_nvram()
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Looks good to me. With the minor fixes suggested by Kees:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

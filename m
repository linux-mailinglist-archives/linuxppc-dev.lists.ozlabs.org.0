Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F46807B2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:11:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b1jaj+8Y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b1jaj+8Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sls7d5tYrz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:11:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b1jaj+8Y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b1jaj+8Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=hdegoede@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlgZy4hC5z2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 02:01:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOg7HAEWpXF9CsdFUNxvCGFVvkmTsr7J73fSYQBJM0c=;
	b=b1jaj+8YvulLpnk6iQgP63fVMH9z7hewjVC3bqTRrZWLwxd3JTyrPsfbG5FEWbgrEuhW0t
	6p5IkxpFAJklLfoMwtkljY2GVinNUmMBfRpmJ4JmtoLmpdbH102LSJ/OBAkoXBFvjNJzZ2
	Rc10upjv1V8HnayPCo1vT5jCD3K5kas=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701874871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOg7HAEWpXF9CsdFUNxvCGFVvkmTsr7J73fSYQBJM0c=;
	b=b1jaj+8YvulLpnk6iQgP63fVMH9z7hewjVC3bqTRrZWLwxd3JTyrPsfbG5FEWbgrEuhW0t
	6p5IkxpFAJklLfoMwtkljY2GVinNUmMBfRpmJ4JmtoLmpdbH102LSJ/OBAkoXBFvjNJzZ2
	Rc10upjv1V8HnayPCo1vT5jCD3K5kas=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-HdCx8qMrOi-NmuPMaInsxg-1; Wed, 06 Dec 2023 10:01:05 -0500
X-MC-Unique: HdCx8qMrOi-NmuPMaInsxg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a1c915eae11so101602466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Dec 2023 07:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874863; x=1702479663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOg7HAEWpXF9CsdFUNxvCGFVvkmTsr7J73fSYQBJM0c=;
        b=l2Qyb+1NeTwWOq/Nwexx3AD7Dxel8BIbvfkYVZ/1bhcAHQ3T8OZKH9r1sTRVDamTbw
         lNtCnzBWbQzwp1El6XWyCJpaJtJo5UGn2hGkbtcBiV1sMN1KfYlkv4hNpX6UXEusbnab
         QRO+7nHJKiJ9dcaXpjgSAxnazk/O+EBVJrdjaBYNP5NY7pl+J23MAUo3Ou8UXwNeOMDs
         xDZPoLE9prMq58irCzKB/tDMDn3syJ1H738PfS1/CA9Z1Xtv5L4toEm2lOU/vCaLPi0n
         u8VDw5lmtzZ2X4UKjjFB88p3tbf1M75JIjgVHc3JJJ+sPrif8A+TJN7zEhayQ9F5bw0Z
         kupw==
X-Gm-Message-State: AOJu0Yx65IpFNOgFuWBVS+115oXZhmobkortgrltR1iEcYqbmu5s1Vog
	QoeanKv8ZjHIzpaxPk8V+4ba91aocduVDPNbSgrgBHqSebsgf6DnF49XstQEl8tfOCkr7PbYtED
	8oUzPNoBgjlFzaOyH+ZaWrRtOLQ==
X-Received: by 2002:a17:906:207:b0:9ad:8a96:ad55 with SMTP id 7-20020a170906020700b009ad8a96ad55mr3351768ejd.14.1701874863010;
        Wed, 06 Dec 2023 07:01:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc2iizgPGK0ASX2Lu5JUlmiNsXLAMQISUNLo9xAMCsPCxJYJkGgUwN23XU1+bxfd5zfQWGqw==
X-Received: by 2002:a17:906:207:b0:9ad:8a96:ad55 with SMTP id 7-20020a170906020700b009ad8a96ad55mr3351759ejd.14.1701874862671;
        Wed, 06 Dec 2023 07:01:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709063e4700b00a1dc7e789fbsm31636eji.21.2023.12.06.07.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 07:01:02 -0800 (PST)
Message-ID: <81798fe5-f89e-482f-b0d0-674ccbfc3666@redhat.com>
Date: Wed, 6 Dec 2023 16:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, mazziesaccount@gmail.com,
 andy.shevchenko@gmail.com, jic23@kernel.org
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 07 Dec 2023 09:10:12 +1100
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi George,

On 12/4/23 19:05, George Stark wrote:
> Using of devm API leads to certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() is
> extended so introduce devm_mutex_init().
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  include/linux/devm-helpers.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..2f56e476776f 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>  	return devm_add_action(dev, devm_work_drop, w);
>  }
>  
> +static inline void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:	Device which lifetime work is bound to
> + * @lock:	Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>  #endif

mutex_destroy() only actually does anything if CONFIG_DEBUG_MUTEXES
is set, otherwise it is an empty inline-stub.

Adding a devres resource to the device just to call an empty inline
stub which is a no-op seems like a waste of resources. IMHO it
would be better to change this to:

static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
{
	mutex_init(lock);
#ifdef CONFIG_DEBUG_MUTEXES
	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
#else
	return 0;
#endif
}

To avoid the unnecessary devres allocation when
CONFIG_DEBUG_MUTEXES is not set.

Regards,

Hans





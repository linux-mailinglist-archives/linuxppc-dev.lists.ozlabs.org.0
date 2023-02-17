Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF069A746
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ54m27hvz3f82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:46:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDXv6NZX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDXv6NZX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDXv6NZX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDXv6NZX;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ53s14Xzz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:45:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OWPvyQo5Di8DnoAQZc3ZeTCHhUwyb2tH6aRDiwDRUPc=;
	b=gDXv6NZXvJOPWChc0Emb08wori/SMZGRyixMevIUtyB2SvimOoAY1kOB9CdRUbiQ7PzNWA
	ltoXGYFkcpO9rBeIAZUnW7DfZmNWEWBS/PS6HkAN1QS0n3f98I088QqmdSki3RRTw78xJ4
	CWYUyCZ0RZQ6Ltsp3j0jP606+6bP1F4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OWPvyQo5Di8DnoAQZc3ZeTCHhUwyb2tH6aRDiwDRUPc=;
	b=gDXv6NZXvJOPWChc0Emb08wori/SMZGRyixMevIUtyB2SvimOoAY1kOB9CdRUbiQ7PzNWA
	ltoXGYFkcpO9rBeIAZUnW7DfZmNWEWBS/PS6HkAN1QS0n3f98I088QqmdSki3RRTw78xJ4
	CWYUyCZ0RZQ6Ltsp3j0jP606+6bP1F4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-ajqY9XGGPOKRXasuLdgUYg-1; Fri, 17 Feb 2023 03:45:07 -0500
X-MC-Unique: ajqY9XGGPOKRXasuLdgUYg-1
Received: by mail-wm1-f70.google.com with SMTP id m7-20020a05600c090700b003e2249bd2b4so442918wmp.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWPvyQo5Di8DnoAQZc3ZeTCHhUwyb2tH6aRDiwDRUPc=;
        b=JlkQNiAAtfLaiawBoAFnnwWYE2j8B6XRKet6i/asFEK6Mq9lAI5tEP0Tt+nF8OTDp+
         tCTEK23eYXIgzA7tAlFJNab2ThOv7U9P38ub8Z+Y+1Uuth5SXQk2qce4xcVroynys9MA
         mskjqYnNgpEKr8O/ySsuAzjIfdQoCcpteR2S8NfnQ1feKc+PQPZtf+smYN6cFLURw427
         oksFIR8Ct+HXBYAiCJDTw4K6BoqlyI8I/Q28uQQT0cLXpuyGBSQPiROfny1oIg6P8msO
         bhm2kkm806CM7/zRet3aH73k0AR+gRQkGmpjyKldC5MpI5Jr/G1wqcP5M14ATz7CxlDa
         1e8g==
X-Gm-Message-State: AO0yUKV0muxKnyVM3UK8WyxMB2jNbLmUsdT5MGnsX/+AgasEPRGZHq7L
	d9NSVe+ETzHROktKMr7hXyKS3ChzoNKNp1oWhOGR8a+rrZHuGBGbQNf3zubVw0qoKB6UKAnWtdv
	/HKzUY2KBqpimLWjwC6STWVzMQw==
X-Received: by 2002:adf:f78c:0:b0:2c5:48b9:72ff with SMTP id q12-20020adff78c000000b002c548b972ffmr6450614wrp.27.1676623506496;
        Fri, 17 Feb 2023 00:45:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+ur2aLbFCoXfxBM8gyiXnFXtYx7YTDiuItlpgrcu7ssIQYB1jqId9yQOYwAKFhH5jVOwxbag==
X-Received: by 2002:adf:f78c:0:b0:2c5:48b9:72ff with SMTP id q12-20020adff78c000000b002c548b972ffmr6450601wrp.27.1676623506241;
        Fri, 17 Feb 2023 00:45:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v6-20020adfedc6000000b002c5544b3a69sm3552710wro.89.2023.02.17.00.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:45:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 03/11] fbdev: Support NULL for name in option-string lookup
In-Reply-To: <20230209135509.7786-4-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-4-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:45:05 +0100
Message-ID: <874jrky92m.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Ignore the per-driver video options if no driver name has been
> specified to fb_get_option(). Return the global options in this
> case.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

I think you need to update the kernel-doc as well to mention that
@name could be NULL ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B269A74D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:47:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ56C0Z0zz3f8k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:47:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMf7EBFh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMf7EBFh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMf7EBFh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMf7EBFh;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ55G5gz6z3cfl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:46:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
	b=JMf7EBFhZjUjJD+bV91DGj1t50LNFDbJwA6WXf7n/5WCK/cDSFiKRA30qcT8qSvjTBd8WP
	xQX9ILqoV98MuSWn3FEjUhQ17N7YEOBaFRoxPYdDLQkCMOtJ600EjqZnCayGCQcx5QZsQM
	nf/KdGorYXAFATdp4cBhyu+Li/ORVDI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
	b=JMf7EBFhZjUjJD+bV91DGj1t50LNFDbJwA6WXf7n/5WCK/cDSFiKRA30qcT8qSvjTBd8WP
	xQX9ILqoV98MuSWn3FEjUhQ17N7YEOBaFRoxPYdDLQkCMOtJ600EjqZnCayGCQcx5QZsQM
	nf/KdGorYXAFATdp4cBhyu+Li/ORVDI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-356-BChXH56API2s6gO20gdvQg-1; Fri, 17 Feb 2023 03:46:22 -0500
X-MC-Unique: BChXH56API2s6gO20gdvQg-1
Received: by mail-wm1-f72.google.com with SMTP id m18-20020a05600c3b1200b003dc5dec2ac6so373573wms.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:46:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
        b=CUv/I9VWoSjvd/XaU5+Wcd5JsG715W4oYiPdLEKge/J4fUYhaUed5NR9mFVSMNsxKw
         sWTsW78o05QHB1cY2fy5OPp+QvW26jJyX4gm08O1ZfaX5Y+nuHtuKL6tOifkL7MpclRb
         5uGtNYLSpvwHb9zbGDKgbVcWblOqWJLL/AwNcCOp8wko81np1BiAOSGAhd0ua6kvXs3f
         NcHPu1zpIDqvy7vYdAtdLszvCamCDl35ZYAbIVRYneK/8BD2rLR1VD7a3n8OBuO6gJhj
         dKekDQCYrPbqPpMQfWPALohQJdeN9Pp1bCHRye/3cSoZxaI+XLYfQr0mABn+cJyDYyBT
         IzfQ==
X-Gm-Message-State: AO0yUKU3i9mQXUoeXcXfP8qjEn0Q9qfFySoOyDW0AQ5vZAo68r/rRqs8
	2Rr0OaL7kKQohptAgRmbm9ohTHc6aF9I5O/MKcI5uxWRcE19QowRZ6/M4ZySg8a3OJgKjQ3tvCx
	GM00pTTp16rZJivIPvxstQdQRsg==
X-Received: by 2002:a05:600c:4d8a:b0:3e2:115f:4052 with SMTP id v10-20020a05600c4d8a00b003e2115f4052mr3403437wmp.17.1676623581800;
        Fri, 17 Feb 2023 00:46:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9+hq4+2Bza33qEvtq4Ut8E7x8aQSr+iMyJJkN2Oiss1vlbpJK+6bKPo4cnPxZn5QWxBOW1Dw==
X-Received: by 2002:a05:600c:4d8a:b0:3e2:115f:4052 with SMTP id v10-20020a05600c4d8a00b003e2115f4052mr3403421wmp.17.1676623581539;
        Fri, 17 Feb 2023 00:46:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c1d9100b003e21dcccf9fsm2587825wms.16.2023.02.17.00.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:46:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 04/11] drivers/ps3: Read video= option with fb_get_option()
In-Reply-To: <20230209135509.7786-5-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-5-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:46:20 +0100
Message-ID: <871qmoy90j.fsf@minerva.mail-host-address-is-not-set>
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

> Get the kernel's global video= parameter with fb_get_option(). Done
> to unexport the internal fbdev state fb_mode_config. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier


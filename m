Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2196569A75D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:48:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ57f6dssz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:48:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXTt1BNv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXTt1BNv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXTt1BNv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXTt1BNv;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ56g5zlxz3cfl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:47:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
	b=OXTt1BNvzCXvaOXn10V15wbFCJ+EnKtM/j0M5/Cm6WFAO4CeLFgRPlMTgZBJFm+fyou7hh
	bjq/olu6UqkrIhYRB/lsDULyigUHyggIjCRJqeLQUBHfg0H/4VweW03dEcjWIDf6Mp7iPN
	kLXuB80ilkl8FAWV2K+E5YpT13AAVTA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
	b=OXTt1BNvzCXvaOXn10V15wbFCJ+EnKtM/j0M5/Cm6WFAO4CeLFgRPlMTgZBJFm+fyou7hh
	bjq/olu6UqkrIhYRB/lsDULyigUHyggIjCRJqeLQUBHfg0H/4VweW03dEcjWIDf6Mp7iPN
	kLXuB80ilkl8FAWV2K+E5YpT13AAVTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-BNvRtD4KM6CR6c8GLh-nYA-1; Fri, 17 Feb 2023 03:47:35 -0500
X-MC-Unique: BNvRtD4KM6CR6c8GLh-nYA-1
Received: by mail-wm1-f71.google.com with SMTP id n6-20020a05600c500600b003e2036a1516so333517wmr.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj7ME0Zls97ljpljDJh+52JR4W0iO9sdC4iOpN3awy4=;
        b=22+KKxCXZSGPi8SNY8D64k8TkmRswoBPuiH77cRA43ywIQNMNPXyHddeIObbtdZ2IS
         2Bl/ZTEsCL5aZlbtHIo++jDw5XVdmHHS1uDJImMbdFzdJtIIvk5gWulWKDmkUgEne4YE
         yNmpoTNl4zuadSjG/QOCzTJzta47marZSaNws04iImxJunhch7Aqyz77pnlib75JexCW
         M4GztihVU4moaSGQvI3x7D2gZkfyLFuik3xO0cj1tapdw6kJESBuSYlgM5AnGsBEFXtK
         4f+8Fl+dyqemqIlGEAgM+/IzVLsFT3v9LpnJ2jUayzyHLD+YBXMqEza9xph3f0gctp4l
         vfXg==
X-Gm-Message-State: AO0yUKVkpmFVx4qb8Xeit5XvIFuzNBlZBbpZTeG667m4lhR4O+nSt29V
	L5o3nDKBIa5wrtu7ESq+Jp5rYgaE1wn0282jszwEVkjXyQOr5SzApsNIKYoMn1LUqNgoV110Lse
	ithkkz2h9/QXObpkClxnZ9XKANA==
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id bd6-20020a05600c1f0600b003dc3b2907a4mr3949705wmb.0.1676623654732;
        Fri, 17 Feb 2023 00:47:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8S21a9xd9g881WvJoZPdWpHm1HFt5AhnZt79SXVbCgeie8WxKuAJO0erg8jgYguXWLyobjnA==
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id bd6-20020a05600c1f0600b003dc3b2907a4mr3949692wmb.0.1676623654489;
        Fri, 17 Feb 2023 00:47:34 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bh25-20020a05600c3d1900b003dc5b59ed7asm4471660wmb.11.2023.02.17.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:47:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 05/11] fbdev: Read video= option with fb_get_option() in
 modedb
In-Reply-To: <20230209135509.7786-6-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-6-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:47:33 +0100
Message-ID: <87y1owwue2.fsf@minerva.mail-host-address-is-not-set>
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


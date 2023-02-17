Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5769A773
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5BS5pldz3fBf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:50:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZbPd/3Lu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ECSYRXST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZbPd/3Lu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ECSYRXST;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ59Y5Zxjz3c6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:50:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5eirPtt0bDDD0VC8/0ooXO+OVuOVuv6YKo88N359qI=;
	b=ZbPd/3LuK3BUGzjzd8Jfvy8L7WyKFy/7kwEXwNZTDEfpY0O+cfIjHNbzkSy6qf7O73Xvg8
	Y/mjja267wne2xuaOluIHuCgdbHidp+AsAp6uamL/lRUOtuSGZSI2MwwdLJqfcqYE3hv6R
	u/ukamc6h2htvMRmdxxtS/qczKLD9+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5eirPtt0bDDD0VC8/0ooXO+OVuOVuv6YKo88N359qI=;
	b=ECSYRXSTMjwrnbeRUgrYyScryv/Fsh1aDGTNWR5ZzMoeemfEIvFu20PvF6/z61WO4ZcuNA
	QJ4cVRg2blkP49Ql6Iwxzel42+3OCw9V1x7X5iHnlfeeF+STMjwwChTZ9bjcNDAvaydpEu
	ThlRL1aTLW6zNOeWp1XmkFLb3FYcUZU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-WCfOiQoAPnuzuORg0-5U_w-1; Fri, 17 Feb 2023 03:49:59 -0500
X-MC-Unique: WCfOiQoAPnuzuORg0-5U_w-1
Received: by mail-wm1-f69.google.com with SMTP id p12-20020a05600c1d8c00b003deaf780ab6so308419wms.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5eirPtt0bDDD0VC8/0ooXO+OVuOVuv6YKo88N359qI=;
        b=O102FlIMrVaIMCVGTE071n3vPvFx0tIqWU79QethP+T28RHKmWep/jEm52dk3GkTik
         oxl5ox4ncVDbLno1O03XVwFJ7uoOre1C6My2gafKG04rSCyR8Px6F4E8PVy2Wib9oXwA
         GeU23QbacfRhSSswofU+2y+oWvNyYHspCR34oZs1oLyuf1NEFESRTfeisRJ4PwS9xC2t
         6ZipzZSNi8jIsOUON6xFjJR63oLN69Q6G3JsovBaNsY6y+cP1vV/an3GYsaBhJXyQhhX
         tvf8b7spAf7n4aVSnraOQif4lBshsL+LQtnNje6SvYCLK9+iKHustq0UpHOvcdJG+opP
         LJug==
X-Gm-Message-State: AO0yUKWjqZRtzN/mS1GxH3cesRrshFFl8gnzEgd4ZxlXCZRP2fL+NxhX
	5zIDhLTeNppqewHRFEToJUi4WMLTewuUm5RZVZ4dwIoXjc0AzpRciGBK3+ceXIXw56chk9NElmJ
	AP/4mfTjmFCPHw/agcUaCF9J9Zw==
X-Received: by 2002:a05:600c:501e:b0:3df:9858:c03a with SMTP id n30-20020a05600c501e00b003df9858c03amr4172527wmr.15.1676623798386;
        Fri, 17 Feb 2023 00:49:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+LPMyLuPrvaxDmYOluBZLQqQ/47nuiPToFIH7LNFS05RQ23xFbpxkx+PNYRQo9LGrIf8ThLg==
X-Received: by 2002:a05:600c:501e:b0:3df:9858:c03a with SMTP id n30-20020a05600c501e00b003df9858c03amr4172516wmr.15.1676623798054;
        Fri, 17 Feb 2023 00:49:58 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c21c900b003e11ad0750csm4319732wmj.47.2023.02.17.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:49:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 07/11] fbdev: Move option-string lookup into helper
In-Reply-To: <20230209135509.7786-8-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-8-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:49:57 +0100
Message-ID: <87sff4wua2.fsf@minerva.mail-host-address-is-not-set>
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

> Move the lookup of the option string into an internal helper. No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier


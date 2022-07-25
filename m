Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022F5800F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls2xY0ktpz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 00:49:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKvRxYy2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKvRxYy2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKvRxYy2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CKvRxYy2;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls2wt3kM3z3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 00:48:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658760519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MrIFLSXgxumLrr5N+Xm5tSy/MudCUAu7YLr1DhCbnqM=;
	b=CKvRxYy2ZmshwR8XQ5M4MSV7hkM/R7qMl3gfku7c+4+zEhTzOJ5XhNMebLoGGuRL0eKGFL
	5lklxz+lvnrQWw2KarDImL7dks66XxCQdVrklYSVBGfcPk6mLFTjzfpqaJKFclkPVriJJb
	FTxYLApYdDmKnY5U3LBWJGozFNv+T5I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658760519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MrIFLSXgxumLrr5N+Xm5tSy/MudCUAu7YLr1DhCbnqM=;
	b=CKvRxYy2ZmshwR8XQ5M4MSV7hkM/R7qMl3gfku7c+4+zEhTzOJ5XhNMebLoGGuRL0eKGFL
	5lklxz+lvnrQWw2KarDImL7dks66XxCQdVrklYSVBGfcPk6mLFTjzfpqaJKFclkPVriJJb
	FTxYLApYdDmKnY5U3LBWJGozFNv+T5I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-QmJieFqZM4imWzZvZqRapg-1; Mon, 25 Jul 2022 10:48:37 -0400
X-MC-Unique: QmJieFqZM4imWzZvZqRapg-1
Received: by mail-wm1-f72.google.com with SMTP id az39-20020a05600c602700b003a321d33238so6297943wmb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MrIFLSXgxumLrr5N+Xm5tSy/MudCUAu7YLr1DhCbnqM=;
        b=e6RKAbtfSDHj6G6foB+cZZqlf1E+XItvyWb7295c4ZPB6+QhW5iUACzOZU0Eo9SuYg
         8TPqgH1x/ndYmhpWXmIUDkAM/P+6dPEV+5tFq+vVMf3ktU98KOItPdpQxp4QwfGOucBD
         wa3hzAZzGQcbUg26ImHy1HxHbl7nlz0F781ioaSc65cr5d5aLuoi0oP2jl0bR/K4LN3D
         yCryE3VVV9SK8E9Z0rfOqCFsaTEU7BUl3nT3Um1ycWZaXwxZ59RgqQmBrpL1M59JWyWO
         IIs76nc4azoP6+QOGP7f8rqS8e69TnIfZdil9u4Uz/kzsuNI9is8oaO/U4j0nau9eSZM
         KywQ==
X-Gm-Message-State: AJIora/eW92F24jneU4WLUkfkwsPaHBSAUYYXsubsEsLLPNVWc3Vsvy0
	G5umEEQee2JksAFyEYKQJm1CskfcuOMNCjC1wMAIJMx13BmnUgeG+1hrEuOIzyQ7DSEuaunmwMl
	U30eUyRlCgE68C0nRlrBgGLnYRA==
X-Received: by 2002:a05:600c:a188:b0:3a3:1802:e327 with SMTP id id8-20020a05600ca18800b003a31802e327mr8922441wmb.41.1658760516687;
        Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tnzVVUGDwiw4pcTWx5MAYSq6VOtiToiDObHgJ6Zic+31l2117wCx4rJ9QK42iIFmUvvV3/4Q==
X-Received: by 2002:a05:600c:a188:b0:3a3:1802:e327 with SMTP id id8-20020a05600ca18800b003a31802e327mr8922426wmb.41.1658760516510;
        Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d4fc9000000b0021e6277bc50sm10775122wrw.36.2022.07.25.07.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 07:48:36 -0700 (PDT)
Message-ID: <faad4b2a-c3dc-e6b8-ee2b-7aa920db3c0d@redhat.com>
Date: Mon, 25 Jul 2022 16:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/10] drm/simpledrm: Remove mem field from device
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-2-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Remove the unused mem field from struct simpledrm_device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


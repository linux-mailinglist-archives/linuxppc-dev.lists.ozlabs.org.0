Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DAF580117
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:02:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls3Dj5RlSz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:02:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hO0IFrpA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hO0IFrpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hO0IFrpA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hO0IFrpA;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls3D20RRBz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 01:01:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658761309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMJ3dMyeClA7T1IRb5CW0ZjxCjegVkQvHSqSlepN3vU=;
	b=hO0IFrpAxzTr39+9fDToqKTrFWw1WlG0TJlOY0Yar6oPv5eo7DSVb23bJ1h8TUMj22XSj9
	bKhvxyzM6sUMFDPNvAlAFkwxHBYAaXU2bgkM2Yia4PtEJCeppr1x9owkd/1hLa5qo6YnZ8
	+5IClADr7nfucTh5Ni2f91o5qECzGlM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658761309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMJ3dMyeClA7T1IRb5CW0ZjxCjegVkQvHSqSlepN3vU=;
	b=hO0IFrpAxzTr39+9fDToqKTrFWw1WlG0TJlOY0Yar6oPv5eo7DSVb23bJ1h8TUMj22XSj9
	bKhvxyzM6sUMFDPNvAlAFkwxHBYAaXU2bgkM2Yia4PtEJCeppr1x9owkd/1hLa5qo6YnZ8
	+5IClADr7nfucTh5Ni2f91o5qECzGlM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151--MQYJwIrN72X-Z-UQ76Oug-1; Mon, 25 Jul 2022 11:01:46 -0400
X-MC-Unique: -MQYJwIrN72X-Z-UQ76Oug-1
Received: by mail-wm1-f69.google.com with SMTP id bg6-20020a05600c3c8600b003a03d5d19e4so4187849wmb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 08:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YMJ3dMyeClA7T1IRb5CW0ZjxCjegVkQvHSqSlepN3vU=;
        b=kU+J0qhs8Es6tNHkec9Kd3b3R9gUc3DOzb7de7O7YXtqMVpnnDHvpD5amQTeUCpmbL
         nBEEtzZNk9c/mUTLsEsZZgGgG8SYQMZGKmnLME9Ye0p6nYgL6+1OG8adCT9HaQZszigB
         KCIKZaFNyXWdRZ8LO+IUhBcUQUaRU7DcM5PYKMS3srEPXrCV0MIRKFudZCRzbMP9vfPn
         eZnmtpAk985r3E6Zv0xGmaiRJE/geQHYe/7F3VUplZSbLPvcyQweuFeRkhXnrecFRCCM
         /M1kdulFiGhqn0dTwIBziv73lodCrDUtAErV6KRjKyzfT0X04YZcvqziQUd2hszxz9P3
         YIQQ==
X-Gm-Message-State: AJIora977HPdPHZBIrFKEzvQf4xz18YgPwCy/kIF7tSXLyCHUXCVEFcs
	uGjJViTgECMHsi8QEaRAV0Z8KjLAdPqadm3H0M2zP8tySRu4YtDy6YX8JYA2Uqfd5htgGHUc/os
	HZte6OICPvJxpanxbCgf7htzusw==
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id n5-20020a5d5985000000b0021db6aa23f5mr8277799wri.18.1658761305117;
        Mon, 25 Jul 2022 08:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFnKmBtGWNNcqpR9Ctds3NAzTME43FarpXlgIYicodYE1RPI8Rj39v9krNqGxZ31mHPqpG6A==
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id n5-20020a5d5985000000b0021db6aa23f5mr8277777wri.18.1658761304776;
        Mon, 25 Jul 2022 08:01:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w1-20020a5d5441000000b0021e493ff810sm12510792wrv.49.2022.07.25.08.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 08:01:44 -0700 (PDT)
Message-ID: <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
Date: Mon, 25 Jul 2022 17:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-3-tzimmermann@suse.de>
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

Hello Thomas,

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Inline the helpers for initializing the hardware FB, the memory
> management and the modesetting into the device-creation function.
> No functional changes.
>

Could you please elaborate in the commit message why this change is
desirable?  Without this additional context, this feels like going
backwards, since you are dropping few helpers that have quite self
contained code and making simpledrm_device_create() much larger.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat


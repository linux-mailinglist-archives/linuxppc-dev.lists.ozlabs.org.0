Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AA7476A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 18:28:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IoqvCJX6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IoqvCJX6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwSs05L0rz3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 02:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IoqvCJX6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IoqvCJX6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwSqb3BYzz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 02:27:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
	b=IoqvCJX6lE4j+UmnwZA7z72UsV2S3zbHIP+YGKf3IZISnldZ+S+YvM/oWwWGbPjxdGwUm9
	e3gS7cE5UoYMvY5+mkvxusNW+bm6C7YoKtP5ydBHx/ylP++wrzhLliGjD+XYeQJvfQWsLB
	GLdRYMAsBRYT9d7SaAdBt8+BiAkEFcA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
	b=IoqvCJX6lE4j+UmnwZA7z72UsV2S3zbHIP+YGKf3IZISnldZ+S+YvM/oWwWGbPjxdGwUm9
	e3gS7cE5UoYMvY5+mkvxusNW+bm6C7YoKtP5ydBHx/ylP++wrzhLliGjD+XYeQJvfQWsLB
	GLdRYMAsBRYT9d7SaAdBt8+BiAkEFcA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-J2oIYz9eMHWfJFPdX1BiVQ-1; Tue, 04 Jul 2023 12:27:03 -0400
X-MC-Unique: J2oIYz9eMHWfJFPdX1BiVQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fb8284465aso40103825e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 09:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488022; x=1691080022;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kQnHD6yHzrEv/r8EzHQhBzLicpYH1qRl0henJBZG6I=;
        b=gO2iQOeJTBiP3yc4i6ebefeOoyAwD6SAe8p9OY0UUNxdGBbRC3+HdN/ZaRWIpRbaPP
         dNkZY9VqWMT578gFwjxCqVecqmsqZFBl5JD+VuSo/jKV5AbLloiJIAkJ1rRhfT2COax1
         /etKNpomQ/PdTb9Y+k2p3Jn31tcY3R2v+HBR9U1+rS/HEuFUS8Eq5dC1KJ2JXE3EER8b
         rxpgTEzQz5WT3b+h05ZWh+LgakeSe+eeV12YCz49Rpk+ids83plVvlktkTUieTKvSsTc
         hg38tScMRvavnicO0j+XU3s94cWru6eNKs4Z7/AGkzxugbafBbkPPAwx2g+qphcPLRXR
         1SCg==
X-Gm-Message-State: AC+VfDynONpwN/eINUVhO/cFNz4aaPiqPmxgx7+iuB4D4OiAd4kZ/zp7
	IJ+HksMiWeSHPrBWLJ985bBRszwmZ1xV6CjQGQwqrCZ/sSlWxD1iqqRDGIYx11wz00xrdlU64hA
	Msq9jeT7xDk/R/vMG+4Pa6WeLzA==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432848wmg.22.1688488022230;
        Tue, 04 Jul 2023 09:27:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NuEVxTetvep8Gr1fgiFutV/xXoEkUhrAhQSPThqJdTuxw2Km/uBAzmwN3pOgdQUZIHRImng==
X-Received: by 2002:a05:600c:22cc:b0:3fb:40ee:5465 with SMTP id 12-20020a05600c22cc00b003fb40ee5465mr13432831wmg.22.1688488021988;
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d58e3000000b00314329f7d8asm7499354wrd.29.2023.07.04.09.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 04/12] staging/sm750fb: Do not include
 <linux/screen_info.h>
In-Reply-To: <20230629121952.10559-5-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-5-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:01 +0200
Message-ID: <87a5wblk16.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-arm-kernel@lists.infradead.org, Teddy Wang <teddy.wang@siliconmotion.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The sm750fb driver does not need anything from <linux/screen_info.h>.
> Remove the include statements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D567AACDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:39:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQjm1m5Y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQjm1m5Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQfq2pSJz3f5r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:39:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQjm1m5Y;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQjm1m5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQR81VYYz3fP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:29:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695371343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUT8FtJmdwXZ1XdzLxxJQDSF0F15AqqVAfggCoYwa/o=;
	b=JQjm1m5Y6NdPRz6o1+yrBAU9eudVCHhMq9LCtrhYC4kEIyOPB2ngin6g7Q1rSkuiUj6wXV
	JJBVMVDmoN0/qwDBLv8lF5mndDx8wylqRtTAOwCuOle9tXPaSZJIzdjNRXPqmK3PAzUJsj
	oruXWwnndZpEeO3LjQDJABQyWqGTM3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695371343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUT8FtJmdwXZ1XdzLxxJQDSF0F15AqqVAfggCoYwa/o=;
	b=JQjm1m5Y6NdPRz6o1+yrBAU9eudVCHhMq9LCtrhYC4kEIyOPB2ngin6g7Q1rSkuiUj6wXV
	JJBVMVDmoN0/qwDBLv8lF5mndDx8wylqRtTAOwCuOle9tXPaSZJIzdjNRXPqmK3PAzUJsj
	oruXWwnndZpEeO3LjQDJABQyWqGTM3o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-CYIuOJYwOLaUbxPsiZ37Cg-1; Fri, 22 Sep 2023 04:29:01 -0400
X-MC-Unique: CYIuOJYwOLaUbxPsiZ37Cg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40526a782f7so14588105e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 01:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695371340; x=1695976140;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUT8FtJmdwXZ1XdzLxxJQDSF0F15AqqVAfggCoYwa/o=;
        b=pJT8IUXDAa2iC0lIxSIyLvz1HgEXAcVP8JR+8Vx6qgaG6r28bT9NLYv4NOOpHB6b/U
         ANbwLktSEaEJwevjkW3kHIZdox44MYwh3Viz74RHzHXoc77s+pmI+7ExcVCvIYDk0RjW
         Dy/iPrjNqJTQH5I0BmJCGzHpurzazjkZOV2AT71cvcvUbhwm20hDJRjqKKRIbyvSx/WB
         XAKjAw4TkMcSU2w8h/z6f7zTJir73pFOMsyijD8nIpb2oMojhJ1gnceR8hysIadTsQAi
         c50xrY5OxDGHAlD+AQt5fFt8C5/O46ktbv25Pn645GfvRgu/NzxTMCieo7epd0LoA1m2
         icww==
X-Gm-Message-State: AOJu0YxngZCbxKtcHnNt0l5RD+Tj2mfS4RkjiDFbT1UuNl9mAbQsjkhy
	u5CGjz818OsoaqI+4WaK/JK0ZJOrHfUeIW/ek0KD3vtxwTfgHgXuWDQXFc/cx6TS1/hMBNFnCAm
	5dxvLu1DEoG8FDEL0XhguP+HxxA==
X-Received: by 2002:a05:600c:1e0b:b0:405:4002:825a with SMTP id ay11-20020a05600c1e0b00b004054002825amr568122wmb.13.1695371340724;
        Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrR9BIVVw8Y2WgBOUvl/XqDvvu2Yb9s8zAvf4Vn3nfvNA1NNc3OCwyRPJ1UY+bCHomzJ5jcg==
X-Received: by 2002:a05:600c:1e0b:b0:405:4002:825a with SMTP id ay11-20020a05600c1e0b00b004054002825amr568100wmb.13.1695371340371;
        Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x14-20020a05600c21ce00b003fefcbe7fa8sm4004012wmj.28.2023.09.22.01.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
 deller@gmx.de
Subject: Re: [PATCH v5 2/5] fbdev: Replace fb_pgprotect() with
 pgprot_framebuffer()
In-Reply-To: <20230922080636.26762-3-tzimmermann@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
 <20230922080636.26762-3-tzimmermann@suse.de>
Date: Fri, 22 Sep 2023 10:28:59 +0200
Message-ID: <87wmwik3w4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align pgprot_framebuffer() with other pgprot_()
> functions.
>
> v4:
> 	* fix commit message (Christophe)
> v3:
> 	* rename fb_pgprotect() to pgprot_framebuffer() (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


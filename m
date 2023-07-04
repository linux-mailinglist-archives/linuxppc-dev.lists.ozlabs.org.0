Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF4A7476BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 18:29:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=astV7l2Q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=astV7l2Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwSsy2Z1Tz3bnv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 02:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=astV7l2Q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=astV7l2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwSrR2SzFz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 02:27:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHdgPj1Wm2IgY2fHBO70NHanGv82Rz5Bml4kSaFfUEk=;
	b=astV7l2QgNLQx7G0QGsEUuVzyHWhqmO6uW61aOeryrxeSBHbThdQQK9eTbzTtxdNz3OUoB
	vCIX8peWu/rT+he/UJP8MKQmW8WoD5lhj9Y+IZ7Vjyjo3tdFBO/0JTZiZNaRmqTwJy95wM
	gP6FgqhCw1ULKrlRXs0D2HipJszaGWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688488068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHdgPj1Wm2IgY2fHBO70NHanGv82Rz5Bml4kSaFfUEk=;
	b=astV7l2QgNLQx7G0QGsEUuVzyHWhqmO6uW61aOeryrxeSBHbThdQQK9eTbzTtxdNz3OUoB
	vCIX8peWu/rT+he/UJP8MKQmW8WoD5lhj9Y+IZ7Vjyjo3tdFBO/0JTZiZNaRmqTwJy95wM
	gP6FgqhCw1ULKrlRXs0D2HipJszaGWU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-AVF0-5RGOKiT232dg9RE9g-1; Tue, 04 Jul 2023 12:27:46 -0400
X-MC-Unique: AVF0-5RGOKiT232dg9RE9g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbab56aac7so36511135e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 09:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488065; x=1691080065;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gHdgPj1Wm2IgY2fHBO70NHanGv82Rz5Bml4kSaFfUEk=;
        b=dLU1wKRnJb4Ujz6Du+Kb02vc0TT+QwvP8CmoVL9Zi4Ux4jZ8+rED0uGZhxwF02tZdT
         qQnFGAnThNy5gjKRJ9gmmV6LrBEpi7hWHxGPPbGgc4K45eGFHugtAPXSsvDgRmSKFt/c
         XwukoQhiMqcYkeNkFKw78jecwSn5MdqPlV4F6mo1d+1uodtYKNwiWexfVnvCLr4QMXZQ
         QXpph4vn1Yta9eL2cxKUEnzhCsCxb6aNLPjebTzzfgKSBLdrpHAVMsTdFjIzQNrZ+3Ey
         lkvEsbCKJcW+quAyRj5I8oJq+JeQyLpCCPBaZdLxNbXFx0+sxINoep4Hkq6RyrPcVjWe
         qFgQ==
X-Gm-Message-State: AC+VfDzVjAjI5RPIpQBtcS0M4giQ49zBUXfMQmccdr7ujsLhafXfgENQ
	hqu9kXiGwOGnZWwH3sRLOWWsgDBcVeejTez3MeLd+CBH9Iy4AZdxD6YSmy9rSdRQ/uqYjTOPeHz
	3b6bxTDiyvXdMftG6BgHTU/gk/A==
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id e1-20020a05600c218100b003fa96aefd78mr12439034wme.29.1688488065020;
        Tue, 04 Jul 2023 09:27:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76jB5JrX6TXp/j+SpnZTGNMceWk0U9GUm8msLFZPg0J8xzTJ2Ph/XYxtIjAMzvUbO/YmFVwQ==
X-Received: by 2002:a05:600c:2181:b0:3fa:96ae:fd78 with SMTP id e1-20020a05600c218100b003fa96aefd78mr12439000wme.29.1688488064598;
        Tue, 04 Jul 2023 09:27:44 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003fb9ebb6b88sm22214385wmj.39.2023.07.04.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:27:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
Subject: Re: [PATCH 05/12] arch: Remove trailing whitespaces
In-Reply-To: <20230629121952.10559-6-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-6-tzimmermann@suse.de>
Date: Tue, 04 Jul 2023 18:27:43 +0200
Message-ID: <877crflk00.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, linux-mips@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foun
 dation.org>, linuxppc-dev@lists.ozlabs.org, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix coding style. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


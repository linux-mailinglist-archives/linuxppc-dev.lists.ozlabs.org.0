Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41E3AC59B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 10:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5rwX2Q0tz3c3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 18:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=K2YfIhhA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=K2YfIhhA; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5rw51fk4z306M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 18:01:06 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id e33so7156867pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=q8VzHewpZe79pEmvix8QtaPFn2S5lJz4nZ38GYVSp1g=;
 b=K2YfIhhAMz+k3GXUUbKkMGSHD/j3AgeGpWrQkQL5jrlzpBU8BD5+WC2JLkzkt2llR5
 3X9bdGn5XASN+cN0AnLHbpLiWfmyojWqHGAmW/GxYVQVaJrpHjn0KprSodWIKWZ/6xS5
 OOsIoVScro/sWIpLB7p4STvyHlcCWagKCGdlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=q8VzHewpZe79pEmvix8QtaPFn2S5lJz4nZ38GYVSp1g=;
 b=Y8jex/S/Q5NQwDr1nJL4t7Z71EzOUtf5IekTQf4ChNGSz3QwZVNBZy7DO2IPjGu2FD
 emJobQkBKyQAEb4sziMS5oXdT+tNgsU8oqMP4xnjBadijWyBdQDpU7CKRiEcwKANIRGX
 xarmrdZeSWqUTF4lBFqyX0CEN6BAg16bF3GP3SLdcnaQZdtjPqECcQalmt1j5YpZ/a38
 dtK75IBl5AZ9dFwWZRwImlyx8qXA9xxjpu1Krp8R3zc64OqgExfCfEMxC6pZajpgigaT
 WuUKrtLA6ylPfxHvAeiRlHOwK0CEBvnHndk9V+ilHF2h46o7bLFyOHXmoqKtXXk8cdFe
 ZMMA==
X-Gm-Message-State: AOAM532SRUsNTWtJxQk+bp2V7o39nKNwVRsQCYh1GcYj2/WVGwnIJ4En
 4hef6/kVjzn8+Uh3eVd9M0yPKcDQAAiojN7j
X-Google-Smtp-Source: ABdhPJwWZrEkq+tCSPBJbFhpklPxtoQ7coobU7qFXVYhmQlUEdhuP+YK6IVKVG/zU9+ghAuWfPbgFQ==
X-Received: by 2002:a63:f10b:: with SMTP id f11mr8792367pgi.203.1624003263723; 
 Fri, 18 Jun 2021 01:01:03 -0700 (PDT)
Received: from localhost ([120.17.188.88])
 by smtp.gmail.com with ESMTPSA id 18sm7161695pfx.71.2021.06.18.01.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 01:01:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc: Enable KFENCE on BOOK3S/64
In-Reply-To: <20210517061658.194708-5-jniethe5@gmail.com>
References: <20210517061658.194708-1-jniethe5@gmail.com>
 <20210517061658.194708-5-jniethe5@gmail.com>
Date: Fri, 18 Jun 2021 18:00:59 +1000
Message-ID: <87czsjsitg.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> +#ifdef CONFIG_PPC64
> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page(addr);
> +	if (protect)
> +		__kernel_map_pages(page, 1, 0);
> +	else
> +		__kernel_map_pages(page, 1, 1);

I lose track of the type conversions and code conventions involved, but
can we do something like __kernel_map_pages(page, 1, !!protect)?

Apart from that, this seems good.

Kind regards,
Daniel

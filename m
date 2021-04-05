Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932735420C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 14:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDVTJ108kz3c0m
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 22:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gyKml+bu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=avagin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gyKml+bu; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDJSD6l9Xz304f
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 15:02:33 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so7801530pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kK15QIzlv37/lctPxHTH0/oV3sSKj5dMjOshVvLQYOY=;
 b=gyKml+buuchIf9zLiJIVWS/8SzsE3vie/q8RjjEKEoC9X5+eK9qAKzMKWxOYqpa4Up
 KpOAS0eXBL4aKv45eMa8N2NmSLc7tkb95RWRZaSoIH63ICZJNPXiEDntozIZhUQWK8rc
 g9ZOcHM/sKjaEi6WkL/IIcYMgVo73TwCNZ4yx9PdUK4U8kylnrx8RzWbLKyHqZnvQuzh
 Nkb8LsqnLU+RcWB0segCj3iV9VZu/Lza0exBAOkpAmmIPtm0WySWJKmmNPTLLk66UDa9
 C2fC5gvawj5GdnFEj3dCRwmrpDkNOxat2bkijMxV0wYXkDBeDmTecx9/puNx8TNvs+zS
 JF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kK15QIzlv37/lctPxHTH0/oV3sSKj5dMjOshVvLQYOY=;
 b=UtpkG3zeu8rczhM/OSTVuWPgoOO1v4ZE4hYWoGmss4T82Z/Qmk6zt+vwXjwPGrcPdT
 dmsHk4BU8EJvHPyUwHXj+AwkogvSYYMlBPrHx31mi3K1p3Flalo3jfUhlximgXQose2w
 ZJYxOiqUGHWVWTl12pP8EtbQr/P+cMDCTOKzaaKxkhF/mkW/3KM6QiMejdIAu9eWQgT5
 YDXc8fUwo6CzWvqe6I8jJQQllM1yW9slYq/ld5+Y/WDXNskpvZBiP4iOjGhjQ+o9a9ud
 GfhvDWZHjcsXHCAWiSiIfsayI8xi93zJFo8eVax+IkRKKjVj+knSTk1aX4Ji5xxCkGZp
 q90w==
X-Gm-Message-State: AOAM531sz8CurUgSoIjJ9o3QCrKAQQJQ9dcduys16a857sQvUjGKete8
 eB8pLWSzzBTt3Q/PfKxL9w8=
X-Google-Smtp-Source: ABdhPJzLdUJy3dvpZoB0nqEQ8yTO9K/hjp0XKNEZRVpkDvLIZGb27U4wcpyLU1qydKLB2z3nz7DBUw==
X-Received: by 2002:a17:902:7b90:b029:e6:f01d:9db2 with SMTP id
 w16-20020a1709027b90b02900e6f01d9db2mr22475666pll.69.1617598951642; 
 Sun, 04 Apr 2021 22:02:31 -0700 (PDT)
Received: from gmail.com ([2601:600:8500:5f14:d627:c51e:516e:a105])
 by smtp.gmail.com with ESMTPSA id 14sm14227119pfl.1.2021.04.04.22.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 22:02:31 -0700 (PDT)
Date: Sun, 4 Apr 2021 22:00:05 -0700
From: Andrei Vagin <avagin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v1 2/4] lib/vdso: Add vdso_data pointer as input
 to __arch_get_timens_vdso_data()
Message-ID: <YGqZVf5+74RYp8H5@gmail.com>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <539c4204b1baa77c55f758904a1ea239abbc7a5c.1617209142.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <539c4204b1baa77c55f758904a1ea239abbc7a5c.1617209142.git.christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Mon, 05 Apr 2021 22:33:24 +1000
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 04:48:45PM +0000, Christophe Leroy wrote:
> For the same reason as commit e876f0b69dc9 ("lib/vdso: Allow
> architectures to provide the vdso data pointer"), powerpc wants to
> avoid calculation of relative position to code.
> 
> As the timens_vdso_data is next page to vdso_data, provide
> vdso_data pointer to __arch_get_timens_vdso_data() in order
> to ease the calculation on powerpc in following patches.
>

Acked-by: Andrei Vagin <avagin@gmail.com>
 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

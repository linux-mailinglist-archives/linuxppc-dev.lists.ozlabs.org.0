Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7BA4B7001
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 17:07:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JymFr3Kp2z3cSS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:07:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k6dGMBXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=k6dGMBXj; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JymF74sgsz3bTQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 03:07:05 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso2518925pjl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 08:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
 b=k6dGMBXjj16JgvtRS/W1l6Q4I2nZDtQcAdycCp9Yomvd6JZnH2zqPlxIg+g+ZPVwSz
 Yd2M1LVjLDjA37krskwjCpbidnONcAVHIcSbAjYLFVZbM5iGekAEKyRZZ7xCywxW3nBM
 4HP4E451gdn725+Vgz91Q6TCzCawlBmVlldfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vyO09UbxJeRvoJPXaZeuEPEmDAtin+d+KKe2VrtUaUo=;
 b=TFfeyHFnZqGtbiVanOScBTf1v7BJcNTYANwMqrrPzhN5JR1bjMB+X5goySV2onELX3
 Mz2tRIS4QvmulevWUP1mHgPFYwLi0uhkzYXPrvQFzVQ7/VS8vSAMhBkwWwPBTGMeZV4J
 vNZ3wJiSKuTYFgu1P8s8/85Uof7d68e8blP2YefDyi/p5zC9eeRfTCUT3+0F4YOH//Zx
 SEDu/oTdkRycnD/OHaKj+ZyP4BLPFE91X4BbE5zq8LQ9fo20mKY8wAqjMXyjVsCp+kH7
 dOUReCqm0+qN/3iznvDopvR6levrzQuNVl+bcMqICxBWLwBn2zaEw9bTa12RF2qBrR3y
 f2zA==
X-Gm-Message-State: AOAM532zEjcaOqVEJqs/5ypxDahboUS5S9puNY6CvRAdeVctTKz73owp
 D2fC0v/YpBqGjRyRm/7OuHG7Hw==
X-Google-Smtp-Source: ABdhPJySTpQ67R+nuQyJJfrGZTBLhUE5/ijHpxyRKCqjoqAnDBf2qQYFgmJer9uiO3sFYsKqwhcw6g==
X-Received: by 2002:a17:902:cec5:: with SMTP id
 d5mr4782522plg.96.1644941220276; 
 Tue, 15 Feb 2022 08:07:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i17sm3101014pgv.8.2022.02.15.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 08:06:59 -0800 (PST)
Date: Tue, 15 Feb 2022 08:06:59 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 01/13] powerpc: Fix 'sparse' checking on PPC64le
Message-ID: <202202150806.66CC906@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac1312f2451aa558bb2a8806b4d0aa2020f0c176.1644928018.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 01:40:56PM +0100, Christophe Leroy wrote:
> 'sparse' is architecture agnostic and knows nothing about ELF ABI
> version.
> 
> Just like it gets arch and powerpc type and endian from Makefile,
> it also need to get _CALL_ELF from there, otherwise it won't set
> PPC64_ELF_ABI_v2 macro for PPC64le and won't check the correct code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

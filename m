Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BE5FB909
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 19:15:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn2Vg0m8Zz3drm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 04:15:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=De/JBOnE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=De/JBOnE;
	dkim-atps=neutral
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn2Tj4Hnsz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 04:15:03 +1100 (AEDT)
Received: by mail-oo1-xc36.google.com with SMTP id c187-20020a4a4fc4000000b004808e2f7affso97061oob.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=akSw3L4tXJn15h+rqf6OOe1YNGJBaeQhRdSOOStqs9c=;
        b=De/JBOnEdP1ufh7vDr8fXSZZDpjnBhebU79lL5iJtUsfycnzsgRAgat658iJWNu/jJ
         YBUrpRqGlHsgKk/gKviPxhpx3s9sHwsCXXku0cuCbRTEymswXTU/fIreLOMWO4zTmv5a
         KHojpeuuT97P27cCqMumooqZ1YVW4RfedNA0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akSw3L4tXJn15h+rqf6OOe1YNGJBaeQhRdSOOStqs9c=;
        b=7jeuXUeUc+3rV8e6bCykQFc2yLyOkAuIKGYCfWK20uIefEDyrETVckS/XDUMW/MK90
         4KxdWL4zntz8YrpWE/gi6ivVbPvAZ2hwmgYm/4nLVWKP+SkIW9MSKbOH+i6n9siIZ3HE
         KG74VWVQxCVsR+fAnWniJqU+7I347gh2cpy4/t+/l29iJQfXhg/M/UdTg9aToNABWVdm
         NlEVwDlJMMOQ25nm9RAfxwzYhr4xtiWrLtjRmP/PSV79N4+lC+IGwD07BvfYO1z5eUKn
         s/adJwosbq4r4TmIayclh0Xp8GsIwEHVTnj/DhMTuDsYyBG2/cO6/5Gyt1ODUqhaXlSy
         LFWw==
X-Gm-Message-State: ACrzQf2hpQIUoP4kT+8wnAGgabrx3a1NLN6vSANl2F/d38iGqbJDBKZJ
	kL/3qTy6NPyLlngGYNWyYWbezK/wowIgxQ==
X-Google-Smtp-Source: AMsMyM7NiNWVpD8b8+fXs90HImBT3kFOG9sQa6Bu8lJ9NAz8NGShtDme2vqXXHblQ+QkUBgifZqDmw==
X-Received: by 2002:a05:6830:6203:b0:65c:39a9:4007 with SMTP id cd3-20020a056830620300b0065c39a94007mr10756927otb.92.1665508497677;
        Tue, 11 Oct 2022 10:14:57 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id v21-20020a9d5a15000000b0063696cbb6bdsm6249972oth.62.2022.10.11.10.14.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 10:14:56 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id g10so9308607oif.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 10:14:56 -0700 (PDT)
X-Received: by 2002:a54:4899:0:b0:354:add8:52ab with SMTP id
 r25-20020a544899000000b00354add852abmr57413oic.229.1665508496109; Tue, 11 Oct
 2022 10:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221011035910.39171-1-joel@jms.id.au>
In-Reply-To: <20221011035910.39171-1-joel@jms.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Oct 2022 10:14:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEGAQbp3jTN+BhutOJOV+3XZyfuDqQRw+Hj0Hk_Z-gvQ@mail.gmail.com>
Message-ID: <CAHk-=whEGAQbp3jTN+BhutOJOV+3XZyfuDqQRw+Hj0Hk_Z-gvQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix 85xx build
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 10, 2022 at 8:59 PM Joel Stanley <joel@jms.id.au> wrote:
>
> The merge of the kbuild tree dropped the renaming of the FSL_BOOKE
> kconfig option.

Thanks. Mea culpa. Applied,

            Linus

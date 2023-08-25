Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73029788E90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 20:22:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nhk5Ko+O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXSwW1yRlz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 04:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nhk5Ko+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXSvG51j7z3c33
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 04:21:14 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf3a2f4528so10424765ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=nhk5Ko+OG/2Q2+PvkEDtXdRrk3or+134Updyqdlu1P6XQCscy7egtl8AziCQjtc+Bn
         zp65RvpL7MR7vfIQJtiyZ3WEwZ2/AOZJxGZQ4mDRGInpxpoBv+UhEk0r9hCNWL5bYNqC
         5O0xNrQMLaQBipxQ7a78YEG4PHOgm1S3/j8H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987672; x=1693592472;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd1paIDws1ExLMgJh/WiTiPNEsGUGwcEQ17xiLulNdo=;
        b=FFNhUEkSzZG39Pvq9FJvbjEInZGzJ9YWGDgUkqAm1V9IzZymfuahS3qoIH4lSx+kzH
         s5vkho91KQtcHTtYlqbKll+4RqsB3qTZAI0XF/wATGpQGuTkUvL6CQWSWyXvKdFos41l
         PlM9sRPnquZm+CCDzpbaWerGK2SMUwM9pllQm9smrqrPycP/XDA53apBbVI1lOR/YRo0
         DiptQmyCaDc6nNdEBA6aotS66ZtkDRLZwRmsFv22JBQxbRWfPkPAsQrjgWEfY4wipGx3
         1hIRNHgPZpsbN7Tht7/H++w28hQynG6GPCsWkPrSx1fZWo7B9F9+Zmk2dsRXDe6HZI5I
         yQFw==
X-Gm-Message-State: AOJu0Yw0R0JTeVTPlNRcdO0CqXP/3Bljwn88oj+ktyS63JsjWCWRb1bZ
	vF/ru4a/MzbCwjdLmrsF5e0XcA==
X-Google-Smtp-Source: AGHT+IHIDQ9FIJyjliN/xDw65w9ny7WQFMwwk363Mwv+Ejm+xJkfXuvIT+Ox7t86mTNHW1gFw7K36Q==
X-Received: by 2002:a17:902:ec87:b0:1bb:9f07:5e0 with SMTP id x7-20020a170902ec8700b001bb9f0705e0mr21488860plg.60.1692987671857;
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001bbb598b8bbsm2056354pli.41.2023.08.25.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:21:11 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:21:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251120.159800A@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 25, 2023 at 04:56:54AM +0000, Christophe Leroy wrote:
> Le 25/08/2023 à 00:36, Kees Cook a écrit :
> > +# Base hardware support for 86xx
> 
> s/86xx/85xx
> [...]

Thanks for the typo fixes! I'll get these all fixed up. :)

-- 
Kees Cook

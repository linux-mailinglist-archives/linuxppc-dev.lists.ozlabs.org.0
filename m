Return-Path: <linuxppc-dev+bounces-11160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22594B2D417
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 08:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6Gq5220xz2xcC;
	Wed, 20 Aug 2025 16:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755671585;
	cv=none; b=oofM0V7Pyd+hjjpMs7Pr+ppV3oNvMMH2f+BjOBunfOczAAC76X0Q/46Y+RIXdwga+HJDnwyRdOfYPSjqjaUmORMR7STsZx5rMayzdOTliw8vllnrlAEKqCag9jWGa0WnU/R0vnYZaYyX/LLgW/1PHHIopSeD7OW5qUCWvYt0V+a09cks/bkVHWcy46MdURkWcHvb6JxNQ+hq7c5zISykLyRJkc8wzQolQbT3qbFfegFxOa9/NK/Ts1OEteu0Kk9j20WP+RQT3vcQIhSVKnKoKieBkkmOxZCU6kJXdBMYCy+hY7gl3sQZkYZzvPOn65DfnsF9VVyF0Cl09jWGofSyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755671585; c=relaxed/relaxed;
	bh=vajijHRENH3stH6uGMnIuNKF3UDEhAgM+AkMla0GCYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoxojZCfEn+5WxvYAjskcJq4yWtG1QGYL+5Enr/qAiszva+nttUR0Gyj2hTiIHAzMxfF6wymnLE0OzR9DibaemHSd0pfLxXB/EonNtK0VD5D/1J0ilrdLhtmi5bB9E2mqMWmZz/X1HRzIQXzB0rNce5qDOnmGJ2h8Owp0jlZO48aQrvNQFkONdfEavlDeTIKfulttV2oSRJVzFNB0Fcn5wbqNGF9VgsCwuhUb9bxIODqy9xAlsACDtKBCOyZ6Q7+7UX4nalcz9I+4LMavMPcPWJGs+0CvTx4Jy5LjKnx9154cg0TyuA1r9YsJxSTDOY/rmnSHwL9TQweOwExd0un6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.217.54; helo=mail-vs1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.217.54; helo=mail-vs1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6Gq3697mz2xQt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 16:33:02 +1000 (AEST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f8bf6a9d7so1610844137.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671580; x=1756276380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vajijHRENH3stH6uGMnIuNKF3UDEhAgM+AkMla0GCYE=;
        b=wJ5sWT2Pe+mTUAXYZhd7Q4x/wrefl6Vf8N1uA+1FcH+/g+EqEy2akjMNeQ39HDVntl
         KpB8ImNSzYl86z6fya1dq/RmqmI0eTOQrma+OTiXztx2KUoBxUnipFtkMHJ06R866Vr5
         u3S2fTBnJ7YtfRTEiW0Rw6MIwd0C8A514Gs3AvuK6YgY9pUa6TwyVRn5dEHITPrM0wF7
         SVj/9NhL1LLqP0Tu8Fw65Mu8xWHT17gYd2kUxIdtF2CjSVCwxzxOzC2Q30u/IgwnDr3M
         z6f5LuavMdeNV8dWZxXAC2Q5fkNLapzZYWCdaFcpCPfejBkDOoVV5oBGFW4Q/tf/DHQ+
         QBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnD1Y48DkyAUyO2mYAs2nkZFId+BwaisfnNXwtW0om8WFQ1PsHvcLR8L3kcEX0deHBYeKFBGZpsaV8f/g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4bmZiNJjPozjmtgDvM9DSLFtRhWL0gyEO7sYNZkoUaJfy9Qbb
	7a9UOVi4mVeqdVbPP1JtFXBCsWQ3OzJB0Aw7jhgYn8yRjCPErX3PZPJnGI3F3lGP
X-Gm-Gg: ASbGncvIpITNRe+d+RFFtesB9f7WCUGyQqlJ9xhFqTO1GU12NBk2wuDl57oKTc91Lxt
	YIYhj0iK46MkXy9+VtAyfpLPob4LHQzoScI+OfOHvy+BAnWMQfDmxqF7C1Gm0ZE2wUK0Adqo/w4
	v10AcIFoI1K5Dnx8XWi/YaNAygGbQX/mcIcbKHdzQriXykCv6t9msdbbTxBCgr08MsW7EOTSY3h
	3ndwrGKlN0vT4Kqd01i7WYygyvonZfLmICc1twfnVLySj5EooW9MLCeZiC1BMPfAtkHILaeZ1ME
	b6W+6YATSr7LVHnZe64GCtwGE8QjE3FZAWRA1qerM+JsUvH5G3/4+VOEAfhKl4Ka4TQ1kHn5Odi
	Mq4fDWCDecvUBHsv/h5fq4yBy+WSaNDZw6AkVgI6og3o9yrnyljt6MUiRjKHyYrUj
X-Google-Smtp-Source: AGHT+IF7uRZ58FrBzcdpNs6IecC2knXam6i+gXeJhirwlbtJp1cQGlJqcywerHOF1wrJn+S0h2RgAQ==
X-Received: by 2002:a05:6102:f14:b0:4fc:37e:5f39 with SMTP id ada2fe7eead31-51a4ee2ac8cmr502267137.7.1755671579593;
        Tue, 19 Aug 2025 23:32:59 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-890278eb16fsm2814276241.17.2025.08.19.23.32.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:32:59 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53b1737003bso2348961e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWecTveeROnYXLcTzIIVcNmTYhDFWFIL1r0yMdOsBUMHBTmifrroUmjZZ0tmh4FN4BoF5fUl+f786AW8kw=@lists.ozlabs.org
X-Received: by 2002:a05:6122:17a0:b0:531:188b:c19e with SMTP id
 71dfb90a1353d-53c6d4da982mr572406e0c.2.1755671579223; Tue, 19 Aug 2025
 23:32:59 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250819165829.714344-2-thorsten.blum@linux.dev>
In-Reply-To: <20250819165829.714344-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 08:32:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPfy6Op7UaND3eM8AFmP8vo3_4z+d1_nOQ+3fPdJmfxg@mail.gmail.com>
X-Gm-Features: Ac12FXwXcFy9wJZ9JCt6nWPVidb-8bwqhxd5R9n_Oal4hhAyd1zb0CHglZKxvnE
Message-ID: <CAMuHMdXPfy6Op7UaND3eM8AFmP8vo3_4z+d1_nOQ+3fPdJmfxg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ps3: Use str_write_read() in ps3stor_read_write_sectors()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 20 Aug 2025 at 07:26, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Remove hard-coded strings by using the str_write_read() helper function
> and silence the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
>
>   opportunity for str_write_read(write)
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


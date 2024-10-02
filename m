Return-Path: <linuxppc-dev+bounces-1719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140298CC83
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 07:49:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJP5P1gLDz2yNB;
	Wed,  2 Oct 2024 15:49:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727848168;
	cv=none; b=h94zZlUTWvwdQ12GRTXCWQQTsd68ru9dF2zHfaMYVQ+uVA1kZls2io9L4WxWGriBYvFmm2i6ApQ6ODlgwkRC34yh/kVY8sWZa7eWgSoPYgJ8/NHe/ySOF3Umy9Bn5fuPqSYmmCTbgMpc57E/ztSyq7Fjyfs/UmU69JA2DlD1Fw0j+xSjbl/A056d25BKbUWUNVKpRYFXIomeOrtl6Bw+hM0AtUmqakjhBQ+LDNkbEuzpTKDMvgUVJRHT9t3UcgIweAXcza3DRADqYYx+gCDddK2FdcUmpyxxalazmE9m3aMKUfayQeSacuUhstVzfJIroPQiVyyJUVrSgL2Wupcjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727848168; c=relaxed/relaxed;
	bh=nAi3+Jj7VO1oSuzWLs/Xs3zSVfvIN3Gva8xKesxmS0Q=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=HgH7g/9eO069xZJYKEGoox22dvIH9ThMGZ+rCRg/sFFm3B2wSRfzohjJd2ZrU0wE8mshjIvedBIDsR57uyXSQEoLlWsJ2kuY2rkqRlr3shVqa9gZ3HDbauJZgR/BH08aTsryb48jZ1RuQJNsFx724g1uSKLvyEN8CUVlldl1bpOex4C9LF4ickdozOtdlHpRbKLx+TpChdJVYwbAu8CkKa/GgH2vEdPPTu1HhJf3R/Wy1fqHt0VAGJfArZ2tJ51WtHmDBr/9qoONh5PP1xXnb5Ym+3njRRLSiQBYhGWMwda3hnlfa8f2D9LLFaX7OMyhhcxzvZHRsr61nPSZwnLpZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SqlRhZIE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SqlRhZIE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJP5M5S6wz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 15:49:26 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-718e2855479so4491445b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2024 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727848162; x=1728452962; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAi3+Jj7VO1oSuzWLs/Xs3zSVfvIN3Gva8xKesxmS0Q=;
        b=SqlRhZIEVhr7XjlRQe8W5ks1f9YfyhfPA47rb7fHgth5mcfG4UXUIOp3JMaqWZr2X8
         BZ3k5l1rGIBUdIfJMvKqhFnmQG8P4tfAZXZYJTWqb++DN8R+nTAhlJn06eyNS9xD4x9Z
         x+p9uRQJ179aa/ETB2IvmixQwqV8amrLLCn39gPzhwZ8z7hzJXpz8ZAN5h+RhcdEkLuy
         XAP90NI0KzUDbM15cK6Wjhc70emjmZmyFJ3ABLivBPTc8Vyr05XGVzSc7ZGm70RaIsoy
         QC5Bkiz+gciFGjwCVCAE42xe29iaLAnhsdPYIznSW8bIxjnOd4xpUt+Fg8UhwHtdq4PC
         Izcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727848162; x=1728452962;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAi3+Jj7VO1oSuzWLs/Xs3zSVfvIN3Gva8xKesxmS0Q=;
        b=fWShHdkILUWSOjDCnTZtzmS6SulGCK11oGil2NugBr5OJkW5W/475YZ6IqwaUxMs0O
         XjJNMNGkE5s046jpbwNOK9i7eyiEcccrA2dbMO4gqaQN/mdUhu29Jf2zlIZXGW6s5w4+
         9xKJGNk1JFQDd6SF2cjSfP0mawzdM9AvUrqxLZNOjO4/VqXNJBRbd5/f9zQqWqzFtG7F
         8G3u5hF8WZVLuUMnEEaK4nGLp1mExqLG8i9+qolaGj83kBfnwzqqQzvdlEZAU4dWFEil
         lOjXKdaSZL542K61hpzyC0c3PpBj5xtOAJaTO+mxBxTScRZL56tH95EBP5046JweiHy3
         KoQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/CR4ZHdzJeutCzN/IxUkmdZXtrSdloey0DRvbd4DT0MumUYGj1C7sskfS1YlFtpKTmLucwf8ozL7/HXg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrG4gjuV78v0EOKVZPjpttHZZpIYInO8cYg4TVgWAJ+2rv5JRk
	gUBowtRfbamsfzSHnYpcsMJDZNMl4vdOrDivOFjbsn4R2uB2/VvN
X-Google-Smtp-Source: AGHT+IEctg1bG1h01FMpZ7KPv7MN8I3/B8gsYF6W6p4t+ELncb4q7gaLjWWJyeNYbzuFubS/soGvgQ==
X-Received: by 2002:aa7:8886:0:b0:70d:2e7e:1853 with SMTP id d2e1a72fcca58-71dc5d54399mr3506061b3a.19.1727848162143;
        Tue, 01 Oct 2024 22:49:22 -0700 (PDT)
Received: from dw-tp ([171.76.83.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bcca6sm9114024b3a.78.2024.10.01.22.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 22:49:21 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, shuah@kernel.org, zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: Re: [PATCH v2] selftests/powerpc: Remove the path after initialization.
In-Reply-To: <20240930012757.2395-1-zhangjiao2@cmss.chinamobile.com>
Date: Wed, 02 Oct 2024 11:15:11 +0530
Message-ID: <87frpfxdlk.fsf@gmail.com>
References: <20240930012757.2395-1-zhangjiao2@cmss.chinamobile.com>
X-Spam-Status: No, score=3.4 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

zhangjiao2 <zhangjiao2@cmss.chinamobile.com> writes:

> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
>
> If there were no anamolies noted, then we can
> simply remove the log file and return, ....

after the path variable has been initialized.

(minor nit)


>
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> ---
> v1->v2:
> 	Remove the path after initialization.
>
>  tools/testing/selftests/powerpc/mm/tlbie_test.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)


Thanks for the fix. Looks good to me. 
Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


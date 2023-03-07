Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8A6AD6CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW3w532XXz3cht
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:31:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lVPfTyAS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lVPfTyAS;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW3vD0WWLz3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:30:47 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id d6so6944936pgu.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 21:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678167045;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XCBEBrW4KvfUOG26x/G4IxQZmFPxnQCEMhbweDvrUY=;
        b=lVPfTyASkjYG0xnrzjzqppKWof6Fj7btl93WfQOXnLLBEdWjofk1J/zkxO0wKN01Mt
         qzTElNXMsRid7cPPq/vg1kgTNAOKFLQnrbrWnOp4kdsu/UGmkOxOPh1oRCtVc2ehho+t
         i30X9XZ29qj35nP3aKkosVNaig8oWBJHrdi3lNz3wMT4/f1VJ6GSjd7nwvy3+48b4FHQ
         fGw6yQkLyg0j9IRe3IcW3/b+m4/0A1VUZOw4rnfv3a1pUZE0EwYqYRYLqMoIW29op7+0
         R/87PmsUMwNipi4JxdzXMmG4OtS45dbRrBrqlyqYb4UThmJfd1+hf9xpYTB5C5JIQRpA
         jXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678167045;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XCBEBrW4KvfUOG26x/G4IxQZmFPxnQCEMhbweDvrUY=;
        b=n0/XhuDGa+BT8weSPDYZ4aN1Rxb3XnCf6wwmOhOyfWJWA4bRhgt5rO3kArb053UXRc
         DbwRDbJ8kQ6yxsv26odWpNQMyYJGeGVdKtiwyzw65eQwLoskEOYNWMGOd879AnjBG+7P
         o6sRzWDxLsWL+TNJzLE4JVlQgJfoLzmCJNE54+mb+a9dIADdC1U1l/TWD1wpjZQYMu+I
         kWVdu45nctc7p3tO4iwLYAUp664wY4h0ZCenY5oM+rNkdDWccwZATv5c6zkKWhy6jux/
         vp96U5/Np+7P1z1zgk4VZ9dnJZ3OIzj7fRRV2NTJZEr4RRzt/pfSikP6w3KiNVSklI3H
         Xg4A==
X-Gm-Message-State: AO0yUKXNhGYCiaaJq5Yg+DnJLX8cqPZYw5eESPwUuzJLxsXBh8v9P+Jw
	vU1JWkhlSRUrZJxY+N9Te8qFiYsh4aA=
X-Google-Smtp-Source: AK7set+TN1hNGmcvzRh0OOKH77hWokb+NdmKcrZ8TCKMjxGyGrByxJaL0z9+yvxtyzYG8jN4g3ZT5w==
X-Received: by 2002:a62:1dd4:0:b0:5d6:138f:5596 with SMTP id d203-20020a621dd4000000b005d6138f5596mr14087706pfd.14.1678167044871;
        Mon, 06 Mar 2023 21:30:44 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id j13-20020aa78dcd000000b005a8bf239f5csm7174096pfr.193.2023.03.06.21.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 21:30:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 15:30:39 +1000
Message-Id: <CQZWKF2U2GVM.1X6AAD3SM05D6@bobo>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 07/13] powerpc/dexcr: Add sysctl entry for SBHE
 system override
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-8-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-8-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> The DEXCR Speculative Branch Hint Enable (SBHE) aspect controls whether
> the hints provided by BO field of Branch instructions are obeyed during
> speculative execution.
>
> SBHE behaviour per ISA 3.1B:
>
> 0:	The hints provided by BO field of Branch instructions may be
> 	ignored during speculative execution
>
> 1:	The hints provided by BO field of Branch instructions are obeyed
> 	during speculative execution
>
> Add a sysctl entry to allow changing this aspect globally in the system
> at runtime:
>
> 	/proc/sys/kernel/speculative_branch_hint_enable
>
> Three values are supported:
>
> -1:	Disable DEXCR SBHE sysctl override
>  0:	Override and set DEXCR[SBHE] aspect to 0
>  1:	Override and set DEXCR[SBHE] aspect to 1
>
> Internally, introduces a mechanism to apply arbitrary system wide
> overrides on top of the prctl() config.

Why have an override for this, and not others?

Thanks,
Nick


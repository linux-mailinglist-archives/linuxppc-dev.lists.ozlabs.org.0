Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AD33E253
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:46:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0VLP2Gn9z3bqM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 10:46:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N4zhpnZ4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N4zhpnZ4; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0VKy6PbFz2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 10:46:12 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so4384124pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=cEvxRc0c1Y4se9JLaSV3NX67TgoP690UN4wrhXHru2A=;
 b=N4zhpnZ4zyuDffP+T5RSIDHDakynA8rI6nlmZbf+0e9mTcFBhwBWCLGpS2hZ+v4EZN
 1OwdRwBMEv2egYQ/HoRPo8NWH/Df1nszBqDPWjdTHF5y7DaxX5A1RCQo8z8yB34XElB/
 d47858XbJaiMpTPM7v3/d+dmE77l8zAHHIizVSN1cHx4X8foGGLMoMfQ2Hi/El4Iui3E
 +3P+zuj/tJFQo0uyZb+3ZyxdVupIxvreE9YnikdjDLjLC45+dZ8nn7mp/kQACnUe98vP
 Ff+8u/LX+M+pR2rQjs+2SBCPhq44PP8foW+b7tY33d7sCyThGWBm8Sc9aUPCMVnManEs
 /hYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cEvxRc0c1Y4se9JLaSV3NX67TgoP690UN4wrhXHru2A=;
 b=L+IqK9QamiG6IVw1gqaSfXCTGbFZq3EHsX9tZVbjuHpUNrFoIbOETePSBwtzqvwD56
 uyUF9I9KlumLG69p+kV0dIkAOpyLk1ztfELD8B8qLYOI1igF8CsrMeNOP7nbtnLPRkpx
 haEmZvCHAuRLbbMadM6a5EkPMHhrZPRzbBj2UnA+jmSZzRIHB3nGDk+r/AWj1fxOTm1H
 /4mAqwm1xQRxX4JY4RRf+WUniJCjUkjUKtKCfBt1y3ClfQWRvdRPK1cp4jQzcI1MAgV0
 qsItWu2d5WB4Rv/63KGSIB30RuhgC1BzEj2YiISdqqQQv0ERfdNjBt+6McL7mK6tpvBa
 K37Q==
X-Gm-Message-State: AOAM531hnPEW4W+3dxXMen7OYTn9VXUehjIs81trN/ZHsf9LdWdEnhxk
 0icVWsmZf7ykZSMPigPb7O4=
X-Google-Smtp-Source: ABdhPJw8Eg+mzKhXdjDEZDJy+R4iyB9OB8J71AlsNj7qKoNdrmSic1amlyPK9OdfuUlNcFfPIka9wA==
X-Received: by 2002:a17:902:b68c:b029:e6:bb9f:7577 with SMTP id
 c12-20020a170902b68cb02900e6bb9f7577mr1652763pls.0.1615938367537; 
 Tue, 16 Mar 2021 16:46:07 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id d11sm424776pjz.47.2021.03.16.16.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 16:46:07 -0700 (PDT)
Date: Wed, 17 Mar 2021 09:46:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 10/14] powerpc/64: use interrupt restart table to speed up
 return from interrupt
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-11-npiggin@gmail.com>
 <f39dab9b-2f16-4c3d-9d7e-4fd2487c5c7d@csgroup.eu>
In-Reply-To: <f39dab9b-2f16-4c3d-9d7e-4fd2487c5c7d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615938093.2fovnegcfp.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 17, 2021 5:34 am:
>=20
>=20
> Le 15/03/2021 =C3=A0 23:03, Nicholas Piggin a =C3=A9crit=C2=A0:
>> The restart table facility is used to return from interrupt without
>> disabling MSR EE or RI.
>=20
> What happens when an interrupt happens between the point you restore the =
user r1 and the rfi which=20
> returns to user ?
> If an interrupt happens there, the interrupt prolog sees it as an interru=
pt coming from kernel, so=20
> it uses r1 as is, but r1 points to user stack.

The interrupt is "soft-masked" because it arrives from kernel with an=20
address below __end_soft_masked. Masked interrupts never touch the=20
stack. It then checks the restart table and finds an entry, so it=20
returns to the restart which loads the previous r1 from paca.

Thanks,
Nick


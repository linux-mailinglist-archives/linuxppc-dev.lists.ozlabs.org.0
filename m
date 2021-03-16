Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F168533CF6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:14:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F05fr74hYz30GF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 19:14:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZKRbGQu8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZKRbGQu8; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F05fR5Dkzz309v
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 19:14:07 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id q5so9436031pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=lT8SUaLF+mmlr8i0TAnT3apjIjTenmRdwxsTokS+wZA=;
 b=ZKRbGQu8wVh5IsGxHPn+UMKZAoMKN7ivIFzfv3NsJ/cbgZbNEbNP821l9PEhF22yKv
 XeVWPA5p2RpQWjK/2whatFyo/fb5i/LA/ojrfSXHxzITr0DzV8qPx1p8iaF7A0fe7K1b
 ta47+1z/GjJu2nhegrIZ4OAwXvEP6PfCj6FgupufwzjtuZ3Ii0WFHoIwDFqP+9J7JrbE
 BUA7lEO9CzhoteJkuBywtxSRw+HpL7FsG59IUGgqSV7kxcqK0FVnDJ0A2fsc89iMRe/y
 L3hBq5uiNM9Kw5lXuabTVUWSpZE5oMGINwVGRt0akgtX1080TtwJcBPRXTUQbsPMSyt6
 Angg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lT8SUaLF+mmlr8i0TAnT3apjIjTenmRdwxsTokS+wZA=;
 b=sT2IQekq6fwCR9MJJb8MYhpfRRxjs5RxDc27cZ7E20W1ieMC62chv6ra3aGpTz7bL5
 sBs4CjTaY16K7WcizsXjrwPwzId1ISxuXj0ELY65+Kbq8uV/VuSaHfWkKo/bF1fNaW3S
 Zsx/h9QdtiV5CTxYArp6mpptcwMRkERcHY705RKBC3jPk3T8XxkahSk7JlWiBer6Enb+
 OJwEGKcqmMbgaxq5bpBoKOaVI16/LPSvpv5Ch0U+X/bdjpQEroUbfp1lmD7154+ligYI
 tGVirkc9QCC+gRgnyJu8QD0LpFIl3t16U+XFV9EbqU7dDF1p9oLiCOcdPLqHv2EV85mB
 yRkg==
X-Gm-Message-State: AOAM532f/NMq2p/4rz4ZJtr7QOvGYxnvn0JFSIxCukLsjI+9isCsT9X2
 793G+SYKK6mwTlZXUfaB2okJYk3IE9w=
X-Google-Smtp-Source: ABdhPJzgacyUZJTdgyeST/Ur03aVQNMdR044IyfCxjuhXOVDJ6xHfOOhCQwXOcrHh9NZT1zUCwVMcw==
X-Received: by 2002:a65:57cf:: with SMTP id q15mr2922777pgr.380.1615882445683; 
 Tue, 16 Mar 2021 01:14:05 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id e65sm16506734pfe.9.2021.03.16.01.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 01:14:05 -0700 (PDT)
Date: Tue, 16 Mar 2021 18:13:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 12/14] powerpc/64s: system call avoid setting MSR[RI]
 until we set MSR[EE]
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-13-npiggin@gmail.com>
 <722aeb8d-507f-6702-dd79-26242f987e3e@csgroup.eu>
In-Reply-To: <722aeb8d-507f-6702-dd79-26242f987e3e@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615882358.qa7smziqw9.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 16, 2021 5:21 pm:
>=20
>=20
> Le 15/03/2021 =C3=A0 23:04, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This extends the MSR[RI]=3D0 window a little further into the system
>> call in order to pair RI and EE enabling with a single mtmsrd.
>=20
> Time ago, I proposed to delay that on PPC32 and Michael objected, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/9f9dd859d571e324c=
7412ed9db9da8cfba678257.1548956511.git.christophe.leroy@c-s.fr/

Yeah, it is a concern. The speedup should be at least 5% I think on
64s (have not measured in isolation yet), so might be worth it.

We'll see.

Thanks,
Nick

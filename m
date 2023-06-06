Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085B724E41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 22:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbMmw70QBz3f90
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 06:40:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EcJjynAK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=umesh.kalappa0@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EcJjynAK;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbD0D23g8z3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 00:49:47 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-978345f3798so228093066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686062981; x=1688654981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpkqFdTAo1CnXYTWVYWwXFBYf4qzMb5bx0M6Vot3FVk=;
        b=EcJjynAKDK1kl4hhMK26FLJYrnfGsoL++u1OxDXIgdQ6XRfhrc5XO50CW9YwjQHorc
         wKXCkuulVDpJ2Yvwi2gdbt5u+q8oIZbkp07rd96EY2azhblqe3NQcCaq67VDESCGUn3N
         9GbIkyDVeAc8dx5ZxeNCSCXtB7/3io3jWSRGWQ6l4txo3HE24gvL9YhDzHDBMvOyX2ou
         ugEa+F2GHpKkM9Uw68IxxePJDzB04Vmntr/mJ3K2zJ0CfPF6JvbUcQhkysd4Df3lnwAw
         zrqRpPII17xPTunnLksYK/8CvaRuz62vseP0fIhUCDPJafF5FDZKsXAoXhuLwnA6saAE
         el5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686062981; x=1688654981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpkqFdTAo1CnXYTWVYWwXFBYf4qzMb5bx0M6Vot3FVk=;
        b=U4HHEJgPsJtmg8v3jCkL4mQSUSFXo6l21bgdKLHFYha6wCbyEb4qDqRoP1p69nPpfi
         pRepVLsiVlpbzHhz7YoslCM6JpQG0xssqgeU29xYZgSjpbAkTGc0lC7LHhBmu+4Ag4V1
         nqrGsU0o9CMC4n6onBhD5DZqYXgtnqh7+CVVlQ0qVb/RcdOWGTzsKp6AxoW9UuEMs1bl
         1qxvRLYu2KoO8kFJ4vWG7gneCM9Uj1zn8zTFx/e35kx/JrB2J6yV9GP1gwyB0Lw2o61S
         UG5yE04F+Ka9jckDKuEa7Uu8xbXX+aY6585m5xsQNSMLasSwEZpz53zh3WnVOEJu9Zj5
         3CFQ==
X-Gm-Message-State: AC+VfDy6bJ9DzQFoPQWcEMXa/Yma7C9xad6eAttdC80dbTkdOsIUpruT
	/irdjpXs4XJUjf4dNvFVwOL5FRg9hADYePt9Tjw=
X-Google-Smtp-Source: ACHHUZ42tCScP2Ejk632+ecDcm2tY1vrZYr6F/oryV0ZclVkxNa4bqVfiyj4XnkGXmCcGI7pwbSnRAAi8FCalg7olb0=
X-Received: by 2002:a17:906:6a20:b0:94e:48ac:9a51 with SMTP id
 qw32-20020a1709066a2000b0094e48ac9a51mr3096242ejc.4.1686062980773; Tue, 06
 Jun 2023 07:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com>
In-Reply-To: <20220524093828.505575-1-npiggin@gmail.com>
From: Umesh Kalappa <umesh.kalappa0@gmail.com>
Date: Tue, 6 Jun 2023 20:19:29 +0530
Message-ID: <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
Subject: Passing the complex args in the GPR's
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Jun 2023 06:39:51 +1000
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all ,

For the test case https://godbolt.org/z/vjs1vfs5W ,we see the mismatch
in the ABI b/w gcc and clang .

Do we have any supporting documents that second the GCC behaviour over CLANG ?

EABI states like

In the Power Architecture 64-Bit ELF V2 ABI Specification document
(v1.1 from 16 July 2015)

Page 53:

Map complex floating-point and complex integer types as if the
argument was specified as separate real
and imaginary parts.

and in this case the double complexes are broken down with double real
and double img and expected to pass in FPR not the GPR.



Thank you
~Umesh

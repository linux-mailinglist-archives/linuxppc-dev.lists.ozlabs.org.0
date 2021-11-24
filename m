Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F345C206
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzhWG3QF7z3bj1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bGwnHyiz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bGwnHyiz; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzhVX30BPz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:21:38 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id h24so2546877pjq.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZZnceqICuZXQxPcm2fjZ+yNkedIH7ExOGImuK8kHxUU=;
 b=bGwnHyizE2euGF4OJfhTDD2tgzRvAWwF6PN/DkgD6CTp4z8K9eAW13Jav2pgjImfCK
 OSon47t018CdVGm9mwvb/92iEYY3llvVuiiZW7fYtR9jv7GbrAtRGtB7p9qqlaXU2Lqi
 ZGdLYeQHe9ZPJwI5yEtPPR5WbEApMhzyIgis689/J6Y/haHI6FN4DbeQoA11s9T24lyj
 W/TaflPrQrNy0nXT2rAVInzq+weBRQ+8Is7lcmA7fV5km70Xd8uF/yJQnvd983gJ0DiN
 GTFC4E0k8tzzeXwn8H4YWGoe67sR09wIqkHUQCsSB1hU0+VljxCfrne+wrRW2W19Blp7
 2Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZZnceqICuZXQxPcm2fjZ+yNkedIH7ExOGImuK8kHxUU=;
 b=VLfOQDDInXfEKU94lKSCI1tF8gP9DpXo8HWyplyTZLrjk10gosVKA35FBmhVVVI3Ej
 KUXcUDR0yJyvADBL62GlyipKLudIzhXESfkhE6XF8wjPP7SOnoameosam0zfEQEh/3BL
 7CCuEDRkskSs6RTjbxFvwoGHDY8W0La4GHoEjKcCCHurj+durqv03BfTSF6GMDQDfepa
 ehgN04O65cIvpfzt/mnDcWP+fej6ZlR9xG1KriqZ4GFUz+MEZ/W/wcbrZZYbvrrdwIdp
 ZKjz2iv7NnQeJOgeujDZ3XTTFhiaVLgSL0I96rd8b36TcnlPCLYxHlMOVlt46soxrgvI
 6TUA==
X-Gm-Message-State: AOAM530S5fTI+x3SKxv+iTvXFOM7EAbgJmsDwO7Qa9LpAHDbNqnJUGlB
 Ij0VMzIiAoElpeqqpruWWUY=
X-Google-Smtp-Source: ABdhPJz1FI1FMD+raRAIrvhT0VvCzZtUkPciJvFR7lj0nGhiV/h2EIZmuWty/vs4et/iSU5mts8Dqw==
X-Received: by 2002:a17:902:c202:b0:142:2441:aa25 with SMTP id
 2-20020a170902c20200b001422441aa25mr18417025pll.68.1637760095555; 
 Wed, 24 Nov 2021 05:21:35 -0800 (PST)
Received: from localhost ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j6sm17055518pfu.205.2021.11.24.05.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 05:21:34 -0800 (PST)
Date: Wed, 24 Nov 2021 23:21:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/8] Convert powerpc to default topdown mmap layout
To: alex@ghiti.fr, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1637570556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1637759994.e3mppl4ly7.astroid@bobo.none>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 22, 2021 6:48 pm:
> This series converts powerpc to default topdown mmap layout.
>=20
> powerpc provides its own arch_get_unmapped_area() only when
> slices are needed, which is only for book3s/64. First part of
> the series moves slices into book3s/64 specific directories
> and cleans up other subarchitectures.
>=20
> Then a small modification is done to core mm to allow
> powerpc to still provide its own arch_randomize_brk()
>=20
> Last part converts to default topdown mmap layout.

A nice series but will clash badly with the CONFIG_HASH_MMU=20
series of course. One will have to be rebased if they are
both to be merged.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2C3FB179
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 08:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gyh2Z2YRSz2yKZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 16:57:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bB6fUoU4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bB6fUoU4; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gyh1t29cwz2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 16:56:34 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id 18so11412021pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 23:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=0DWatEJ2pmH9pDs9n/P1oCvJfB/fT7wyvhrTSVQuRcw=;
 b=bB6fUoU4V6rkrqCJp9sdUjCb208gNcO9r+ydSVD20APrhP5KdNkWNmKAcwjxNvUP2Y
 Y6padVCEP5P5D7qN4hIGJWlGxEew8IuVeXD5bu0uzs4PU5gyxmiRsiEcjjvNWmLl/KCu
 0jsbi9Z30bDgW3PT6PfcS5HdCqiTT5EPYWuAKpyUYHrBZoQWysMsdppk/Ur1oj4QQmkY
 yBvkkDF2RJTpoR2C/rpPXqO4snn7Q4xBnlnTpJwfs46qpLcjmbpzuhBLfTGeHut9rYp1
 aL5iNIVjPiWoUrzOnSj/ujAypEIzZr6yJ2Dimfrh2Q5OqGEhoG/uANnxe2MxTPjUBViL
 /Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0DWatEJ2pmH9pDs9n/P1oCvJfB/fT7wyvhrTSVQuRcw=;
 b=XsXWlYP3/u2jsq3FhzMcFAA9pPJEytj3L7KLHS5gyaShaX5Mdl8dGzju4vP9aNUqMC
 Vn9gqTBQXV6Z4D2MBNQOtRLd5p66ugbYW/7V7K4gCNaDTw5Y/FnL77DAUmp120BBOWX6
 Wm0dd5ebRN/N8DQpQ0t4u3PRDR6OvqM2qyXDLvvDeGKOmopokSulbwbH+mPV1UMbadEE
 76zB5CrvE6eif7DjvDa9fWDQGmrFLsjVVYSl3EMwDd8tHS5FUBncAScBKUe1UQHemG+8
 P0JfjKXywEzOwdCvPP7tXbcBE9H7P4OUPnB0OlMuVQqP6gSv4xAvGaiR7txri2xT0cIA
 cSEg==
X-Gm-Message-State: AOAM532ssBiOc9KQ6Vc/HahPxBaxwn23YksC147JdRHQQG/LKFyFQQ6/
 z+OYg3ZZ+mVhrrmqdeFsx0J4Woas5AY=
X-Google-Smtp-Source: ABdhPJyw4Pvsla4s57gtOF1dK02hwt+LZaEKsWHbGziukoVO3nKApfawav29ul0/YaIuWZ9d/SYJdA==
X-Received: by 2002:aa7:9436:0:b029:30b:30ba:5942 with SMTP id
 y22-20020aa794360000b029030b30ba5942mr21404955pfo.47.1630306591261; 
 Sun, 29 Aug 2021 23:56:31 -0700 (PDT)
Received: from localhost (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id n3sm13386291pfo.101.2021.08.29.23.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:56:30 -0700 (PDT)
Date: Mon, 30 Aug 2021 16:56:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 5/6] powerpc/microwatt: select POWER9_CPU
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-6-npiggin@gmail.com>
 <ee10053e-f007-719a-9ab2-a14388c9af9d@csgroup.eu>
In-Reply-To: <ee10053e-f007-719a-9ab2-a14388c9af9d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1630306524.pjdma7ta7c.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 28, 2021 7:50 pm:
>=20
>=20
> Le 27/08/2021 =C3=A0 18:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Microwatt implements a subset of ISA v3.0 which is equivalent to
>> the POWER9_CPU selection.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/configs/microwatt_defconfig | 1 +
>>   arch/powerpc/platforms/microwatt/Kconfig | 1 +
>>   2 files changed, 2 insertions(+)
>>=20
>> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/con=
figs/microwatt_defconfig
>> index a08b739123da..bf5f2e5905eb 100644
>> --- a/arch/powerpc/configs/microwatt_defconfig
>> +++ b/arch/powerpc/configs/microwatt_defconfig
>> @@ -14,6 +14,7 @@ CONFIG_EMBEDDED=3Dy
>>   # CONFIG_COMPAT_BRK is not set
>>   # CONFIG_SLAB_MERGE_DEFAULT is not set
>>   CONFIG_PPC64=3Dy
>> +CONFIG_POWER9_CPU=3Dy
>=20
> That shouldn't be needed in the defconfig because you select it below. Yo=
u can use make=20
> savedefconfig to confirm.

Good point.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57D6FC1B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 10:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFrpX2vyvz3fJx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 18:26:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aodDrRl9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aodDrRl9;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFrng29sJz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 18:25:26 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64115eef620so40601695b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683620723; x=1686212723;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6DsCGsUXGDhkChqurMX8resBz4nqk/3+owk5MpxCY8=;
        b=aodDrRl9/povbI6maFSBUZOdHabsyscKmYa5aFKvArg36KOLJEZQISSlK3+YBEmxlL
         0li0iBgKbjaqviGHXyi2DuNJhbFCvyCiLKMPAmDn1OTHojdw3NAQfwUGyFbwXHeJnf55
         YTgmZIWe2sKw8yI8hd+CYgZU+bK1fufAEDN6vbNmedSZJEJC3no2N00y5YNdy49lEjqB
         uRCGz9heyfCwd4wW+tyrgm6FgXJm6bp6/gmKGli1fbtavxk1aVJtZ2oi8CFnsmYJRLdr
         MPF7k2V30xOgI7vKRdAvuM49hG38kioYczqrVLE8fOUcgfcjHN2vVu7RvJwYbTZfKH+p
         wvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683620723; x=1686212723;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U6DsCGsUXGDhkChqurMX8resBz4nqk/3+owk5MpxCY8=;
        b=Qgc8SFS7mBXtn7PtUuYE+WPhbdZEIMDYZ9Xn5Kb7dqC3SMVBjs5jUvpanC6roYEdMI
         KuGQpA/KkRi3QxgA/y51v4C0ujWsntkcXA2zfPlnDB0PlqNZpbS7HmSldu8YRej9qxTg
         cej3oMSgi+WnGFfTvUjAwRPN/P8+y8sM+YcYdMHCgwuaHMfalmeaUivjXCqM6bbKYYBe
         MZw09U41vqm3p1EQOUm4MakcJF11twV/o5qJfkOJmlFq1tyCW6Gqn25EsFAhjhPnSStn
         sE0n1Ff2tb5Ti9BIERHvxTTZsxgbYI3LseARC5C99lyVx5LapPnwIIYmsIJT0VoL0PJt
         mWUA==
X-Gm-Message-State: AC+VfDwBdrQ5jRAvBBNEftaY/NXDDYdlQ4hfGzxs74wMaNJ7ZKEbSz4N
	gXn+9YDY0GhO0lpixx7O3PI=
X-Google-Smtp-Source: ACHHUZ6wggyA3oDYwIzdEIZZvFPdYzZjwctxKgmvGnlueptXtM/T5P++XryLk2oO2yQd3yPt4vWcGA==
X-Received: by 2002:a17:902:d50c:b0:1ab:f74:a118 with SMTP id b12-20020a170902d50c00b001ab0f74a118mr16439827plg.19.1683620723330;
        Tue, 09 May 2023 01:25:23 -0700 (PDT)
Received: from localhost ([118.208.131.108])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902b40500b0019a6cce2060sm925111plr.57.2023.05.09.01.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:25:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 18:25:18 +1000
Message-Id: <CSHLQGQA5FL9.2Y9YRT25EOJ0W@wheely>
Subject: Re: [RFC PATCH 4/4] powerpc/64: Remove support for kernel's built
 with ELFv1 ABI
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230505071850.228734-1-npiggin@gmail.com>
 <20230505071850.228734-5-npiggin@gmail.com>
 <28e90ac6-ae84-b0cd-1c3d-d5d93701b8cc@csgroup.eu>
In-Reply-To: <28e90ac6-ae84-b0cd-1c3d-d5d93701b8cc@csgroup.eu>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 6:49 PM AEST, Christophe Leroy wrote:
>
>
> Le 05/05/2023 =C3=A0 09:18, Nicholas Piggin a =C3=A9crit=C2=A0:
> > User code must still support ELFv1, e.g., see is_elf2_task().
> >=20
> > This one should wait a while until ELFv2 fallout settles, so
> > just posting it out of interest.
>
> Can't ELFv1 user code run on an ELFv2 kernel ?

Yes it can and that's what ELFv2 BE kernels do because most BE userspace
is ELFv1 (although some are using ELFv2 BE).

By ELFv2 fallout I mean bugs and toolchain problems that might get
discovered after we flip the default. I think it would be good to keep
the ELFv1 option around for a few releases to help testing such issues,
the revert will probably pick up conflicts. Maybe that's being too
paranoid.

Thanks,
Nick

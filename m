Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF87714642
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 10:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV7rS164Qz3fHt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 18:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R1NVU0pq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=R1NVU0pq;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV7qc01CCz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 18:24:41 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d3bc502ddso3636117b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685348679; x=1687940679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvt0GJ2QNY+rFYHNBGjXKBYm5GhXHIFHMKlgbX9PLZk=;
        b=R1NVU0pqq0Dlw2lqS4BrSYDie0cRmWwcq722khiiwhlJ1YNKNQ0F6ayuf6Jc25fxEV
         REWSG+z/8WPD1DjCSlsculfyM8tkigqWD5Xj/GJgTPI/phXg37BIF2Hi+yX75SRZLHfH
         iwMokATwsMXSgyps3tN4o2dssa+qY6qCZGwo8wmc+XSLWsrGV0IQmlfiDHLOZiP5RZ5v
         lumbspD7eBzCD6D9G/IHfgfBHPwHtZyw4gl8zf/PJJ+X1RDJd5jkrS6S2s4/C7YW0QX3
         gfLh/85bQ4+4Mj/MxQyGhAI3ac667ZIJMUpq4XfMCUES7qk5Ra1ZRe3TWU3wGHqBzDik
         qKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685348679; x=1687940679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvt0GJ2QNY+rFYHNBGjXKBYm5GhXHIFHMKlgbX9PLZk=;
        b=BcdbIkZO3lAyVfN1MCck3isW1p5lVTy7CpweqWkDZLc9bhPyZ7GPKP0W/YaGlGUSMK
         d4vca35Lak2yWbHu4mNad9V1VWXy4Nqe7w4+KdCb9k6iazK66qBDFWcCNH/t8yBfA9r+
         3ZxyJdvFFUDlcVqNN73Qx/rdaEKKqTM0KXXwpXfK897mrOtFrHMoTL77ByRZOFXwi2/p
         PrqR5oG4t3WFOfh62rH/p2UKwhf2p/ZbN+zYUIqjeTiRsOX+1Sao1sC4C7b9WBfIDM4q
         ErjI1mHw+61s/aCpbZQpqobu7ROU7wj9kTUxyineRi2Ajq3Vt4yIRNADUBTMnOjDE0UN
         vNNA==
X-Gm-Message-State: AC+VfDxtlsuEgtnPXEPZ24D0aVzNTc1n1/A3WQnLiLobIrAAvul+Lsy+
	85iVv/6dcYbpKzXAiCVhK5E=
X-Google-Smtp-Source: ACHHUZ70mYW4u96RSo3Ry/YJBBDWbyHuvhnrjdHhLlQ0uGBtm0rqCM5LLQsGo//UKx+Iq7pYhSiRZg==
X-Received: by 2002:a17:902:a610:b0:1b0:4b65:79db with SMTP id u16-20020a170902a61000b001b04b6579dbmr475567plq.63.1685348678850;
        Mon, 29 May 2023 01:24:38 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-78.three.co.id. [180.214.232.78])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001b012589c49sm5637750plb.78.2023.05.29.01.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 01:24:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id BD8B6106A11; Mon, 29 May 2023 15:24:35 +0700 (WIB)
Date: Mon, 29 May 2023 15:24:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Doru Iorgulescu <doru.iorgulescu1@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Message-ID: <ZHRhQ92aXQCQa_yK@debian.me>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <87bki9ai11.fsf@mail.lhotse>
 <CA+39qUjP48n=EwqHzwdGkBE8SC-nTNZHZxEfG4r4hWC-5Bg4HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0n99li26aKBWElc"
Content-Disposition: inline
In-Reply-To: <CA+39qUjP48n=EwqHzwdGkBE8SC-nTNZHZxEfG4r4hWC-5Bg4HA@mail.gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Linux Regressions <regressions@lists.linux.dev>, Fabiano Rosas <farosas@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--n0n99li26aKBWElc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 06:13:52PM +0300, Doru Iorgulescu wrote:
> Awesome, thanks!

tl;dr: see [1].

(Hey, looks like complimenting noise here.)

[1]: https://lore.kernel.org/regressions/5df92692-296e-3956-24fa-2bd4393379=
53@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--n0n99li26aKBWElc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHRhQwAKCRD2uYlJVVFO
o+jyAQDEMW9U8RtyW3eLmz1vfYY5zX7zMISeoeMx9Ep+ODtNAgD/XvY+dmTzM2sW
OCQZJxqHfzgzTV/+CFXMZ4UMTRIWagI=
=vA0l
-----END PGP SIGNATURE-----

--n0n99li26aKBWElc--

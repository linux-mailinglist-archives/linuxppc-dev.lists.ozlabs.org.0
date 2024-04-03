Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3A897CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:57:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CJV5lyId;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91rL5PVrz3vXR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:57:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CJV5lyId;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91qb540nz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:56:26 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-432ffed0423so2058881cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188583; x=1712793383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtx6JsGuIZN4xE5atG77jiNDItUL3W3itZ8d1wNeS+8=;
        b=CJV5lyIdDm7qxMKxiHTXtdPgRI6jDWoOCrDppBONjvEAQkOhClyDRCuPXfMou2iGmL
         EwYsqB8Tjf5fKs7HpMmV6FMQM6nmoBLCk3KRVol56mg1SkRKW9LiG0KKknhMitQ8kxEr
         ozisOkbdT/nlI09M0tGjxw2hXYsco1QOOKMJ2qZlj6P3DK/DKldY/a7Bnu/B9W60S2pz
         yXykDILhDQaNxl8pWjzi/W45U/Uc/cpXdzWtXjCzL/+Caqfp2rJgSZS94G9e7wwwHwbQ
         zNQH/9dGwjGF+HVBGJXZR9Ha1ND0IwV44aTC5Xg0Gswt6V2rkqYQ5hYOb5leg1rCHYZG
         0ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188583; x=1712793383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtx6JsGuIZN4xE5atG77jiNDItUL3W3itZ8d1wNeS+8=;
        b=jQRzPNu7xBfCNe+ZXLLgIHFBhnDdoqHpLAi2UMEb0dL5f9JketcQx02CAZ/JvFHg+m
         LAQqJ7YCCWYMDyaLl+cycG23qTEe4b1CkVPabAeG/nrwDSN34+exYM8dbqqrDUUiGI89
         PUCiJc0DjInraESju5ZX2sJ0fJKgMv0ZEpNGCUc5DDv0H+jjRg6NBb56R1Y0V9YR+pJE
         PvcPNonMNwgebflsgw3U9XHsYwe6TPGHtRq3eU4wQqiMBb/DfKIoIqXwHtXUxFQfLj5T
         sRJ4b9ISE0nL/jJ9dl3FAjNE/7jnZb7bpyHwP4W3YMWzn0HF7XIcIvrEgL9637ZkyMae
         oClg==
X-Gm-Message-State: AOJu0Yz5IvVDclJm9RLCc9EsEuHNKpOJG3VUhlMdANe8qJHkaohs1wxb
	PFkGSIeybtGbzC77uf8aD6E7b0flDJc4ztfwRbjL6Roxf5yxfRsUjBN3KHQ2ALnE0+DIl2x5Pkq
	jUMiBAnDMD6kM44h1SDRa9cBg2ySkutGMEHezaw==
X-Google-Smtp-Source: AGHT+IFslM4TSQsZdneQcISvGVahDbSVOm65t2d3Bvync+fdqoeoqMKc9B2c1QZr1TF8qlqSyaKDNh1QY8WU0aCtyXE=
X-Received: by 2002:ac8:5786:0:b0:431:82d5:13d5 with SMTP id
 v6-20020ac85786000000b0043182d513d5mr836197qta.9.1712188582732; Wed, 03 Apr
 2024 16:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-9-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-9-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:55:45 -0400
Message-ID: <CA+CK2bCgLrre3JYYz4MyMu+g9Zzvqnwaxd_xm0X=ORG5wkeD6w@mail.gmail.com>
Subject: Re: [PATCH v12 08/11] powerpc: mm: Add pud_pfn() stub
To: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 2, 2024 at 1:11=E2=80=AFAM Rohan McLure <rmclure@linux.ibm.com>=
 wrote:
>
> The page table check feature requires that pud_pfn() be defined
> on each consuming architecture. Since only 64-bit, Book3S platforms
> allow for hugepages at this upper level, and since the calling code is
> gated by a call to pud_user_accessible_page(), which will return zero,
> include this stub as a BUILD_BUG().
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

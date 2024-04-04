Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E7897CD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 02:13:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=F22AEsdo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V92C94yGhz3vXy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=F22AEsdo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V92BS2N2Vz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 11:12:47 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6151e2d037dso5138167b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712189564; x=1712794364; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NS7RXz95lan08w3jmDkFk4FxH6W/mJ5XV1pPL/c834=;
        b=F22AEsdoXyyO2OzVtC5WdS9GQdYVM2qbDtVZ0r68guI2ENbQYMDevIuyit7gpz3wBE
         72F87JU53TsHO/92dgdCNvBQODqRwX3n18pdj2TRI6gpFqa5CqTRq6+VoQEjYpYbmldb
         SzHZBBPrfaxt1uoHWtz5VgwaKzNb4dkBxUud+J3dYVWol1XyRwGh3rkMc/SBnNWH4jTg
         VoYFXRfK76aJVEYiRfjchslfMHw1dGMLQF8ch1poGftqC366c6cWL2OH4ypVim3pzzSU
         +xKHdcZbenSar0jO7V9V3EuGw51c7+PJ/1DfvGvQ/aUw8WHSvswV1Uazh3VV6EmEs78Y
         lVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189564; x=1712794364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS7RXz95lan08w3jmDkFk4FxH6W/mJ5XV1pPL/c834=;
        b=uOy26GP1fQ65y+kSP3vOENKxbz3kev1gRH2CJl/0/5dci2uBXxaKDZOis7Uh49uPu3
         1KEanzmT2Lbq1adQ5VGDTKsMIbV8mBWmHay0l7zPOVjoeVJTn/HOC2DO4t5ArC7bisoc
         drw8mGiwZEJXjqwGtoC5v5JBZasl59ai4OOqZQfGvX3JuJUGQABA8pliW0SbLsJ7OW0A
         k1zKKnnsR73yZ7K0acQQFpwdix2FfCUtNhGT4PQpTNenzUxboWG8JMjOFPb8ReigIfD9
         nqKpuJaIrICTW/4VIn+zp/PhQ2iURgAgCDI9wAY2F/Rev/pimO9Iomp1rJVV2k1M9wNm
         P/MQ==
X-Gm-Message-State: AOJu0Yy10Z9CXy7hhGSLWHG0aOAJzkNaKXgH9lpNRZfCX2Ki971PaHE+
	HY2EXRG33cNFtiCQhml/A75u24RsCFXKDEPDh/Y9D1N7h20FVoFsk8Emh/23F8JWvVPJn9cTquy
	X6WjfBbOp9KddQTXXg27tjFMekJRMwMuIgzMjHw==
X-Google-Smtp-Source: AGHT+IGIN9RjvMLUDIpAmm7RsOi7H4k0RkSaVfgiFkKRBh0h1VzmfcxUfv/UOTCfGZuR0DO8KsX58y/fWkIBiXxYREE=
X-Received: by 2002:a81:7785:0:b0:615:1dc6:429a with SMTP id
 s127-20020a817785000000b006151dc6429amr922136ywc.46.1712189564372; Wed, 03
 Apr 2024 17:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-11-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-11-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:12:07 -0400
Message-ID: <CA+CK2bBeJWo_8kNGr5XoTbLV2gQHL9E=gmv1BxD+d4sKF-mjqw@mail.gmail.com>
Subject: Re: [PATCH v12 10/11] powerpc: mm: Use set_pte_at_unchecked() for
 early-boot / internal usages
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

On Tue, Apr 2, 2024 at 1:13=E2=80=AFAM Rohan McLure <rmclure@linux.ibm.com>=
 wrote:
>
> In the new set_ptes() API, set_pte_at() (a special case of set_ptes())
> is intended to be instrumented by the page table check facility. There
> are however several other routines that constitute the API for setting
> page table entries, including set_pmd_at() among others. Such routines
> are themselves implemented in terms of set_ptes_at().
>
> A future patch providing support for page table checking on powerpc
> must take care to avoid duplicate calls to
> page_table_check_p{te,md,ud}_set(). Allow for assignment of pte entries
> without instrumentation through the set_pte_at_unchecked() routine
> introduced in this patch.
>
> Cause API-facing routines that call set_pte_at() to instead call
> set_pte_at_unchecked(), which will remain uninstrumented by page
> table check. set_ptes() is itself implemented by calls to
> __set_pte_at(), so this eliminates redundant code.
>
> Also prefer set_pte_at_unchecked() in early-boot usages which should not =
be
> instrumented.

Would not the early-boot usage be all kernel mappings that are ignored
by page table check anways? Sounds like it is better to only use the
set_pte_at_unchecked() version where it is really needed, which is to
avoid double counting. This will keep the usage of this function only
for one purpose that is easy to follow.

Pasha

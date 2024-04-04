Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9E897CCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 02:01:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=atVgLshP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91xt3Rjrz3d3Z
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=atVgLshP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91x82Kffz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 11:01:16 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-430b6ff2a20so2182311cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188873; x=1712793673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EouJXf14bYBG3TFDA7FhpXHScaVdR+iW0OTLcyhvMu8=;
        b=atVgLshPLFT/0hbSeaSYajB4T9Ygp6KnMcMrJd9Wp5QyPTo2gNSc+E6/ZLXf7G229h
         oHIZraQxwHN64VwckWswxv7MBaRqd9Ku9F7ooB5R52BkB+MPocgBZgkwIXWO2OYyXXzJ
         Tsoj5m/INIVtpZ807vj3se+0SqulPa/X4+z1zGtmamrdDJN5CTSyzo5ackKnDTyxL+H9
         10hJSL/9sKA5z8lp341LasJ+bWhMvpYqvwzfSDGvvCI3u8w+mmcNCx4rON5Qz1KwCu/B
         aIbMH1s+o0pGBpZkFC53O1VHXQE+mJGICFu3VHZ/X1CMqjpgWtlpPO+xLhsESWIgr7t0
         Xn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188873; x=1712793673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EouJXf14bYBG3TFDA7FhpXHScaVdR+iW0OTLcyhvMu8=;
        b=m3s03byDZej9aiSmLjvwCRHNOBx57GI7Kar/3FMF/ZVTKnmsls+L6AnMO9vAZCaSqh
         9HnGE57PI4/3D0Poc9nzM5YmU4tLKnioxHA2ZgfmhoucV6RPi4/nCT7eHPdmRAvC6uOV
         V17xvAsJYhybyHy7uS+kOA3HycdQMErGJlqQAo5d0mbxD7/cCtSCnme/PfCY3rZtT5UF
         X94W+SJXVIquUJ7cTAsDU5pZRxIq3fwD85K4Frv/tUYnsOzV5kPK1ES7T9nJuRTby/Jw
         VESvWWVG+12gokazw3R4CcCJzyfbwh7uGskGXEG7HU4BIBSYjj5ZXbTqG7tWuJOfz7Gq
         NXTQ==
X-Gm-Message-State: AOJu0Yy9n99zqej/8uFeEKmvq1mV3gXcESUM9FdBNuvdyqTJx1yWmOdu
	2nTNh2/2/C/e77GnSh51Kg2+AzOZsqDkJuV9g7P676PCeddR7QQOAVVEtdkIzrs8K3kYJ0fEHvX
	+fCCGl5Rl/5HJQJK1Bc6D3LVsnA2c5iYT/jXkGA==
X-Google-Smtp-Source: AGHT+IGsXyB4D2wJ0imPILoI1sX0/9gh1QXhIS2cWPu5WGcG8wW0R1/3s3Qb93ZqSuEATVQyB05fmjchi9mzxvRVQ7w=
X-Received: by 2002:ac8:5786:0:b0:431:82d5:13d5 with SMTP id
 v6-20020ac85786000000b0043182d513d5mr844572qta.9.1712188872638; Wed, 03 Apr
 2024 17:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-10-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-10-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:00:35 -0400
Message-ID: <CA+CK2bAh7-HJhV_xm4+yKhwOFp4BO0+VurcXgMZjoOhw+gz1sA@mail.gmail.com>
Subject: Re: [PATCH v12 09/11] poweprc: mm: Implement *_user_accessible_page()
 for ptes
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
> Page table checking depends on architectures providing an
> implementation of p{te,md,ud}_user_accessible_page. With
> refactorisations made on powerpc/mm, the pte_access_permitted() and
> similar methods verify whether a userland page is accessible with the
> required permissions.
>
> Since page table checking is the only user of
> p{te,md,ud}_user_accessible_page(), implement these for all platforms,
> using some of the same preliminary checks taken by pte_access_permitted()
> on that platform.
>
> Since Commit 8e9bd41e4ce1 ("powerpc/nohash: Replace pte_user() by pte_rea=
d()")
> pte_user() is no longer required to be present on all platforms as it
> may be equivalent to or implied by pte_read(). Hence implementations of
> pte_user_accessible_page() are specialised.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

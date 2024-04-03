Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D97897CA6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:49:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TVIpTmAR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V91gv2KXwz3dTm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:49:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TVIpTmAR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V91g63SVtz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:49:06 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-430c03bfcf4so2040011cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 16:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712188143; x=1712792943; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGucdcbEarAoxKuYez/Q9HRuJk+G9fqOigINMEt0goY=;
        b=TVIpTmARLO2mmAjfZeFRdvuvDF3TSGUIgwE3AiKoWTmBTS1GZvMFYOHK0++z+vS7W8
         KacDIMikmxsoZdNVgcP+J3kzMPEpW8mtgfw07BgCW4kz/VB1f1n6PLYjaCPXiMtBXC1c
         KJ9TYJ3rxeJQXfhFiJceT2pBuwpWajn3e5DKwK7UyPQdONxQrIWY9oT+yRme9HSe/lDh
         83xJaiIzV4ng4FkOv/sFJaPv68dx3OXnjWOWp/YN3PKW5gME+3XyHp4fuCIWE+hPdyYi
         XcMG8OCIVX0X7jGTVgkY4MxMPXtMCEzcfQmKq3fJmIHrJJjpo6fxuN0a/nwhmaVPWETC
         uwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188143; x=1712792943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGucdcbEarAoxKuYez/Q9HRuJk+G9fqOigINMEt0goY=;
        b=ci9vhunjc/qHAOlKEwF5FZt1/zEq4pTYLoKJWpk6XRJ0xLY5RqyqzAOPb5GdMiRkGI
         QDqrgSA3+ItyWsbTYyuhCk2zAZBMqtiLJ4b53J0AkecYJN4P4IVbT7N9E/Y008lzSztg
         SOwyaktZ09pOZrkNcA8cvme2aP8YGF0WGOaTPQ+gjjAqlHtj+9j4xjVszkwvtUJNHRHt
         nHWREerF8uUOV9U32MthfSTH4oPmuMu3SRJSqz7GbdSoPtWlNIoQXLZXRAGpUHuVQJIX
         UbID7MdJHgx0988DSx3d9DKPI4yFK3rERFvjUDAObAyNmasWoV1twNgE9kdvu4hJ5yus
         lXEA==
X-Gm-Message-State: AOJu0YxGwzMSKhiJojRAoeJYDrF4q8E24p/YSii2Oaocsnvl3EK3fOVy
	/C6eU2EPjFpCxgEi5x7hxbF0jOGepwrWckYM0kv5IxswbZ0RM1ok6ROcCC+e8elrgbOGW92xsBT
	5fNp1t7jkYKE6kgYiW8cYdrtP0u7VnSVWdnsKpg==
X-Google-Smtp-Source: AGHT+IHPnPQwVv5MC6DjBNmcSUg3aww2ndiXlp0YCr+i2ghLZllCJ3lJZ/X280nXGVnMBVofOPtjQ373fmu8HkwBJDA=
X-Received: by 2002:a05:622a:138e:b0:434:3e9b:6692 with SMTP id
 o14-20020a05622a138e00b004343e9b6692mr1064206qtk.13.1712188143268; Wed, 03
 Apr 2024 16:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-8-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-8-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:48:26 -0400
Message-ID: <CA+CK2bCzJKPhUy9AeehHumFSu-poro_GwtNDRDmb5gn7-BwR2w@mail.gmail.com>
Subject: Re: [PATCH v12 07/11] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
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
> On several powerpc platforms, a page table entry may not imply whether
> the relevant mapping is for userspace or kernelspace. Instead, such
> platforms infer this by the address which is being accessed.
>
> Add an additional address argument to each of these routines in order to
> provide support for page table check on powerpc.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

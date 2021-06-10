Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D33A2EAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 16:52:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G16Qv65bWz30JY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 00:52:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S/ZFsDcU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S/ZFsDcU; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G16QQ36rkz300T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 00:52:29 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso4906029wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jeNB9kebGsKDKuDyLMLxN2kVS9AOIvWoW2KdfQOv7Vg=;
 b=S/ZFsDcUkHjZz0Dc59Y2FyQgRMdUd5NEWCTHaSV2yURRDuWUMz7birox7CAoNSJEBR
 PclwHKJf7MS6I/4BuHvX2AWD/zQQxb31rmo4GPpi1N+9G3D7b5b5rj9ifvyx3y1isUrL
 k9o+MpV3LdMXD93eonLQ6LvaihyvGtVfroeRvx2xH5VkVUtVQ1/XDvu/6sIzNJYW4u/f
 k+FhoMET8JSHgum3t8BR4LPJrAKDEjGGxQN+GcrV2H5y4+n16YbtgmEgPdRHja2Vltkx
 bFrZAYXOqWgeL/ZPaLqIo3q21Qkp6dVNUmlo8CtTqSE+OS4ZNc+mDtPPIlcE4EVJQkOY
 jKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jeNB9kebGsKDKuDyLMLxN2kVS9AOIvWoW2KdfQOv7Vg=;
 b=gub5dnGprh/xds6LJuMK5jl52jwD/iErLtQMefLx3ya+4nBR6l6iOW5dpNf7kWTso5
 qG7BqQWQWOu7hxEwpNG5qqne6eMGD8GkjjfmuGgsUSN+fhReEXQt5qgcgFE/VOd5sBLs
 SSabTRpkamk399na95jLDBBnH0wiSqe7ESj4wVLGv07HUGRD4Hh9YuXSkEDmVFFEKlee
 j5eq1Sl8KYNGO3hefXzyNNkc4t0JAh2eX5fF/e4U/2j3CaM3PHQYQN/6vBQoFPjr2NeU
 72iDzQg3OZ9Tor8ZGbj7LDz+H0+faflagzh50OEO8uxtOCNzm1Q+tyceRb5MjqG5JSMI
 yTEw==
X-Gm-Message-State: AOAM530z4S2gdBjnfhJVnPESaZBl9Pxelr5OSG0NwTEYNMmA0CeN51Qo
 zV3dYnISN8uYNj8iUipv7VUCnBHKOr+rjBGXI74=
X-Google-Smtp-Source: ABdhPJy3XNdWTKNMu4YNp3T9tPJ/9e/8z7A3BFzYYdr7FGqgUbTF+x1xsEhWT5qL7YN+fL1FuYjy3NHNASb6K7niP4o=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr5637396wmj.134.1623336741913; 
 Thu, 10 Jun 2021 07:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210610125417.3834300-1-wanghai38@huawei.com>
In-Reply-To: <20210610125417.3834300-1-wanghai38@huawei.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 10 Jun 2021 09:52:11 -0500
Message-ID: <CAOhMmr4LQpX79ksQOuZ1ft=M2B4tFOPechV9b_5iJWWL1yekSA@mail.gmail.com>
Subject: Re: [PATCH net-next] ibmvnic: Use list_for_each_entry() to simplify
 code in ibmvnic.c
To: Wang Hai <wanghai38@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 10, 2021 at 7:56 AM Wang Hai <wanghai38@huawei.com> wrote:
>
> Convert list_for_each() to list_for_each_entry() where
> applicable. This simplifies the code.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---

Acked-by: Lijun Pan <lijunp213@gmail.com>

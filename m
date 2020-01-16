Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC713D1E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:10:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynj61J2szDqVC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynJg2fvgzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MtQLeOr9; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47ynJd4C77z8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:52:49 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47ynJd3PX7z9sR4; Thu, 16 Jan 2020 12:52:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MtQLeOr9; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47ynJd26htz9sPW
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jan 2020 12:52:49 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id f16so8376498qvi.4
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jan 2020 17:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5VXWOl3uvL+FxKYq8g/X/QSXwmpi1GuKvbGEzEJZcPY=;
 b=MtQLeOr9a+ULZXe9cv6BMr/2OznzesgJjnpjDo/WEAkThy2sXaWKi1ypoWVOliEs5u
 Y62CRT7376Z+IcDG/byIPI+9CZ2BWwkJTNkdEicz/vKhAAU8n5/jH6GbDADWac8MmK+v
 lhZ0169tdWm3i0t7C2Ci7qhXvdeqHkydjUcU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5VXWOl3uvL+FxKYq8g/X/QSXwmpi1GuKvbGEzEJZcPY=;
 b=LF9YosWIC4PLFtJtGp11tfUjO/AAXwdUezDgcX/zQ4QtChJ61+93oiUP5AT0yAepSS
 nuP4279DmvzEeGmwWt2MDjujB3kZtskpVuTQFezo35J/IU9XTFmvgv7SIGw9+c0hfk2+
 VH5O6DkBwJfCxakMQ5Rwy7femD0Zoub00EcBSIW1aMIb4psDBZeeMi+SW36fTN883lDx
 gUpSHi2TzcExKDvoV26PuDE2M1IU4JXId8529XK5YyMbTKzzuRnlD6rlLe7lXLqrWcRW
 xGbUnNGE8hLLdFRMaOun3JjDRnly16gSPl19a5d8H6Wo2+Pgwh1AnStDQXwso6QJvvBW
 Zr8Q==
X-Gm-Message-State: APjAAAXDTPIaXtWn8FYBkVX2EMq2Q3ehy1CUSoJ6u6HYkjWLhoRfIUfN
 SXyDB7KexFfoOMs3Ci+N0ku1jUnqnM0+Cgj/QvLsFQ==
X-Google-Smtp-Source: APXvYqyjQSFHffMW58Ay/19MJv4Cc4Pkn41d9EqdJyZnmpPE1ivzxAOe01/wdJjjvR6efQunZ7ParOzIDihr3QvWzA8=
X-Received: by 2002:ad4:55ec:: with SMTP id bu12mr316919qvb.107.1579139566010; 
 Wed, 15 Jan 2020 17:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-6-mpe@ellerman.id.au>
In-Reply-To: <20200116014808.15756-6-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:52:34 +0000
Message-ID: <CACPK8Xd-QuwheNwgrD3c_SuKROX3PyojKKpPixux2xSQvUDv2w@mail.gmail.com>
Subject: Re: [PATCH 6/9] powerpc/configs/skiroot: Update for symbol movement
 only
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

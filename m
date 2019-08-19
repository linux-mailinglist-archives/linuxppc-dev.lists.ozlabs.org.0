Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F592579
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:47:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BwGG3NtXzDqJh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tYFXZFFl"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bw9C6m7YzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:42:55 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id g2so1209964pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=RjbLMcxR301rQtXMpcTgwA0dW/K8YBmt5+fW+awk5+E=;
 b=tYFXZFFlCozav7Vs9/mMpjspNezP2YD/DBroefG0UIAcNPFVG9JQQQ7Rxqj/Zqby86
 ldGz6i23RyjklvekeUwHOk3PHKT/kEfffzORWCBTrKLm7yrr+YTzsYpABEraWMIMhYI+
 +eHAc7kuoP5C2YDEQMsPhbl+UL21IEyWyYB8YtEBg3LKrTkSzXO7s+ZmHpwa8P+/76Dj
 U049W6xuNbvAOe6NDpeVnvEUbwoHpnHq/yh0DCDpS62aqeyFiKWIMpeXrgMrAuwr4Pmf
 XisguPW0xxY8ZfQRMu/kYGoIEGN1wROyWbGBRricaiYnRc+VKLxUooyfalIfIRMhd48H
 IClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=RjbLMcxR301rQtXMpcTgwA0dW/K8YBmt5+fW+awk5+E=;
 b=hre9sRHNAbWhrcG0m0qgVfXPgQ54t0wvsMCK4QcQ6CPJ5TsMNNDW7CS9CkBkurvT0Z
 orqRKCO6XfKcFsJkSvo0Bnp7Jokv2WHwht0257iwtc3W91V/rH0xSjqTckytUS85myTp
 pNkKH79t2MSh1KE8e1gHgUwEcpCMVS5fZHYHHiI3FR2T/lteHRvabhnOmhYjPhjt+r0v
 6pVxgx/P3R/oB5AIY67ZK2BhcrR4WDamuYswH3pgseAyODAnIjhHSgEZFOvaLF3ertBz
 pC8VK4ydoljPSdgqB/iJlJnJA2BP7JPq7nRzp0b+caZSOKQAIpQ/2xnjqRVgCH6kvlon
 MkfA==
X-Gm-Message-State: APjAAAVRhFqeIJ+AcasVSyuGk8E0Cud8TyqFKcAMWh0Mml8YRoJjImaX
 +bGMblQ/G0RiDTnAOTeATj0=
X-Google-Smtp-Source: APXvYqyatnsZKZ+5EQfsnms5KbYq265xLWw8O++dMuVzDWl78HSBpjjn//fYUYM0KZVsiHE3eJmmhw==
X-Received: by 2002:a63:e14d:: with SMTP id h13mr19901841pgk.431.1566222170475; 
 Mon, 19 Aug 2019 06:42:50 -0700 (PDT)
Received: from localhost (193-116-95-121.tpgi.com.au. [193.116.95.121])
 by smtp.gmail.com with ESMTPSA id v12sm13863260pgr.86.2019.08.19.06.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 06:42:49 -0700 (PDT)
Date: Mon, 19 Aug 2019 23:42:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 05/10] powerpc/mm: Do early ioremaps from top to bottom
 on PPC64 too.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <6bc35eca507359075528bc0e55938bc1ce8ee485.1565726867.git.christophe.leroy@c-s.fr>
 <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
In-Reply-To: <019c5d90f7027ccff00e38a3bcd633d290f6af59.1565726867.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566221500.6f5zxv68dm.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on August 14, 2019 6:11 am:
> Until vmalloc system is up and running, ioremap basically
> allocates addresses at the border of the IOREMAP area.
>=20
> On PPC32, addresses are allocated down from the top of the area
> while on PPC64, addresses are allocated up from the base of the
> area.
=20
This series looks pretty good to me, but I'm not sure about this patch.

It seems like quite a small divergence in terms of code, and it looks
like the final result still has some ifdefs in these functions. Maybe
you could just keep existing behaviour for this cleanup series so it
does not risk triggering some obscure regression? Merging behaviour
could be proposed at the end.

Thanks,
Nick

=

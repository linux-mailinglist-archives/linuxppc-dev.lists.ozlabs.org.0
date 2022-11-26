Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBD639868
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 23:20:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKR4G0j0dz3f4q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 09:19:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=H1NXzImV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=H1NXzImV;
	dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKR3L2nQDz3cF7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 09:19:10 +1100 (AEDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 2AQMImSq031644
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 07:18:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 2AQMImSq031644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669501128;
	bh=eCoWv21FlmpHLwc97EGzHeLTUW/a+GA8t8Cm/ZadSPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H1NXzImV6t9rh6H+zukX1U9G5gNCaZqJwJpSQrTN/iJQJGvTgGAaKp/Wkfkpp9Ncs
	 uHVQmUvw8db/MGbc7ZojBF94+nFJDgviM9vfGJfcYZbOOU9eXwj2MmHBi+Od8yfJHz
	 zcKMQ0y9Xhyn0bVuZjhYZYWFt6IVP3CNQJ11NI3+5NkZhBUXT9+C7HFJNneMcY0f2+
	 4EciOMdBJzjnotVxXvRaSEWAbX6xs6Xyx+OWEIsnf3KFlpFqmq3xMMXlyXZWTSvKSV
	 8aifW98sNvQwZeDuTfNvA09Wo4w0sf5ux5GsM4Kv3Uk/wTAebZbylg1/bbE/miLEaO
	 wyuDCy6Ec3S6Q==
X-Nifty-SrcIP: [209.85.167.178]
Received: by mail-oi1-f178.google.com with SMTP id v82so7933454oib.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 14:18:48 -0800 (PST)
X-Gm-Message-State: ANoB5pn4WkbH/yg7c7v7acun3YIG3bO8Ath+6lHa0iauamMFcYXNkin7
	VxmFdiDzYJ1VxNmAjQdJob0IH6OhIWPCCORiU4k=
X-Google-Smtp-Source: AA0mqf5n1/RIeUfwDyZLminfvFm1O0saHRY4Zh7CYxiBKtXxUzb8vn1K4cCYK1laaA3SYsvpI3YO38U22j/k9BMNlRU=
X-Received: by 2002:a05:6808:3009:b0:354:94a6:a721 with SMTP id
 ay9-20020a056808300900b0035494a6a721mr12844494oib.194.1669501127494; Sat, 26
 Nov 2022 14:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net> <20221126051002.123199-3-linux@weissschuh.net>
In-Reply-To: <20221126051002.123199-3-linux@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Nov 2022 07:18:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREVSp_5d1SaFOLyBHJJrJ6zE_qxSYWAFFnfoz3d0w3-Q@mail.gmail.com>
Message-ID: <CAK7LNAREVSp_5d1SaFOLyBHJJrJ6zE_qxSYWAFFnfoz3d0w3-Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] init/version.c: remove #include <generated/utsversion.h>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
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
Cc: Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 26, 2022 at 2:10 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> Commit 2df8220cc511 ("kbuild: build init/built-in.a just once") moved
> the usage of the define UTS_VERSION to the file version-timestamp.c.

With s/UTS_VERSION/UTS_RELEASE/,


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

>
> version-timestamp.c in turn is included from version.c but already
> includes utsversion.h itself properly.
>
> The unneeded include of utsversion.h from version.c can be dropped.
>
> Fixes: 2df8220cc511 ("kbuild: build init/built-in.a just once")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  init/version.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/init/version.c b/init/version.c
> index 01d4ab05f0ba..f117921811b4 100644
> --- a/init/version.c
> +++ b/init/version.c
> @@ -15,7 +15,6 @@
>  #include <linux/printk.h>
>  #include <linux/uts.h>
>  #include <linux/utsname.h>
> -#include <generated/utsrelease.h>
>  #include <linux/proc_ns.h>
>
>  static int __init early_hostname(char *arg)
> --
> 2.38.1
>


--=20
Best Regards
Masahiro Yamada

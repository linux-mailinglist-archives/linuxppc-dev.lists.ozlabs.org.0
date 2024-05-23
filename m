Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2178CD123
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 13:21:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H+seZe7t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlQYK07zBz791s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 21:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H+seZe7t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlQXc0YPSz3gJs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 21:13:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BACE2CE1691
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 11:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF8BC32782
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716462825;
	bh=8Iv96qeK3XO6FCLRf729LFGYnVsyZm+QYnohsytJjMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H+seZe7tia9XlPVFbMv1VD3pMpCR28zP+PYcUgiD0HO1ott5vOkK+LXl8bv8ATOEV
	 Ad7Ijqn3GCoXbbBre2uB55H4H1dRQNmRXl/deA5egIYXocWhAF9rjgR8lVkJ5+o8NZ
	 OG5SDUld0NahdcHQMt64J6N7ht+au3cZ7TP09Urx3Iapvq5rotxpP0AiIYeXXglQ+6
	 eZ6rD75sGB4BUdqavP/iRsVStenQOXZHzPwo0753UW4DF8n8g0eL1BvpVIdVLbJYOM
	 wm7k3mmwTOQHb3zq+xrznKr/qzcbVsen8qnT1gcW3fzAwIv2+ZiRq09Avg0ymvLDR1
	 yv6vXxM56UoxA==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b2f2a584c6so500404eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 04:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkUDISzFV4S+Se6RRtgCWLMExet03ZFUGGQo9cpRinB15Xnc2gvqomWWRs0EPtlSBF177Iclz6a1qxd7htBg74E72zRHwRTQ3SJ4P8gw==
X-Gm-Message-State: AOJu0YxprATuAeofC6PuIL4pBPCDohn4gca5iYhECcg5cqEsJu5xRGoe
	6pQ1SkMpDBNfLhMH1AWbDp+0HD1Fp87/ZZIg+d6W6oPOBeowzG2id5joTVpdY6qL1Wf1Mt4RqCx
	H8J5crHDkIHlqKR1goMVWkvv2iQE=
X-Google-Smtp-Source: AGHT+IGDJUzVNILe+89DNDK58fKL2girzfjapTcy0TAMQFrntEneDV5GD9qcXO8dgV6h6vsQw1LQsO6L8qszS/mlEfc=
X-Received: by 2002:a05:6820:2c8a:b0:5b2:89f:452 with SMTP id
 006d021491bc7-5b6a240fad5mr4236608eaf.1.1716462825087; Thu, 23 May 2024
 04:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <2024052334-nape-wanting-0a2a@gregkh> <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
In-Reply-To: <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 May 2024 13:13:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ihKzCbFxfVn9s5zB3WJepzi+dUPk1LFRMnbFF-9EV6nw@mail.gmail.com>
Message-ID: <CAJZ5v0ihKzCbFxfVn9s5zB3WJepzi+dUPk1LFRMnbFF-9EV6nw@mail.gmail.com>
Subject: Re: [PATCH] sysfs: Unbreak the build around sysfs_bin_attr_simple_read()
To: Lukas Wunner <lukas@wunner.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, linux-modules@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2024 at 1:00=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> G=C3=BCnter reports build breakage for m68k "m5208evb_defconfig" plus
> CONFIG_BLK_DEV_INITRD=3Dy caused by commit 66bc1a173328 ("treewide:
> Use sysfs_bin_attr_simple_read() helper").
>
> The defconfig disables CONFIG_SYSFS, so sysfs_bin_attr_simple_read()
> is not compiled into the kernel.  But init/initramfs.c references
> that function in the initializer of a struct bin_attribute.
>
> Add an empty static inline to avoid the build breakage.
>
> Fixes: 66bc1a173328 ("treewide: Use sysfs_bin_attr_simple_read() helper")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/r/e12b0027-b199-4de7-b83d-668171447ccc@ro=
eck-us.net
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Works for me.

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  include/linux/sysfs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index a7d725fbf739..c4e64dc11206 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -750,6 +750,15 @@ static inline int sysfs_emit_at(char *buf, int at, c=
onst char *fmt, ...)
>  {
>         return 0;
>  }
> +
> +static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
> +                                                struct kobject *kobj,
> +                                                struct bin_attribute *at=
tr,
> +                                                char *buf, loff_t off,
> +                                                size_t count)
> +{
> +       return 0;
> +}
>  #endif /* CONFIG_SYSFS */
>
>  static inline int __must_check sysfs_create_file(struct kobject *kobj,
> --
> 2.43.0
>

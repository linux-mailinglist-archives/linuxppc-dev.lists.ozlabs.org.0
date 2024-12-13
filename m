Return-Path: <linuxppc-dev+bounces-4086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AED9F05AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:44:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hDS65TVz30hQ;
	Fri, 13 Dec 2024 18:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734075848;
	cv=none; b=bwWpJAV6bGFVawyMnEzXPvIw5UIV7xNtlM3PR2vJ31QUIRFJEdQVk47v1Dhkv7ywRKN8Osr8h6MNYswK6lejIERZgIHFagMvkTq4yDSkm3Jx9C4WhCRScGxp6Dl10Oi+xYtI74GqUhiODY+IRaDJnG+uCdNYGzo2mvwlbqhU8x3IkW2hFQw7LvNsC4ZK3y2vj26zwaf1TZ4o93m+VbjMKKeS66qULWEfr7m+ckyJXY3z6Xj5bzYN+UPyOrBFHmSyIqN2NpXfjTtl5Giaj7sM/M9gvIAbR9TLwaL/CHCe8qFDfoGw3WgmOxgoGBS+SLsQmWN3fGY37vtjH8SR1NU43A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734075848; c=relaxed/relaxed;
	bh=clEJK7JOhzeZwBRe+uXLFGgBcKWswTzrkVwDuGtw1qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mexwYu7Aa9kFRy+2ylldHUpqbKDwKaTRSE64kHsmL56B1N3CYdPeTslYhCoztKkrDBs5ZOq/3oV0WF/34G2MQoIIzFm9mx24q5hGS0tnAqnk2No+VtAhiRlqmyMP5RdYGO7fO32/jcBq9CD7Z+HnFJKRb0JAyve55KI2xEErE2UxVhVz553r0r8usnu6ZhAbyStrmQ2FY5ec34iuWnFm8sLzef/BiVaQbqXz5bMXIQv3eVeSwrs4HDFXBMWAx5YTtrwKF8IJPvVXMLy6tS0AQmYFe7RMQAKOodPVjqx6gqONsZcqHtE3GOOCMkEHFnOuHO+SmPL7lmQyRVIh6e/Kbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ohI0IvaJ; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=ohI0IvaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hDL0VL6z30hL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:43:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734075826;
	bh=lHwtD1iPNGzdJwYjIGoo8w0zLrhQgGX7/hX9tiBWhM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohI0IvaJ5l9TNKXFl3u2YGdIyF/Va5/dQjCulUrI7V490GJY9EOjo9j7wMsjITTC7
	 pc3iTWYawwbQ9UmwE2rFrXjOFGwmG6JEWGIGIV+E172fpwZa2XnJ2KxDF3NkpU/50o
	 uOeiloPI/w2dHQjKKp4tLqJokisytzKAKFS6T77w=
Date: Fri, 13 Dec 2024 08:43:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86: wmi-bmof: Switch to
 sysfs_bin_attr_simple_read()
Message-ID: <d1580513-6297-46b5-b4e0-c2063496b2ed@t-8ch.de>
References: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
 <20241205-sysfs-const-bin_attr-simple-v1-2-4a4e4ced71e3@weissschuh.net>
 <2fbf5d9d-8cfe-4ce4-a268-ec84c261d1bd@gmx.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2fbf5d9d-8cfe-4ce4-a268-ec84c261d1bd@gmx.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Armin,

On 2024-12-13 01:21:37+0100, Armin Wolf wrote:
> Am 05.12.24 um 18:35 schrieb Thomas Weißschuh:
> 
> > The generic function from the sysfs core can replace the custom one.
> 
> Sorry for taking quite a bit to respond, i totally overlooked this patch.
> 
> This patch is superseded by a patch of mine: https://lore.kernel.org/platform-driver-x86/20241206215650.2977-1-W_Armin@gmx.de/
> 
> This reworks the binary attribute handling inside the driver to use the new .bin_size() callback. This allows the
> driver to have a static binary attribute which does not need a memory allocation.
> 
> Because i think we cannot use sysfs_bin_attr_simple_read() anymore. So maybe you can just drop this patch?

Works for me, thanks!

Thomas

> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >   drivers/platform/x86/wmi-bmof.c | 12 ++----------
> >   1 file changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> > index df6f0ae6e6c7904f97c125297a21166f56d0b1f0..e6c217d70086a2896dc70cf8ac1c27dafb501a95 100644
> > --- a/drivers/platform/x86/wmi-bmof.c
> > +++ b/drivers/platform/x86/wmi-bmof.c
> > @@ -25,15 +25,6 @@ struct bmof_priv {
> >   	struct bin_attribute bmof_bin_attr;
> >   };
> > 
> > -static ssize_t read_bmof(struct file *filp, struct kobject *kobj, struct bin_attribute *attr,
> > -			 char *buf, loff_t off, size_t count)
> > -{
> > -	struct bmof_priv *priv = container_of(attr, struct bmof_priv, bmof_bin_attr);
> > -
> > -	return memory_read_from_buffer(buf, count, &off, priv->bmofdata->buffer.pointer,
> > -				       priv->bmofdata->buffer.length);
> > -}
> > -
> >   static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
> >   {
> >   	struct bmof_priv *priv;
> > @@ -60,7 +51,8 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
> >   	sysfs_bin_attr_init(&priv->bmof_bin_attr);
> >   	priv->bmof_bin_attr.attr.name = "bmof";
> >   	priv->bmof_bin_attr.attr.mode = 0400;
> > -	priv->bmof_bin_attr.read = read_bmof;
> > +	priv->bmof_bin_attr.read_new = sysfs_bin_attr_simple_read;
> > +	priv->bmof_bin_attr.private = priv->bmofdata->buffer.pointer;
> >   	priv->bmof_bin_attr.size = priv->bmofdata->buffer.length;
> > 
> >   	ret = device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);
> > 


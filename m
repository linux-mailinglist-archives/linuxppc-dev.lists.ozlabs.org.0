Return-Path: <linuxppc-dev+bounces-16025-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C54D3BAFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw54q2vSbz2xm5;
	Tue, 20 Jan 2026 09:40:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768848096;
	cv=none; b=iskBK56tI+V7J91cmAi+XDtGKoetBTuXIxMz19qEw3hv/C8oIfuILCMqajRisduxBsM1QFBPfrJsO3YV8hhXb6RZ0Yze3C3WnqgLsVs3Mui7+lqdz47XyryuEQDmllHFRKZajCiiJ3F4c5UFXkfVSYjVdKisSDqTEqoKShJW/cWpBl5G+HSIDzNC7Dzbj0Mc9HDHvMtB0Cix+MHL0dfVzBByW7yaEIG1zKyM0WQaiU7sw5EBj1AJzY+zWK5vcx/2wB6249ZXWTqwOmbfwRriTA10gvLOlclMfQ8IK/Zy/N+YzYXTbhd0Mj5uE96JrSih5V8oRZYH1gtDRs9lwnjowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768848096; c=relaxed/relaxed;
	bh=U9/XO71AuTElkurTuviO9GF+8SqlkQn89YOGV7iXOpM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=CC8q8aIJ8D/zat8yiMmEccS/mMGyxjZ7HVu+PustnrVzDFGg+t8KAiONLl2a/vk6omZN/tR/kwHsPM2GX4lQjUBKvtWVhC/7AMXbD7H3Nut+rH46f2EvFlK9ka9GDdHvmbh+rQiQ0+yFp1YOGiJZDQrTx7LokMnYfEcnRvyEQdUm2bmUzf4Hdo+uQ+DyfxuML2XRGV5hlEGC6RX6g7U5yCxfWS9mjO5Dic26/iEte/6aa4lodmLOEu9YP5kr0BYpaVGe2vC0CLtbWzAhguU7SfJADtFH3vNHI/FjBeHZkZ9KuNyxwWjyPfTDBO4rrehv3kp7/2DUASYDEzecry8l1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lHvq6RXD; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lHvq6RXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=dakr@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvznW5j28z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 05:41:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CA0600CB;
	Mon, 19 Jan 2026 18:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5D1C19422;
	Mon, 19 Jan 2026 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848093;
	bh=KAQ8tX8q+bO3qSbrvWwj7NanQMZoHP6DxVRHOxzvxD0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lHvq6RXDaA9b+mGiP+hfLlVfpLxQoJ5ai6T8IZhmACaN0XFmkEOTqBqp6dtijlIXM
	 jDoins0oUai8B1TsnX0UxGqUfuCJuXuUbwMP0yTquI4hRvkJrXVNYQhDYM9KVPEop8
	 szuuefEpV6lSc6FV+zmlvbtyqM07xd4FZDkjhXOvQbWsCKA+8HjkMWB0lcZYRltPEA
	 hbQ1qIN12Zyogdm9wGgoX3q2WFzk87QUQWddIi1duDGMdKivQtQSbEEHo1A2NG8kZz
	 cbnC4CIylOu7udE5EhG0m5VQYED8aYUYjowNVD7SpHgjSgoq4We5ae/J35gN9DY5sz
	 s9fReWdvH8SNw==
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
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 19:41:26 +0100
Message-Id: <DFSSBD1SZUDK.Q67HAARLBF1G@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
 <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
In-Reply-To: <DFSJ9QN6U81W.19R0VFKTEFZKR@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon Jan 19, 2026 at 12:36 PM CET, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 11:40 AM CET, Bartosz Golaszewski wrote:
>> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev=
_attr)
>> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>>  {
>> -	struct device_node *np;
>> -
>>  	if (soc_dev_attr->machine)
>> -		return;
>> +		return -EBUSY;
>> +
>> +	struct device_node *np __free(device_node) =3D of_find_node_by_path("/=
");
>> +	if (!np)
>> +		return -ENOENT;
>
> This should never fail at this point, no? Also, can't we just use of_root=
?

Regarding of_root, please disregard my earlier comment. I mistakenly assume=
d
that it would also be guarded by CONFIG_OF.

But I still think we do not need the NULL check.

>> -	np =3D of_find_node_by_path("/");
>> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
>> -	of_node_put(np);
>> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>>  }
>> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
> If we want to export this, we shouldn't reuse the existing name, which is
> misleading.
>
> soc_device_get_machine() reads as if we return a reference count of somet=
hing.
> Additionally, it operates on struct soc_device_attribute instead of struc=
t
> soc_device, where the name suggests the latter.
>
> Instead this should be soc_device_attribute_read_machine() or if we want =
a
> shorter name, just soc_attr_read_machine().


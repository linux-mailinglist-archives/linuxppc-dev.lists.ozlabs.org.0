Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425790BB3E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 21:37:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qFy9OqZ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W30Xc4txbz3gCL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 05:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=qFy9OqZ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 349 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 05:37:12 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W30Wr4Vqvz3g7P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 05:37:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718653019; x=1719257819; i=markus.elfring@web.de;
	bh=3SqP/MMqLPtLI6/aIyy4H8OAKdv545+Ewr3toVxYkx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qFy9OqZ+61yp2Rr2rTlaNNqY3iWEj82Su6VHQlqnYJfawxb2t3p84wmz+i+lfa2a
	 9VnvM09uvYl9MKAqtmm06clNbE0mXeOptfJtNazwkRbYbLdx8iws9V0/LhlvliNI5
	 Zunk4uoQn8GX45NhaXBaSkvTj4fBYA+bRALZinkLVvb/ybcKgFdqdqHOxyzw7BBGJ
	 5AFU2r3iE51ZRTjdJpMPmEvyEybEsdQjASm3ns0kVH3L+30XktQui8AYQYDZHErpi
	 RnfL8ZUP7qX2GyMVAhRfcsfj2iVcLLqdzbOaR1xWUtilfclR1Nn3Ss/Gt9CJKi4RU
	 g6rZ9obCMXGeqxd17w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N3Gkg-1sSbPm0CNW-00tTYm; Mon, 17
 Jun 2024 21:30:24 +0200
Message-ID: <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
Date: Mon, 17 Jun 2024 21:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
References: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com>
Subject: Re: [PATCH v3 4/4] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5WMvwVJ2f6aoUtr+Iz89hHXdsaVQ1zgvfdIEvfLMhBHDYIBbpe8
 kWz8j5Flzg276xCuQhuOfkGfjJ1JGGY3ujMyZc1pPd3x6QKmrtdsQqX0puZR60X7t0lHxCa
 yn6PJPgg+aEg447/N0AipP2n+YrYMaefQ7ZzL7N5WylGgwQ1/vOzILgz7mqlOpdJg0hrWyK
 EoJrGwmfCJ2IviYQn3jgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:289MEY1k7K8=;iOOAW6vyjkidRXUo1txuUPephTd
 Lu1fLFFQ6OiCdw7XqOVx+w2a20k6HujWOHtSQ8ZBlGo/WuwY98D89FpuXLguWAWGVOl0qUIhe
 jc0zM6Y/szMGY+/WlykVXOVhOrLwVuova8HBzv7uV1hrETD7wvDm2z5WgXmqJQxbD0oy6g1n4
 96zeP7oB9vXE5vRN8plGOvQoTt7SSUequ7lc+YSbYRC563Eg2wHsMUVtXddeBQtIwH+K5e2fL
 FK/5gEqssQlX1EcTxtUDtMj59u8f3/tfig1/7zuXaemfMmKMToZZ4sPidUNjPJFfNENxhD+FZ
 sFEnxnYTxIhbJ3GTw70uWGJpy1FCI80Xz/49TVeQStMHl6rku0TMl0JSmMUoTqibbRB4kJc0e
 7VB3CB8pMhET7dINxpOTEavR1IjfgXauixR6RgI/klq8k5HxjD7R4s2CoTkyfo5j4gczHHyea
 uLQhNNkNl9dcJEMLqgeT9TbU1OAZHzgQ3p1BlYa8qjorYW5kfp+ffxczoT+vi/IUMxXJyNiIG
 RYZ1HTj6oy3q+dTkHv7WvPJxCk1gQDxvloh9NK+9bruoEk/uzlpDpAyF642GPqGqw+z2LdBcV
 UO6maK85XEM0es5DTY3E9O9oj0JX0iFlTLMn4+phGIuzTzEkmsAxwrixRsE537NT7nn5JkMLV
 1RdVvS8UeTGPMjpyGaEKa+2F5vxG19XllG9vBQk4KBooBPqzV+MoCky4+nIq1nA2scdl30sD9
 BXSDEwLRSTDA7GIgwW57s28eF/GWnmh5al7DlTHI/7o9P3KtlTaywCCpXvs+w/LHJPw7I8ik5
 3znkE+XmhoI8DG2/24UILJqI3JkvyvehkDbfd4qGA6mug=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, Jonathan Downing <jonathan.downing@nautel.com>, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I suggest to specify email addresses for message recipients not only
in the header field =E2=80=9CCc=E2=80=9D.


=E2=80=A6
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -0,0 +1,393 @@
=E2=80=A6
> +static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, str=
uct snd_soc_dai *cpu_dai)
> +{
=E2=80=A6
> +	int ret =3D 0;
> +
> +	mutex_lock(&i2s_info_p->lock);
=E2=80=A6
> +lpc32xx_unlock:
> +	mutex_unlock(&i2s_info_p->lock);
> +	return ret;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&i2s_info_p->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus

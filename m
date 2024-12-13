Return-Path: <linuxppc-dev+bounces-4071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C72C39F00C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 01:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8VYp4v7Wz30V0;
	Fri, 13 Dec 2024 11:28:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734049710;
	cv=none; b=cr+ketoWJq7IT7zOOERfzYDC6vS36/KEOclnMcmEcoIdSQK90Y9JfJ2/8X8VRvov1ZhqMOjQrD9JojksnefhaHCv3/GqvLF+UK/Jp9vNhkQjhg2I1SGW4BNcCtfxJYymdBhGD6dGcWtG14kbhoNuoeGrgOKSJmzuQi9DAPkIRzOGHLcPkTPNLEPv8HgH+wKblXnMLa/E8Gb/Q4XbLrgFWbmU5/gyUxF124nfjSGcpN4+rCH25O3CNgY49AzW7ney30YYhf+WvNvoGf+LtGrmUJiZ68cbG6rFWf+FOcXtXGoxdHn5l24jivgU5QV0Kn5+hljQqMeiSih19fPjRrtKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734049710; c=relaxed/relaxed;
	bh=pc4caFALq5op4/J6K3vAuBSZziJYzazQYmi+f4y4us4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ldDShel+gwkCycFod5vVFRJYtqATrTOIVmq8vfeFrEWd7Qe2j845roMf1O1VLfj5hgZudOp9OMjTRRmSVZJU6EtNQpqSfMBjESj3pWVPckVAs5LRrqLU2Mq+1iQ6tC6/DH/CCIJpNf4SQ7MRy+KfMWyCRzlaJzrL8x5N0qK6V85pPp181nbkOVpmArqMhgm1eFHtb+4Tphbq2rJHdylLdZ2fOYo5pRZkoueD+afmzHoyY2hTqR4PguDq4tOPvfhQrXE4FRzHwgJwhEz9ITugLz9j6LkSgUUOfHzNutVuNcz2Vp1tyPu/1hqLgiMDyagKzUwGlqkWMJd6jgTQK+2+bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oeVjncMn; dkim-atps=neutral; spf=pass (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oeVjncMn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 343 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 11:28:25 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8VYj0rPNz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 11:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734049690; x=1734654490; i=w_armin@gmx.de;
	bh=pc4caFALq5op4/J6K3vAuBSZziJYzazQYmi+f4y4us4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oeVjncMn/TgtWoRxtlnQdD3EmpzahjG6KhErQI1bjoraDI12TrkPZVTP/8BW+X0W
	 u+kGUhOLt+ojRIfCD9qLuovmOXpD7k4dXgnRvQyC9d7N+z3mE8XZpTXxxGCOEydwA
	 kyqJh5GBGAKWoM6snj0ekvFVaRrPqv/8HHSHzQNMGcFeW3qje82eS9y/aKovMw3XH
	 78uDepsRccNcBkleJjSM47X7oj2+vL4SssAYVb2bt4/Av7OuEqJTSUeggbo4yu8Ke
	 ECK3jcxvuK5VmjF5JguDR4VhuqfxG9uyO9RT3nMcAkdCMsIw0NycnmPbhCaY2dZ3W
	 I4ISkXN4l9Fte3FNrg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1szFyp3XOM-00QRfF; Fri, 13
 Dec 2024 01:21:50 +0100
Message-ID: <2fbf5d9d-8cfe-4ce4-a268-ec84c261d1bd@gmx.de>
Date: Fri, 13 Dec 2024 01:21:37 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86: wmi-bmof: Switch to
 sysfs_bin_attr_simple_read()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 bpf@vger.kernel.org
References: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
 <20241205-sysfs-const-bin_attr-simple-v1-2-4a4e4ced71e3@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241205-sysfs-const-bin_attr-simple-v1-2-4a4e4ced71e3@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sEqBGP2Ac0vGkBppc5TPHNF5GODfInD0hzbaCS0ddgYsItdBe5p
 2xdFdNBD2/3IFGQJS5l4ixxknu73P0PueOGSf9tMm/O8niUy+knHcsKr0WKRhQC8gmbaBRO
 zRP2UQtl9CHmKQKZsGzQuvW6QSUTtv15p13jP7TsWPqOn7D9/3d8lvbKady/tS3sg6AjSv+
 +gzIUgEAv0ESzIp9jiRtA==
UI-OutboundReport: notjunk:1;M01:P0:bONPodsptFc=;U+QsJjpHaB+tdWihYYhjAX4XmCz
 CRUcD8Rho6bNjxy5iFhu7lxy+Q+CEeNwSrweJ1d1b6PtrRJwjx4Bn/k0WnqqccxFI8+4yA7rF
 hrxqquiOHKKleu999wfflfR7ajLP/YPpCesSlHdPOOLZgkO5e6MCvSAwapxf/0/mGKpvp1rH+
 6ShtuUuuT4juQ3hUirChc+rf8h4K2iz6T/kMnhleWRpi42MPR4mdvOqEYgZKN5iC0RoraPCAp
 KNkYaHNJ57fyao7V8iI+dF88VCn2iyYJwcHURCIHr4Kn4e+lOMeOB/7PWcQMtLeEq6kyDu/s8
 1GsqQMBsae1m4hmK2rfwLYICQ59IZbQomPQq0clLlfwqdN1ieY7dLx/8yENpQ3tKeCWE7nUkp
 o1cch9eM9KHF74/sLeF1M2cga/XBReiE/k1Cn/QqmikScGbQsiyPVuRaP1mVabSf7vlB20NA3
 Lg2LxzjB3X37vmX2YBISYxM8rhMtiBTHfb/tNeioWas8sriCcdpFMSOIkNlrSlaOxAslvDy9M
 fL14q17KSzX5MMImWmSS8FzqoP9x8v2mjNDD4/vrDoTQcFvY6YDrc8yC5EgswHC1vQ2Pjnx+j
 c5JSmB7DYFOFV1bDCo7nqZ+MuGXISEfoU8yP3oJl1ASc8BjpdG73PPylyV3u3of2YFUyv1Yuf
 CYEFIVIZiy2Uq7u9oKhIZx/DqoQs8yUkLM8AnpqGnge11PbD9mxUH2cXfCNzlvJvYXnDC/dyE
 i/LnWwfw+kpAXMlrXQJ/pFz/JRlUNybBV+QOH4bGb8XXKz9FalermYRmi+lML5Gv6pc8NEokW
 kFJZ2uKEkn7ixwDP+/8uRcarEjriSu27OGUqgWNukLNkXDAzNwVqUw+zKQAXynNceKzNtcf6+
 TTWtYx0HUM7P1kV+ASG8zMTw0yC8jecQINDbsRUOh4JbG9oWYH57XBuTwWCkWG81oqWAyLagp
 UcwQ/BVIuNRXEDRjkeBxbGV2SY7iuxEXaP/DRjInSr0NKZjsXUSEXANuls6D0FF/F2Hkmkuu+
 omi4gfSuvkX2Tn7AhXUofWg//jiPVB8Rhjx3wyRI2Epuhyu9aBMvL6eywvHFqOQM4ESwWhFlU
 LwLx4DMZUB/CfwCyG6TcTPgEy3n8xK
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Am 05.12.24 um 18:35 schrieb Thomas Wei=C3=9Fschuh:

> The generic function from the sysfs core can replace the custom one.

Sorry for taking quite a bit to respond, i totally overlooked this patch.

This patch is superseded by a patch of mine: https://lore.kernel.org/platf=
orm-driver-x86/20241206215650.2977-1-W_Armin@gmx.de/

This reworks the binary attribute handling inside the driver to use the ne=
w .bin_size() callback. This allows the
driver to have a static binary attribute which does not need a memory allo=
cation.

Because i think we cannot use sysfs_bin_attr_simple_read() anymore. So may=
be you can just drop this patch?

Thanks,
Armin Wolf

> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   drivers/platform/x86/wmi-bmof.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-=
bmof.c
> index df6f0ae6e6c7904f97c125297a21166f56d0b1f0..e6c217d70086a2896dc70cf8=
ac1c27dafb501a95 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -25,15 +25,6 @@ struct bmof_priv {
>   	struct bin_attribute bmof_bin_attr;
>   };
>
> -static ssize_t read_bmof(struct file *filp, struct kobject *kobj, struc=
t bin_attribute *attr,
> -			 char *buf, loff_t off, size_t count)
> -{
> -	struct bmof_priv *priv =3D container_of(attr, struct bmof_priv, bmof_b=
in_attr);
> -
> -	return memory_read_from_buffer(buf, count, &off, priv->bmofdata->buffe=
r.pointer,
> -				       priv->bmofdata->buffer.length);
> -}
> -
>   static int wmi_bmof_probe(struct wmi_device *wdev, const void *context=
)
>   {
>   	struct bmof_priv *priv;
> @@ -60,7 +51,8 @@ static int wmi_bmof_probe(struct wmi_device *wdev, con=
st void *context)
>   	sysfs_bin_attr_init(&priv->bmof_bin_attr);
>   	priv->bmof_bin_attr.attr.name =3D "bmof";
>   	priv->bmof_bin_attr.attr.mode =3D 0400;
> -	priv->bmof_bin_attr.read =3D read_bmof;
> +	priv->bmof_bin_attr.read_new =3D sysfs_bin_attr_simple_read;
> +	priv->bmof_bin_attr.private =3D priv->bmofdata->buffer.pointer;
>   	priv->bmof_bin_attr.size =3D priv->bmofdata->buffer.length;
>
>   	ret =3D device_create_bin_file(&wdev->dev, &priv->bmof_bin_attr);
>


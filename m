Return-Path: <linuxppc-dev+bounces-13237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F4C0392A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 23:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cszyp1JVbz2yFx;
	Fri, 24 Oct 2025 08:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=142.132.176.110
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761244597;
	cv=none; b=SQTU8Sj/63UHWjikSvN5H9HQA1dSsQZ6Rry4it3WYUVuKBqevsOwqOBRvVj3VTM2IQFgR6vSxwxVpryhxlwLinvEbGUPiSAHuopvUGzexmsjXy+iLyS5F/Xy9rD3zKU2jnU+VhDgE9INAe4gFX7SXNcZB6N19WbKo3oKHtJvyPbC0GlFcYVbvGZ44Cq45m0Q4mOp9O/bGdNzqtcbqw36C5G3SpuQ6gtIHgLTwMbvgLMMy4cQlebqGohU5wftE+T0sLBNENZ3I/h4pC8VJX4QHC2L464JPL4Xn81cKzuPa2ZJXszeJAm3xolnekJgVV4vuB/A6/lTJjx5LUTYxQrzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761244597; c=relaxed/relaxed;
	bh=wMO+SCV0l5dh/TBWZh1mnrGafB3FTHbpefBDO3evOwI=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=MDXj6Vm1zoSaFJ7T33UpQUFkpJYKcA2F+1ANqilkSDi/NlMiupvJh1QrBla1fmpbWcMPzEYl3S7gG9+vqK6q9MvleF6B7lpMPBQoSQ576Eq5pZEqytnij0BTi4a6ABsiNl+8hpi7+5sypgtIJhscbuZLDBhoe4cI1bUyLETHrCiWxpwArqTVc/JRzKzOlVxUspmtd00yCYrz9wmUqiVunHLFlUF5hVBTSXXCGDHI47wr5aFCdjR0d8sUP0SPOtjpLUO2vioFIvK6t2MnJDNF08k+9ITtN2m/WM0JA0hbtB6KIDYeMgQOGPrzmphA1YZx5o8VkBV9O/9haUCV/s1vdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.a=rsa-sha256 header.s=dkim header.b=x3vT1EJf; dkim-atps=neutral; spf=pass (client-ip=142.132.176.110; helo=mail1.manjaro.org; envelope-from=dsimic@manjaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=manjaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.a=rsa-sha256 header.s=dkim header.b=x3vT1EJf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=manjaro.org (client-ip=142.132.176.110; helo=mail1.manjaro.org; envelope-from=dsimic@manjaro.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 535 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 05:36:35 AEDT
Received: from mail1.manjaro.org (mail1.manjaro.org [142.132.176.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csvrM0TZBz3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 05:36:34 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 58F2D40D25;
	Thu, 23 Oct 2025 20:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1761244050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wMO+SCV0l5dh/TBWZh1mnrGafB3FTHbpefBDO3evOwI=;
	b=x3vT1EJfPxqfvf6DDV90OVcHLztgqacXNaWxXyOwo0jNBDwyLCyeJv+Ph7niMcJnYDzjBG
	J2UzZzAjq5i3/7WU/eAXEAMb6jgGRiRpLoww3MWmxhS+RtWLCXhJxmEuov4NulcMgpz5PG
	w1GIi7xYmiBEH/4rLkLz+Fe4Xp6LKm4+7n2zwSIFFAGAZeOBEX3Cd0uhcrFSJYSM+4Dg7y
	Y+p5mV9ipeAg9wQd8MQGJbqePWEDXiYtY+pdnPNA4lvoTUJyj/LwwX19qiQuaHv70L7Gi9
	Y+LjMR4vDEkJcmcKkKSsFfSUNcozLPKt+1hwz1nu9t0VQ0cUmKUG331JrfXwew==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20251023180645.1304701-1-helgaas@kernel.org>
Content-Type: text/plain; charset="utf-8"
References: <20251023180645.1304701-1-helgaas@kernel.org>
Date: Thu, 23 Oct 2025 20:27:25 +0200
Cc: linux-pci@vger.kernel.org, "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>, "Christian Zigotzky" <chzigotzky@xenosoft.de>, "FUKAUMI Naoki" <naoki@radxa.com>, "Herve Codina" <herve.codina@bootlin.com>, "Diederik de Haas" <diederik@cknow-tech.com>, linuxppc-dev@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, "Bjorn Helgaas" <bhelgaas@google.com>, "Shawn Lin" <shawn.lin@rock-chips.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>
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
MIME-Version: 1.0
Message-ID: <da79f38f-fdb9-0101-67cc-144ef8d6e1d1@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?PCI/ASPM=3A?= Enable only L0s and L1 
 for devicetree platforms
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Bjorn,

On Thursday, October 23, 2025 20:06 CEST, Bjorn Helgaas <helgaas@kernel=
.org> wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devic=
etree
> platforms") enabled Clock Power Management and L1 PM Substates, but t=
hose
> features depend on CLKREQ# and possibly other device-specific
> configuration.  We don't know whether CLKREQ# is supported, so we sho=
uldn't
> blindly enable Clock PM and L1 PM Substates.
>=20
> Enable only ASPM L0s and L1, and only when both ends of the link adve=
rtise
> support for them.
>=20
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states fo=
r devicetree platforms")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@=
xenosoft.de/
> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353=
-9818-3bb2b311da0b@radxa.com/
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.=
com/
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> ---
> I intend this for v6.18-rc3.
>=20
> I think it will fix the issues reported by Diederik and FUKAUMI Naoki=
 (both
> on Rockchip).  I hope it will fix Christian's report on powerpc, but =
don't
> have confirmation.  I think the performance regression Herve reported=
 is
> related, but this patch doesn't seem to fix it.
>=20
> FUKAUMI Naoki's successful testing report:
> https://lore.kernel.org/r/4B275FBD7B747BE6+a3e5b367-9710-4b67-9d66-3e=
a34fc30866@radxa.com/

I'm more than happy with the way ASPM patches for DT platforms and
Rockchip SoCs in particular are unfolding!  Admittedly, we've had
a rough start with the blanket enabling of ASPM, which followed the
theory, but the theory often differs from practice, so the combined
state of this and associated patches from Shawn should be fine.

Thank you very much for all the effort that included quite a lot
of back and forth, and please feel free to include

Acked-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/pci/pcie/aspm.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 7cc8281e7011..79b965158473 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -243,8 +243,7 @@ struct pcie=5Flink=5Fstate {
>  	/* Clock PM state */
>  	u32 clkpm=5Fcapable:1;		/* Clock PM capable? */
>  	u32 clkpm=5Fenabled:1;		/* Current Clock PM state */
> -	u32 clkpm=5Fdefault:1;		/* Default Clock PM state by BIOS or
> -					   override */
> +	u32 clkpm=5Fdefault:1;		/* Default Clock PM state by BIOS */
>  	u32 clkpm=5Fdisable:1;		/* Clock PM disabled */
>  };
> =20
> @@ -376,18 +375,6 @@ static void pcie=5Fset=5Fclkpm(struct pcie=5Flin=
k=5Fstate *link, int enable)
>  	pcie=5Fset=5Fclkpm=5Fnocheck(link, enable);
>  }
> =20
> -static void pcie=5Fclkpm=5Foverride=5Fdefault=5Flink=5Fstate(struct =
pcie=5Flink=5Fstate *link,
> -						   int enabled)
> -{
> -	struct pci=5Fdev *pdev =3D link->downstream;
> -
> -	/* For devicetree platforms, enable ClockPM by default */
> -	if (of=5Fhave=5Fpopulated=5Fdt() && !enabled) {
> -		link->clkpm=5Fdefault =3D 1;
> -		pci=5Finfo(pdev, "ASPM: DT platform, enabling ClockPM\n");
> -	}
> -}
> -
>  static void pcie=5Fclkpm=5Fcap=5Finit(struct pcie=5Flink=5Fstate *li=
nk, int blacklist)
>  {
>  	int capable =3D 1, enabled =3D 1;
> @@ -410,7 +397,6 @@ static void pcie=5Fclkpm=5Fcap=5Finit(struct pcie=
=5Flink=5Fstate *link, int blacklist)
>  	}
>  	link->clkpm=5Fenabled =3D enabled;
>  	link->clkpm=5Fdefault =3D enabled;
> -	pcie=5Fclkpm=5Foverride=5Fdefault=5Flink=5Fstate(link, enabled);
>  	link->clkpm=5Fcapable =3D capable;
>  	link->clkpm=5Fdisable =3D blacklist ? 1 : 0;
>  }
> @@ -811,19 +797,17 @@ static void pcie=5Faspm=5Foverride=5Fdefault=5F=
link=5Fstate(struct pcie=5Flink=5Fstate *link)
>  	struct pci=5Fdev *pdev =3D link->downstream;
>  	u32 override;
> =20
> -	/* For devicetree platforms, enable all ASPM states by default */
> +	/* For devicetree platforms, enable L0s and L1 by default */
>  	if (of=5Fhave=5Fpopulated=5Fdt()) {
> -		link->aspm=5Fdefault =3D PCIE=5FLINK=5FSTATE=5FASPM=5FALL;
> +		if (link->aspm=5Fsupport & PCIE=5FLINK=5FSTATE=5FL0S)
> +			link->aspm=5Fdefault |=3D PCIE=5FLINK=5FSTATE=5FL0S;
> +		if (link->aspm=5Fsupport & PCIE=5FLINK=5FSTATE=5FL1)
> +			link->aspm=5Fdefault |=3D PCIE=5FLINK=5FSTATE=5FL1;
>  		override =3D link->aspm=5Fdefault & ~link->aspm=5Fenabled;
>  		if (override)
> -			pci=5Finfo(pdev, "ASPM: DT platform, enabling%s%s%s%s%s%s%s\n",
> -				 FLAG(override, L0S=5FUP, " L0s-up"),
> -				 FLAG(override, L0S=5FDW, " L0s-dw"),
> -				 FLAG(override, L1, " L1"),
> -				 FLAG(override, L1=5F1, " ASPM-L1.1"),
> -				 FLAG(override, L1=5F2, " ASPM-L1.2"),
> -				 FLAG(override, L1=5F1=5FPCIPM, " PCI-PM-L1.1"),
> -				 FLAG(override, L1=5F2=5FPCIPM, " PCI-PM-L1.2"));
> +			pci=5Finfo(pdev, "ASPM: default states%s%s\n",
> +				 FLAG(override, L0S, " L0s"),
> +				 FLAG(override, L1, " L1"));
>  	}
>  }



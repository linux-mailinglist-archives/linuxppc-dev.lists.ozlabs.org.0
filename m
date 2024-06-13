Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10C9077A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 17:58:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=a+7wRlIP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0Rs75xqlz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 01:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=a+7wRlIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 506 seconds by postgrey-1.37 at boromir; Fri, 14 Jun 2024 01:57:40 AEST
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0RrN4F4Tz3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 01:57:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718294256; x=1718899056; i=markus.elfring@web.de;
	bh=7fcDu+jAjKTUeYUTcm6nT/VKOpL7/vLs7dIgrQeJffo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a+7wRlIPEcxG49RcVFqb5ou0vhLV6DXfm6GUOZARL2kSkbuEBqxv4cWt3Nvo84KH
	 VeLAI/OE3ItIPT0tSoDDAflHNGPLclLlYIbBBZhRTkcdyphV774YjRjJF8nMUCeD8
	 0JeG2WnXe8OftiHs3W1vdFtsL62dInGAp7JdRF8Gj5FKhR5hnOXRMVAVzibm09UKy
	 SCQ7OJjVOpEUVGJVOyCD+KqmE+CnFRcZEFOz6Tr3L/qMDKXlrYByUPmX8lneh4hlY
	 3ljkWYwKFkl+5GH8bm9LJlsZr0y0C1d/bmz+Yvljt9cPGqEPEFxF6JDr4RaNDPF5I
	 ehcgXR06Eq4vebZmJw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MlbHE-1shnjs0jC6-00gPUD; Thu, 13
 Jun 2024 17:42:34 +0200
Message-ID: <531fdbbb-486d-4207-b9a9-3db23935d583@web.de>
Date: Thu, 13 Jun 2024 17:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, mhi@lists.linux.dev, Bjorn Helgaas
 <bhelgaas@google.com>, Fabio Estevam <festevam@gmail.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Minghuan Lian
 <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Niklas Cassel <cassel@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
Subject: Re: [PATCH 2/5] PCI: endpoint: Introduce 'epc_deinit' event and
 notify the EPF drivers
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240606-pci-deinit-v1-2-4395534520dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jXSJJJkAI8hN72kU1CJg3ufojWOHI1sFKaf7Q+GXWoK5SHvixA/
 yrxpcO7iG26yVIJ6a+gDgi7IQ7X4UOlJm7doH6z6KQ09CoTZ4UXvjGVgP4qYQDw1TnsDnm+
 QVgctN2V24QtpAjdxg0dM1CAxHvdlatDjFFXPjenuaogsqXyOG9yQTvPPKq9AalAtAN4qQW
 hD6x4vYrIAaZEEVGxiS5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vlMnQdkTek4=;1Ad9ZhDggsdOPK2RRawX6kxCmRO
 KPSH4ost8c804iYqpZcakXHf6IMuq9XxWzpqREXTJS0e5Tfm8GuHQqqUtStv8pQSW57/x4GrI
 A4lRjH8UaRXlP+9z9yauWXWdVFEJO7L/zX4bPoi5pyhasq5aUdbMXRYrZV6nEWm5gNnHfJumy
 32WzUTzFQ0uWIpgsepXRa5jjljnkxXlQ0YbjVKs9yYYILjqTJ2iwpDO+UuA/Ova4tVtqNIBrU
 IBg5URObNsTreQK6Kpys3kLaNklADgx0EV4bFnkuZqcocNxR5aapGiEi6YL4MIOM1W1xM7gJ3
 nGYCT+coDmnNMBff21jNLIvBpGJxW37ZwisARqUWEhD+pAvcPVnNgm5ctDMWbnr6h20x6njfv
 ev4cpkdkZmamYPvBIN1fu+vuJ4R28beRs8Zb/9Q5WNU0b69XvtuQSAeQhcLp6uGka6dBDm4xR
 M47L6D5kcBRcycHRQUIifWgnRtkKHQCoZcm0/j4h0lh6xbzTE7IIli9nPaqlLxVCMYu72IL2V
 ihRuDWJn6C75sD66E4F4iRT1zHNrn0sKY6FU2zBnk6QXUYguzpiEdRLee22DbN4YlLqGKBMnS
 rC1TymSOpKGtS2migyGY6veJlt73UPya9Wm5smKt452IvHH7AOX0FpZ5bXu9dAwtoK8YrKvIM
 GeVsnbLs0q51hjMmJgHbqNFB1Cd74e3Ywd8lXT7+/MoZgyA72Q6xMpw2ctII24dAD3bIGIodk
 WwOlh78+lyfR3C7WJB6kp6YEPWpFqhtBkdDn6Ef1B2gRiTE1R9Ufx9sk/EmzvJ6qPYvzsxolC
 VSPPT7b+hT//QWu1lJuMAE9lFGvzAJbQlRcUFlbihj8ws=
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
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=E2=80=A6
> +++ b/drivers/pci/endpoint/pci-epc-core.c
=E2=80=A6
> +void pci_epc_deinit_notify(struct pci_epc *epc)
> +{
=E2=80=A6
> +	mutex_lock(&epc->list_lock);
> +	list_for_each_entry(epf, &epc->pci_epf, list) {
> +		mutex_lock(&epf->lock);
> +		if (epf->event_ops && epf->event_ops->epc_deinit)
> +			epf->event_ops->epc_deinit(epf);
> +		mutex_unlock(&epf->lock);
> +	}
> +	epc->init_complete =3D false;
> +	mutex_unlock(&epc->list_lock);
> +}
=E2=80=A6

Would you become interested to apply lock guards?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L1=
96

Regards,
Markus

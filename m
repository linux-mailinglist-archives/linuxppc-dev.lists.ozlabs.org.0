Return-Path: <linuxppc-dev+bounces-5694-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B8A22636
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 23:30:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjxgD5NDdz2yjb;
	Thu, 30 Jan 2025 09:30:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2613::618"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738189816;
	cv=fail; b=K78Lys7cow2nNPNU+wFdBTy0W0EcZ3hq64c9Ia7Z+sWqtER9yKyPukNFzUSmSvjyh15m9UFkkSkZwfyFfdYdnQwCrop0ey34CtiG+dLFTUxoNr2I3J1xnoUeNM4uTcifBSN5Ihyb4NI7AwF+sQs2KSr/gJfzeLYKe4hkIZ8YSR0zs0Ruc3gWOZiq8EPKjm4T3I9DaiBl3kbqUKzTxqEyffkOBJEWAvJlDrmuPu82qpuEdh6wDn1mFh/IMYxl38JFCnb7nxXQ1YIUrPmIryMXa1ra3PILP+GsjIqpeLdIkHC+QlXueoscKy5UWoul0/5DSYjwYJxYxkEKdYLk4v3p4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738189816; c=relaxed/relaxed;
	bh=SlU4cCdP/b8RDDFEDDnkGXDrt4PJRdlhH4ntw+4oK+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kb3Z9Bpu9YFZrvbc9+KGBygEB5NANJ0vWBbnYjke7uWIo6I9vLfL4+y49ftJO765EPud3Ur+fhgxPwIIfOltSzB5naD40zuCk8Y9NcbJ8WjbBNT44CydBXCVvG5vAnVK24MqqwiowQiCoIQ8iphHLNCMTOh0VRK98CcEgbt2ndXUmZ3aqy7FZFx7mVQcUwhIh5wqOj2le3qX8V+2J/vATxaN5JGRoAXui2o3Oil5xT8UWgqLahvtZuL/vJNlnYftzpIM1AUP5rU2pfOMq2takPlQv7+fzZ0mcTKrPoE/WGNbkkxbpH28F5CkwodZv4UQw+U6ZBrVzf1pizHgG8Cb0g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=e1ri2ZWH reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::618; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=e1ri2ZWH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::618; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20618.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::618])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjxgB5mbMz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 09:30:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnwlxFYow0ORZEBDhb2dJdPGjGLskSezo6NlnGrNCmdiJc3sy0xlIJCVik70XVaKaF/9OP0cM9I8d6HyfMradMLssYXu26WkV3lSJbDnJEfaNxeLdwUEMdSnMCdyFDHd4gevr0scdUxAOYUFj5sIE0ex4nBwxTWOv0mI0fTv8LzuRpjuMsE65EFFENYvEhjowFqNCXgfHdTlWyAGbpMoVuMdwPsqeAMnbHPoYUczzwBIz4lI8zinBH/f4HN+MhlXxwV6WJqvW2VAfBbGjdvuQlLRH6vRwGtdnPKR47T9SqURdIpDRKetAaQoNCOihsN4cpc7XLlM+VJHp4zbJYH2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwXEZi8cIC2ZmG8SvYMGoJwQalQTB7TpFfDrIrVR/tg=;
 b=Lhn3y4pVeAIS7vku8x1ThPy/Nn/vFUzT0UJQjqWPnkKAUamv0KQeOu5BIyGiAuFVxv/N0IETSdLBf5Sz3TqQcPhcSxfOjEBHJaHXU/cxJFUXgicCSKEA8iBBVf/tGipFTfsorleks1BzZQctrrCnF4dyYTX6SXORWFmnZZgeMG5IWKVa+SbJKywLFrkZU7r9w9qhSkvJbV4Fm00XJm78R41rXNyN23isksSRoVtl/SVts8h4y8L60fdb1jDWnSzdrjWgwSwcdO1OtdGb4Z20q4bC/UGrOUxq8fVxkluRYar1Wm3DX/RXuiZfdPRP3JNrwxBSTt4KWb9hpyg9KlUNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwXEZi8cIC2ZmG8SvYMGoJwQalQTB7TpFfDrIrVR/tg=;
 b=e1ri2ZWHUaUT+4RZl/Y9dgZFNO/AyC7uUvBPe8CTKYZRcuHbxXd1Pj1lBo2z9sMkDvwM01kTvmQo2uiyuI2bEqGX0CGgDybfI0HID0+g+sgIxEIOJnsabNOVM9Cs/a3RG7AUaNXa22YKaiGiTpdhytv1lGZyH4JiozyAJKidDj5Yvb4ov9O8uCDM/dvQvKj6FFD9aCS3gNVtjLoFnW9h4p8BcukjQ7cxPXLj3FBUjY12mwGRhtrmWH/diocieCBMPb1E5rPl2i3MFb4iWUpsN5ar0b/9y2uLKvdKywqA5nenkoH88GAmw+WMTfdzCKt3KjayEOjEUa0UdI23zfrI0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 22:29:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 22:29:54 +0000
Date: Wed, 29 Jan 2025 17:29:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/9] YAML conversion of several Freescale/PowerPC DT
 bindings
Message-ID: <Z5qr1VkKSlyBE/E4@lizhi-Precision-Tower-5810>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
X-ClientProxiedBy: SJ0PR05CA0128.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b4a154-9a6b-4ff1-0ad9-08dd40b47456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Tty7MLVK/B4BwdTWMQDi//rs9ChpRx6nj2vQfbTAbKYeADjyf5+Gcz0vhU?=
 =?iso-8859-1?Q?tYhFyHm4KkksazkGrc71BF410o3qhSrq8/etHPVoG4Ckaot0j0RNG0FvaV?=
 =?iso-8859-1?Q?tDH6B6tSyHdaW+pFWIx7POzbOoE3Vs10sfJ6xscBYBQCqS7JOCILdRZQak?=
 =?iso-8859-1?Q?vfJjUE8OLn43o/4SsH/DJaM4uFUR7N8QkqqH3m4VaNY6Agk1yra20Z/0UF?=
 =?iso-8859-1?Q?tk5OX+SrE8KkHI5wvTU95djsCtAB5jz1id0/h3T6s1KLvUyYiiTZjv4rV8?=
 =?iso-8859-1?Q?ERpgdtK7OSrRQikSNVX6Y4eNhTnv9KPeSdHC0KJWMYh6nFE6WjF+oZGE/T?=
 =?iso-8859-1?Q?xvFoehsOlKtvVj1LcgqvA9mdAkOGS+s+HX1Kz9AXifum5kXPjWgNCTwrqg?=
 =?iso-8859-1?Q?rbWW6vWU5qy/hiVPMTYx+KUZkUVii8d1mvDo04gztucsKAaK0SylvcYBHl?=
 =?iso-8859-1?Q?kkSPV0I1l2T6Ju2//L82X1/WF8C5w1tuQF8QmWUQbNc4N73wkMZ+6BE7Ky?=
 =?iso-8859-1?Q?EWNSQ8vN5UvasTK3kQjdB1dfxetnzA3CSJUhPUKMdKL1kZuqjfjU0xovWR?=
 =?iso-8859-1?Q?FHAYPiTJwsKio1aobaJTc5eaDGvd+dazsHVI7/3vrraUiSGh+5EOfmG6L3?=
 =?iso-8859-1?Q?pX99WG7E2XG4+stXZjbVqkSsnlHDkBLF3yhQV0JD3hKTT7lTKl4ldtHKT3?=
 =?iso-8859-1?Q?dvTBG2OAcsp/mAMKcM3l/aXif2obk5PvGM/7dFQXPiFUNgySaS7/fpf/xc?=
 =?iso-8859-1?Q?tpn1UMpsWl9oKwy3ORGpb2xRqB7w0tMRrGoO+LTEnTWlvtHFpfr7u4PLq7?=
 =?iso-8859-1?Q?X+2xeHyXjEzRQNkKKN7I/cMzbNn/2x74Ija0HIXi3zWrpzw4N92AYzlHgg?=
 =?iso-8859-1?Q?7xxCcMpXZQg03xzmfb4URYXd8V6mHpOnK4BqpT1/CtHI3Yxokrb7hkUk7S?=
 =?iso-8859-1?Q?wMVFR1/A3H0QzHE62TpiblaxOrwqbYBf15u5HlHPoQD/0vHP0bEuo1ZrZM?=
 =?iso-8859-1?Q?WeevJdSVmbtq3Szps7HXR9tQSejNVu5dMbVsW88cfDJ6BTPESJQTRpJE4p?=
 =?iso-8859-1?Q?jAaR1OFlCv3hgbVx6dQCm8++EqCnFOfqSI1FY6WU/sXYcreo2KQa5YVQ47?=
 =?iso-8859-1?Q?JEcZcGK5xN5dGZzvLzd/bZXTgw7zPeJNKKWwADFvFeOH4RXxcMd9FFyNqJ?=
 =?iso-8859-1?Q?3gsgVOMQmh3iWAysh08dFy4nB+gS3/0/RjgnUXfm2ZpcvTRMB7sj48zYW3?=
 =?iso-8859-1?Q?d4TZEGTXA/ZvfIt5zBE3FK7RFxfFJ7OuMCbCcZye3KsFIpk9hCjUcbVQ7g?=
 =?iso-8859-1?Q?wOoDMm4wjNFgKKyjCopbuErrSmzgu8DzGOvjdOT8m5IVVCau9a3C7swC+/?=
 =?iso-8859-1?Q?JffhOrVkjg6mBG59HPkXFPTmLniJm9kJ2M0c8V85GIeTDXWnVJiK/O13k6?=
 =?iso-8859-1?Q?ZfTW40dFYUXhP9QK66z32OPMVyFitFfqJvrGrrR0CavcJnep7oLgGni5Qd?=
 =?iso-8859-1?Q?h6bzTSQCZgUMHQMz7Sh/JH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?f3CK1l1yCBSbba1DBW8FukO2fm15mR7SwxoYuy67astrppTE1saq+yIuYL?=
 =?iso-8859-1?Q?WgYbGKjbISVR+KP4i7Km4WSoH/Iu7RJ2EfRdG2+rmrJUlLfEocHjV+bsSj?=
 =?iso-8859-1?Q?GsojgaKqPpoIkibiGbZ5BumHGZV/N3y++3XLGbd6QFsbLMooY3xGmZtnEz?=
 =?iso-8859-1?Q?JvxtkYBcitDfsfkxQqxMDk2evAHOH821XfpLYoAty21qJTemxUq6k+4H9T?=
 =?iso-8859-1?Q?+LRrLwiiEVFgGc+xt03FVEpJOg0hFaJ9hgVbo8h3gitM8ZDXKFpLNRnEuv?=
 =?iso-8859-1?Q?GEM3QbYJXHAqeVvnG9sQ1wQsKerEKBdXHgxxA/SF6Y5OBfc6V2AVVpynYP?=
 =?iso-8859-1?Q?VGMA60tXFEC4OyyY4yJi8n374ropIOLJetOi3u8XZh8q6uHXY1zj2Fsvty?=
 =?iso-8859-1?Q?NqV4SoRxw5gmpWkxAH+SrHrjTJXse1slpgHh4e3SAHN7H1UWp9ICMeBmUf?=
 =?iso-8859-1?Q?neTZnP/N0ZhYoG1LfxrKeqy9pj5Dkg7BJ9ZLFuZxNN3pf5Z3owz5MwPmbH?=
 =?iso-8859-1?Q?dxFqwuJouhz5LWLyuHIvEjoD5rDMU+iX1M90xPjwYLcQhsHZ6SvQMumsYE?=
 =?iso-8859-1?Q?F6UtPVQ1MclFQrk05HTOmiKAloOktHyo9u7a/MNBhj2X6OZ4OyoZaiJfAq?=
 =?iso-8859-1?Q?SdmGN/Vb4hD4EAsRyRTAkfYQIibtXZeHYQCvFyHV5HNhcT8nDiLbr2+Vqc?=
 =?iso-8859-1?Q?uehrGWofQLqRxIUbds+Iqk0PMJxqsIlqplkdfeA0/at2gFDjIEMgmdioqt?=
 =?iso-8859-1?Q?AGhUvdS1rmprOEkr23I7P740cl6UA2tAYQpn28gv5F0ebjEd4qmp/7Gutz?=
 =?iso-8859-1?Q?C4A68JpEKZ/xGVviqK01f18jfB/ly1qJDRnNBQpKQIyFEWabWfOgAGn+lt?=
 =?iso-8859-1?Q?KWxsprDKNGjRif59rh+zM+aPJ48XBFkc+De7Aydo3Zsu5v/p9VoPi0eRhy?=
 =?iso-8859-1?Q?QyyR6xOmVEURs5fqqFKSFVH0z8+6FESKegjjDWOxT5NJkPgQlosNga1xQa?=
 =?iso-8859-1?Q?MyUYg6OV0IG4dDA2fac9hmaJE3ofok0dGLMzqStWZXjxc8c117fpCDYq4/?=
 =?iso-8859-1?Q?YKy6e7fWTKUeP83wsPPijZ0Pdo8Yg1vyVZ+NqNtbmYS/FAVWbKbgFgOUzG?=
 =?iso-8859-1?Q?5Qy9d3GgssVBjAf8xqmXOOi6ZpwmkkmfBDDEpWsfIxxvAlRyzBT0+IzjNw?=
 =?iso-8859-1?Q?oltkxqs0IgBGVhLl0zR0AiYx07QqQpUj1LH5ovzmjqEDANnOtbh6wdzW1S?=
 =?iso-8859-1?Q?jzwBVAcsA2AYOlw/Y+GqEMeagX8y8nGhu6M+tTcqYPs+Oxpxvx1AYUNbL/?=
 =?iso-8859-1?Q?vlpl79b0X4tBDI1dIEIAd6ZdtZ3vx1ybp9GzavrfLN4ljmNiNcBFkVnfnr?=
 =?iso-8859-1?Q?ByVemvKPfA5QJcixs5fqPqWOrix1aCLdv6zPn5/Mw2bSkQ32uT4bWYPnwe?=
 =?iso-8859-1?Q?2r59iahI+ZgVpcSQhATeUrkahlSiqIkmMP44aPMEdg4REPVYNKOGhqzLz0?=
 =?iso-8859-1?Q?lNmQFSctrnooWruz0OiKoqcUV7dfy1zWy06as6dpSNYDUXTHx/HQ7nD6eV?=
 =?iso-8859-1?Q?oRwP/sCTlABfG7hmLgDhgPHmoAyMtxnjoUAyThWGix7EVLTD+GbWJtwtSe?=
 =?iso-8859-1?Q?rM0E4M/KZT6hM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b4a154-9a6b-4ff1-0ad9-08dd40b47456
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:29:54.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KPtjEtOBaIQxSiJLY8wmtG/N9cqzgVCstLsLy0kTLYj8T3xnFcv2Bjy3Rbd8Xjvf2KG+jaF57WMtw6Tr+O6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-Spam-Status: No, score=1.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:58:55PM +0100, J. Neuschäfer wrote:
> This is a spin-off of the series titled
> "powerpc: MPC83xx cleanup and LANCOM NWAPP2 board".
>
> During the development of that series, it became clear that many
> devicetree bindings for Freescale MPC8xxx platforms are still in the old
> plain-text format, or don't exist at all, and in any case don't mention
> all valid compatible strings.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Please cc imx@lists.linux.dev next time

Frank

> ---
> J. Neuschäfer (9):
>       dt-bindings: powerpc: Add binding for Freescale/NXP MPC83xx SoCs
>       dt-bindings: ata: Convert fsl,pq-sata binding to YAML
>       dt-bindings: crypto: Convert fsl,sec-2.0 binding to YAML
>       dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding to YAML
>       dt-bindings: dma: Convert fsl,elo*-dma bindings to YAML
>       dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
>       dt-bindings: watchdog: Convert mpc8xxx-wdt binding to YAML
>       dt-bindings: spi: Convert Freescale SPI bindings to YAML
>       [RFC] dt-bindings: nand: Convert fsl,elbc bindings to YAML
>
>  .../devicetree/bindings/ata/fsl,pq-sata.yaml       |  59 ++++++
>  Documentation/devicetree/bindings/ata/fsl-sata.txt |  28 ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 139 ++++++++++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 -------
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 129 +++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 105 +++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 120 ++++++++++++
>  .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         |  53 ++++++
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 ++++++
>  .../devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml   |  83 +++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------------
>  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++
>  .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++
>  .../bindings/powerpc/fsl/fsl,mpc83xx.yaml          |  67 +++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 -----
>  .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      |  17 --
>  .../devicetree/bindings/spi/fsl,espi.yaml          |  56 ++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml |  71 +++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  |  62 -------
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.txt   |  25 ---
>  .../devicetree/bindings/watchdog/mpc8xxx-wdt.yaml  |  64 +++++++
>  21 files changed, 1212 insertions(+), 444 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250126-ppcyaml-680ccd8b3fc2
>
> Best regards,
> --
> J. Neuschäfer <j.ne@posteo.net>
>


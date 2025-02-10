Return-Path: <linuxppc-dev+bounces-6055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B99A2F8B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsF7W49D2z30VX;
	Tue, 11 Feb 2025 06:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c201::3"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739215895;
	cv=fail; b=n7uYZRHPHgM6/HkUJ+07opVrt0ToxJOC31cIOfvfEdX1J65SUN09WCfnwvqAEXnBlX3jbf1+p0rH18nTc9sFraDJ29kB1ZWGy41//jDbuYP/CXg3SGyHfEyJLTBQA6kdFajBIjapb+WHP/xt++ECVB88RX7qgaQt2ij0coWkEttHJLH9cYs1lT0GrWeYoSUMOxHvnYL5ToIO9/nVRIbWK5+xDZeR0rThP75/m7Hv0JeQis+wuz+DIJeN+oXBiPZgzOL+0X5Jr8IHWd0MmoH7gMzLgYKmRF9ADVPpMcDz+ptHtVgywcCG2gmc3+zxZjd6Ocb2R6nCMaRibttspGMonQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739215895; c=relaxed/relaxed;
	bh=10HBI5LEaMsa7cS/4maBDF0DDCJLrEYsJhsfvMcaeuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GH7qE93Ugc154JCGbZungZGJETIgmYAU4Ln5SShSzrqIS5Q2luEuC18Z7tkKMF1Q9QEHbA9u6sRg1/pb/2zoE2hFOv3vPl+hI6Pwzi93lLGyqKgpKoqWiFqw5sXDU+ixb2+k9EB9IU49WMV7rgmpjDFYdDBI0t5hfA56zIK1t0eSZGhomisuObRyD7kcC9FR1/wJre5OBTh1O/hD0kpXk6TAzHQ2Cw08X8q8wT6yAkqKaELHLQ4i2zG2T+rl5umEhPAuduKhwChm0U9toH0fXw6WdPvI+pMZYahg9xn4K1ZG3iwYRE++TFtXQ9K54yRfzxVjvMk+KiBL+rP5bBX1xg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QyV9lo3H reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QyV9lo3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsF7T4mhlz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:31:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGfv85l+uc0QdkprzPe+6xwUfnHync1TUwMxUHHOJFBJHp5vQhhr3+2MslQn5b18pgwfjqodxSWTG19LUp5NSC2OhGo+izCwObfkDGNK+y1/18APf9HUQ+VbO2fv4/2laYYEXcHOOi9RaqwsXp8lG1AsiPLqW0QMAqqgfOL/hZYxD+3YeTirlWwuJtgi3AddhP8EtPOAqfqmivu0SFJx3HpVVWy6vXw9ZqiA0VPDEqTNOyXO7tDjbACklKTK+YEMgLthJh4Ol3nQY/mXMqdS0h1jFfwBNjqcUGg8icyWr6aiuEd82FTYnu2R/vLX6wAsOyuSazs3xY/UNGiiEbi30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUH04Zx+SK5nmXrHU5UNRd2OrW4RAyS470UJVbxyJgU=;
 b=I5Y8JaDSszwMVnIyfvYbzZB60ppwjL3NJMmKVve0M4PcrOb7jrbyn3TpfxdHhEfUGRYFjxBeJAxc2wA/DxHPbBYVAZCIzs1+S8zHfi+2I+VS7fGNS3gzBLIFGO96PMnAhAstDGmHRIqj3C/Aq0qfPIMz9IKAFZYp6TH3F3H48Zr+icS1wR99zIi8d0gA3ENLuLIq45uQiQk8SOBu5VKmDol1CTZS2H3s0IODuwRQASTjjitBbKvuCizQhVt8mKEJ66CHxLDompj2tyvilulEgb3HF9SDZdDFsnpIitB8L5W2Je6Wf9ZwVTeqrKJwkZYM4w2E//6AkrYDA7VTVZwpxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUH04Zx+SK5nmXrHU5UNRd2OrW4RAyS470UJVbxyJgU=;
 b=QyV9lo3HYvX1Jr5wSrJe87Jh2CIQzOn0nBjTI3tpItl13gk4GfjaqwHZPaHj91G+OMQpblNtpOrcRAjYcnPzGYAc1n2P5EHa//xx43usC1bap5TrWQoexofNq2kvs/8R49a+G8hRrH0GfCLUUAc9jYV+fselQ3N/v/uj1qAJ3IHlKynqBZHVkNftv5Vc30ly9PJMOZ3NNUfeKROECyO6SGsoRBsJyvyiWtgUG5n+6VK2P8mWpW+U6d0z45bx4WifhrwRa6cNcbv4peHG5Md+d0VsUCwgLJ5gNENGr8mO5o+49XdWbVguF/VyMSMtYNPSgc83aPd/jzWfoUl4QOAuog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:31:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:31:08 +0000
Date: Mon, 10 Feb 2025 14:30:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v2 03/12] dt-bindings: crypto: Convert fsl,sec-2.0 to
 YAMLy
Message-ID: <Z6pT7mR1itWOtVfb@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-3-8137b0c42526@posteo.net>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9cd9f4-15b3-44a0-e1ce-08dd4a097819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?KH3L08NHvpeBna5BnIeMK8tL5Dvl3ktvAvx8lLKeWIkY9mP3EoFOkDqEwv?=
 =?iso-8859-1?Q?6bc5XxHRFCpGbF1CFm+l/Cbb54cuDcP8HgapmyPHLmIbq90MHFtT6y8t0o?=
 =?iso-8859-1?Q?cPLcwQq0IASAUN8Pngs5hCsfVh1Pxxyt74Hk1pTniysIsWc0MKj5HyKJaz?=
 =?iso-8859-1?Q?MWK32gFZMOdM3JwvCU+m+Jc2vQwshS+eHDs2E8ruBYJfYI0tshIygp4+U2?=
 =?iso-8859-1?Q?NM5tNPK++tGsXJFJIePjOvrEkGrJbJ55gykXmrZ92bK4l07dhpzsWFAXTo?=
 =?iso-8859-1?Q?N4oR2T8GnSvyV/+gR3X5PVGGxWs4lRXtjiey1U894eqLrT2jP2JkEH7kMg?=
 =?iso-8859-1?Q?TAeKXk1NsiqKSjljAckyD9hrnhMaFEvM9rc2a5gFZj8YWV3Ls2IbFa7Qke?=
 =?iso-8859-1?Q?A1l9878plQDXjWsNWZjvaP38mrW2Uecea8VWec/M2lNO5yUbroF8v4MaVW?=
 =?iso-8859-1?Q?ygw7JfLJaaUDVBdLcVUA2U9clRbRM7kVqtBY6EPJftwZd5ZoZE9L1R9P/k?=
 =?iso-8859-1?Q?MDDpJpzSNCjGzNTV/UrOYFqEtkYlWJK5ymmegjo3GS4lGBvCVqsxsv1gOn?=
 =?iso-8859-1?Q?XcsjfMWkWj4McG+KhnTWZFl6X6mgqRQD8cHLzj4KL7nH9MOZ4MoeONc7OT?=
 =?iso-8859-1?Q?SX4gu8vltZgjYzdNAPmMwwFwEC5Yx/2i9sg7tqPoAwwQLoa/NtRK1Pe3X2?=
 =?iso-8859-1?Q?jXBnl9n+kkerOG0cxR8ETej8kbnljEWWq7FFsxsmC4xDtgy2EEQM4aMawk?=
 =?iso-8859-1?Q?QwLgahicrqLra5jLD7l1mnQj9tR4zBH8XW86gVFAKwqOKD1ZogDGNj/0EV?=
 =?iso-8859-1?Q?os2uaXVCtD/52b65JMuT3DBhB6RlINobn8F/10HGMekxY34fXdQe4YMTvW?=
 =?iso-8859-1?Q?vwiiZY3DdDKEQ55N1vNhJQlCdbZ+L3/yUFUnK/oWrRGTTNH82jMtlOb+Lk?=
 =?iso-8859-1?Q?352wJSysUu8hEby0tcek/UVa+sxVZHP0yttoOxdA7v7VlZaUXEsHsUDhA9?=
 =?iso-8859-1?Q?a2H2s18eUZFgszihkoSqL79dizyeKvbWH3rV8gBWoOAz9Dbcc+7Wn2zg15?=
 =?iso-8859-1?Q?5xRaH0rghnFcyeLP8z/HODZ3xbQaYJAnHmYVy8ber1eZ1njV20CjysKcrx?=
 =?iso-8859-1?Q?g9U4KRahZXp11nyunHMRZLtk/fw8MfPuyJW3FUYFeVo2JW6y2ESnQqhItI?=
 =?iso-8859-1?Q?FhH4D723XloQcBFtkhbUqJCO+lElfISp3GBoCHUovm8SWY/xo+EyJFvfNZ?=
 =?iso-8859-1?Q?587U0ElLGpq26SDaM9NGomz0ZDVDlV9z9DbuFm0DrjFYDLM8tqC9XqC6R3?=
 =?iso-8859-1?Q?EK4O7GjRQODqSsNRFFP+kmjFx4Sc+Gz/HsR0oMUVAfnD54G/PWaK1wVXLA?=
 =?iso-8859-1?Q?jwSL3jxq4oHoR6lrwin+W5hlH9YYPIgA0ChOnZhRtqo3S+eitXbDP75TgR?=
 =?iso-8859-1?Q?jINgF2VXPCeer/OT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jmPEnuHU//Z+oyw4CZHC3ipnqunMJ7apDRyE1Ex7uGMk0hcfUL3PUn/AZC?=
 =?iso-8859-1?Q?UMhttsK7GVEnQo0w4FFlBHSEF03bv4OOn9BqZs4SeEanvc8vRLomZ3S/nb?=
 =?iso-8859-1?Q?CLH1wXcBNbhist6LpjgpXGbvrW/+ArZdU1gZwM1ooj5+JokUXMUe4FFm9Y?=
 =?iso-8859-1?Q?poR7y/mdvHp+z+smP+0r3VPhsJPsNYn9a+wRvkfV88DuIYmCSKNiBvq0hZ?=
 =?iso-8859-1?Q?NXqzo/f6EvMcN6ZU+1P8rMi2WeRLXf/f4eIT3eJD+PRnH8517TB9FrKLW5?=
 =?iso-8859-1?Q?3O6GM1xkUEUYbIXGhUii84yMoocD8DMznmOc+N4dWknE0z3+mIprJ7DPB6?=
 =?iso-8859-1?Q?RslqeEt4EQQT2ikDcLNaWjytdbRT8/U5Dbnl0rZLnbYXMWbbMA95NtMbx5?=
 =?iso-8859-1?Q?Bmm9G6LdTvI9QizDS2CDN2nz5vayto8CPX/zaeQFIgolnJmfpjbyMk6xwM?=
 =?iso-8859-1?Q?XjeDg6JMsjfbTiyUaH4/ZdxYHLaN3qDyUZPfPNflYcIXvXv3dQtHloYU4/?=
 =?iso-8859-1?Q?aJ822yAW/fTTyL7DjG4iJgibyACaBeHc7/bk4XOxBvZNq84A+gbK5UumBZ?=
 =?iso-8859-1?Q?IjW6N7qQ93JmFCr+2q/uw5QT70QtP7sihiN+/9aImME7qse7elombLVg4O?=
 =?iso-8859-1?Q?W4Dim6YG0mROUqHY9Dir4xRPPKBuzHFJkWI31DLmFejIHxlBDsmkFLMQEA?=
 =?iso-8859-1?Q?kZjkePV1Z+TICHo1gV5EPuSMbfHOkhF63X76GcgxlgeGxZHGZdlG8Lwgwm?=
 =?iso-8859-1?Q?h0GeJb5dKvO0Q/xN6AF2m922+X0ihUxTVbRD/2J0/IV+onjMRH2UcgVwWj?=
 =?iso-8859-1?Q?zuGKfMNNShCz31QQd2cQWloLPiWCExnYrxIUHuleOjBRto2AEh/uMGZOiI?=
 =?iso-8859-1?Q?HmItmgnvJGhXN1zkl5v6Z5euug77NanwcLFCSCMACVyhnteihZJo43t+Wp?=
 =?iso-8859-1?Q?QjJjDzqsGpTbVbpf7Ch1eCOsrwM5truwI5W5lRwVgsw4bCi8FwI7IuuKR0?=
 =?iso-8859-1?Q?35NvSTro7Rm4bx9ODkZOuoI+Psn/ka1BZVPJMopQxMj6l7aEc/v48lpBuP?=
 =?iso-8859-1?Q?pFXEPyxOcQBfXTD8D3LWGYKGIJTUPrVy6cqvyAuSzyGrfLwNeUhDRdihlQ?=
 =?iso-8859-1?Q?VXlje3GSRbegpVSt6CjTfNHm42KM4961JVuKDlqnIIYdjJWjuUb40lzYo8?=
 =?iso-8859-1?Q?KU80PdLVcWKj+IMFoGE6IaVEZJ+9agVzPQaFLt9sgkybCD6mLS1/AZulWm?=
 =?iso-8859-1?Q?NHAlEd2was3kFWYw0mlc9ABnAO0wCnoJT8eksZn4bFlE0iQ/xOSJEMflB+?=
 =?iso-8859-1?Q?D+VGJf0TTe27GQ0ZvHnAz3oXq8io4jt/umBrIIYTpihZ0fIRzH+X5AYu+x?=
 =?iso-8859-1?Q?9+fwvG+6tANMjCoNjanBBaPR2kHWVb/gRnh6SwNKny/lFo6t5k+FcbY43a?=
 =?iso-8859-1?Q?H+9cqAvZ3UYPaO6AdBc+dw2L/q9N0bQXlXLIM+JvKys3gqdvujyTNmEghd?=
 =?iso-8859-1?Q?5/6HD2+bMqlURxubvSpB1Gj8P4F1iLAF9Dh5F7r/I/wa6yo0MbuKEyeO8v?=
 =?iso-8859-1?Q?2nmZ2L2BymC2j6NEBsoxUw1+t3Ri9hz/6HAbcHLgjV/WglZ7ILVF4f7B6X?=
 =?iso-8859-1?Q?LsaFHn9fld/ns=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9cd9f4-15b3-44a0-e1ce-08dd4a097819
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:31:08.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byxaJDM39Rd0RuGVD7MXb3+2gZdV0aGFEF8MzKEhYaCJ9vf1/4habV/jeqTnNBfFJsyaqZ1YqFZPCPuq6+rDzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:20PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
>
> Convert the Freescale security engine (crypto accelerator) binding from
> text form to YAML. The list of compatible strings reflects what was
> previously described in prose; not all combinations occur in existing
> devicetrees.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>
> V2:
> - several improvements suggested by Rob Herring:
>   - remove unnecessary multiline markers
>   - constrain fsl,num-channels to enum: [1,4]
>   - constrain fsl,channel-fifo-len to plausible limits
>   - constrain fsl,exec-units-mask to maximum=0xfff
> - trim subject line (remove "binding")
> ---
>  .../devicetree/bindings/crypto/fsl,sec2.0.yaml     | 142 +++++++++++++++++++++
>  .../devicetree/bindings/crypto/fsl-sec2.txt        |  65 ----------
>  2 files changed, 142 insertions(+), 65 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0b82f3b68b5f82e7fb52d292a623d452c1cdb059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec2.0.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net.
> +
> +properties:
> +  compatible:
> +    description:
> +      Should contain entries for this and backward compatible SEC versions,
> +      high to low. Warning - SEC1 and SEC2 are mutually exclusive.
> +    oneOf:
> +      - items:
> +          - const: fsl,sec3.3
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.1
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec3.0
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.4
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.2
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.1
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec2.0
> +      - items:
> +          - const: fsl,sec1.2
> +          - const: fsl,sec1.0
> +      - items:
> +          - const: fsl,sec1.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,num-channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: An integer representing the number of channels available.
> +
> +  fsl,channel-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 100
> +    description:
> +      An integer representing the number of descriptor pointers each channel
> +      fetch fifo can hold.
> +
> +  fsl,exec-units-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 0xfff
> +    description: |
> +      The bitmask representing what execution units (EUs) are available.
> +      EU information should be encoded following the SEC's Descriptor Header
> +      Dword EU_SEL0 field documentation, i.e. as follows:
> +
> +        bit 0  = reserved - should be 0
> +        bit 1  = set if SEC has the ARC4 EU (AFEU)
> +        bit 2  = set if SEC has the DES/3DES EU (DEU)
> +        bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> +        bit 4  = set if SEC has the random number generator EU (RNG)
> +        bit 5  = set if SEC has the public key EU (PKEU)
> +        bit 6  = set if SEC has the AES EU (AESU)
> +        bit 7  = set if SEC has the Kasumi EU (KEU)
> +        bit 8  = set if SEC has the CRC EU (CRCU)
> +        bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> +
> +      remaining bits are reserved for future SEC EUs.
> +
> +  fsl,descriptor-types-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The bitmask representing what descriptors are available. Descriptor type
> +      information should be encoded following the SEC's Descriptor Header Dword
> +      DESC_TYPE field documentation, i.e. as follows:
> +
> +        bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> +        bit 1  = set if SEC supports the ipsec_esp descriptor type
> +        bit 2  = set if SEC supports the common_nonsnoop desc. type
> +        bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> +        bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> +        bit 5  = set if SEC supports the srtp descriptor type
> +        bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> +        bit 7  = set if SEC supports the pkeu_assemble descriptor type
> +        bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> +        bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> +        bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> +        bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> +
> +      ..and so on and so forth.
> +
> +required:
> +  - compatible
> +  - reg
> +  - fsl,num-channels
> +  - fsl,channel-fifo-len
> +  - fsl,exec-units-mask
> +  - fsl,descriptor-types-mask
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* MPC8548E */
> +    crypto@30000 {
> +        compatible = "fsl,sec2.1", "fsl,sec2.0";
> +        reg = <0x30000 0x10000>;
> +        interrupts = <29 2>;
> +        interrupt-parent = <&mpic>;
> +        fsl,num-channels = <4>;
> +        fsl,channel-fifo-len = <24>;
> +        fsl,exec-units-mask = <0xfe>;
> +        fsl,descriptor-types-mask = <0x12b0ebf>;
> +    };
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt b/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> deleted file mode 100644
> index 125f155d00d052eec7d5093b5c5076cbe720417f..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec2.txt
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Freescale SoC SEC Security Engines versions 1.x-2.x-3.x
> -
> -Required properties:
> -
> -- compatible : Should contain entries for this and backward compatible
> -  SEC versions, high to low, e.g., "fsl,sec2.1", "fsl,sec2.0" (SEC2/3)
> -                             e.g., "fsl,sec1.2", "fsl,sec1.0" (SEC1)
> -    warning: SEC1 and SEC2 are mutually exclusive
> -- reg : Offset and length of the register set for the device
> -- interrupts : the SEC's interrupt number
> -- fsl,num-channels : An integer representing the number of channels
> -  available.
> -- fsl,channel-fifo-len : An integer representing the number of
> -  descriptor pointers each channel fetch fifo can hold.
> -- fsl,exec-units-mask : The bitmask representing what execution units
> -  (EUs) are available. It's a single 32-bit cell. EU information
> -  should be encoded following the SEC's Descriptor Header Dword
> -  EU_SEL0 field documentation, i.e. as follows:
> -
> -	bit 0  = reserved - should be 0
> -	bit 1  = set if SEC has the ARC4 EU (AFEU)
> -	bit 2  = set if SEC has the DES/3DES EU (DEU)
> -	bit 3  = set if SEC has the message digest EU (MDEU/MDEU-A)
> -	bit 4  = set if SEC has the random number generator EU (RNG)
> -	bit 5  = set if SEC has the public key EU (PKEU)
> -	bit 6  = set if SEC has the AES EU (AESU)
> -	bit 7  = set if SEC has the Kasumi EU (KEU)
> -	bit 8  = set if SEC has the CRC EU (CRCU)
> -	bit 11 = set if SEC has the message digest EU extended alg set (MDEU-B)
> -
> -remaining bits are reserved for future SEC EUs.
> -
> -- fsl,descriptor-types-mask : The bitmask representing what descriptors
> -  are available. It's a single 32-bit cell. Descriptor type information
> -  should be encoded following the SEC's Descriptor Header Dword DESC_TYPE
> -  field documentation, i.e. as follows:
> -
> -	bit 0  = set if SEC supports the aesu_ctr_nonsnoop desc. type
> -	bit 1  = set if SEC supports the ipsec_esp descriptor type
> -	bit 2  = set if SEC supports the common_nonsnoop desc. type
> -	bit 3  = set if SEC supports the 802.11i AES ccmp desc. type
> -	bit 4  = set if SEC supports the hmac_snoop_no_afeu desc. type
> -	bit 5  = set if SEC supports the srtp descriptor type
> -	bit 6  = set if SEC supports the non_hmac_snoop_no_afeu desc.type
> -	bit 7  = set if SEC supports the pkeu_assemble descriptor type
> -	bit 8  = set if SEC supports the aesu_key_expand_output desc.type
> -	bit 9  = set if SEC supports the pkeu_ptmul descriptor type
> -	bit 10 = set if SEC supports the common_nonsnoop_afeu desc. type
> -	bit 11 = set if SEC supports the pkeu_ptadd_dbl descriptor type
> -
> -  ..and so on and so forth.
> -
> -Example:
> -
> -	/* MPC8548E */
> -	crypto@30000 {
> -		compatible = "fsl,sec2.1", "fsl,sec2.0";
> -		reg = <0x30000 0x10000>;
> -		interrupts = <29 2>;
> -		interrupt-parent = <&mpic>;
> -		fsl,num-channels = <4>;
> -		fsl,channel-fifo-len = <24>;
> -		fsl,exec-units-mask = <0xfe>;
> -		fsl,descriptor-types-mask = <0x12b0ebf>;
> -	};
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>


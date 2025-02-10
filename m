Return-Path: <linuxppc-dev+bounces-6058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51921A2F916
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 20:43:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsFNV3xygz30Vn;
	Tue, 11 Feb 2025 06:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2614::60f"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739216570;
	cv=fail; b=OY0RTiB9NLnnHWuTtYgz6h+DJvwTTQV14yvwUyzZCMf0ixwHEJ/nRrmJkYHJHoBu1VfSio9VP3wqnDvPcV8oDb+ri1jbsTuYISddjXtJ9YYcSeArPfkwuCyITl8uV8EphTamjo8WFTE+uM3Bg7M2Uv+qGHqXea+zxaH9JRZpQEomQ3OWxi+tXml43MeO8w4j/7bi+VhjMM3qenILq1e2WeolH/tSypGT0RDdW1olejhWgyklfPVQ/Z1CAZKx2cULAKjLdekEtSDeWgr9ef1gRw2AlmtlTbsM4T7n1Mabu8VT3SOY/WBhyXOeE3GS3P5eWjS0SKBVQdW7ZeqA6Inbsg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739216570; c=relaxed/relaxed;
	bh=gwS2IvzYk+agrvg57v5+tnTJieufi17xHSbRYxyHCpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n81kPaAcl3vE2xZSWlp8lHW38bd6ZipTZYWCa0+ZBVILCp/lLQ182u+N8k96GuaMlRLqjHMVwHmMPghTGmAeO9SLzBZ+AcyJhZqiCLNgYoPVrmEdf3Qf9SVpLxJwZmOP3xSYMO2IPSKDd8DhZrRwZDalUOWvGdypAoM7TndvLuEC4wfrSZg3Lfid/HU6FlpTwzoVfbyyAVbCyFGXFsIFHvFiq6Qt4VgXQWwi2rR3WLs2zbwkXFDEOyvwVjBwupZO/MvpNxDk6DPG5na6lTlPnyRs8p+p119WUdMsJpqP56jBWwFjKSstGWmhyYdEgRQ8V6m6ohqS94Fq7A5kdnl4Lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HQ2/sQrm reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60f; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HQ2/sQrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60f; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsFNT3x3yz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 06:42:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6iMQ4I80rh7uCF4tGO7brTR9YJUTelzMCM4SLxYrFj6sh0iO0z3qj+XeSxmhky78li21fhD5LumHUr45H8vBQPObjtiCvpRlt80O8tSl+85QK7qMAvSBOlRvY8K0gQYJYbK2B/GzAlNhjDCVdUA+bSxvTu3TFDaNMA4EhqJg4v9BDnlTYpO9t3+5VrTIpcKuSL5rMdwn3AnoLUECH38o2SkwtuHSGg5mkWDbgE+8McJ9BACBUtY4SltVhgraH//lFjYx3Msaq3shHpL2aFCBwWU4iaQi5hyTOteeAXmnmt1UMsrkdLZqKy6INRI6VMAFlwEKQTZLibuijHY9zbDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udSb9xLINvOJhmnDoW1lxQUMbKH/f0qmzN5/l77ni3s=;
 b=ha9fyI82YGH909dbubsMyUH+f76K9QYLqjL/n7ag/5JQdCzjMUB7mLElRGBgl71LR0LXbElN6vF5mocLDaovUK5Eul+tXn2MDEf/Xk4gzKCtRQ8qP04akoXJXOK3sPGZBB3Kf0Pu/PZr4iqpWRql0MPclOs+G8lZQdEamEJ3ZyPhkfPpw0fioDq3nkhZLOZNOj3vZ341KOhWBQtZ3XhyJawzA8iPBnQKFdjM8ELiw28yk4ONqe87Fj9P1zEyUn867BBFSFmA0MeGSnxxSrFM7nVC/XR1Hedsw2QtWK6usICFvTyDsDJZRgjlW0bSFLxy3diiaAuQPjVRr17xp3RpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udSb9xLINvOJhmnDoW1lxQUMbKH/f0qmzN5/l77ni3s=;
 b=HQ2/sQrm1wOEhOmui1nGtin5GgyC1Kaa+3Pr4QmTSvks1rLKRR016tND3aG2mtyRwQ8qoK7VmSPYmLIoigRhFA2VGs/L7Mm+x/mCANJZTYrxq2O0cBaPAwhftXmARFgrKSnDzyUBfLCQOcUaMRG7tFzoAuVNTQUDzKmkzCP84eXp7UHoCErgqWZLMCI0hhX7/t9pukLdVFNalAVTgglcimuB3P8dq+g2+xS0xmMxtInoNyw6E9G6zNDRZEu0V5pgWoqHR+nj0FPzR8ceu6JGSeHjSgd1bWZDtRMEsOQGv14o9IS5qJjZt7s/3a9yYv6F9qeGVOdhH9O4nM/ajcMdJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 19:42:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:42:30 +0000
Date: Mon, 10 Feb 2025 14:42:17 -0500
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
Subject: Re: [PATCH v2 08/12] dt-bindings: spi: Convert Freescale SPI
 bindings to YAML
Message-ID: <Z6pWmSGmyv9+bG+m@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-8-8137b0c42526@posteo.net>
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a69546-eaa1-474c-f470-08dd4a0b0e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?9yA0vf4Qa0c3AOl48u2ihjiJfevwHEIByngKmCvxiQ1pzOKUKb0FyA5I/V?=
 =?iso-8859-1?Q?tpAm8FDokHvqKB/mekrRZyAIkoqVVo4Hic5Tz9Oqqf1kkx1UnjNj5Iz+B6?=
 =?iso-8859-1?Q?nDD+N511H59Y2M95+1wj2TeDUuGLXQv9r5S229MYIaYGFAV0CpNJfORL1b?=
 =?iso-8859-1?Q?9imm5mcOmUSK9buQnhJ4Pshn6URtbnxnuw0UMz3zGzEfJh0mpkp7ZdyoRK?=
 =?iso-8859-1?Q?EpxiDUS0hYUiPtK5bd6sg4S8GbV22bJi352g7S2REvibn7m15vKAAgOa61?=
 =?iso-8859-1?Q?Aju+zIc7OVviiWl1hENrznxBsN+H+7mxNccihI59KMxBatqMUhB6vDDP9F?=
 =?iso-8859-1?Q?fkBsdqCxF7LPlhGOYETGixrHhljtEjBndF91Ny4SPr3rAegTU9eA5cIDdi?=
 =?iso-8859-1?Q?WRcIEFhhafsma3r2vJz5PSYvGMztXsdyqszttPFJJkTvwYgHy34R5RyWOy?=
 =?iso-8859-1?Q?K6xEU9riYFXSgK3CWBU24pCq8c2OB/sgq/PQjcS7z6yNuiqvU3wnU+idwh?=
 =?iso-8859-1?Q?tzcNykir2MFGSl/v86ta/L8W05lwJf76NkrYnslj/zmeWIZW8UTMuoZpqo?=
 =?iso-8859-1?Q?R8XFM3zx7gsQAZe3jVjwn1evmIz9eq9Y5lOcAKjzRt1xZ/Nk/0+UcdNrGv?=
 =?iso-8859-1?Q?Qk2EifeNUMVHsiYYH+yKw+3awyuQrEUsc8bz44Xd2eCywyi0IFi01OEAns?=
 =?iso-8859-1?Q?AHBeVIAyEBiYv1X2+5uXMtEY+lxKqxGfN4ZOVctcfAIYfG/aRqEciBsyww?=
 =?iso-8859-1?Q?JYDISdEcP5Dw4BUNqEm4Rf6W/85HVlPr/LMvn+MmGBiUJFRdEYPB2TgxFx?=
 =?iso-8859-1?Q?afrce0etvO3+f88bfeZnCvY/qPnZ5EBH1yJM9TcR/cnxzFwMNxyoMHVUA1?=
 =?iso-8859-1?Q?Rg69JQGA1MnKhnAGwUUB17Yv/2iDDr9KxBK3JtmPsBHFtCTfjWdm9zW4M0?=
 =?iso-8859-1?Q?nMEvxRUMLR8YaWr11cvCmqm7EoQyJj7QehYp/0bH8jG1zq7WZRXGn0rZrU?=
 =?iso-8859-1?Q?gOCHScyM38X7liRj8AoNgFLPQe/IeTrRokxTB6Uughm6iMyCRU59ZbDrK+?=
 =?iso-8859-1?Q?Wi3ig0OIyxM/eYBYQmq7fcwhg+I94lyPq+M225AyxQ0sOz1PRukF7g+aFG?=
 =?iso-8859-1?Q?RND4vf6dT6bfuX76l291wOrlt+qjlzPl+QOpy16zW3orTKZ9SrTOudrifM?=
 =?iso-8859-1?Q?lazpGCQ3wIdppxCICoxZo+lt9PJIjKkk2piFcxd7G/XlMQZRI6j7EuRVjb?=
 =?iso-8859-1?Q?0p5IqKz5GO2YoElW7IAR6rpZ5WiO9TGM+iftEbV9JsAzsA6kZ2QUtpbzLU?=
 =?iso-8859-1?Q?An+K4fs0OJF2qdReT5b1xwiGnbe3UINQmEGW//iRDHZTPRlf9rhsx4vQKf?=
 =?iso-8859-1?Q?mrv3sgYRZ5+Hay7LMZvizDt5cs23R6mUQuuPbtfx7TTV5zyqPBCzcXdY/a?=
 =?iso-8859-1?Q?0sdosl+7y4t8ILTB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?KLJ98DmBZgXzoZK+Bh5Dp793Ualmc6JP7pmNoT5zTDeMmqqwBAhyUSPaf4?=
 =?iso-8859-1?Q?XeC7NfoCuaMjBc2x5F/DjRjC/eH2+fwSQ1iD8jyhzN0/+dGCk26LSwf6eC?=
 =?iso-8859-1?Q?po8n6vHyBtUzdvhLke1avxxaSAto7R3D7EanhgK3TmOZlsCxcH/VZItbup?=
 =?iso-8859-1?Q?eilUHyoYfTxqwUZssKSTCq7fNhFgV1xA7rzVEXepY3spjJKpgeFKdNDWVg?=
 =?iso-8859-1?Q?FBqq59TzHvWqSEPa7rBkfTeXVwzXkg4pgQm/g4mzcQ+fOt+rZB//HslPsa?=
 =?iso-8859-1?Q?mEri+fkicKi84th4zy8ZdWoDGMkJhlivmila5XlVmXxncsxA2NOzQgLd/a?=
 =?iso-8859-1?Q?7TCgVOl+BY4hHNub5BjpoBO67x8jaFtcpU/HhcsF3uRZu1o63xS7HIxHek?=
 =?iso-8859-1?Q?qYnlvnwuRlYzbI9NHTGYivztPbadO8+NJTsVoaOWkiFXPdswwZblr4GMpd?=
 =?iso-8859-1?Q?S3kabct7aF3k62HAQKLnmRIndhvMP4GvG1B4K/DuR4A7pdbmpTdsqnrTFp?=
 =?iso-8859-1?Q?eM4bkWm7OPq2wDYNFfEYRb/xuV/O7AIaZ+aQs/Ek4tw/x8adZtPGAlEUzM?=
 =?iso-8859-1?Q?cavI1p2i7Y98D7D+KmXYniEyBhVV973d0Vz04w2HVr5GlE+ueiZzEPolPW?=
 =?iso-8859-1?Q?CnOTcQwsl53bQGEJOYYXicwrqeoNWgExKFxQczMEJYolM/UKwJWcvWSfin?=
 =?iso-8859-1?Q?fRMb1wEsiCpS0tCcL3hSsrMUTQSQ8h702JoHGLsWr2idKObAauWp3Hog07?=
 =?iso-8859-1?Q?ISCu4r12R0M6/k2KByHtv6MgcklFKFghg+nkajrc0OOqiYLAUcUqnHJcym?=
 =?iso-8859-1?Q?5DcQsCa5twej3ymjYWKhQhqoc8OES/xnPHBbUefQYEn8euuj4jdB1ykVw1?=
 =?iso-8859-1?Q?sm7A75rVgWySpwixUzGbJZ0nQ9EJtWeuNb17DAIv13/NkZQO8C6MJDOUKa?=
 =?iso-8859-1?Q?BVibvx0Xb/ADeg/SBcntbF8bX9PB4hM4BS+l6GU8bhpOti8HQlMvQ+H0WS?=
 =?iso-8859-1?Q?f0kSqgtOscYEweHsrp+iGhxMbkPA0tBZ5yL+1sWBgvFiQqy/fD7zYebv9f?=
 =?iso-8859-1?Q?gy0qMs33ed6gWY6Afd46IbWCVkMgc9jqMqEyJ+q9o1alWRoFNb79x6iA/p?=
 =?iso-8859-1?Q?PDKwfIITfYNV4r+G+9uFY1rZc7IF9ZVh19upPElSIeTFf49u2rjQzELIB4?=
 =?iso-8859-1?Q?Ko9GEb3tDF1ebzvgb5qlknVK9okOHM898sNnZaMiuQEn6qDM1G5sCo8iuN?=
 =?iso-8859-1?Q?zCZzkFSOu8i7P3byms4l0qL4yc+pJHNhBBJ9gwRqOsnxhTa6D9f6CCoe9P?=
 =?iso-8859-1?Q?mCeqzBqSq5NTuYQv6970djrn4jzfhWOvIIgDDgNBIFCxJpt6/YbRT4NlUj?=
 =?iso-8859-1?Q?/gxbso3UWGT4K0Nd65zo81611MNe9uRJzKA6TB88xNU4emH+1ReK1bElEU?=
 =?iso-8859-1?Q?iBdBVhDOtC+PLv51rVhv90nYeNG26MY+esR1S4vstdUaagf4Y4QUPwyH5w?=
 =?iso-8859-1?Q?E882GKThg1uWRDyRCeR5anSrrRRS3cxBvvYDappEKlrbGSuFLnscbwO+M2?=
 =?iso-8859-1?Q?faOQGhSNm1ZxdFHyjWzfs5Tau+zyqg2tSqxr/VwJIOChtGZ3afuRX8drbz?=
 =?iso-8859-1?Q?1X3o94NdRsBDTomVj/VHKCfGWIsZnav3wj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a69546-eaa1-474c-f470-08dd4a0b0e9a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:42:30.9048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qclN3jmrPcOO+vHarLyblmCzb7LhmIovYLe/KHkANJGyAbiSRjkZC0nf9f2poJCOpK1Euyj70COZBVVWWl4Hdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 10:30:25PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
>
> fsl-spi.txt contains the bindings for the fsl,spi and fsl,espi
> contollers. Convert them to YAML.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>
> V2:
> - add missing end-of-document ("...") markers
> - add missing constraints to interrupts, fsl,espi-num-chipselects,
>   fsl,csbef and fsl,csaft properties
> - remove unnecessary type from clock-frequency property
> - fix property order to comply with dts coding style
> ---
>  .../devicetree/bindings/spi/fsl,espi.yaml          | 64 +++++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl,spi.yaml | 73 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/spi/fsl-spi.txt  | 62 ------------------
>  3 files changed, 137 insertions(+), 62 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/fsl,espi.yaml b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..c504b7957dde39086ef7d7a7550d6169cf5ec407
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,espi.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,espi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale eSPI (Enhanced Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,mpc8536-espi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,espi-num-chipselects:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 4 ]
> +    description: The number of the chipselect signals.
> +
> +  fsl,csbef:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select assertion time in bits before frame starts
> +
> +  fsl,csaft:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Chip select negation time in bits after frame ends
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - fsl,espi-num-chipselects
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@110000 {
> +        compatible = "fsl,mpc8536-espi";
> +        reg = <0x110000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <53 0x2>;

Use predefine's irq type macro.

> +        interrupt-parent = <&mpic>;
> +        fsl,espi-num-chipselects = <4>;
> +        fsl,csbef = <1>;
> +        fsl,csaft = <1>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..db65c0560c32f32324a2aaaf53c0044a4b56f3d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/fsl,spi.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/fsl,spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SPI (Serial Peripheral Interface) controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,spi
> +      - aeroflexgaisler,spictrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      QE SPI subblock index.
> +      0: QE subblock SPI1
> +      1: QE subblock SPI2
> +
> +  mode:
> +    description: SPI operation mode
> +    enum:
> +      - cpu
> +      - cpu-qe
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-frequency:
> +    description: input clock frequency to non FSL_SOC cores
> +
> +  cs-gpios: true
> +
> +  fsl,spisel_boot:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      For the MPC8306 and MPC8309, specifies that the SPISEL_BOOT signal is used
> +      as chip select for a slave device. Use reg = <number of gpios> in the
> +      corresponding child node, i.e. 0 if the cs-gpios property is not present.
> +
> +required:
> +  - compatible
> +  - reg
> +  - mode
> +  - interrupts
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@4c0 {
> +        compatible = "fsl,spi";
> +        reg = <0x4c0 0x40>;
> +        cell-index = <0>;
> +        interrupts = <82 0>;
> +        interrupt-parent = <&intc>;
> +        mode = "cpu";
> +        cs-gpios = <&gpio 18 1          // device reg=<0>
> +                    &gpio 19 1>;        // device reg=<1>


use predefine gpio level macro

Frank

> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/spi/fsl-spi.txt b/Documentation/devicetree/bindings/spi/fsl-spi.txt
> deleted file mode 100644
> index 0654380eb7515d8bda80eea1486e77b939ac38d8..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/spi/fsl-spi.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -* SPI (Serial Peripheral Interface)
> -
> -Required properties:
> -- cell-index : QE SPI subblock index.
> -		0: QE subblock SPI1
> -		1: QE subblock SPI2
> -- compatible : should be "fsl,spi" or "aeroflexgaisler,spictrl".
> -- mode : the SPI operation mode, it can be "cpu" or "cpu-qe".
> -- reg : Offset and length of the register set for the device
> -- interrupts : <a b> where a is the interrupt number and b is a
> -  field that represents an encoding of the sense and level
> -  information for the interrupt.  This should be encoded based on
> -  the information in section 2) depending on the type of interrupt
> -  controller you have.
> -- clock-frequency : input clock frequency to non FSL_SOC cores
> -
> -Optional properties:
> -- cs-gpios : specifies the gpio pins to be used for chipselects.
> -  The gpios will be referred to as reg = <index> in the SPI child nodes.
> -  If unspecified, a single SPI device without a chip select can be used.
> -- fsl,spisel_boot : for the MPC8306 and MPC8309, specifies that the
> -  SPISEL_BOOT signal is used as chip select for a slave device. Use
> -  reg = <number of gpios> in the corresponding child node, i.e. 0 if
> -  the cs-gpios property is not present.
> -
> -Example:
> -	spi@4c0 {
> -		cell-index = <0>;
> -		compatible = "fsl,spi";
> -		reg = <4c0 40>;
> -		interrupts = <82 0>;
> -		interrupt-parent = <700>;
> -		mode = "cpu";
> -		cs-gpios = <&gpio 18 1		// device reg=<0>
> -			    &gpio 19 1>;	// device reg=<1>
> -	};
> -
> -
> -* eSPI (Enhanced Serial Peripheral Interface)
> -
> -Required properties:
> -- compatible : should be "fsl,mpc8536-espi".
> -- reg : Offset and length of the register set for the device.
> -- interrupts : should contain eSPI interrupt, the device has one interrupt.
> -- fsl,espi-num-chipselects : the number of the chipselect signals.
> -
> -Optional properties:
> -- fsl,csbef: chip select assertion time in bits before frame starts
> -- fsl,csaft: chip select negation time in bits after frame ends
> -
> -Example:
> -	spi@110000 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "fsl,mpc8536-espi";
> -		reg = <0x110000 0x1000>;
> -		interrupts = <53 0x2>;
> -		interrupt-parent = <&mpic>;
> -		fsl,espi-num-chipselects = <4>;
> -		fsl,csbef = <1>;
> -		fsl,csaft = <1>;
> -	};
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>


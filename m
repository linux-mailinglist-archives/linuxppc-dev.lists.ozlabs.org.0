Return-Path: <linuxppc-dev+bounces-5700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF505A226AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:01:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjyMT3hxlz30T7;
	Thu, 30 Jan 2025 10:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c200::1"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738191701;
	cv=fail; b=G+wqyhfH58cZ57yEH1JpXacdLC2Tt9iC/6bZSBsBlF0uaobeYYnJx8Lgxte1jAfoKEwIjXrgVuWXrxxWCHfm+vi5vJ2acDCT4b+XHR6qoW5djG/70Algd3tzElf7ImVFp9jXSfE1FD1rdL/yzg3qAKlO60+T0trGiZAOOcusUhw4Dh5fNz/aaWH0P8teBwIZsGJmLVo4cGe8BcdZIZd2UcSZ5ooxidK9RGSMCmmxlCSQSoVo0MxUC5RCfmsSXf6i1t79T1j/9Z/xtMKS74j4Y4lkcvqfWw+FMbELll0zxMym1+sGc/psCw7goMRWotUrCwC152Q4GVs8KA55vxnZFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738191701; c=relaxed/relaxed;
	bh=+Vc82gKErsGURPiWCiSaGVc0Zn4mFL66OmjpfsswMGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h+u6sR7zLGu/Dpn0K/vOymYo0tdLzue9k37q4PL1mkZiz297dajau4AwM1gfw2aqmHuW0foNDr0D56CYxfSGHRSc3dNBR1Q3db1hmOY5+aHuyfqjiXIF94acGIOpkOFey8LgXL2edAfcpAciRhJ7VoR9ApH2by/obMKblbCCPZM0dlCZ4aa5gJNC0YhsUzYpos+j+qHYmS8KQL2mCN7gXSrf0yZogk6LxXXkjjj743aXWz/JFvl88CD07O6PNiWqKsNjV7jrYTUBqPj3fAw73PrG5fo+uG8GQTG+qSTu6vhCwkFYNrD3+VQDrzQw75Tb0SAsG6bxzdVannipqmIfQg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=j/e744Ck reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=j/e744Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjyMS3b9Bz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:01:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXxtLO9iZhyTSy8rRiwgH5C4f/b133nzqH/dW/P+gJX2LfnzI/USQo/3d0y5wCmmK83nazyz8cAaaGyX4lHSJIBhhfNauobHH/FfxYFLD9t/YTfpjV+gfs+uIeRgWQm4GLq9VGZYLuYNUpgwmBzMpiOUnCRrbXkza4s+Me+ZvaeMpM+A3HEINKqU2eRrxst+xLFyzFlZR7g0UBshFqlbqV37Kl0cjIZKuK8src2j0a3Dy7w1Ie9R9y0AB2919akg/B8rvB/SUG3z10TVBxSoYr+Aus4OIap/By/2hx7O7PUUiNsVWguH8HKuS7A9Lb0AlDXk6dg5yrFl9Kg7gmYSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mnlv02ltVw7vj+Ss34rESF2skOwjKY0pJO7z/NOdIqU=;
 b=qn2cS2JbGLbKWcPubmfbTloxZZRtHRJUOh8xfFkBZr0WSnH+Cd2ppfNeeViz5SY6+zKKmdvbK1StGwGNQN1C9sVcmaGke29P6JzpLkFLuemdpOAZNDT56fktBLpuHcLebH1s6MfasNGZIjcQL4tCwoxUuUQtv2I3+1k2XbtcFaWmFVNMtK4wy2v6dQJOcu05kv3Bw/hH8q3ILOpYYVXoN6h1LFqz47eJGk2k7Rou5JsocGuw1JRKIg+zdbnlZDjE298HctHaVo9QyUFmyaMArvbl6mRK7G4ZXoub+7+IwF6objOYG8kx5+ugSbcwQwQgcGRKWUuBfMCNoVuhGger1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mnlv02ltVw7vj+Ss34rESF2skOwjKY0pJO7z/NOdIqU=;
 b=j/e744CkMHrqdfLEF2Ik3JDjN+TqqKf5RYvqXme1PZm5BKCnfyAgh0efhlDHggRYbf3q9QaDK35y8GN4RFF8xbNekOpFI7jdpAIed2L1GY6CxEIBB4MjpkAWIDg/vaBXc7aNOc2JWzChWXDdIPMdgfL3dqCHHmjXi258ITj8qFT+1UDJTAG8K0W/pDw9EPS8vsHeYvCQ7tbJQ4qZNRgJNKWBT4DOgIsgbPXl+4KXT8JF6j6YO2uxPj+7iDJtwhzZ4EK7zqySl/NdaIq9aSd/Hni3GfbT0tA1+h4Vl1VE2L5p4BlcZ2yH5E143pRD1wMC5weB+u7pvSxuaVw4reTP5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8460.eurprd04.prod.outlook.com (2603:10a6:102:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 23:01:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 23:01:17 +0000
Date: Wed, 29 Jan 2025 18:01:04 -0500
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
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <Z5qzMH1t7jIr39Ce@lizhi-Precision-Tower-5810>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 294dedf3-b785-4585-ea02-08dd40b8d679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|13003099007|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?SSW3+NRyFthOTvKFFpXiNYU3v48p1UdYP013tXA6xH4dby/yKxdirN7NBd?=
 =?iso-8859-1?Q?kurjruuWDQpC+EkPR7lSrl+PUUZF7Omwv4FM6Jbn95KMeLjLzTo4Wshgwp?=
 =?iso-8859-1?Q?puVGcqgf4a0UDNFIqHLA43n3HR+oyF4XCyMteOO/G7MjE2FDwWKDaL/4W9?=
 =?iso-8859-1?Q?srf66OAwoBzLLQmhdGGmgnF6JIM0NaK+hcsLWyWWIqNKdqNTDU2JPBwSJl?=
 =?iso-8859-1?Q?ri2k5bOC2jzsg9OOsm6fN5pJiM4C5aWlGLcsUhjSGWvAj/PRe4nttZnB/o?=
 =?iso-8859-1?Q?CsfZnCxaTpKOuZSeDhluaN5AqnjVr6fW10N4Yqxu4lsMWtTuW+r06x51lw?=
 =?iso-8859-1?Q?nhSj+9JVeCtuGUpXGLhSL53IptKCcvygk+EwJ5ZcEbs/IEYVxi1YzfdJ9c?=
 =?iso-8859-1?Q?B/AMINZfoNPE7eiVyQKNGGL6DhxCPasaPeDC+hKWyKLQbJjeJLbh6L8uiP?=
 =?iso-8859-1?Q?m+GuEtwv+xueOd+vWVpNBmp+OoQLSAuSjUG3o0JutdGwQqlKcyu72wZmbG?=
 =?iso-8859-1?Q?ZriVc96Mh5sSewMp8tedOrh+o/SeMxZCiDQSWSjgAUUQ4zX78clUHJ+MlY?=
 =?iso-8859-1?Q?SjMtQ+ODM9nTleZtmV2A9Pb865oQRIzZDgCEzW46IYz+egd67Yk6FgJwmG?=
 =?iso-8859-1?Q?5tcsct6cZZGmP59wmNPEDC3e0a2T1ZjdGdo/xAUaO14BhF27arYmDEMDQC?=
 =?iso-8859-1?Q?9Jzw0tSuFBw/qaplFSV5Ie9S3odq0ll0wpDf4+Nb+sg6TWGAWOm0ooie3B?=
 =?iso-8859-1?Q?jXsPR/5NzaRdxVQDaNpW4L5VQKl3cjd7w1mtuFLhQYHzxcCaMQ9uBJWueU?=
 =?iso-8859-1?Q?y2T/Yz0oNTh/0AVBf8wbJ4JJ+CNDgesaEOUd4mp0kUVgg41dt4JTeWAAzL?=
 =?iso-8859-1?Q?06FJlTibe6/aoziFLxjPw84GfZXbCm//M7f4Z1yBm8AucJdt7ePUkJsG1k?=
 =?iso-8859-1?Q?UscCqEviUqtnmP68FNvSt3xo9Ff7op6A3GUNd4ZXHZw5nKaeZxmVZYiSVt?=
 =?iso-8859-1?Q?SKbc27HOI/mF2aSb0wQhtR2OUbatHQj1gll4QsQfIxCCOvXktryww/6wzs?=
 =?iso-8859-1?Q?LMVko2qM5tQHs0BXYOriYaQZ+jxwNJxqmtTO8inNteN7w0a7cieiNj1HcO?=
 =?iso-8859-1?Q?EZrOrJbDX078tMVH6ca0lIi2HulISNnp+5w+A4k0KXKeH9GoWzlFD6sUqf?=
 =?iso-8859-1?Q?kwHr7cOH+atG8SrtRPeogq0lJA0Ue7qb+Vz6aMy/6Zqxt9+KHZB2JA8O0Y?=
 =?iso-8859-1?Q?1B3cV4T78N+Lzy2+d8VRxVYkqk+JT53dwaZFpLArplWXTK9Z80EItKF+Au?=
 =?iso-8859-1?Q?QkOftUMTlVEbFJ+XAOvN1EeODHt1LIC2/XC1PUKSQ7lNVkxtgSY16meCNn?=
 =?iso-8859-1?Q?kx7xG8YNmukWMp3K//gRQyLgQ1IlKGZCxv4/fEhaPGwgiCxS4bu/xnZ2ya?=
 =?iso-8859-1?Q?Q6krTfl/rhd0RSnt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(13003099007)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?dQ516XRxVxTPXI9uVMNcn15HSlfbQ7/k9iV3Xj8enZX0wBWvx7qQkXI4oM?=
 =?iso-8859-1?Q?+Qo3hk2OK1tPVI0M3IPitgSASDC8LmnD55FAztdC+imgej5t+bCVtGgH5o?=
 =?iso-8859-1?Q?2HgSxCVTdwtTl3E74+dkULeMlu78S7pGoAhEwRQQq7pqwP4BgOPEqa86Mx?=
 =?iso-8859-1?Q?HNrBYw9kK87iy0hWXmOU3KKVNylF4yJKo2kkrytc0obBATiQApCkL5VBYE?=
 =?iso-8859-1?Q?RxmRNN2GXuSrtNNSqdvuc0SwsILjOJ4qEVr+0bf+eUaKTgxTbhpM5yXa3E?=
 =?iso-8859-1?Q?zE2hHjRv7K6R8huWPhpaqPqLhs1fCOiHKTQOS8WuTIfPgxHFQbxZRv/9Dk?=
 =?iso-8859-1?Q?IpniIIXglAIXQt/FlClmloER+k6MPcQLTJA1/478vmPv+AvetVsWCwXx6z?=
 =?iso-8859-1?Q?wgS/gOxKnV0MxsLMdie6q75wd30Ew27oMVnWWzUCEtZYBUxSyHUX0EqUY7?=
 =?iso-8859-1?Q?5frWrFkSXJf77ENtdJSOm8NSxc51a9KLp7z97OfK5L4DmxrG9wVyAbeBRP?=
 =?iso-8859-1?Q?hSsapTpyJgamRf76qZP8USpjhBJnSCgZSO15JnGlI6Lscq1x7HmdNhfV+p?=
 =?iso-8859-1?Q?wF/mi0j3Yi6QwjtXj60Fg8niAgQ8f2eD47kZRYY5yyTVHZtx04Ti4JOPSd?=
 =?iso-8859-1?Q?V9VYiEFZoi+BVznpXJPf83HhQK4MZr1pi3hnWWsoqvBVECs9ZmG5zNV0ve?=
 =?iso-8859-1?Q?9G/P/v3ANdXlNwdYADA9M4O+nF2jgCL130euyz6s0c8nwN4VDgazwwD/cw?=
 =?iso-8859-1?Q?gkjvFwJgur30J/yDtCahxQnw8W7wLqkR8rwCUVhommNZK7U8H9040KkT9B?=
 =?iso-8859-1?Q?b7y2nLkCwqwENdHYECwpeAQ9XbKbl/MuIVkFRH9fRj0YO/z4X+gkr777O3?=
 =?iso-8859-1?Q?5rEVxuhVyZ46z3MFNiIcBX/vtSVltOx7V/EGHbd+5uEmtlHQJNp3un5yqh?=
 =?iso-8859-1?Q?sfKWV8j33w5V+Pa6I4CYp1bdUd/3koZ+wnJ8aL4KBHxfhWI9GW2UGEMT8/?=
 =?iso-8859-1?Q?dSyoArHU7Q7PoEfcp4BprMW5IwFSom6372V7l27gDHCb246I9b1/WM6P/v?=
 =?iso-8859-1?Q?tU64a45Ysr8dqJepg8PcjO2cTSdSPCehHwBeQbJ2WG1+gDsvg6HdOK+C6J?=
 =?iso-8859-1?Q?oqt20DkGV817pWt3iGpuGbmnOr8UEwLLwm4W4cj87MSuRUfE2xPSJERI/i?=
 =?iso-8859-1?Q?5Xi3HSXrTkK7jVWcHVL97mdgCOASIsmQJfoiRR53D+kxktA1EQI0XS1iAA?=
 =?iso-8859-1?Q?v586W6khYc1TrMi5L61I2/EKGTGtjcJIEsx4NqcOU3x2hIK940aJfyCS7C?=
 =?iso-8859-1?Q?9GBFLZdV7uvRpDDtXeyiHhlVPIgIQKmkSYXbB3Y5nuQwL/0ZuvX1HboQXK?=
 =?iso-8859-1?Q?ndKnc/l4PfQlDZlMDoeyYDmkWpxEfHApAbQqFgTWNpDyEYB5ZowQue4gfE?=
 =?iso-8859-1?Q?MfkIrAsm8h6Eb1wbOAho5rSFoxrERaCaa6OopSA97GyxjjU2N0f5Yp5ThT?=
 =?iso-8859-1?Q?fSLbAspF+/1QApH9O8KKtL47xr8ky4eHRXQB9LwjY2dQ/7HYiztO9BUBkg?=
 =?iso-8859-1?Q?l6vtkX1ZLoXmUPmFls9PltIrEA0Smi1MO45W73IvRlNO49xl2cPLYbdSGA?=
 =?iso-8859-1?Q?A6KhJaOFP3TeSI6VctPCC2zoalX8KWfWKy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294dedf3-b785-4585-ea02-08dd40b8d679
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 23:01:17.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VCo8AqTtOIxE6d9WEi8hPrlMaa2JdgSuhz7BNiwKl22V2I+iYeNpPYeePcOcXKHyue7wo6GLPUB4i4GcLL85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8460
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 26, 2025 at 07:59:04PM +0100, J. Neuschäfer wrote:
> Convert the Freescale localbus controller bindings from text form to
> YAML. The list of compatible strings reflects current usage.
>
> Changes compared to the txt version:
>  - removed the board-control (fsl,mpc8272ads-bcsr) node because it only
>    appears in this example and nowhere else
>  - added a new example with NAND flash
>
> Remaining issues:
>  - The localbus is not really a simple-bus: Unit addresses are not simply
>    addresses on a memory bus. Instead, they have a format: The first cell
>    is a chip select number, the remaining one or two cells are bus
>    addresses.
>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml |  61 +++++++++
>  .../bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml    |  55 ++++++++
>  .../devicetree/bindings/powerpc/fsl/fsl,elbc.yaml  | 150 +++++++++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/lbc.txt        |  43 ------
>  4 files changed, 266 insertions(+), 43 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..127f164443972bbaf50fd9daa80c504577ddd7bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAND flash attached to Freescale eLBC
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +allOf:
> +  - $ref: nand-chip.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-fcm-nand
> +              - fsl,mpc8315-fcm-nand
> +              - fsl,mpc8377-fcm-nand
> +              - fsl,mpc8378-fcm-nand
> +              - fsl,mpc8379-fcm-nand
> +              - fsl,mpc8536-fcm-nand
> +              - fsl,mpc8569-fcm-nand
> +              - fsl,mpc8572-fcm-nand
> +              - fsl,p1020-fcm-nand
> +              - fsl,p1021-fcm-nand
> +              - fsl,p1025-fcm-nand
> +              - fsl,p2020-fcm-nand
> +          - const: fsl,elbc-fcm-nand
> +      - const: fsl,elbc-fcm-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells": true

should limit to a number set like

	- const: 2
> +
> +  "#size-cells": true

the same as #address-cells.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        nand@1,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg = <0x1 0x0 0x2000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..60f849b79c11a4060f2fa4ab163f9fa9317df130
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc-gpcm-uio.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc-gpcm-uio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Userspace I/O interface for Freescale eLBC devices
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,elbc-gpcm-uio
> +
> +  reg:
> +    maxItems: 1
> +
> +  elbc-gpcm-br:
> +    description: Base Register (BR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  elbc-gpcm-or:
> +    description: Option Register (OR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  device_type: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  uio_name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - elbc-gpcm-br
> +  - elbc-gpcm-or
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6bbceb82c77826499abe85879e9189b18d396eea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/fsl,elbc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/powerpc/fsl/fsl,elbc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Enhanced Local Bus Controller
> +
> +maintainers:
> +  - J. Neuschäfer <j.ne@posteo.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^localbus@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,mpc8313-elbc
> +              - fsl,mpc8315-elbc
> +              - fsl,mpc8377-elbc
> +              - fsl,mpc8378-elbc
> +              - fsl,mpc8379-elbc
> +              - fsl,mpc8536-elbc
> +              - fsl,mpc8569-elbc
> +              - fsl,mpc8572-elbc
> +              - fsl,p1020-elbc
> +              - fsl,p1021-elbc
> +              - fsl,p1023-elbc
> +              - fsl,p2020-elbc
> +              - fsl,p2041-elbc
> +              - fsl,p3041-elbc
> +              - fsl,p4080-elbc
> +              - fsl,p5020-elbc
> +              - fsl,p5040-elbc
> +          - const: fsl,elbc
> +          - const: simple-bus
> +
> +      - items:
> +          - const: fsl,mpc8272-localbus
> +          - const: fsl,pq2-localbus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8247-localbus
> +              - fsl,mpc8248-localbus
> +              - fsl,mpc8360-localbus
> +          - const: fsl,pq2pro-localbus
> +          - const: simple-bus
> +
> +      - items:
> +          - enum:
> +              - fsl,mpc8540-localbus
> +              - fsl,mpc8544-lbc
> +              - fsl,mpc8544-localbus
> +              - fsl,mpc8548-lbc
> +              - fsl,mpc8548-localbus
> +              - fsl,mpc8560-localbus
> +              - fsl,mpc8568-localbus
> +          - const: fsl,pq3-localbus
> +          - const: simple-bus
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [2, 3]
> +    description: |
> +      The first cell is the chipselect number, and the remaining cells are the
> +      offset into the chipselect.
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +    description: |
> +      Either one or two, depending on how large each chipselect can be.
> +
> +  ranges:
> +    description: |
> +      Each range corresponds to a single chipselect, and covers the entire
> +      access window as configured.
> +
> +patternProperties:
> +  "^.*@.*$":
> +    type: object
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus@f0010100 {
> +        compatible = "fsl,mpc8272-localbus",
> +                     "fsl,pq2-localbus";
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        reg = <0xf0010100 0x40>;
> +
> +        ranges = <0x0 0x0 0xfe000000 0x02000000
> +                  0x1 0x0 0xf4500000 0x00008000
> +                  0x2 0x0 0xfd810000 0x00010000>;
> +
> +        flash@0,0 {
> +            compatible = "jedec-flash";
> +            reg = <0x0 0x0 0x2000000>;
> +            bank-width = <4>;
> +            device-width = <1>;
> +        };
> +
> +        simple-periph@2,0 {
> +            compatible = "fsl,elbc-gpcm-uio";
> +            reg = <0x2 0x0 0x10000>;
> +            elbc-gpcm-br = <0xfd810800>;
> +            elbc-gpcm-or = <0xffff09f7>;
> +        };
> +    };
> +
> +  - |
> +    localbus@e0005000 {
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +        compatible = "fsl,mpc8315-elbc", "fsl,elbc", "simple-bus";
> +        reg = <0xe0005000 0x1000>;
> +        interrupts = <77 0x8>;
> +        interrupt-parent = <&ipic>;
> +
> +        ranges = <0x0 0x0 0xfe000000 0x00800000
> +                  0x1 0x0 0xe0600000 0x00002000
> +                  0x2 0x0 0xf0000000 0x00020000
> +                  0x3 0x0 0xfa000000 0x00008000>;
> +
> +        flash@0,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "cfi-flash";
> +            reg = <0x0 0x0 0x800000>;
> +            bank-width = <2>;
> +            device-width = <1>;
> +        };
> +
> +        nand@1,0 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "fsl,mpc8315-fcm-nand",
> +                         "fsl,elbc-fcm-nand";
> +            reg = <0x1 0x0 0x2000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt b/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
> deleted file mode 100644
> index 1c80fcedebb52049721fbd61c4dd4c57133bd47c..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -* Chipselect/Local Bus
> -
> -Properties:
> -- name : Should be localbus
> -- #address-cells : Should be either two or three.  The first cell is the
> -                   chipselect number, and the remaining cells are the
> -                   offset into the chipselect.
> -- #size-cells : Either one or two, depending on how large each chipselect
> -                can be.
> -- ranges : Each range corresponds to a single chipselect, and cover
> -           the entire access window as configured.
> -
> -Example:
> -	localbus@f0010100 {
> -		compatible = "fsl,mpc8272-localbus",
> -			   "fsl,pq2-localbus";
> -		#address-cells = <2>;
> -		#size-cells = <1>;
> -		reg = <0xf0010100 0x40>;
> -
> -		ranges = <0x0 0x0 0xfe000000 0x02000000
> -			  0x1 0x0 0xf4500000 0x00008000
> -			  0x2 0x0 0xfd810000 0x00010000>;
> -
> -		flash@0,0 {
> -			compatible = "jedec-flash";
> -			reg = <0x0 0x0 0x2000000>;
> -			bank-width = <4>;
> -			device-width = <1>;
> -		};
> -
> -		board-control@1,0 {
> -			reg = <0x1 0x0 0x20>;
> -			compatible = "fsl,mpc8272ads-bcsr";
> -		};
> -
> -		simple-periph@2,0 {
> -			compatible = "fsl,elbc-gpcm-uio";
> -			reg = <0x2 0x0 0x10000>;
> -			elbc-gpcm-br = <0xfd810800>;
> -			elbc-gpcm-or = <0xffff09f7>;
> -		};
> -	};
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>


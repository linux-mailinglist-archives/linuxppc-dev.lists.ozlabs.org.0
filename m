Return-Path: <linuxppc-dev+bounces-4677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE9A01D4A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 03:19:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRHtx2rwTz2yGY;
	Mon,  6 Jan 2025 13:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736129977;
	cv=pass; b=FKrv3ViUMIN2TvtG0gp88ZNSnB1CWMubTmhgHPjBhryy5RfLNvnBp3rtd18FczBiMc9ftnrNr2lep6lwxfGHAKeRLF6ljbZ3hQkIyV41uWUrZpLLV0ZG4WIJtnAULgSeMcPe8Zi1AleFxcanzdfNd/vYJo1BvJ+PdX7CMJ7WIR4T9eCXY5Y4tSjoQngf2pV0Mn0eBDSbWPrF44h5hjl2WWwKXTacfjyz7HepjpOlEVb9tqEDrRIKwdcVL2KdjbSbVOSLbZgirHTivbLe1Z+8yGnh2ouCCRxemFpemNzNQHZUVBk/FsE/0Oor8+o4jEMQcfopL7GO6FQ41CMtB3DUNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736129977; c=relaxed/relaxed;
	bh=r44BQ4A4x63V0/itwoiDFTeWVR0qqDMnO+p4SqveV5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HWY46IATtzor2YcS5UA0/Vkf6us4fFEnyIMsIRR4p3jUeDrF+kqXRXXYs8EwSaH3D0ZgnyGHOOHIFTvBH/4aK112CTbtkWU9jU6qFn6UUUsHab8mYI6G20GYPOwlb8RRqfLyAvGNTL5mX/vLn4P+g7SC+dZX0IcXfEz/AOZ+vBfQPrhPMZJps7FNwRmeKPU4NVKsYuIc3GqQ1QQZKldE2t2OiJIq6N6jPUcm1bUaVEtE73Lk+DGQ5lnMUdsorYDlZWffJRMHv1xN8q5JVHpoIlkOp/FSMVpB4gmfEb01OHGT6eHrZfryrjnSa2k5I6Z0WAvYP/lW2L99wePxCg2LYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QJpDvDZF; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::617; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QJpDvDZF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::617; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRHtw03g7z2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 13:19:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNSv61Ifh1jKq8jIpXUfN+AsqM3QLfJo4dQ1N6DqDxWJ+wCy7PbSyV4QetBIvy/juEI+1b2lPXFylh07oRTYjKNMQOTNYX7cke0EEzDlwWnoR8ZoBdn7L8L6jic1K/1Sd/KNfTJ8+Ku6kiiNqiowdSHJ8M+itV2eFfrr5kQZ+LMWHiIqqW6likGlT6HsImrQib4AohyjWgzVV9x+IrX7MNQVXaK/TW/4OFVPQlvhWt/eMwngR5fJjNUuuNXRnA/c3leTbOlnkiwRgAR2NT60BmRuxw5vYqbYm+ACAm97mU9WHN09osn0HZ9hMlxqOY0Q54eBv6iYJgUauECE6d5Chw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r44BQ4A4x63V0/itwoiDFTeWVR0qqDMnO+p4SqveV5Y=;
 b=lMAiI+QqeFSdlyK+k6zI/UQgsySHq/YeN3hMHA/u+Pd5BX+39oxXJxa7LLY1CPG6WhtWWHAntQqWB+sNC/L2zWYOwL6/ErmqbO+rYiVrE83J1BQwN0NBCl9TBKWyJU2E0+Vx3ODWRz/lyo+21/WJuDT/P/jLJCDsSXEVVj+Qf/S44F+rhyNDEuWcO3OLsG8rKQ4WLWGLoixVc5rCtN/7ZjJYmlMQTmAXIX4KQQByBef2+ZF5ryY/plyytGuhGlh1JpKCUlmQ/vZZT/kF/JHEhJ04TKe25u6RhG/HWMOUzYADAXMnTCJymnL3+RSZoB+uov2oE5Z3vxi1JqQSAkGqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r44BQ4A4x63V0/itwoiDFTeWVR0qqDMnO+p4SqveV5Y=;
 b=QJpDvDZFruyfFa+1lyIrGJR24rj/Bb1Au+CocxxFOWI5rjjMt3J/MCvoJ1P6n/yZ1ZvbsdIFyzxYpTkADiwkPW3gBcadcrt+3iagVS0SPNMJBCtfmyl5FOs+QbH0lUxsFl1gK9ke3sBwtrdbVK4PSLFhpNnV+AZ7ZIeGzlnI+nokbAbRoMVYit+U8ZW83YVUms5spFHxhi2iDdP+hw43YL0mLVPvD8OENa4iv6OoK/edPHYXdvW3bfWbwglTpt8dtAdY+wsJSNwQJAkfvBT1TdlntFouxxZvZvasv+aUCk2+JNk+kxXmJhYKw9iuzW8qjkG6/IOeUtIe7DF0NR62uQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 02:19:07 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:19:06 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 05/13] net: enetc: add debugfs interface to dump
 MAC filter
Thread-Topic: [PATCH net-next 05/13] net: enetc: add debugfs interface to dump
 MAC filter
Thread-Index: AQHbXaf8wsu7OhVxNE6rUk/X61GqHrMFPNAAgAPDL4A=
Date: Mon, 6 Jan 2025 02:19:06 +0000
Message-ID:
 <PAXPR04MB8510C38BC40EB0E6D95F726888102@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-6-wei.fang@nxp.com>
 <696fb436-40f6-4a9c-af0b-2851f8450bd1@lunn.ch>
In-Reply-To: <696fb436-40f6-4a9c-af0b-2851f8450bd1@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DBAPR04MB7269:EE_
x-ms-office365-filtering-correlation-id: 605b17cc-aca5-4140-a8a3-08dd2df87f68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GphpTNf4/6JegBiwWHLVBD2A38I8lZodOE8lyfdmx71cP9x3UNcbxvbZOlkZ?=
 =?us-ascii?Q?RL72UAEKE/rKUH/cWsWbsjLgQbFz6+v1xnDgCoyj9UZ5dTXeUigweBbW2UKy?=
 =?us-ascii?Q?Urg9aWNlqik6O1HCC+AAIx96DE2v6ME8wglDihKdGF/9gGKgO8VDQPNWHrMR?=
 =?us-ascii?Q?RTnokmtRbK67J+0vYEDRh+IjuBVV/DuP6V4TALq0699aHfuATKoz+uTdzKhA?=
 =?us-ascii?Q?EzQha52cB+7eOwzwjTdf2OdnZx9qmVuDqYApqey1R2ntD/Wxa3SIcxspYDZE?=
 =?us-ascii?Q?bJZHzmGfFPRTvrEbLE4xmaAkvbtfk51IL14VvIsr5Kba5rPvf1vGeMc1HPBH?=
 =?us-ascii?Q?1QBsPyG0JHkPMMBfOA4oh2I0zXuYg4qQsIZZW5W9JwT4LqxBN69EiYI+zFNt?=
 =?us-ascii?Q?xM64bk0XZcQNyjg4mso4VBDZ84WFOEc5ecnOrB4jOzm1PhHbSYy4IE58Uwzl?=
 =?us-ascii?Q?pfCGJEdvhfOZJ/S5gtVBkTjMAOS+ShmACEGZLHZzB/pYdWm8Ph+Xhy3AY3oQ?=
 =?us-ascii?Q?b3IQrSzZDwy4to7hEe3Fq7u9lMRGw5ziLhIBZsOS5trUXjL9Avn6s4zZUjvC?=
 =?us-ascii?Q?QxmZmlWQT6JE22i1dHwMMpj+iEHTgmCoU0B8aJaEIS02qrcU5vfqPXSPYQ8w?=
 =?us-ascii?Q?40Q6jwDcf8k8E7jSS4wVpm+CZQmO1tJjXqAEZ86ov/96WIr0QlQjqM1CV8uJ?=
 =?us-ascii?Q?UU/nmbdR0r+sIrBI88//aX1islIXwicTokz2VnzS/MYSPVanMkskgalCpb+c?=
 =?us-ascii?Q?bv5UoHLpVKUEfQOhZdLl/6qpfUY+RpwO1D0NrJojVCPwAh3IK8t0hjixhxvQ?=
 =?us-ascii?Q?8bf4Vyb55yACyDTAXeNag8lAFnkrO12AuwMqmmangimFYVjJBD/xfw0oIkNh?=
 =?us-ascii?Q?wdqzvKQQ/sCANnHOFxn9EEVtiXQGI8Qo4jAcPcpy5JCEnsyO2RaLiKqcVsKZ?=
 =?us-ascii?Q?IB/EIsAinbg50JMRSzBTpf7rniqsYTpgb4K+nfV3OjJPwgL3HL7l0+BW3QfE?=
 =?us-ascii?Q?s77ocac0+o4MmpeFg1rHoyZNqdQ2mSyDbnTArO/bmBfAgSO5igJuluXRxHjZ?=
 =?us-ascii?Q?bykYVamDdS2w2Dj4/rZiEF3cc9pEboIOmWUk6L5B2WF/Rmz8Up3YlR2ydPLA?=
 =?us-ascii?Q?24n34h0O46NOeg3i0XSRnuWBstt0ayYfI5bj5ktQMsdgvIYbfbJpTFgGU4Dt?=
 =?us-ascii?Q?eM8AVtX9+KWN0yKQMwLk4iWG42Pk342uGUdqQP3JF5xjgn7kA/ZieTjRrwFN?=
 =?us-ascii?Q?rds2daE22igV5LL1ZfcAoNULD2D06gS+/3uOqhZlvUgMjDIj5okNH91dpEEa?=
 =?us-ascii?Q?9Ji5TuZWCpKc47iQNmAiRBa6kiqWYiu2LNnEPg89X98tmOSEboA2YLagCo+Y?=
 =?us-ascii?Q?uPIg4odtZTIiHeFN4GlImdMA5B51jL4QyWQkZrm9HrAtzpk+5cE/7fdhWlBV?=
 =?us-ascii?Q?tY56VEjgbgnFFal7CarbuicLQInnIWib?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UQ7vKghIOjBdIEY8TmysBHU1P8In97pQ9gKO5767Lot3m6dmg+7e25V3getw?=
 =?us-ascii?Q?MEdPCAaBlExVFpTPtBY9ebY7rVaBBRIha3N/aOvtXri2GEKKfQOcMrg1/WnH?=
 =?us-ascii?Q?tD587BuEjhgsjqSSoL9t4LS64tQgOqh4ZRvyLcwUDscadML/gbtY8ai4YF7Z?=
 =?us-ascii?Q?lSTQYiHPg2TIISLTDzwDjHWfP5ab3RFa/N8jP1DAaaFBjgnBEf1vNcWSKGDQ?=
 =?us-ascii?Q?/sCvZ4QGOJ/jYJwux4hgY7XVEmJltilDFh9qMeYEtgpSceZz+xwnGQmx/Q4e?=
 =?us-ascii?Q?B4kKToVUfDpWOzutN/CPYDt9OCBWXawFetOgyApnH2mm6gGkmVMt2fnt6cdW?=
 =?us-ascii?Q?WtL/z/FKlhFR+TQmpnXw592FGU7kplP0c7+2n0XT6TxHCnnsvVzQEBOCrlXq?=
 =?us-ascii?Q?jXrbiDCXNC91ZZx/NRjPbmeTpxcyc0oiw/QVsgroltF93Qj8QfcNUUYhYnu2?=
 =?us-ascii?Q?CeBBmpMMrS3lq1poxjPt8eoIpXy0XeWySUiX2KYpsbqSQi4GVUMCC8WH26tA?=
 =?us-ascii?Q?EU7oBuSKvKgmm3e/W2mIltFH+3/ZVJ93md7KwpL1New5wWZtCbUGWzx2WzBW?=
 =?us-ascii?Q?FnES7tA29xRn9in05diOUu4PS7EnXuZvjOhzTcp75lQS33eX2Y0WJAnZbJ4W?=
 =?us-ascii?Q?vZaEken7Tir8FyNAwtSgJUHHZBjrtdujQAOtcGcAS0dLy2m17OHDfrDmst4m?=
 =?us-ascii?Q?RUPT5abnV3GohfIgXsnGJeyA1RcQk25MO0lohA1n1ctjt2hwnQC/o2MyhJPB?=
 =?us-ascii?Q?dOt0hrIGJTNhmJPITPxd6r3aGc0iT0vh5tY3HXvyGyUPbsjPBDo5UE/vTNgS?=
 =?us-ascii?Q?HMcowsuXousMgbfFuGrbHRBqrLvm4k7Ps/vxaSyVKqszvFTHdek06WXJURl1?=
 =?us-ascii?Q?aKfb0iohrlyKQsXZ9mYE7IFt7JR1CzNqZc4+nQtbaXPpCQRWpciWLjqxB3Nk?=
 =?us-ascii?Q?X5chEnSQNDjYWhnDt9tLxN91QY+pqIFFcJMm8SDC9730OjLyfzNfawwfZy9g?=
 =?us-ascii?Q?8/S4lRhdJp8uEQ4pYBKhZExivfIQz/VygDBGD+Nzl/y7Qe3Sr476tDUrlu8k?=
 =?us-ascii?Q?qd6moO3ZR0UwOZ0ZiTpexOIuWkMxcLcusrgckUD9NBWbkxfZYr38Tc0gL+u+?=
 =?us-ascii?Q?djS/nGOHLNmvY0Q0DrIzNxVgmovnc4Znvg60UajbBTNm4dNHpa7hhM51lzbb?=
 =?us-ascii?Q?K0JYfY9G+fmcypSGcbC8/ZMfmXfYvPrnBAb+AqhRiIC8KiJelJga8TzZBFFS?=
 =?us-ascii?Q?fh3oeWIGd0nnvF7WZ0Z4TsjYZbFY7MSH85M9o/5s2gEuNZdlGWF3P/3K8k17?=
 =?us-ascii?Q?hd1ZbuP0YAkbuw9jTKCwJT0yIYbFay/NS3RKbfNVRdHYezkudAOR0azOnlvr?=
 =?us-ascii?Q?0ZLXvakkeFDVmiBY68HlkU2yC9y55mKaIvqxW4e7IGumRFGoLs/gaTA58sMr?=
 =?us-ascii?Q?6KgsVzTy2UhjWopTy/a7mCn1MVupkzdFdodvfJH17UFj760w1O5OuJ9k1LPx?=
 =?us-ascii?Q?BMODDffFYeCkB1A70pdOnG6evmDrxchotItY/GH3NpmH13gX9Q60oeQHzcPf?=
 =?us-ascii?Q?RJCw4QNPISNX0YAIVSY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605b17cc-aca5-4140-a8a3-08dd2df87f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 02:19:06.8705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNeWOsQvMLTo68FPaZK1PCe4pAqMtpIl3xypRrk3ZQ3chdLCkduey6yHfYLuhAVeOfSNs/Pl/5QXOOkNOaJeqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Subject: Re: [PATCH net-next 05/13] net: enetc: add debugfs interface to =
dump
> MAC filter
>=20
> On Fri, Jan 03, 2025 at 02:06:01PM +0800, Wei Fang wrote:
> > ENETC's MAC filter consists of hash MAC filter and exact MAC filter. Ha=
sh
> > MAC filter is a 64-entry hash table consisting of two 32-bit registers.
> > Exact MAC filter is implemented by configuring MAC address filter table
> > through command BD ring. The table is stored in ENETC's internal memory
> > and needs to be read through command BD ring. In order to facilitate
> > debugging, added a debugfs interface to get the relevant information
> > about MAC filter.
>=20
> How do other drivers do this?

I don't know about other vendor's hardware, but IMO, if the configuration i=
s
done through registers, we only need to debug through some tools that read
and write registers, such as devmem2. I also saw some drivers added debugfs
interface, such as Intel, Huawei, Marvell, etc. I think they also added it =
to
facilitate obtaining some debugging information.

>=20
> You should only use debugfs if there is no standard way to accomplish
> something. And if there is no standard way, you should be thinking is
> this a common feature other drivers will need, and if so, add a
> standard mechanism.
>=20
> You will get pushback for using debugfs as a bumping ground without
> adding some justification that debugfs is the only possible solution.
>=20

IMO, standard methods are only suitable for extracting common
information, but each vendor's implementation is not uniform, and the
specific details are also different. It is impossible to obtain every detai=
l
information through standard methods. The purpose of adding debugfs
is just to facilitate debugging, so we need to obtain all the detailed
information, so I think the debugfs interface is good, which allows us to
obtain every specific information in all NETC tables.



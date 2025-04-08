Return-Path: <linuxppc-dev+bounces-7541-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E279A7FD44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 12:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX33s5r2Yz3091;
	Tue,  8 Apr 2025 20:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::608" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744109945;
	cv=pass; b=aF7/goW2cTKfHeTHoEdYwUr2xcCDJFB/dsRoIOxczDuFDf6wnCKXoR94neB6xbwShZbpzlFbKzYcD7Dw2TurssnkkoM2wwEoHHo9+IHyMV8CWEVzH7CmC/vE4Hxhwd1sAONPL+wwSw8HoiqKFE25Tkp3YTbrEkod0yycEXNpTeSuN59vxUuWNBZrQk4b4bhigvbwWEO5LnRVp6fspkgYXA+blsTU8xo6SHXd37jo2nIzFQNVMEPHP8xpmuywnelWZ4CqzkFk6ARVseYu1k0GHMMdRH7391SkPIwyZD0JfnRdl4iMHnj2fOCXUQYO7nhkbPEbcdDYeBs0NCm0OXuRbg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744109945; c=relaxed/relaxed;
	bh=PtqihANEEoni+CFPXYGTFy5r8kFwB+Bg80QfdSiK0tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dwWoePufaLEKjLOWHKjYqSeCwEANa+AJ7Nr2ar1GdBgTPCsnZcifu7vwU7ucxtqYuGG4oCzUGRw8rmFy7G7jhIyWMSt3Fcj0UTMkswHW7lt4d9cjY4B3nniPk/yW+nPSOxt0jnhjFpSCsSEyWMXX8D6aq2VRy+r0hvcDxM3PFI3kbeAydaFSB+7h437Vv/Ed18ehAYRus8lB9xpxRPL48Zw5k/F0m+MHGKgtKPXrZVY3xZ9uq5J49QGW+dKT3XMtWZJr+1NHjtsFUdb2LnKs4njmw+IyzYigMX/YGehBDyW/f3cFaYDAmLBeMpYuIOfjir4Rj5uL1q2/HKvPGpo2YA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k8MTjXln; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=k8MTjXln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::608; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20608.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX33r6Tg1z30NY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 20:59:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gR+u7at9SagCSqVMqEJtGhBqhcNMdluhIO6iKp9bP08MKly3jaSAe9lEJekj4TFfm9EXwadY6gb5elDh03nsZ1wcpDSYB/sD2nmzd8lgQq5972pDBQ5GZ5vsNAPecMCJLyzTgfwdzw+wujASXJZDJp2SDomdle96CQ//KUAAd0f2r69Wjjrj5ERJR8Y8G9CTMdHr23m7eI4JPXcakgyOqOSSOg/r7Y2VJbwpn5Qj+0dljrjj95/FffAxctNZF2nSiSCfXpYUslUKckTCeJKK+opXBvVPoFNkqQUblezG1JOLJVBZQ8lgUvIsM4sGTWJuSHH6HfG5OAhbrJqlwgBaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtqihANEEoni+CFPXYGTFy5r8kFwB+Bg80QfdSiK0tw=;
 b=btEMqqy4Kt4JqaRHbcYKOqIX7uFwYcGeYZqXbCpjnHF3BC/Yn6Jgc1JLfP2TMI2jqMrWD9K285o1MGuvzJkK+sn4OKzzDMbA43RUn074XsOK2XEH4c7lveRqALQbFLqeah+mnc4Kwm4WL9pIxjLFHciRYqYQDSNnbCkJtpO9tC49GAjvuX2jQblhrlSjaPJJtlg/5KDJQPhTRZAZg2YLcdXKunYuGyd7HgwhOdABwMxmufj7ibPkQGvqwwKBQ03iJxMll32oQ/ZiDKkn3xTuDrfBMFIatNnF80dA7ttzHucNyty+RyJAAXkTAkr2M8PwTyD628pHH9x6ZxYfhwOwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtqihANEEoni+CFPXYGTFy5r8kFwB+Bg80QfdSiK0tw=;
 b=k8MTjXlnDxkugAscCv/mDh+I6J/qEhmkwzK1M2eGDtQy7zXdyJQsfKh+QABCUWWXJk89nnC5LTsijlEEd8ph+LAvInm1DlYNPr01AbKOvMTAeiH6e2QyYinmnTJVtU1T9bN53bx2r/Mk6oBCkSP53N8iFJizdUUNDQ8E/Z7XXxb6x2ZBuvOq8gCkwZzYcA0TUxK9rpuXgzwG1moUM53VNuk11b/C4GyJIXwbJBvYtWkqp5Iq3MRabO+AsydGUFZa5XQO+5kJ9loAZ2J7YzgafqCR/EAGotOGKRZryyxT5dD+el/W53VAWBJ4gQ/9Phhy6KECYucaUBsEjT7MRAsPKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 10:58:39 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 10:58:39 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	christophe.leroy@csgroup.eu
Subject: [PATCH 4/6] bus: fsl-mc: add the dprc_get_mem() command to the whitelist
Date: Tue,  8 Apr 2025 13:58:12 +0300
Message-Id: <20250408105814.2837951-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
References: <20250408105814.2837951-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec36136-9bfa-4b72-21f9-08dd768c5157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1vSPndVp7W0Hpl7I4OLittajUvz8y01qBsLXtygLVE99QV8YOpR4Pg7uwkKy?=
 =?us-ascii?Q?cwjPFvruDyNCxVlOeTCrE+DlKYzfdnm1vdt6AjjmS/yPf98JkanvHUyiKObR?=
 =?us-ascii?Q?icy/6WxFts1tfQcr/4d7ovPGuzDeEUKYV9hbQzdrRF+CfAkJUkS6/iRq4C6I?=
 =?us-ascii?Q?snn+hNUnMh8hcOOM/X4XkSVmwkdHSJxGchI5b+1QLBnkOj8Ib7cV8hagZdFU?=
 =?us-ascii?Q?HdxmPOCa3lx5SU+8V/rwrZep6bkfo4hwnPynWpQzRxOcZHgNDpZWY2SGbfhG?=
 =?us-ascii?Q?QFLJXEy2LgBExoxOiQ3dbk2vs6iWjmJphtkbZybpO0mIeZaT2fuqscLeVp7W?=
 =?us-ascii?Q?AK2LvwGBpWYAoZKghnMhhPLM68/9dLGWoUqlMbZGkQ3T3YXM8d4j5TX9nqIM?=
 =?us-ascii?Q?BYvJdJQfixipQFK9x1fPowdVsTAWjySMHkgh51JcMVGBlgtdAPYlGexJ12lj?=
 =?us-ascii?Q?UFUucniZBd5tSBdJkPkZqWxGwW6xbnK4nru9QjPH8WIxI0wAvj25A2WfgdIl?=
 =?us-ascii?Q?2GWLmH/pYFqiDhXrBZoLFr3EEuax0QC6GOpT83S4RrAXpAxiTs5Lx91nhtEM?=
 =?us-ascii?Q?IVa5CdfhqwsAiSTmsCc8DqxPXhbCi1gXYs1dKKFmRpmXzdjZYSw5NsVJRnkB?=
 =?us-ascii?Q?2CzkDXtynF437V6K+sJG0iHgaZyIl6D98RMZkLrZznbVvlGZ965ZhqIaIkhM?=
 =?us-ascii?Q?65iYq7T5/Gfh+b6K1UUdTuLhSdw6PgJMK79fV0KnawrqPsUQFCfq3hS/od7+?=
 =?us-ascii?Q?4CrN9BLgU3JXiJlooewpDJ6w8OJE2KdKWIms8MOSTkFYYhLq/drYSDDxM/bN?=
 =?us-ascii?Q?EJnqzjB+CQoeXFyEojZMbpAYDr5IYnZ22WsOPEFYDzuUTHot8e8jBbNlHc1d?=
 =?us-ascii?Q?ws1/1bJmLO8Lb/vOIzNZUyufAXRFRm5AkBlY8cOsyWBDPAG2+ILoDL8evSxz?=
 =?us-ascii?Q?veaF3rf40fADfYkNKQZtXavBwBdDARknaaodpp0aVSi8r8emy/yjDc8tEuGP?=
 =?us-ascii?Q?ADEhz4i4leORjo1wdTJsIIA9hV+73Xyu53ZqU8G0Stmb4q44rvyTPSH3TBNn?=
 =?us-ascii?Q?9Ia6H0sGgDz28IDzgYe0ePa+UdVXbTjfb2boqAtLjpzH+Zs06yefnVcJXVrl?=
 =?us-ascii?Q?4bqqQj4Xl+OZhywWfmnbRhNimGHjfG3yEuMfJVdmTRi+ZUHB5ywRMKDZmDYI?=
 =?us-ascii?Q?KLdExmuuHpj6qYpe2Vq5qco+LS2Ib75vqqEZaYH3s1txMcgYJOovtzUBi9/2?=
 =?us-ascii?Q?rJd9wYzU1P43x3OqAJIqRDR1XpGwnoDeHVY/q/tNvltVRtjgPYsW0gZtLIlL?=
 =?us-ascii?Q?4BZgaXFJzKwsEpsSiSQZt5jNSL9WmWUczlwXkIsWfin/ic7VFfWiG0DJ/AHQ?=
 =?us-ascii?Q?iY6634J9eI/a+Hm4sK5mBjH/KicR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?15xHBvhqHuQQhbu+wxxU4o2oiitADztv1R+AziYdUyCjLygLMuQxmQWLUWpf?=
 =?us-ascii?Q?rREDWrIeS9PX0NHSB9Y0aIuibWmMVHIVgv30TVquaJ4aI3Ep5Udb+hfbZygo?=
 =?us-ascii?Q?reLAsVbZNbL73iPvHQOMkPwyUizJST332KFJjDfJMv4K3nWW3fibPtgmZh5O?=
 =?us-ascii?Q?gshoRIKQzBZjrfLFZMx8w7kh7ksqbtLQdjHZHAYOOJ2O7PxRHwcvVuJXnpFy?=
 =?us-ascii?Q?dAl3GuIuq4exoC2LS6Pk/PQ6V/UKXHGl0evEMPoHmcbuEAW4rCyFQ5kWg5tI?=
 =?us-ascii?Q?M1T4Fy/A1Lt2Z7fAO+WuA32aZ9iNNdD0Qr+hBB20wRMTKDmVAp0aCpy1yfGK?=
 =?us-ascii?Q?6KaJtFsZwz/rIuoPrYWa89hos7CihauZob3RBgQC1lv9iiQ+XkWNBgFcinj3?=
 =?us-ascii?Q?ON6eG+3Y8OPLvhu5J4o8Xys6TuT4i4m+ka6tg42FxGQ8t6Js/D8KpOYnfEx7?=
 =?us-ascii?Q?R/uppKdSUeq5kVVkAZiPp4irqrtzBHaVs0W2BxJH7fkPccw2ZhM/gCt9pYzO?=
 =?us-ascii?Q?tH6zF60n0Hcm9ELA/q9+apKgsYM80nJ9O1WOfUO0YyWUP1oHAjm94I1oEFWz?=
 =?us-ascii?Q?yTDnT9mVxqrUPSE7mFGYoOMKaRWsaQEJ3oMgK6SpVY8qkzkYC5G4XOay8nAP?=
 =?us-ascii?Q?wTaEXdxpJSLkAlZ9OkWHNaFMTrL8MzF8qtXvqMzMdV4Zg6pfiLafcsG0VI/B?=
 =?us-ascii?Q?RLFZAhxozgA7mWIMPyEnB7b4uP751yJUAJgt3ao8mGx/AjCaijwKGkdpLkvu?=
 =?us-ascii?Q?v5qasCWDRpjUFsqcDs2NmCtcRMDketkwOgVbCOlTkz8qNslC5hWSRNEAjCec?=
 =?us-ascii?Q?KkibKU7zF0swaVC5ToLK6dZqmwFqgTrDFf1BzDbaz+2b0iaMZHdOHs14ZPAI?=
 =?us-ascii?Q?QTIy0Ahd01SvpfBbOE5mGhATyFrdTolynBv9VoJsRq4u3iUJQ93GxockZtBT?=
 =?us-ascii?Q?KrFzFK9jrwkNVjKkdkAjG4fk+vpBW4j4Y/g/zRM4eOtdIalWCgk30LnstEcc?=
 =?us-ascii?Q?O4TJJWp8NSVTkUUSxB29wU919afI9rYC+RV/1yhopER/0hiXnVLGlcXxiXYu?=
 =?us-ascii?Q?O5SUzqX+/wbSA2EAsV2/fCfs81HSRLF+TA/X731JcXYbRZ0vKPrY0T9LMx3l?=
 =?us-ascii?Q?dvEN6J5GTbkjQ19TEflO5arzr7RYqYrtDaD5PVLsv4q1Qhe9JoFtQ5LoDPP7?=
 =?us-ascii?Q?drB/7oball75BzLu+4/JY14Xwjs4mu/s8A9kAu0Gn0jsCyF0yPDkALrwe096?=
 =?us-ascii?Q?jEMMehckmEx3fxKcPs1H9S5x3E2rgXrjKM3lQpPjg2DdQp0bORvkZuC8LFC3?=
 =?us-ascii?Q?zu2cd2WvA2pjH9VFRlXOG4vsGqvcqRa+nM+72wmQ2hf6UwFzr1qVVRMl+GAR?=
 =?us-ascii?Q?zK0HCVAyN2P8zDXs0UFWytiSryUdF1BYsRyXH+R9OL5ydiX6btG1+zpxvSiV?=
 =?us-ascii?Q?u9Il8LasZwSrwYOJSbvuvchypiaHwt1AF2auHj8MlU0Db5kZ7Ivi1oA54Lm3?=
 =?us-ascii?Q?H50WaqEVjD9XoYMsvOKNQN30yPjk166daGZQa9KtnGqUw9X3VaaYbGHT6Tvr?=
 =?us-ascii?Q?zPpDk8Dux9KnanUrj2r2L7FfKrhaGvrRJT09GAWZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec36136-9bfa-4b72-21f9-08dd768c5157
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 10:58:38.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urR7cO4Y4xrEOwWAgTqOUWR1DPFZpCZnYU5fqAuCT9xQNGVtfcTjK3X1rLX1JbYmIt3Q6iJTjzgMvvk6tJR8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9176
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a new MC command to the list of accepted firmware commands.
The DPRC_GET_MEM command can be used to gather information on the
internal memory characteristics.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/bus/fsl-mc/fsl-mc-uapi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bus/fsl-mc/fsl-mc-uapi.c b/drivers/bus/fsl-mc/fsl-mc-uapi.c
index a376ec661653..823969e4159c 100644
--- a/drivers/bus/fsl-mc/fsl-mc-uapi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-uapi.c
@@ -48,6 +48,7 @@ enum fsl_mc_cmd_index {
 	DPRC_GET_POOL,
 	DPRC_GET_POOL_COUNT,
 	DPRC_GET_CONNECTION,
+	DPRC_GET_MEM,
 	DPCI_GET_LINK_STATE,
 	DPCI_GET_PEER_ATTR,
 	DPAIOP_GET_SL_VERSION,
@@ -194,6 +195,12 @@ static struct fsl_mc_cmd_desc fsl_mc_accepted_cmds[] = {
 		.token = true,
 		.size = 32,
 	},
+	[DPRC_GET_MEM] = {
+		.cmdid_value = 0x16D0,
+		.cmdid_mask = 0xFFF0,
+		.token = true,
+		.size = 12,
+	},
 
 	[DPCI_GET_LINK_STATE] = {
 		.cmdid_value = 0x0E10,
-- 
2.34.1



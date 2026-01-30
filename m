Return-Path: <linuxppc-dev+bounces-16437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D95MnaNfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAD8B997B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2XrR5hNMz3cGc;
	Fri, 30 Jan 2026 21:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770311;
	cv=pass; b=hvgVGe+fWawKUxuRbWsovrv0+ktuEdWvi8z/ot327iPwgmPaV+5/7QdyHVy55VCt0skfaZyrYFo+oy8JedUttG7ngBREcnsucavAa4pvb0q6v5OeoC8qpCQSz071KRuIW59STwIbwTY+Q+nwTaAoGgzARqjPULIu6lPlZK2/vzLfyvxXInfwL80AQd+KPNiXfINRDePIkezOuG6OvEbQd9QRjRmr+GV9BsViJeXt8Z9nUMhMkIMqRmXsuobmeyhU1ggr0FK8cTiKjARWfn7uCqvE2c8XOJZqgR17z9KA1xr3vTt0+Q4K9/rm9+MdA41WmK6JBxNl6Ue6cEC4d3UNRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770311; c=relaxed/relaxed;
	bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ezyUWvd7hzf+QCWA2DyikWgSQq6QbTyvr9Xdmf8g++FXyVuXa36njYGOkVg6JCGlK/4A4zHLKWmhWyC5i2QzBjd4g9FWbX06dONsYRkOMfb0EQBMsF0nQ6tpQIInpS0C/AdfQw2tN8eLTXvAM1jpL0krb6eWSupi7An2F8O9H5K++6rSdNbvYFRaCuYzc3mf8yduTMG1EnW3Vxxzyv/kr2tmydPmgBKsCKM//ZCNtqZbQhnqmKZpZD/i1BrdqP+uZP4a6MsDMXiVaKn49SlgYW6vnhcSBhmis6ounJvgBYAaJj3GazPtwQ/DZguA+YgeebjNXxG0PBPMO/3TlpPgBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rUajjRW7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rUajjRW7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2XrR1Szrz3cFG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zR5SMLSenfiBoL3QhBhlUaepTX1IzGT4m4gLjGKX6aDEd5tn35qRh+xMWnRdrHt++f0yPNKod/os5pGvLXI56Kd8Q6DxIZovd72iNGgiUgl0t8qgleedDIknnegOs5tVFz7BakXcqJg0aaW9ks3kSNjVh4pLBDQMzw33o8DXiw2KaBNTNR1foqqhbri9RvT0/YLV1ZLm1jIQJAotpUUEYk8JtZ+nHVd5eb0eMu7IuRNAar2FHum22LxXZjBGm8Yi8O0cKbC3u76Uc/hhMMpzRokn1hc8KI8zLrpxug/Vtm//dCh0c7FjrJW2RU+OuD1fIpjr8SxqD1AjDLAz/9dDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
 b=tnS+hl3Pwsm0TCt4N6pOOKuf7pPApFcpt+0ilLtGddf2Vfmjax/xXLCDs0Z9uiWqiZL1v2R+iMpgMyI6cDYCZHoKpSB/hVdgELWuQOLPD85lO4RXGJOxDH0xS6xOn/8kXxowKOKxtygK7rj6jcbKrHW0wxZ1vASARPVP3eyu4wVLeCw/tL4WWO3el5hwjgal0peNRkYwuTK0jHJLmy4gKGUYvYst8g9fE6zgwHbfJxRmTrO6VFZT/YyJHCG7r/2Qd9S4Vw3YhsfpX+pv/LQbHSw3NT0Iy4N2EObDnKJ3gcTANlR+P7IWeehOoX/6j5d80IsotEYsoXCRIqSzQA6YkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
 b=rUajjRW7Gn4gZYsxWpp6g6a4v01dnlHykVrlclWmaa2R27Hy4VDJryHHliifnskT8+jLgsYQ46OewRa8fDUmIbv6XrkIYL4CfrEa/YeOJCOe1slz6ZkEklsgy6TQo3e82VBARh0c0w57+jo7lN5Afh/hLkEzwrxxf2YfBxpFbPAcGWUyH13C/PfxIQRbWRcZqk2Ir/1crUs/et56YhT5iROOHd/GzpH0GweTbP792/b9M9Z/nrMFNfh+BTDl3WJboux/lEVX3Bff8sDObJ0Yk2XOlrww5YTOiegTmI9Rd+zXor0+lCApsZ8VlXCtJijdjTdWKgnLaHjhHA9oQBcMTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:33 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:33 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v4 09/13] mm: Begin creating device private migration entries
Date: Fri, 30 Jan 2026 21:50:55 +1100
Message-Id: <20260130105059.51841-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 5159e61c-c455-4852-89b0-08de5fed888c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u0aEyQIWceLwETm/XJ4EiCyKF3p29gtRGdkY+hPz1F3AwzNPpdLIsKDNNnho?=
 =?us-ascii?Q?F/nigWoQI81zE+T/oKhTOrY7xj5MJUyBpItG+Ewrte21cjq3YDorqZOjKKxb?=
 =?us-ascii?Q?zAaHJlvfOTtoXotOGdTOjvEs+lQd/puFz3Z7aTIowRnT260YrNBENwvycRpA?=
 =?us-ascii?Q?UL+YGHcn2s64J1f3iem9H8nvpqVwdJ8vFCDpdj6EfRLXAfQOhB50yauu3WXC?=
 =?us-ascii?Q?9vsu9cnClGWnG/5mRPGijHR9RZ0axSghozfyXHIcUC4w+ZAWUmfQS0L3qpNC?=
 =?us-ascii?Q?ccx+m8WhV6hPrMNHj9OhW7fdthDbI8PNcIttDmIq/rsmm+oniTrAKeAXbwkZ?=
 =?us-ascii?Q?JRDH0s7OMOIDQi7FT2SWAkjjTypxpcB+43JuoVycaTE56cQspcW/ZFJ7xP1L?=
 =?us-ascii?Q?RlxiTfQqHRgHnMzKKnQ1EtSIBfhCJLCbqRML4vCVO/rQeJIfGXQi4zETii1n?=
 =?us-ascii?Q?RD5boJhThI8WCMXzzHW5LkcU6g8WBUGi8BU62dYXI/HnY9DzdwPgnYnBPOdK?=
 =?us-ascii?Q?n4vRXDrYryrKO7yb37xEi2e7btZggH/TLeWe/7yAm7/9A0tzUhV77rZPoWWq?=
 =?us-ascii?Q?i3bTbvMtVNS0K5u0SCfiQCsH9ZYklTsfRwIxIlZqHoZH+qlN8DhwiebmTlAf?=
 =?us-ascii?Q?cL2WPmmCz5SoYnle6brJHzKyReEWUjPSwOr479wO2YG1a/wnDlkIihFtDQ/f?=
 =?us-ascii?Q?WbK4fhkBcUL7JFWCrkSoIweID6y37JwNwKcnGn661GrzQX96fGaOqqRTGBKq?=
 =?us-ascii?Q?cQS0vqcUXxjMvB3wKlotskpQ7A03vqcOpU6YXZDFfmefhH/KcX+yevkYIW3w?=
 =?us-ascii?Q?4N0tQX1VgirbPcldo3jVW3Qnth6nCKG5C7UbWJTNIVQ3STHQCuiypnhmG9ie?=
 =?us-ascii?Q?uGOjBvs0cphycmyvkugCO3y/37WIKke336RTMltnhnS5ceNOW77b/mCROTLb?=
 =?us-ascii?Q?fXrRn8y1MSeNJcYiC8C/1hEq+LxdTuwtnZ5Dw2pNTaAP2H0NxLCb3jb7XW9S?=
 =?us-ascii?Q?y19d5kXKQcVChjQeOyC6PpC/fjm5r+//m+CQerp6QbU3k4kF72H9cA7OPxMw?=
 =?us-ascii?Q?03oqqDGZ4TTMQDAhDsOK/arv7lpF9yIeRMmKkwq2Nfxb71C/hqbaamnQHGx2?=
 =?us-ascii?Q?bRoG9AjLxtAI4VJKXkTN6Dl1otKrhTN/j1yRWJT0EYTIdMmpkfhFpWB+1qQZ?=
 =?us-ascii?Q?+6tGeg+PKozTBRk3LQ6csBeeGGgYwfwqdEouCUA5oAmf6s5Ch05OwTSnbeCm?=
 =?us-ascii?Q?2C1DiXYLMrTHC+Y1O6qw5u0ndZV44H1y21eQSpM6NQrwk+xqv1J8f9gVnq0H?=
 =?us-ascii?Q?hrfxj0KEzjbNr190MQaaFcd/9WkQqS3BWfRf8dZyiNbwKomLJznB9J/mxXW2?=
 =?us-ascii?Q?i39yA5tXfbVh2mAn4amygal6JkQjtkoSgwYBovZXk1bqWXtXqu7pN4u3HCY6?=
 =?us-ascii?Q?laxV4wZHDs6OlNPdEQByFly0mB5Wa3hx4s3BQcH5fZw9JxIpcyZUIs5OzENd?=
 =?us-ascii?Q?3FXE390d2PmHT0gqK5xPKQfH3J6BaihlAJnprejn62PqH2R56lhxm95Wn96O?=
 =?us-ascii?Q?RSS5mC0Hu4gJlcC3JL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eF3ZLlyg6TsJpWq8shivWbLj/NQGT1bdKVJIhseiKnF3KNKIx0VAeUSKyfYf?=
 =?us-ascii?Q?otNln1fDzhzWtwfmaRgYkfWsAMA7qNkF40hxIRkCdZrGCBY7kv6owjh4D+B/?=
 =?us-ascii?Q?LMwSOWmokRAyHwToya7q1uLCoc3w2FVkc1exw9mlFCkuEnHZCoPQCKYdW9VW?=
 =?us-ascii?Q?iqdQ6W+Z5BaRRpfpFnLUZpCgQLqdrU3atoxuitiwb3BmGvj/e+Qu1OQhH3Je?=
 =?us-ascii?Q?p7QIbpGw4P8RQ8WkbfXHBV2Nnv6k7MZGzsox/54+r1ve54aFz8UG8IBPC6AA?=
 =?us-ascii?Q?6a5c2ofXd4mkm4qeqNKuAI4YEvTbI5yt7YV7nEXwAUd+0hLAmCsZZ/is1rpW?=
 =?us-ascii?Q?Vr7+6CoONVk/66qqNGTK0GfNEAAk3JFGtPu/tUziyXmhuhDZ8rB1aI/K+gTr?=
 =?us-ascii?Q?ne4Cc12x/ZciouKWh0HIcKTCvnnU0z9B2Aqe8wA/6lK6qc63dmBw5tlUP8A3?=
 =?us-ascii?Q?c5jzyEN79OGLueaUXerN1pNJxFO4ULmJRinLiPjkyLZbCtG3g3SP1JDd6igV?=
 =?us-ascii?Q?lMEu10Vikuof5fJzF+EhkHQzUkd3Kvwegc4nLKqBebRi5ot5ssXtwIcG197A?=
 =?us-ascii?Q?UbxdKV0J57+iAdWQfLtGcdnkNtbB7p8bLxYzbmiqB0GqV4iFGZHq6p0ApYuB?=
 =?us-ascii?Q?b9UV/ShylyKyAt9Ocrn/fwDj1V7nwtpu3PImBrLLXUsVBCugRfDKyABM9Cel?=
 =?us-ascii?Q?hQaksbmxckano/7gmgdi8l8+0MUUljBtsa/lo4ce5sA2LWGdiwB+IEReRMue?=
 =?us-ascii?Q?cNRUFE2RYJD1SwwbTmYy+r9aZkBVOH37iH3Y6QBPIF55nYNCLwy0oDu+K7r3?=
 =?us-ascii?Q?aCut4K32UC0a2EI8c58Wh0qXbiat6rXgwnZcwloidlkGcVpOjY8ssC87riZ8?=
 =?us-ascii?Q?SdLZzDPPeZYFncSEVejgwEm3PNqxHCjjxMJAXiAuqLxvgf2C7jB+7kTAKlf5?=
 =?us-ascii?Q?ZGGWqAzZlnyCchy4j5dgI2rVj3FPpyoSs7CSAYbz2NXhqbtGNwtBM5CRi7h2?=
 =?us-ascii?Q?iflpJd0KXWIl2inHJL+6ksOuSpvjJv2/Q3RrlOhsl7M1FUVH26Oz8Gh+94AS?=
 =?us-ascii?Q?Yvfq42tF4fMPUNRAivU/zWPUgb0+/yB4StX4sC49uVLQs0vDqRijYqAYmt8C?=
 =?us-ascii?Q?fwN2A5rap8YKqxNshbusG3hN/CAeqU9pjV5LpaS/a/hPSf/Ji/XRakRdu7M1?=
 =?us-ascii?Q?IuQixtceQKciT6cyoZ/DLLecCMGQP7XLHcxR3/tvk1LCYhBxbMY2QShDoYFK?=
 =?us-ascii?Q?i/9vClTRzs1aC8z7I2Aqef9Jm3s9j8S09BdZIQRSDQRAWrrYTBaf+RLZ+gCF?=
 =?us-ascii?Q?EXtlSfJ7d8sJjaFiTksd4bLDswANMs1IGMEXoX7dv54iEqFFUXPSYNCYO/iz?=
 =?us-ascii?Q?czD9Z865DzpldtDOWpaxoConzF7Sgop2geLrP+SLy9Q/jRPoD8e/jsnpcO7e?=
 =?us-ascii?Q?S/hAryz9bbJVblq7ww/L+ibnwjv89/DZj5tKzH8SlprbZo1tf944Td819IB4?=
 =?us-ascii?Q?9om49Oij4pqHOru++dAxKZ7NGR7n2DJjUAaxTX5a2o82qhbZ2VXu17YwVuGy?=
 =?us-ascii?Q?wmbs43iM6jxSEPiR7r7/xGl4IpsGpLW6orex7hANT6BJwXkhXI0Ppoq6/59a?=
 =?us-ascii?Q?XY/Sv9qXnpveaWwMGRuqt9wLNBo6frHrt8aYgIoxQ+OqI6ywSUQS6lT50o2k?=
 =?us-ascii?Q?GtwKP9yG0zp/OpNiRuUdXFl5jFo6XkROy/NIyb9wspv57HY92/3OfLCoPdvQ?=
 =?us-ascii?Q?4XzDY2LeVg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5159e61c-c455-4852-89b0-08de5fed888c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:33.7306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2/t/EXNW2ZkEm8jek63prOMcE1ZtJwcI3751kDvCCf6irEvK6GIRJSDoAGS/eWLbXUM6yd7MZs5U7lwUi2Vvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16437-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: EEAD8B997B
X-Rspamd-Action: no action

Update the migration entry creation helpers to automatically create
device private migration entries when invoked on device private pages.

The corresponding softleaf predicates have already been updated to
expect both migration and device private migration entries.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
  - Provided as an individual patch
---
 include/linux/swapops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 220627cb7fff..8b39983792ea 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -206,6 +206,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
 
@@ -217,6 +221,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
 									    pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
 
@@ -228,6 +236,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
 
-- 
2.34.1



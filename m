Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C514D926664
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 18:50:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ETXOl5n4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDm4d4Vsdz3dDq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 02:50:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ETXOl5n4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDm3y2qjmz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 02:50:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxDL4eNnPESd18HF3wjjUo6B7oqCXqFEynxZGukh9KIPnKpiBLIdbGBx5Pq0G4nbsOoDJma8LOfazrisbSFVIFRXdsbT8em+Fu19AhG/3pHjgsN8pFQwFC3JqBeR71OerTSozwlftA7OJ5IhaHCxvpUiFmW9YBwz2vr+njluJ0yfB97eFyI4soenD+a2pdtSFvfj/lpOGaS5R+1e21xSCj4cGg0HW1fmS2lNFka7JCcfwvcDd3uYfskV/4eC9wRJPFfSTxmpoEW+OzUX921uOqUXUv2uqlUhN9tPrYdIr6tcKy7iUa4JL97uZeb70wlQn8lNO0v+W1JUK20NiW1x0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piYuNxVHSkdeQKlmm7dEr6BxTPgbN38D8fV6dApsfx0=;
 b=RMnfh0w0e3EGAPg/cr3I9kL41WDs19T4dRyc7fEO86CeayllJWuWDRucKJWEKCeVIgUjQgWxbP3rw+Zl0MCXL8KAkjQ5RPvQ9VV84jIWCkqAX/yobyO2uB51aUph+rpRCgsR9BVhC7mu705Br+CTTScTNIpq8MwAuqGVa2WRWf1RCPcx2MYkbbGPw1mUhzeeRU2FuqHYHaX22snvpj6LqlM7gn6djn0DGbA/oFCLucC29nFamebSJCn9VgY1WQHleaLH4OVXhtINBkB5HeaRI0BIbCLH8RqpO0kGubV0FpJQkHj+3iDpeYPDYQUuWQTQ0AbRgG1TJTzbE0b4AJMOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piYuNxVHSkdeQKlmm7dEr6BxTPgbN38D8fV6dApsfx0=;
 b=ETXOl5n4HoDmJx73embHA1GBq+IPMKw5jcFqAXa1iyafX/brMFW6fIPmOrSZD2uNFVg9/x5tekCldObBsjyp/Nm48VhGrLyLtM2OovvG/wuwXH1WyUZTzBRejK48LhtiqQXAXJqCZMRAjbm1Nn67IZugTKCMHUPK62sDYggF7sA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10628.eurprd04.prod.outlook.com (2603:10a6:102:490::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 16:49:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 16:49:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] dt-bindings: soc: fsl: convert fsl,qe to yaml
Date: Wed, 03 Jul 2024 12:49:38 -0400
Message-Id: <20240703-ls_qe_warning-v1-0-7fe4af5b0bb0@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOBhWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNj3Zzi+MLU+PLEorzMvHTdNItEC8M0U+PURCNjJaCegqLUtMwKsHn
 RsbW1ALE+hQxfAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720025393; l=1032;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=miwfNevgvZtuf1+Pqdgo1T5ObYRYyol8cMQfEBMR9wI=;
 b=ygp6o7FPhUIiPfoCVMh63iU9RZvfxXRFplFUlMTvoQhAEoVNdSgZkpSRgW115F9REiNDZSygK
 kOZ7WoJcFtAAwZ9RgS9vP8n5Xw5Xp3gDAcjBN2dNGgJ+vlE2/ubHtVo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10628:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c4f725-dfa3-41f8-9374-08dc9b802b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?bUJkTVBZTkRXdWZTVW5BeXIxOURyUGlTQ0ltWUxUVkhTd3NkbU44dlhuNE1O?=
 =?utf-8?B?d0twZDBGTCtCWU9mRnl5VjVhVnhGOVBMdHdhZnBDbDBDcVVwTWZKbGMrOWJz?=
 =?utf-8?B?Q3BOei9QMlNacTM4ZFVzZ1pLdXBraDd0Vi9MRk95Rm1JM1dxWVg3ZWNzUGpR?=
 =?utf-8?B?K1NCS3hJNU9mQWlWbmpvT2x6dWFsMU55ZnlsaVphcExOdGY1UW1lNkMyYXQw?=
 =?utf-8?B?VUZjbWZRcHZXVTV5cXlRbVJMdFdZYXBTV3lXWHU2NGVyS1plcmNNWlRYMGhH?=
 =?utf-8?B?Ym9kSkJkencvNVVIOWhHUTVzbWFnY0EyMU5VL3VvZCtOZFdiN0VCTlRVY0h5?=
 =?utf-8?B?OHBwcldlSFU0dFg2NFJIcFoxT3RMeTl5M0VmMlFCTHo1ZGxqVXVESVBvNytI?=
 =?utf-8?B?Mzk2N2Y0biszWEpnaVE4UnE1cm8xZWIvU1F5S3JROGErS1RqcnYrdFczNTZq?=
 =?utf-8?B?R0oycWQ2c09DWkNXbHJjOW9MdzJKSklkc2ZSUVRudE1Ia2haMHVoVEpyUlVx?=
 =?utf-8?B?UXQ4eUlvd2c4M2ZFcEFiRmNqdzJlVEN6ejJ6TW5VVVNDNUtHeGZzY285ZjJn?=
 =?utf-8?B?RnJaS3NnSm1ldWpjanNNU1dOaFZadlVZZjR2cUt1MHlUSi9KVTJaSHNnK2hi?=
 =?utf-8?B?d3Y4UUh6ai95YnhPcEptc2V5WmpXajlzRWJGM3dBN2I2MnR3SkVjandBWTlo?=
 =?utf-8?B?NjYrNlNsbnEraHZ4UlJ0RXlhVkJsQXZwdUtTNThtRVBJTzRnZytKbGlRcEZv?=
 =?utf-8?B?b2NWQklvQ054enI2NGxFcnA5NEZtNlNRNU8xWlRWRFNDR2IySndzK1FNbEpP?=
 =?utf-8?B?dFdKYVAxcXJlUS9KVmhMNDdaak5idWFDVXpoTFY5UURTS0hRR1J3TFdKUVAv?=
 =?utf-8?B?LzRuSEJuVjRFWUU1UEllY2hRa3ViZ0lUUzEwSG90YjdPYkR1c3J0Mjg0T1lh?=
 =?utf-8?B?UnZBVURxb210UytLb1RuSXJkYmU5VHBtQzVMMDU4UmthbTBMTHpiOWF2Zmlj?=
 =?utf-8?B?N2tyZkhLdjdyQUZpRXliVWVjMFJDUnl0Q2VKYmU5M1ZRYk5lcTJ4Z2ZlNVA5?=
 =?utf-8?B?TlNtMStLT2xSSkRrM3pOQ2NadHdaWlZIZWtZTVVvN1ZyU0IyQXlVMHhXSU1j?=
 =?utf-8?B?UzJOcVppTlBnbzdmL2xMRHJGclFiaFFSbmlySkhuZ1UwbUxJTlNuVzRjWTBZ?=
 =?utf-8?B?T09LcGZvK2RZb3BpRDBqTm1Rb1hzVWczTjd4L1p4bVoxbWlJMkJ5NUNqUHNs?=
 =?utf-8?B?N2dNMlo4R01hcFZVaFhuWTJqTDNTTExtUXAwbStHQ05tUHFPNTFFS0c2MTVT?=
 =?utf-8?B?bVBIWnA5bURMcm1sSWlaTFZ0VzhaRVJGYlQvN3pLbElrNmFlcGtMMEhsbnVv?=
 =?utf-8?B?a2F2WlpremRvbXNBMHlacUFWNXV6MzlXUHJHQ0hGNEMrM05GcFlJZDhnbDBh?=
 =?utf-8?B?Mk9taWNqY1YzOXB2SGR1QlNBN2ljTjNVR1J3bThsUHgwNWlnZjJ4T1Y3YlRw?=
 =?utf-8?B?a2NJNG4yTnEzTElMbEdFMHZ3VXVYY29hUWh0dWsxMGNUL3BkTjlFak5BVURM?=
 =?utf-8?B?Mm1PN25WQVBQUEZDN2NBVFJGQlNBNlJSdW0yb2s1blFCcUE4YnA1a2Zrc0V5?=
 =?utf-8?B?WGdkOGJkRTBnYXk4M25kaTdyMjhaRmEyMm52WU94bFZBUGIzaWFmczRYN0ky?=
 =?utf-8?B?L0Z3Yk14eEp5cDBhekRUQ3NkTE9PcENXNDNpTkFva3VwZ1dSUlhNT2NFejRS?=
 =?utf-8?B?M0xKSzFSNks0eVZFaDFGTVlSeE9BNnRrcXlLNmhrOEF5ZW9SQkhGRDNUZ2xB?=
 =?utf-8?B?dVhhckFGTUZobnlPRXc5d3p5eTdzQVZBL2ZiSGRkTi85eGlZSy9mYkF2ZE5l?=
 =?utf-8?B?bkt3eVhGWlg3eG1OeEdSZlJNN285NGQ0bXlGS1A2SEpMVVE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bk10bmcwRGtsYTE5V0VPZFB3SWoyeEVOdm9rN3dGSFlKUFZCcHJJcFdyS3Rj?=
 =?utf-8?B?Q0N5MDV2U0ZJNWJRUFpnV0VHWSs1T0U1NmhmQWhvdzU4aEtEbkdWVE5tTElZ?=
 =?utf-8?B?SFNxRm1qV0RMN3F2YXgyNmNDNVkvN3R3dk9PN2FQeXZWbmx4M1RmVXVWYkVo?=
 =?utf-8?B?NHBOWFI5cGtBVittTCtYaE84bDFJbFhpemdtYm9Pa0JMMHRUQWZxRXRRK1Y4?=
 =?utf-8?B?dXY3eEc0UytMYmNtemVReUU2SDZlWnpVakZFSUM3RHZqSmZPU2ZkeDdGYzF3?=
 =?utf-8?B?QTArSUhBMGtLRWc3U0xKSTZsOWt4QWxtTThhMGZKVzJPODltMGkreTVvL0Mz?=
 =?utf-8?B?cTVocUhtdlRTd0I5VEhJREFXbkpySzF1SWZ3czJBU0xsQURldTNibzA1dElu?=
 =?utf-8?B?SXVEM0lyZ0IzYzhQOGZqY2djNThRbG9kRUdIb1BGRmptcDh5dnA3Mkl2SVRw?=
 =?utf-8?B?SjV1dG1lMS85VlpYb2RCT3ZlMmZvRURxYVhKbjdrZElLTE01bm9kb1NEbVVa?=
 =?utf-8?B?b0hTWWhWSGY1TnlTbUZiU1ZpM3JpYXZmQndROTVsWXkzWVhETytkVUl3MWpP?=
 =?utf-8?B?NWw5ZzBKb3lETzkxQ0NhNnpNMTVudjZoWjhScnBxQ0dUZjRLRFk1MlRTZ0VE?=
 =?utf-8?B?OFgwUi9ZYVRDdWhDK0NFUEVJaXNrbEw0Wmx6YXc0RGhlZ05ERzBTblh6RElk?=
 =?utf-8?B?MnlYWHFyLzNwNEU4dENOSit4UzlmYTlydzFDN2N6S29SSGJmVVZxME0rRHkr?=
 =?utf-8?B?SnlmUmh4TEVqSHg3YlZudEZaVmcxbDFrTjFmd2RuMzBMS1d5SzRZeHloQWZh?=
 =?utf-8?B?b1pablJJQjdRMStGRHBBRENZYmtEZzg2T25ndUpIbE1qUTh3ejRSYjZwWGRQ?=
 =?utf-8?B?NG5NRVB2S0Y1V2RMa3EyZFg3SFBjRi9WSUdjZFNoazJVRjNCMnM2emFtcmd2?=
 =?utf-8?B?K0R6aXc1eTdNbXdLR1gyQzlJbUFwM0pUWnhUWmd1bExSRjN1RlY1MisvZ1h5?=
 =?utf-8?B?Y0Y0TmtNa1RFUjlhb2JhT3F5ZjJZdzVSNUw4TVlpcm4xUWNPODV6M1JoRVhi?=
 =?utf-8?B?SjhyN003WjV2MVZlOTR0Z0RuUVJaQ21qeU40blZ6TmFCWmRmNm1HWTA0YklG?=
 =?utf-8?B?VHJBdTMzSFpWcGlBVGgxS08zMzEzQy9jcCtqNTVoZzhCc0JGMDg1TTNRcC8z?=
 =?utf-8?B?bWVPN1Y3dW9sc28xTXRUV1YxODNvY2wxeFM0WVRTZ2thSEllTWJsL3JUTTJt?=
 =?utf-8?B?eGhRQUM5NW02TVhWKzJBSlpVSE1GNmgxK2VpQUN2bk5MVGd0NHZ0c1ZabTBE?=
 =?utf-8?B?MldtbUNiOFhxNlFzNW85d0RSbE9vbmJjZllXQURkVHZxZXkrZnhMVEgzR0ll?=
 =?utf-8?B?ay9yb0IvRXRVbmtUell5dFJ4WVkwTmdGeUNDL3VQVFBXQklFOGtKRURIaTNz?=
 =?utf-8?B?bDBwSnNwdXFGVnF5Q0NkNWk2SFZYREJ5VXFLcnFGOHRCT3FiYTNueitJdmNa?=
 =?utf-8?B?SlJHMllXeDZDUXQ0ZjBjWGltZEtJc29TRVp1OHVTb3BiczdNUFNYK012VjE5?=
 =?utf-8?B?aEpqUDFTeHZrSEhJM2pwbmYyVzh2alBjQ1lXRUNEWElOdG41clcwL1MwL1Z6?=
 =?utf-8?B?aklDRHZBd1B5R2hLTkVPNkV6SWlYeVY3UmdvYlQ0Y3FsK056bTF5SXVVMVZ4?=
 =?utf-8?B?bVZ1SEdmUEUzbmFpVmZDaFk0TmtySTczSGRWTDZCZCtnZllmalY3YUhVNjVG?=
 =?utf-8?B?blBqR3daNzgydk94ekpmUGZBSzhmRlBTY2hmYVc2Y3lPTTc2d1Byb09MakRZ?=
 =?utf-8?B?VFJQaHJ2bFl5NG9xYVpBZjZpZHc3ZnQwTXlFaThCZVh4T2tJTEl0Rm5nNjVz?=
 =?utf-8?B?aEJDdkNTb3hjQjR4VDZFUWZteTJuMU0wRGlRRmFRdmQ5V0RCOUZiR282TEdj?=
 =?utf-8?B?TFp3T0FDa3YyY2FJUW41b0UvMlNEYkFkay8vdGNVMEVLMFZzbTZBZThBdGR4?=
 =?utf-8?B?VC8veFNwMkpveTZ3TkZweXNvNVZydUIxdU1WazYrVSt5VEZMSmZNMWhhR3Zi?=
 =?utf-8?B?c1BhbDVsWkw4eTB4LzEvaHdnLzJ2cWxLQWo0U0lsQjdmaUcwMlB3dm5XOFov?=
 =?utf-8?Q?8VZ29/L8Wh1Bg1fi6ZtgK6eEx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c4f725-dfa3-41f8-9374-08dc9b802b0d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 16:49:56.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQ7WCDCllJ4Jh9wNyI8XrhSEwnL+Wu+ykre6QfOhhbfIx8zNPUl9dKOo3KOAZxnV/hrTnHKS3wXBgRuwY/VQJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10628
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
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert fsl,qe to yaml and fix ls1043 dtb check warnings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dt-bindings: soc: fsl: cpm_qe: convert to yaml format
      arm64: dts: fsl-ls1043a: change uqe to uqe-bus and remove #address-cells

 .../bindings/soc/fsl/cpm_qe/fsl,qe-firmware.yaml   |  48 ++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-ic.yaml         |  47 ++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml      |  71 ++++++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-si.yaml         |  40 +++++
 .../bindings/soc/fsl/cpm_qe/fsl,qe-siram.yaml      |  39 +++++
 .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml | 148 +++++++++++++++++
 .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt      | 178 ---------------------
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |   7 +-
 8 files changed, 394 insertions(+), 184 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-ls_qe_warning-f8a81f53ea23

Best regards,
---
Frank Li <Frank.Li@nxp.com>


Return-Path: <linuxppc-dev+bounces-1677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5A98907E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 18:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XGChL1fGBz2xxp;
	Sun, 29 Sep 2024 02:38:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727541521;
	cv=pass; b=acxsmxKEaq0EQdSwMIw6m8qdjImDpq2yw8yt4Vm1SvwgKOwKzL7BoSSg5kpOIikBd5Vw9uT3/7HtdNG38P4BwYuThJKr7e0TdRthdOCsMlBgNxlarakRQtKrW17DtIk0sqhbgCKKXaGSNyEVS9PFYUnlV9z9bvQ5sTag4f0KMlVTASXhYm1A75ae0hKrTgrzLLsBQfmb9g84op8uAsiRuyzrCtJw9I59nFuCgGpUiAQXy5D8jNz/FB3hH80heHl7wkCVaZQ5ivJOJwL9n63U5vOlBUGzi+O3uR8DGI3PlwI0oBb5/5XZcFrmCYyBHzeLkMqZvUiYYDo8KJ0S/1PW/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727541521; c=relaxed/relaxed;
	bh=KHpNKiPDdNlg93mB10INuSMvQLehZaDw/zYzhPmIcmw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A9Ecvia0zNFZDd6rOKijrqhUVuU1syJbyqW/L6MESAM2cBZBZVDSLYytjBRG01LtWyyH+fjIo1n0KOua/MDUdSKLaxxQpUJ2WXmw/WPm4pzk1xUXXGWodApsHpWi0dE/57172f+Pc50fAuDldK1ZEOFWm27u+HEjJujJVq1lh0G6oH1BpAJSzJXjnSLQx0ZbIyCjYu/whhgfFWMfjxXBQ9NgDlcftvgFk/tLGIOi5jiEqy80v8t3sn3tOSJVR9fOI3IVePjiKLBNlp88ok/23lYJLHxwNFRrz1v0u6Lmh1ZBk25L59kvfT7Pfnjzf3lsXdgsTVqq1Eq9JzlKNWJ8iQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Ehs2ek2v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Ehs2ek2v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2608::619; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGChJ51fGz2xvH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2024 02:38:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2ivefGfUyG6tsdR1hpgdyUKFgCL8XgnuViQIbX9AvOU5xC6jQHcve2zHhI81sh9x+iV6rfnfsGt0j1amjAu3x/o5dcsFN2jPM9ToxGj4yK2kYa2pwY7ec5gJHuCKS6+i0kT3KcJn44amffMhrGMpExvXG6U5P4QS4jvt8gqjDoWVsAQRMMZcPvXkwE4mBHz+BvGuWdAS/AauRZvSkBzl76DI/zO6AH7oUizLcS7Vf9RCokQqmJidykKLQRlPheHKFK7uhSasqI78EbVVcAzZeyHe1i4vxxlK2Gc6kgFdHGBroSJKGk06E7d0dAlrENZu1fch8dh6xxIRswXsZ2neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHpNKiPDdNlg93mB10INuSMvQLehZaDw/zYzhPmIcmw=;
 b=cAgvAOKImBEUxFYIBbXyXw/aPQO3hi27p6jsjmLiT49adwaHfKU+yBNfH3WfofSu9Wq1oZqT+/a0ecyqIjNgTnupz2TpFy4VjMuaO2tTjG4qhX3Y/meJOx9TsSB2foIj4Qy/QoT7Xoq/cHWGZ/4GrA38sZ8HYG4FWQYs6nJg5PQHLU51k8513DxFqKRIR+7/du/pXLz41uRfjY6cbjUVCckbboHqvCcBai/0HRRTowmegKzS7ITlZbb+FZksmtWrhdwcJhPa/XY3A4Aexz8VEl8BwJDjOSt5uZlLsCuqtcDLgS63P0zyEV1z4Dj64jEQ05FfmatjaLT8oXZiPd+8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHpNKiPDdNlg93mB10INuSMvQLehZaDw/zYzhPmIcmw=;
 b=Ehs2ek2vLe3KI3wpP8fVAORvWfq9IYbxzALe7Do7Eb+xDP4XJSb1azMq1ASqbIQiRP7ZQQFc/D97hYiO1A8UFXFUZPfa+OYaaMLXXERIfd8eQcAN3nuX/r3K6QLOnytUZyjRDuul3/WM9XdcCrtfQq2PsOwnaEUU8qGra3GJHoW7uHRq/gJZHUccmRV+84QSNlAikIVNsAzXOOxy+tTGjwpi15l6JsBU/zk0axQO2/G1gVCe/VKqRDRoYZRWMLYqH03FWSz94hzOUrRxhMfCyWRmWQwTTlofZjm4RnBj/H8Ditq/m/6Nc+UrgSuWRvAnL/p/0f7Qx51lnG99PsDU8A==
Received: from DBBPR07MB7451.eurprd07.prod.outlook.com (2603:10a6:10:1f0::13)
 by GVXPR07MB10056.eurprd07.prod.outlook.com (2603:10a6:150:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Sat, 28 Sep
 2024 16:38:14 +0000
Received: from DBBPR07MB7451.eurprd07.prod.outlook.com
 ([fe80::9f1:2f75:4c63:9c03]) by DBBPR07MB7451.eurprd07.prod.outlook.com
 ([fe80::9f1:2f75:4c63:9c03%4]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 16:38:13 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Florian Weimer <fweimer@redhat.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
CC: Peter Bergner <bergner@linux.ibm.com>
Subject: Re: Are 256K page sizes really a thing (on ppc64le in particular)?
Thread-Topic: Are 256K page sizes really a thing (on ppc64le in particular)?
Thread-Index: AQHbEcC3kz0X62Wa4E6HS1ud4IdzYrJtZhwA
Date: Sat, 28 Sep 2024 16:38:13 +0000
Message-ID: <eac7d905-b998-45c0-b3d5-c2f59bc37d69@cs-soprasteria.com>
References: <87cyknzrpk.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87cyknzrpk.fsf@oldenburg.str.redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR07MB7451:EE_|GVXPR07MB10056:EE_
x-ms-office365-filtering-correlation-id: 40a1ee08-d068-49d0-0612-08dcdfdbf217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVhGZjFkVFZhSi8zSHVrbHNYVGthTlNwZElrT2REcVdLY3FDTXdkK2UrV1JW?=
 =?utf-8?B?WmlhQnJ1bVFhUkZjbEUvY2xJNTVqNVZkVmprWTI2N2lnVWdKRjRIMGdoYTh2?=
 =?utf-8?B?WlY2bDhCZUh1SW1GM2p5aDQ1Q1RaMll5NTBsa2FKNloycUNldlNKZVlCSlF1?=
 =?utf-8?B?bWk5d0luWUdqQVRBMTdRK2RDQUk0OGZMUTRPSTkyMVpDaEE3R0E3TEVDaWVU?=
 =?utf-8?B?MlhIV3Y5aStnZGZKZHUwUnR5MytUNHY5d08vandPTi9Zb290SXBWSDNTdkp1?=
 =?utf-8?B?S0VPV2dKRVJUZ0hQdk8vYWNxdFg5SHkrN2RoM09sa1VWU1BYcnFPOUg3dTgr?=
 =?utf-8?B?ZXFmUzZNdFhFNTk3eE5Wd0V3di9VUlVBOStPWElmWDRyZUx5cDk0enRyWnNl?=
 =?utf-8?B?b1VJYTBzWDFLN1kwREtLU0ZodHdqQUZ2SWc3TERPTEI4MVNXai9RQlZtNk1T?=
 =?utf-8?B?cXg1MXNGOFBwdWJZSUtLTXNzb3R6OCswc3VGaHRxSncydUUzSGRGWGxXSnBR?=
 =?utf-8?B?em5QL2grNWMvdERjbm4yVUdPTWdQVEl4WHRyUENZMzRtVUFBR0J2NW9OTTZX?=
 =?utf-8?B?bE5pRG92bjVxc2RacjZRVE5VeVVFczRCZWZvQkVjV1crS2hKT0R6WG5NL3Uz?=
 =?utf-8?B?ZVMrRGRHV1c0SUNBaTVMWUdMQk5hWUxGbU95b0RMcnRCTHZmODlFQmpwUWFq?=
 =?utf-8?B?ckVDTUZZMW5ldGFTL2ZSUHYrOEVjcWtCejJhQlFLSGJQczlBZzhxZGQ1dmlR?=
 =?utf-8?B?VEJRVnBIdUsvQ3dQMGVCYmhlVTdVTlM1dTlTQ08xSHV4Q1hRdUhCWkNCVDBR?=
 =?utf-8?B?bUN1QVRBLytnMy8zZitEVTdPRTB0YUh1NFRCKzNuTE02dk1ZL0I1Z2FPR3Mx?=
 =?utf-8?B?Q1JwOVA1N01hL3NrVDdBcXNOYkNSSU1OWXlkM1VHQSsvby9QZ0x6c3NuZUI0?=
 =?utf-8?B?bHFjZ3ZpUFFxWHBVMkdDK1NyUGJvUy9DdHVJZUcyY1J4RHRjekN6SWt1QlJh?=
 =?utf-8?B?SEs1WUVvdzhKd3B1VElnNm9ROGxpKzZRL3pQWXk1Q3AvR2FDNkV2Vytrd1NU?=
 =?utf-8?B?Ym5BTzdZQVJ0ZlBXREljbllGMUFQbVpJRWZQLzZCbXptOXlPYUNvcHhMRi81?=
 =?utf-8?B?KzVUMUdDUWNZK0NSRzBuZ1J0S2JhYmpHdjU3dDZEWTNmTlp5ZjJOVHJYKzJv?=
 =?utf-8?B?Ym0xYmVwQjMzdVBib0ZISmFFMGxNM0xJRWowNUVPeVlxemgvZ2xlcjBQcCtz?=
 =?utf-8?B?blB0S1RPSnhLOGwxbkRVdFBPMWZMcWRHY1dWU3R3YmxwTWtUcTJMR0tnOU12?=
 =?utf-8?B?NFFTMlVNNnFFeFJiODdxRXJnWURyUVJhU1F6MW42N2tRaHBDTXdxSitZdTJB?=
 =?utf-8?B?NVBkWExrUXhxaUlCMUNrUENQc2tvaCs1bWFZay92YlhVRzZGUDVjazIzc0VF?=
 =?utf-8?B?Mzc1cndZOWdzSkdrdUtCdjBVY3drTlZ1dTJYZ21KbzRyV01mZXpKcGtIUTZs?=
 =?utf-8?B?L3M3Y051eEQ5UEFGQnEvVENON1BBby9KU3V6VEZXZ2loMUtwVFZ1dlpxK0tq?=
 =?utf-8?B?VHpzc3crUVRDRDY1Tm96SDhLOFpianAzYS96ZkNvd2dHYUxYNEhCTFR4bGpo?=
 =?utf-8?B?UEN4Ny9IVHZkb3dFbTVMOFE0T1FvSzgzclFIVjlkZExUaDhLK0VqcnpPZFZ3?=
 =?utf-8?B?b2E4Wmc0U1NjNHpCR2JXcjFCSjNIYnNJOHFNMVF6dk1LeGRNVlJrV1dNK0xD?=
 =?utf-8?B?emloU1dqTzVTbDYyQWk3MEplNzJmMmJKUWc4azJQbWpwUW5yTUFsZ2NnZkJk?=
 =?utf-8?B?UHpsTjZmc3M2a1ZjVmlRUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR07MB7451.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHM1a1BRcXA2bS81K0RMU0dKN3BQa0IxeWc5d2prMFNSYXpxcHZLM21Jbk95?=
 =?utf-8?B?cnlDRzdrUVV1ZDhxWXJmSVNsSkY4QmxrZk9FTjdNR0VyZllkTWNMMDZPb2Jz?=
 =?utf-8?B?MzVLMTdnT1l2eUpSTmtXRlVLOVo4emgyVmdlQTNpWWdLYVR0WE5iR1dVRDls?=
 =?utf-8?B?V1BNeU9mWjc0YXNhMVFHMU82alpzV3IyU0pMcXZBZlpJU2pOYTJqZkFNWklG?=
 =?utf-8?B?d1ZBMGw5cWFjL0R5aGlHQlpnbXNLWStOVDdwRkFQRWNVVDZqbXpDWklMKytv?=
 =?utf-8?B?TWZKa0hGQmFJUHBvamZBODZsMXVHWU5CTm9Nak91akkrODVzR2IxOEpPQ09F?=
 =?utf-8?B?WE9pU3hKN2k5NVdNd3o1bUo0SndGVHJoSC9yTWRHbnFNRFpmSXp4aFpSNkVP?=
 =?utf-8?B?b2JoNFFYMmFmRG1WS0JOVWRKRVFueUJiTXhxQkx1VTdIcmZ6amRDRndwKzhs?=
 =?utf-8?B?aEJTK1ErUjlncDZXczBIWWJDRlNaZkh4UGphaUNJNlY0ZWlYb1JIZ1lyektl?=
 =?utf-8?B?SWR4blRBSytuc0paL3VHZ0dYZTEydW9JZE05b1BsWXBwYVFyK2tnb0dwaFI2?=
 =?utf-8?B?azNjUkZ1aUZvSGtmbmlmdWVLSmN6bzJuSU5VcnJ6NGkvNXhRYkZBZlFwb0h5?=
 =?utf-8?B?OGR1d000d21BRE80MFh3VExmTGFCV0t2QkZmNW04RlVaYjBiSXBnM0dndEM3?=
 =?utf-8?B?ZUlZV3h6dkxweVZvYlhoVlhubG1HTXJBeHFpaFN0UzRWOVNBcTk2dFZmUHZM?=
 =?utf-8?B?akhLNnVyV0JmMDM5bUlnVXhlMTN4VjdiOGNGekFsdU9veTVEVHMwOTROREZX?=
 =?utf-8?B?TlNTaURUUlVqaUc2ZzJSQjRPOHlJQWMrQ2x2YmR2TkdWTHB2MHhNdGIxZ3lQ?=
 =?utf-8?B?MzRnNUdiQXFTU1h2RGR1cWlNRkZZdUpCZ0lRQ3lIc29OK3Z1cStVN3o0NVRD?=
 =?utf-8?B?NjRTZXlURjdvclBVL0hjRTA4TVdlOW91RnFVMW9XQkRwQi9FUlRhVlJYOHps?=
 =?utf-8?B?ZlI4ZXZnckhJa2ZmeGdOSjR2TXVORWUvelAzSlNjWkJlRFd2Y3V1TG1MdEVD?=
 =?utf-8?B?UkVMSHh4Tk9nTVVmOTYrN2EydW1obXQxcUREb0lGRUpyNTRhYVdJTUI4RlpI?=
 =?utf-8?B?Qk9pVVdaYXVWemV5TVJBK3JLZDV1ZW1POWZBb05pRlhrS1hxVGRPZktEZ3p2?=
 =?utf-8?B?RkNBM0NhaVZFbEVhb2FRV0p4dXM5aVRwRjdBL3Z3ajlSa1J1Nlg2SmVXSzZM?=
 =?utf-8?B?eGVhTENhTTZ6d210RGZrUG5iMytHeGpzVkxQS3NieFE1dTVENXUxSzVCbm83?=
 =?utf-8?B?cmJQaFNURy8wcW1Udk96ZGRZcDRKZ0Rvclg4SG9sRkZwY3NlU0hnMmNkNUt5?=
 =?utf-8?B?cTZzVnB6K0NsdFVKalo3d21xdEQwdDJGTVFPMXdEc3kyU2M4Z2xNL0Q2bERN?=
 =?utf-8?B?KzQzdUtmSExFK2NJUmpoT1hRV2s1bndhNFhyY2t2M2pXb2hxNW93dlM5UFZs?=
 =?utf-8?B?THBObXV6bEVSYnZnRWs0S2tvNkJTV2h4aXg2RW1qUldtaXBuYjh2aVZCNE54?=
 =?utf-8?B?ZmlwSkhIT0J6Mkw2bUJTbng3akZPUzRlSVRocVZDTnN4eFdoc2xGdFdyRkV2?=
 =?utf-8?B?MG5ydjFtd0I1U1dxNXZrWVRvNTNra3lLTWtGOW5lL0NYdkh6emFFYzRDMVlm?=
 =?utf-8?B?UVZkc3ZVM09aMlpwamNUcUNZYUo5ZkVhMURiRXoxVit6ckVBa3Vnd0JxZXVP?=
 =?utf-8?B?RWE1MVNGYVB4SjNaSDJtNDJNSGtqTDRIT2dNZHROT25PNVVyTGUyZmdLMS9p?=
 =?utf-8?B?SkNjR0hnZDIrQkR3dGRMb3ZaajVZaWI1QlA0anJRYW5OUXRNem1qSmNaeGx3?=
 =?utf-8?B?czZPNjZweVp5Vng4dm85U1Y3TUs5UFZ5N1lmWUQ4TTBiZjB3dUgwY2wxZWxh?=
 =?utf-8?B?bkJCM3E0bnYxOTQ2VEErNW5NaVYxMWJLUHAxdlRjLzUvQTRnS1o5WHh3elJZ?=
 =?utf-8?B?cjZPSklYenM5UmJ5cUNHN2RPVnZ5Sjc3NFpvbGZDb1JZNkpBcmpEbWo1VWNn?=
 =?utf-8?B?Z0NzSE5VMTJOY0pEWHl3UWQvR3JKcmxSbjBZY3FjM1RZaEtidmNpc0ltTDJN?=
 =?utf-8?B?LzczcXJVbExvSFdsSzZOeGZnbW9pVnh1cTNEZS8vUzhMNFF1YnUrZll1clNC?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8E8A6A391DD5748B4732A961842B05C@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR07MB7451.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a1ee08-d068-49d0-0612-08dcdfdbf217
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2024 16:38:13.1657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICuRmIzfdju2kWMm7TgQzrzSJG8613YBfbCPNX7NWjYmAJ7G1C5MCzoKZQNEQ5A2lMih1waKKU3zlRpAD+weQTvEMVUk0dgLsTei1Z1+IsdfJTefZGQKFp7kRr/ywhBn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB10056
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: DBBPR07MB7451.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: GVXPR07MB10056.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on boromir.ozlabs.org

DQoNCkxlIDI4LzA5LzIwMjQgw6AgMTg6MDgsIEZsb3JpYW4gV2VpbWVyIGEgw6ljcml0wqA6DQo+
IEknbSB3b3JraW5nIG9uIGFkZGluZyBhIDxzeXMvcGFnZXNpemUuaD4gaGVhZGVyIHRvIGdsaWJj
LCBzbyB0aGF0DQo+IHByb2dyYW1tZXJzIGNhbiBlYXNpbHkgZGV0ZXJtaW5lIHRoZSByYW5nZSBv
ZiBwb3NzaWJsZSBwYWdlIHNpemVzIGZvciBhDQo+IHBhcnRpY3VsYXIgdGFyZ2V0LCBmb3IgdGhp
bmdzIGxpa2UgcG9pbnRlciB0YWdnaW5nIGFuZCBtYXBwZWQgZmlsZQ0KPiBhbGlnbm1lbnQgcmVx
dWlyZW1lbnRzLg0KPiANCj4gSSdtIG5vdCBmYW1pbGlhciBmcm9tIHRoZSBLY29uZmlnIHN5c3Rl
bSwgYnV0IGFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGlzDQo+IGVuc3VyZXMgdGhhdCAyNTYgS2lC
IHBhZ2VzIGFyZSBvbmx5IGF2YWlsYWJsZSBvbiA0NHggbWFjaGluZXM6DQo+IA0KPiBhcmNoL3Bv
d2VycGMvS2NvbmZpZy1jb25maWcgUFBDXzI1NktfUEFHRVMNCj4gYXJjaC9wb3dlcnBjL0tjb25m
aWctICAgYm9vbCAiMjU2ayBwYWdlIHNpemUgKFJlcXVpcmVzIG5vbi1zdGFuZGFyZCBiaW51dGls
cyBzZXR0aW5ncykiDQo+IGFyY2gvcG93ZXJwYy9LY29uZmlnLSAgIGRlcGVuZHMgb24gNDR4ICYm
ICFQUENfNDd4DQo+IGFyY2gvcG93ZXJwYy9LY29uZmlnOiAgIHNlbGVjdCBIQVZFX1BBR0VfU0la
RV8yNTZLQg0KPiANCj4gQW5kIG5vbmUgb2YgdGhlIDQ0eCBjb25maWd1cmF0aW9ucyBzZXQgNjRC
SVQsIHNvIGl0J3MgYWxsIDMyLWJpdC4NCj4gDQo+IFdvdWxkIGl0IHN0aWxsIG1ha2Ugc2Vuc2Ug
dG8gcmVjb21tZW5kIDI1NiBLaUIgZmlsZSBhbGlnbm1lbnQgdG8NCj4gcHJvZ3JhbW1lcnMgb24g
MzItYml0IFBvd2VyUEMsIG9yIHNob3VsZCA8c3lzL3BhZ2VzaXplLmg+IHByZXRlbmQNCj4gdGhh
dCB0aGUgbWF4aW11bSBwYWdlIHNpemUgaXMgNjQgS2lCPw0KPiANCg0KRm9yIHBwYzY0bGUgaXQg
aXMgZGVmaW5pdGVseSBub3QgYSB0aGluZy4NCg0KQXMgeW91IG5vdGljZWQsIDI1NksgcGFnZXMg
YXJlIG9ubHkgZm9yIDQ0eCB3aGljaCBpcyBhIDMyIGJpdHMgDQpwcm9jZXNzb3IsIGFuZCBhcyBt
ZW50aW9uZWQgaW4gdGhlIENPTkZJR19QUENfMjU2S19QQUdFUyBoZWxwOg0KDQoJICBUaGUga2Vy
bmVsIHdpbGwgb25seSBiZSBhYmxlIHRvIHJ1biBhcHBsaWNhdGlvbnMgdGhhdCBoYXZlIGJlZW4N
CgkgIGNvbXBpbGVkIHdpdGggJy16bWF4LXBhZ2Utc2l6ZScgc2V0IHRvIDI1NksgKHRoZSBkZWZh
dWx0IGlzIDY0SykgdXNpbmcNCgkgIGJpbnV0aWxzIGxhdGVyIHRoYW4gMi4xNy41MC4wLjMsIG9y
IGJ5IHBhdGNoaW5nIHRoZSBFTEZfTUFYUEFHRVNJWkUNCgkgIGRlZmluaXRpb24gZnJvbSAweDEw
MDAwIHRvIDB4NDAwMDAgaW4gb2xkZXIgdmVyc2lvbnMuDQoNCg0KU28gMjU2IEtieXRlcyBwYWdl
cyBpcyBhIGNvcm5lciBjYXNlIGFuZCBJIHRoaW5rIHRoZSBkZWZhdWx0IG1heCANCmFsaWdubWVu
dCBzaG91bGQgcmVtYWluIDY0IEtieXRlcy4NCg0KQ2hyaXN0b3BoZQ0K


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DEF92DA8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:05:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=W7dVUZxy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK9PC0yBqz3fpS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 07:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=W7dVUZxy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260d::601; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK9NW2D1pz3fTn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 07:04:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfw+JkTvZ2l0lH47jXonn4pTNtSuzZyAgTj7kzIeoOwhPaWYh3zPmtW9sKESjGQSx0+PaG7F0lGRIUfeGnXXPCGfr3LLEeVDYpCyzqlipMCmt5Broly/AwdOjU/RKkAZM5Oz3xzV1cln3xJJgTLMmxSPw6zTTx56WyP8eXFiCMI40n6s4JZC0+9br4TTCqDcBo+EbRqxBFT0NMv9JBweXFDJ/BpgVvopJdm/Rmzw4DsN9G8Yp7Al3+WY2poGyr7F2bQKn7DaUkCjE1uwi6rgjv8M7XhDL8bSF/suC0AEYfF/tLdPntZeBbAEUHd3/BfcJ2HWHG99RfxHBHkFiXOtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dil3ToE+wj6QVK+5dI5ideJ7KSkjNCPijwf1rztWCM=;
 b=Bp5FFkujHR3MDr+eGHrRd+CLji7soNPVN9XcXnra+mEIHGJ0407eeFTh/2s10iNStmoy+6PiBLwJHPfg+acgs4t6Gatjx8bR/GajlvT/7rp6J/bK2SiClYMP4osyzLUzRpWE+O3kYJ5y86D+6EO0/zfOAxSh8YmPwwcZjgHwbdi+uou3k6JUk/ihsMFkZIsnsknNiUR0qNGwUZDqd1sXQxj3XP4mgWz4hoEpJRaZ4cY4FufZDYxZUYUYJBHsl2fQdpS1tOcoXGMVtKeBWObEL09/4GubHUv5fSKKl8RWrkgOWZAWH+/Miwxshw7sBrOpVij43tKMLL46U45EIa0CcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dil3ToE+wj6QVK+5dI5ideJ7KSkjNCPijwf1rztWCM=;
 b=W7dVUZxywIcXXjPRWYhf/PQzLbDn2pEbW1Vg5mXnJ/C8plNxjg43+ZdxWji3+r5C3p8VMPkP+5CsN66wWUiZANXMCXqAsinkQ43p/WALxDyckU5R8wCJzqwjSwrWVtXMolwRmMQLOwjFcVzHeQ/fggFNh8oJnv1ZuoYZj+qC9mTijxJgqA181gqfMlD1tnub+vjTQd5usyIB7qjEhvt3zb1RgmGmCXoAOWVdzDAPY0Lt/VOi42wkURMrWQK8tWKibgzWxy8jHE9zv3IDqg5yHmxPhaRaWo4hsKq7fhnTvvuTZAfUKdeUTKYvdRd2ryCvonE/Q3PmjFQQKQophWUrQA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAXPR07MB8517.eurprd07.prod.outlook.com (2603:10a6:102:2b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 21:04:39 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 21:04:39 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
	"sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, Jiri Olsa
	<olsajiri@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry
 Safonov <dima@arista.com>
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Thread-Topic: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Thread-Index:  AQHazj/73szxdShcFku5GHM/3RSbbrHszwWAgACDZICAAS53gIABa9WAgAAE/ACAAAPMgIAANR+AgABSb4A=
Date: Wed, 10 Jul 2024 21:04:39 +0000
Message-ID: <b2d96e08-e64c-4dfe-81fc-cbbe3324b4cb@cs-soprasteria.com>
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com>
 <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
 <874j8x5t4e.fsf@mail.lhotse>
 <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local>
 <7161cef3-49e4-4057-8a66-ec1ad6eb3f9e@cs-soprasteria.com>
 <zu7c7h7apzzo3amki5vz32v77bnkj46h54k4662tn5naciv5i6@d4uo4rdaoxlk>
In-Reply-To: <zu7c7h7apzzo3amki5vz32v77bnkj46h54k4662tn5naciv5i6@d4uo4rdaoxlk>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAXPR07MB8517:EE_
x-ms-office365-filtering-correlation-id: 897ae809-cee1-4ddc-1aa6-08dca123e9c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?eFc1ZmlsaDd1a3JucU8wYzNYaGMxUjVQRWNxUzRSU2pJUHl2bktEL1MwWW4z?=
 =?utf-8?B?N3UraXNtL0RmUXd6T2lmSkNqRU5ydXd4SEliWHh6cUhOdnU3OHdaZVZjbzds?=
 =?utf-8?B?YWc1MVZRWVUyUUZwK1R5NnpQVDZvcWZsT3lIWEVMYUN6K2daUmsvUUl5ZlRY?=
 =?utf-8?B?T2ZJQjdnZDVGdGVTZC9YSHhUNFZmNi9QbHVuVlBQTnNqYVdrUE1uTkFuQWZM?=
 =?utf-8?B?WUVnbnFRK1pJdVh4Sy8xZXJxYzR5RHdmbVFvU1VHL3lmZEFBdUZTWUxlVURV?=
 =?utf-8?B?NTJSNzhzYVVGWExCeXI2ZXNPZXpSS1N5SCs5NjlBQ0pReEdFOU04SnVDaFpv?=
 =?utf-8?B?SkJoMkNEemNzSEZ2SURmZzhaMVlIWGw1MGt4N2JORzNET3Nrbyt0UE5lcVJp?=
 =?utf-8?B?V2FSL3ZWby9aazBBbjZ4WDkzU3p2d1N4dFF1N040eXpicW9HeERITUdDM0Y3?=
 =?utf-8?B?b2RSUDR0dmVZZDkrYlo5R00yNUh2MW9OempzY3BlVS95S3RtQkptL1RuOS9G?=
 =?utf-8?B?RXFORmI0dHFqbUlKL0R4aVhOeE5pS3kxSHJ3dDE4VldSOXVwazhZOEpEQVkz?=
 =?utf-8?B?N3pwOFNKRlZOK1dyQXdiSVVPT1VGRXpHemlkTHh5T2VJMHNaRHVBWHpiNXdu?=
 =?utf-8?B?TXMvSlVVSWFJTFQwZk5zcDRzWnZ3c1YySTFWSjZsbEVrVmlURVVJSzlHRStQ?=
 =?utf-8?B?eGZOa0NVaGJlWWJ2VzdJSm10WTJUM3R4SGZPYWp4QWVsTjJadk5IVHNXeVdO?=
 =?utf-8?B?c2lWTUl1bXlyZnBtTDhpWWdNaEowKzIxcEp2ZUphRndNcFJqUEhGbnZxS240?=
 =?utf-8?B?eVBFc01UT1paeGxOczdJclFoNUtxK0lvVWtrQ05pRDR4U3Q1TlBYT0NYNWlt?=
 =?utf-8?B?WFAwOGZ5SXROMkVXK0UzS3U5T0EvV0R2eGQ2di9YZkFTdXVoNEhDWjhRYmRP?=
 =?utf-8?B?YmZ0QjdqRnBCTFp4ZXJSNWhrbkUrczlCRElPcVZxeCs4ZlJzYUxkYVZUd0tn?=
 =?utf-8?B?KzJFcWROVmpObzM0aXRIMkhpclJ0YjVycDVYQzVOZE1kOThXQ205bzJFTmZL?=
 =?utf-8?B?RWFJMjAzWHc5ZE9jZHV3bEFsVkFROUlSanRKQmxnYitTSGFLK1ZhbjhpNUNa?=
 =?utf-8?B?SG1FVE8wTThvM3IwNUV2RThOczdUc2FwbHlvYjZIVnA3N2g5SjJCb0ZhNXNG?=
 =?utf-8?B?cmZ2V1BwbVRsa1V6UU8zenZyVzRVekFWYkM1VUhiRFd4WFNOVkNHQnZHTDBo?=
 =?utf-8?B?bzBpT2xQVXB1SkJBZlRWUFl3WE9qZTc1S2F3Y0NrMmNrTlpodUQ2ZDJFa0FR?=
 =?utf-8?B?L2dqTlVGSEJPcGZaeUliMW5TRFdvS2g1bVFEV3pUTGVuMjRmQ092QnNGTWpX?=
 =?utf-8?B?YUVkbkNZVTVFenZ3dDhjYVByNCtEN2xCbkJJOW4xU1VSU3Zmam5rdmw1OEYy?=
 =?utf-8?B?bjU4RzI3TGlxVXI2L3FZTXNueWRQanNwWkIyMFh6eXBmYzRiNG85aXRMblAv?=
 =?utf-8?B?dGs1eUNKbU1oTlBaeG1zTXA5QU1PaE8vSGdsa2o5Zjc0aHNCVzlPODFPWWVv?=
 =?utf-8?B?YVRsMDZzbjB3R2lxU3I4VE5zTGhwbjd3SGM2bEJURWJDMVczcVRibWNYYXUx?=
 =?utf-8?B?N2hERkpqaXM2S1V2c2J3V2h1dEF3aVY2Z3dtNDYvS1ZSVGt0MDhZVW1RYXpl?=
 =?utf-8?B?aGpmVTVIWlpVcW12V0gyNnhndTV4OEZDZUtrVk5ubi8wVGxCVFBXdVRYYkFl?=
 =?utf-8?B?M2pUdkJ3VGkrRW1IQXZDc0NSenhDTDE4VG5KRmwrMk8rWkhoRDhrN0YzSDVD?=
 =?utf-8?B?d213SytKUXorQnVTYjN1MGFOcVBQYkxQTXNSVFo5YnhUMkwrUUlBQVlRMk5E?=
 =?utf-8?Q?sfaKWDVL7yw5r?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M3RCdjlWNlhkVFFuVlRRSnY2OVo1b2hIeWdOUmZaM0J0bnBSeld1WHdzVzV2?=
 =?utf-8?B?SmlUMGZyY3ZpN1pDcWhTNnNITlo0OXVBdTU1NXdpRzhQLzE3NE5UZGpGbitB?=
 =?utf-8?B?bGUrWmxiNnUvTThpNjBVQk1rYzVmK0Y2d2FFTXhkOFl4eHlWbkcyVy9vU3FJ?=
 =?utf-8?B?T0ZUZGJpbE5zaUkrWURMblFYaTNQTzQ3QnZvSVZ5alJnUllGVW9NWmZUQ09T?=
 =?utf-8?B?ajhoR3N2Uk9CVnphMjhzN2sveWdnSVc3RUZSbW5IeFV0eWJvYU5PUDVmUmtj?=
 =?utf-8?B?R0ZwZUxmRlhiU09hS29JejdCTjQ4RmMrWmIwK2hLY1RLeWdUUGNrTXBzd0hL?=
 =?utf-8?B?S3RXUWVibjgrbHJuRVg4RWNJVFRZb1lscGVtcW12NHMvT2lGVUl0U3JFOG1Z?=
 =?utf-8?B?UmIyTEdMR1E3Z2s3bXJndmtuMk5hU1ZtWnk2SDFtd3MwQm5HYmJHcHBDV2I4?=
 =?utf-8?B?UmxnQmNoRGZLMWRKZjdFWCtxYmtIMkNOdGVmTUIvalhteS8rVXRBTzJFRzBw?=
 =?utf-8?B?WXU1T3NhQ0ttbkYrWEE5MGRzSzdZQWo2V3ZVUWFwSEN6bmNwOG0yelhnSVFz?=
 =?utf-8?B?WXJLSE1nTm9lUXdhakdHUW5pc0xRVTd3U0dQYnZzS1F3YWJFa2RCSldZU2Vp?=
 =?utf-8?B?S2RnVGdUMEdZeFRQcUxkZWdxZkYvZW1ka1E2NEp0RE5nUWg4cG9QbEIwZzVZ?=
 =?utf-8?B?VXlLU1lFOWdzakU1bFptUU55QkN4OUw4a21GaHJFSWpFTDJhMkMxTzYwZ1kr?=
 =?utf-8?B?cDZHQ09VdEo2aEt3dGJXTjhyRmlQN2YwM3V3cllDS0NIVWYzclAyS2hHVXhv?=
 =?utf-8?B?VUZVc0lTbXZvcnJHcXBraVNoOWNXS0c1Mi91YjF6ODU4NGNUVTAyUTk2VGVB?=
 =?utf-8?B?RXBFM0RHVkErRGdlVDRhTGIwYkVqVUhYRmpVQ2lpNEV5WVJWd254QWg5Vy9F?=
 =?utf-8?B?RkhiRXRKWHMrNGNEZG1KWGYzRXZQV21XbTlLQ21BOWhDSHpmSXVwajNON0o2?=
 =?utf-8?B?M2o4WWJPMnZ2TVpTemFYK0JuRUhWaEtvS1VNd3kzcVF6SnE4MjQ5WkJYYmJa?=
 =?utf-8?B?VUNCcmwvcS9FNEtEQXVvSTUwaVkrYlZtcEdnZktyU0l3ejY5U1RuMm5nYlJ0?=
 =?utf-8?B?SEhySzR0Z1VzTGQ5TjZZTkNYTHMrT0dMamxrWGdqdXViUWxDT3RsaUdpaXlU?=
 =?utf-8?B?eDhWVEo4eGtLWjJjMC9RZmRWWk1uSHNGb2dkY1YvLzJ3T0U4V0tiVkdwTFhR?=
 =?utf-8?B?WlBlWDRCZytReUtCK24vVnRuZy8rRGlldUNia0Foajc3MXRHakM5QUdEUDFN?=
 =?utf-8?B?V1Q5Y2htV0o5NHRFdWpja005Rnhyajg3aUg1TVYyb0NHVm9jSlRwd241RG5s?=
 =?utf-8?B?RTJyZFpneUVjWkxobzJLWWVwVWJLVklJNDBQQnM3aXRNbzhZZjRiUGNXTW55?=
 =?utf-8?B?TUJqLzUrRnZHSWU3by82ZjRYOTA4d3ovaFBhdU1wWUIvT00vVll4UjVIRmZo?=
 =?utf-8?B?MFowTWlWSldYZ295RTJjV1ltODhLRDR6cXBYTlE4bEVEaUg3QjFxTDk4RDZR?=
 =?utf-8?B?YnJmeGdlaUtKUFl5dHJOMnU0aGZyOFQvYkp0d2cxQVprbHJvbzl1TWU4WERC?=
 =?utf-8?B?Z0w2OVR6NytPZW9RZnBsNVp4NEFWWEhEYnNIdGU4a2REZ3FPR0UxVldOS2wr?=
 =?utf-8?B?RlRqcHJvWUFxNUsyRnY0VTNyRE5QUDJYT1Y2WDVqempqMVV4R1BkaHI2dDFY?=
 =?utf-8?B?R3hmWlhnbVYvbDYyc0x2cmlxTTk0YVJNRDJTeUJEcDlWYVNxV241MDVtekhR?=
 =?utf-8?B?YlZvd01aTE4rTnFpcE1rbG4xZ1E4TWY1eUlIYmdKNlA4V295UjVLYmhzNHFs?=
 =?utf-8?B?V1g0TTFGODJyeHRZMWtkbGZYNXFqNjljMUJZeVBWVk9ncWkwTy9iNXVoUzZB?=
 =?utf-8?B?SUxLWlJKbytlMjJyWnl1TFBDOEsxdFR2MHQzeG9NZWNEZFR1MmVMR3Z5enFs?=
 =?utf-8?B?eTVOSkNRaytKSlZ1bDFiK1VSUjR0K2NNblh5bDQybkEvZUU5OStteXRZdDB6?=
 =?utf-8?B?Z2hUMUhEMlhVRm9vVzZkTzN6akpTQTU1a3ZSbkZMWEFzWmRNU1BPbUMzS2Zx?=
 =?utf-8?B?YUk3Y09wZlFDd3IzU3BGVGJyWm1Ka2hSdWhGOHVwNUxwWkpOMHRndEo2bDFW?=
 =?utf-8?Q?Q4VL6lrf44IhbMCKzVJm6xs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8272B0925481554F8AFD73E4EC926342@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897ae809-cee1-4ddc-1aa6-08dca123e9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 21:04:39.7163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ovDlZQao92JpNGpZ67YXlvWl7Vsa9liFs7KwSziQXjxwF8dsAZujLiCWzKEbamClKhQ9Q3JfV2WmP6HSutWZrUYB/EM/yl4v2QBmlqnUJBqPOtujfbcy5EnbHgMSXadN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8517
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 188.92.135.53
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAXPR07MB8517.eurprd07.prod.outlook.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjQgw6AgMTg6MDksIExpYW0gUi4gSG93bGV0dCBhIMOpY3JpdCA6DQo+
ICogTEVST1kgQ2hyaXN0b3BoZSA8Y2hyaXN0b3BoZS5sZXJveTJAY3Mtc29wcmFzdGVyaWEuY29t
PiBbMjQwNzEwIDA4OjU5XToNCj4+DQo+IC4uLg0KPj4+Pj4+DQo+Pj4+Pj4gQXNzdW1pbmcgdGhl
IHJlbW92YWwgb2YgdGhlIHZkc28gZG9lcyBub3QgY2F1c2UgdGhlIGFwcGxpY2F0aW9uIHRvIHNl
Zw0KPj4+Pj4+IGZhdWx0LCB0aGVuIHRoZSB1c2VyIHZpc2libGUgY2hhbmdlIGlzIHRoYXQgYW55
IHZkc28gY2FsbCBhZnRlciBhIGZhaWxlZA0KPj4+Pj4+IG1tYXAoTUFQX0ZJWEVEKSBjYWxsIHdv
dWxkIHJlc3VsdCBpbiBhIHNlZyBmYXVsdC4gIFRoZSBvbmx5IHJlYXNvbiBpdA0KPj4+Pj4+IHdv
dWxkIGZhaWwgaXMgaWYgdGhlIG1hcHBpbmcgcHJvY2VzcyB3YXMgYXR0ZW1wdGluZyB0byBtYXAg
YSBsYXJnZQ0KPj4+Pj4+IGVub3VnaCBhcmVhIG92ZXIgdGhlIHZkc28gKHdoaWNoIGlzIGFjY291
bnRlZCBhbmQgaW4gdGhlIHZtYSB0cmVlLA0KPj4+Pj4+IGFmYWljdCkgYW5kIHJhbiBvdXQgb2Yg
bWVtb3J5LiBOb3RlIHRoYXQgdGhpcyBzaXR1YXRpb24gY291bGQgYXJpc2UNCj4+Pj4+PiBhbHJl
YWR5IHNpbmNlIHdlIGNvdWxkIHJ1biBvdXQgb2YgbWVtb3J5IChub3QgYWNjb3VudGluZykgYWZ0
ZXIgdGhlDQo+Pj4+Pj4gYXJjaF91bm1hcCgpIGNhbGwgd2l0aGluIHRoZSBrZXJuZWwuDQo+Pj4+
Pj4NCj4+Pj4+PiBUaGUgY29kZSB0b2RheSBjYW4gc3VmZmVyIHRoZSBzYW1lIGZhdGUsIGJ1dCBu
b3QgYnkgdGhlIGFjY291bnRpbmcNCj4+Pj4+PiBmYWlsdXJlLiAgSXQgY2FuIGhhcHBlbiBkdWUg
dG8gZmFpbHVyZSB0byBhbGxvY2F0ZSBhIG5ldyB2bWEsDQo+Pj4+Pj4gZG9fdm1pX211bm1hcCgp
IGZhaWx1cmUgYWZ0ZXIgdGhlIGFyY2hfdW5tYXAoKSBjYWxsLCBvciBhbnkgb2YgdGhlIG90aGVy
DQo+Pj4+Pj4gZmFpbHVyZSBzY2VuYXJpb3MgbGF0ZXIgaW4gdGhlIG1tYXBfcmVnaW9uKCkgZnVu
Y3Rpb24uDQo+Pj4+Pj4NCj4+Pj4+PiBBdCB0aGUgdmVyeSBsZWFzdCwgdGhpcyByZXF1aXJlcyBh
biBleHBhbmRlZCBjaGFuZ2UgbG9nLg0KPj4+Pj4NCj4gLi4uDQo+DQo+Pj4+PiBJIG1lYW4gd2h5
IGFyZSB0aGV5IHVubWFwcGluZyB0aGUgVkRTTywgd2h5IGlzIHRoYXQgdmFsaWQsIHdoeSBkb2Vz
IGl0IG5lZWQNCj4+Pj4+IHRoYXQgZmllbGQgdG8gYmUgc2V0IHRvIE5VTEwsIGlzIGl0IHBvc3Np
YmxlIHRvIHNpZ25pZnkgdGhhdCBpbiBzb21lIG90aGVyDQo+Pj4+PiB3YXkgZXRjLj8NCj4+Pj4N
Cj4+Pj4gSXQgd2FzIG9yaWdpbmFsbHkgZm9yIENSSVUuIFNvIGEgbmljaGUgd29ya2xvYWQgb24g
YSBuaWNoZSBhcmNoaXRlY3R1cmUuDQo+Pj4+DQo+Pj4+IEJ1dCBmcm9tIHRoZSBjb21taXQgdGhh
dCBhZGRlZCBpdCwgaXQgc291bmRzIGxpa2UgQ1JJVSB3YXMgdXNpbmcgbXJlbWFwLA0KPj4+PiB3
aGljaCBzaG91bGQgYmUgaGFuZGxlZCB0aGVzZSBkYXlzIGJ5IHZkc29fbXJlbWFwKCkuIFNvIGl0
IGNvdWxkIGJlIHRoYXQNCj4+Pj4gYXJjaF91bm1hcCgpIGlzIG5vdCBhY3R1YWxseSBuZWVkZWQg
Zm9yIENSSVUgYW55bW9yZS4NCj4+Pg0KPj4+IE9oIHRoYXQncyBpbnRlcmVzdGluZyENCj4+Pg0K
Pj4+Pg0KPj4+PiBUaGVuIEkgZ3Vlc3Mgd2UgaGF2ZSB0byBkZWNpZGUgaWYgcmVtb3Zpbmcgb3Vy
IGFyY2hfdW5tYXAoKSB3b3VsZCBiZSBhbg0KPj4+PiBBQkkgYnJlYWssIHJlZ2FyZGxlc3Mgb2Yg
d2hldGhlciBDUklVIG5lZWRzIGl0IG9yIG5vdC4NCj4+Pg0KPj4+IFNlZW1zIHRvIG1lIGxpa2Ug
YW4gaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsIHRoYXQgc2hvdWxkIGhvcGVmdWxseQ0K
Pj4+IG5vdCByZXN1bHQgaW4gYW55dGhpbmcgdGhhdCBzaG91bGQgaGF2ZSB2aXNpYmxlIEFCSSBp
bXBhY3Q/DQo+Pj4NCj4+PiBJIGd1ZXNzIHRoaXMgaXMgc29tZXRoaW5nIHdlIG91Z2h0IHRvIGFz
c2Vzcy4gSXQgd291bGQgYmUgdXNlZnVsIHRvDQo+Pj4gZWxpbWluYXRlIGhvb2tzIHdoZXJlIHdl
IGNhbiBzbyB3ZSBjYW4gYmV0dGVyIGNvbnRyb2wgVk1BIGJlaGF2aW91ciB3aXRob3V0DQo+Pj4g
aGF2aW5nIHRvIHdvcnJ5IGFib3V0IGFuIGFyY2ggYmVpbmcgYWJsZSB0byBkbyBhcmJpdHJhcnkg
dGhpbmdzIGF0DQo+Pj4gdW5leHBlY3RlZCB0aW1lcywgZXNwZWNpYWxseSBwZXJ0aW5lbnQgd2hl
cmUgd2UgY2hhbmdlIHRoZSBvcmRlciBvZiB0aGluZ3MuDQo+Pj4NCj4+DQo+PiBJIHNlZSB5b3Ug
YXJlIHRhbGtpbmcgYWJvdXQgYXJjaF91bm1hcCgpLiBJIGRpZG4ndCBmb2xsb3cgdGhlIGVudGly
ZQ0KPj4gZGlzY3Vzc2lvbiBidXQgd2UgaGF2ZSBzb21lIHJlbGF0ZWQgc3R1ZmYgaGVyZToNCj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzI0MQ0KPj4NCj4+IElm
IEkgcmVtZW1iZXIgY29ycmVjdGx5IGFyY2hfdW5tYXAoKSBzaG91bGQgaGF2ZSBnb25lIGF3YXkg
d2UgRG1pdHJ5J3MNCj4+IHNlcmllcw0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDIxMDYxMTE4MDI0Mi43MTEzOTktMS1kaW1hQGFyaXN0YS5jb20vI3INCj4+IGJ1dCBpdCBoYXNu
J3QgYmVlbiBhcHBsaWVkIHlldC4NCj4+DQo+DQo+IFRoYXQgaXMgZ29vZCBuZXdzIQ0KPg0KPiBU
byByZXZpZXcsIHBwYyBpcyB0aGUgb25seSBhcmNoIHVzaW5nIHRoaXMgbm93IGFuZCBpdCBzb3Vu
ZHMgbGlrZSB5b3UNCj4gd2FudCB0byByZW1vdmUgaXQgdG9vLg0KDQpZZXMgd2FudCB0byByZW1v
dmUgaXQgYnV0IG5lZWRzIHRvIGJlIHJlcGxhY2VkIGJ5IGEgbW9yZSBnZW5lcmljDQpjb3JlLWJh
c2VkIGVxdWl2YWxlbnQuDQoNCj4NCj4gQ29uc2lkZXJpbmcgdGhlIGFnZSBvZiB0aGF0IHRocmVh
ZCBhbmQgdGhlIHBvc3NpYmlsaXR5IG9mIGNvbmZsaWN0IHdpdGgNCj4gbXkgc2VyaWVzLCBjYW4g
SSBkcm9wIHRoZSBlbnRpcmUgYXJjaF91bm1hcCgpIGZ1bmN0aW9uIGluc3RlYWQgb2YNCj4gbW9k
aWZ5aW5nIHRoZSBoYW5kbGluZyBpbiBjb3JlIG1tPyAgSSdtIGdvaW5nIHRvIGFzc3VtZSB0aGF0
J3Mgb2theSBhbmQNCj4gc3RhcnQgd29ya2luZyBvbiB0aGlzIGZvciB2NCAoYmVjYXVzZSB0aGVy
ZSBoYXNuJ3QgYmVlbiBhIHB1YmxpYyByZXBseQ0KPiBmb3IgdjQgc2luY2UgMjAyMy8xMC8xMSku
DQoNCmRyb3AgaXQgeWVzIGJ1dCBub3Qgd2l0aG91dCBpbXBsZW1lbnRpbmcgYSByZXBsYWNlbWVu
dCBpbiBjb3JlIG1tIGxpa2UNCnByb3Bvc2VkIGJ5IERtaXRyeS4NCg0KPg0KPiBUaGlzIHdvdWxk
IG1lYW4gbGVzcyBhcmNoLXNwZWNpZmljIGhvb2tzIGFuZCB0aGF0J3MgYWx3YXlzIGEgZ29vZCBp
ZGVhLg0KPg0KDQpJbmRlZWQuDQoNCkNocmlzdG9waGUNCg==

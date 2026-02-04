Return-Path: <linuxppc-dev+bounces-16581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBrmBHk9g2kPkQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:37:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E6E5E03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 13:37:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5fxd2Kqyz2xpk;
	Wed, 04 Feb 2026 23:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c206::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770208629;
	cv=pass; b=CrlAPx8LRqfdfOgCUe0MochA4nexs/ZA9goMxHFQerIClByuSFBoQHsTcwLMXtDcN+4Iw/JyrsMZMEwG4cIUhzgP9misjk/zk+hWlwWYVTXPQAF0AuLBMQmWrFx7VqzJct1FDgyR+k8+aeo4Mm7aH2kaKUlI9km9wScHa/Rsfa2Xi3RCLqqqoWPEsUWzWQhO4meeDVzYL+KgCvpfHdQPNE6EVuSpDXPrrxLZ5pelr49QAyXMJx7UQ3V9ZrwfpvEtEbARXn6MOV9iU/XoYz5hXhyBlrV3o8B/ORxyHSb2WYaJGtD3UKRbI9GJFcIDucT+fqQS2BQ6ACxJ3/GfCN8VSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770208629; c=relaxed/relaxed;
	bh=ipFGkUz4Zv6S9xhamRyFpBbNGmHOrtUDuNl9gfV/Frs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NIXeb2D32od3f3fDDggPyLc6bf9gtQ49u/Kn8p7wgwoVQOTgt2O//Dw4e14QA3A0TsTsldqt4c4X2vaGlYayqHjjYBMW+kroi+Rk2sY8ZwNfLQCIE5F92xF1Jg3/YHNnyhpMrGfs8ZyLYjTevNxXF1okj3QsLAs00NFzGnRdi+OXiDV+n1/mxguK002nXFXKGwDGmR96NCNQHBW0ySsmWDJC7SY1ZCD0kH/Wfhl4m2wBe6Km0bfaNLAPVVa0NmP05VDoMZ7WNr3MyVudcbiVbu6Uyg8GsJesfK3Isk4vhcklsc8gdMsyaiMCEniK9+SjTFMUd4sd4fsiAcoPpQohQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=fJhlJtHB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c206::3; helo=cwxp265cu009.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org) smtp.mailfrom=garyguo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=fJhlJtHB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=2a01:111:f403:c206::3; helo=cwxp265cu009.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org)
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c206::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5fxZ0BZZz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 23:37:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABBA/Ak5x6lD464EEtSZffkgB5Duot08zF7AJOhNCRVYZEgiUTqOFaOxmZwNi4gR2xqSxmrkEVknktebbZc8RleBXQ6JjrtO5QmE4clS5wIOZiBrF9NpmLLgS3/RZa+9yriK9IGPnAIAE3qg9Fxg4MX6/+Ot1dcvDRRAacjVFBAGwcYc4dxVacFBlqpCj9Gyp3fh3Y4axjkx3iYa8+W63pusqwbo4nZ64o0qyiPj2gPRqegT14G4Y6i7xMpkit6OB8tTnsiv10XA86xuvtZRf+YjUJl8IK2GhzpSmvJebAX6KSQOd/qrSLVGi94qcKN3qyRfg8857r0OkNycdvy7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipFGkUz4Zv6S9xhamRyFpBbNGmHOrtUDuNl9gfV/Frs=;
 b=bEY2kmPtw6CwjDkTG2cOVlScY2RAz0d4Rg4CbwEyjF+Ik8SEh3B1zwg/mN1Qm6auzEHxiwJoctsTkxnalAoS7vLYM8MrzvjtCv6z26gcqMcgaFGRAJigKO5OZ6yWQAocx+kJoVaH/zfuKYCKfQFdp+65oDgnf+6uZj4uxCyTpHJqLw72X7NfOdIa9lLH5nb2kc0R9mejVwWb3p2nxobvZGrR44BmDaT5Zbzn8Og0aheX9nUHluN4VYrHRyXlzCRzMUo71pndm1GasD++fjz7LaUhydJi9nqenRGubE/rsQAqs2qTbv85TboCqR2U1sCjSWUvVlEdVtvhPOHZvHHECg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipFGkUz4Zv6S9xhamRyFpBbNGmHOrtUDuNl9gfV/Frs=;
 b=fJhlJtHBEzbNyFN7oL8/kZ8SPqD0EEFR38GfmCOTdURzS6DIA4czLnbOZK8RHtCIcDWR/grVl9YqVnec+bHVBSnKV0jgV1mV7FRn8rfc2T47UJO38Wqt2+L4THjli8N6RQd9HkiJUQk+zOBLts2+WO0eoy2HWw04RsTlh8z6K1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8733.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:36:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 12:36:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 12:36:38 +0000
Message-Id: <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas Piggin"
 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Josh Poimboeuf"
 <jpoimboe@kernel.org>, "Jason Baron" <jbaron@akamai.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Ard Biesheuvel" <ardb@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <llvm@lists.linux.dev>, <officialTechflashYT@gmail.com>, "Ash Logan"
 <ash@heyquark.com>, "Roberto Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Link Mauve"
 <linkmauve@linkmauve.fr>
X-Mailer: aerc 0.21.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
 <aYMiXcy33YEVkgYM@google.com>
In-Reply-To: <aYMiXcy33YEVkgYM@google.com>
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
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
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 67552b62-46cb-4b03-8cbd-08de63ea0b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0NIOUVucnpvbnhVS3hoMi9yYjdUVWtDQ2RMdXpuL1ZmSzllMDI1T0JDSk1y?=
 =?utf-8?B?NWdiWjJYOHZYaDdFelBpNVBSR29Qc3BSRFRTRXBUOWxPOG5TTzFCWG92aEQy?=
 =?utf-8?B?UFJyRTFSbGFkem1kaXVqNkRBdDZrTm5SU2g3MFU0L2Z4eHBLOFhjV3I1ZzF2?=
 =?utf-8?B?NXFXQnNHRlNkeUs1aGJXcUNUVEJTVm5FT0VQTnVqR1hxamZkaHJRTzhYbUpn?=
 =?utf-8?B?bmk1SmdwdnFmN3N4L2paMDRUQUNlSEZ0RlhxcmxXREpaNmQ3eFBYZXdaVGVH?=
 =?utf-8?B?ZnBjTmhyY3NyTDIrQkhlcmg2eUJPOEI2T2YzSGMrRGlmRmpGMktoV2dXVndK?=
 =?utf-8?B?MnRaY0wrSGZCRkZ3eXV1RWU0UEcvT3NpUkI2RWk0SjdscWVEWi9zeVRDeFhB?=
 =?utf-8?B?R21OWTN4R213MDB3QmEzRTlia0VMRGVhSURqMGpuU2RaaXp5R0tNRE9OeWdN?=
 =?utf-8?B?UG04eDV1UlByUGdzK1JGSXNua3pXT242b3ppTmk1SlM2amt5RFlobDlTeS82?=
 =?utf-8?B?cHg1eVcvV1R6bVpjb2ZyK1lUWjZzcFBOL2t4UnR1RDVVNGdSaGYrdVNVdTVh?=
 =?utf-8?B?LzV4N0VNL1JxeWVxcTRBVkRGRnI1Rm0xZ2FCYlFiTTZQWXI4aW5RbDA4aVgv?=
 =?utf-8?B?dVZEZmJzcTh6aldEWmo0REE0RDBCOFoxZk96ZUkrcG1NSWkrbllnSE9NcC9a?=
 =?utf-8?B?SU1xRm8rK0o4T0dmVHJMcDl6VFAwVDJ0RHcxclVWU3k0aDU3UzBVbVBjblo0?=
 =?utf-8?B?cnplN0R5RExoSXlQNFQrQnBOdDZzMUlOQUFIbHdZOHdUQnlVQW9FUGtab1l2?=
 =?utf-8?B?dERERHVUTm9iVXU3eVVTekNUSXFKQkNBL2JqUVoxdWpHeS93djcyZHVqdWlO?=
 =?utf-8?B?ZHdEUHFEWUlFNThDYXE3UkxTVWJIY2EzZFhDdmt6bFJwd1ZvU2pEekFQUUV1?=
 =?utf-8?B?dE5OdHphKzRqdGI0VTZJRHpzMkFaNkh1WnhhMFpYNlc0cVRlMjNJSVNIVCt0?=
 =?utf-8?B?WW1GM2E2anJxSjFrZWpVakU0TEw0YTBaODRjTysySzRmMXRIZGVSbHhIeG9U?=
 =?utf-8?B?NGdqRitjd3djMHhNQjlKSTZaTS94NDZvV3M3ajY2c0FadGhWVUE0WC9BK0wy?=
 =?utf-8?B?RWg3WVBJYU5ueHNabDZNR0drQ0RHbllZYTdXNi9YUGpPa1hDbEdGeHRSTHlp?=
 =?utf-8?B?OG5NcmJnbEU3ZTBIWXFYc0gxTEZERU9UZlhucHFPaC8xNXdzdFNDckdiendY?=
 =?utf-8?B?SWYrMnFWYVB5d3VVc0x3RkRhL1V2QzU3ekpMMzVWaHZKQzhYVjZXc2Urd3Qz?=
 =?utf-8?B?UkdTNGRKWDdLYTJDbG5iSVI2QTBlOUx2bDVMalMzcWVKSmVuOXBoQzlkM3Fj?=
 =?utf-8?B?OG5rQ2ZVM1UxeGpxT0FKOGppU1ZvbzV6a1haZ2xBTEVEcmVqT0hFWDZaZ1Yy?=
 =?utf-8?B?QWJ5ZXFiNjF2dWdzaHd2RlJBOXd2UWpjUjcxcmpvVmxQU2oxbkVPNENZN00v?=
 =?utf-8?B?UVkzdC85TWErS2dkUDFVMGx2RFpBQ1ltUEJSM3NPMlJwcVlyV0w1WGtqOHNW?=
 =?utf-8?B?SmRZVmZIRFJXQi9qaHJGQWJYbDRlV2VGcE1BZUE1MEIvZUFWY2JORjhKTWdO?=
 =?utf-8?B?V1NENDhhNStCajJkdkFnU3EvK1VMRzlOcVhqWmZlclB1ajlKZzNndXFsN2tj?=
 =?utf-8?B?K0NFVDNSZzcwN1FGd0JrUkd3dXl2VXI2WEt1RGNWMkpRTE1ITXRmTGhnbnFw?=
 =?utf-8?B?WGVocjNQa2tMbmwxcVVoZTB2OFhvalVYblJDOTROZm96a2tVYit0SGFyRU80?=
 =?utf-8?B?NndhQUdEK044NWl6MDRDYks1TEJmNERjSXUxR1dOZHM3OVhjN2twRk5rSTRk?=
 =?utf-8?B?L1pFdSs2NWpiSW5uM0VPdytvcGZaejhPK0szaDU2UUtSS2QxUEs5QVE2NVpi?=
 =?utf-8?B?eWV3RXFlQ0N2NHNndWhzSnV3SnpYZVZpV0lSeFJjUWZZQldBRjk0dlhNTm9a?=
 =?utf-8?B?K1FFa3FRazlHNmp2TUh6TVg2THo2VFU5NW5IcVZmYnR1NmVpdExsVkN5Nzh1?=
 =?utf-8?B?V3lSUGRFSDVFckNvcy9JeHdpSUJ3UGdGdFV6Z09OVmNuWmdSVjVIWDJMOFlH?=
 =?utf-8?Q?z7xw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0tLalM2MGNlV25WcnU0SktNTTdkTE5CeUtUcFRzUTBha3U1RFhwU013cWF0?=
 =?utf-8?B?cVM5YVBHcE1zZ2FGYVkyQU9oVVNhRmYyNEYzUXNmekhpQkxwVEVEbXphZ1Nr?=
 =?utf-8?B?UHlhY0JldXp6MDdNdnpEeSt3cllMZkk2NWtsVHpFRHZwN2E5bTFiNXJhZU1Q?=
 =?utf-8?B?NXFBNUMydXFJblVEbmU4ZDFESjdzRXdORmRiaUdaS29pZmpMWlpRNlZvbmZM?=
 =?utf-8?B?bXpFRWlKdWlYVlFXN0ZDUXZGQnhJTE1uQVhvYks1bDB2ZmJjdGs3a0RMNU51?=
 =?utf-8?B?eUxGaFNKejBhYkJ0SzE2K3ZDVXdmUnhlSXMySGxjd2VhTFpCTkRTdE5MNjdX?=
 =?utf-8?B?SDNHMlBDcGNjMnRRSzFPVTA2aUpoSnhDMFROS3dmT05WdUxDS3I5T1JENDRh?=
 =?utf-8?B?V3FEcHF3MFdqdHpNdnNMZ3dwWTV0U3FoTUlVaUFkNTYyQlloYkNJVWNhaVln?=
 =?utf-8?B?Y0VXRVcyQ05rQmhKV1RXNXlyMzBiVk8vN3hENWRBY1dWSWJ3Snh2RlZNMDFj?=
 =?utf-8?B?YkNaY3NDSmFrZEgwLzhBeWlGb2YyZVBXVWFWSjZvVENROTdUNGFISDdEN3Va?=
 =?utf-8?B?NlJWUmEvZVM0TURSMVJiY1FhbUhCOFR6dG8yYmxEUU5MYm5OTmZTcUlzWTZI?=
 =?utf-8?B?ZXBUckErZys5aFRhUXltK1VhWjZ0ZWNWWjc5TDEyN1RvMUZGY082MG8rN2dR?=
 =?utf-8?B?RnJhV3I1dkRGMGw0NmJyVGJwTlZIY1hTOVlvOGFabXphWXc1dGI1djhLdW1k?=
 =?utf-8?B?T2Y0UGJLYXVWWXlEMVBYZ2VhTWpZZzdXcUlXb1pVZGNhTnozYll2ZGtGdEdh?=
 =?utf-8?B?R1NmdmIrZ3dGM0RaRTNTdVQ4RkF6YjRQcDg0RHAyREhqSktWTEZJcXZvbmdt?=
 =?utf-8?B?T2FTOVhyTEhxOWNtUzdKcDBvYTVHU2NmNnJRNUlla092MmphaU1FakhidE56?=
 =?utf-8?B?M0JUTytHUWVDVkFEYjNWVlhRVDBQRnp1clA1QkNxU2R1OC9hUm1DckJOcVQ2?=
 =?utf-8?B?dzNoU2FudDJxNTQwenpKR1FXc0llOWtPQjRtVG95a1E2aWpHM0Q2YkcvK0N3?=
 =?utf-8?B?azlEc0tzQzVBVEg0U2djUENOcmxLcjRVSmRuMTI3NmhQd1lXK1lJc2RPQUdq?=
 =?utf-8?B?ZTFKbTBiVzFoMjFwb0FIazkyYUhKcjh4ZHhwRU8zM2U2NmxnYTBocFlhdWwy?=
 =?utf-8?B?OWk3L3BVbDFzRDB5NWFERWhSdkkrLzdhaEplcVhQVm9QbG9pcWZDMzJSaFVO?=
 =?utf-8?B?UTVsRk9hbkZLL09oSGhKRG1XNm80aDB3eGJlRVNLOVJ1VFRiT3QyY3VwYU52?=
 =?utf-8?B?OUhLdWRIT0owcGE2UXFHazJtcEF0RVZ1V3FXVDRlbitnN3g3dFVsaWdGU1VW?=
 =?utf-8?B?a2Q0dTdQTXQ5R3BkRVVJcWZGRzkvUHRPeDRhUCtpS3VVeFUwK29UdU9wU0Rs?=
 =?utf-8?B?NjkvT2w4QTByajVOamlzSnN3SkNEWDBjYW5FVHpnYlg5ZjlJWDc4RmFmUHN1?=
 =?utf-8?B?WnN5UEtKV0xnby8rVG44aEtNNllzWVFGNkVzZlJQMjRscUNObXBEQURSdW80?=
 =?utf-8?B?cFQySmdWWkxXRUpZd1pldVc3akxIRHJSQ1Z1NHM0eGhoRnVmRGFjakJ2ay9O?=
 =?utf-8?B?Vm1oRjlGQVZhSjk0Y2VrQk4vN1NyNFRranVudm4rUWw0cFJZMUdaM2JaZWxw?=
 =?utf-8?B?UnFIaFlVakpMckd0aXlkLzZLWHJWMXRuVUUrMGdxbEQ4SXZGRHp3Y0FuVmFk?=
 =?utf-8?B?Ni9vdTlJeDh5K0RqTjVId1doSXNDQy9EUU9CcGJ4OFJreGtjeHlyQUQvMEJh?=
 =?utf-8?B?YldVTXU3RHFIWFI0OHN0bWx5SVl1b2pVQ1BEMURFeUk3Z0xKNDBrbDBVR3Jz?=
 =?utf-8?B?bXYwN210ZldXZGNvVU1YTTFWNmY1Y3RQYVNLeXdIZkY0QVVUcUNFSVpKR1Bi?=
 =?utf-8?B?SElHK213dzdmbE8ySXF3b2swZExqT2FXbEpSRWptL0VROWNSSzNWU2VQN2E2?=
 =?utf-8?B?UXMrNjZCNWtPWGtLeU9mUHZTRWZKYm9acWxYcGFjN1lRYVZYaFlwSGI3a1E3?=
 =?utf-8?B?M3UzK29GMWplUVlEaWVETDJydUxTWEZJN1hrdGlFRHU4UnU0NDZ5bEZyYXpH?=
 =?utf-8?B?SXBLUXgzM0xoT2htSkRnbDg3bVhGc1doS2oxb0tkY01mMHV6UVVtVTdsVjFv?=
 =?utf-8?B?QTl6azN3OFNIY3JyM3RvK0ZROG5mdE1IUG00TFVUb0lYdEl0Sy9MYUg2Vkxm?=
 =?utf-8?B?bWNMQThGdVZoRDZKZ2k0RGpETk84eEoxM0pWbWorNnpvMzBCZ0ZIT0ZZc0My?=
 =?utf-8?B?eWkwL1BiUkJLT2p5RENkSXZLR3c4Nkg3MXRkbjE2N2I4alVGYWhTZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 67552b62-46cb-4b03-8cbd-08de63ea0b17
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:36:39.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA9PVaEYgUqhS7mMk25ZRM7lvFZExfKCbTtH/Xtb9H5Zu5iyXk4m5NId8tdLxSGT1psczhSL/yNQtuIYdoVN9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8733
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16581-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:aliceryhl@google.com,m:linkmauve@linkmauve.fr,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,akamai.com,goodmis.org,google.com,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 189E6E5E03
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 10:41 AM GMT, Alice Ryhl wrote:
> On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
>> For now only Big Endian 32-bit PowerPC is supported, as that is the only
>> hardware I have.  This has been tested on the Nintendo Wii so far, but I
>> plan on also using it on the GameCube, Wii U and Apple G4.
>
> Super cool!
>
>> These changes aren=E2=80=99t the only ones required to get the kernel to=
 compile
>> and link on PowerPC, libcore will also have to be changed to not use
>> integer division to format u64, u128 and core::time::Duration, otherwise
>> __udivdi3() and __umoddi3() will have to be added.  I have tested this
>> change by replacing the three implementations with unimplemented!() and
>> it linked just fine.
>
> Uh oh this seems tricky. How is this not a problem on arm32 too?
>
> Perhaps we should just be providing __udivdi3() and __umoddi3() in
> general?

I think there is some concern that if this is provided, then C side that us=
es
the divide operator instead of dividing function doesn't get linker error
anymore.

However, a proper way is to do this via the hooks that we already have in
`compiler_builtins.rs`.

This can either be replace these with panics or actual implementation, but =
for
libcore.o only.

Best,
Gary

>
>> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/includ=
e/asm/jump_label.h
>> index d4eaba459a0e..238f0f625a36 100644
>> --- a/arch/powerpc/include/asm/jump_label.h
>> +++ b/arch/powerpc/include/asm/jump_label.h
>> @@ -15,14 +15,18 @@
>>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>>  #define JUMP_LABEL_NOP_SIZE	4
>> =20
>> +/* This macro is also expanded on the Rust side. */
>> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
>> +	"1:\n\t"					\
>> +	"nop # arch_static_branch\n\t"			\
>> +	".pushsection __jump_table,  \"aw\"\n\t"	\
>> +	".long 1b - ., " label " - .\n\t"		\
>> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
>> +	 ".popsection \n\t"
>> +
>>  static __always_inline bool arch_static_branch(struct static_key *key, =
bool branch)
>>  {
>> -	asm goto("1:\n\t"
>> -		 "nop # arch_static_branch\n\t"
>> -		 ".pushsection __jump_table,  \"aw\"\n\t"
>> -		 ".long 1b - ., %l[l_yes] - .\n\t"
>> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
>> -		 ".popsection \n\t"
>> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
>
> In case this patch takes a long time to land, it may make sense to split
> this part out in a separate patch that can land now.
>
> Also, consider pre-emptively updating arch_static_branch_jump too. We
> probably need it at some point in the future.
>
>> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_tar=
get.rs
>> index 38b3416bb979..0054880ba0ea 100644
>> --- a/scripts/generate_rust_target.rs
>> +++ b/scripts/generate_rust_target.rs
>> @@ -188,6 +188,16 @@ fn main() {
>>          panic!("arm uses the builtin rustc target");
>>      } else if cfg.has("ARM64") {
>>          panic!("arm64 uses the builtin rustc aarch64-unknown-none targe=
t");
>> +    } else if cfg.has("PPC32") {
>> +        ts.push("arch", "powerpc");
>> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
>> +        ts.push("features", "+soft-float");
>> +        ts.push("llvm-target", "powerpc-unknown-eabi");
>> +        if cfg.rustc_version_atleast(1, 91, 0) {
>> +            ts.push("target-pointer-width", 32);
>> +        } else {
>> +            ts.push("target-pointer-width", "32");
>> +        }
>
> Is there no built-in target we can use? I think we want to avoid adding
> new targets if at all possible.
>
> Alice



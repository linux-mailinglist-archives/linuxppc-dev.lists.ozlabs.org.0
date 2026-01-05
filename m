Return-Path: <linuxppc-dev+bounces-15280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C97CF4746
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 16:41:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlJRq0SfRz2yCL;
	Tue, 06 Jan 2026 02:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.201.68 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767627670;
	cv=pass; b=WOgrUOIq2B72IBtU5OdUPAQa9KGefS0PLR3uRiArUoT8lEQsu7Id5BA5FWWyzfIbsEmvvdzrM9rlMD7dknrHKrUL8LCssKRZA5R7NjqeLqt+yogtWJc2gDs8frll+ge9+n+qpb0ErbnoqMs93A7TDldjMzrNVuxyeHPyUE3X5zx3HHLe6xmTD5vCU4gKQLPuU3Q08Eszam/M5UUd90okoQLRpaT0CetR46qkUdIqtogctKlm4UqRcQgKJkU8w0Cql6e70CQad64ArC6K1mKdR2lq3dXOvzBUvBSXesbkTtr56CYeSHE1BzhVjwg+Ghw85kC2g/Orqa1sS/MBE/QKrw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767627670; c=relaxed/relaxed;
	bh=K/SyEFboBJRMVI1zenrCqgDw4qYn0/JfuIpdzYy39LA=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HkqyAsEbhp9qUaicvYDxR/D5l4r1mSxXqeYUgGhP/UPSNw4bKDOt/nvixnXAF2FEGkfuuOWP3JKrZ105+eTBMvN2hyC5fGMlKBcI+NXQHpzBKURFU8+g7A5UAiqSkYsHKFeUzZimwguLfxw7EnjExk5/aab+92ZXOjmZmO9bW24V51HDSA/n5zURzouYVg425oSFXGQChd84aCCi5+SGR7UQf9z26+wpksy+KApIpOGeP28h/U6iU4oiDW3JfF85mI66DIsNvq5lqrtmn7M1bk3ikv7LoQb67cH6WSJcJyjGxwtSk8cHBfJbcLJZELAjt1VfIlpLSmrHMibLCgSd+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Gy7TVWzG; dkim-atps=neutral; spf=pass (client-ip=40.93.201.68; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=andrew.cooper@citrix.com; receiver=lists.ozlabs.org) smtp.mailfrom=citrix.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Gy7TVWzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=40.93.201.68; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=andrew.cooper@citrix.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlJRn14cdz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 02:41:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0xDPFJA+gkPK0NGVT8mkux7honSQr78A2FVu+0AmpxVmaBaEn1RPeimeATcdDkQrfPuyY8wWqLZ7DhH5wfVUz9E7y7IIUmGgDgLwB7Tpx94GKqydM7nkg4VInG7DJmHGsHee2212VMpui4rWs5jKuejnNi/8EWO4TD4TiGdb3MfsRlSvbs8lUHJK6+BtCIyR5HV/+yi+/mLVaBJQCzr0oyTo/9KcqhMViZ1q0tFX1ZCpfknsczId2VCwZGH2sma4xNfeW+gmV9/fp0lNtrcof5gCvLlD5ofQSoiOUk9gSWUytCLVbW3tbuoiHvkVVYn+LiScBjD9AZ6etPVRglccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/SyEFboBJRMVI1zenrCqgDw4qYn0/JfuIpdzYy39LA=;
 b=QhooKH0JPyuRbeETE2jNMFFx6pyuxC/pcH5+VBo8az5gtXV8Sg5nlp7PJy8zQSYjrVhqTfRK1bYluOWPZZCofmiYW2cRy8s+WORDhA2B2VIPxucRfik8oCDo1sNh6SLRvtb4JkDwzVUWOpVYCN0yrwVJhiOMC5ABFKDOMtQEQbGe/9dBL+Ke0kd0bXjxPOoyfBGVNHrZ1RwNf3DF4kInxkJcy8SGfCPhrVsJxfPdpOSS/3QeYz2oN+gXetSHhuKaRucMkfdLXUowprZfFKsXT/qDK1Rj08JozKphd4hDWfNxLulZdIiiEQd88H98yoCc9fowWqfE6DowXlNkLTp0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/SyEFboBJRMVI1zenrCqgDw4qYn0/JfuIpdzYy39LA=;
 b=Gy7TVWzGQWZkXXUV5/o8XHxG/tSFfcQ2n0AGjpb8JpIsuihxu2rV5ZMuFfazTmcEgNaSaCewjiDfYMX6BM1DYg2SnrYrnHlZRyd32EDZDx6Y/u2XBqz1gLD5/YMtkA0ps5q4H/q4MA8XxFj6oP8ziC83Jjf5zgO+Werx9XW7bHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH8PR03MB989118.namprd03.prod.outlook.com (2603:10b6:510:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 15:40:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 15:40:26 +0000
Message-ID: <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
Date: Mon, 5 Jan 2026 15:40:22 +0000
User-Agent: Mozilla Thunderbird
To: ebiggers@kernel.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason@zx2c4.com,
 ardb@kernel.org, dengler@linux.ibm.com, freude@linux.ibm.com,
 herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org
References: <20260105051311.1607207-20-ebiggers@kernel.org>
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260105051311.1607207-20-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0594.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::23) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
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
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH8PR03MB989118:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0b81cd-66ac-4829-82a1-08de4c70bf4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGNHT1dZRmJQeDloNFRxNE9LRWxORUdNcDRidWhEQ3dGdkNMR3Vtb01YZnF0?=
 =?utf-8?B?OTd0emxWSG5OckhWRVNCSXF1c3pGZjU2UmhQakNDeHYydXVWY09nVjc2VlRT?=
 =?utf-8?B?cldsZndaTmg1bjlTSkRIb0hMMy9yOWtYSjgrK3V1cFdQRGtTRCt1M2hpbzN3?=
 =?utf-8?B?Vy91SzFDNmJobHJoclFNM240bDEzUmtFRFpiR000UTkxWDc1blpVQm1EUlNV?=
 =?utf-8?B?UzAxRGt2d2FnYmhvVm5lQ1Fhdm00ODByTkE3SjRHbkhhYWhmSUNEaEFXVFRL?=
 =?utf-8?B?NUlIUmRZM0tJbElsQ3p6Z21xL3plbFZ1V3RPRG53ZVlxR0ZFNlhFTzZXMjFD?=
 =?utf-8?B?Z00vc0xaWjVwNGltcjVuYWtQbnp3UmlCeWhNSmtIWU1jM01rMml6bzFMaEs1?=
 =?utf-8?B?Tk5NYldaVU1vbHl2RFl5bzJOakZJblZ2K2MvZzNZeDNXajZ1TUZLSXJLNFQy?=
 =?utf-8?B?eXZWaklKUjdNOUpxSjRSZDlIZ2JiVFVzVFJSOW1WK2dsQWl0QVhlVkI0YXpa?=
 =?utf-8?B?K21zQjlnUkVNQlI0MHIzRGl6YlJSaU5RZStRRGQ3SnJkcnJnRVl3cTlzT2RJ?=
 =?utf-8?B?VFZJcFlFWTUzQVd2eUl5TktCUzVwTE5CSU9uMU92YTlMaXlTYjdiTnMvVVdh?=
 =?utf-8?B?R3pMQ1lrcUQ5K05LZDMwUVlZQnE1bjFEeElRQzhLd3NTTkl4eEtQb1hDamk0?=
 =?utf-8?B?dS9zcEFxVjk0WWIrUGt5Tnc1NmhocHZaVlpuRnIvei9CK09zcy8vNGFHWGI5?=
 =?utf-8?B?NnlnR1JubWhXSWxsVWpUS1NYbTlKckhFaFFvZU5QWW1WNnI2WmpWNHpEVHVS?=
 =?utf-8?B?N3N6VmxvNmFtT055TmRWdVJxUEdBTHNHb05uUFdDRkIxc0JYUUI4aTdRZHRX?=
 =?utf-8?B?WGV4Z2gwbWRHNGRENTBuNGNMTm92YUI3eTh0eGVpK2Y0YVNsQ212UDV3eFAw?=
 =?utf-8?B?akZBYkd4N1V0QnRvcCtsZkthUzZwZDBVaDNOeXNnK0p1WFJ6Z2JZZFdYZ0Zs?=
 =?utf-8?B?RXJoenNBNElxdlRya2hPUkJJZzg2REhLeElZRmVIQ25hU05YQ29TWTM1TkV2?=
 =?utf-8?B?d3RGTE9SWGduSGN1VlE2M0w3dW40TU5XNGNHSGdpVEV0K1dDMDVZS0dSbVFF?=
 =?utf-8?B?TXZVM2QwUlBUMmpodWxPdEo2aU11MGFibkdObVhCMTArS3didTlXV2s3bGdi?=
 =?utf-8?B?TVhRSzlpSnVGMDVLcFJYcUJ3WHoya01VaWx3NFFMazV5ODFzcVFLS1RvSEMv?=
 =?utf-8?B?c3drVjZsRmlJbnJaN2dtdVhidmovYjVQNUxPMThzdmNweHp0QTB5K3VScnVI?=
 =?utf-8?B?VTcvMlJDSS9wTDBKbXNGT3VCZkJwYUhFbkUxa3dMQVJGdnhBZVlicU8rdUd0?=
 =?utf-8?B?S0FtOVBESzlVSXpYYkw0c1VmaWNzenU1cXhJc25YN2lWYWttbWRBMjJLTlQ1?=
 =?utf-8?B?ZnAveGVFZDNwV0xxVGJrUmNVWFpObXIxTnZsTFNONDhXenZJUGp3L2pGbGxl?=
 =?utf-8?B?UE5BcENoaE5XcnBKaXFyNzAzTW05T1BJTWxaL1RqODZ2NVdtOE1LdWhqb1p4?=
 =?utf-8?B?ZHFxTDU0QkwzdUE5aVMvcjNHYzRaZjZZOUo4MnFrbEttcDhpaThhanRrMzFM?=
 =?utf-8?B?RW9WNlcvZmZTbjhpWkE3WHNLcGFITGFXYVYxTjN5NXdaeG9yNUFGOEVqTy96?=
 =?utf-8?B?VHArSVNPMmpXU1dnaEtoWHArVk04bjBpc2hqaXB3WVV5ZHlWZjhweHlHSDZx?=
 =?utf-8?B?dCtHVFVZOC9VcVp3L2J2NWdlNTV1NU1xVnFtUUZlZ2NoeTMwbG1XN1F0bXVG?=
 =?utf-8?B?QzdaSEQ3VW1ZU2huQ21lTzVMNmY2c1dlNXVZYUlLcTNiYTYrNWVMbWM0ZXpx?=
 =?utf-8?B?THFxa1ExcllDQk9VdmZYL1ppVjV3SE1Ga3lqVjJBWkdWYXNYRTU5UGJUbnRP?=
 =?utf-8?Q?waZAuU/QC9qktBZpMPwquqw/EEZ5P/hN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2FRT3k4M2l3Rm00R1psTkZBem8zZUJESmxRYnlhN1o1WFNrK0s0d1Y4MUJ1?=
 =?utf-8?B?QVdZZUJKa1d5R2tOMUE2L3JyT3MyUUE3WitaRVhOR09ZTlJSNm1CdEpVN2w3?=
 =?utf-8?B?N2pKMzcxSnZWV2xQVmNXL2VXMkpxK2JESERZZ3lqK294aWhpd25qMTJEek1I?=
 =?utf-8?B?bjZvR1JjN0lFOWR3MkVPbXB3RTJCSkhuOVhuK3l3eXNSaW9HU2FPblhCb2Ni?=
 =?utf-8?B?TllobWRkekRqS29RN0dVdXhzQ1p6NjZRZVR6UmR0ZjVNcTdudFk4YjdzTWRj?=
 =?utf-8?B?dG05YlQyVndPVzV5ZEdUamhEY214Qm8ycHVoU3dCSFZQVWxTaW85S3I3YVg4?=
 =?utf-8?B?OHNHb2Z6TDRxbmZDNWZ3QlRVU2pvTnk1MWkzRmtJQnRoZWw3TzM1RE16elhP?=
 =?utf-8?B?dmhabkdpVWp4cmZpQTNFT2tadk9oL2FnV2tUc0duVzc4dFB4VUxHK0xPLzVU?=
 =?utf-8?B?dUNhcUlMN1Zhc2YyUVkyK2VqNGQ3alB2YndxdmF6R2JNdUNxZ2llaW1rZmJi?=
 =?utf-8?B?UGlrZ21WMmtjNGFXNzNrS0VDK0E2cERma0JHMXQ3NDdFVXdBd1NBYlNxbk0x?=
 =?utf-8?B?eXpHa2hQcTY2MGZBNWpSeHVzZ0p2UmppSnllbjBDeWwwd1ZhN3Zjd3kzQ1Z1?=
 =?utf-8?B?Nm9jLzdLZUlLQVBMV0dtUXcrMWJzK21jL2tWUm5GVGJvdGF1SEFZUXZjNDZ2?=
 =?utf-8?B?Z2JIaXR3K1MzR3pYMk83SFAzbWN5dlJuK2ZxRXBrWmIrek5QQ3ZYTlBlcXAw?=
 =?utf-8?B?ZWlQR0ljT2RQbFF2cUFQdUdpOTE5eTlQU3M2T0F3dlRUVXA3akJKMmV5T2FE?=
 =?utf-8?B?WmRrVWo3TGhOUkNHRkxCeWd2YXIrWGlWSzlYVnRISkFMNkhsZDJhSVh5U3kv?=
 =?utf-8?B?c0M1RXZNY0gwL0ZLd1gvNjUvc0pJV3BwcXF6djYzbEQ4eWdtQjRrb0lKd1Ny?=
 =?utf-8?B?dDZEbThBZGI1eFBxYVlsSjJJeWdZOTZVVTdJd1VxZ1dQK01jekJZRUxlMlNk?=
 =?utf-8?B?NVdhSi9tYjdXNkN6SERqYjZVdTBsMkM1WUJWRFl3OTU5bEk2QUN4VWQvaXpn?=
 =?utf-8?B?N1ZPUzN1dlA0MFdlSGRyQlNPcHMzNG81TVhwSjd6czduRndLb1M5eURMT3By?=
 =?utf-8?B?eTRwR2dNUG5zYkJMeUs0ejRRZlUzbVEyS3JoVEViTU5FakZOVVh0elJmd3hQ?=
 =?utf-8?B?N2R1MlNZRFBYYVhkT1NoanBjYS80SjFLS09lamVyNEg0K1dDd0pPTHdHNDNY?=
 =?utf-8?B?RkhVQ2xVTlhWMjdrMFhCK0h4Y0lSQlQxM1JJM3hIMXVpeFh6MXZsSkJGS3Yz?=
 =?utf-8?B?ZlNHbUVEOHk0aFJSMmJRS1VDWkFscjhONHBzYUg3dFZGYmJsaWtxTjdBbzMv?=
 =?utf-8?B?eWgvbkltVFFCd0NFY0lzWDRSbkFxRkdiM1hpTWlOdzMvWnJnTG9oLzVDYXB4?=
 =?utf-8?B?b1JRNFduaFY0aTBXbTlmRFJJUTFJNGttWTJwYk4zQ3N4RzVacEx6NzJUZlA4?=
 =?utf-8?B?WndIQkdWOEhUTjJzdStKR3lxbXhYaGM3U1FCZjdDaS8xNEhVcmo2cG9sNmhh?=
 =?utf-8?B?VnFEVyt6ZHZpWVpINlZVaXZkcUlNNkIxYjFZdzZndjNaeVd2bDVMWTc3b1Rn?=
 =?utf-8?B?ZTJTR1RHVE5MSHczRzFyUWowYXB4WEh6cTkraEI3ZUt1S0ZOamJsNVpxZzRE?=
 =?utf-8?B?QUdHanJIcFMzdDVEa3dlRm5JeUkzQUxXUjdxNnV6NWo0R3IyY0ZodFR2eWhJ?=
 =?utf-8?B?aWJwN2dDUHh6bkxPcGs3RkxmZlVYY3Z0c29pR2pCU0JFZWdHcDROcjhPb1lJ?=
 =?utf-8?B?K0hrZDN0cHo4aC9LVVFMaXIrQTg2dGhIY2Voa2wwV090TWp2UVk5Ly9CTTV4?=
 =?utf-8?B?N1gvcjZwVG96ZnpKWjJHRFhvQkFqYWE5eHVWai9jdm5tSVJmdUlTRm5lRHRB?=
 =?utf-8?B?SFBGWCswNTdIbkczQXR5RTYxbUJKc0RLMGZ2bXA1azFidldOTWkzUm82UC8x?=
 =?utf-8?B?ZnErbFF0NWtWSnZ2TUs1K09pcFZnNitEWWQ2ZkJ5U29RdS93N2NnY292UXFM?=
 =?utf-8?B?TFZ5NFVDc0ZTc3lnY2tQc2s4WWFvTnVJaDJ6SDNReHVpZmVUMkpDRmhnMVF3?=
 =?utf-8?B?dGdrU0pNb2UyUXNiK3dEVWVsSUM2UUdER0dZV2g2enY2aGVlTDZvd3RaNjZF?=
 =?utf-8?B?QUFXYnZZY2V2WEFxekNqN0NyNCsxNkpiYjdJblZvekRnV2pQVmlFODZacC9J?=
 =?utf-8?B?ZnhTTDBrekJyUUlvWHFML0krTWQ0V3gwOFVJUWorRTFXc3ZKelduN1lWY3NH?=
 =?utf-8?B?UitrZGhsYnVMcmFSVjJOWFYxYU1Nd2M2RGRpN3d3T3ZIRWc0VFRVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0b81cd-66ac-4829-82a1-08de4c70bf4a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 15:40:26.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypj4k0v0cQBN6pfz9bvMZ6cHe6UtKlueBfPooMiaNJ5GH0YtZwxoppOzD390pdBWw8Q8QsynKRSr/H8Bjou9fQzAssoZtBH3LLclDBCUfTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB989118
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>  	/* Most significant octet of plaintextData corresponds to data[0] */
>  	swap_buf(r, data, 16);
>  
> - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data);

One thing you might want to consider, which reduces the churn in the series.

You can use _Generic() to do type-based dispatch on the first pointer. 
Something like this:

void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
             const u8 in[at_least AES_BLOCK_SIZE]);

#define aes_encrypt(ctx, out, in)                                       \
    _Generic(ctx,                                                       \
             const struct crypto_aes_ctx *: aes_encrypt(ctx, out, in),  \
             aes_encrypt_arg: aes_encrypt_new(ctx, out, in))


i.e. it keeps the _new()-ism in a single header, without needing to
change the drivers a second time.

~Andrew


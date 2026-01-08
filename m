Return-Path: <linuxppc-dev+bounces-15440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC627D0694E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 00:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnMK52m09z2yFg;
	Fri, 09 Jan 2026 10:57:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.26 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767916649;
	cv=pass; b=jeW4QCIjt2M7akYrPWgHEh/lKLkpBXSNoYOIHmLD0ht6sSQ50HVyfvWWzthew4YLfWBFhXH6rispxRbih2SS/mG7oK3jQ56gp+lkzZ8uBrWxIRq1cOLBFpT828TJSti/AOmqoONN7oCzXHwwE6qTye+NLGMJuqBixz6leMzNnMk28SEjCq5fvpB0uCfnB67MBuGie7tj1JbZoj5C0DnwHhQ+FDG0lZ2H/1qcCZ+gFvgh3ZOhD/iRx/xHXvmsqSdppuzwT9KuTTEhacr2YbBeJpvocnGw0fhINSfhUy02dVbKh7n/edv+aM0Iqv3BCLPrpNixFP18eSd3PZIOTQz3Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767916649; c=relaxed/relaxed;
	bh=LnlghJIKm7Q/6WamgAsZeomBm8rvRfibPG0F5wNRrzw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QRjNG/eFlZQY5C8f/Y+nP/xZ2DyBYYxMWX20zxLF7P3VIjXMnSjo7baGBIvVp9m/bXRv7zkzL4S0SNlxR/VOJZ+gGrCuce/IyfHLUDBS5WL853AbnSezyrz0QCnZzPBMwX3R5V1Sz8toQN/JXOheHnUvpsN8mZqFsHbeZiydVBIQ+8SxD0Ol/OU2wRoTLhykKg8aGuY1CP/ICGg+avjfSsJwzQj4/zqjKPq9PCrqFsBuOR93rYbRnesLzEblGlFIi9FciTrOogpgWhdc7Jebq7JJkyyE813te7OVRMZu4IWdv2yuTp9vPPD+RhkX31tecS60l1/QS4yzP/3lMrLxTw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IC/cXAok; dkim-atps=neutral; spf=pass (client-ip=52.101.193.26; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IC/cXAok;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.193.26; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnMK41Lv0z2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 10:57:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kroaHjuAstAqpKM/Z8Ft00tO/sCXF7toKW2fTlYWKfnlzymRPrwVg5JrE/TuwGXMwRhOtmI8z6w2BP6MNI+k7UPNEZCT2Wl694ynWSVUSv7GPmvdBB2EYYto/rYzmlJe7TYdYjbzpOoUN68Ui/oFxfm2tHdvaQG5e4itn4FI5mRyQ8oV6DxKaROcacwA6vIlXG+D/C01uQvmdDuB95wJvK4hXScGbCzR5IxQGws3QsRf6p45MCl2lt/AnzaJEjIUvrDMnWpCyzeuLDAUiZAxrvibvCoGVrwuJB5o1WxqcjALG2EztFC8Txe62eKVzq5BUGWkccfehIEOFoPb0C7UzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnlghJIKm7Q/6WamgAsZeomBm8rvRfibPG0F5wNRrzw=;
 b=jVwHu2AXKhOU34MHJwWOZfp0CEZLJsRPjLGkmbbCbx8U9O84+irWunZu3gvnMxEaQyNIy+VaQ426J49hh+er5HSWIZuZzMx62iffO3y/jTYhPTOJ69q4xlY++f5sg0H3G4YNUG8sBLPTVkrPPdV4kKjxZhC//ejFBSKXNS1BtruHi71ZO2MrcWh666OhzW1fqbtaUzzZ4H3kd/MqjW3aYQU9njd2Qh2w18tSsxFPf97ULxcWEnu5V434FwVKvw05jBSN3Cxonb+pJ5uIUb5P8lKUKwCk4Yn3xqbNbbIpc7QUskx7nn1NwObvMSG5iQI4VTfupkAaOMZBpfDN0j9QBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnlghJIKm7Q/6WamgAsZeomBm8rvRfibPG0F5wNRrzw=;
 b=IC/cXAokxdRALHindZOzbYUaNAKvWzAQove1VsgaT4JwJ/G7MSsqZqdQIDYBslO6vLjx/9d+7T1oLddrlcp+oT2nRLi/sNyKCkbGS8Ez+RoVlSvFmTLwqribKXu+QDAOudWwMS2s9t9SvTMuWUkm5nAhqYn9SeUIeI+TvmPkykp4vPB1xutLR1RVvJGk2boqZJwnoq7c7hv9LTfBFrd8mnw/7qnWRS5MrPPx7OyTwi2kg6VVLNh0dmk6p5Mb9xMTwPV5haYNv4YUiB9qU5pEjyJPXIfkSPRHx4hqy78X0syCL7uZ0sFazwnuYqV8kG+paP6oguA3zHh2zlvldMgpuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Thu, 8 Jan 2026 23:56:47 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 23:56:46 +0000
Message-ID: <c1938b35-a9f0-4183-9da4-91f434d49ae2@nvidia.com>
Date: Fri, 9 Jan 2026 10:56:37 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/amdkfd: Use migrate pfns internally
To: Felix Kuehling <felix.kuehling@amd.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-3-jniethe@nvidia.com>
 <3bd6af70-7b76-4938-9d56-e74ba0b202d8@amd.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <3bd6af70-7b76-4938-9d56-e74ba0b202d8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYCP282CA0018.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::30) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 6164d893-3d9c-4569-55bc-08de4f119500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1NFTGQxckNDU2xJYzZLN0lqbit3TnUrSWptZEQ2VUVXMXZGOUk0aUVHRWFJ?=
 =?utf-8?B?NCt4N2c5MHArZWhIN0FPNlRiL1JSb3U0dTUvOFN3amszL3BMaXEvOHlFeC82?=
 =?utf-8?B?UkJGUzJUck1FUlVnSEY2bkRXTHZOZWFPcFAxa3NieUVLYTVUVmdoSE8ydmY3?=
 =?utf-8?B?Uk5NZHdEcGwxNDF0RU1JLzZ1TC9keVREU092UUFROVh6MzI2aGVoWkRXZ3Fk?=
 =?utf-8?B?SUswTVNzQW1qZmU5cmtPUUpKTGRGOFhHQU1yUnIxb3hwS1NWS1ZEcjIxSW10?=
 =?utf-8?B?VTlPcjh0QklVakR2UVo5NnVVOWRLZmFSYjR2YzJ6c0dsMHA2UEVpTWYvaE85?=
 =?utf-8?B?TjB5Rk52TlpuV2ZLY3c5eW9sT1JzaDlvdDBCOWVES2J2Y05kbEcvZUZlckpv?=
 =?utf-8?B?cE4zZmJPNGpZd3VwbDNSTngzeXN3STFEdVo3b0dpY0ZVTStmcVdUeURnOTF2?=
 =?utf-8?B?ZkxPQTZmTDNjWlNyNk9SalA3aWppTU56WnZNOVBBZ1hTN25zUXM0SE1LZWxr?=
 =?utf-8?B?dytFZ01yNkhFNzhCZDR6Wlp1OWtOR3JCckNYL2pIS0gwVWY5L1hvK3k2dkh1?=
 =?utf-8?B?djIzK2xGYm1nWXovRGpwaUN3VGwvb1VDcHJSZjV2RE5MVHBXb1BoQys1MmpP?=
 =?utf-8?B?ajlyMnFUYVdVbDM0NUc0SUpNZnplVDFYREpmS1Z1K3AyVVNEdERETVJJdDk0?=
 =?utf-8?B?UXhPelpycm4rbFNtc3ZwOEFVcnNTSDBTY2w5a3ZDTUxOVGdzclpQcVpoRWVj?=
 =?utf-8?B?ZkdNZXBaV3ZiMjhzYWVCcjVtWno3WDNWNkNDSUxMUEgvNTRjSDFsZGgxMHQv?=
 =?utf-8?B?TlBQUGhFS2g5a1NzZ2JRdXFtamNwV0JacTMwbDAvTEwvQk5ORUFkQjY4a0hR?=
 =?utf-8?B?bTA4UHRkT3hvTG8rYVpreTcxd0g1ZkNLbVJHUE9jdVdJVTl1RUdBSHgyUjJ2?=
 =?utf-8?B?ZlZreUFBRHh2M1A4eGFiTE5wUytRdmJuMWt3L0pUSndCOUtObFY2K2N1Q0RK?=
 =?utf-8?B?d3lBbmRPOFI5bjIvWWQzQURoK3NkWVU3MWN5bmNYbE5ZYW1LSGZ2OVNjSTlJ?=
 =?utf-8?B?a0pIaGVKdDRBNjV6Wklid2Z5Y2Z1ZnFKeFJSTWV4L1BUU1ZocmZHczMrVkhO?=
 =?utf-8?B?RmphM0s2RnZtM1Vnc2VrK29IMkdsMU1Bc2hzVXRsMWxKK2lQVjVES0RYQW5z?=
 =?utf-8?B?SUdLclBZKzNxZVlFSXpCSjFPVXJaZXgxb2ZpekFxeFZ3Ykkycm4wcGE1UTBK?=
 =?utf-8?B?emFtMmxIb3ZuUkFaZGhMTWtVWU1MbWJaUllWRUxaczFmYjVrYUp4UDh4bXJV?=
 =?utf-8?B?Q3ZHMThVQWtBQllZZVhMbW5SYWpyQmZpNTZHYWYvWmRMWVdCQjAxb0RBU1JY?=
 =?utf-8?B?T2R6VFYyaTFKOFFLZ3ZBaS9sb0g2alQvZWFYL2NaVUVqQ3JOWnFERzY2RGcw?=
 =?utf-8?B?emZDWVRoeE05b0hoZDBYaTAzVW5vMFBQKzg1TnlNRFQ1OXhsKzA2WWM4ejcr?=
 =?utf-8?B?TVQ2clNkSXBUelhBeDI4UFZaaEJhTWVPbDRGdWhzdUUrWUhzK2drT2orSlo0?=
 =?utf-8?B?emZzamlHMHdkekI0eTdoR2JQRFY0TTEwVmRHdWpsVnZlRm1qL3pBZk1vNjJN?=
 =?utf-8?B?RFlxam1wRW1JcmF1UkdXTWl6MmVWbnRaMVB6cFBlWThYQXZ2aU5VMWhJRFVv?=
 =?utf-8?B?NmQvelBVcDh2RjVtL2NXc2p4cDdZdFo4Y1RjK0pJSkxNVFYvYkJhOHMvN2tm?=
 =?utf-8?B?MUF4cTlvUjJnelBXaUlXZ1hWY3p1MEx2RVpYZUE1YndXUCtiUCt5L1JsRXlN?=
 =?utf-8?B?c2ZKbHNBbWNza2xBZEl3ZWRQdUlpZXdPcktQZm5DVkp6QzUreHdBWi9oNWx6?=
 =?utf-8?B?ZjJ1MU5tWXA2QllDbWVha20wQ2ppaEVUZ2FvVkNpVzZrb291RFFyNVREaWpM?=
 =?utf-8?Q?UDodlLvk6Ro3j5p40/CLoDR3E2ZxafUq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFJTYTNvZllrVEI2aXV6RUxlVmtXS0tHd3ExbU4yK3ZIU1ZzeEJzZU9nWlh5?=
 =?utf-8?B?bFpCNHJDRUtXRXhITHVqWFFuMmllME5sK1B6V2FHU2IxUDJsbHFaM3NIMlFn?=
 =?utf-8?B?emV3KzRJS1ZORWRVWW9NekxqNjAyMk9jbkNpcVk2eDlCS05EQWhSaHBzUWNr?=
 =?utf-8?B?Zzd5eUQxNnM1WXA4MWRnOG1qUXQ4Yjg4QVlvc2xUNzhHNjFCblFLSVJyaVZC?=
 =?utf-8?B?dllaR0c5ZkZSUTZIN1gvZjZ5WDZSZDV0YWRrQ3pweFlRMVJwclpnM3h4VzZw?=
 =?utf-8?B?ZExVcjhKUlZMR0dOU003ekQ0UzAvdlB5YnVnV2piT3pHTW5sRVhkQjRWR3dW?=
 =?utf-8?B?bzNkQTdReE1CYlVUSUM3Y01HOVFWOHJDTktTckovVmxIUTNWRGVvNC9JamVJ?=
 =?utf-8?B?eFV4MGNMZm8wcmtyUjFjRDgvSnRrZHNDWmRzdDIyc1NHZ3YwdVdrYWRzc3JB?=
 =?utf-8?B?UXRCR3QyU2FWVFBGd3NGMVlSRGI2UjlsZ0Zvb1FHQzFtdHM4a0MvMjE1SmZx?=
 =?utf-8?B?SVdwSkwvcXN4Ny8rcUswOWV0eUcvWEIwZ1BUWDgwdEgzamsxZXhYVU1rQUR5?=
 =?utf-8?B?ME93ak12M25yV0VXTktKUUNNK2R6TVpBc3lrZnNYZlBYTm5LSlJEMEMwdCsy?=
 =?utf-8?B?Nms4M0VmNThaRDhBY0ZFRE9HNEV5ZE1HOFppTGRud2xMbHQ4UVlHYUdqY3RM?=
 =?utf-8?B?Z28yQmNhWFJ6Ui9CVGZMSHZXZTJBZWVpdWdhRnBic1dMaDhHRDBLNmYxVUc1?=
 =?utf-8?B?M1ZxaXU3Y3pLZzZkKzNESHNNNUdFQk5Yd3NFY3pQL0JEWHFXK3ZrWWtaV2Fx?=
 =?utf-8?B?MnFhWGlzRExUajFycC9HdWRFYjUzWVlwcmZYUEoxMHZLKy9EellCZVJwWnNI?=
 =?utf-8?B?R0JMYVVtcncwb1dNWjVzQ2JEN1VkczhhaW5qQ1crR1d2cXc3N3BLNVBxd0Qw?=
 =?utf-8?B?MFFmbnlCZEZpSEZJa3hiRzFjL282N1gxUXlFVjFJOWNNZnVzc2Rab3duN0NL?=
 =?utf-8?B?cE5uY0VFd0xaSWFCVmpGRnQxdWxSWlFESmFOQVQzTmFCUG02MGo5b290LzZ2?=
 =?utf-8?B?OHJXek1rcDZDRk9NK2lldEtqeU9kS2dvYXRlUlRxMkRQVWhPNWh1Mko2YU9N?=
 =?utf-8?B?WVNwem1pNlZISTdZcDBMMFVMSEdhUHlORTdxaXpucm5KaEVYRFVDSHZPeGho?=
 =?utf-8?B?S1duMVl6WnVxNXVlbG9FUzRvM2RjdjZ0c3ZQN1RxZ1VGaDlOd3ZNVXFYV3RT?=
 =?utf-8?B?U0lyVytnT0tQL0hDRWNGN0JmKzFReXNjSG5kSG1MUVJLTGtzbTVsdTM0MXhj?=
 =?utf-8?B?Z1JTSEFEWG1kdTJpejVCNlFMVnVTV1hHWEdPaDlBRmVDQng5QXFFRGN3Vit1?=
 =?utf-8?B?UjY3Yzczc1k2MGVQMlhSQVdGdVRoRUdWa2pmbzJXYWo1OGFLRHkycE9XV3Iv?=
 =?utf-8?B?QnYyUjVWODBhSEhtbjl5Y3Nyc0dEaWFjVmVPYzNsbE15WnZSZVRLR1ZydDBs?=
 =?utf-8?B?VHJUNTlQYjZpMEZDQXB3dmtXckNzNFNYbjgxOUt2R2k2WHpsYTJLQXo0dHQr?=
 =?utf-8?B?d0ltU1U5OEttYzhFSlBwNjE0anJxVERXVFZibGMzYXRSVXJkZUQwVnRkOXRs?=
 =?utf-8?B?OXZQWHRTUzRjMkFsSjZBd3FKRHJGLzZTTStQb1dGalVMdm13TG5NK0V1Nndv?=
 =?utf-8?B?Z2RMelJVSzJoUEsvdGRlb3VERzBjOHA1aXlRRDB3S2VtU1ZmQ0NPSC91U1dy?=
 =?utf-8?B?eThrYmxtZ3g5a3c5QU90cUlNVm14MHhDN2JpVFpiY09OVmo3TXZ4S1JTT3Rx?=
 =?utf-8?B?R2EwTXpVK1daUTgrOHduL2RnRlV4aW1QTjdZR2tPQUdlWHVnQ1h3OURKbjhp?=
 =?utf-8?B?V0t6NHJFa1B1bjhNdXI3OU1SdGV6M0ZTa1RJb1phZ3V6MFdpK0lSK2N2ZnE2?=
 =?utf-8?B?KzdIKzdBMU5qTDcraEkzcXV2dUFDbjM2SzlHVFlDWUtyd0J5bFBtbFptOUNi?=
 =?utf-8?B?dDg0SGJseUNicFowMkRUWkI0azhLa1VHbkpCdlJoL2NkdUN0dUZ3MlBxVitY?=
 =?utf-8?B?NGtRRG9mYjhFcWVReDBLajZGWjduNjlFUXRjVTRFS05mTFp3R1VtSkhTODJq?=
 =?utf-8?B?b0hKQUFablpjLzJXZFI0M2FiZmpRVGdXY29Nb1Fxckd2cmdTOElBNFliTmhX?=
 =?utf-8?B?NVIxdGpkV0tuRWRqL0kwNG9lR0praWdEKzFhdlQzRVJ6enpIYnQ5RlcrUEJj?=
 =?utf-8?B?Nkt3d01TSVhPNTdPMUhZSXYyM0tJNUc1bTc2T2NGeXdCQ1FSMUkxR3piVzFZ?=
 =?utf-8?B?WG9QblRuN1pMaWNFczFMVjZQNzI4VklPWEI0dGRrOFNzUVZFK0piZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6164d893-3d9c-4569-55bc-08de4f119500
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:56:46.8763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tzdroCTwxGHndkuWzKoi3im0m71GU/Bgc/52CxEt2JsYy0UhTIA3NyDobeCyBP1Whwb5IZBkGSiNSTwEekfhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 9/1/26 09:00, Felix Kuehling wrote:
> 
>> @@ -235,7 +235,7 @@ svm_migrate_addr(struct amdgpu_device *adev, 
>> struct page *page)
>>   {
>>       unsigned long addr;
>> -    addr = page_to_pfn(page) << PAGE_SHIFT;
>> +    addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << 
>> PAGE_SHIFT;
>>       return (addr - adev->kfd.pgmap.range.start);
> 
> I guess we rely on the fact that for DEVICE_PRIVATE memory, adev- 
>  >kfd.pgmap.range.start will be 0 after your patch 11. So we don't need 
> a special condition here to handle DEVICE_PRIVATE differently.

Actually pgmap.range.start won't be zero - part of the change to the
memremap_device_private_pagemap() in patch 11 is that range is used as an
output parameter.  It returns the range we allocate for the pagemap from the
device_private_pgmap_tree maple tree, representing "device private address
space".

But it's correct that means we don't need special handling here.

> 
> In general, I like the way you handle mpfns as it keeps all the special 
> casing out of the drivers.

Yeah, it does turn out quite neat.

Thanks for review,
Jordan.

> 
> Regards,
>    Felix
> 
> 




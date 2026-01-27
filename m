Return-Path: <linuxppc-dev+bounces-16294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAg9IRUHeGnFnQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 01:30:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6598E7D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 01:30:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0RBS4bSRz2xqL;
	Tue, 27 Jan 2026 11:30:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769473808;
	cv=pass; b=D6BN0jET45yN+E10uslTlbPkl4Qtzp8WzEaW/ac0k24SmGFIgKseuK13QDQXJfynJ0goQdtFh5Nkismc77DZHu+Qs9bNn7uDKBNF3ffrATeSr3iuJqMkBp6Ffd07TWOk2xbAUJKOogzqZfuvv0Jfk9cBajujs5yd6Tis1jiZsTJEX59BRawbla9WgvDosjHsgSB08m0DB9/ICHDslToIk8HaH1dkPHPfSK0fM65wrPGPrSYTRtKP2xVbz3dre1XbKFU/XsLiU66glc3mydMTGTxEWF+DTHBeqo1A3d82ft8D2vgLhSoRFSj6ZZ1Lt4mhsyYe+PuBmlihUJyI3rUCyA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769473808; c=relaxed/relaxed;
	bh=6uIBMm6tW15nT7uZEYoMvvV0I2V5C9SX5PBIm8Eay2Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cBGDbLud66vexUsQBIARyJM4IGk4jtM7AaeHKoh086nLB3iOpkc/KClKDKvrsRmECbEqZx7ZFpwzmJ2HMoLrahsQW4HtoYPMNGeBmmBAYQfh2rzodO9tEP8iZ9F4l+uVxOOZVCLXULfu6siRbfZMoitiWiImqLphbMkDXRoqT3yV5atjG6pcrt+TFIaX3+Dv/zwxx1HYE6J4jDDFpEvT0tTVLxldo38U8kYdt7weZbxRVxvq2UcWF1CwU0wlGg8VVJFtxDeSymJRAocMivHmyfPE6OfYs39akhfjSiuKHo5+2LNLeSF51grZqdYEaUs5CiT/CMe4IJDUF7a04SdRSQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PBlfIdIU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PBlfIdIU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0RBQ6MZ3z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 11:30:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCrU7PiKsuL0cc6Rm2bI9dMtX1L9FZFl2CW/6WnKUZyju+yzg7bvHni7aNlornB2SrSLWjZ+pjVR5HSa0112phAxTSdcdiX8yeYaNmqFJ96GG4d+A3NTpTnsnSQiX3NRU2wWDgTRLqcoUkEd6fjaDOLZr5mDqdOk56w2RZAUC+ohGWhhT1LMvmEUV2FrDB7uQGFiaUc9Zhr42XGEW/nOc/e7EfWWMk4SrEheUsSvgYAWUvILLSDIbl1fIsy6ct4opWEQcI+/6slTKYox2i+mNSmHaLugnzprVTx1ZzdOz7XbMn/5bQ7LM7V37G3uJGC6CWswHD9QHbIwo5eRItHUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uIBMm6tW15nT7uZEYoMvvV0I2V5C9SX5PBIm8Eay2Y=;
 b=Kt76KJ0jIXuQnbMbTKNR/nEMLUlpCOtvQSfoD2TMeFzi268ZrnkKyNaEcCUfn/jOd1MeVkwmRAylJq3cmClPTA759d54jbOvjZisyZUZOmkED9N2KX23SQyXIEZ1B/I1ZIntorJPOiH1vRtd7YINKQt6Xn2eJczUmqeIBJ+UmzrKwMQwPausTR9q47UKLBYumWrWFNAqLAanTQb5OEuSCnHWp6IbXIWHyz9yRCZ5Pn1Bzq0lV9DV+pKXCh9rocJ/T9avZyipgLq+a7KXXGfN/MJpUwr2UScAtvI7/47CZX4Ie4wVXQu984jBOv4FCUJhuPXazfisbORD0MByZ3vTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uIBMm6tW15nT7uZEYoMvvV0I2V5C9SX5PBIm8Eay2Y=;
 b=PBlfIdIU8wPHbH9WcaHD62yP5Y5OXBy/xd+YiD8UwVeNFSANChitj4ThFbwGzPmLgPiJcIhYymfHmp1c8XKpm576zF5qe6lgG4RNAYsqbDiMNHrpdjc5LYP4mjruWZg8XdeYv3LnNIjrngw10QPNCYdkyPzBYFt9s7BvW+JXemvZRtqQjs+Wq9DhvU+VZelv9ACA9q4NBjGdvLgMwFFmzesavZweYPcDSn53qzIPpYrjBaYgxL0qrFj98Z5u/tN0p1Mq/K4kvEPium6f2wznvxglQUu/9O1k4Zyw3duUXY1vyEjOkpWfdtOTakcUzS/EegYYMO/T7eefR9Huh/ZsHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 00:29:39 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 00:29:39 +0000
Message-ID: <413d265f-9ffc-499b-8dbc-26f92bdff6d8@nvidia.com>
Date: Tue, 27 Jan 2026 11:29:30 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] mm: Remove device private pages from the
 physical address space
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-14-jniethe@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <20260123062309.23090-14-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 427dbc75-b2de-4896-3e35-08de5d3b2818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlZsWis2dnJ6YitlcWFrVzY4TCt3bmNHQ09UTlpMS0pVT29EaGlUMG4wQWFu?=
 =?utf-8?B?Qk9JOU9OUExxSHlzTTdhMDhiU2NrWUNrWERmU2g0dDZId3VpOTVEaWVpN0xD?=
 =?utf-8?B?REd5OXR0ZVNTZVVPZy9nQ1BtNjhzZ2svTmdPa2tNdVArWXVJUks4b3RZbkVV?=
 =?utf-8?B?enpXdm4xMERnZjY1VjdlM2tYdXE2Y0h4Z2I1UGFESTY1VGVaMmZZOGp2dUF5?=
 =?utf-8?B?Q2RBSG1yeTB6TkNBdDBCbUZjTEN4MG1GcFdWbkNxWFNOQ0diaFlpNEFEK3Zv?=
 =?utf-8?B?MHY4OXBxMGYrNVdKa1ZZdVl3eEpCWmRzSmtnWlRNOGpDczBWL1hPTkduaHJy?=
 =?utf-8?B?Y1hnZ0VTZm9aY2hmdlhaYWwza3NmVE1yOGt2dVY5VTJ5bnNtRGljTndGT3Fo?=
 =?utf-8?B?MXByby9EdTQxQXQzeGRQbEQ2UUtJYTZrRUJsV3pRUGdSWGpNSDRZd3p5Q2oy?=
 =?utf-8?B?RWVGaTl2RVUzaFBISExRc3JHV0pzclhSMWlhSzFjaWEyZ1dmcG85NUpHUVlv?=
 =?utf-8?B?REJKV0k3NXVPV1lMTzFRWFNETWhWSmJxQ0NST2FKMzkzTHZhY1hIdXRPNkEr?=
 =?utf-8?B?TXpTNnBhUHE3aUpWNlhvcUhCL3dWM3VQK1B4U2pkMlNGeDVKZkFjTmd0UFBP?=
 =?utf-8?B?bXh1STYrQzAzSFFZam9TMkgwMWsvSURtaG9hcEVHT2dKR0xSZTVEUUs1cURt?=
 =?utf-8?B?MXlsdzZsSng0NENPcGFFZVZGWG1UdU9rQWZMbFYycXRTZ01BemhrQmxqQlQ2?=
 =?utf-8?B?c3pKWS9jUTFyZy9nOFk2SEFIV0JLY2hnZkpycHpwczYwckNLb3RQM3EzQWs2?=
 =?utf-8?B?WUlhQ29OZWF3NjdSQ3VTSVkxdkJ2MHY4N01HUWs2a3FKL2xFdkZzVTlMbDdx?=
 =?utf-8?B?ZUJzYmdLTlBDVlZNS1Eva3pnclpMdE50VzJPcmFPRU11alpEcjArOUZDSXVs?=
 =?utf-8?B?TjBEVHVGRGJtcWZkOG9sbkJyVmRYRXNQMzZpZ0E1SFp4ckFlY0dKT2lDM1FT?=
 =?utf-8?B?cDRNMWtuckJoc3NPYnRYNVVDMnA5SVltRjQ5MDhuejFyU0JXMGxHUTFEQ3ZL?=
 =?utf-8?B?MExja0RHa0E5MlhPZTlkRnV3dk4xZGNCUlpnQ2ExNFhUak1KYTM3OFRmazla?=
 =?utf-8?B?cHdpVVRXZVdIaWNXTkZVQ1E3UDk4TzNaTmJ5UE9NcmY2UFFLSy85cm01cGU2?=
 =?utf-8?B?T1FhRG5CMlNzdVl0TkQwbDRoMGxVV24xVnoyM283dS9BQ1QzenNVV1A1WTZM?=
 =?utf-8?B?YkQxeFIrdGpoTUJHbFBDSXRZRFVMc01xcVo3ZHEzSytDUlE1dlk1SVVMY0FQ?=
 =?utf-8?B?b0U2NHJFVG9VUkNmaXdsbC9TUnFwTlFkajdZTlk3dE9wWG1SYkNYNUVrVFlH?=
 =?utf-8?B?SW9BTmN3SkpFSVpCQWlTNmlibnFlNTV5MmpsVUg2M2JwUmcvU0YwMGxxcGtY?=
 =?utf-8?B?aHF3NDFBVnVwbXROOWgrNXBXeXpReDEwd3dQZDFLK2dWajFSbFd3a0ZmWG1i?=
 =?utf-8?B?d0lvVTcrRVBIL21zcXZvRmRGd0c3c0ZmR2lZcWJBU3hRZ1pWQmhzdE5Kb2Vz?=
 =?utf-8?B?Qk5SdmNKM0RKNGl1NVoyN21ZeE02bDFYVUt6VG9MZ0ZMQi9FdHl2cDVwKzJQ?=
 =?utf-8?B?cG5iWkhxY2cvOE0waTJGUWRScUUxNGNNK1ltaC9oOVdHOXMwOERTcHBZaWtS?=
 =?utf-8?B?a0wxamZSYm1FV0cvRkF3d2Zkb2Eyd05rRCtzZHhjRFAxYTVvbW50RW8vNlFn?=
 =?utf-8?B?TDRHNVlRNFozVU1kb04yRUNrNC9FM0hHVU9RalVJN3FnTHAyM09PdndOek45?=
 =?utf-8?B?Qk5hbXVDQ2JURFhJeVFoaFZLS2E5ZXpyZ0pLZG11SW5teWcwOWdWQklndk1h?=
 =?utf-8?B?MGxUY2RlOHY3eURHQUhVWlE2ZjlNVlhSSzl3S0g2dEJvTHpJaHc2UW1CVnFa?=
 =?utf-8?B?K0hhb0Y5RVREYnFMK1NuV0d6OE9zQ295b0xGZUwxZTlsSGxPVXd4Z01GUkov?=
 =?utf-8?B?TlpJVmx2WUVTbExQZThpdmlIdFBCN2xBa01rUVd3NU1nY1FsRkJ2UzYyaEtm?=
 =?utf-8?B?cndveWVZb2d3Nzl3ZUlPSzdHSXptTFQ5ckdRM1FBNlVYK3VLNkI2VFVBcFNy?=
 =?utf-8?Q?CLeiWCMWVpqeMlUK3RGk05rhF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWhOLy9lNkEyWVBDZTBHZGRRZXNQaHRYUGVrZGJhalQvY2wxQU5yMjJjTWtj?=
 =?utf-8?B?SEVnZWM1NmFTNURSbzEyVS90WXRGWU1odjFSVnVhUVNGM3pYRWVJQy9weEVq?=
 =?utf-8?B?aGdGSWx5UEx5bHo2TXFMZGQ3dU5JanlKbzZsUnZDYjNndmYrcU9KdGNTS1c5?=
 =?utf-8?B?KzFuMnBDU3lUbUJlRFZ3SURlYlNYakI0V2xUTXRObWppODFZMWxLYy9lT1o3?=
 =?utf-8?B?TzV5UGtTN2xqSDRZQnJFUHlwcGFQVzg2TGorRXFZRG1FN2kzTTJjQzlScHVC?=
 =?utf-8?B?MmtlUm45dWdEMURFZVdlUThGKzZqNm5zYTJHM0RLRDMvZ1Roc3pJejFmOEJV?=
 =?utf-8?B?ak5Xc2hrUHBmOFVyMWs0QVpSTkl1dTllUCtlWnNDekorRGcwMEllcjV6SFYv?=
 =?utf-8?B?bWlGT01jelJFNHN2YlY3N2hLZmw0R3JwbjFRSVhyZHF2T0tzRkFkOUJ6bjBx?=
 =?utf-8?B?a1lrTkg2SCtKbGZIUXRmdVNmK3NKT1YwNTRXT1RoR3R3cGI2MzdBakF2anZn?=
 =?utf-8?B?WlZGM3FpTkpmdUxscVhHSUh0MkVPYThyckFnUW40QUJIZFhBa2xGZE9kbHQz?=
 =?utf-8?B?VFZhUGhZNWdFSW5EbEdFR3JOUEtjTWhWMnk2YUJoQ2tuUXdPK1JrSGlnMUFj?=
 =?utf-8?B?ZmtzUFo0c2FoelNMaEFJNHVNZ0F3MWNlSzNDOWhYNXkvUm1sQ1NXd09ZU2Y4?=
 =?utf-8?B?ZTJXN1lOU2RIRXhDcFBLQ2ppS2NWUm1YcXpzSmZWL2l2SVNBc2hvMEVUOFRC?=
 =?utf-8?B?Q3UySnQzRVhpaHI3NGFQalhkQU55U2JERDVpUTlqUnV4dnJzL2E0ZnBzZytY?=
 =?utf-8?B?M0p0bzdDOXJRNlVCdk9XcXowbUJrVzl2SFlLZXIvU09sZnJpTFdmRHRHSDJ2?=
 =?utf-8?B?c0dSOGFOanlTU1B3R05uYk52U1ZMVldjc1JOZDVYZzFwTU5QWG5wbnpkSFJZ?=
 =?utf-8?B?NnNVQlUyRFZRVFU3SDlxSE9ZVWlrRGtLeHhhRVF1TXB1SUZ5cnQ0MTdvWGZV?=
 =?utf-8?B?SFlFMWxRSWkrRlAwb3BmNGFsWVMrRVBEWFNjcXlkd2VIT1htekR5cGE2WFJT?=
 =?utf-8?B?NGJuK21Rayt1Rml4cmc5RzlWRUlXc0o2b0NIZlo2MjBUQWg0QjBXTzU5TUE0?=
 =?utf-8?B?dk9YYkpsSVNmcjNndVE4T1NNdWVHWDhiZDg1SU56akEybnZ3UkRycGgwbEpv?=
 =?utf-8?B?S0MwSnU1a3hJOFNUWUxFNFRENjRDVXphWnc0aThPWk5IbWJCNzZ1UTd5L0tR?=
 =?utf-8?B?bDQ3bFRzaXdDbytNSG5BOE1SN2h2cmtMd0xaOWlkbzZDQzVad3ByYjBQZVhs?=
 =?utf-8?B?U3hBMTZmb1g3clQydDM5dFBDMzlpRlRlN3M5RXEyV08yQnFqdTJ1djdMRmFr?=
 =?utf-8?B?SElya3R1VkFJaFhGMUpNWkwxNkN3ejFZY0I3L1RvandKcEJJS1k3UzczRDBm?=
 =?utf-8?B?YkoycW91NTRZMW9sYlozRnFGK2JmeThhaWdydmtVekJiYzRJYkdxTzVkRUgr?=
 =?utf-8?B?Tkluc21rY2twVnFFamZXRmFrbVNHZlo1VS9tczdsb2toLzJ2R2J1NXJDZ1h2?=
 =?utf-8?B?QlhvTmpKN0MzSGNBcDRML2U2M08xZ1FlQ3h2SU5hRThMS0wrNTZjNzVpTDE3?=
 =?utf-8?B?dE4ybWEvb1RXSml6M3RxVTVLcUNkdnlNZ081dDltNml6WGRENXJnNEJGUGRX?=
 =?utf-8?B?S1BabFl0VmFMZ0QrU004ajZEZ21rYUtTKy81MFNmdXdKSFFXZnBGVEtGT2RR?=
 =?utf-8?B?ZS9CaGE4UERNdkR4RHp0KzJER0ZNZnZqbjY4ZEVabWtINU1OTlhIa1NWMk1u?=
 =?utf-8?B?V1A4dCtua3hNU3h1VmtqSkZzaVRkYWc4MXI0YjVyQWlWNjMzZjdrb2NHODAv?=
 =?utf-8?B?Ynhlc0NERU1ZaEEzWU92K0o5NzZBbUx5QXZ3dEpRMWhIN1Z1bUs0UDFoZU1y?=
 =?utf-8?B?VWZaVmVDWVd0eEpSdHdUWXhYc2s4S1BsY2o2MHNzbG1CWUV6WjdzcThITTQr?=
 =?utf-8?B?THVybDRycmJwRmlYc3ZoTTJKaUVERmJGV0o4dlpuZnRRTnQxTXl3RUc4Tyt3?=
 =?utf-8?B?TGRhYnNCanRwQUV0Nlc2bFk2NC9WR3V6RGE2L2ZmZU1JaTc1cnZKUnU0WnRu?=
 =?utf-8?B?MUdnd05vOUxQUWxZQlo3a2dBcFNGWHhpdENwaVlIZDRRbnBtSlE4V2RLSUE4?=
 =?utf-8?B?WDdoM3VuV1dJd3hGWm9qZFNtMVZFaFYvbjN6RS9uNnRoallTa29yTFN1Z1Av?=
 =?utf-8?B?Q0Zyc0lYMGN0dE1EQlgzVURjYXVTZDJiWHdHY1k3WEIrN0tqUjQ1UVpoWkND?=
 =?utf-8?B?alB3TkdiOUNsOWdhbTl3eTd6NjJmVVlWUlBSZXBFNm9zb0ppTXBuZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427dbc75-b2de-4896-3e35-08de5d3b2818
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 00:29:39.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9Z//NPYROGfbnjXZtInvdGDxWkf/My7w9XAlvjcHqRHT56nfne141jx1yFvYi1PoTUNPvjY9uUVBBmo/ywIMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16294-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 6C6598E7D8
X-Rspamd-Action: no action

Hi,

On 23/1/26 17:23, Jordan Niethe wrote:

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a8aad9e0b1fb..ac3da24b2aac 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -452,7 +452,7 @@ static u64 xe_page_to_dpa(struct page *page)
>   	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
>   	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
>   	u64 hpa_base = xpagemap->hpa_base;
> -	u64 pfn = page_to_pfn(page);
> +	u64 pfn = device_private_page_to_offset(page);
>   	u64 offset;
>   	u64 dpa;
>   
> @@ -1700,8 +1700,6 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
>   	 */
>   	if (drm_dev_enter(drm, &idx)) {
>   		devm_memunmap_pages(drm->dev, pagemap);
> -		devm_release_mem_region(drm->dev, pagemap->range.start,
> -					pagemap->range.end - pagemap->range.start + 1);
>   		drm_dev_exit(idx);
>   	}

There's some new failures on the intel-xe CI run: https://patchwork.freedesktop.org/series/159738/#rev5
Looks like the issue is a missing update to call devm_memunmap_device_private_pagemap():

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ac3da24b2aac..aadc73b6f951 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1699,7 +1699,7 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
          * will do shortly.
          */
         if (drm_dev_enter(drm, &idx)) {
-               devm_memunmap_pages(drm->dev, pagemap);
+               devm_memunmap_device_private_pagemap(drm->dev, pagemap);
                 drm_dev_exit(idx);
         }
  


Thanks,
Jordan.

>   
> @@ -1745,8 +1743,6 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>   	struct xe_pagemap *xpagemap;
>   	struct dev_pagemap *pagemap;
>   	struct drm_pagemap *dpagemap;
> -	struct resource *res;
> -	void *addr;
>   	int err;
>   
>   	xpagemap = kzalloc(sizeof(*xpagemap), GFP_KERNEL);
> @@ -1763,36 +1759,24 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>   	if (err)
>   		goto out_no_dpagemap;
>   
> -	res = devm_request_free_mem_region(dev, &iomem_resource,
> -					   vr->usable_size);
> -	if (IS_ERR(res)) {
> -		err = PTR_ERR(res);
> -		goto out_err;
> -	}
> -
>   	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
>   					xe_has_interconnect);
>   	if (err)
> -		goto out_no_owner;
> +		goto out_err;
>   
>   	pagemap->type = MEMORY_DEVICE_PRIVATE;
> -	pagemap->range.start = res->start;
> -	pagemap->range.end = res->end;
>   	pagemap->nr_range = 1;
> +	pagemap->nr_pages = vr->usable_size / PAGE_SIZE;
>   	pagemap->owner = xpagemap->peer.owner;
>   	pagemap->ops = drm_pagemap_pagemap_ops_get();
> -	addr = devm_memremap_pages(dev, pagemap);
> -	if (IS_ERR(addr)) {
> -		err = PTR_ERR(addr);
> +	err = devm_memremap_device_private_pagemap(dev, pagemap);
> +	if (err)
>   		goto out_no_pages;
> -	}
> -	xpagemap->hpa_base = res->start;
> +	xpagemap->hpa_base = pagemap->range.start;
>   	return xpagemap;
>   
>   out_no_pages:
>   	drm_pagemap_release_owner(&xpagemap->peer);
> -out_no_owner:
> -	devm_release_mem_region(dev, res->start, res->end - res->start + 1);
>   out_err:
>   	drm_pagemap_put(dpagemap);
>   	return ERR_PTR(err);
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index d8756c341620..25bb4df298f7 100644


Return-Path: <linuxppc-dev+bounces-15100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9EFCEB469
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 06:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgyVm0VJrz2yQH;
	Wed, 31 Dec 2025 16:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.196.40 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767155575;
	cv=pass; b=id+gbJsz1u0ZsK+XkMIjMcVQOv1PdssqXszfyRGXHf5zI2ZOByY/lnE2Hl2sVBEHJMP7/VNTaritGxyOMBC+maIOYD9P5RLC6XZVarx3HAGO00vTNNLocjTPdjcEYm3yZNxfWOIs0xX/7U9JA/6iWtghDJfiVZoGD2YjKnZyRndKfpPXYoXmwHDqopWIFOi370ojpP/vNA8jMi9JODVVBqtl1MWKoC9dEt76ectGfw7iYY0RpM00kBEzSi/IdD8UdM+IEoGoSjkyZj9/epRrawIs5p114J/LWrJE73K1zOaC3nfvrAsJitgiPPPvPfyG+bkNnm4JlTXMmbJdJ+szzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767155575; c=relaxed/relaxed;
	bh=jzyTAGoufa0HQKfpkbJWtD4x04UmM5YLXoS7DsIxpjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCVibRpbmJgVaFh6yZUIbF6nteadi+xkKi2+e7EOT0W47GD+HwHJbDNCVJpDp6G7uyG5o2WKesl06TMvdJyMUV1RARQ1oduewvAK9OrgK1R4FcEO63KSbq3rpMCS+uQJnnxKspXvUpWv0qbxuQSyw364tGDxJineGywEwiEZ+116HZFJpK3yxpJ582pIjb10A04+UJta9ABjCOtrIKGxkh/H90bUyXWU7omais/sCev/aQ99EkLOnOXBUVQQ9AetrFWOiuA1Ukk4v8hhJaAX7CjGiUnsBVgtu8wauQEF6gezHJIuQ88Wa4V3hHvRc0Hfjy25u0WZRFaOauLPwnYvOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fv4eS5tv; dkim-atps=neutral; spf=pass (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fv4eS5tv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.196.40; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgxs30DZdz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 15:32:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu+q2L8th3UU7v3WROUiyepZ8ZEPGZqAtVZbKY0lkgmGBGF6rNjfHNmVTn5Yt5eitFFa5ybwOo2V93XKY1fRPJ7gs+X3WmCUiExy+dXhnhLDqy7/48wYEs47atCaxnyU3ExdD6dXWBwJ3eHRCeXRruNmSO4vGv7CHGf2DNOY/YZvZl7+6ysT28rqrLnTtD8kRGv6O7/0o+5YUStNL3+JLYuOAWIjSLFvODtIyg1grMETg7bNUvAD5D9BedDDB/cPNNyhAS+ibxXuBEi46rr7bVvqOAY8/zw/iKbR6R8J4yp8mDKBN8BvYgqHyLHgYQ7hJW6SOCNxuAADWZMqz4Db5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzyTAGoufa0HQKfpkbJWtD4x04UmM5YLXoS7DsIxpjE=;
 b=Z776rswIKE9pxAhzgjGYMr6J+Rw+TYeSZyqq34JWmJj6HttzpKfNY56fsDiB+K5EJwfi67h9WWsyQLeuQrTDi8wJ+s+SEifKpkYzTlL7QBSHYf29wIND+yLq+LHo8K0uIY7+LafjeXtM8hKXi7Dni+bF5HTFsxBlVZcPBm5P1QO/UxH9VqDMQ9d80H4+My0tljZp6Utg/0Sh9pdxr4BQhw2bfXSgVlxRzTF9+m8E+l3sxwRE9yn5yrVTcPuoS40+DP9OWLfZR/2Y4v9DKiigATExAe06H4S+8Cjr9eTGfJGuswr/oH6d8013gaoBR/JM5oGXtNziMGHQ6b0C3e4LmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzyTAGoufa0HQKfpkbJWtD4x04UmM5YLXoS7DsIxpjE=;
 b=Fv4eS5tvFNLSVfShQwHOliQjKFC3aTOXefrxmVWaTQIoHZEZk9mJ9AIATESHl8IMfW4IUYqI93ZXZyyd8s/qkwc/i1LIqr5BsKwrRX+Gq8OcPWGmHNAk4h7/y0me41e9YzKLMQFtk2QPEujTTveNrFzfmhpJHxMutqukoBG0PZgrbUGDNYmxE3uuu/+Vp7+Nf1SZ8vhv1zdfslwH4ZspAFQrRwpS9XeHwXl3B8UD85dwjhNKPScYuClcJwHozqNYqlTz8EGpLpALHxOHjQYuZUMYJhO89dI0ZOe2m8KfYVj6OzgddV26hhib8158vfUl+BEaPZdrIf5mNPFoh0McCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Wed, 31 Dec 2025 04:32:40 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 04:32:40 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v1 5/8] mm: Add helpers to create device private entries from struct pages
Date: Wed, 31 Dec 2025 15:31:51 +1100
Message-Id: <20251231043154.42931-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231043154.42931-1-jniethe@nvidia.com>
References: <20251231043154.42931-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1553f8-5a62-4e29-880d-08de4825a19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XYwxDUa+saQcx3hpGM6zBGJVcV8i0aQtJrrtvtoVbXLILWk/cU1Jgyd+lLAM?=
 =?us-ascii?Q?VKTxry7Db2eveoKvmAd70/GLtSnXSGkQlML9r2R68uqJ4tD1zubpxsm31oYV?=
 =?us-ascii?Q?CxWpUh7IFeqDNUGPux+5DAQ2pDey5eDu3EgqC8exs+t882x61KvN33OVIpkz?=
 =?us-ascii?Q?KTravwPdCP23jKt5CdCPCqm3fnjwzYmfIQQGaEEhxrKmF3PhdTuCMGUa5D/c?=
 =?us-ascii?Q?qXaK8z99ipId+rvCCOlkGbqHIoFMT/swDVfc/x8nXA5rXkOh53N/JYF6N0Fk?=
 =?us-ascii?Q?u+rosJMBYREu/UxwzLe3jT+jqKSO70Rpv62ynM2eZnWG892UrZv1jXRSx7M+?=
 =?us-ascii?Q?C2LTUxNRHIDPWh/bCNyd2qEPKs5fPaB3aOQ0ohxmuCAWkCaK++WJVjIgNjdy?=
 =?us-ascii?Q?7BQbtpK/6Btzje/TeaI8K/1q5sAC3BInersIgAtocxDUlmbTjFqMqFgFGcFP?=
 =?us-ascii?Q?NbUm79tK0lMvBEX6189636elKwNIPzX8wKEKO5J48CrtvG+m6FxhoIH1jcQq?=
 =?us-ascii?Q?A8IiJ6/+K+4gW4Bf1sEYMxA/RUyVb+1esTUdNYNPRcDhprHT61PF/PUft7Mg?=
 =?us-ascii?Q?DDfV8Fz+Wut7dY/XeGJMiNR6CIvHH02eb+GHNa/ZfT2AzaQ2urnP8kZv4o/R?=
 =?us-ascii?Q?OzoWkmXr/DS7E3ZH+edJGinMefloYn48jVT56W5716In0PjCLOcJR24C2Xj+?=
 =?us-ascii?Q?T/Db06sgTYDtZ7NXA/OaRIcVWsNDLIhyiy/fTFgkeUDuRgqg87IIqTWUQ7Li?=
 =?us-ascii?Q?nA566O2m4eVqMsW+a89/lkibhfzXB1jbyaf6+pGj8dBDZ3xgrc9Vot/7Y2SB?=
 =?us-ascii?Q?YVmVgUBr+cZcb4XvYTOMlBpffmgCYO8yAEaXeDLfddgmddy/MEwgvgenj2u8?=
 =?us-ascii?Q?FwtmJJ9zVLZiqjM5uUqgOgk/6BbqfpddLj0/fjbHpus5kj814lNwtrYKCoqg?=
 =?us-ascii?Q?YbxdztmQXQCDdwXxwt5he3asfwVPa62Rsevke+grGfuTXusMMPnjEd6x/ETl?=
 =?us-ascii?Q?1HqQmrSywi3YSgy65gwMOwbi/rKVoV08kLUdvfOmiXHJLAhjczClIawcxkRh?=
 =?us-ascii?Q?LMlu4lytRf+3KIFgTH2KRHG0P1q0FEgX8DSahZsXtV6Xw9bvE6uvzw7r44hD?=
 =?us-ascii?Q?Xvxo8bCRsG2kmWlKUm+aOt8ASL9Lwcfg9sTnkW5kUz/n/0/21jhVAzCNXGX8?=
 =?us-ascii?Q?vSFaPMc5fkDUKKftHtz0ikmmgoMRBEw1aEGPo6O31zPW2K/bohmA0uql9sy3?=
 =?us-ascii?Q?h5l0y6IEQSf2GA10IH7ILBShTXofDI2PaueA6tJKWrOLfx9kG/E/BTkr0gUt?=
 =?us-ascii?Q?kCZvVn+hKWQMarpyuI+QmWVYSZeh7oS8+Di7qZhbkA0IvsEcaOkN3u1Q2+Yr?=
 =?us-ascii?Q?3pjr/6adCYVaRzDHBcxlcVpOs9TpsKBFkU2uI0o5IO+BHCYJG1b9iV9ALlrG?=
 =?us-ascii?Q?SBnY/Ta7UESwtMPX8hCEJN9sPV2vJfSH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vJ3dkN1pcvfV719r23DTdVX2byzyNcrUbALMCNQqLFynF5W/FEPthf+3KCTX?=
 =?us-ascii?Q?ufQiunC2lO9GoZxCTZTDxCUmSFBRfJUVmcmCjw45ipllNqZDkBIYGeFJfQuH?=
 =?us-ascii?Q?bt30DifJf+QqNG1+IvUNs6Gm8lDS61hxbQtFYP9qdo5BxjuZPTpG/jPmJ0Zd?=
 =?us-ascii?Q?Z2fvWcva+ppq7ohWk6tdn1tiBYsrfGn8uIKz81TQK9Kwjv9xED8JZn8wRzT8?=
 =?us-ascii?Q?BEJTj8T4kBnX/FqcA8jcoIoywop2jiWUvC6ewwa40IbHH/QYFFMXYBATAVvE?=
 =?us-ascii?Q?RQNMVg2euVvX0HKgyR9Rup6L/BzkFcXcoPqyiKWpG20jHmoZtCPuTWhJteK1?=
 =?us-ascii?Q?qaGnTU1CIe+caH1krZzQMZcS+SAKj2np9CvJkySmC8j/16aQKW8gDW+UGn+O?=
 =?us-ascii?Q?pPT76CNGBXNHp61ARk/uh1QPW73mdTCkIBg3Un7Y/5KvCxhYsLUkFMqT8hdT?=
 =?us-ascii?Q?0wgEW5Jcy64e/aW6Gqkib8kVk8Ual6dCtBR00s/a1LfJeK15NVYN6k3Q1Y0G?=
 =?us-ascii?Q?2QFxpfy51QFkPzGFLHw5YAKIgBkzNIao3qYETIvGsLhzXCEOaFVL5OP3hueY?=
 =?us-ascii?Q?07NUvntCMAHeSKkMsv3MEmfLHveii4zPfE17jORASJrwUN73M/o6goi1Tu1k?=
 =?us-ascii?Q?1L1ZDtr40NFjqTZDL+ge0kE+UDJdQjgbtbj74GDtIXktDXTXryk1hqSL4GT4?=
 =?us-ascii?Q?dp93wWW/0WNzU7TgF8HsQmBBP98NlYn/yzS7NKVKY8ovWyQW4JmBSFE5Tf6y?=
 =?us-ascii?Q?kNYUcHloEdikH3DvNYuy3+psA8OUDyRIvrhog6lQLlSlIi7pUNvMbDcrpMYe?=
 =?us-ascii?Q?5eotlvuefcV9b1KvZs+d2OO61woVGxKt/pWDeuoONHB48zwslJBHNagrMtl0?=
 =?us-ascii?Q?t5h3n95xpzEBpD4nMWr9PQvxxQ80+I1+Gop8Svw+1i2pDyjHuVNFawZXAs+D?=
 =?us-ascii?Q?NRZSTD0YvdRUS0hn/FtW82AyvzSTgPI4oOpFNHE78T5eToDfxHSsOwGWkNlQ?=
 =?us-ascii?Q?H9QIrPuRarSBj7o+qwCsldQUEs4tdaZCAQlOa6bIEcHFFBqQUZWGslsdsGxD?=
 =?us-ascii?Q?uHUGUqxHpM25/mtBAJgij4tBevHWbSqaUa6EllGlTsAS4YYDLTTV1BWCX4qh?=
 =?us-ascii?Q?EGygNljB/lcVJKPwR+jsEgXLS/G8ZZnsIbBhNY2nhyof03Q72HnjVYvRetjT?=
 =?us-ascii?Q?MH5JKQolBOnuyR62kXIDD7XbpRRJ9HSyU4ZnRMPJ9MyJ6wEWg6Q3I9zx3nW+?=
 =?us-ascii?Q?lvybkfJ3a1xMfMmrlCAhx6tZzQa/E+H9DS9KfzkFjk75g4Ppl6iwwlozqh9s?=
 =?us-ascii?Q?Z1tHyAP8tFLpfKe51EDtcgMKL7CCKzLN5+reoYwpO0dDPPKj2dSPfM0EyoLK?=
 =?us-ascii?Q?L677l+zWEVvltX31V8WN3XsavqzU1WqYIsM19TUi8WCe1Np+F48E39KuRXla?=
 =?us-ascii?Q?bVy4a4Z9JjnG3oVo/1Ox5vXS2uzd1a2nsrf8UD45/kcJV8U161AWaFaXKUZ9?=
 =?us-ascii?Q?uvJPUdERKIGD5gMXBxAbjsgJEOsVqBp7+UOmg4KboyX7O7Bn/DZ7IJLB8+c8?=
 =?us-ascii?Q?SiDJfEJibTJCgGxTxiHk3XMlmqzrmqzEPbcnPw83mSIBH4gb0/uGd9qML8jS?=
 =?us-ascii?Q?O3lYIKdGWQIIagWFP6rYxqnMw6AFj/MbzsRI+PvsNoanTWCuGSgKccgdqPkt?=
 =?us-ascii?Q?PZK6ZOn1b1dBzaOGzK/pZ3C5CH/Snm557KFpXBd1eKl7f3svUybwZ9x9sZcN?=
 =?us-ascii?Q?vjHrvc7yFA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1553f8-5a62-4e29-880d-08de4825a19b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 04:32:40.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVZwewLDonYFnPtjhz7UvdndC36bka1EtrZevP8cJ9yva+g1ehYUSF2jS0Ry9UbGhwJ3AF/+rRcrPP7l9PE9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To create a new device private entry for a given struct page, that page
is first converted to its pfn, before passing the pfn to
make_writable_device_private_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

- make_readable_device_private_entry_from_page()
- make_writable_device_private_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
---
 include/linux/swapops.h | 20 ++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/memory.c             |  4 ++--
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 5 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 2bd01f97b4f0..ddf2763d69e9 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,21 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page));
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page));
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -191,11 +201,21 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bbfe5e87884a..31ea473cbcbd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3225,11 +3225,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4956,11 +4956,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/memory.c b/mm/memory.c
index 8e5e305bc2dc..076d7acb7267 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1005,8 +1005,8 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 */
 		if (softleaf_is_device_private_write(entry) &&
 		    is_cow_mapping(vm_flags)) {
-			entry = make_readable_device_private_entry(
-							swp_offset(entry));
+			entry = make_readable_device_private_entry
+							(swp_offset(entry));
 			pte = swp_entry_to_pte(entry);
 			if (pte_swp_uffd_wp(orig_pte))
 				pte = pte_swp_mkuffd_wp(pte);
diff --git a/mm/migrate.c b/mm/migrate.c
index 5169f9717f60..9ec9bcd37882 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 7eef21d63364..5cc58a5876a0 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -842,11 +842,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1039,11 +1037,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1



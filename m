Return-Path: <linuxppc-dev+bounces-16449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKZiKQuSfGkQNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D306EB9E91
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YHB5YZ7z3cCM;
	Fri, 30 Jan 2026 22:11:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771494;
	cv=pass; b=Z52knYSUaF32ntHy+uPKCNxUaYqyl9v6iW+uHL1+yA4ihWOJHPJXYmzyDlXagxquJZeo0UxjnRJFJKwdC8TfiwHGnIp4k/O6i4QZzSawYcrRxosTjF2nJXNvN3JIGSY1nya+Ry4+rSiIDYuoGf76UmrdD09GJFWhGGN7fGzuBWCoRejYPyRXrcgZSyw74B4TF4YYJuEuFVsFS3fs9fMCtg69q9McQKjiXKpu0W6h/UoC8yuWtrbeOpUxC2xgupFa0KFjZMYqWyJn+D4LQYALOJlM/2bdZXHEcpa8VBlSEFHwbUorjQScNZNqCxDVG5kta5xEq68SXO0nCm/Nz0tp8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771494; c=relaxed/relaxed;
	bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XGEQBq6ugG73e8TchlToV3rMBJuUG/BWo/8L8CKEnGRWAaH8EMYa8lzuaNoR6+c6JgpY+RaVs5+FqcjQ/YWFct+b9KPlzg7N1aXBBIT/Q2qHzxiqnaXetGXO1fYfjS5LhlXgM9dM5yySitzAo2e1om4/pK2E9gZR5FnDiKjiLm0sRkC0P+Kfhv0GgyP0cS2+PuTPby8hiAPJcXgE1BFryAaDU42QcHjr4b41k+vKGB9MDx4FFkYCrr2NvSjB05gx+75gQ2hZQYDcs4DyP6CSBNjxU+NjxQTWXUYQsuenlL9O132jx3WsmRhN/dd4sKSjk4jP5SqKDa60zi1ejXJQnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pw67ipv4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pw67ipv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YHB0hnGz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAtiM19e+stax53cHhwdMAKGvRAVXU3EDAI9oSL/6b1uybPEZAL+8tCk8iS4bDnvarN8tE+8XqROw8a2tGZoiC1DFmfl9lR1y+9ZuQqvy3T108eceoZOx36k0NADB896PAsG3yu08CF8f61GyRQYSAPmH/VsXa+0xS2tZzY0t0Ks2rh27Ct99S7oRvKEaGMPChLaMajWVKUjSkdR2kS2M9QkSTYnVfEZC5bG6Z29UC75jhbBkjN7cEZaA70cGESlfAdfS/l06NkvFoDcvdFtAWvkkvmUxRZ85UunrGPNM045GqG/Wk4ncpT9liOdSJoogc59CB24H4EO1WVYV7Yb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=sR2f9nsrLEKWxAOjxNa/VYO3IR1CHdu6jk8oz6fL3pdmXHz8fv4KvRybeCwI1dhKjKSNdBXjKzKCg0fVP5ty6xsHSBNZc9qLe894eM5EqyvnOKnK2nz4/SSTjpVNvJrjeNQwYN4cXa97Tazq2h8Ph1TxPdH9uLf4OasLm8Dpv02hvgtc5oBSwtWVFGlTO4T3709BheOBmpzz/3OdYc6bK63Fur5fbY7Kos20jpUcOZtGbDtUEb152lEK509D1D7mMPblsUxB+qeU9puivqcHfBar9u++PgobGPx02enY8T58x3wfmtpJSFhyq/xEN9YQrvkPsYcyTuQn/RRFJ05M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=pw67ipv45gdljweWaA53PoaTQaB0B7cjD1r34y4BHLst5IBT9Kdp8jmhFXDaEu5DtV6Pmt1QtFO1me8tFwsDABX81G3fo7Wh6AbhbuXAjyU+eTBy1baoJHB+PvzMoKYaBmRYfBITbfNgXSORuwYKPigpfPI2DIOoYlTpXzC6FUpZWeCLEPpba12uJNo7yn6HSokEhi2Ps7fBhJQHM/cpcc8JtSWPoqjJ9BRiMiR6ZY8w5IkS9A2SStO+Db175oPNpEUskSUZtEAT0RIItgu+Xj0UYezMFWEYnLVkCGhBsh1FMSH+nJ0OurymL88ut/5XK4KjiroFqDq/bCXxUifDvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:20 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:20 +0000
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
Subject: [PATCH v5 07/13] mm: Add a new swap type for migration entries of device private pages
Date: Fri, 30 Jan 2026 22:10:44 +1100
Message-Id: <20260130111050.53670-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0058.namprd07.prod.outlook.com
 (2603:10b6:a03:60::35) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b08d12-91ed-45be-3a12-08de5ff04bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NdujFQm5hAtxP3UsC9AuNmlE45kbbbHWLrNyXj/VtnKflzhC2/BxA/NtAfnR?=
 =?us-ascii?Q?my9BLXABsEWfzzYYf5iPYOt+VlmoLaJofUh238ZcLoCWcYrQUdP6Sicka1+v?=
 =?us-ascii?Q?T3Wu7bAAQLqKbtxDuzKCkPllKxIyVHiSzIh0r0iubfrspdlsJ0VpIjoLyO8M?=
 =?us-ascii?Q?V0PIjpXnj1u5IDHBkBDXi1OBIioFFhXhdeYtcFa9xMnM0gex0/o6J72/2DLi?=
 =?us-ascii?Q?3FvnJzR0wTrXamAhux/tnmPtEyOHJX2hD1D966YqLKdohme5WIaBiOyaBkyo?=
 =?us-ascii?Q?eEhHb9YE2jzsZpzpd7vnUDefeMutOhxzb9qwMKKX3RzQZP5+eh7gO+I7OdxP?=
 =?us-ascii?Q?ljvXN/rIzgOvqPcrSGLSqfDb8zM8wR6j8zDE37Qf5koE8AXyMZqjem9ThF0y?=
 =?us-ascii?Q?1s+bwYaV9TYZ/OIIm0CAtVwm5owyios0lLSuJ+HqB6e2rSO7RtmrCpqNz7SP?=
 =?us-ascii?Q?taFJyukp/mGfRaGCnXJOp53Q7XVASvUr1WhHOBmg7ahp/5Ap+dkZoVpHANvq?=
 =?us-ascii?Q?wx9+WZz8Vx8H1k4WQx9CCIMlU85gY4s/8p7K/IGu3ufBv0rlR//m7/m5OfDp?=
 =?us-ascii?Q?3xHbgYUwDiDiZPPj40dJKkXP+/U7MJnVdMjFkBIhg2AirViWgNEsy3iIY6LY?=
 =?us-ascii?Q?QEdYO1tKj1l78IqBihuW04jOiLYO4UCesKz4667a4/Rxm+lz27Hw6Ecwc3iE?=
 =?us-ascii?Q?nHlCLAepW6KFxbkvydQ+Ng/vi9PMHd1DBS9kISf509qSSiSPQoyVyiQb++Ff?=
 =?us-ascii?Q?wRFLcdz+TfaKYVezZpaMpN8GyHj7ehgMW9SGb5cVBd3RfyqkT5tE9KTCo+1u?=
 =?us-ascii?Q?N0GGB42rmM2p8nVk2qjuE3B3OJ3cCbdfaggQL0oHwYyXavPMhaIxhvvngI6I?=
 =?us-ascii?Q?ZPKUWgkvllWhoWJU9SF9VZIZYrsRtaHG3nrMgS1g4QCUtT9K8K9IJpxCQv41?=
 =?us-ascii?Q?8GO17Soz0ahfm3kbGwaFfGTMjlFJygS323Ea+ivYPMILMSr04qp0cpsLpDNO?=
 =?us-ascii?Q?zQhdngLjW8Wz7QExpLT6zUWsrvPr95bX4kzkep3TNPX28rz/djygMbzRP1QZ?=
 =?us-ascii?Q?EId+6wCr/9iTNiEgWT+f37h+HgWPgLfJqkSO48FmD9sHIYHmP04ILwO8rHMr?=
 =?us-ascii?Q?Z/T+seKsBCgGZ1MTnaP1cK2vPlczABUxPfejMXV0eM8bjSk5CjmMzhL4N5sC?=
 =?us-ascii?Q?Of7QtF2jWT90WVOqxoJizL+zPzdrCAJegbFWL5igOyoDz/a7L/3PTY1wO7fV?=
 =?us-ascii?Q?fOZ7JescqC7muielkrrU7djqE6cUDfypVzJSV6NfDAHv8/tKdT/TuVAthYpB?=
 =?us-ascii?Q?X1fdkkypooopOlhZ2DAC1SptN+mDQyDxv0ROg+Pa+zfZhAL7zVNZ5wg/V2mW?=
 =?us-ascii?Q?XjW++f23LtMPm2BRnLK5c4SaSz43vornzeSwq2EpW+enxavQB5AVTfelLI3K?=
 =?us-ascii?Q?Ui3/RewQOauH4nfRTylEnDVF3g+K3s+xg0Kmkish6zruRR1zbXmmNszvUZ91?=
 =?us-ascii?Q?6dhsymSfIxjQI5/l8ySKg5zHt1ijcolttGhNFDRRETLNpSPMg/NKCjt1utN7?=
 =?us-ascii?Q?k/U4LedoswB8Zt0rcl8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9es2Ntvz4ZBLF4gawTvxGiOWGL8tw1XFbxYB0mn9I+fzljd8H4CG6kFrptfO?=
 =?us-ascii?Q?u4wpHbf5ZjZBjGqxeL2DOA/tZMUvKEFDJlBYKi7ZnE4hhQCdfRxkv3JrqlVC?=
 =?us-ascii?Q?7GQylG9yOiC4PjbJsAIERLP4Qdtbw5KErtG9o4KH+fYZklPR5Xll7bUpLZ4u?=
 =?us-ascii?Q?pwLHrooB7TDbGfXr1+++7lpWwWZe746//dhw8W+QP2MpQcQDeBiiLSch8u3S?=
 =?us-ascii?Q?F6pcUUdJEY7Tx/y4IXz5oJNMRAIYwAulsPWMDAx5CtBftZyQ+sFjPFnKNeHc?=
 =?us-ascii?Q?ze13KuJdsEngGXSJVmu7A6AyY35FUUR8ySduvvmSJQ5Sr/QIahtigH1Heh1S?=
 =?us-ascii?Q?hPW1rD4+eHhZc71BD1cZo91XyETi+vQiLqvfZZM+YMuhCn/FQoMb9HxWHqet?=
 =?us-ascii?Q?wUZ2VurYFS9xHGkiwOOrrc4kAl6iOLRze35VM8HDcjL989QhN1+F7ozobZAN?=
 =?us-ascii?Q?87HSoWWluvMt8xiXyE/xi0xUb7j0Lqo9DLXBBoMftKUt7uiA5dGWWE314tH+?=
 =?us-ascii?Q?HRiRlOawur2COVJ9E8SNbFZznfXF5e90fmGyn1UeJtifxC2tlkDkLZ9ncsyt?=
 =?us-ascii?Q?IPgi/QNmAe6IJRf3kuDeOXq7tMd112F0Xm0zABgW14tqpzkyMfsB80JlbO12?=
 =?us-ascii?Q?KB8YhhDPA33Aml3DLrIVe2hv6K4QVfbJxVjvR6/hHUayakC0pUc168WMe9f7?=
 =?us-ascii?Q?DJ6ZA4QXaF5D6ssVCBbj7OPAuljmXl+hiBN1Cvlluj1oGfdD5ru02PKWmohU?=
 =?us-ascii?Q?hsJ2JeZokRunfIeCnmKsDy3ND/xF1PgZzIDHGyaTaADW8T3lTYhyOTlwevc9?=
 =?us-ascii?Q?akGEZMwmFWnHHbvwj5YSIRaNtJ2Dtaz3Qqc2sNwfAoB2OVdUigffMsHaI/e2?=
 =?us-ascii?Q?pewz8dd1XJdSEvPX6YKmw1XF/maGaBBHWjltqVIgcr7+YpRJkrobC2UPi/dd?=
 =?us-ascii?Q?qCTGYyuHN5/KwmQ5GmkjTtlzGUYtkqLUTtN3lW7B/SbCQ/UtLBmuEVGRRBQk?=
 =?us-ascii?Q?NV3oazhZkFAkUxTm72H1GPcCpJdI63h766uv9beDFGZx67rT7y71HuJKUOEj?=
 =?us-ascii?Q?he/Y5Y7AdXHaqyp+GKGl7CK7tDZhGcgaDEBlsi46y28NV1/YMtN9RZPyrFAh?=
 =?us-ascii?Q?rM7xpj26kHtaxV9vjWiwAJZUmaP2OpUuxpe6/tmclIwebeTGulSbElEmAW0d?=
 =?us-ascii?Q?QB4bM99apLIemmLSMDHigy5/G64QKnUzDC6ikB/Wa1Ln1gFVU93klx20rk74?=
 =?us-ascii?Q?BV1lLgolYDaCTfokAlHExZBCBg1yTnCqpVfHCp2lveHw0G9kZeI66zGDAMZ0?=
 =?us-ascii?Q?MindkWZABuWHbPJr5b2wuwnxRy8fGZGKsJcNO0QMV5O2NpUGuDj/X0lk+V21?=
 =?us-ascii?Q?/tRb9D2iGv2DboCZYbDVH2Zda9re7Fmmki2aek+5y9Yg/o7i5hUn3xm8xHfF?=
 =?us-ascii?Q?/vlAYXk1tVV+wnBWPlrlMfq1H7814Y+fgrFIEdZL4BQCU2OSlUXn6LAwYtDD?=
 =?us-ascii?Q?5/0DVn4sIOhYN577RFjeARNiSX3TpJnRp9/PCPE4cDMVgs2C1MzMFc4n1+xd?=
 =?us-ascii?Q?6XSXq1YpWnndY2rEwlQYgNNPJ+bZ18gtVntM5pY6r+dfcoZutCmmIspM9jYF?=
 =?us-ascii?Q?FcPVHQ3OhbtpL+B/aTbp7JgdYN2O6DaTb0frVugBuGqE63EaYHDk2agfKgq+?=
 =?us-ascii?Q?ReLB9BpTMiu3z/s13EjNmsu2QYpmxv3gRcAzkMTTJtUhXWdilMPAXftrsU4M?=
 =?us-ascii?Q?BRgpwtzkKw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b08d12-91ed-45be-3a12-08de5ff04bae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:20.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb7UOnLJKMgE9jRm3soDtUK4mSN7kZCZrdmVZjobN++6F8WHKW3B6yg/4H1aS0b9JVxoCthe7vEWbVnzsr/ryQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16449-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D306EB9E91
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page. This includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types that correspond to the existing migration
entries:

  - SWP_MIGRATION_DEVICE_READ -> SWP_MIGRATION_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SWP_MIGRATION_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SWP_MIGRATION_READ_EXCLUSIVE

The SWP_MIGRATION_DEVICE swap types are meant as specializations of the
SWP_MIGRATION types - they are equivalent except the new entries
contain device private offsets.

Forgo creating new predicates for these new types in favour of new
softleaf predicates that will be introduced in a subsequent patch.
Currently the softleaf infrastructure does not have the means for
creating new entries so provide swap entry helpers to that end.

Actually using these creation helpers is deferred until a later patch
when the softleaf predicates have been updated, otherwise the existing
checks for migration entries would be broken.

Note that SWP_DEVICE_NUM is increasing from 3 to 6. This reduces the
maximum number of swap files in the worst case (i.e.
CONFIG_DEVICE_PRIVATE, CONFIG_MIGRATION, CONFIG_MEMORY_FAILURE) from 24
to 21.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
v3:
  - Move softleaf changes to new patch
  - Update commit message to explain the change reduces the number of
    swap files.
  - Move creating the device private migration changes to a separate
    patch
  - Remove predicates - we'll rely on softleaf predicates entirely
---
 include/linux/swap.h    |  8 +++++++-
 include/linux/swapops.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index c1d3c0e8981b..220627cb7fff 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +179,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
-- 
2.34.1



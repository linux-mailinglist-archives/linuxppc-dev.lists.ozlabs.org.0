Return-Path: <linuxppc-dev+bounces-16452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDFxBCaSfGkQNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CCB9EB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:12:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YHF4223z3cKS;
	Fri, 30 Jan 2026 22:11:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771497;
	cv=pass; b=PrupVWJkWqWCtlTnAhp7F9EFYZ9JvZ0AKNNL9pGU/y9f/EIg1MjgA4QyFZTOfe97lsXQAiD3VMK7hCUYGniqJ/s80SK7OgXplZf5bbabagIyLwZzube8pJDO/sOCMWQBrn9c166JbU40mTT8NbgyKYF0gG/dizhSxKIvmDE2WgAdW/6kpnW8X72G/dt4wNPrtfnSVa6dB4RUKYcf5mG4gvEtRTTIkoqRpXXx9V6JJ3D2Ask8AcSNZu0FCQhyXmSkDxSy1guS3nPG+XCEWt3KQYoKlBJHcenVpBnPuWDCGv3uNjtXKgtf1TYWENr54XUpU64r3uWM0I6XuKjkXnj3Pg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771497; c=relaxed/relaxed;
	bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XeqkUBXvqa9f7HHjAPTTb0G9FLRiiS8wwC7XcM1gXeFZAh2khlDcD88j/qX+z0T010Z46v2H5i8PQwIX+RYyp4vttZikqXfsczbS8beSase5kX+sLvn9SFoFHvep3x5tHpxbQbK1LDFBdctgd/EXxEY5ZMmA1UszENYzqHYJmsXn7JQM8r2tGxA/GNp/VHNujHRprm5x8DNM5AVwkKUXccY2WTBdMgKgQjsZ0kVrbtCYKRsOxaaEgVewSCgXe/QzAwiDf5eqiXhdawBzM8PcGSjcpk6sNs/Exk8hLl18PJixtRNkhFMZUe8UvebuyxofsgHySgSI2MY+PAIc3xq/NA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7z+k8Um; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7z+k8Um;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YHD5WtBz3cHf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iojUb4XNPhS4a0+K3Vm1GNWQPi8qIutc/QTivZ5y9LwBvqvPThZzKU0IZQHJ2KTkzvbzvJov8K3LhjuAjCmiET/lw7o1a3Pfa3+MrkrNiP0ZsFUD8z/pg0uj49Ils6atTw3t/Uk1ZAb6wmCpfcredetiNdvdgmCenBpHN258JeBKA/a/UA9vCnev9979lAKt683nSGatuifFTQaLhEre0sqyY9I2pEnB48i0yL4vv3z0uSb146Tu5WPhpqOGThFBvTMrMH5XwBRp3KA6PW4iwE8frUbWYOBMzpxYip3rS7XhO3GVjlbTrs7pS1tfWNAGvft0P+2uxGIdiprUB5bcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=pQm/k+kwolloDauh5AbkyCzQBMCbiBoxm5Hvpmrh1ydCF1RxND3aWhTyHu/Kfo6873Yc89QZicLoOX525tMfk2ps22J2iahVR2MNgFlJg1j47BGYTEQjJG4vVbGpGIWUJeaIOIgHHLs9AnIX1Wrjk0rymzu+wsgrSCfpx2ng//unlzDlF3Mc+hoHXIq670jVnw4yLVF9OtYMoo58VAgW0ExemTV+V/Tncxd3w8ImGN7Dw1sF8XCPa3wOB30omXNlOac+nacnr5P99LFL76CvDl6LDvVFy0lbpGXG3bnWnXEItZC8fikQ06xXJw9jv1SF919wSHxTWDx2P+iRHMREiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+rviONyzMsmjlkCVvAHR9/2R2g42k4emVzDC6C8uz4=;
 b=K7z+k8UmPyN+s+IWRiGcvhv9fE9M8wGhhz4pDMFRNBY3p7jGuT9BXlflA1vVpKCoaBDZpZmxe99+lB8LxMJ6e3qM7gTsOhxLpQfs0e/SKKqAkOvjN9h6f3JPjs03hQGD6D/6MMUFCFoXD7zA7uOq8tjF3ayMH8poOiWuacBRqvKj4aFskjmr0UmuJQWpUstgs5Tja6sASv4W3ZQdhJss9qUhspKLQ1nVJrAvS5rvdoX5oufX4dM07mq8t93KiD6xme2aOzWl9ieUpMZslgpyzH+17bUhNNef6U07srrcimz9Gf+SR8+Tmkv9nmy8TsyM4PYv/+pZIwM8iW7TMZ5Dwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:31 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:31 +0000
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
Subject: [PATCH v5 10/13] mm: Add helpers to create device private entries from struct pages
Date: Fri, 30 Jan 2026 22:10:47 +1100
Message-Id: <20260130111050.53670-11-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 44e6e9cc-e9c4-48a0-7afd-08de5ff0520b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KKVfzTrCsbRZSB5vYvDeMk/KZnVmyEUWSdvWvEpIVvIQnDik9P5NA4HFtWpa?=
 =?us-ascii?Q?sHZXsvV2cg/3pq6vofmvBJ5VBO8WlKorCgnd73VCpGsCmHEzVmE5FSK1moRz?=
 =?us-ascii?Q?ijQyG1HWMINjG26Qr8aJfYFS0TEeabcrNhXJWE5wUZ6X6Ia//GkAw9nUMewS?=
 =?us-ascii?Q?rs5C651m+HQwB0Y7PEO7teqyWcPLr7dnivSuw9iLH9LVoEKrGcbJfXS3C4yj?=
 =?us-ascii?Q?+0EcN++P0hLjHbGz22dPVPHCeHcAaGO8NAFIDyzBdVXh7PQoFuJ7rTk0wyxl?=
 =?us-ascii?Q?aHubKQb9Dmm5/HCN9SU18vjzjV0WS5bxhEpvQkDcxPAfWh8R5GJ406sZNPA0?=
 =?us-ascii?Q?orAagf06mIkm7eTZWBcSi3rTBHhGkMlWdk3Ae0pdyWrpaMnoL+h68BCOwre7?=
 =?us-ascii?Q?Mz+awrkOfIg/N+iNxrspNDYYeUo49ZHbj7bRc+RoJElaB6zwyBevlUqvnIjM?=
 =?us-ascii?Q?0Aaum6PRLIKc+Z+MhOF70eeBSeG8iySDMWz3xZSiG/Iy2e3GVS76L8W8lrBX?=
 =?us-ascii?Q?FNc9C94lTcsYHA/iLsh8p8sQrf8g68/Xij5E2MUlGQ5or+XMWtCq+HFbhYYn?=
 =?us-ascii?Q?HZKwhcZPRE+2CyDSj1Lg1udkFey4m1ere7Z2SRGE1/7iRuXQ3FGbyMSugs5c?=
 =?us-ascii?Q?tOSenvhcl2VaSCmaeIen4HuZ20qqscIy6opbX2yOe1aOpKTNFAEO93KWQUjb?=
 =?us-ascii?Q?iS3yh541vCdcIznZDnMa8XHFjO3Bk/hRO0ImmUO5/cLom7jW8SOtFBuI8YKG?=
 =?us-ascii?Q?HmL6G1/5z/c/trdEqOfDb5BfKcSEWwn4J0NdWl0hkHV8F3LJg2w0hbEJkHym?=
 =?us-ascii?Q?MljplpLl+ja0YzYXdCzcdoCVraQIwBVnUlmZS6GqWbz7YoL9hLJa39A2HevA?=
 =?us-ascii?Q?yhhGNsHLZqcC/VR/VHLmBEgMB7/LO/W7wgZZDFpPEWUuvSiy4hY5kTCn/6r1?=
 =?us-ascii?Q?Z5zh9KuS94+JWQKUau8vM0gspScGWbzjovFLAG2eHbAXeo7MZNz3fjWLFJQ5?=
 =?us-ascii?Q?Gd63EtfEdPoA7p4tCpQbNaqVYQ+rK3eDypGK+loQui6uE67nT4NEyJHJuUDX?=
 =?us-ascii?Q?fmtmP4TAUkdMkfQKTUX1Afo/cVTt33C5zqlNWEKLfseEIpdM8A291wZMUNmU?=
 =?us-ascii?Q?+cCCMWoAJtFPN2dINpE/spIrQMio8Ctt9IR8qwy1vFOPgi26NFg2WfLi/JUj?=
 =?us-ascii?Q?LDHCysu79cICB9qR67XSErF+gUavQaFqEWE/hsUiwKoyY7z+sTVQq4mWUBpB?=
 =?us-ascii?Q?DANF9GiLL4JkHhW2nMgPCgUy0YCqH8k7i8ZHuIXNuq4hWSeahJGatbmgUCZ5?=
 =?us-ascii?Q?pKw8vgc0SQlx2cyWUtc0INzuevHurZXOYauZaOJI4EV2TjvdlTHxxogxMfE+?=
 =?us-ascii?Q?pjQADDnh5LpgCsLHKnQUJAIXEVUKsOaKI5WkD8f2Awbba7+oJxEXxq/DV8U0?=
 =?us-ascii?Q?pH4BzyBtVOBQ4zoq/1NviiIWWR4y0rXvlfsyG3c7H4+lQ8qHpgLCEg7CCXNm?=
 =?us-ascii?Q?7F78CVvJFQVL3wDjuo/JHqixJgGCaAC88AhXdPSUES7tP686e7jNFpWDH+Th?=
 =?us-ascii?Q?tVAf/MWz3ttuq2deZKo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXsyuKE8xICUwTh+an2EC0y0MWCo56r6aieyoIKgrhzfHcRIy5LTeaIVd3VX?=
 =?us-ascii?Q?v+qxo3TcR08GBXRrQVaA/mWySGlM0Gv0UwRL7VBz8nl2GkWabTWCvKlpBu6j?=
 =?us-ascii?Q?dJ1qDKJCcDCS4IBs/2JIXVzzLO78/Kb5eCuCzyV7RPStuRFFkCMdlhdHGiMm?=
 =?us-ascii?Q?oqXc9kXgJHk63eetpogFxZ594MWUHwCP/PQJoqMKRrCRW4lj+QRU0q1cTmaj?=
 =?us-ascii?Q?opSOaOOEBCSOq/J/7bk/Ritbp5z8b6nfR9Bfa75TrgPMvY4C/tcfAUN45+f1?=
 =?us-ascii?Q?cjBQNBahFVwdt3w+QScpZ/HTbqSm2o32sngiU2ng9I+i9AWI9L/RMsTRa7Pf?=
 =?us-ascii?Q?h4MFzzSmwn4gFe6YxCjsj5xlmm5pMYtN6a1lpBiDuoPYZQGmeb+kEbyKsWjv?=
 =?us-ascii?Q?mXRfBldNq9773px3hjm+oAoaSYgybwrM8dhX8zxnAMviTIcIcG56+qKNi1aA?=
 =?us-ascii?Q?6aGs+bQRCOa9X9bSwCQz1PWxB8yqRDBwLRQquy9Bh+3GtWinDJp0SlE3nOPB?=
 =?us-ascii?Q?IzJyCLEcxdGe/C+f5Ec2W00XreO/t4Y/CAqPdTqbI+VmSPphrqMDueerKhlV?=
 =?us-ascii?Q?qZNcv0kQ048dIgmOv0RAJnuaJz0F2VBmYZqZWFYcbxi51PSSP5/aVTu01f/m?=
 =?us-ascii?Q?HN78lRDXoAbuMCwuv05CXBtZw2OzTmBY7OHVefRzPxX8NtJ235bidBJ2lf30?=
 =?us-ascii?Q?4+IxH3gmeyPRbrP5eog06OpGGENZuNFW/RPjwDmFpszhDaB/PmxFu8hKiqqW?=
 =?us-ascii?Q?D3RoYuyFFehDTfsmGvvTNnjzLxXJcM359KLswQegtGsXNA+2Cmw5hsEFghLm?=
 =?us-ascii?Q?dado+TCJPNmOT4Dtqe297uq9xAf+3UKVWxBi+u6otEguMSqzyymqfgxYAlZS?=
 =?us-ascii?Q?RPkhDr8b4HCwRnN4/+2IHjimDhIC1Gr8WN4zn9dp2d/5wlKKykNfO309rtCN?=
 =?us-ascii?Q?72cseMdywIb8a12zWndbUAgSORMJqidkA1rq0A37q22FrWlGVs4FhPyR0szW?=
 =?us-ascii?Q?DH6JebZVvruUBUSUWdtGvacjoSX0pOykMRsA3HduL6LFIBkL2hpujqe0Jx/5?=
 =?us-ascii?Q?VRbqYWz7K28B6W0TO65TRZclg0+ZpYMfHraM1Ln/fJvu1i0ath9g4T5cTb8+?=
 =?us-ascii?Q?HPY8CT5iu/U8rkuvmURclTFumdxQTTZNtNAb4wOQd+3AgG8Zj37d8v9GBt8C?=
 =?us-ascii?Q?7BGpLTUgSI6khbX4S/nRS5Wc2QwWZHmjbvjrVrmX9yEaPMtj6WhaqjbvsCwV?=
 =?us-ascii?Q?1fjMBcKFbxGxZzAFQDrWaueTPFzy/WLXSwx97qcvnjapwq7eMDVN+CSbtVGi?=
 =?us-ascii?Q?G42oNcqDnUIKE9vq4sNs7XH1RgwWy+EQE5thjGHWy1DZ2eU774JYQONTivP0?=
 =?us-ascii?Q?hVBBzZQ8JQbewYwQ9GmB0lWMiNN0QOxRb2iyHs1nIDNgTiJObJsY8VqOcWUv?=
 =?us-ascii?Q?e3NSPw66P32wndM2Cfqo31gq3Ak5yQecI8PnArtJA2/vfewu9+M3yFrFVlvH?=
 =?us-ascii?Q?6QvdnBolTdcLAFT2Zr3x+XrhTqgqxf42VxwnYBWJIfZZ54TKr1P2vOpB3n5k?=
 =?us-ascii?Q?LQq7QzkcvATcn8drzy4a89cmvUgRrZi/XKUUbWcSdB9+dyOfDvizBW3zEQVK?=
 =?us-ascii?Q?rP9wq2+4EMGiuQJQcqJiVfInTkXBt8jF4wmsBuEZIT7qbl3sPCa4PkieKJ4J?=
 =?us-ascii?Q?ZqEv+KtEZ8n4oh/40Frhg8BuQNVLhRl/D9snIcdIMEgJNFh7i6HreW2ZPYoh?=
 =?us-ascii?Q?YUgQ7NnC6w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e6e9cc-e9c4-48a0-7afd-08de5ff0520b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:30.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcC56dIVweMdtcxmys6JXsWyeE4aRKBvv4cPaZL3X8L5D7ObPm81XujlOCTvEwm2SkuuyNYe7RpfPDAJ5/gdMg==
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
	TAGGED_FROM(0.00)[bounces-16452-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 166CCB9EB0
X-Rspamd-Action: no action

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
v2:
  - Add flag param
v3:
  - No change
---
 include/linux/swapops.h | 24 ++++++++++++++++++++++++
 mm/huge_memory.c        | 14 ++++++--------
 mm/migrate.c            |  6 ++----
 mm/migrate_device.c     | 12 ++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8b39983792ea..080e27da6b47 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -138,11 +138,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(SWP_DEVICE_WRITE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
@@ -169,11 +181,23 @@ static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_writable_device_private_entry_from_page(struct page *page,
+								       pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e3a448cdb34d..03f1f13bb24c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3219,11 +3219,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 			 * is false.
 			 */
 			if (write)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_device_private_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_device_private_entry_from_page(
+							page + i, 0);
 			/*
 			 * Young and dirty bits are not progated via swp_entry
 			 */
@@ -4950,11 +4950,9 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 		swp_entry_t entry;
 
 		if (pmd_write(pmde))
-			entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_writable_device_private_entry_from_page(new, 0);
 		else
-			entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+			entry = make_readable_device_private_entry_from_page(new, 0);
 		pmde = swp_entry_to_pmd(entry);
 
 		if (pmd_swp_soft_dirty(*pvmw->pmd))
diff --git a/mm/migrate.c b/mm/migrate.c
index 4688b9e38cd2..24e3ebbab1e1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -399,11 +399,9 @@ static bool remove_migration_pte(struct folio *folio,
 
 		if (unlikely(is_device_private_page(new))) {
 			if (pte_write(pte))
-				entry = make_writable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_writable_device_private_entry_from_page(new, 0);
 			else
-				entry = make_readable_device_private_entry(
-							page_to_pfn(new));
+				entry = make_readable_device_private_entry_from_page(new, 0);
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(old_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index c876526ac6a3..0ca6f78df0e2 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -836,11 +836,9 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pmd(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
@@ -1033,11 +1031,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		swp_entry_t swp_entry;
 
 		if (vma->vm_flags & VM_WRITE)
-			swp_entry = make_writable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_writable_device_private_entry_from_page(page, 0);
 		else
-			swp_entry = make_readable_device_private_entry(
-						page_to_pfn(page));
+			swp_entry = make_readable_device_private_entry_from_page(page, 0);
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
 		if (folio_is_zone_device(folio) &&
-- 
2.34.1



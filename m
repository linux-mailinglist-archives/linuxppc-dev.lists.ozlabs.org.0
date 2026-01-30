Return-Path: <linuxppc-dev+bounces-16430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOPTNj+NfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:51:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17305B990B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Xr62mVZz30BR;
	Fri, 30 Jan 2026 21:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770294;
	cv=pass; b=GXab1FNBBKlYDJ8yHaVigsj4PqdRE2g6dfKgUgxzjdHR21Mgfsk0edTHxDiYPq4jn1SKa8qzP4Nj/3EhvDrwPRh7qo0GwIi3t+ouRp3yP+1wUmYGfRom1oY7GmB4f57EhvrqtwRHoqtt4mxQXWwpxTlfgrbPUDYPn9LFJUe4Rn1VWI8fuFL4j8WL0mUOWx1lsRS/UxvCUdng/VllYYHqr9ZX6gQjp9kYNg7US9/uwprYjDNZp1bg8mTU8JHu/HD3t01dVa+C23KI5GQvPBDwsDlcQLSW0+7aiAkuzL9/YpGdj6YNZhhOt/GrdTdnG7MigLKlnfF/FOqxz6H2E9/5FA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770294; c=relaxed/relaxed;
	bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4ZgUvTNwYMM9/HcT4FExsmwi0yQ8Zc+6txbDMuUGnITYVHDUmh6l/0hxcYcMfWoCJs9nuTV+vRbkEDq5+U4iAEd7h08fBaaeqG5rNeBNiVIF2qE01G8G3I2Igg6pTSQlDFAoggDTZMOowjQgJOZYlYgOSwFCyzioPCaIAEjrqgcelSpnXg+KEFqZyvcxK/xsaElZpnw+LemdYIMcd5HXimXkBQaLw2R9DvK9V/oc90QbV9VQGRMSxPVoiJxs6/uTw+kdClrvpjAhhI1cg5qagdJw0wpViTk/YJfx2V13mhW5d/E+tgMYgzoBjahMFgqwrGEzw2NhxwG0Lr2dLxp0w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GkpJMzET; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GkpJMzET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Xr52XG4z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyp9P4grPllzOXb/FDfc3P36Ny5HUJfdzXyZKcwlputJP1y1PI4eLuMGnLNsd8V3yewqqZ7wHo+2IGkyPBcUK8BUBI6yYb/NmH2J0Hr/mOkh285G1ooEhhcRUZ9UIjNBA9GCCXvHYBiVCPmMlTdt+pXcCYoYhjRYymkflaC2md/A+XvyReKuHAj8BnNqoOdiUaWBIuA6wHYzE5ezU8ivNF/j7Noxy5r2POkT2YMIeRK1Ld+OVUxJHT3htW15r5XYLZrvwJJGuXejP5ZWV7SJbeOiIu7sDkZWB0AjF5cfjd1Xr9ycd/C0oNmqz7QCjCvLr+kl0dNGrLmznabq4iWRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
 b=HptKduOHXFtbUrTMrW7ZXzIb0NpvLkykUCZomR8xRE7jGSQqP20pnYSoJRXxU90lVuJNDMGDsnqm4aRkWtVlFvruxFYcE5P9M7viodqz57ROas6NqgG3UC+/zOke72SIfLaNqUeBoaqtrthjj9GhcprVrt/WpyseSJK3JVP81Ps2f2bHkaeNMQY04MhdjdCOT0qY0EVUA3RLjt4BdNlwnN4InC2OCV6tEFiIm8vp7oDl9VTd6ICN77/jcfgfQtSqYk7j6vi7NkTzfk9ps9c/UgVdVLlYCU2EDuj6Ny+EMU5lYBJZe61zi2Ad1tooo6qWFJV5/BSNS20bUg/tM78+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjKrklgDs0kHLYuOwEAzFFY0Zk7z76an4TOf5phzNpk=;
 b=GkpJMzETfW/TDU5BktojofP6jw4MzKMlonfoZYS3qDmQjj4x7xOqZBuFpCelfdaRNJJuiBJQrXaGf5HGdXv520LHAqrJP/bO31wG/jk6OfVh3gA7NpRHwiNfHkNNfWQ/Tn4MR70SNm2aZZG5xe/ewz/dOY2fqWGBQgwTDN25oMw6Yi/WTHYXpkZTxfyMubm72rS5fhYNKtl0xPMxZG6LENUaCYNeQfjsv7z5KcoFQA+FbtAoiL4x8i6EAIzEp2z9mJjKj/XCenvWcB1C5maVw9fdcMKBZm4p1Y67N3K+lPw3ywxjNcYtazGwCHWfVjksRMld2RZJOwtgALmld1hlKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:09 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:09 +0000
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
Subject: [PATCH v4 02/13] drm/amdkfd: Use migrate pfns internally
Date: Fri, 30 Jan 2026 21:50:48 +1100
Message-Id: <20260130105059.51841-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: d498a71f-5b81-487b-4820-08de5fed7a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Va04YSrqMlbcSHSiieCqpd2BHJc8mKtJR0gCSW0gc9hkq1MXwvQb6nXVvGSm?=
 =?us-ascii?Q?WWVEp0kgmWKSyBgEn+i4WfHOkSUnjR4Oberxbw33LGqorqxCQvLRaq0VwMw+?=
 =?us-ascii?Q?5oWdf9OdgUz/LByCgbLe9yZRQT1Jb5qWeZWYFV/bvWuspxp1MWbxz3nA5eiB?=
 =?us-ascii?Q?hsvwY7keX5ClTYmKaaR3f6ZowUEFGq6ect2T5Wqj9AvsEzj1gtfIPXnnjEmZ?=
 =?us-ascii?Q?LzQOBWpxxdASU86CYgstXkv8YGLDTWgo9uRr3RuPkXZ3sysIINhbzsckqKTy?=
 =?us-ascii?Q?qdYyapw9FDfgwhElR/+3drvTiCqCgWM5cQDb1UPNW+4m3cZrMzEwL4r0RS9t?=
 =?us-ascii?Q?9rVtHHAcDASWhWy44RJimhQyflyyqsRovL3PjXXSweqnG91jLBXogUTF8YRe?=
 =?us-ascii?Q?0OkctFn8CjUIr9ur69UU8ddKOhT7Obe7wfnFpwY4HTRgAVosYBFnk7vMh2MC?=
 =?us-ascii?Q?cuaxz2HYxeT93/EBblh9PQRjcCFUb5LwB3zSTPOz4sE81BAun61Od6B/M19H?=
 =?us-ascii?Q?ijIJrqCbo2XYBpGzpOfRrM8AlwPxFLLmY9ADG2Otsih+ted5Z6jJtioTvp5m?=
 =?us-ascii?Q?FvNlL/tvbRXGWQqI4rQsQvR9G4d4FsKpHAVwgNDCAWtAWe35+R32IzrybTxx?=
 =?us-ascii?Q?Cz9wcBINyIpW3ei3SIMhNXJhqXl/bUxDO/3SeJUPyOMET/QOdwvIuDui5Nwb?=
 =?us-ascii?Q?iMMxtQoSmNmUnsYlmZfs86tXKK5o8fS/rvAsyJMkvB6aZXDfVJ146xOISxOq?=
 =?us-ascii?Q?YHjHvgJsCuRFrgzfWdc1jNGBrxwFG0maMAvkrkBNWv6TDOfYkWCdfE2wXj08?=
 =?us-ascii?Q?hk2iAUt41leF7azTIj6uejFL1KK8OnW4Jbt/tpRpfIlofQvkxthgGSf0unzh?=
 =?us-ascii?Q?rEtWPLa36u4ua3QBHX9J8kgqmxoF6IrtXcGFTFfQMuXCb81EgjLCqw1M8Nzv?=
 =?us-ascii?Q?l9ulXJaD8HIloZMUEMaRdGrgeM1RaFhRtPqYC2D4LuztwFEBIEL9/rEVYb4s?=
 =?us-ascii?Q?YmJQai3rebvpxkSwF02wJ+pwdwDuD5sz95Au18n/DokcKqohWbV+5tAn33BU?=
 =?us-ascii?Q?8B5nPaSGvvVJ73fABB3JSNJZNA6hHkmUNx8JVuyF08wQZzVC4/NTxlT4oG4N?=
 =?us-ascii?Q?jHve56EPfQf5pzs4pylOH2yFr2rL40FGctevfXkVWNAh5IfZh7NYeGQo8iWA?=
 =?us-ascii?Q?UByaCS9IrbLic79se9RIVkIE9FujzK0s6+1C+m0uf7xXIX2oKpCj8w8NXxHW?=
 =?us-ascii?Q?9JRzl1DAst9dkQGy/FskOir671e2HesPJtQXZcOsvv4iSkURJQq18xq7dYKd?=
 =?us-ascii?Q?FH8bXA/iOXsQjYtzOfd3RNspkAZNtDknH/Psypg+1nL69ubogkjzF2+HG7FE?=
 =?us-ascii?Q?0CtCTfdDPNN2QpOdkx6MyQPmsREx7LMq8m1iM/K3YWepNsufx/B+OKP92KQY?=
 =?us-ascii?Q?reaQFH5oj9XEFgDEbBQkSvYblktmf7v4Ea10J4fNENTC2U2zg6t6n1IEOMzo?=
 =?us-ascii?Q?E86162ejV5JX9xtesbRuFrZoJ98GJ/T846uNROxFWGMC30azNNVhoIGDBkt/?=
 =?us-ascii?Q?CoEFhwXGDgTVSzRMknE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5NGsrUvHZF3pEiPDsGkB3Av0NRaM+QhZh9qoPjLApG/KXRrVLgfid4s3f5tN?=
 =?us-ascii?Q?GDW2+514pqK8/n9MqIL0CYzEAKudUnGoNFMthCoY6jAou1ClHhXUqZqFMWqS?=
 =?us-ascii?Q?mka75cL8rjvqiKPWYe4tnbJNyM8kbhmgNwSSzT3SY8ruGUDwoA4ZBVJXytiE?=
 =?us-ascii?Q?kf9WzCcy70pPJeT0KH/wWnqbi+SLLHS3rxuyHDb02xA57ccU4J4WhEjiZ64Z?=
 =?us-ascii?Q?g1zudsDiITgB145PBh4uqwh8ESrCRP+XQBJ9fIX2pfTmaxv/ymH7CD6oDRfT?=
 =?us-ascii?Q?EwPOCpB+ZunZlloXH39CEVygIwIHtdi8LpaQ3hu9z5g75lT0z/n3pSeVdlAS?=
 =?us-ascii?Q?jmKAK/x6u+OeoUsTwDk4YxIaS17M99c4onc7TNBsn4DYfgHf6o3AKpxoyz55?=
 =?us-ascii?Q?f+s22Mpy91VCSInDHXMIBuzfgqzAE31iSzZr9HDjkDndWOTcjAXi3DAhXAE1?=
 =?us-ascii?Q?pV+HCYp34ZOCySLAnzJDkjQCNgs3D+9E8ArmwCYHhc7sg4gKcHIrGn2i1kdx?=
 =?us-ascii?Q?g27/ITZ+Zv9904FeObtRotRPHaJo7Dpf4zRD13yLozpM2RR/nHekYAhkKlcN?=
 =?us-ascii?Q?X2cajPViN13g6HEQrifdna1QLTpPXLRcelvb+1y14NaeNMumlTHOXpHT5oIK?=
 =?us-ascii?Q?2pInPIGJTvsoOEf+rqsw8yc9OZZES09mIQGr1Q9ZIXeYwYJRmia7Bk9qQyWj?=
 =?us-ascii?Q?QFjF/z0q0yTtrASsdJ5iFScggwOu/it8zm+siwf9fQTnRQDy1WU6vQ0pxBNt?=
 =?us-ascii?Q?BC83HuypRR9rDi46RXHrNJp6As/G4KjWtFu497m7cuK2VYBcZoZ5pbQIQRq5?=
 =?us-ascii?Q?Thom99wxQx5eWNjfWh+U9bcgj3Tz1xrF07YV5qCM6eVsjazbaGdi6hvJbV59?=
 =?us-ascii?Q?7/IHcEcIwfri/rDyEW2F1ds5VnHNFmwuQaIED8E2SQ6qB4ImL+RCQlfZUNtQ?=
 =?us-ascii?Q?/eoCJrqTH3lUXhYgMbv+lINBfeCXLTIt2jWmXh8dj+H3be7U+oHnd9zPq5n1?=
 =?us-ascii?Q?YPEynZmCRzZUExLdeIUOj7ZsRsqNAerLtOu6w0JZ/5ypm2qnX4QBdH+9Gtuo?=
 =?us-ascii?Q?XjLQ8wxUqv6mDe8scK4RYqlQIkOta8PQ45+PZI+KlsZBYD53QjbKt585+XC7?=
 =?us-ascii?Q?qKxQxo0RI7hHrTsFwSmul0iZE/zXT1DRqYt1QdzMqJXQKUk1BAt8AdJiBeSZ?=
 =?us-ascii?Q?wRQ3w688HAnZMuXVTRRwb/RAFitiHVyUdiQiS9G0eVGcnPaXLm8R0XLdTfwi?=
 =?us-ascii?Q?qKB755K547aJzJ0QI6sjb8hz1nbX+PieXqP/kRT2DM0g3oSRuJDHga3re6Wq?=
 =?us-ascii?Q?9aAKMtsU8uWez/OaxzrTQx4Yy1lRuZrVsHTwzFsXOiW9pnAzatJe2+Tsxokw?=
 =?us-ascii?Q?KcFamux5vllz+vviSo9CDOeyGphTDXySPn/4VBWgeNtPNztydPJsixI+DVj4?=
 =?us-ascii?Q?k6kH/32vp6NYiVpH9I2r0DvjOkGYxuAigTEENWW8FRCuiosokTkE/PDv4RMb?=
 =?us-ascii?Q?0D6GQ0hoBLVRlNgHWgfal+/P48dABqlnxEnt7b+kL+U5NHfq/dtoIpO1O6Lt?=
 =?us-ascii?Q?Yie8tnDHRQVmvECo49xUs8ViQ4+HGuuybWpP6cl1+BMUY9ftyqaYJQ5phCuR?=
 =?us-ascii?Q?ybsVILw+PysVOdMUUT4T1sUJcFNCcon0ylUiHUd8PdY0CrVCJP05lmIg11a5?=
 =?us-ascii?Q?XbrZELR3ceWt9Al7XdeIlFUgsFAn9OZwgXIKaNDuw+4qqOKS4lWwTxKG3Tq9?=
 =?us-ascii?Q?xHs8CySxAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d498a71f-5b81-487b-4820-08de5fed7a38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:09.6688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcHAzz0SmBak5wyVH1GgBzV3YqpwXpZrdMnVZ6MpT6VQoQiefWOlfv4d+WZBQ83a2MTKuC4X6yeD9enjdp/oOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16430-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 17305B990B
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() with mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
v3:
  - No change
v4:
  - No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1f03cf7342a5..3dd7a35d19f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, 0);
@@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1



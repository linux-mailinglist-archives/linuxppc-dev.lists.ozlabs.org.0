Return-Path: <linuxppc-dev+bounces-16508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N1KB26MgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16508-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B48CBC13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjP3B1sz30BR;
	Mon, 02 Feb 2026 22:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032233;
	cv=pass; b=YT3j8lZncwdLm6sho98ehaXxKsJ3pwGyBmAhyAMm9oIEWvALWGwCD5bo3sup0eQHcW+SF8NZ9DNDxQwqA/JNyUCV5MaNCgEk4whf0M7/FAd/trfISwsKKl5oGVkMH93y0GCXBlDVdUIaPljbwqUaw1eQpUjGn3dIEs9LCS/JahDwy3udbrtY1LI2ovrfMVcCNDAvuwXPcK8hQ/+zug2pgVdZK/8t4BxVDvFb0d0kfPDXbtYjMOq40R9ZQvvQrLtT1FqFS6Hf+Lj5WQJs6zW+zBEik0BZUTwiT5A+eZWA10j3nGDeAHnpaWhobePOFr1+2aqnthbfSz+1ZgJYX/PtQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032233; c=relaxed/relaxed;
	bh=wN3b0XQDjFqaMSFM6omgYIu9zX38UW6OCLZLR0IHWxc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ksjl5A4Ks2vzaG3Vu0Ez9Zwh0TGyP16TTe3dJuX/QlgTM8WoSuXIItUxFnNRTQKxkuiJ9jYhy5OZGXYA6Si/sTOrlKeTryetxWwf2PoeFqnMfDPk+zQJZvkqbGaMtLCRHNJnzw+TC2683rXYuT93ex5pYWnjn3RqcKetbYGVg9eFEkhNdRx4D+X5+o0x175+lp5e1VblErcFEV3O+0h1g0kQTP8XG95sG2C0GrxyLhf0K95lO5ueIqWpkXUvjA8Hcn/okAI2JKwfkL2kyULyDk+zEkvEX3zfTmLuNZfF8dJdGFVpT2qj8NsL2d38dn7R0D2NruH67WQ4FH9qiCuPWw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tHhE1vsp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tHhE1vsp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjM5Gw0z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c496G+gnFZ3cKRX84BEXu5sdtkh5js15Q/cy6MUiX81dV7kZE71COJ/PvkHfKjJ9xSUgBstJCU8vuYkQKU0BZYfyhS/6s2nOM5cWu0sHHFnvowZqc97m5reN1/61b4UFojjIRu1dWatky3B4Y7GMAhk8CauovWNoaVMihtTiypc/XUpVeZ317bRpOWIBKjsO4ZA7qOPgjVGCkOAC9jbo6lHtwZHWEUuMoUt59f748YQWBV7K+KVGxLg/QoYn6z6sTGY4RBbfKswBElu6piu4uCfT+RNOrpriunOABqJrsJuob+kESqP8VujXD6dScz5zNOOsXHR2AHhR3gJnKL2iwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN3b0XQDjFqaMSFM6omgYIu9zX38UW6OCLZLR0IHWxc=;
 b=T89mketEJYhbNDWhOHzBBMoBRCl/2XFWzv8emVqQXktJ5FdUjvRwayQSxK/apCqzq9HqI2CP4VwuhaZ2wX7KrMGhBinXla78CIXQfOqBLHB2NiWNpuLnuB/rCJXeLrx+QycvfLOWJNGSh1995mH8XMP2qLEHORUG7AFIgesp8XK/ZR0ZWkox5yXPDXP622G/WlztIHHCdkSaY8n4VaL19kwNqwiuyrWR2gQg1M4oaagy7mRb9Kz0sy0Po69OS2P6NEkPFA6Hp8gchoLNPyEmOE4DWpYfksKVz0dUWNyBNiqLJ6fCPgRSv/ftu2vousghlnmifIjjKeyD0GXIissVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN3b0XQDjFqaMSFM6omgYIu9zX38UW6OCLZLR0IHWxc=;
 b=tHhE1vspCAeQhwmmLyQb3ai7gc1ZS6/nJbSJn0WpniOi6joM8uPWv2gzCzCbjWRVC3T5N/4kr8s4jqU9Cei9fzXfOBNk8YC/TB/h7Ahn4lwrK1xAtsZpBb4AF4dunHvbEJE/syGQdw8uOb2NYFhhVeMqYKe5JolyI8aTpBVIdSPWZEcwQMIoLS/o/tbzlsjGcSeP8wmHfA8hyyytm+rZvtceUm0eiYYaf36hRNDGk31a9YMQykQ59kbrUd+fFs9RwrgXDxfA69TSFNrits3rYhT/aH0mnjILp8LPSRRHEEhYBWKSYUnMUN9s6y1J1AzOufJA+/jIPpAXjMV1mSvyCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:36:46 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:36:46 +0000
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
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 00/13] Remove device private pages from physical address space
Date: Mon,  2 Feb 2026 22:36:29 +1100
Message-Id: <20260202113642.59295-1-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f0ee8c-d16c-4d51-59b1-08de624f58a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q+UBmJ5tUKjELcENd2CoQD79KHrDSCx72d4CVjOAeIbp/+whj2OHc9Tsj5JT?=
 =?us-ascii?Q?+un20/60CC12JgNt2baO2kfSexChyxT8oSNZFkYSCPryR0ZfJ5l6PMz8sf7z?=
 =?us-ascii?Q?IPCz0j2f/cfBHmthMe8p69NF0qCJ7C0ceurK0vneNmjBVOFXM3YbRmroufxV?=
 =?us-ascii?Q?cFCVjeFenROAnoZPI+kIwhOicHTYVT501BVduD8NPSCuI69P+5hI95cCZG8D?=
 =?us-ascii?Q?xhztaitVEt7d0epdFKlI6Os6FUxBRoVIaJFRwp0t8bhwiE+HU6kXFCRavmfZ?=
 =?us-ascii?Q?yDW63LPV/wbevCXnhzFtwo2oc6LYIYWBHGgbHV9oXGd4po41gFHMqCSO0Xsa?=
 =?us-ascii?Q?7TLmo+NWLrV9S1cvt6njJ1TbK+PI3I8Hpk/8JOG1whlhLIwvViKP+0IyosUS?=
 =?us-ascii?Q?qeV4SYwaA1/o/U9cl9Q+y4EiCufjw9OZpAcXDPtWtkiIDPjrAXbbMmAfI14L?=
 =?us-ascii?Q?fkYe+7uOMUkkZXLOQWtjwINx0C4nAN+D2UHs4nE3v9jx8DjStOivE1VUjOy4?=
 =?us-ascii?Q?qJWMAFNl3yGMo48jz+X0hiUOW7f0+/Uq+aAN/G35KevFDTcBEFrAvw3MrK6z?=
 =?us-ascii?Q?hhXF7QW/ZjpdjbD+DTukO3Kx7HrkF3qsjHZK9nHXMtZ3Uz2QHhtuMBfkVos0?=
 =?us-ascii?Q?gJQnwOqC82MrjLAKQ5CoVCuk4fh95wnAJJfoQryf0pnpnG1R0995YWC3Wk+n?=
 =?us-ascii?Q?WuaOIfhA9WXqE/Wy2UIAtIH/bcBB+lorrNPLWH1qeO2NVM2eIn6GvNcqNlWB?=
 =?us-ascii?Q?5aVlWGhCcwSl+KRAJ4u2oA5eVX/1gFj1nMFsi211l/Ln8jBzvUyWE8cwRKDd?=
 =?us-ascii?Q?TJ3APy2TgoBw2F7UHjXtsVauiWO8u1KP64O9nLfoSusqKqaqzqcNUBtr3uTj?=
 =?us-ascii?Q?NFMmuNlgHDWwwVfvjtU79RozIpU4tbQ8DnQYKLOFvkEzpOi8aMI5EyjWiD7f?=
 =?us-ascii?Q?fcrF1Jhb/MGF2qLrxKbK69Qhd7tT0vuls0vWs236F/T6anQY6HlxgoTnJf29?=
 =?us-ascii?Q?mKSuePWTE0Xft2CL9g3Zlj7Fyxe77b8S2zLFEG8oOZ+sfHkKKKXlrRkHHS/+?=
 =?us-ascii?Q?Uu00aOKFHJmDi5X5hebqJ3Djxp3riN87mGkjwWqXG2UwIAeJ3qrSpdTn0nL0?=
 =?us-ascii?Q?T4UEU/OD6z9GPAl8NtmjbXHtqMGBoCQbEy4Ps443i2j4l3iFOsU3DrF63Xfg?=
 =?us-ascii?Q?YRmxEPm7oVGk6olNJ8if6BRnofn/xP3rK5r8mQqlXt1ajG/RnICelKPPkWOl?=
 =?us-ascii?Q?V2yJSnSJsXJ5BUJV9UjGy44JEcZhAH2VY7yEOpi4IpvWFpPv4HemRtK42xY/?=
 =?us-ascii?Q?tfUQjSf6gqUWFfiuiYtW+ecjnKQbilH8zD9aIneIPh4/C6cFItlfri7yLGWH?=
 =?us-ascii?Q?O4WoTMRUSzqBtr4LS/tTGy+G07fG+K4MjjWB78sai0DHrXbzkC3JHfZqfYQM?=
 =?us-ascii?Q?QqfDtqC2DpsGQy3NCjNZ6kBifLf/2TfUW3ddl5/PIGSQeRsBQonSGjBsqke3?=
 =?us-ascii?Q?n9QP3hbYxwmRGTiGe6UpU1FUobkmGsTelxM665dn3TykpN17vwlJp5mhQn8O?=
 =?us-ascii?Q?rYqos40POfuydlde2knV6KoDid8e2bvbolxkjTB/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a5MMBqhZD2dwMK54gEmlS9BCh5VS/lNTL9fCiDkJLVzIo4X6dagowSIbK6Tb?=
 =?us-ascii?Q?XhyhEZtAIZpao4V9HWKcey48IHqpITU3SLZm5MqNR2MqEBSr+F90fZ+f9U7r?=
 =?us-ascii?Q?l6FVgcyR+r/P0T6GCSXaIdiVcVpQTdyKcsA3Dt08irLGvAUJn5DgL5iAoVGN?=
 =?us-ascii?Q?p0/vP8MZbyK+97A1keQYaFneiJwcgugS4xCwhqM9F1BwLz50FOgA7kPejxfs?=
 =?us-ascii?Q?kN5B9e6wysEbUDCJwCGtn86OVTm2vnE/S1ctWhlsKKRHlcPY6dM0Mag7Ac20?=
 =?us-ascii?Q?x7L5qxNBCkSOjxusOBdiyNpomTzu7zSfuObdpBSNndh78k9sXaSNhArgt5U/?=
 =?us-ascii?Q?34xWpyaphRY/W35+JtHbEivnsVeYmZ36MAxgf9etAj6hpV0/K5B07vnvEgiQ?=
 =?us-ascii?Q?xKN72IxpcD8KDeaVaVDyGrOM6liVkIx2IYv4Xih7sZ7eLhMP5jz5CNjgSzqV?=
 =?us-ascii?Q?CaFolXwUxioVy6x7ODndJ6GZrv527xFr4DG8gb9oU/MD729ary8RfG35VYIH?=
 =?us-ascii?Q?JGO7/9YMKZ2XxWl65+vhYmKG22z5WGAOnLE0uG0GZ3HI5YpbuOlnwC1TXKR+?=
 =?us-ascii?Q?CQF8fYTt/jNrJZQJBbP/icxo4LfdbTyrU0jlS90jGvshh25pdnuyxI07pR8z?=
 =?us-ascii?Q?XxWqWk583RIPUi6pViO0HGX6QqjZ3uv6DGj6cpIs6ncXu4exGiSU6SyAISBR?=
 =?us-ascii?Q?VbeJJZb839G0n7xdPgOdyuzH0oMOhKYoSGez9fLAi4BOk5sWuibSd+NMRahV?=
 =?us-ascii?Q?8kFFBfbtoJwIEJfnFAtmxEtdX6zsX8RHfUGvXDIllxfKBL4vZlwxNZKNup0t?=
 =?us-ascii?Q?DLMuOUK2pZo8wMJBrx9K3aCIY8CYsbNmFhvhwPQg6VTbENVhIkUjnWzja84y?=
 =?us-ascii?Q?rdwomp6HXnHIgZkSXV+SCHVz+3uGfHSUIp9V4M1RIWgZD54FEwLPGAqvh9vf?=
 =?us-ascii?Q?ptp2pMDF0HbfN8zqDHB+t6ZlcnJxQUJ4ImSLbSoI5rDxUWV109Sd9kqeZ0c0?=
 =?us-ascii?Q?Dv6yb930sAy2q5KIZrlST8WMLlR0QPwsA+xzJ8b2Apj72WuaWi+QAakqjbp1?=
 =?us-ascii?Q?5YMzvSR5lOR1uEQdva49cpNhTN54Y51iL4eeBWxsdcGmN4+nngzsjnBdmv1m?=
 =?us-ascii?Q?IQJEUtRjEi2ifx6+o7SzCO6DnIcN49UUuVrnbdkwGG+Dv2chRKasyV6/HWp/?=
 =?us-ascii?Q?q2oQgdpBYQQZp8/PjmFpTVbUp/XFuf5KKxiwirg3pmtrV8UZ+4iECx885fPc?=
 =?us-ascii?Q?2YyoMCmRGb6CzK3A9eJ7dRnB+4JII+LMtw7Zulcqfzp2ba2kG2LHuU4aMcJ8?=
 =?us-ascii?Q?H4xlScWCUaRAXI/BHCnhfLUbOoYbeTtZ2/FhmuRDAmwTOMCmIhCd/+undWon?=
 =?us-ascii?Q?5fhzxZLKsbNmtpDA87buNq7yLjTJzpbIGavDOPIG2wU0xMtGqMc+hTr49tkK?=
 =?us-ascii?Q?W8+c56AJ5K9221UHrKmCUZXYBs5jsn7LHmWw7J0783h9GgesMUXhvQ0NygVK?=
 =?us-ascii?Q?x+Ap2O0iWa28Pa5bhE2dZwh4wt/GCsJlhwJ1MIddmKeYhRau+ht/EMyHyWhq?=
 =?us-ascii?Q?T10oro+riPW1ackqlF4qHSV212Q0h00qcWTju6FDr8MdizKqHBGOKI5MjXEX?=
 =?us-ascii?Q?kBj1eMOaFO2SUjW+E66/fq6A6O+sJEkQRk3nARSUPrAaeVLzMgP+MjM0j/g8?=
 =?us-ascii?Q?X5yLyTkxK+LFYIwyZquuMFlvDbqV37JayXAwrJ9P1ZXPHrdeIg67ISd8+xV0?=
 =?us-ascii?Q?AquUt+g+TA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f0ee8c-d16c-4d51-59b1-08de624f58a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:36:46.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz7gqY9EppmqpyvHOFfmQ64pFbwG2N80Yup7wkdPj3CFGSjoNWHgcqQ24sCh+UFa4ilKL4YKqy1rmku8BRTWww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16508-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 28B48CBC13
X-Rspamd-Action: no action

Introduction
------------

The existing design of device private memory imposes limitations which
render it non functional for certain systems and configurations where
the physical address space is limited. 

Limited available address space
-------------------------------

Device private memory is implemented by first reserving a region of the
physical address space. This is a problem. The physical address space is
not a resource that is directly under the kernel's control. Availability
of suitable physical address space is constrained by the underlying
hardware and firmware and may not always be available. 

Device private memory assumes that it will be able to reserve a device
memory sized chunk of physical address space. However, there is nothing
guaranteeing that this will succeed, and there a number of factors that
increase the likelihood of failure. We need to consider what else may
exist in the physical address space. It is observed that certain VM
configurations place very large PCI windows immediately after RAM. Large
enough that there is no physical address space available at all for
device private memory. This is more likely to occur on 43 bit physical
width systems which have less physical address space.

The fundamental issue is the physical address space is not a resource
the kernel can rely on being to allocate from at will.  

New implementation
------------------

This series changes device private memory so that it does not require
allocation of physical address space and these problems are avoided.
Instead of using the physical address space, we introduce a "device
private address space" and allocate from there.

A consequence of placing the device private pages outside of the
physical address space is that they no longer have a PFN. However, it is
still necessary to be able to look up a corresponding device private
page from a device private PTE entry, which means that we still require
some way to index into this device private address space. Instead of a
PFN, device private pages use an offset into this device private address
space to look up device private struct pages.

The problem that then needs to be addressed is how to avoid confusing
these device private offsets with PFNs. It is the limited usage
of the device private pages themselves which make this possible. A
device private page is only used for userspace mappings, we do not need
to be concerned with them being used within the mm more broadly. This
means that the only way that the core kernel looks up these pages is via
the page table, where their PTE already indicates if they refer to a
device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
use this information to determine if the PTE contains a PFN which should
be looked up in the page map, or a device private offset which should be
looked up elsewhere.

This applies when we are creating PTE entries for device private pages -
because they have their own type there are already must be handled
separately, so it is a small step to convert them to a device private
PFN now too.

The first part of the series updates callers where device private
offsets might now be encountered to track this extra state.

The last patch contains the bulk of the work where we change how we
convert between device private pages to device private offsets and then
use a new interface for allocating device private pages without the need
for reserving physical address space.

By removing the device private pages from the physical address space,
this series also opens up the possibility to moving away from tracking
device private memory using struct pages in the future. This is
desirable as on systems with large amounts of memory these device
private struct pages use a signifiant amount of memory and take a
significant amount of time to initialize.

Changes in v6
-------------
- Fix maybe unused in kgd2kfd_init_zone_device()
- Replace division by PAGE_SIZE with DIV_ROUND_UP() when setting
nr_pages. This mirrors the align up that previously happened in
get_free_mem_region()

Note removed previous discussion in the cover letter relating to aarch64
and memremap_pages() as this was actually already addressed in commit
eeb8fdfcf090 ("arm64: Expose the end of the linear map in PHYSMEM_END"). 

Testing:
- selftests/mm/hmm-tests on an amd64 VM

Revisions:
- RFC: https://lore.kernel.org/all/20251128044146.80050-1-jniethe@nvidia.com/
- v1: https://lore.kernel.org/all/20251231043154.42931-1-jniethe@nvidia.com/
- v2: https://lore.kernel.org/all/20260107091823.68974-1-jniethe@nvidia.com/
- v3: https://lore.kernel.org/all/20260123062309.23090-1-jniethe@nvidia.com/
- v4: https://lore.kernel.org/all/20260130105059.51841-1-jniethe@nvidia.com/
- v5: https://lore.kernel.org/all/20260130111050.53670-1-jniethe@nvidia.com/

Jordan Niethe (13):
  mm/migrate_device: Introduce migrate_pfn_from_page() helper
  drm/amdkfd: Use migrate pfns internally
  mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
  mm/migrate_device: Add migrate PFN flag to track device private pages
  mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track
    device private pages
  mm: Add helpers to create migration entries from struct pages
  mm: Add a new swap type for migration entries of device private pages
  mm: Add softleaf support for device private migration entries
  mm: Begin creating device private migration entries
  mm: Add helpers to create device private entries from struct pages
  mm/util: Add flag to track device private pages in page snapshots
  mm/hmm: Add flag to track device private pages
  mm: Remove device private pages from the physical address space

 Documentation/mm/hmm.rst                 |  11 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  43 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  45 +++---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/drm_pagemap.c            |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  45 ++----
 drivers/gpu/drm/xe/xe_svm.c              |  39 ++---
 fs/proc/page.c                           |   6 +-
 include/drm/drm_pagemap.h                |   8 +-
 include/linux/hmm.h                      |   7 +-
 include/linux/leafops.h                  | 120 ++++++++++++--
 include/linux/memremap.h                 |  64 +++++++-
 include/linux/migrate.h                  |  23 ++-
 include/linux/mm.h                       |   9 +-
 include/linux/rmap.h                     |  29 +++-
 include/linux/swap.h                     |   8 +-
 include/linux/swapops.h                  | 100 ++++++++++++
 lib/test_hmm.c                           |  87 ++++++----
 mm/debug.c                               |   9 +-
 mm/hmm.c                                 |   5 +-
 mm/huge_memory.c                         |  43 ++---
 mm/hugetlb.c                             |  15 +-
 mm/memory.c                              |   5 +-
 mm/memremap.c                            | 196 ++++++++++++++++++-----
 mm/migrate.c                             |   6 +-
 mm/migrate_device.c                      |  76 +++++----
 mm/mm_init.c                             |   8 +-
 mm/mprotect.c                            |  10 +-
 mm/page_vma_mapped.c                     |  26 ++-
 mm/rmap.c                                |  59 ++++---
 mm/util.c                                |   8 +-
 mm/vmscan.c                              |   2 +-
 32 files changed, 783 insertions(+), 342 deletions(-)

drm-tip:
base-commit: 23427233a45136e0f56ae07abc0905ddc5a70dd6
-- 
2.34.1



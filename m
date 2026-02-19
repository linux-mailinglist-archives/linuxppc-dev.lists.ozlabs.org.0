Return-Path: <linuxppc-dev+bounces-16957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OFOIrh/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94070162C0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5xx0jxXz2xQr;
	Fri, 20 Feb 2026 08:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524887;
	cv=pass; b=AdXf1sGvdrrJbDrd5G7/2sljohSlsOENuUpxYNY654fsukqyza/0TJQ+YEUpExH+cNle2km10WiSz4A1jiQ3/TUEfSSVlD5Rd93wAjtwzh8SJJpt8zIBg+9RytwL+M4CXhYxcRl7CktKC0j4lKGaSjtN6E5ZFkxST07ze95c+AcT8M0hTmvK56XUPzlLp9mDA51VLIFbFmrj2LyMDQkdYNNmktKfSt51vWx8aXixv3MY8WK05aFh7y1NWI1n/98kLO+hiKQWdo10Do+7UH5WKr2alASIEcJe2udt2mK175o0EspsqNnc7oamVfm8mSdhYwXgoRhlxt7ZYZzPsivjdw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524887; c=relaxed/relaxed;
	bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bzmlou7+0kdnSq5xuvVe98ohhm+ro7FVFd6OeehdlGvsJ98Ct9LOF4f2aocXewtubOr6O4Sh0zRGeT4epZfojj0qft9UpV8FYAsZxWnE53VAjLeVSyWC8li3TUJGP9VGGa6hVaUrCVGN4Q69vDPv0tawqw7gi6fHRQ1gouukbrCVqvkVtHQtqcxRPigm0ccJ/iCxwE0XUQ830p/kXZ+yUf8qip3OQQk6EYE1DGosJWnoFms6OG9JAY1AObwgBCxZijcQKHDWmq8P1yJDr2uA/cNOFpRsyjsfsCiJ0p1EXvUkseJ/6qxniVS5L0m4qCpIvVAnlKhc1Gn9J2rg3NhJoA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mk/X5U7n; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mk/X5U7n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kG4zSBz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpDg5dCNWRUmQd1tcy8hKFaJ5VtsOV6zh2bXFF7hSoN27xeIDuDpv9Luwj3A3F01g9MxkFCBPvd5Xp9vrsMWWYgwiy6cFCd8ay/Hc071WSrs8osDgSgoPfrASW2rdwXcTF3627zeO/g2twLAPITqWkgrCUDfHtYPjG+bnlMYJ/qnlcSP4JGa3XPnqE6XQfieN6Z6fPaj9YsE392mNzU8UrcAzfAaLlx6Ol+zRG6XMtyu6Kgf17pZ+tHoyCOR8soPaz5PQKkb6/Fg19MZQe8EOA3za3ZDgzvUO+pdGa39bSZ0qrpHcDld9+HnjqP6zHyphjwtlbpy5svolGcVym2AbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
 b=OasksYnizzcJ1OAC4dF2hU8cXHHlWnT05TirtSWTte+BHLdu/+Odnwpe+KrvzBaOYkAVdVxnClLzHNsOgFGJ7N0FETZKKNQ0rLjZwcD8Vczvvq5W/23duUHVXhJo+5ydFVGf7Wt9MNjFs2UesoyvePlJCStm6qi95Om7NVon+1e3yJQTM8OST6jUzachhcCKLzztQr9WPPoJ9ejdJF6YZMlp0NpfXw/gyQFlw+lw6FHIFMCWIYf3eul5/2J3D6BLwrvS00He+FoV1moARnq7qXzCq4i/v9/CZmdOb9VNrg5VUuNXXnWohZ37BPheojXPfquElaMz354ybFdSM0TiHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNqqN498IDW5eyfcUD1vMMmrinlWyRwOjiSQNUbO5d4=;
 b=Mk/X5U7n6loB2ln8Vmp/FEMvE+NVnHQfkyPunhGI2jYHZWfXwfyweiEKLvxIW8hX9AfeDrcl4qLbCB1aO5n4cfHvxqQmbmU0mPz0yLZOTKXZ6pOEMCoLTneRHKjN58QaTOTrbdO+5UUW0Tci7Zk9uoaqLtnA5THNSRucr7xWaE9lRZDY2Wh19hTYB3HIPbSJRVzBBl8h1kKgJJ4XjTKFam9JQstgezEgk7462ipG3s7A3Bq1vOTifkfMpjAgtZOlsbdb+v42vs8TTSuwUT6eANS21PPZwTiveksZMce+8BqVCPdty15Z9PEseWMIHT3FaTuUSFOGk4rZ2ZXWOS6oMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:17 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:17 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 03/12] thermal: intel: switch cpumask_get() to using cpumask_print_to_pagebuf()
Date: Thu, 19 Feb 2026 13:13:55 -0500
Message-ID: <20260219181407.290201-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0466.namprd03.prod.outlook.com
 (2603:10b6:408:139::21) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: debf58ef-4fdd-48fc-913e-08de6fe2b1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?okh26n6KJb4O//AWNEdvb+8KOF6z+16O5T+vLE03DSeq9f0zK3z7eCnHwujl?=
 =?us-ascii?Q?grv5dTDa9APQqp8zCEkLpmOGU6o1ZqYniShK8kPRGOALeQ/+L65YklIFsj7f?=
 =?us-ascii?Q?bSv2w65PxOzC77ErkFYabLDMQi+QY3PiqEsNMYcJRTLzFdQiKa4bhJib9jvz?=
 =?us-ascii?Q?T9J0ermjcYcoCmXh99CCaAIKzyf206yLiUfN1pOuMD9oiL0smPaloTaWa2KO?=
 =?us-ascii?Q?nV4F68p3KdQpOW6xH8fIW2SH7N6hnhekP+JhJ4DZ2idmrRD1BDV1Hdl1eJ81?=
 =?us-ascii?Q?Xe0+Ka9Bd6hlMcvzDFaH6mBxeflZfuSGQw9E5dEyleT3Hn993/DeXFnuBFCi?=
 =?us-ascii?Q?rJqSAxNPE3LYJcqTTlkMyfP1czFHTOinaRhPpsEIHuRA4vjh+s+cqtEoE1bR?=
 =?us-ascii?Q?/FEQLjiUewKVQeuS0m6Axc1jGeoKsJiTFobtKkBooSaV6e6AGGvYX3y7xOGT?=
 =?us-ascii?Q?XoJ5viJJNYjj8LXw8NPPjoTAwestU4pEbjUCwHs6z/5bautvkBpWRJ1YdJsD?=
 =?us-ascii?Q?OL3Z2j2m85TWrGlrHXCgpCbgmaESDPRbbWhETPmmk3kJeI2Dx2GHe7w03w1l?=
 =?us-ascii?Q?QhpNHrZSVHonDFcK/U5dQn4anz0BspxhuXDY+Ic1FD2/LykOWXjWmq3Sht5U?=
 =?us-ascii?Q?Gw3WC9ocXkZgZqorKIXa4M++X+k5vWxqtU0Ffg/ufHBNyY1+U8C8EfmM9Be8?=
 =?us-ascii?Q?P61YiRbtM74OjlLWtVQCDKtuQNvX9VqVIHTeMkjyHiETGPPFLkouIs59vWQT?=
 =?us-ascii?Q?INsjYWe95YVloopXIF60E5sFpxy8v2ghwuzAMr18bHtGxDIulksg4vOvp5gp?=
 =?us-ascii?Q?PZcM7/0jkU+KK7YiNe+WNfY9ArE/pAW8+5Ujyd00Pfcij2kMoFjl9pj4elpE?=
 =?us-ascii?Q?/YcmSCcOlhcKgmqwrEw72kXyMGMEvtzaZ9la7kcpwJjky3S7tVwgbymFTLQX?=
 =?us-ascii?Q?OjyYYgUH1ZRBmXFWu0KbS5WoUscrZWqEmpiwvr7P6Uj5nXGmeSjZkKP5VMNy?=
 =?us-ascii?Q?PUKJDVH6gMDbrHydbQgdYa7z1LPdLn9xsHHB5EL4npIYbKanz4aapUldzKQ4?=
 =?us-ascii?Q?NXo7+adCu3FC84IUguqsmSjlFR5WAg0DphQ/beBp+hF5rUY13Jx3HTLaA49K?=
 =?us-ascii?Q?9L/AHqoCkhxsGpMdYzUZPXs/74sW6R75sB97kroWJBI4MFkFcehnysiMstIm?=
 =?us-ascii?Q?VOFGb7vNjV6q7AsDwms1oHZoPQtBPa1NsQMn6hvhR4CyNbjOhUfm7iiSXVqe?=
 =?us-ascii?Q?rrEXZy2J8WUdHu2K/BlPWhVMK1LD+7LeopC0ka98nTG1vG1JJmNg4DhTXSR+?=
 =?us-ascii?Q?5cj4Ur9cbULrsN/om0Wu6XXxx4mV7im54ZhY2kFgWK6McUYepq9W/L49lNof?=
 =?us-ascii?Q?aYXsbyTPEUcSbVK+/dDdddqRlPkBIEGeYRgynir+G+EJ866njF+07BeGXkPn?=
 =?us-ascii?Q?ttk7XDwX11vcVU3EBjyMGfw5RShvN/dE6mTWFAIHFF6GlA/6Rt8QJc7TwhMO?=
 =?us-ascii?Q?x0UtcKxouj8/91OAkKy/KEz4KAJsXuek7Ww9MQCQBnbdblPBK7nTHDAlmGE0?=
 =?us-ascii?Q?58G9/1BpmlbWuXfXAP+c/FMVinGvBxbr6xnyShG6uPpzaeFzw89TBSWDboXI?=
 =?us-ascii?Q?1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fxrgn0nn+Y8wpRc335WnxZ6I+lPqkPIoTS0qdiPjGyHnxR76rlfwpdIuavxZ?=
 =?us-ascii?Q?W0znZYACPahdm8Nm1VLGB2IafUDSju3OzDsuwLF3hYtNq6qlbyuGTgsqkL/F?=
 =?us-ascii?Q?lsfGLYb0Cg5l/Gwn/G864CtJ1R0I1ZG2oE6+rU63gB3GQu56bXZ4Wd39vKpV?=
 =?us-ascii?Q?WU4nmOzbiPDSXx2Qx7SuxE4wyPHTLOl9qfsNyiIQYaI8jKPnjveI5ha+mRwY?=
 =?us-ascii?Q?CacDy3wIJAYatGePYzfTK7p4pOrhuCYcgmXZZVK1/T4bYk0eWJXkKqT6T5qy?=
 =?us-ascii?Q?LtzwhldQu0zIHPMuKjgIo0sOJJYU35ZjabK8pBlPnn4WtTO6K9x7f4i0NB7a?=
 =?us-ascii?Q?IKYiH4M6qlZBOZxPa8TSoK5SkZgkcyavvm6KNYzC2IIVbXMEOpxZXYG1oulb?=
 =?us-ascii?Q?jVa6LN7sG1s1ubYWmDMXiFe2ksP2e/j8YUIx7qvz7jVhVKy2GpEEKxqo/kuj?=
 =?us-ascii?Q?0mURC5UA4aGNbUHld4RDFw1fWk9rBlmR6UUbylbWCSzZ5kch6PTkPdwmy1hO?=
 =?us-ascii?Q?lldaCqoxdjMOw+9Y0a5jb77GoV+SBNlaHxRpQUNZ/5KO1n0oR+XPdjzAHkjV?=
 =?us-ascii?Q?vFeY1mtrkWS9zNtgMVjaPuhbpm/mcYa7pQYO+M0FD52N3gqHdqlDtgiCOl7t?=
 =?us-ascii?Q?OK2xpPIryYFzhL9P+adbe4SKAgf/Fo9UkEDORIvwY/f8HL7HdkFdp0z9Z0Zs?=
 =?us-ascii?Q?44L/01c0nptpMPMfkKA+1kZpLNHKR4iDUvWw8eDFTKHig2X6m8QZaEh5/n0T?=
 =?us-ascii?Q?pPds/GLSmcW+hxJ79iV2CBVv8vfJXvm8bzDMri2CREDaV+2OxVxxf/C0jTm+?=
 =?us-ascii?Q?aTVgue48WCimhVItvfLVh86KmFzMJqw0i+e/DL32QQEjCcLjAX4BPIP0cusL?=
 =?us-ascii?Q?LcS6NqPFAQtDtU4ro1XkYed9W0+Ynhi9LNzEx5DNp803ntv26B5+4TG3NtK0?=
 =?us-ascii?Q?7uE+NoBqLRjC2uZl/FGm6J4+TFJ1xg28CtmU7KUlGsb5NmpfnCdVUyF3vCPq?=
 =?us-ascii?Q?l0jHfp/LHsSfVYD5XlLSUaSS13+LgTpCmcEq5x0rM6MIRPhJS/tVlX3y5/rs?=
 =?us-ascii?Q?pvw15G7wLkeul4NZ5OFZosggdJrTbmi7mII0DFYB3kLG4GLmDKUItRNKbflS?=
 =?us-ascii?Q?Ot1gmye7ztMbWf9JrIGVLMkM9zxOtza/LsVa0yIKLERjPCP09Vx5YF851APx?=
 =?us-ascii?Q?86gSbC8veWIEt2Qjczzriys5zxFBCmfTVDXAc980KUv8JzzC8TgyWRg9mkFw?=
 =?us-ascii?Q?fBroXkO0HmwOjjZe+5XSxeityM1ChoRhn9SoFgLrQYEVnI5/lf9u1sY+FgkV?=
 =?us-ascii?Q?0BMx1oV57xNfJVytbmhzBnoMouivCNtKPA44VSEUqGU4DwiDDWoo43GNVZTV?=
 =?us-ascii?Q?bekMY9/w5aSRdJP2uWmeVHBOF0SkNxf7W2bsvSSgugLL7hJxHohNHlmV1Vk9?=
 =?us-ascii?Q?zuElP0w7JBbQu5CsFOWiX/nQ8gCjHVbawjv5cHQEJdUZwYxrChP/bva202V9?=
 =?us-ascii?Q?BEF3eDMyfImbF9Amlxg8Pmmbkqn1JDYGtAvZR0iwpBg2J5ll525fZ2Qb0/yt?=
 =?us-ascii?Q?bchRDmoYkVELz97znoQtwhdsYpaOcWlhma3uFtcUpXRtAs5vhfoft/DYF0qM?=
 =?us-ascii?Q?+WI6u1GkBgpnISo3BvrNAsz6X5jxyhPM2rWEG5vHGxVhnAYevgAGDGpuTJYe?=
 =?us-ascii?Q?0ULzF+avdNhwFp6yI4644Hlro+ng0XSPgXz8RqlBF/EV6b2+rxbElEOqstYk?=
 =?us-ascii?Q?iNcuF8obbb8n+UA31yY6jbIhfAgKQA6lgPCyXS5a2EAgFuok5XTJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debf58ef-4fdd-48fc-913e-08de6fe2b1fc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:17.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghc1Dl+vObre1mqcUKUWiQ21UxCteP23S+waPqULlnOehbmgKXKO6RkckNVrNge7nm19F8n0TMBb0X4fomrxrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16957-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 94070162C0F
X-Rspamd-Action: no action

The function opencodes cpumask_print_to_pagebuf() with more generic
bitmap_print_to_pagebuf(). Switch to using the proper API.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/thermal/intel/intel_powerclamp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 9a4cec000910..ccf380da12f2 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -200,8 +200,7 @@ static int cpumask_get(char *buf, const struct kernel_param *kp)
 	if (!cpumask_available(idle_injection_cpu_mask))
 		return -ENODEV;
 
-	return bitmap_print_to_pagebuf(false, buf, cpumask_bits(idle_injection_cpu_mask),
-				       nr_cpumask_bits);
+	return cpumap_print_to_pagebuf(false, buf, idle_injection_cpu_mask);
 }
 
 static const struct kernel_param_ops cpumask_ops = {
-- 
2.43.0



Return-Path: <linuxppc-dev+bounces-17631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HCJAxpAp2kNgAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:10:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B111F6A33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:10:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQRjD0v4Dz3cDg;
	Wed, 04 Mar 2026 07:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772568576;
	cv=pass; b=ZIxbmzKhFimaA/ZDhKeuQF9yB1pe9OLJpLqa31bHk0dhAfJvVg8kYs9djDK6lcb9ZhXqWvY6m5hn3aeJolTLe8eir7pNMQSQ5tjbF1SULyELVISc8ykJn/ggUPEw3iLgji34jR3kWU9q8BGQec7XvjzHHzC9Zqe/JX0eJkxD+UAqLLTkOvwGmcltRwv2GDRpx8fsSX7ZvPRsTGO13EKCXcXP4Ztrz94naoTc6amoQnBF57FYwS2TfXFkvi0ThAcXo0OOx652mdQ3mKLW+WmExPQI+yyVpXzoT6HX3SxT/jA1k2yy2W97yF6oZUCzNQHJrYRVcaAyNEVWFAWpjyvWoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772568576; c=relaxed/relaxed;
	bh=idd3KjhswRGF+dnxDbOjmWA68SsQTWDdpAbv8H6q+3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d5hqVh5RqMwXTJJ3lmJiyv1ysI+VMxiVWEtC7p2VyDSoPGr8ngSYoye0Kn3Ww1N2Ej8JKjV+FdQvaTMKrbi0sk0gEH/jmPTVAdyEn6U1brdUwMufgJdFJWmk30eTjBUNICJ9QxBK+utFl4LWLuhkvwAEi79mxNlmdUoijAS7LsMfgxbgA1wCM6ONGmwPtYhoivaXFYiyrJbCfb7IoYLSnwspPrH0pPdiJXTpBWtiiGV35N2Sspj+LuEzyxD0hobkcqkj4ZVLi3VZg1/kG+azfmAU62CdAk5RYdG3438LfSSgRaPSA1x5DR9V5V/bBt7Apcbm7dANOwSJ25EqpOUlyg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jiKbfEFa; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jiKbfEFa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQRjC3ZRtz3cCJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:09:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2yz/+VfN2cxhnCVLWrZfb5U94+zY5G6Txu3hRyOZ56oti/5sSEI+Y/PUnbvJgvyxDAG9FxR3MeH/EMhmlNYGw27n43rWyg22E6FWBb0e/p/e5KxtQ6ZsFaXTDuF1WekqDNfeMwdvj8qSU0w0S9Fu4Ef1HXDjfhf64rG1/1qFNVn0nYODIxB+CIh5+EWrcqZZvGY2uOoD8MkGa+yChrbd6dha7oUP953a6JJXtAHEnE+/h4Rn/EpYbahrOB1p+UBBAd0DxCLYarlX3DJNu+q8ROzczP7kSpgkafc7NxRZXUMPUNexG/TZXq+Hldcsoy5EeIbDnPHXrGnRQ/7bK8ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idd3KjhswRGF+dnxDbOjmWA68SsQTWDdpAbv8H6q+3g=;
 b=Gvpz+Zt8d27thzL6XWHWafZLvBKA3DxTZNOYm4fmu4gEf1T5JXJeNxJn1S/fmNXNuiuBhUfkbZVJ7p5DMp6m2ncdCWrdArSWMpXxV5Ghe+C7MUYoPeFPG9QB/UVR8NlCnyVLFHd2xdA1dnmRFIHrrVD1RlBnZNQYEzRloDkbs8fgdZz0qi385mPPqedRwhK3WHZ/fi+BWOSxBPOmFNDwhAUV1DQ4Lg9HGFly9igg08Ez/R0P/6ush3uj4Ajz/oap+MBnylJf83xLAqn/ZjePBusVZ0qYcOVGb1kY8uPg3ytQlHNue2i1g1bfT+AWyUPdVXzxFfedUF6d2McaPLfnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idd3KjhswRGF+dnxDbOjmWA68SsQTWDdpAbv8H6q+3g=;
 b=jiKbfEFaEJ2S0q1mg2ZOM+ewgbCDh7QQGvN5urRfrkF11ZCZ4geWdkhCCoqtLabjVc3VPUgADlrVYJ1jB36cDfEwbXaZ4SePC8oDKCdQNX8flIoJrdtRpaXPSQyweeirPKcXUeO0tLFHUspquP3oy4B8w3Y75uPc/w4xt1UDDkuvNyuzfw6rDgZ0H3a0VPWl+xBCrDR52mrI3TIgXCIzhNJnfi5pN5em7WHV584vsGRQIj8CtfIZ0jniRmU5HBVK6+7VfnEOqnjpKDuPD26dbFQWUucPhCxUrHwHekn2NcNp/09T+f3KIorx/t6ClPgIQTtmRKPG4NiWFcByzwhYSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 20:08:56 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:08:55 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 5/5] fpga: m10bmc-sec: switch show_canceled_csk() to using sysfs_emit()
Date: Tue,  3 Mar 2026 15:08:41 -0500
Message-ID: <20260303200842.124996-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303200842.124996-1-ynorov@nvidia.com>
References: <20260303200842.124996-1-ynorov@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:408:f4::34) To PH0PR12MB8800.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 858e782d-c9f7-43eb-2f0f-08de7960b2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	hsXzQZZIAJoM0aaHOBprBxdvjPgjMXXAf4OVxDiKqHThIpcPlutbUZzqt4I85NrSwmYNtrpsZEUobgQgztWbteyR1tUiTE40CXvGsS/C5C+ifJu/RZYSUciQOntw4bBnMrSSk/csxx1c3LJ83rEmAJI5HHlDEIBpf+ARHOKxFEdtR4GqZ2nsZuMPbN1J5nMH6Eip7+NfzyenElqtmHzYyAx5I5h9c0dcK/4tUd/6TFXTQXY/OlLbz1RTRsGAlbnQMBVC3sBVcLzDIs+65nStWwnQ4d0xRxZx8DemPk4o118tj4xpIQeOPQCZuyYCT3gD7Q1yxHS9CPlKOWP2g9bwzwIaDJv8ml9WUnN/sbwLe5hhyDFXq/WHSmkBiALIq4pL5iwLZGSEmJc8F55ZHbWT/3DdZqWvyXmysALWD1+6MZBzO/KSuM1Y6rQwsErzKcULVilHHcV6t+r5BrssCZ212PTAyl9ZBAeuKJ8aR284EDY+xOB2vmrp3AE2UQXCJsSiKqNQdOIfnbA3KsKkmpqqtSjpOQ3hlVI2SRyxrRPo3wihBZPAkfLq980v8hfQfYSt8ab1a+AQfeCdFB4+QtEVWSf4qAP6el7gYWprq5P2MxBZY/+Fz51Y+aMY6CDsb+9JkusTk/x4M0myujIKQMJdcDPbS9nK56/FrOfh66B4CbFxG2k6jNcoIefvvjqUKwsDuHgZ+FZ89ziFHRu+mH8Xv7UOa5gDRKQ05cO/wkcfI8A+dZ/o3ZrT50IuE7WITLqgH6DOuiQJBg7V8RSkd8s6oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFEQlhHMVVvV1FtRlBOWGdLbGpnb0c5UHp1OUs4QjZtSEFzanNhbDlFVm9S?=
 =?utf-8?B?dW14bnMzU05KckZGVW82eExHcUNWSExzS1RCMEVkWHB5SmJWU1M2LzNMbWQv?=
 =?utf-8?B?UUNzck9aNWoxb21WUldLdm5CbGhRUkdOc3BMMXV1YTdseTJqL1AwYkpkWitC?=
 =?utf-8?B?WUxQcnJUZDBEWnZpdkJmdXVWTGh1cFV1a2tJN3FxaHpYc3Zha3NVemludnla?=
 =?utf-8?B?TCs1TnFRNFRYNUJma2cxZWp0NlU5L1ZnTFVSRFNCTGRBTGtKRHBGYmNPQ2NT?=
 =?utf-8?B?cjl0eGE0Q0RRcVBtSFpPZnJwb0ZXandBdS9MQzVna1BVZlBXQ1dQTHR6dXNX?=
 =?utf-8?B?K1FaWnRmOW5FYk1UMC9sclkwSFJLQzlEVk1LNjZQbUFhWXhRdGI1VlQwMUQw?=
 =?utf-8?B?THB5a3YrRDFXaE1nS3Z1QkdORkZ3L24yK1FkVVNiRStqNWlBcy91ckcxM1g4?=
 =?utf-8?B?eXJrNjR4UkJFdFRnNVBnYnRkUjdJbzJpUTdtdlJJcWc1dEwvNTJDc0dpTk5W?=
 =?utf-8?B?Qk5ucHBIaFgrbGZjSCtLNWVkVjhNRTB1a2tFaFE3anVQWFZZQ29GNTY0dEpK?=
 =?utf-8?B?UUxjaVdkSm95OVBLTSs2alVpSGJ2WEdydHl3Zk5MekpkTGlPdjRRTG9VSHZX?=
 =?utf-8?B?UDQvUXlLR2QvajhJWWVabnB6c0lQdnlEUWZhaEpwQlFEdWRhYmEvQnU2cGZy?=
 =?utf-8?B?RlhIeGlIaUpvMnByQjVZRUxDR0RFZUNpUk9kNWdmOXRLZkxHZTVYTlhFd3dN?=
 =?utf-8?B?MXN2WVdHVnY2MDh4TmEyL2gvd3RuSTR5Y3pCNDRPb1pjK1k3dmsrQjRsYjh2?=
 =?utf-8?B?WDM1R3NGUVNwQ0VNKysxTmxsbDhEWHJ6UGhTZHF0eW1zWjFOck5LZXVnU1lm?=
 =?utf-8?B?b3dLb0RPcHhaZjhBQngyTG4wMFpXY1pzVWNyRDNrcW9yRW9taFVMV2o5MlND?=
 =?utf-8?B?ZkVTdGJSc1ZrQ3NGZjdET1FpL1hxblRFTlR5aHJER2RoOWVQNWYxQzVDNEVF?=
 =?utf-8?B?dlNPVXI1WlBEN2RQeEJkUTRXeHlRekRldW15MUFodEcrMUR3NDQ5YjF0QXZ3?=
 =?utf-8?B?aENqREVFMFcyb1NjTnN0QVR5aGFrZlQra0FNZU9QNmVqZHlyME5PKzZYOERz?=
 =?utf-8?B?ZEU5cmtUTDV0a1hNZEtIdlQrK2JMY2VxMDg5UzNTKzZRQUM1QW9NanZZRUFV?=
 =?utf-8?B?b2s2YTNYVEcxYW1sa2Y1NmU3a0xUKzNqVVlzSG1TNkRuRWE0TjVKc3RwQ3lX?=
 =?utf-8?B?REJxaUNSRDlFWXU5RDlLc0hNS1NlSlMxM2Jhb2ovcFBBRGtNNkxyK3hvY3FO?=
 =?utf-8?B?cHRUMEU4TTBhSjJqaEhSZE8yUzVtR3BMOURQL2hlQ0l4UGRNaVQwL1VTOFVv?=
 =?utf-8?B?QlJwS0FFWTRVOEgzdmZOd3d2OS9rUmJEWE9CbmtSVXVlQ0VTeEoxMGNjL2VH?=
 =?utf-8?B?K3Q1Zlg4UUNFNjl3YnZUZm5XdTZCbFQ1SWllK3N5dXZxT3dUSk5vc28xQ29O?=
 =?utf-8?B?ZjdBRnA4VFBLbEI3S2RkL3djSGxBVnZ3cmZLZkRhS0VZWGZNQWZETUF6NUNl?=
 =?utf-8?B?SWNnTERHcDlWaDlYelZwbWFIMGRMWnVWNlFyL1l0emhxY21EQXcrRVFmeHZP?=
 =?utf-8?B?NUE2RmxZM3YrVWQxSFNpZHJ3ajc2RVMrczdPdDhZamZFMUJKRTNyS080TDdj?=
 =?utf-8?B?WjkyaGJ5ZlZBOTdTOUtYQms3eFlSUmdob0xDSVViUmROY0c4VFRvSnhJRk40?=
 =?utf-8?B?WlFUclJvc2JRMjVoME1oWjVDWit4ckZIOEJLSmQxQ1Y4L1VSSmtvNmNJV1Zw?=
 =?utf-8?B?ZEVCYXVXSEYyWE5WR1RpMGhmWlRaaGlqUkgrOTY4cmRnbEdUS0FrNS8veUVp?=
 =?utf-8?B?UEZOQm1MbXJYbUJrVXRRVGVtNndyb2dvU3I0eXlhWVVtOGxSdlUzS0VUamFz?=
 =?utf-8?B?Qjk5RCtpNHBFUDdBMjhQTElMOTZvWHJ1VUhkTFFRbEp1M1VxNytHKy9CUEFJ?=
 =?utf-8?B?SDJXMVpzdW9mcGlNMXY3TWJDRXA3aXJxQ3lKRi83NHJCbThTbHZDdlhRdjlW?=
 =?utf-8?B?NWFZSitkd2l1bzVhSzhtS1NHTlhWeWRhVEw5dzVhYmk0YkhGaGpSZGFXVnIx?=
 =?utf-8?B?S0hkSFBLVENtVkIrYTZYOGhmU1RKSjRGMHFjZHcyUDgwMEErSnBmbU5ybUtW?=
 =?utf-8?B?ZThXQTdNc2FCS1dLay9YRmNDT0VkU1czNFhkTXZxbGljYlBVV1VHS0Vmc3lK?=
 =?utf-8?B?TVdvQlo1UC9Vd1VwOE1KTjdDTTkvcXNtejByaDRlTldOczJENHR6dlJrNncr?=
 =?utf-8?B?cG8wdTFVenJ0ek01YmFqbk5qMllVazJ5eG45WVFsRU4walVLVjhsZUppM3hY?=
 =?utf-8?Q?FUdLT30Q9wmpBbtD326G/277HT5v2Mihsuydg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858e782d-c9f7-43eb-2f0f-08de7960b2d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:08:55.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45ZRDZX3bdmB7NvpBqOaLvWjXqQp7KLFfxydMoVsBi4rjuABLo/bWRWr18C1xj4FgMRziDue0/gt5dhuQzfjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 25B111F6A33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:daniel.lezcano@kernel.org,m:mingo@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:russ.weight@linux.dev,m:sshegde@linux.ibm.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:linux@weissschuh.net,m:yilun.xu@intel.com,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:kuba@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,linux.intel.com,linaro.org,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.dev,redhat.com,weissschuh.net,intel.com,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17631-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux.dev:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

Switch show_canceled_csk() to use the proper sysfs_emit("%*pbl").

Reviewed-by: Russ Weight <russ.weight@linux.dev>
Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/fpga/intel-m10-bmc-sec-update.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
index 10f678b9ed36..ae364c6636eb 100644
--- a/drivers/fpga/intel-m10-bmc-sec-update.c
+++ b/drivers/fpga/intel-m10-bmc-sec-update.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/mfd/intel-m10-bmc.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -183,7 +184,7 @@ show_canceled_csk(struct device *dev, u32 addr, char *buf)
 
 	bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
 	bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
-	return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_LEN);
+	return sysfs_emit(buf, "%*pbl\n", CSK_BIT_LEN, csk_map);
 }
 
 #define DEVICE_ATTR_SEC_CSK_RO(_name)						\
-- 
2.43.0



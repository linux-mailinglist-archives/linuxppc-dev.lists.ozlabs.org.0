Return-Path: <linuxppc-dev+bounces-72-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FBF9510CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 01:58:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk7d420NZz2xy2;
	Wed, 14 Aug 2024 09:58:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=8955bbb9d8=xiaolei.wang@windriver.com; receiver=lists.ozlabs.org)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk7XY1Lw7z2xJy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 09:54:34 +1000 (AEST)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DMi1cC025085;
	Tue, 13 Aug 2024 16:54:14 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x7qfk6sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 16:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSCuNbe2SdhQkxkgjS9gwQL7EQJFCksrUAneEBXw2Iybfe/10r/0eAnjyZtDWeHUUcoZzlnxpypOKAK8CXywE4z343kWRPHLf5DEQWfCHFkPDrJaOh2VrfJoGmFbY14UPjKUzT+Kni3qbXJjKBAn88+q++bXOqELKfGg+CVglz+JuML7+7FBFaW8gYXKam2seZjglLzhDuIkeeeBp4INvSFwx8+/EWYaviBqWQ+iy6daX0/hTfzepFHIzj8pDX0frPIsJS87nnwoZ95hXtV0hr6/UupSyby+xVSiNNEayn15T2fnIxXLpTCnYJe58/bIQF8cGB8+Y5iW7tV9UMO4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/J89mY+bmkrVr06n7bvQLJWEu7y8Jrr5DDWltOunW8=;
 b=ExGDTuwiBwIQSMM5tqW2xjxIwAyKETDL26VcEiDVATen0jVa9bwSRo04zQ3IrMhz6OryFGe1AxuU1WuSqdLn7ijIp779DfBhCMTcHrF5u2QN+JOm9CQR0wEVZ38TD1XJw/oRSAD67YfQcWTx0TmSwXkTKB7yxOpMzosh/BMJ+4ucAsmtM0cULl/DMi4JW0+AsSE1K+zRCrF9i24p6tpFogBJfZnr2/EevzR7ptUzKY8u1QTVehuiD14wTFl4uOZtMldt7Q415GK1N826ifQVQcWQlad8oipm0ab2KdmYDe/62JlBkThGkkFhi3qzkofO9O37wEIxwqapr11E494xCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 23:54:07 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 23:54:07 +0000
From: "Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
To: "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "robh@kernel.org" <robh@kernel.org>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: fsl: qbman: Remove redundant warnings
Thread-Topic: [PATCH] soc: fsl: qbman: Remove redundant warnings
Thread-Index: AQHa5IIZazLqtJoHAUuX17YODzAP4bIl7syk
Date: Tue, 13 Aug 2024 23:54:07 +0000
Message-ID:
 <MW5PR11MB576470F6E5F541B4D5A7E69395862@MW5PR11MB5764.namprd11.prod.outlook.com>
References: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
In-Reply-To: <20240802021651.3854295-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5764:EE_|SA1PR11MB5946:EE_
x-ms-office365-filtering-correlation-id: d3ce5534-c365-4b18-283d-08dcbbf33855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?VHFCb3gxNlRHT3JLWlc1QmlHNjJIYWpJYmFLakxUcktodDkxYjFKcnFWYVk2?=
 =?gb2312?B?OWhRaS95RXp3TlJrbzVyNXVGOTJoY0ZHYkt6ekg4WUJtZFZTMlhja09TODVE?=
 =?gb2312?B?Y29hd0FKckpvdTBkVWlvcnlDb2NUblZzRW5MN2FXbjNjc0pNdmdBa1JyZ0Jo?=
 =?gb2312?B?V2VWQnpZSGh1STlpL0ZqZk01NzFSSlJwM0pJbFdUVzVBTHJsa0VNaHVpeHht?=
 =?gb2312?B?UkM4VE9JbTRMQTBlR2w1TjJFTitXd0JXdkJxWGRqNnRteG5RM2lSTFdIdmIw?=
 =?gb2312?B?ME4ySUhNSVd2eHdsWXErSnZDNXBPcTZoV3ZlSW9KeldrQkcvYWlaTTNUOG1t?=
 =?gb2312?B?RHpqd3VITmVQSEhmMW14RHAzWDYwL0JTU2trLzFjcjFuUDUzMUJRNU5HaG92?=
 =?gb2312?B?VlhlaWFjbENja3lPTzc4RHNPZzFGa3NhOWtPUjFrM0dOOXRJV3piVEdlNDNs?=
 =?gb2312?B?MTBOMkN4TmNnK29BQTJrUkpZOUoraDk0bWF3aUdmbXNkZVJScU1MaUxKNkF4?=
 =?gb2312?B?QlBXTGNab2ovK2dnamdyTXp2N1FqNzZNc2E0WWpzeWFFbnRKMEY3bld5L1c1?=
 =?gb2312?B?RkVWc0JqQjRiVEZMRktrbXZCVWN2bUFqRmg4U3R4MXY3Sktqam4wWnl1bnNw?=
 =?gb2312?B?SDFDYmc4dkNubjlzd0lDZEZZZk1DTEJTUzh3cVRZYjdKcHdqSTNaelZNUExh?=
 =?gb2312?B?ekwxeTV3L3dGMGMrVHdpYjdibWJiYXE4M0FIQzdzT0VkRml5emFQZlBWdUxj?=
 =?gb2312?B?L0pmQm5jUGZDNk9EM2RaNU9XRis1YzdiMFNFRnhJNDVONnhTNnBiZFFVM2JD?=
 =?gb2312?B?U0xHRzY4N09IZTZtd0ZESUM0cnYzaWo3ZVoydE9Qd0pxMlhDZ0l5aUF6Z28x?=
 =?gb2312?B?cjFOQk0rSEpUY2JJSXVrZWR3QjNkZytTSGNoaW45OXdIdXloakN6aVZTUEZL?=
 =?gb2312?B?cUNzcEFyOXhGM0ROZ09DSlQzMkVyNlhPWmZOYWFrZ05KbW1kWW9UR3hVTnZE?=
 =?gb2312?B?UXFqT3J5eW45TlZwN0lkZklOeUcxWE15Q0QzbGU2V05pWGZZRnBqMkRIOURj?=
 =?gb2312?B?SG5aMmk4MGw3STdqOUluZ2JqWW5lanJmYTJVenEvY3FDY2wrUkF4WHNlNDB2?=
 =?gb2312?B?SG1FQlJQNzNwN1hHcTdaSmZMbHAzM1daUUhocFFYVlhpZFRBaW8vc2RjQkw0?=
 =?gb2312?B?aEsvVHJUY1g2U3RtUDJod1lWRnJ0bWNjeVhTSjcwNWZzQ1VMOWpSb04wbWdI?=
 =?gb2312?B?UFQzVDZiQmxpc3ZzL2d3WGs3MmRtdlE5V2FnQlhFQVV4d0Zpazd2U0Zvbjc5?=
 =?gb2312?B?MHpaWURURjZkdnpWZjkxZ21sY3hlMFgveDNoUk9Ia2h3N01uSncrNzdVOHE3?=
 =?gb2312?B?bVp6N0luQ3k0Z0FBM2p3bnEza09GeFQ4QWlteGwxOFp1N3h3RlJ6VkVVWWE0?=
 =?gb2312?B?M3IxemFmT01ZMmtVWS8rbEVGVUJFWmRPS0Q4ZFBydjV1ZVEyc2RBZ00rUVQ5?=
 =?gb2312?B?K202VFpVTWlzN08wVk1zRkhwOE14QyszN1h5MDVHL2MxNEI5RHRPS2J2SG1P?=
 =?gb2312?B?MGtVWjdCUWl0QitLVlA3M0UzTmUvWm9jeml6V082WEdDckdCT3hZUXBzaUho?=
 =?gb2312?B?V1pBNFJyaTBtTFh6V293eUxBNHgvQzBid0d4WXQxalc1RmVpT1NmbnBUREdn?=
 =?gb2312?B?elZVdzg1QkozNkdXTmI2bFhpdHo1Nm5sbzUxRHV1YmtLTTJlaitlcUpoSmpk?=
 =?gb2312?B?S2didXhkUy9zWGc3dlJFMUVYTEtHRTdwNW8vL1RYamQxK1VKVExKcm12VnZp?=
 =?gb2312?B?UXBuK1IvMW00b1RNY2tJS1g3M2N4L2MwSWJQd2poWUs2NWJieVBEcDUrV0M4?=
 =?gb2312?B?bDQwU2loQWltRXdKa25sU2NRV2xOWkk5c2VNL01pTVZTSXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Mks2Qk1JdWQ3STdLWDZVUmY2cWJ4OFN2bGdRMnA0WUFqTWNQMDFCV1FRNEZj?=
 =?gb2312?B?VUNCeTJhVWNLbWw1aWkvaHM5dlE1R1dmUUdrbHNiQjNienBtZHFFZkRPdFJ4?=
 =?gb2312?B?QUoyZkdEUjEzMnVzNzBxL0VZNVVJdzJkQ1lpK1o0eDJzZDRMdTl2Z0xGRWpr?=
 =?gb2312?B?MGxSNzdmTDNseTIvSkZUTkpZTjllWSs0cnNDczB0ZCs5cUt4NGFkbUZCK0Na?=
 =?gb2312?B?bXVHc08vOVhMclh1L0xPQWMxcTcwM2NzclRSTU5jRnNyZnpIeHlGbDFQQUxM?=
 =?gb2312?B?VWVzTThqWlc3dDg0SHl5bVJjTDJIclpZQzNNaU5BM2hVZ0tQdFFQRG9jekVB?=
 =?gb2312?B?TDAvbDlFdGM1amZ0eEJucWFadEFiVy91Qm13S1pxck9XclpZcUp3NXlNakdH?=
 =?gb2312?B?SkNFU0N2cks2Ky93T1l6UGN4YzZUQlhtT3pWOFMzZmJyc3hTdHBVMmw5SWxC?=
 =?gb2312?B?L1o2U254Vldmd3JLdXRZUGpWZVMzbGh1QjJORGtOSDloSkJNdCtQYnVHRFVP?=
 =?gb2312?B?ZzU5YVpyK25rUWZVc2lOdytac1lub3I2Q0V1NU1zd1pZNHFjWTJUNkVrVm1E?=
 =?gb2312?B?ZWhLYzlrUThsZFloN3hsa2NKZzRWNnhyam92YWxZVlZYU2tPSTZYdTdhTTB4?=
 =?gb2312?B?V293bTg5cVViVEhTZTJ0VHZ6cDFpVkswZkRjN2VUUVZKVnJIUU9MakNiMmtD?=
 =?gb2312?B?YlpFTjJHRGxiZUNVOFRpQTkySDEvb3FqUHoyL0FUc0w4M3R4WEJEdmtLSjlE?=
 =?gb2312?B?NDA5ZnN1aVE0YmcrQTRHZ0JiWTI5R0ZtSS94NmNENzRwRDZkV3RINGg4MVZO?=
 =?gb2312?B?NlZreFlHU1JzeE80RlhDa09RbUI5RGNsdUJ4dHBKNGZLTXBIeFlxL1pPUmVh?=
 =?gb2312?B?U2ZKRG9GR1BkbVFpWmdQVFgwM0tFVk9EU3o0UzQ1NmRKaDJHUVJGbTdueFRB?=
 =?gb2312?B?YTM5c2NrbzJGN2k2cDdLZGdUU2RvcWd2S29XK1lsYVNpTWtnUjlKVDJrTTRN?=
 =?gb2312?B?OUpDRGljQnpiUzhKTEIvV09GZThEOWlSbFg3VHBRdHpzY0Uwd1JsSGlPVXl5?=
 =?gb2312?B?cVVKQkZtam9lc0xGSm1vTzQ5ZllpOXlHdDlVRC9wTG0wdW5KeTdZenJqME0y?=
 =?gb2312?B?cm8rSExkYXg0cjgwTDJJWUIxZGJBeWZEZEdiZGtPU0ZFRmE5SUpaeERzOW9y?=
 =?gb2312?B?elRZL2ZxaUZPQmFQYUxJQTJLWEZCQjZyVmJ2T1Q4VGVKcHhkS0lhdjN2aWRk?=
 =?gb2312?B?bjB4dU05VFRxNXUrR3p5MVdsNFpYcFp5NUs1TFlDZHBFZ3JPWk1uQ21XTE5V?=
 =?gb2312?B?MytYdmhTbDhHUXdadUtYbVVHZW1TQXIycmNCbVl4ZFhYVlhrNkZWdU1rU2Zn?=
 =?gb2312?B?UDlZQ2xhZWYrMGxrUGZxVTcyVFVLLzJzWkRCeDJFWHVrQ3RGUVJXcFJqTjJM?=
 =?gb2312?B?eXVmME9RNzdVWURjc2ZjL2VQdEZNRVIwMlh1dDdnd1RUY3dvenpyU0xwNlgy?=
 =?gb2312?B?NGthNXBwaVhTYjI4YVFBWmozNlVva2RyVktFQVBhQ0JvMEZzYWtlK25FUVlo?=
 =?gb2312?B?a2VpQ3VjaHRsRWhTNWxLRmN0NCtDc3N0YWxjbDc0cXE2WGprQzQ2aUFMTmw5?=
 =?gb2312?B?WEtSMmZMZ3RjMDd5dVFBZTh6b05GRU84Nk9jZHllY0tZdHlVUHFXdm1MMGNO?=
 =?gb2312?B?MHc3b09Ibmk1SW1ZWUJDMWdWa2FBMVBFNWdlblczakdhU0UxMlpFWDlncWtz?=
 =?gb2312?B?dkdoWnVmeUJiNGVYZjVxK2l0dmduU2c4VVdCYVRnMmdqQnJwWHRDV09WYjBZ?=
 =?gb2312?B?Q2ovOUpqL2kyTWdIMWhQYXBsVkt4UnNqU1lGQXR1UjFjY1MxdGRDazRBK0Z3?=
 =?gb2312?B?cllKOHNRYmxVQXVwUC9Sb2ZITWJTSlBWVG1oRjBpT3FqazZOOGEvVzBodlNU?=
 =?gb2312?B?SEtSWWh3bTFOV0pMUnc4cFVBZldsOS9nQlc3M1IzNW41RURjZGJrY1dKWllP?=
 =?gb2312?B?Syt3SzJqSllnNUlab2Q4TlBBK1dXc0tMT3Q4M21UMitubnowQ2oyMGhVQ1ZV?=
 =?gb2312?B?TU1WNUFyYk5IQVlkdU1ndHZsbTBSMFpFZWZPeVNyRm5xblhJOXhML1cyZ2pr?=
 =?gb2312?B?SFpvQW14OWQ1dFRLVGFFalZrMUdsaXBNTFlLYXFoMUtPeWs0U05haHhidWVM?=
 =?gb2312?Q?X+o5LhAR4nzZEGcUeb3D7Yo=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW5PR11MB576470F6E5F541B4D5A7E69395862MW5PR11MB5764namp_"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ce5534-c365-4b18-283d-08dcbbf33855
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 23:54:07.6224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2JBnrzyhJOFjgxY2BNQDQT3ttxHgooA4v9f15fX6rs5OHjpKMr1ip1XMVmKbBQ/ityMMO8Vn6pm09MCkjod+ibiZm7YCqTYSvEJW2LItw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-Proofpoint-GUID: OhHHn-NY_tyOYMpLbZRHImq-6bnqRIaO
X-Proofpoint-ORIG-GUID: OhHHn-NY_tyOYMpLbZRHImq-6bnqRIaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_13,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408130172

--_000_MW5PR11MB576470F6E5F541B4D5A7E69395862MW5PR11MB5764namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQpUaGFua3MNClhpYW9sZWkNCg0Ku/HIoSBPdXRsb29rIGZvciBpT1M8aHR0cHM6Ly9h
a2EubXMvbzB1a2VmPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzog
V2FuZywgWGlhb2xlaQ0Kt6LLzcqxvOQ6IEZyaWRheSwgQXVndXN0IDIsIDIwMjQgMTA6MTc6MTcg
QU0NCsrVvP7IyzogY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+OyByb2JoQGtlcm5lbC5vcmcgPHJvYmhAa2VybmVsLm9yZz4NCrOty806IGxp
bnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnIDxsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9y
Zz47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyA8bGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCtb3zOI6IFtQQVRDSF0gc29jOiBmc2w6IHFibWFu
OiBSZW1vdmUgcmVkdW5kYW50IHdhcm5pbmdzDQoNClJFU0VSVkVETUVNX09GX0RFQ0xBUkUgdXNh
Z2UgaGFzIGJlZW4gcmVtb3ZlZC4gRm9yDQpub24tcG9wd2VycGMgcGxhdGZvcm1zLCBzdWNoIGFz
IGxzMTA0MywgdGhpcyB3YXJuaW5nDQppcyByZWR1bmRhbnQuIGxzMTA0MyBpdHNlbGYgdXNlcyBz
aGFyZWQtZG1hLW1lbS4NCg0KRml4ZXM6IDNlNjIyNzNhYzYzYSAoInNvYzogZnNsOiBxYm1hbjog
UmVtb3ZlIFJFU0VSVkVETUVNX09GX0RFQ0xBUkUgdXNhZ2UiKQ0KU2lnbmVkLW9mZi1ieTogWGlh
b2xlaSBXYW5nIDx4aWFvbGVpLndhbmdAd2luZHJpdmVyLmNvbT4NCi0tLQ0KIGRyaXZlcnMvc29j
L2ZzbC9xYm1hbi9xbWFuX2Njc3IuYyB8IDIgLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX2Njc3IuYyBi
L2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX2Njc3IuYw0KaW5kZXggMzkyZTU0ZjE0ZGJlLi5h
YTUzNDhmNDkwMmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1hbl9jY3Ny
LmMNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX2Njc3IuYw0KQEAgLTc5MSw4ICs3
OTEsNiBAQCBzdGF0aWMgaW50IGZzbF9xbWFuX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQogICAgICAgICAgKiBGUUQgbWVtb3J5IE1VU1QgYmUgemVybydkIGJ5IHNvZnR3YXJl
DQogICAgICAgICAgKi8NCiAgICAgICAgIHplcm9fcHJpdl9tZW0oZnFkX2EsIGZxZF9zeik7DQot
I2Vsc2UNCi0gICAgICAgV0FSTigxLCAiVW5leHBlY3RlZCBhcmNoaXRlY3R1cmUgdXNpbmcgbm9u
IHNoYXJlZC1kbWEtbWVtIHJlc2VydmF0aW9ucyIpOw0KICNlbmRpZg0KICAgICAgICAgZGV2X2Ri
ZyhkZXYsICJBbGxvY2F0ZWQgRlFEIDB4JWxseCAweCV6eFxuIiwgZnFkX2EsIGZxZF9zeik7DQoN
Ci0tDQoyLjI1LjENCg0K

--_000_MW5PR11MB576470F6E5F541B4D5A7E69395862MW5PR11MB5764namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<div dir=3D"ltr">
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">ping</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Thanks</div>
<div dir=3D"ltr">Xiaolei<span id=3D"ms-outlook-ios-cursor"></span></div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div dir=3D"ltr"><br>
</div>
=BB=F1=C8=A1 <a href=3D"https://aka.ms/o0ukef">Outlook for iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Wang, X=
iaolei<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> Friday, August 2, 2024 10:17:17 AM<br>
<b>=CA=D5=BC=FE=C8=CB:</b> christophe.leroy@csgroup.eu &lt;christophe.leroy=
@csgroup.eu&gt;; robh@kernel.org &lt;robh@kernel.org&gt;<br>
<b>=B3=AD=CB=CD:</b> linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.o=
zlabs.org&gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@li=
sts.infradead.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.k=
ernel.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [PATCH] soc: fsl: qbman: Remove redundant warnings</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">RESERVEDMEM_OF_DECLARE usage has been removed. For=
<br>
non-popwerpc platforms, such as ls1043, this warning<br>
is redundant. ls1043 itself uses shared-dma-mem.<br>
<br>
Fixes: 3e62273ac63a (&quot;soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE u=
sage&quot;)<br>
Signed-off-by: Xiaolei Wang &lt;xiaolei.wang@windriver.com&gt;<br>
---<br>
&nbsp;drivers/soc/fsl/qbman/qman_ccsr.c | 2 --<br>
&nbsp;1 file changed, 2 deletions(-)<br>
<br>
diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman=
_ccsr.c<br>
index 392e54f14dbe..aa5348f4902f 100644<br>
--- a/drivers/soc/fsl/qbman/qman_ccsr.c<br>
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c<br>
@@ -791,8 +791,6 @@ static int fsl_qman_probe(struct platform_device *pdev)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * FQD memory MUST be=
 zero'd by software<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zero_priv_mem(fqd_a, fqd_s=
z);<br>
-#else<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN(1, &quot;Unexpected architecture=
 using non shared-dma-mem reservations&quot;);<br>
&nbsp;#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(dev, &quot;Allocat=
ed FQD 0x%llx 0x%zx\n&quot;, fqd_a, fqd_sz);<br>
&nbsp;<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW5PR11MB576470F6E5F541B4D5A7E69395862MW5PR11MB5764namp_--


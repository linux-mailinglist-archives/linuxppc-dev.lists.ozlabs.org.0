Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797D92F889
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 11:57:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jsnqhSA3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL6TR5FWrz3fvq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jsnqhSA3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL6Sh0964z3fNd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 19:56:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720778213; x=1752314213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g31dHeMcIYnb7/8nJCuTOOgxuCyTberdv9OLsqdPn0k=;
  b=jsnqhSA3ve12ZgbCks0LtgqSz4irLf4fE15ba3/gIikixyRTsE2ylPNS
   tYpxnVfyRMUQjIUl4L8qwHf+ti+ZgIdy7C78KFWa8tUrHhacu2kY98k47
   y+snssivDl16te0Tkk45wxl+Nf03CIk3B6EwZndeUdOhXJWVA9XqDm/ZD
   UgOQBwri8lT9E412roOOooheIbAJJ61D0r/C8SXoY+yE1uh2LyBRCSl74
   +E/T4AsMXnB4WM5IzS2+hKs6OwWxDhHkcUZhLRICKevqem5GT17HPFfJT
   cyhIq0R61EqQ2cPPb9TEaHAf0HXFbJfqwyLiL/84QcP/jFsngu4oX9AQZ
   g==;
X-CSE-ConnectionGUID: DF2k3XH8TW+VR+JShyXdQw==
X-CSE-MsgGUID: 8cy5qxV8RiOrG117o9q+WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17921505"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="17921505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 02:56:46 -0700
X-CSE-ConnectionGUID: cJ5ee0wWRJeWAiLHXpLZxw==
X-CSE-MsgGUID: +NZzCbrVStiAbyVRD+eeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48963957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jul 2024 02:56:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:56:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 02:56:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 02:56:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 02:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZtjZ6kfJKQJlDsrmCa7GE6o++GyUbijlHoaZm0XSQRkoQlqAcFfLToSaSMMZluYuKJXdmzDO4NRoW3FIuCCLnPdV+KsPhTPsyZjqJoCiDjUVGMbxQDLy1mo7rMwriTxiXsIwgDkCdNBaWrMIBDccqrxyiwb5c1d9T0ux6XLWeVAJ5Hgicru1j4lfM5V4xg9Nkq3UT5ZqIbrRmsi8UO1a3zLr71smSvOyDvcyZjY0ezcOFQpOqzDKknzAH+X6uJSKzQ1ZfbL9oG9x0wcog6uRM45l2T94V3pUe1uhDYiHGBRYSZ0ii3a/T3okHNVR/91BLsGGXYhBoHVFbBqa7foJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO1BrZOsyaZacw3gkhsgXRe939CvdqL6KFUJxsplhy8=;
 b=Lk+pdgJ+5HVtp8wOLj1s/Xu1U3o19CvYgFkh38o/igSQmiM3lbfLUq+z0nZayofoygAyhUPlRiK/eOS7ALsIL2pSMd6D7H6t9PILLIe7lUMVLjfZnH/LDHp9KyFOkUm1XE1U4apIRaV4it5j90ZAUpl60qQnrdn1VSeqeeb+4kXaxJD3gH0x167mlWwa1JCZTByaM5PA0hX7dm7c0lmStch9W1Nm8ikk6/5XxeWljqe1iboT6fOVqSqWZAdhCz+uFJm6Td4QJHVObGR1cYp43QKWIO8XOUJyy9qU7cwkvxktvfQUKDQJpUcF9ihivn74/bXo5XROgPwk19fvx1S6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:56:37 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:56:37 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>
Subject: RE: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Thread-Topic: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Thread-Index: AQHawr41SN+Mhr/ECEeuzsossoYQIbHy+4Gw
Date: Fri, 12 Jul 2024 09:56:36 +0000
Message-ID: <SJ0PR11MB67441DAC71325558C8881EEF92A62@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240620025857.206647-1-zhenzhong.duan@intel.com>
In-Reply-To: <20240620025857.206647-1-zhenzhong.duan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|PH0PR11MB5206:EE_
x-ms-office365-filtering-correlation-id: 2f3e8ba6-6cdd-461b-1649-08dca258eb60
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0HjW5Oe7PBuvKUoMdO4cNumnc01kwxgugvnV8wZJ9mGuv3QEV3Sc1v8Etbl7?=
 =?us-ascii?Q?NUlUiPx8jhPUXOJHt0Nz+FRaCpKWRc2pItWbqB9KGvjESmYKMqSITm7gbjKC?=
 =?us-ascii?Q?3EiuTPtf5NhKO63sKOCLqYNy8JEIsZV5dx1eslhMxyy7L3AEqTNjty/HACso?=
 =?us-ascii?Q?Vuivx3oihLhhZk4Q1SgvghQSoNcu9d35oAjarre1OXXsrpahwQy2mJi8Qwfl?=
 =?us-ascii?Q?a+PBvlPeMs47QPPvCoN+Y4StvzerT+Etc4DBf5S5Jv1XWKZyiZHhOxAYMZuw?=
 =?us-ascii?Q?xETpwEOgcB0KjG6H8jgZriL8Wih0rwGxjP5/CZWwrMW2EaWx+pJjPeDSQcru?=
 =?us-ascii?Q?K8thh4UVEfTWL0CMLUIL7DomLKMMeodIUXwJ9YgIS2l9+uoPlnIRJRzayCHJ?=
 =?us-ascii?Q?+sbbfTswLj6pgfTWR+iHrg1pSq40mbiynHDVHg6otLDKhHnhx51C7Fm3Rt80?=
 =?us-ascii?Q?SCXWEhPniLtT46iRXWwsADI/DXTXTUPDuFxO0wzZ1yy1TnQvf7dHlezAiLPB?=
 =?us-ascii?Q?7gSjJMOx3xKZQxTQIWpFNYtF6KxqmlnL3PUJTfR5H682sLnkR6MReiPrACb3?=
 =?us-ascii?Q?Ei73f0Lf/dU1gpVOl+pi4VqkHfKstQCeTHtkrLj9GiVoLQ1eDVFdoedi+Mnx?=
 =?us-ascii?Q?HXRziofUpbdX29uS2FE4GRnQIOxwKtuS6yHHMhaAzreZKOApcKtKu7v+j74S?=
 =?us-ascii?Q?0DQxfpQdKKlpjZoG++1361o+yyY5juQw4z2JTZi4tgBtmIUVLHQR+MIvNL9J?=
 =?us-ascii?Q?Q9XbH1gRtUICd3jAilaVTaAdTne8I94Vt6A0QgiyTAada8QMiUap78R+G81t?=
 =?us-ascii?Q?rgQvlyfXJ0uT9qO5tOl0M/d8L3029xHbqChEANU3h8fuYHtazxkBE9X/Eay8?=
 =?us-ascii?Q?1UfRVRcHoCETGBrvNEwqpJjKkJvond3Jpfs61MmY0StVY+RimQqtxOwX7Utr?=
 =?us-ascii?Q?hUIABscQ8r7eajm1u5cce+Pf5f8gIy8q9rFoOEcyXdwfmH6K4D7eQWpJsQEx?=
 =?us-ascii?Q?yZOAEfiS6nHm/qP9UjgmkcptmoqaSoh4qacnBLfYh/gEpOsw0JvYnC1ZViEh?=
 =?us-ascii?Q?XQl5SMLs6KRnicLUWtxk7e9P0FXpc9fCiSvrmUC5BPCzSB5vE4CTVgMDfiNE?=
 =?us-ascii?Q?l6oPv8iTzOQ+Yfs+RfsVggdTRwE6YE8006ghCiX3xk3nN+CWZ4nPLy2+YiOD?=
 =?us-ascii?Q?J67Z4QZEYrcndNtunFObj+HP7jNkBY33lMjfRg9NTvHi65w26QXmZHo7h3fw?=
 =?us-ascii?Q?MS8gRlQZvD3lmab2o0BrTUp2Ic6muazxGsTqqewJV03tV6z4XICs3JdbX0yA?=
 =?us-ascii?Q?1NBzI4Ae+nBVN6M75QV4x4/BSfGXl0YiPuUojvK/PdjCN52NRIw5LLgdWZUc?=
 =?us-ascii?Q?NrWA2Yg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QY6e1qlq0LmHyZPX6T/bmCDoiMgKJ2QSTz9L3ZSMuWkh7/OJe722FHowyi33?=
 =?us-ascii?Q?FUmxwhFiki8DTYkhIFVw3sq+/HR+MIbM9IWPJzjM+/I4lyZiOMU/cNyQhny1?=
 =?us-ascii?Q?lrP8zWnFox6dQatJKcF5HswDiWOcGSf1hjZzoG1JUFu+ZLqad/tHTHTyR1jB?=
 =?us-ascii?Q?tNjz6GVLUlZ4QpllLDewbqE/m31kchcriheMMBKLUq8MphYOnqkHHMXsq/VW?=
 =?us-ascii?Q?1uMNgw8PYhYFeMRC1FBhIoRCsciF9gKPQeho2Hx3WrtTk6T8e4R3K0XZClHL?=
 =?us-ascii?Q?H+UvWZAoS9eU86yx12oJkF3e/e/lWYcByaguvk8z8LBAroj8tiOSXpyIZeEd?=
 =?us-ascii?Q?mSMlInEwbqDKJwZQaYk0AVyCcQPTFFylhlFs2nGKyR0aezHLL3e9jEMMcYMO?=
 =?us-ascii?Q?XPrCmCLr71dMK4BxkehjedyviutHKaeqe/1Ga/JL2E5rD9qC7Jp+uYIkM+GX?=
 =?us-ascii?Q?puiTCzUoieC7P56o4VjMKU25uyKcs1EU7xHWEt4CQpgthi/oAjGDGpTkMQP/?=
 =?us-ascii?Q?xDOo6db3La9IlNV3EQ3z2xQ37OGxGuoZwiG0UZN9mFQZ+JbQslWe3Z83h0qF?=
 =?us-ascii?Q?VtCA1OSE8foljtJRR3zLs7woM/Ltfd+qvTnDK+ptB1dUfB+Xs+sO2vIA4d7M?=
 =?us-ascii?Q?0WX6T7KdqQpkILS/FWfVoTOueN6hw3+GRdfizhYxu6wIHi5YfNespSg3zv5K?=
 =?us-ascii?Q?ndFNY5mItP1cJkH4aHtiXoiuwoL1GG0RfwzSvr74IpmHELVoeQG5RkNFtq4V?=
 =?us-ascii?Q?ek6+UbdvJ9LfDsSDtGhLjHM62Ods2Gw8UwAnikC4q292TLRTst5cb0k9V4P4?=
 =?us-ascii?Q?BVYUbw6tLmrbD0idBw+U+gdbYCetupOOBrQ5gVeTzEL4y+5s5vVW5Gb7AY2q?=
 =?us-ascii?Q?mXvc0ZA/NcuVvNgj5sZqbYaZR9mQKf9fgJNumaHJw6GBvdXOXat/ncQm7LMu?=
 =?us-ascii?Q?Pd17tMWgGHvABfhAXx0XF3h9mqJklSPXqJnySjJsFZQMI+C0IiesHYf+Avl0?=
 =?us-ascii?Q?enwAltVrlKE1xKF447pf+8GX1yJigwih3Wj06CZeetFp8i9XID6F4/KyOQIY?=
 =?us-ascii?Q?YIKkvPOUqO6dOtJhimOr/KfUGOsICVs4d+LNYQ0RxhmOvpctY3gGpBSw4t9a?=
 =?us-ascii?Q?6gTT+4jMlliFSD/YQ6VIv2tX3SgE/Wm93VOPWtbE3mOcXQXIJ/EmY1gZuj5J?=
 =?us-ascii?Q?JjkmDy3j1F71ZbJQ7h2gnDGoj2xM1naa/u6vDmOyLj0ALkJA+0ncLrNj2z+p?=
 =?us-ascii?Q?XFmMYJpN6PsfSL4IeCkEQACVxzMgKRxOzTNO1OsA6DjJZs17RIs3uXS6KKoz?=
 =?us-ascii?Q?HW+YCKe2a9d9rL5P6T+UdAFDWvt/LVB15cB4GF8zdQSa/DCVWzVqyJKvWRjl?=
 =?us-ascii?Q?7shUcHNM1dhtlQ8dkhrE4e26wjnnAdFRxp+fmdj/sSPUsogChkFv5jA6FaRG?=
 =?us-ascii?Q?l0+7gu0pYOYi1JJ1jtGoZG9pUnVZiyIId9nyzk+LfSX4DROpMW62THTtd2I1?=
 =?us-ascii?Q?9rzmyTrKs5Yo4aX5fy0+U4HB33cuZIMj4F9mvBx5sQ50CVDq4ylr7ORNX+Ta?=
 =?us-ascii?Q?gnnaMDfCuCKM/XFwzwJwC5IyiH2xRPL91LejG5r6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3e8ba6-6cdd-461b-1649-08dca258eb60
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 09:56:36.8951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BanIRRhVlsg3gglK9WIBT8X0h0/hmUopTWgr+HBc76WPzA/La/fcWUNXJUcPvGiTtDzQYeXqkI5n7wnUng6jAutYt40BHJK3KPlyxsK71b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield, Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.com>, "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn,

Kindly ping, this series got Reviewed-by and no comments for a month.
Will you think about picking it or further improvements are needed.
Look forward to your suggestions.

Thanks
Zhenzhong

>-----Original Message-----
>From: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Subject: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
>
>Hi,
>
>This is a relay work of Qingshun's v2 [1], but changed to focus on ANFE
>processing as subject suggests and drops trace-event for now. I think it's
>a bit heavy to do extra IOes to get PCIe registers only for trace purpose
>and not see it a community request for now.
>
>According to PCIe Base Specification Revision 6.1, Sections 6.2.3.2.4 and
>6.2.4.3, certain uncorrectable errors will signal ERR_COR instead of
>ERR_NONFATAL, logged as Advisory Non-Fatal Error(ANFE), and set bits in
>both Correctable Error(CE) Status register and Uncorrectable Error(UE)
>Status register. Currently, when handling AER events the kernel will only
>look at CE status or UE status, but never both. In the ANFE case, bits set
>in the UE status register will not be reported and cleared until the next
>FE/NFE arrives.
>
>For instance, previously, when the kernel receives an ANFE with Poisoned
>TLP in OS native AER mode, only the status of CE will be reported and
>cleared:
>
>  AER: Correctable error message received from 0000:b7:02.0
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>    device [8086:0db0] error status/mask=3D00002000/00000000
>     [13] NonFatalErr
>
>If the kernel receives a Malformed TLP after that, two UEs will be
>reported, which is unexpected. The Malformed TLP Header is lost since
>the previous ANFE gated the TLP header logs:
>
>  PCIe Bus Error: severity=3D"Uncorrectable (Fatal), type=3DTransaction La=
yer,
>(Receiver ID)
>    device [8086:0db0] error status/mask=3D00041000/00180020
>     [12] TLP                    (First)
>     [18] MalfTLP
>
>To handle this case properly, calculate potential ANFE related status bits
>and save in aer_err_info. Use this information to determine the status bit=
s
>that need to be cleared.
>
>Now, for the previous scenario, both CE status and related UE status will
>be reported and cleared after ANFE:
>
>  AER: Correctable error message received from 0000:b7:02.0
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>    device [8086:0db0] error status/mask=3D00002000/00000000
>     [13] NonFatalErr
>    Uncorrectable errors that may cause Advisory Non-Fatal:
>     [12] TLP
>
>Note:
>checkpatch.pl will produce following warnings on PATCH1&2:
>
>WARNING: 'UE' may be misspelled - perhaps 'USE'?
>#22:
>uncorrectable error(UE) status should be cleared. However, there is no
>
>...similar warnings omitted...
>
>This is a false-positive, so not fixed.
>
>WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit
>description?)
>#10:
>  PCIe Bus Error: severity=3DCorrectable, type=3DTransaction Layer, (Recei=
ver ID)
>
>...similar warnings omitted...
>
>For readability reasons, these warnings are not fixed.
>
>
>
>[1] https://lore.kernel.org/linux-pci/20240125062802.50819-1-
>qingshun.wang@linux.intel.com
>
>Thanks
>Qingshun, Zhenzhong
>
>Changelog:
>v5:
> - squash patch 1 and 3 (Kuppuswamy)
> - add comment about avoiding race and fix typo error (Kuppuswamy)
> - collect Jonathan and Kuppuswamy's R-b
>
>v4:
>  - Fix a race in anfe_get_uc_status() (Jonathan)
>  - Add a comment to explain side effect of processing ANFE as NFE (Jonath=
an)
>  - Drop the check for PCI_EXP_DEVSTA_NFED
>
>v3:
>  - Split ANFE print and processing to two patches (Bjorn)
>  - Simplify ANFE handling, drop trace event
>  - Polish comments and patch description
>  - Add Tested-by
>
>v2:
>  - Reference to the latest PCIe Specification in both commit messages
>    and comments, as suggested by Bjorn Helgaas.
>  - Describe the reason for storing additional information in
>    aer_err_info in the commit message of PATCH 1, as suggested by Bjorn
>    Helgaas.
>  - Add more details of behavior changes in the commit message of PATCH
>    2, as suggested by Bjorn Helgaas.
>
>v4: https://lkml.org/lkml/2024/5/9/247
>v3: https://lore.kernel.org/lkml/20240417061407.1491361-1-
>zhenzhong.duan@intel.com
>v2: https://lore.kernel.org/linux-pci/20240125062802.50819-1-
>qingshun.wang@linux.intel.com
>v1: https://lore.kernel.org/linux-pci/20240111073227.31488-1-
>qingshun.wang@linux.intel.com
>
>
>Zhenzhong Duan (2):
>  PCI/AER: Clear UNCOR_STATUS bits that might be ANFE
>  PCI/AER: Print UNCOR_STATUS bits that might be ANFE
>
> drivers/pci/pci.h      |  1 +
> drivers/pci/pcie/aer.c | 79
>+++++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 79 insertions(+), 1 deletion(-)
>
>--
>2.34.1


Return-Path: <linuxppc-dev+bounces-8302-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F60AA9B1F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 19:56:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrq2s2b05z2ynh;
	Tue,  6 May 2025 03:56:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746467781;
	cv=pass; b=fI06AL+Hr5yLPBM/7qNTyYLlphdsCxbv/k1TNzRpB35jOAJMK5WhihfHnJnSge9S+eBgtVM4PIqStOkXTQhmuVlXCeQJZ8wajeoeLj2C2mX12uRRe+WODNGoXyX/dLaDZk1S/iKK9INLVJZ+X+PgQMtLHuqSTfShnAqmJqd1S+KEtgrqeqbozputtanZr8Xu1g7+RxRMExHwxmLL0CCZR8wBGAlOYMteSuyTn+BS5zsGxXxyqWP136/jKdnnnbLKez9k6RkX7Sp6KcWpk6TFkz9ZqXyM/MHW+q4pAYyWsGtp1xwQD2fbYcBbZiMhZE7+GYVaPTQRtJbUqREPCPWQJA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746467781; c=relaxed/relaxed;
	bh=9d579Rb5VkrePkFimzZef5iQ5IBhSJMMTtzUp3zbEkk=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=WKnOCdKzWZ6UYJKLUU1wwi+Slz1uq8Ec/3am91wyewoA2gXwBvkkfEIXKbwWP2vFx1kke2ZJS+j+WbpnQrRHXbqLRhJdkgWSRO0efgyoX//h15fqEUPzL/cUtLs2i3/bojmR5Cw4rAd7kA8b04XuLE1oBXfpSoXsmiZAs26xWXtUejkXEjyQHrHLgV+tICjzaKYpcYWuYEZuMvdWtSsK7VK35XjdOODIqzqmB+EnmMgYYDkgBQQYzHT3qjLBL8k1fwZh49/8+tZMy6uScdslTD7NXkm1NiE91gTNQkLzbgdoYJOFBW5TWyVzlclWxbD6yoRKaoyex6bHhuJRZujf/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=dZ4Rxnh2; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zTDttlNh; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=dZ4Rxnh2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zTDttlNh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrq2r2VNPz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 03:56:19 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545G6mNZ002484;
	Mon, 5 May 2025 17:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9d579Rb5VkrePkFimz
	Zef5iQ5IBhSJMMTtzUp3zbEkk=; b=dZ4Rxnh2o8tM474GWAQXQCaxJt7Kpd/yaz
	wtcPIevRph7isolrsu1D/4Ag7/GibcPZIlELo8eFHdadKqhozf6v1tMxvA+fJLI8
	fQ5xI8Q+Goq82ivITo5/uE1D89wcdlRU+I0cH+hGzCfFtGMgot+4cZHwKYLLlbCL
	PxqxPL9483BVVLqhAy0miOGNgD8pqC1yN0oXD65kwAltO1mKRAQy5TcQ8/bvlvwD
	82QBK0z6rMwERUCnT48qN2RH7mc9T1PYavqMu31Bm2zFNE67B0gQ6epYr1cviTNA
	cV41Q5D1puHCa9zzwqvGq9U+vzK1zhmomOJOqwjVDfH5unb+DRkg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46f0jd85c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 17:09:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 545GvXQ2037664;
	Mon, 5 May 2025 17:09:03 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010000.outbound.protection.outlook.com [40.93.20.0])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k7pssd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 17:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzAuig7uFHooV9HVFGL5oQD6fHk4u/4aGqW8Ire7Ne2hxGsiHcT8kwxFYAQ3HQfr+5Z+VGo2Z4ghno/iNeJVsmR1gYgBJtf5lAf9KcZN4Nr4IDYjgIy4kzP34aKNDvR6YQXvj/Db+zw3typ4PgU7SBblEc1Hj2Rv5uz0uJBQ+UPL/cck7GAJ8mJ2d/hQBBa+7yBjYlbecoMTATWnSNBPZeKaz7E93ykj4eOgi+RrD8EqyqvNz/zpz82rpZvsxgqnDPwn+24Q3YclQUjm8FATygv7e0x9cZjX2of3E53qBs2UlL3RmdTSJShlVUx28m2wkexxITUSH22RDlKzVwKUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d579Rb5VkrePkFimzZef5iQ5IBhSJMMTtzUp3zbEkk=;
 b=i9n84zkvXK7Frvl01DEel05F4fanUIPJxGKCfx5jjTDza+xnBOeQZ/bRt9ZKgSbJnhb7hQiAoTnr6P8QxJO3BJSMAJ961Z79RNHvyxCQsojYcuzvJhM1PU3M9/zOylcqTSqMZRLAUc9X8uPKF5U7e6i9L67WEMgaVhQxs1d4k3eTXExLUs/pa8YXP10Q21me1eVjnCQz5wgw7d9YRTEouc3RKjTBYfJ7T9CPvHtezztho+M5FfCa8FNU5K0BjhMLFTahDywd79nroRoZWyWM0cwVnkVMq/0wn7B0a7B46cu3iReGurmaBLYJt5OmFgpmyVNE/HLpCfKcrxN2Jm0oTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d579Rb5VkrePkFimzZef5iQ5IBhSJMMTtzUp3zbEkk=;
 b=zTDttlNh9z/9UbPAlPonnXnyDMbUJeU0PK1ZwjdgfQJce7qClwWQ5WMlGH4fJgNzGXQyRxOTQDdBWDgW0E9aMZvsdvWe11nJUN06wvuesMZtXBTDZQJ5Ib9BcLGXh1aBcrAEV4vQHCPQgDAmxxT1Lj78wS8nBUr4HBhF3SLAR5U=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by MN6PR10MB8117.namprd10.prod.outlook.com (2603:10b6:208:4f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 17:09:00 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 17:09:00 +0000
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC V1 0/6] Generic Entry/Exit support for ppc64
In-reply-to: <20250428152225.66044-2-mchauras@linux.ibm.com>
Date: Mon, 05 May 2025 10:08:58 -0700
Message-ID: <87ldrbnfx1.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|MN6PR10MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: a11ca5b2-5989-444d-5dc1-08dd8bf78750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dwTF4RRRULo6FKfK65Zx9fyrAgNa9gkDZJ410mJ+yGa3jL0Mh0JhHsYbCXeD?=
 =?us-ascii?Q?Xlk0nrFLZW5yYt4W8DCi7i/OaacKmwIinEJnkwFKuclcYQsc7vcoiQTZAewB?=
 =?us-ascii?Q?ZISmY9hJb5zvwVcdcxUo07fZDgHPaE9C65OjOG/S+slQHg5oYy3n66oz4bUs?=
 =?us-ascii?Q?VAnFmbo8tGWZFcqWiXz9HwETWHGrVCNTh6hWc+8lUSi+c3ROE8jMfL4T0lZh?=
 =?us-ascii?Q?OaWvpZVsqu4B1ohCaDvXr2W7dtV4K67MoS5asJ99lttJOwqxaDETITEa/OHA?=
 =?us-ascii?Q?/mUUaAXIk9Conqg2VtpV0+Mbpdul2eo4ea/79izKUCrC63hJg5obDVB7dy23?=
 =?us-ascii?Q?Db3TEUsZBSvbEbHbbdcSfmQY87D3YXCP/Q3fj46/eZZxpt9CvEH3Aeo4zp7j?=
 =?us-ascii?Q?ePjwNuIm7NpwJsY5LqaafGscSQbjgfzmiYSeHq8/VErambEVKbsvZZx7XFTS?=
 =?us-ascii?Q?noyyy+SeHOtdim+kSQer0kRb3w48vl4gHWa0wc/i57OSVy62x/+tiqoqQFwe?=
 =?us-ascii?Q?PCajXkvdMAkPSJT9IdGSIkLAKAoav6ZqOhbQqPSI4qadMiVnwVTq0ta44oPV?=
 =?us-ascii?Q?x3J3r97K4ax0sFkjQnMcdAjsc+HWzLV8oHVwFhMXCzzSeSjeEi99jzCMJ/0p?=
 =?us-ascii?Q?kRvwF9Gr7cOgKftCTRsX9biJVBcPK5DBU9BTbwWuBZIwYBIDIq7mtDVJUjZo?=
 =?us-ascii?Q?peHnsFWHieKu3RiUW6tPqesmV4pIK8PezDvotd7HBZ0NFTW0x1NdYMh+XMoJ?=
 =?us-ascii?Q?6F3FqB/quHgr6SsFWcIUbHEgp25wpmCdv8xJLURcfn7w4PXS/b/An7PiSg9O?=
 =?us-ascii?Q?k09n6es/4WOY6FTErkR6pugwmFp+Br84Btc36JxhriXDVc/V2hUjOijMw9lV?=
 =?us-ascii?Q?ngadc4R3TkUZm0pEPkc+La9guvg6NvxkMp7IeX0h2E5yGBpPVIN2rFGHL0Zk?=
 =?us-ascii?Q?b8fX/J4mf1GYf4wIPUn37dr6oW4UZgvW4eicmWTMia6BnqZ43TZWPmYrrvaX?=
 =?us-ascii?Q?gX5jo7OXhgLbWvfARLC4rsuT1I/Gs8GkhTlCjH40ZiPpsg1ehSocOEumo/D1?=
 =?us-ascii?Q?CXnAzF/EsAKxMgeQnzIIMBHHw1R5FQ55vP8w/0o88APZHwhCZBjx88PaS0Cr?=
 =?us-ascii?Q?vwP84FwHm/DCoF6OG3Pq9lfn3x5AI1oPN7UgaNJqSKti005tlWrdHgk6aU/2?=
 =?us-ascii?Q?LdVkWBhRY6Hyn/gQoMEoCHhLvXueqbS+Ew1FoZX9II37SXWYaRRKjUQg2CeQ?=
 =?us-ascii?Q?R5SFbYSO1cHh/Zxpijbvv/VSlPpudXOeMS9QHG8OgZnVjurudTVxm4gEDwFj?=
 =?us-ascii?Q?IKSudvJeib+JwznvXTWOtFgkqn03KJwPOpSEHOKsi3nrwB02znLT3SgaqFXq?=
 =?us-ascii?Q?Qm7QEhgTfY9jTlmXKqxvEvu/dKy/PvCsF/5fqE3xyphdPKJXXjKjoGlzukwu?=
 =?us-ascii?Q?NgFBYxEGGiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i9LpunDauXccKfnqo3+PpCwEnD2V4CTConUMULxbI1gk6Z1FeFnRBrkw3Sr7?=
 =?us-ascii?Q?vKbtIFStrJxtX6P3AANlBKh3Uw4YxQqjOEwgt9TzsePRA44jlmnGNly4pV/V?=
 =?us-ascii?Q?pSUJYVn1xQE1wM+TSoOoMEIraumCSSMrTdXBNz+e29tCpQ5AwAzr0KzZ8QfG?=
 =?us-ascii?Q?ys9jvy9Z+oHiqLCFgj+GnYJ5uwu8dLhPZZfiJ9L5OkTt9Tedn5eP9/9DSSsO?=
 =?us-ascii?Q?SBHwduwRJJA+cIQawEcL3Ov0AjRTIddLiF7+Y3ZZQriP16G/zgHwAgtR04o2?=
 =?us-ascii?Q?d+EDKLDxoGxy0Sv1H6ph/1plYmwbLMVkUtEVFdbYlw+e8DfOr+pagcFnuJoW?=
 =?us-ascii?Q?4a39XhA0Qx0ti9ggluZMDuPLFsjBgv9hOcOcmtKMbn3wPsxJWz20hTgU4Bcr?=
 =?us-ascii?Q?6w7wLffK/lcBfe7w92N7wAgGThMoixAOfWKXToTrfclXAa2N18eLCoIvMsPc?=
 =?us-ascii?Q?TQmf1sLZiMRKtULgG2Dd2PoZBwtWFE9omvUswfHhKfU0slrvXAdntHuN9fFI?=
 =?us-ascii?Q?EeQtwSgX0SIOLldINp4/4L1mOVZsotx4zkk8SdIED5q9McyzTz2CCJYd/bxS?=
 =?us-ascii?Q?CQTR4Gq4QZnPTSk7C1UP0bu2iBVa7ANP+ZDT7yZxL9wxL8qCz2DJw8A2wOIV?=
 =?us-ascii?Q?sUGLzFT6xoJQVfGhnFUsNn9nktTuoEkPWf/n7oZa0KQ5C9F8xpX/jHLG+wPv?=
 =?us-ascii?Q?cnaOFMDWkZECkm1kqg7omYOb3B8mZOY6N6C/QcK/yKFvB3oHdvASCQnpeSAO?=
 =?us-ascii?Q?WDYI9BL569/FabaqUDIuaJKl+Jof7vlD2OLlyeMww6yNbbXYGXcumpk4U9VV?=
 =?us-ascii?Q?GF4jdXS6G/i0nr79ttHo1y/scPoKFfz2HvF1Ig+mg8gil7QRrZPPpRFSIXd1?=
 =?us-ascii?Q?ov2C5PzYrkpowHYHRfPZIuVALUSNe+hNVoSiWgOzxgKF0LebgvaQNYaH479Q?=
 =?us-ascii?Q?s6v08ve+2f2CafYfgM0tveJi8cC0nzO5M7CMom5NQkPoT77mbbGsEX2YJzHG?=
 =?us-ascii?Q?aJSYfO/xlnDBG105K/dngRtAEEpQQ8d4L3SkouJc/LDBZxT+pWmyjk3JzE0K?=
 =?us-ascii?Q?oag8oZ92B2t8/R2pJHA06sUM/5pO/LagEIEXxynWK2CoY4iVc4/2bXE1Mz30?=
 =?us-ascii?Q?6wdTpOmQuzwhWj0s+kv+SQV3WES7Ohjh4+P6To9Ti24Bo2fc34siDYGnAaIj?=
 =?us-ascii?Q?XMupfTvHT+s9VSnCZ/pJVPif4cKQFDi5SJiN0iJatGzO7fQ3Q1vjIZivJcIb?=
 =?us-ascii?Q?Z/tbwPL+4cVbh+9kSS0BnDYGqylOQ5nhNEr3AmZo2SvxnfH4sZvW9k6AJ307?=
 =?us-ascii?Q?Ej5uZ+wN/DdWkqCrhlNbFbrYCfMDahMUXcla5kCihN6V33OxsU1AoxatpBv4?=
 =?us-ascii?Q?oS1OLq/FShy7avLykRjeEw372+P5MqidVoEAqjkRAM68j5IWsMstH8A8wMpD?=
 =?us-ascii?Q?b5bUmrCXG0BD+mOUpEDi70Pm5CG9H/9lC1+21VfSeGLoXC4jb36fcbKGdJky?=
 =?us-ascii?Q?ArVAwLrWlvvnZJezleSdFpyQE7oTmEtvmoc+038yTK8vj1pJhEpi/9mhCid9?=
 =?us-ascii?Q?3DAgAGkLn2u49oSHQ7sHVyq11vRxqo1aKaI7ONRuMnmTdQ2yJzLRK2nqMkiN?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IWT1ed7zj1pmS84I0TjGOwhBbmwICyBoIOofSrvBAjvSc9dvgHUbzt3pjFKXOBZNHuTcXw3dGjdSq3Xt4FFpkfPzl1fM/wRKcvBhjOQiObv8fTGzeIYgd9rKThtlfYQraowrXXSFUc70T/7LtyVtZPIq7LXgHYZ2+lqTSUyKQlwQ0MesWb4FchErTnqmtOj/GAiQGvs36lGrYnWYaLl0MAlZycO2tuQOV3kr82e3/3xa7Dt1LPIhIRmQWsKB1u5riEaCgASV7O5dojfuTXNRWEKecXvuI6rgqHzptIpev+FxJaGprReFtN/vw3emqksg5T3EudAeQxoJ0gIvjZU9v+OYYdXlJ9n5vfSTbRIDK3qUWHs9KBarf/OEtagAU5UacDFAfpGeuJcMzREekpAcYFTDvVwApLfPOX4+hIjaGXU+LyOxuCQ1g22RYspqVFSlZ3xsx4Xjmk/NofRjAJAyHRwnFtg0sazclTKKLSACQiDmqu6bUuF2FVL0uVhQ6hdDTQ66rJMT8uGHPKN7bWCNyoOkm4B0IlBCN6BsOGAeRqljrbBG+RO9j5Ht4n1JWpJflO2LW0qB+giNiE81NDDKLrL1Gbz/vrKqiNE+lyLjUto=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11ca5b2-5989-444d-5dc1-08dd8bf78750
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:09:00.6765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1g/kfoUS/61V2UJEIb++M0wp7ijZJL6wwMd7wSuSXimqMvnQuEKxFbJv8UCUb4HYhUC8jfJBXOEHb/HYATwH+it4am4HpST4N3pqx/kVNlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050162
X-Proofpoint-GUID: niDKTOxw6ZpbREgFuspxWfz7QSaj9uRl
X-Authority-Analysis: v=2.4 cv=Paj/hjhd c=1 sm=1 tr=0 ts=6818f0b0 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VnNF1IyMAAAA:8 a=HW8N0M-qvAPgaxJ6JNsA:9
X-Proofpoint-ORIG-GUID: niDKTOxw6ZpbREgFuspxWfz7QSaj9uRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE2MiBTYWx0ZWRfX9DEb5/qMube5 zUKKSfPVq/lXv14seaa66XP+2dBh3CSi61Gd2ZskZj4qCkqvjR70oidfxviGhkeZ6fWFS7ZDry1 BwA6T6sWdRxcHMASNLbMJHKhDa2X7rrc88WAz1+FfgKdp2RGKR4QeCfRQQkUR9D9qyCaMmEXlxQ
 K4bA8HeDOWrpJ9s81WDYnvQsneZapAUcSrac0CUztGCaPaH9I51xvJrwy+E5Y9a0xNSncxljtyp cnFYvLloaPjEwNDcOXoSQw52rBwL2N15m+uQSdOnFwMcYlVg9A4jCCxLbObbapQtYaWxjHM2WTY Ij6mzATQHDMFY+tM+6uNwSw5brSvu0/v07rIH3XDAhBivkjt++eBV/wcUnW41G0+QR2wxk3OEr0
 pBLMl1T/Zzmg4pUjRqpeW+agxlLSGyDXSr8LtP9eQI4GIa1uRWrqvpGXnvri/OaJ18raKr/u
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:

> This is a syscall only implementation of generic entry/exit framework
> for framework for ppc. IRQ handling is not done in this RFC.
>
> This will break the ppc32 build as of now which will be fixed along with
> IRQ handling.
>
> Below are the performance benchmarks from perf bench basic syscall.
> This is for 1,00,00,000 getppid() calls
>
> | Metric     | Without Generic Framework | With Generic Framework |
> | ---------- | ------------------------- | ---------------------- |
> | Total time | 0.904 [sec]               | 0.856 [sec]            |
> | usecs/op   | 0.090403                  | 0.085638               |
> | ops/sec    | 1,10,61,579               | 1,16,77,086            |
>
> That's ~5% degradation as of now.

Is the table header inverted? That reads like a ~5% improvement with the
generic version.

Ankur

> Mukesh Kumar Chaurasiya (6):
>   powerpc: rename arch_irq_disabled_regs
>   powerpc: Prepare to build with genreic entry/exit framework
>   powerpc: introduce arch_enter_from_user_mode
>   powerpc: Add flag in paca for register restore state
>   powerpc: Introduce syscall exit arch functions
>   powerpc: Enable Generic Entry/Exit for syscalls.
>
>  arch/powerpc/Kconfig                    |   1 +
>  arch/powerpc/include/asm/entry-common.h | 158 ++++++++++++++++++++++++
>  arch/powerpc/include/asm/hw_irq.h       |   4 +-
>  arch/powerpc/include/asm/interrupt.h    | 117 +++++++++++++++++-
>  arch/powerpc/include/asm/paca.h         |   1 +
>  arch/powerpc/include/asm/stacktrace.h   |   8 ++
>  arch/powerpc/include/asm/syscall.h      |   5 +
>  arch/powerpc/include/asm/thread_info.h  |   1 +
>  arch/powerpc/kernel/interrupt.c         | 153 ++++++-----------------
>  arch/powerpc/kernel/ptrace/ptrace.c     | 103 ---------------
>  arch/powerpc/kernel/signal.c            |   8 ++
>  arch/powerpc/kernel/syscall.c           | 117 +-----------------
>  arch/powerpc/kernel/traps.c             |   2 +-
>  arch/powerpc/kernel/watchdog.c          |   2 +-
>  arch/powerpc/perf/core-book3s.c         |   2 +-
>  15 files changed, 336 insertions(+), 346 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/entry-common.h


--
ankur


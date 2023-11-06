Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE67E192B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 04:25:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=buWq0385;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=aMnXBqEk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNxYQ1MQkz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=buWq0385;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=aMnXBqEk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.74; helo=rcdn-iport-3.cisco.com; envelope-from=danielwa@cisco.com; receiver=lists.ozlabs.org)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNxXQ2TMnz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 14:23:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=550; q=dns/txt; s=iport;
  t=1699241046; x=1700450646;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9hFV7LdCcsEmRiTW2hvICkRrI9PCK6dHdkYJ6kbctqI=;
  b=buWq0385DB817a5S4yS4r3HDF7hH8ntU5tsRXfqRfxpdhQrWz0midhgQ
   vI6EX4Ss+CDrdss/7SYOsM42jZQlputEeG9eT4G/Zt1TPQRuMGqfooLIE
   7nKOLEVNHOVKlLReCAiCXdgPKKocmtCU+a0FPxQLRqIQnx4bpVD2ZUN9p
   U=;
X-CSE-ConnectionGUID: NMv3Ph/pTpSwNi6P/1vn1Q==
X-CSE-MsgGUID: 8Qiu9jr0Rf6FIFUq9SHC/A==
X-IPAS-Result: =?us-ascii?q?A0AKAAAsW0hlmI9dJa1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAlgRYGAQEBCwGBZlJ4WyoSSIgeA4ROX4ZAgiWFeoxfhUuFWoElA1YPA?=
 =?us-ascii?q?QEBDQEBRAQBAYUGAocjAiY0CQ4BAgICAQEBAQMCAwEBAQEBAQECAQEFAQEBA?=
 =?us-ascii?q?gEHBBQBAQEBAQEBAR4ZBQ4QJ4VoDQiGRQEBAQMSFRMGAQEsCwEPAgEIGB0BE?=
 =?us-ascii?q?BAiJQIEDieCXIJfAwGfLQGBQAKKKHiBATOBAYIJAQEGBAWybAkYgTABh28aA?=
 =?us-ascii?q?WiJHicbgUlEhD8+gmECgWCGQ4kuBzKFdox8XiJHcBsDBwOBABArBwQtGwcGC?=
 =?us-ascii?q?RQYFSMGUQQtJAkTEj4EgWOBUQqBAj8PDhGCPyICBzY2GUiCVQkVDDRKdhAqB?=
 =?us-ascii?q?BQXgRIEah0VHjcREhcNAwh2HQIRIzwDBQMENAoSDQshBRRDA0UGSQsDAhoFA?=
 =?us-ascii?q?wMEgTYFDR4CEBoGDScDAxNNAhAUAx4dAwMGAwsxAzCBGQxRA2wfNgk8DwwfA?=
 =?us-ascii?q?jkNJygCNVcFEgIeA0QdQAN4PTUUGwZnnn2GbTqSRoMernwKhAyhaYNbphIuh?=
 =?us-ascii?q?0aQSqMJOYRmAgQCBAUCDgEBBoFjOoFbcBU7gmdSGQ+OIBmDX495djsCBwsBA?=
 =?us-ascii?q?QMJi0oBAQ?=
IronPort-PHdr: A9a23:in2oDB24BESNRbhWsmDPZ1BlVkEcU/3cJAUZ7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUQwt5Gm1ZHBcA922fFjOuju35D8WFA/4MF95L+L0F4rNhuy81vu5/NvYZAAbzDa4aKl5e
 Q2/th6Z9tFDmJZrMK831hrPrzNEev8Dw2RuKBPbk0P359y7+9ho9CE4hg==
IronPort-Data: A9a23:x9aUq6rU02nPXVc3fpGekzC6y4deBmIAZRIvgKrLsJaIsI4StFCzt
 garIBmDP/mMNmfzftF1O4m1o0wHupXRyNQwTgc/rX08QytDo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7wdOCn9T8ljf3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYATNNwJcaDpOsPva8E035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5EqU2M00Mi+7gx3R9zx4J
 U4kWZaYEW/FNYWU8AgRvoUx/yxWZcV7FLH7zXeXl+mNlHXGNGPQ285xKkBoBcpB5OAuODQbn
 RAYAGhlghGrnem6xvewTfNhw5tlJ8jwN4RZsXZlpd3bJa95GtaYHOObvpkBgGxYasNmRZ4yY
 +IVYDxuYRDfajVEO0wcD9Q1m+LAanzXKmYB9QLN9fRri4TV5FxI0aW8MsCNQNLUa+R7o1/Jn
 ULtuE2sV3n2M/TGmWbarRpAnNTnmSL9RZIKDLb9+vN0qFmS3XAIThoEUVKxur++kEHWZj5EA
 1Yf9ixrpq8o+Qn0CNL8RBa/5nWDu3bwRua8DcUczR/W8qqT+zqBPXciT2B5L4U4spYPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBcTzBTJdDcPjZVZVi+QPsL3fnTqUEYk+SP/dYsndXGCvk
 2rT/UDSkp1K1ZZTv5hX62wrlN5Fm3QkZhQ+6gOSVWW/40YmIoWkfIevr1Pc6J6szbp1rHHf4
 xDoeODHsYji6K1hcgTWH43h+5nyt5643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51IAvscCZCD7MfcvC25UNyjM5fWxfTgCfq6MBueinrAtHON61Hg0PBXJjzyFfLYEyPBga
 f93jvpA/V5DWfg4k1Jats8W0KQgwWgl1HjPSJXgpylLIpLADEN5vYwtaQPUBshgtfvsiFyMr
 753aZDQoz0BC7KWX8Ui2dNJRbz8BSJlVcmeRg0+XrPrHzeK70l7UaOKket5K9U/90mX/8+Rl
 kyAtoZj4AOXrVXMKB6BbTZob7aHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:r8KzOK1Xs8Sa5v1gvmahuQqjBcBxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6KG90cm7LU819fZOkPAs1S/LZnimhILaFvAT0WKE+UyhJ8SezJ8S6U
 4ESdkdNDSeNykGsS+X2njeLz9k+qj4zEnKv5ac854Od3AXV0gI1W4QYWjrdzwTeOAFP+tHKH
 P23Ls+m9PUQwVsUi3NPAh/YwGsnaysqHvOW291OzcXrCO1oXeD7rn8HxKE3hEYfQ9u7N4Zm1
 TtokjS3Inml+u05CP9+gbogqi+nuGP9vJzQOi3zuQFIDTljQilIK57XaeZgTwzqOazrH43jd
 jluX4bToFOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCvBGmZlSfnLimg4dVZBHoe
 V2NlCixsNq5CD77XzADh/zJkpXf3+P0DwfeCgo/iZiuMUlGeJsRMckjTBo+d87bVfHAcYcYa
 tT5AW23ocITbtcBEqp4lVH0ZiiWG8+EQyBRVVHssuJ0yJOlHQ81EcAwtcD901wua7VZqM0rN
 gsCJ4Y3o1mX4sTd+ZwFe0BScy4BijERg/NKnubJRDiGLscM3zAppbr6PFtjdvaN6Ag3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79xyu6H6RrDsLSqfIWpe3/eIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20nkV5xbORAlIYUoUxYAKhuzS+7wW/vXX7bgAYLuzZLWYEEZZl8=
X-Talos-CUID: =?us-ascii?q?9a23=3AIkekb2mwHGrFXUwJB3AeOL45m4jXOVv40izoIwi?=
 =?us-ascii?q?gNX5SV5uUF2fXob1iyvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aocf9Zg76bqpmqZ+9BWqvwCmKxow42qWzWUIXya8?=
 =?us-ascii?q?I5eelGxFpagy9p3OeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:22:52 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 3A63MpHu001654
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Nov 2023 03:22:52 GMT
X-CSE-ConnectionGUID: vRXrW53TRTW5ZRcQAUJBtQ==
X-CSE-MsgGUID: OE35/sBATROEF6Ujmbvagw==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.03,280,1694736000"; 
   d="scan'208";a="6948980"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9ouSCAtURx660NAY772XVSIK9bVnTc48hwrjT/vlfQzgD7S4j6gN/M3klvxNSIlqP+9Tdydrz+UqWAXI+t7o33qjCRPcTnEM68LcxihDdzuCFsaaM4beGpuz80qmUsgn3WKQ0pS0AEeOkMv2YmSRyDTZR+BL+mwJvg/a1ga4rcacRPK1r3rZQZywvj1okWnaCogfNMH6vG14FBm3DRepy/q48V4mydS2imwgh06XMh9mlViSLQ4X6vgLdDtGx3tK3ix1UJqdXij5P9je1pEgRmwUW0thJD4WBecE+0f1mTh5B/ADGPYAZq8fNoUWbrUnNoFdopdyYgwOWIZavUmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hFV7LdCcsEmRiTW2hvICkRrI9PCK6dHdkYJ6kbctqI=;
 b=e28+KfkEqsw/2O0YLfMIDok71ZNEHk2f3F0ZZ7crNcWQec9VTk28pOEvUNkrNyP8z5jr/QcsVtP8x8Jx7b+6WrOro0DgAozXYyB8Vhb4XCvqMlfW8XE5a2Hu4TqKYLooTdcIAeAIEHIH/+VjluZGgQZD1qrVVtwHcmzX5J74GUQgLVlslD+zWmTRqGbnEp0LtGd+v60wiqGbBYcef595Bpvbvhj0KecKUyu42zScUPPVzidC7/VWrR9chmeV7HUj1+ZpG3v5Ca7mg5t9+MoNm23swgHeJafRlrSBIHIrGs4zn9uEttggSbMYI5Xv7sWmr5fDEZ2kUkHNXjdH5dHsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hFV7LdCcsEmRiTW2hvICkRrI9PCK6dHdkYJ6kbctqI=;
 b=aMnXBqEkFRqSoicuX2Vi+BdzXWiuGXsCVpbPDEdZfo085W2l9oMrkysCo3R230+ZuKHE5OTB37M827x4X8tGdjadcXI3mf7F+fh6wFbxTJf01pf0Neucv9kq5ZVA+uf1BIUDTPeVKApYXnHrX4tEXJ4telC339vgsq6OCM+qYfA=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 03:22:47 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::b8f8:71:8478:2d51]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::b8f8:71:8478:2d51%7]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 03:22:47 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: mm/debug_vm_pgtable.c:860 warning triggered
Thread-Topic: mm/debug_vm_pgtable.c:860 warning triggered
Thread-Index: AQHaDqs2uyOM/z2fbUyWl2XCH6c9XQ==
Date: Mon, 6 Nov 2023 03:22:46 +0000
Message-ID: <ZUhcBjGZcUQJVHcZ@goliath>
References: <ZUV+W9bwUBjahL15@goliath>
 <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com>
In-Reply-To: <dc5a1072-0c2b-4f49-8a5f-de3dcfb8c06e@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|PH0PR11MB5045:EE_
x-ms-office365-filtering-correlation-id: 6bd539ae-b66e-4dcd-3d22-08dbde77a5e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  12rnTPqq4YW/Lx/KXft0Yf+qYVGLKTwLaCJvv7iJfHp9ds0uxPCnAGZ1W4mNSlewuqroYHeCaPR11vYNZfKcX3jrvKiHWycY0Pv1QROmraNqNxym4p3jSP1T78fqJc4QubIsee9hy0oou6Nthw/3ih21V7roJ1n/ziw+7WCIWC3wdrOZb5f0AMGBkzAUaErQWHxPv3SCBF5A8Xtu9Q1pfMFfvjwHUNFG1dP1Hb9FluMZ3c6WupSicZyNbQ8WKBsZ6rclza+lqmEOgM6Qc2fMJn7wPZDUlMNgJaPb07SMqKJoDLDRJVIvngwFqZXnuyVFCaTHk4bFKhP6gmEJukYkD4t9JnOS7x51kMy/Iia6RiJICNzF3y+l+bO8E4l/ZrQyt2pT3jVtxgukEEqUkrQdM2UXt9BZDMrtl/TDp35pMCjvaVXr4S8Kk4x5B/asPaUr7TleaDotZrLJJQ6z5bDO+kANBWCaX8KFJ4h3ES6EEcK0Vqu/VpvqRxtxOAIxJqslYe9lwEHtjJl6ro6LlKai13LmCtIcJdZR7yD/zsWsJAjIhLbwrA0RKUksR6K84aZ3w7Q4LmvfnSZQDxTbBRfgloI8WjPP7JnMmtxb0oX5tHFSAc3/bjqTVc2y/W2qnULohSTdleAiLfBszwiEeRXreukxj2CYm5pNz3bWIK6p3QM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(33716001)(316002)(4326008)(83380400001)(8676002)(8936002)(26005)(66476007)(64756008)(54906003)(66446008)(66556008)(66946007)(6916009)(76116006)(4744005)(5660300002)(41300700001)(478600001)(9686003)(6512007)(6486002)(71200400001)(6506007)(2906002)(122000001)(86362001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?e+NlVfYvf2/S3c6p8UDiMlRIE53Wus5TbSpjKJmc+MopGzVwSk01MirJ51Sj?=
 =?us-ascii?Q?Adi08vdZh4QgG/ZwsGowU+5OxHfBh3KwbOajycFZgmjbiqV4m3j4prdFMcmw?=
 =?us-ascii?Q?l8x3UYf6kpnwpI2qO4/+NheG7Xbvy0IgxNTB3r6o0SyjOJYTD/uawBRJnra1?=
 =?us-ascii?Q?0ltzaV2NtibaZzvKkr+KHne/F4cbglP4E5q6F7opZUI0cxhSTcMDFrq8RA9m?=
 =?us-ascii?Q?+huOOPagmnIztUuLTe7aui4lqtzolrAOEPzR0BwC5+mAs5g5szSk3EFM9XoP?=
 =?us-ascii?Q?mmCTvAeAV3uNNxyGfzRf1Ur3bu/jagPlGZxGCxJDIxVsqkjBQ2/1C5NM6eQJ?=
 =?us-ascii?Q?KrwQWFknuRsZACY72vqFtXg/S/NLuFfp96+CHdYDiDgUR58bIo2HlQW5aDZq?=
 =?us-ascii?Q?ulQvy71UJDRgtCXAr3vhu/7AzpqCxucvF73xzoNZ14bByRzF8G03RvAeCzUu?=
 =?us-ascii?Q?rCXB4HhFHV0FOTx43WXG+rLTNgsqnLlczpcZSASrUE1A/oRWFg9GmNd07WXE?=
 =?us-ascii?Q?h8OZipZaxjeSA612zKnzyMoqeuG1aBB40Z0Bi9N7Qr1wE9pOxiRXugKMh5cf?=
 =?us-ascii?Q?KoWWJoSkDzY3LBvHNiGcZYr5OV3v5iwtmf9xDR05jHvozeC/H3wxnAGH5/2Y?=
 =?us-ascii?Q?OivvRPL5o3unAWPIPugv+rXOAmBlqX9Hh974t0Dk9jkbueGvKTfq1TW7709P?=
 =?us-ascii?Q?MtBGgSPE2MaIcD9Rr1xL+qhxzvNcZFiapo4plk+Enb3MbhrLnryRWhosC+ba?=
 =?us-ascii?Q?ryQ5xUyIxq1xTJ9j20jo21XXsGnGemvKaCwcDdwaJ8BKxRQdFea47nQhNkUy?=
 =?us-ascii?Q?wzuOQbCxQZiCUaBdiR6SXauiTN3/o8K5z5czfFDChKU1O1etMLdq3P0n6GjA?=
 =?us-ascii?Q?KqybJudselHrPltMW03kBtdXxY//e3Va2ak76dZAWpFvBA7bGCXTps2UlDaE?=
 =?us-ascii?Q?NsMX7yjllQWAfdLSuvrR8WsIwr6e9WENJgudBHxdNXNva01VHVjF0T34l03F?=
 =?us-ascii?Q?5ywsjSR22rj071juPNfhpG4UCmKeuMzFoPSGHEqj/ZmJZIBKh1aYhpZW5QgF?=
 =?us-ascii?Q?QeAjTjYItXPcPd+xAnH6WfyIeN9BIWQVAwuM4AWMgK7oRfrbfGR2rQXssCrt?=
 =?us-ascii?Q?T2fQIUZv91Hb6a1z24U4mPuzg/C9JO/cscugfm7zm/5kOvOVh8po4i7eElOj?=
 =?us-ascii?Q?RlmSQY8W1N7N7JwQDyrSLqKsbWsLakHQYAUAOnEaOFeE76z8woi6PGjapFEo?=
 =?us-ascii?Q?FML5N9bkRsR9++yGg+yOQWl5/pNQZIYJir7m7Kf+OHgeFF2pbdrgbvlgpvP1?=
 =?us-ascii?Q?H6dQvWXnBc347SasmEYQuR7fQmVDc00aWrYw/mnwHQe2PJl0ZSZ+DdSnM5xm?=
 =?us-ascii?Q?kljCwJPNSrMv22Xb0K0gK/qTnw5M9m6HeaxKPcKA86AKtdpFswtNaiGykWnD?=
 =?us-ascii?Q?0J6LBSoolzmF2w2Rlg97fsZICdllu51Z156YPUoO7XXbG4Mg8ZW/dFdYoTlR?=
 =?us-ascii?Q?VosLWAjfiKLgpZ9lBvjpe/Ndnt+1BE6nuvx6ryrB9gfIdZy9+tvtflAunNb7?=
 =?us-ascii?Q?Jh9yT+4hq86ZAIOtgdg2d+msFZ/Ry2NxQgZIJrL7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9D506B265D98034F828EE0D47612142A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd539ae-b66e-4dcd-3d22-08dbde77a5e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 03:22:46.8467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5O+1jb7XyfM4NDiGNkrHDwta0jRhEtYqbBdyn2lmS3CtVQWKWI9RLkXpr8xaBZE7u2295KCLYT5mgeMuUmSO8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
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
Cc: "David
 Beazley \(dbeazley\)" <dbeazley@cisco.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 06, 2023 at 08:39:26AM +0530, Anshuman Khandual wrote:
> Hello Daniel,
>=20
> This test just ensures that PFN is preserved during pte <--> swap pte tra=
nsformations
> , and the warning here seems to have been caused by powerpc platform spec=
ific helpers
> and/or its pte_t representation. Adding powerpc folks and platform mailin=
g list here.
>=20
> - Anshuman
>=20

How is the swap support to work if the pte_t is 64bits but the swp_entry_t =
is 32bits?
I would think there's other platforms which do this.

Daniel=

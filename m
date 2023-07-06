Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88374A774
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:12:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=KtTH9Liz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FAJjEvdR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxsk95b65z3cbw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=KtTH9Liz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FAJjEvdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxrbd3ZV6z3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:33 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LMUFu031988;
	Thu, 6 Jul 2023 22:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=KtTH9LiztQyrAodvu5YqlYmCgffu1RbSbwFpaqO7i80uB5EZBrmydrFu9H+2xHp4QcRK
 HXsMKOWih0t4rkjb98UID5Om5QgeNCc68+QW0EaCxpIIEGCuNTyIed1DoFgZlrpg/kmf
 VQCqvyqWUDx7Qs4p1GVCFFmgvA5LXubZHnIXFlHCWJZzW/G64slvFcFAK9nsNMM+7QHz
 tDqkhTlcR6pj8j+1YtW1jp9aNMJZ721wTpMxUMS92UVOetJSIeBktN1lSmOGoXAHJrxu
 NYSmHPmJM4nEAMSybyFfzopjmDHCXyZEYfqdnm5/ZoVMkH7QYDhCffNEQXNgAzDj0Z04 iw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:16 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KOxXQ007182;
	Thu, 6 Jul 2023 22:21:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakdmtu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIcUHCQY7O08hjVkGupV7MazX8q7eS+kvzA8eAwEux2uVtEVTls42BQZMOmjWA4EojeVPkrrA4CNvTTQxGxqyzhV3YcDn+MEYl/5taQrHoxrM7YmgUjtQL7gnsDCyR1f0ngAkAam9dc7IyCzacnXrlhA2sezb6JZCnK2hqoNdCgBk7LBt5OyHqEumRAwQz7FV9WcTqgevo8WdPhv0KvNgjbyvAzW9x6Z0Q5B0xMPoUKla+jqBpmqvVH5rPIykzl3WCsotXMhOEoiFEULiZ+fAGIo/0VaCkZ/gnpWoLeclfSv9Bd9oJ5Iuv5dhh4Ufa2XUlcETWKmQe9Uf5QDVda/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=hDnjyvS290tT0ZI9QqhJSY541IB2fVV5L3I3x05/ARVZBxCC3OYk3+3THIC6s33bmUvSLAzVrvdLynoGRxa7HVbquNdF8ysHgY4g/WK8ycie6Ok6d/9ogKAgInVzWnZ3o6ED+U4uR51QEcfdB+qoDOBGZKG7LvzM/6EWxeTSy+3l2Tj/3aRiYfsQFCyyJ9MWM0UvoYxWYUnixaFM4j+xlThFPd+zKyR8OYKSLt0hLAtyK2mR00d+PvY8+H3CS0Oti6H0aSmwWzZ04UTKOBpdyROMbScqXkqBKbKhVy/dnBB1N8xrLHoQ/Rn5h0nVmjFgwaETDCoQGrcUkMQjMr+x8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+PKwj0HONu7bLQpXmtLDG4GCIkHBRq4GGrkhD06IPk=;
 b=FAJjEvdRbcBQkuiLV5H6JlKBCvVzJ2XsJyBcjEtyMZqqezRixzyQjrsC7AHU2LIdPhKimKu1muamfAL/6QSbKuaaXBljn4N+s3vwIK3C7Z3TVXNrpBFIqoP4awuCpAxH7ekWoi/dU6A/FNfoG5lIkqbxIaqaXtkI6r6DYsJc1Ow=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:11 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:11 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v5 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:25 -0400
Message-Id: <20230706222027.189117-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe9bf5f-b77b-4972-9c59-08db7e6f4dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/bO+vltLBjSQj2buBDMG/6MPMcjqBQjmpFaIQwYEbP8nssORcUkRE+58mBCfX3T4H7BwAkRFogYribz3W/0uqqRkO8/3rAstJ8zNYHhLtR2k6aPy4j1jcYMST8LbWVFleWNx8oL7F3STc7zKaHRaE5cnfdmiVSuVV3EZNCPO3FBbVzBTmlevJzf26rphk/nFdbMipP0Hml6SVNQocBbsThmCHQOg+Ecr/pjiQlUyXEvQGwv9Bca0Z47rYsDxb5xzawRHK1hTw6rf2EzHMQLCupBaE8x7n0bDc8Qwqz/4xsdlg/S0QkZS2Xs4cpkCjcCVAyoqyTg4L915HyMDOsK06xUAnO0TAs6byvJyCaTSbz7LMKLN+9vjw/TXua1xHZl1JI7mYrcY7OvhPngSw08ZhFUi5EqZbVge2rzcT5AGONIFNkeIL6/G1AbAmfApT9axzRxkKXhXkj70BdAYt+QOB1KUfZ7FL9iQtGvWHOOD6UoK0oriuVQ8dPhAhNgKzvjzkLA7ckfUXzcxjOROXu9gEYPTfBm0Y1cWUN7zZWB+q7XTUe6IkFAev4lnh7HWGUP6ioOg57m9bUfU1XofYDeOXiW1Ny9h2S/eJv8mBw7Mc8Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ros9bWTkXrQkIKbVjC3pgI77Df2vZwr3bMoVEC8nw7On1U+D9W4XcqI0656I?=
 =?us-ascii?Q?T9hEsxbqCTSVwcbFxEomCmoByooyT+PRkpY7GfK8bIwZSgi0c4S5IgV0jhy1?=
 =?us-ascii?Q?ZptKJUREIyJZRXeG4kp5LokJBh3tyBAjJp8HcGTZ1VUzOi5ux5eMK5TTbBo5?=
 =?us-ascii?Q?YECOGXsxobkFNcGQBEEL9OWPnFs8Vlb4d/UL1qVlhX/4dr5CtqVsdHPX1M0D?=
 =?us-ascii?Q?jw+0cJLHoSYVcaPToGw1YpR39VSKCNbgyJ6kzun+RsVBK93MnJu62JB2HooH?=
 =?us-ascii?Q?bXGIwSbBQ7S2yKJakIFDbOX65fNnXlblYW0TOcHFtXFHF+TPdPSWXWSv0+ye?=
 =?us-ascii?Q?qLrG+HWKx65eCD2fSD3i4QnfCwqAmX1XXhNw/ywT/zHqwzd5NNIU/8L8r6ak?=
 =?us-ascii?Q?agoxUUsLn08wx5S1odq16NXhSnr53oAWlkHk9aPfUoSs07XnG59TDP52uPDo?=
 =?us-ascii?Q?3xdtBf/wRayBJDe2D6Yhr3x0Kfn0zM0+6FCmbLy0sXhE/j1QaEYMWLDpARVG?=
 =?us-ascii?Q?F8xAmejjQ9LnADyR5dtSFjT9+5WuhgMpy6pEB3vfPScihry78xyWbR3XeGWv?=
 =?us-ascii?Q?9bJVgkEOoB388LdeR+vTBU5R32bPtHWO3a0YfhNRAMRgRj6fANOxN599983S?=
 =?us-ascii?Q?Cd8WvRTLAVlPwEs3vry50IjESLnKiT1Q1rHSrGFbFL/tyIg1qsinO88PDi2C?=
 =?us-ascii?Q?/NvqzvXeUXnnHiZGMoP62V9frP8xdYe4XWAJ4cwlmNBoMiRq8VERKXuO0GoN?=
 =?us-ascii?Q?xtCgt1F4aJFLCBxU+LwjsXB+gC6C9gO/8QalvORT7Ym9wQTH7IaMEWghPqUk?=
 =?us-ascii?Q?4iWCVEO4FKQ/R0/HOLwKLirk2xg1Lt2/aDJ/KyHG9P0IcgjWcLnpinDC0u46?=
 =?us-ascii?Q?RcinMkALUx/WorfC+qktIqInsucgQT3q0tdJt4L0TG+i9rIiiBAOYfOS0h9Y?=
 =?us-ascii?Q?Q+DgifIcemyvSGPLtJdcPqwJSxRblmY+6ixaogAakGcgKDUlLHrndrRRQJkO?=
 =?us-ascii?Q?B54HbIdpyAeGkCd4N79pfh+QbLOGNKzOxXEhTJcfUJ8IMeEh8MBStVWalqfF?=
 =?us-ascii?Q?/Eroh8VvqZfr4bQwm/jizEUznw9CvJMDB626RLC2seRWkfzgeG6tr6iVms6C?=
 =?us-ascii?Q?/kvzUptXNNNXWmZT/XpOriecNeaP5nEc0TClp6ntuTKTCQ1LR7bsO3cYiEi0?=
 =?us-ascii?Q?sveGRI8d9QLHVo2X8RDXYM0hmnj2YD2VJqT0x3539cFfzvS3mzbtxgELRuKU?=
 =?us-ascii?Q?h0AFprkUwXDcMxAmAsf6qd8Ubi4SLZRP+tGEcs/m7G4Nhta8k5NRz36ZFBdb?=
 =?us-ascii?Q?yxT+O0X/Xk0eujPpRRnwV9BAgIW6vV17ecVTovhaTxB/DP08BwmqXViM6Uwk?=
 =?us-ascii?Q?frJ+kBrwtuFhLaOw7Nl+JEk05i2KrxAub6SD8I9NH4OnLIrKeTh8+1oj6Cu+?=
 =?us-ascii?Q?JHbkqd6+e4dWrLSPR3x1G5LrGPcZf9Edg43QbXC34Y2e6A0ssseNBlcaYZ3b?=
 =?us-ascii?Q?YtQEC2Il7nCPYB/gSgvlChv3TEpssKTTo3RpHxtKG/+2w0a3BhxUhWdniExz?=
 =?us-ascii?Q?U+ceTzFmGz+JNgqXC5LhOhn2/ZpEfeLBQoO1PjApkLsXxgPisNcCkrhrlmWZ?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?9KzCHwapo02dqF9DD29jprGfpVMHae9cW1Kkim/vyJoGJTQQNvRnW3tykFJ+?=
 =?us-ascii?Q?Ua05GNnTevcS8GW8t4AgDC1lkPKe9gOFEQoE2qvbp5fAXCpOltIhYtZs1Jfc?=
 =?us-ascii?Q?RTg97DlifYynTp535e6POAwwm5LlE4CERCtA4TI2iIGStWV3C86Ym70ntiAY?=
 =?us-ascii?Q?qTM/o3HdzKfwK2d22VJME8r6H7MOaZdXYHyS4QcXytA2UR+03L5rltVD+BiX?=
 =?us-ascii?Q?tQ6072PXvYPbpbFu5X9GiUVtPd5WMxB68abqQ+soOa6ZwzoauxJ5hUJr7Vc8?=
 =?us-ascii?Q?K0mOaZxCIomKVR4TwNTf1Dfj3V2iC2q0QzfucG8xK3WsTQwUrcur3/eEvFLd?=
 =?us-ascii?Q?abSTWDa3dMy57XOKtEBgT36DbYF0RsCFatVsvGz3oRYLch/o7R6H/Ik3TCWZ?=
 =?us-ascii?Q?cR0xC6/D9yJo8N30a+Dluu49UjPfGuqlYV1YNG37Kaw3c3qW7U5lXU/OZE9R?=
 =?us-ascii?Q?fWDYjCjK5ac4114qzaVdY+SbAFp9c8aG0jX+q7qepg5P0qJDFfsulZCprfBT?=
 =?us-ascii?Q?Vt3gGk3WFhXhLv7mJwhsBSOXmqQc9X1oT/Vmx9sPVMVBXsxrdjPVUr7vtdoI?=
 =?us-ascii?Q?Joa4KN7y7houdZKfG4ww1wF1vKerxXqRl3pFyTS6XFtcjs4zK+a/yonrG/Xt?=
 =?us-ascii?Q?HlhdOh3mO70nAr9tAClreDfC8UK/KNwI8YokQVZ6kiTpY6hY28L8KsXySuxK?=
 =?us-ascii?Q?rpH/IS1DavXaPhLw0HPjHQ95TR+8kV6x1LNT8tmyQkahnJDTkhUh0fbWguBO?=
 =?us-ascii?Q?rY12Oq82v4UTQFBNwZMs1zf2hIbOWhRO9cozErGMcQi7x8HpOV71fWkYF9s6?=
 =?us-ascii?Q?D7gV5kics8peiMOR8ELfBrz9YmOY0mcE/fCj0YSxB534K4gnMJq9o0rtG3WR?=
 =?us-ascii?Q?b+Pkmw/oUlyEM7OhswyeRlF9Jcp2kAYyKt5ZqcjFbzhq9AAqiaUGcvNOJ9ga?=
 =?us-ascii?Q?irng8Xy+EAHsOcRuPADz6KkrKY/njPNea1m3/BWY8DGKWMqmg9a3xt5WPWta?=
 =?us-ascii?Q?3pC1lGeUJAKU6yU+mdR+PFLAS9EwYmYn+U5zxFe2yhHQ3fZrTIzh/4exT3dk?=
 =?us-ascii?Q?dHLBaI8iUG+JMAtT4r0Oh1Jt8RUBLglV172Tknq4X2MUA9feJZK7yjvtiOmG?=
 =?us-ascii?Q?Tdg0Vm0UdHaoQlZInlB+GpW5EIPeye8QftVoRtvNetMZJbzTP6L/ssvlqrP1?=
 =?us-ascii?Q?qgtuDBMOvXlMA185tN+SFk0NWJZmWm9jpi5aXhUxFEyGBtw8XbDs2E8tyLhx?=
 =?us-ascii?Q?HNeUS/4c+m1heRze9Wa8t5v2nxsMpyWAZfE6eTi7Nd3msRE/+6jSSkF1JnFT?=
 =?us-ascii?Q?FaKsKhmVLvMuBC08I3Ysfd7yoL8hLhHCFQwv8SxfWhKzOtTlV3du4b84RWYD?=
 =?us-ascii?Q?8jBn69Bm3tWdDq6VhysOcB+TTHqSWl6VDYqFtN7Oh42cSeGBpXWdVSGc5XJz?=
 =?us-ascii?Q?A//BFTPlJeJEzruT0kD/iJYTQWHicqpXL7Tc/IoJbPyAHFKhGcUxgeVfj150?=
 =?us-ascii?Q?qNMedz7aiirBC0PNnlUYMfaX6iC1gX3D7Re8onAp0HQWSRHfR43yNDwioVcB?=
 =?us-ascii?Q?f0YFAGP37hTWujLy0FBigdBVsSqjUFaZ/XDKFLiX9PCOOeEOF6rq1X1mVg1h?=
 =?us-ascii?Q?B/5x4pAgThKz5JYqMmGFibWW9Hb3/ou5ns+AUfFHtc69J50/hPJFLIvFyZLO?=
 =?us-ascii?Q?fw4Et8icKT6EEKThzBitCLr6bLtk7etWvC0W66WwXyQrr9niMbPZdg2dVfw1?=
 =?us-ascii?Q?QjJa0J8nTlFHSSe51IZPzeUp5B7/Z1cYcpawSH5T9x3K7tunzzaAEG4E8mjQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	pPHSKH9dFQDU/X8LB8mLzMfOaMGWfSzWYIYPtwdul1s8OyWkQKTBeLJr3DZfkbDHjq+UEjjFdpvfiDL4wwkMIA8ELR8jhOIvdXf2oRIhBhs+StHYk+0hw1as3DePUS6kRpD6FKDEWpjZxwCkvX4JVHJGHX+K9BFcaDrvuJuGoxPZyE8a4Fsv8VyKOfDMr9j3brqigW5vVExZ2KboeUzAXl90Vt4EOVJA855llFDv9zDmzc3sPKSn+2/DoakBdTxZ8hq7VpiJdJFRT195P66TvfL1RcY9i8VbvmV1aJDMj4cCH2OwXxuE4kNJRaV0lAktYKcDOvlMDDCszzaR0MpFdGQLOdbeCsV7E2VdK7MTdJ5RmqnaGEFZOlSK6HikY0bvjox+legLOoq+OQrg/2UEqBjq80op0UXElL6pU0yJujBXtYp4rM9H/n6wtCIpaBXxM0p2lhuVFseJzQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe9bf5f-b77b-4972-9c59-08db7e6f4dc4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:11.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mWsjehcYZRqlbsRSa9CROG6FdmpSkqcO/ceXTSH33qBHHrNeRPu3Dd4tLE1ExqdtF88WxeW7cs/gF5pTXqM3O5tyAYdjxD9kQduZmkwqSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: nffbWl7bB1ahzQkAgKmrnzgRPaPAInmv
X-Proofpoint-GUID: nffbWl7bB1ahzQkAgKmrnzgRPaPAInmv
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/riscv/Kconfig | 44 +++++++++++++-------------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49793cf34eb..8a3af850597a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -647,48 +647,30 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool 64BIT && MMU
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1


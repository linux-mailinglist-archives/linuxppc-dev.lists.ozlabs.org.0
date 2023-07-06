Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005974A76D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:09:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rLVpv2bD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=p5GxBrtR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsgB4GTfz3d8J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=rLVpv2bD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=p5GxBrtR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbR1G6yz300N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:23 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LmtuE006562;
	Thu, 6 Jul 2023 22:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=rLVpv2bD3eZOyy1fvLElHm3JBqVbr+wuF22VMAGybavq05ALMKAFlpcWiLjVTvz3ZFpY
 Ri8bj2rNJDWza5/BvSrOxSXZf1H5YpyJheAqivmnMlZK1jQmNwDLSWRU/Vz7ThHeNDzJ
 jIoKxUKf7Az2Nj8day+LMHqAIihc9DOh82vYaO/Ahr+jFx3FAUAelOX17HB2Q9M+4Qjf
 ycZno7mgM1w1qtHJXCDGZvgsa/0MeafL4MsSAk68OdUTaUkb3fyaVgxBLa7TggnoIe7w
 HpzWgXQOlHkIbpRzixNgXmvPfKcZ+WxB+47pa8oGJ8NkKM6sJBQ4nAJmo9gVbKONzwJZ Jg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:08 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KPxtf024442;
	Thu, 6 Jul 2023 22:21:07 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak85bjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8QrZfbU3cCxZnD0SqoQwis7Wjl1dqoG4hdfm+eTzBbx0jTfc/CS9X86yj07d4+ISqF8YtGtbH8u5ORAKdrJa38ZwMjTiHC11SVrofwk3mlTF/zcpKC+vtYt/sZQYGspFBc39Wr2LTeSFqcyHe2IkKXxWr9NRt2r8cmyhnPRC5op2DfkchsY/WzNwBwOuoDrE+ezBz92xy9m7bS+CnnGyhf+sN/zyP/PQ6g6TCZyH9kjGwTchDPw7f8FSzS2icmVvUteQI9iou0BqTLAYdH1VqAAgEgA3ryDzO9o2jWKSYbpxFTYTTfvckoxW1n4wHjveNf7N1l8s2z5eNQ30JKJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=CSns2pZrGFEkUqn8VVrToSeaEpSbtgtduV8gTRy/E4NyQNFzLBUuAGosNh4+bpoiAOeQDeDpiMdJHakc7NdH0RSYK1+q5oRmXdQHn1UoTB9ddb3BiGA9bQw2xC5XSz9dtpof5VvrZpTnG7XtgZF4ak6udz1OHx1/Y85Dr3TkVgIW6ed5kD4OcqvNf0vQQ9KwU4Ne3j2AUyjzw1uKpAUnoaGegKwT55vxynJXMGXmmC3QB1zZ1NK5tojSMGaqxZIOuPz+TuZpXT5aBlTgBa+8kXTL1WtuH9+MukrF6T4HohPHZRk6+3hcvUZi05t+vMB8embNvfyfzsT78MDjiWey0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP/8WmoL1Ch0F9v4vcAvkFcEuG5JcGOdmP5VZig6xco=;
 b=p5GxBrtR4Pktlynwe9OgbA8RsGQkL+eIl4KQ0W4H2b1ucfh6JmjZaTLPfv8tK6qrCCSClqpunT1wVggd6BOErcwKk+hHvDGtrlM6KXT8mXzrpyjTWZuxSbdzdVyTxTK7Uv5FuG30OYHkTBvzwGR76/2cz3IvTV36ruutjjYmzhQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:03 +0000
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
Subject: [PATCH v5 08/13] mips/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:22 -0400
Message-Id: <20230706222027.189117-9-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0166.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 630a3584-0bfb-4e8a-34eb-08db7e6f4913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Tc8GjfnKiUnwjfUPg19jorkN9gAaE5IPDIjUVlL6jeir4xFpv3KRLdGDlUvAaEixreFlBZK8QeoYxnSIIJiiHHuaqJIafGOwtuc0Uqb8uB7B82V/CaF5B2bYI8tlAsh4BBJI9RIzX8smfa3FT7pKVCLjcXbN3Rrh3N0dmFEg1UhuZ3Ya4FkiDLtLhpCrnmTI9UYL+KZNNlDILrs1xcq9lZp/5GBzJUP27bNImF8ko0MN3V4vkvgDD7WPMJgX0os76v8hr9s73h5UQ/2JiIlfvKDNwOLMP6CBn6mboyoGPM+iQgsqk3pVivWBu88IDyy3+3SdNqjNY1gOJgQ6wecUOhWy76rSQQ5I6esQzAk2yYflU/4dtxfZ4KbeK1luxKwy5WcUfZ8Cx3QmS44FXfzKFKTC0oWW0bID6EGghgEXcHnVzVM4btqq23K+CN4Ek/JK94XpWhLuHfOCROXhpv8dmgBbJOQ4bn279S9zIJ2ZnK6i+LTEVEddnLEAuETWToaoglTYXa+4+EGA1yk2msg5ivHjJ3q9T/VONsCDrrmrH75ZyeG7OOHBd11uZWLP5hJk+FYHWLX5bOEACNJXPPih8MJKm08qZAW8AOakCKejxfI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3A41BYBaD0274mYHIG/z02QIE3RIEoRjGsYl3sWju1nUrcYM+fZYrmNIFgWM?=
 =?us-ascii?Q?FSFBkEk0OFKKkCPbJYg/+x/Lqoxmn5opZlKyCJ1o8ungUWsdDxGiXFJsTSkQ?=
 =?us-ascii?Q?t2Xujb85X1m0ONftwWi9KQ3/eErpIuX6Mdl17IEJm4tr2SM2/0QcXN8FNwcr?=
 =?us-ascii?Q?5En40BzWVdxkxIBUT9wqQdor/3cRA75hT82MOFS5yxxHOwVrsVqvG9PVWH5s?=
 =?us-ascii?Q?GrEWrk9m1S3BgmUFezOusXSSV6DrMYAwkDom69LJj4WsQs2xXcBmMe5SE829?=
 =?us-ascii?Q?AgtBoX4+oVMAJx35yrj6ASREfO68kEhsxcDX0Jgc2sALXBbYKMNw1Sd8xLEE?=
 =?us-ascii?Q?plFq1a+R8VSzIk1GVXv5iS9teE1a0Nf71I7C6QR5l3e8wbwt3jbkcHSs1VDH?=
 =?us-ascii?Q?To7uxrl7I6IHqozKjz9+gh+nc0xQjERzuQqrGoMsiFHpoEcahymBMlcoIxqM?=
 =?us-ascii?Q?uScTeO1i2rSOTbjHIRLrnVeHruF/RtRc607nm8JUkZxr8ih8Udrzz521SosT?=
 =?us-ascii?Q?DA3bVQBx77SH+oXBMLk6BWyB35yIA3iadq6hDICd1/rWXKOxfo7o9FWk5J0N?=
 =?us-ascii?Q?xd5W7oOYF67AAaZ5b9d2LR/aTeBJsgsFJBkgHgkP+mYpEVjk83P2Och4/z5B?=
 =?us-ascii?Q?6F8R6l/Ulil/eV5eIHes/XWDBmEzaEjBVVwGjt1x4e/O2EOUNLTLKi0W88N5?=
 =?us-ascii?Q?g7mRGuK8rwaFKvKlDKVXtaklB1FcqyZmVW1warUFz7Ig7TlV9av+udWOg8cw?=
 =?us-ascii?Q?OBW2OBLRop9uyzuY6nHz2r5pb2FIPXLPwW+g0R9ykgejDvd4QUxd4qi3DSLV?=
 =?us-ascii?Q?9H+PWUyxtw48xJMjOT9EdIoCdVZT10Av5Vdj83s6H6TRQm4VaEDTyknGz5zf?=
 =?us-ascii?Q?0TloPLlj3pvqnI0kZQKA1FnrBMo+u6qZosUYQZs59hOQR0aOmr5FgPuNLizi?=
 =?us-ascii?Q?+TTOjB1RqWnqq59c7x4dDhjuMLRl3kawz7DaNYSUVLaIbkss+6ps3z/cBxI3?=
 =?us-ascii?Q?+knDz/wdHZvI6QW6I1ZFmrNy3mLjVVmldTpaenBJTAbJefXa55npk5XMg/4x?=
 =?us-ascii?Q?x4AOGsb+b0CI4LvKVr53+cTcG6Sbd1TsOH/9RlikvMehRO7W7SrNkSxe5Qxz?=
 =?us-ascii?Q?hOYxi5olXTUOmgV+SwkdLBM7IzIyuqiwzVSXlEl/Y+hAgUUWI+4cnJA+l+5n?=
 =?us-ascii?Q?gwCVqBkMPjCO1gl9YT/dwNXsjupJoF6cYalt2GSEyCRV0rOcGon4qBSvel3c?=
 =?us-ascii?Q?G9QJGhf3PzFXHmWbrD3hmrAvoPG2R+BdEBt2fGBd/ZVWFXNPf6+fOu1q8sdW?=
 =?us-ascii?Q?VZOsT9nqcDoaVxuhPbqR148hBT4wHBhY0y11yZFYaG8Sg5mX2KdxP2EQwjtN?=
 =?us-ascii?Q?eaSL4ZXODdGfu74L+fHbCAbNF76evfvE8QtfqcokGlLKv3QdxJeV7xkww10l?=
 =?us-ascii?Q?HU4jokLx/FFyc7t2s1Eggx0L+Kfx1FKd9Kwf1hLpHdL8rdL2BjbTN6heTbJz?=
 =?us-ascii?Q?VTbmiiFxIWU/2MaJSY3OUjYiHxE2VQGZngnFpLTkyL8Zs57XPYzmsvRWYdzv?=
 =?us-ascii?Q?YGXbYEkja7SFxRnzNhPiFrOhk3cHlfeoG5xr/CAwbNqspFmGmI8LWT9+SRos?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?p/mMbMFGeSAqNeXW6N+9Jvjv8U8G0WdxAeO72kKAwPG+YtnFAcVScXFOA1G9?=
 =?us-ascii?Q?1nCedLJbN3aV1LgWdXWKQNVYsYNvem6MzukbKfWRUnYzotFFtOd7viRPyPWM?=
 =?us-ascii?Q?5y2/j6aQk7U1zixuxIZbiZ3ymN9Dqrb73JICkTZ11M2lz11gdANWv9A8JB6x?=
 =?us-ascii?Q?RdzibsrH9Kts79QRbKWnTb2LFe6hzpiIPtDdD+EqslrI9+7pkLFP3oZkHuJa?=
 =?us-ascii?Q?YCQkzBVRC+7AKPaAZeVcU7eaekU8uvcK7l+r9Wu8kqXdvafKLPJgPFceZy1S?=
 =?us-ascii?Q?ZTqalkz2q1EOHhxtf+vX1/lKPSgsaeAIWytDQI/DdbhYYEKBz9DbyE5pD/NY?=
 =?us-ascii?Q?Wp+/pOZR/MSBrYRH1AxLebsyzV5vupZPjc3zolVwdIn65zJj0WWzPZFoB4Cr?=
 =?us-ascii?Q?vYggU5mkVbwgPkkp97AAYXgcBKtOzx9aSqIawg0+43COaJiiGsUsf8rTVkK/?=
 =?us-ascii?Q?q0wttWZQ9QdkVKXHn90WBivYFkmAmaLWMZoXblt84foCtc7gJz7J+VQ+eEuq?=
 =?us-ascii?Q?cUaeu6RW+6xunNY9JcPCXd23V2EuqQXfBEt7zzTe2Igl62Bxk3AD2NrWe81k?=
 =?us-ascii?Q?av0fr0SfKnYDrmU2P5mUoYymfQVR5K8AjkgvHA2hgvlq5djivpxGytx6JPFV?=
 =?us-ascii?Q?lznAXID+mbzPepbsiroCbudNe/7LzFZ1Vge/ySAuHC+MNA8b4SrRlWO9mys7?=
 =?us-ascii?Q?jrGC9FlEsXitCm+RouA8hcRodI0o0tnha8aa+wRFCPE8xii85xV8MT3MBtxF?=
 =?us-ascii?Q?yKH5RUBSXdGiBe4Yi67Wxau74bcCmRFaBFx8fs8qY3nKRkHyCuYD/x+23r+d?=
 =?us-ascii?Q?Z5F3RMKDM6Y+xrgSWOAMaH+hci7ahr83FJ6qv3eDOCAFq9Oa83rqfB9IaNhT?=
 =?us-ascii?Q?ObAN9v4UTeP6jIqNR8WC5aiG9c6gPXjuA/XaQDdsyhacX8uO4iKKm68TZ/M4?=
 =?us-ascii?Q?d1QeuwANTJ47WLL6+KqNjbywuudc7868mWmZ5v5EpsMlQDLUKw669ymd1NzR?=
 =?us-ascii?Q?E+0Jrl5rVO2nTFgdmV1iFmFmj9QbZzU6852eBPUXZ5ynpywITxT2+2h0Gl/j?=
 =?us-ascii?Q?1Txh0DkOm3TcwC3OkT7rz/qOo01BYtJH7lNK9xPF7u2AXstg2rX9tIRTlQyC?=
 =?us-ascii?Q?jJVlfDSxV8PWhVghkzF39FWa35D0oW7Nf0H5Syenc4A5PdV2qrmuYnz1LIkX?=
 =?us-ascii?Q?ZDAY/nzoTGiTTrsMj4IfYYF0RYPh2Jvr2m3fCS+/Bt8IxLrlkY8eR2/oaqlH?=
 =?us-ascii?Q?yXFSsIuMTJe95jfVr/M/o3mjeMRGz8sorT2z2VT35g03MvA7eOLdX6Y5yh8a?=
 =?us-ascii?Q?IWEsztj70EB0j1BriSPa5R8QSf9ESQaDyaxokfg7uzLbEJno7HWZU/Jci86s?=
 =?us-ascii?Q?tEMvaMA+1oBS/kbsjltjHwIE91fzjL+ZEDpCp9i9+Il0oZXAmlwqxPde+p69?=
 =?us-ascii?Q?EO+FxE2anhZZJd/Kjio3IuDCcCeN8NeJVO9nBWu8GKcOBCMyGIUMQBj/c/W4?=
 =?us-ascii?Q?75+AAnR9w7GY/Wi2vmtKRQyEltuqZ1q2KMj18eqBFt0mU89txUmiGxejB7dX?=
 =?us-ascii?Q?h+FcNFEfd2M/FpyvaE0673/y+RbScFB3SoTKEXGWwOV7c8qJNKkaZeo2kYZT?=
 =?us-ascii?Q?dansdcacRa+jn7h6ayiUFX34i6hA+Gs90SuXruxqWqdxROY6CbN1dZxOAwtE?=
 =?us-ascii?Q?3RmBtZ7whNVHH0KfuYJNGc4Fyu2cdgIb8fyOkwMeV0sgQQesJEr3yaH+aDpi?=
 =?us-ascii?Q?YwTmFqqhftc+DyantOL/7RLHzidj+sH8Rc4dXTA2f5A5XDOjR0iuwFoL1hif?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	mFFwBOkDA6dsryFwMfc20LQZCRJX3/g6yVynN9UFsZ3qQlSYJyqv7GyzmGlpjWRcNbD1LuuzUhOQpyR2Z83a3QwUnTRUGdL8ogPG8Mj2lUxZMKJ+T7DKZje9X2/mAzhjMTNPhiJHTR6hnB4nS5CIGTGa7ZlD/Yp93UWPOBtAxGlxb0y8E3qbUXuIFpwo7UNhrpDzizd+AhXoWpNn6pYLxd1GcCwS5ijgRmclWnC/Z5thvK7p9kUhhdC7PkQOdlbY852z2GQVH35vSSWpnOHZN9H5LJDZbcSZYCe4gLx0yybAy1he/BBXU+RapVK4xaPWab26DOHu+OUAHeoCmK3lUcp/RkYu/cgKaUACFdFqvwm1rcXDZCAR5HU2u9X3SQuiUWkrcuUCbRWAb6vmSJVxJXZzmmNKPwNv8P08Zq7L3eHEe5s+8yP7JyeNwighJ8njhRFwl5+noYokDA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630a3584-0bfb-4e8a-34eb-08db7e6f4913
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:03.6959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y2uCqNjP/DqnoxNIuSPhruUwnPKcgoV6NR+vJ1qEQOeGFC+1iplcyYM9niaLFXnEhrmXCCppPwLqQu1M49TyfV/nfLcZ96BnEf2k8Jtoh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: c0CIrTHjitco280bhngIYriRa5NkyVPg
X-Proofpoint-GUID: c0CIrTHjitco280bhngIYriRa5NkyVPg
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
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc6fba925aea..bc8421859006 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2878,33 +2878,11 @@ config HZ
 config SCHED_HRTICK
 	def_bool HIGH_RES_TIMERS
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config CRASH_DUMP
-	bool "Kernel crash dumps"
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or firmware using
-	  PHYSICAL_START.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
-- 
2.31.1


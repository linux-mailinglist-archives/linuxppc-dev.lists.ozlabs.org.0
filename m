Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417A74A772
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:10:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hn18yEYL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vdeMy3rl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxshB2gbmz3clM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:10:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=hn18yEYL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=vdeMy3rl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbT6fzrz300N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:25 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LMXEM032031;
	Thu, 6 Jul 2023 22:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=hn18yEYLlTyMtK9BopT3VeBqxDKNPAythYM1hi0MZGEHuzbNzeD2JvgAsFtk75sjj/dI
 0S/pfBV5+/OXgnT4WsIOPq2LwPwVa0kcWeKELZw2d0GoA8s20BY37CA6uXR9fvlOWvfB
 sKypAPR+VEFEha8wKTVxHvDWAtmD2E8ouTFoLrkwruumShHAK6CwWi9Wjr66759XRM74
 Gkt0bpiI6nWnbtRKbrbXaYjC8WrE1jsAJvL1vKn/gkgNC1yeL5PycfnwBewRWZB8mQ5H
 b9g7318BAGI0qlZg2cVtM1TzZyL1JIacPITspCptOYPJuNpDBGFVwdtdWEFGvo/wf3ig 7Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:11 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KTuWH013430;
	Thu, 6 Jul 2023 22:21:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7phf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+IhoVxBLZMswBxbBAGcyAVJHw7aRlXVEw3xN6E15ztQ7NLdaIpuXRKFJM3mar/UEDy7arCkk3P6Ep97Lvo80HFRowAN/qNXCgO7V1OWy3rso8JxeqIieWkNcv1tfZGHmB2wn5x+UBPKcyrAIpBdQCuFt00p1DovIZwSb0woymFWtqXRmlXhgzdIYhBEmvbBf7MXZ7PGdp0E2NaXs0F/zN8S7rQ6ntY5iUTH/ZK7XF8Cug2hBLdA3kDvfk0JGqsQbb84muxqUDjG1nc95tpW5xDklHaULbATZwwb2S2IVnD0ZCgNmHAKban1VyeBsezfXYQoBQNmjv3WCi6I7zJETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=PT0yrr+snoXAugLDtWMUkpwwCnyx2cwKAu4HM9IPHuzqQX/Kv9y642gXZ0BM2HoN0K8ApvqWtslZJWV+KejKPiNx47RWiK3zStWw/4bN/3WS3a8bHXZN/2eXwqFKZrb0/CvzzxVksQKDEZngW/68G3jgt3DShyJupC8lzZY13PTv82rSnnceFNRjZPmIp1ygb5IGunwlGKm9Cy4OONsmikMkfjMu5JlClnnBw+PNMQ8193S94PRzPYv5g8R9BMrSKrDSl20FHG9hBFPKVC8Kc+65eB4LMIxJLocMkmk3QbPMGGf7E8qAGazTiIJpVEcmQYIB6zf1MwPS3mC3/tiinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=vdeMy3rlpvXmMbW3+j66HiT5UIyP1o2RixopMq22T34eCHIn7NMujKBNuFpklPgniw01PCk1y8n0MrvogHADG7yTVnBXvcTYJzJM/QuU/Q87PZfdydGi9Pn3MIdIqk8fCvakIsvwSPo4kS20CEnT5UJ5iNBajIUqwdkfUIt2Iu4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:06 +0000
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
Subject: [PATCH v5 09/13] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:23 -0400
Message-Id: <20230706222027.189117-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 028b2792-9abc-40c2-0c24-08db7e6f4ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4hiiUeGW6MT69GkYbtoTpe7Qf4Qo9ldHC7di1mRyphVoWxbseS1xz74hrkmX45LOy0uZH1ipv8+6rHynTrUiKz53NMv8+tfChrj/h60+19hjgJQQldKrN+PWQPVbIxT211tKz8wI4ro9kLL5v2yuEze6bxYFEwzc6ybB0FnmF7PcQ7Eim1f2AiUgLHX6aFLAiCb2GWhAArMFo+XtnxGiTlxEtZz7d6t2DZQrcGPRrg5iRwzt1C1A1yhxtesSc9z647VtR38fTKaQB6F0qCM7h9kk97ot7Fmjo/1vQZstdJVYo47OFm921pxbJTxt0XIjeV/AEqm6AyiVJxLrCvRi8B30HK6a/9D+p808eDTGwJ+aArThi6bnuB2qg44kkpufAaySRy/WSx3YEx98vnThnAP7zmGpktzdigZyl8snfRee1LsZ53m3zQXiDeUG51aQpgYvkjDhQcxr8Sf3QDe1NdavjkovDjub1d+SzL7xhO1wErU8t6MZuSoMrDtK55duo87uav9EXfCEEnlbJ+Lg51jkLftu7EZdAXHXoEwKMDNYVzwgkiJgxvbBW2FNiUdd8Wb4bTHlduIDNbvSw7Pa+k4q0AFclU2lm1YxH6JPdbE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4uQkL4O5e/ngsvroTrP3+VHI7lL0wZwuZxU4mA/CUyjcdmody4U0ZkpL+uMV?=
 =?us-ascii?Q?MfqsGdT8dodGrt1q81w5ETYA1GyyorjmZ56MIZNvQ0F4M5RU8ymi05ZImXgA?=
 =?us-ascii?Q?1ktjp44mQl/PGWnW0kXJzb3REHhTonNPOFCP7qv8j4JqTgTcjx6Z5rwT+mOg?=
 =?us-ascii?Q?FL2DrVnm5ZNFI7hKuul0i05uvgWAPt/OuDEY7HPpGndaIIJ26uR5nsaGFUBn?=
 =?us-ascii?Q?VHajv8nc9l1uGXLsharlRxZcrAmVGi6J6se87/SJcFsCIcLUKH4oKvpsqSu5?=
 =?us-ascii?Q?ttk84AAL9hHGjkbiqLG8/oYDyvfhgshMomYH/Jw/AZh6ZLY0IfI7kpD/IgAm?=
 =?us-ascii?Q?V8WYjoK0QCRYd8ZoJjRa5MkGeNt8HfnV4EGfpI1eWZ0qjSsJTu+jQFUVoTc9?=
 =?us-ascii?Q?1KrjhRJE17Uhd87VtA5KwEqtQwKMye64+zhwx2zfiku/VJyYquRHCiodMozA?=
 =?us-ascii?Q?RZ1vsDKFS7NvCd39k/T+js2k3+04d6gcpwT2nMQzcVNpjhw4xNj/bl4ZxwwR?=
 =?us-ascii?Q?2VUN2seaPFlSauL9j6uYPXRYF4eOMTMxmJAbZz8KdvEO7lWwww8yeH25JY9R?=
 =?us-ascii?Q?/oeQPG0uAdpgpQ4nNVnffq/7zzJxDd19Dlhl3oe+0FfziyX6ghsk8L8E8XUe?=
 =?us-ascii?Q?4FF5OmzigXv9J8ObGQgo3UYMSb7RGxb7JWjSsRuvf2QsMUubpHUr3mBKxl2V?=
 =?us-ascii?Q?g5e3dcKIssxPeWlzFCQYyLF4tue4YTVCkZZ3TrpEbZ7ivnHGQ2L+QpkIAfES?=
 =?us-ascii?Q?NXz6ck1fEYx4jAR8ViDvn/ehaSRGD/VWf9T2irKyWOVoVMOIV6J+9ij9y2UV?=
 =?us-ascii?Q?8fYyjwnv9pQd1cvMZHHixrp36XADRm4KBq4OveENJHPy9MT9cSLhIVGbS4fZ?=
 =?us-ascii?Q?b6CqZh+WDIGyMhnKWsRAxaXilJMPilAQpXDWCQtN5B3uaL/PcPkpFDccvfOs?=
 =?us-ascii?Q?6khGYynVLXFgFr77I8oeSqjy/TqjcQO3WUXhMGYJ8ripWPyUB+GFCFGz/evw?=
 =?us-ascii?Q?Us0KS6tzS3T9hVHUn4SqZ111gd+SZlDRwY/chuxpUZ1I3dTjmQJlxN7LVB2J?=
 =?us-ascii?Q?1yCCA7S+owziLZQW23+Y0v3pdQELlinu28fPmdlWbrHkq30v749EDDDv1tG7?=
 =?us-ascii?Q?Iir9pWXHEDrsW8dqDk8NhZCc10fi8pAuimTzeOua8rpYoLFqpqC9UzTdpDb2?=
 =?us-ascii?Q?vX1cY61Ly9g6tL90wGDUOpisoDouNRNAX3hdiENDkWWANWHxhxpf8rQlFjGM?=
 =?us-ascii?Q?gQNvKtE65qex1ORemQoq65l74IZphWHGL1wYHtSjctfo4IlmlnuK5N3gH8Z2?=
 =?us-ascii?Q?eD23pIGpC9OWHo7zN2Ca86tcQAGm70RNzTsgLDewmBYpO820FndyNtTddXgU?=
 =?us-ascii?Q?bj49mqoSPBu9SVDbvrRkYk3ksYWy4xm1SCV0Ahk7ish7Jn0wvBhcImsrPY+w?=
 =?us-ascii?Q?oHh3p7eM9blec1hbNhowCpg5IcJz9WFB19yr4nb9AisXxisEXOETh7iKN0q2?=
 =?us-ascii?Q?SjBxEqj5jQvkRFX9QNQ+z4ROiJEZuMF3ergOpAnJymzZN7hCHBJwqqgggZYM?=
 =?us-ascii?Q?IrLaOmkdui3+9IM+TlKxnw9bYzugtWWr8miKfL2qvpFpk0fYGNlG7cihKigd?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?lGQAIWIUIWoYEo8mWdfC7bV6yH7+xXk6/lxCDYODzxWnBGg38fDNdVgzVapu?=
 =?us-ascii?Q?GQN0A7BNJlcNCBfwCDAwc3swsmRep2wCGFmu7qsyWgp3292wR83YTQr2MTe0?=
 =?us-ascii?Q?b2j2cydeEuZytI+bk7DGuGa4OGrbpBRo464J3dXJswCtDTAqFHvbjWkX7chR?=
 =?us-ascii?Q?UAqRucxElcPhwJJZa++7ADZKXdVEgzZDOqzYxP/A4grKKYJIh+vbwOEMtM7b?=
 =?us-ascii?Q?hK1Xw/NeVE+Sl7zFRQcdxVE3QtUvBuhD9QpzTXXwq3NkiCHSBKknLjH/loSS?=
 =?us-ascii?Q?+9Zj1c1OFx5MLjw4wrZ+pIu3iPoMcmBkirhmqY/2vLnVerOnhaLZAOvN/AAT?=
 =?us-ascii?Q?KahrKe3bfagnixpkjiJZqQDEjRNpkJI4c3Ny/ZCwCyXLv5Xrv+NUnwWKtE9c?=
 =?us-ascii?Q?f67lIPJzzQ44GokiCzRFgi7RMzTJz+x6pe/xrDaaxuO8qAqEVpa4eHeHZDnK?=
 =?us-ascii?Q?ie/6dZa0IxKnbJD7i7BfFMVCwLteJjmGQioELlsLvGhlVmwlOnuAPTlLeAf9?=
 =?us-ascii?Q?wXSWT5Nxwx8PJWEwXZgUtxqAIn4gaFGqL9W2dmtp6EzfXnEzVo+ez+M81L4w?=
 =?us-ascii?Q?qodR2sdq8mkCsy55eo6qu47bwh9dk8cFrq95Gnu3/82rAvIbUoHKaGc6VUSf?=
 =?us-ascii?Q?XvfX3dEfk0hk/fgZ5ugzJoEWsi/TG+PahfctpnhbFCPy9dFQB/baT1F+btCS?=
 =?us-ascii?Q?UBfWKGia2cyJFM4b7i/PgRIXqBmFmqJBigJTsvCh6l8lVI40zHJoS24fdtdT?=
 =?us-ascii?Q?V0NMXVKqdSSDlK3QopMBXAvossNEl17JgreYbyA2Tfq5KYnhcL9vUfAza46u?=
 =?us-ascii?Q?cy9km19mnRER4v5v8ZZivW+u63JBxAoadpekO3OpoOrS5+VVkYOz8bMO6FGU?=
 =?us-ascii?Q?eVVGtXKiEfSY+KNE+SeotMXgO05KqjXWb8/TBJhZhuxgX8kJAKCUyWMCGSaB?=
 =?us-ascii?Q?Gu/xRlnob2l6lUPYCRtRYjLKI0byekIXcn/HbOdbi4OC1Zbwfa22IMAM8gJQ?=
 =?us-ascii?Q?IkX0Zv6btV2tX9GBKFFOlPOWCwfp7B8srHDoKGZSdhlQ4Oj9XJFyyYyVn1Nh?=
 =?us-ascii?Q?k6MjZt3fBaImxyIxiTePYYtIrz8Oe+usbSlRrSJQPMeZ+MNA81nMEfPukBYZ?=
 =?us-ascii?Q?iCwERB6mqaQgXXE/RChpID4mYqcNsnVEc+DdcUp6DKb7a+y+YU7bZ57C2XN0?=
 =?us-ascii?Q?skn7N2ZZ3YUbMeMg4RwYfoG0yjG+93fWMcYFYMF+bUrhTFI6UQgYUg60Lvev?=
 =?us-ascii?Q?8ooyEH36lCaB9UBIqypkDjJqLJ8Lzrhl7nUkyCjDuKkwj8f4e3coaMRXqC3f?=
 =?us-ascii?Q?gp8p/TUniJHNT1l2vt+cQLSWhCAxQSQwyCALxmA3MWzdfvawszEjNECzoX/F?=
 =?us-ascii?Q?279DwQdFVnhl3lYY3KAPwbVcyTqhMoEppDce5UDCLD5Dy9xWGcyi29HQDucY?=
 =?us-ascii?Q?VxjQGIilbksZqlU4pGYhgNQbPz+vUiI7ikEvpgF/Y3Q6rRtP3g1/aI1p/bHE?=
 =?us-ascii?Q?s106UeFUqCJkaHtnQ9SfxkWSTbFRX1t+8KTGCkxvPUGKcfry15rlQKKwRWxz?=
 =?us-ascii?Q?cYwNIFdsYhOvQublhj1RsgbOXFv33IfMeYWk9K8SOLhzB0cBjt0gHDthzRbd?=
 =?us-ascii?Q?EH30XOQYSN69wNT8M2gd00h0fzmSP8u6lEPnTUfpGuIlUyCgoLYj8t+StUJD?=
 =?us-ascii?Q?TuiwrJHs4XBYSUNwZJSVRTjuDiWOA7rBsHGnSXWbfLiv+PN9cL+RLTJpLWN5?=
 =?us-ascii?Q?mEZDzTtHvjZ8Zny0nxlsEGS6Qtt5RjQ2wY265Dr/nBF1ANvOlEg3dZ1AGbLB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	yinPCQDlVVpT1NkCsZR5zi6Y+3TJLa3lsJ3qBve0nWFX6eVFPVX62OX1vlcNyX41/I4O9OlKNHNFIUJGfiYNbitju+lapIWFICBmQpYWQuA82Vp8kkhCsp5F+i/EXToyC8nVs0oZdwE2g78fg8vVZ4HhBBAEjd7R1NDu8KfktZg9QBDrQrotf/Hgk7DEGjaN7LLcEmHb57SYmBP6W3tc9CslKzWV06bmUq6ie3DVmgmTmSKhE0zrnoulimPNxwqhncOasUlVJGCR06Hxx31TTK0Vfu9+Er43F6/juT5H6U9yxeQEDha3T2oYoJdSoDRQxJkyn+87ATfLpmiS/MHgIHkBacdrwMrae+a8/rhSr/YIGGw6Ccx+DPB/nRsII5S7Q5ZHKEk4JXX8uMt+Q4tBs3T34VYwL5K+Xaon0xq6psQv8RF8iL469KslPCPKNXMqITwp7/hlnoRgkg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028b2792-9abc-40c2-0c24-08db7e6f4ac5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:06.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdq52n2a3vnyUpPSXF4/TdMjgUbmP4Nu3XSiVLl7wJi7QMlbq+KuEB9ybTSt+d/5oHFPDez5B6Ioe5LQN4a2uri6zW0r0aqfAbaS511IMI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: vOmiy0H5P_j3DvrGKGKxYEe3zQA2XZFa
X-Proofpoint-GUID: vOmiy0H5P_j3DvrGKGKxYEe3zQA2XZFa
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
 arch/parisc/Kconfig | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4cb46d5c64a2..2ef6843aae60 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -339,29 +339,17 @@ config NR_CPUS
 	default "8" if 64BIT
 	default "16"
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  shutdown, so do not be surprised if this code does not
-	  initially work for you.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select KEXEC_ELF
-	help
-	  This enables the kexec_file_load() System call. This is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
 endmenu
 
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+
 source "drivers/parisc/Kconfig"
-- 
2.31.1


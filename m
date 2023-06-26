Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914D73EF6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:46:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=vR1sU0+5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YYBkAGIF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqky66h5Pz3ckB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=vR1sU0+5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YYBkAGIF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwg5L15z30fF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:27 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFnjii028755;
	Mon, 26 Jun 2023 16:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=vR1sU0+57SdCugbXqi6/NXnD7qK1YL65bpzheJiF3FXdFB6WjVoW8z/5eWRF1BNt5kF5
 Xn3sAcPzHQpnYg+WQfL80dl1KKs+6dQcCDaz1Uw1Yo8Dy/TLq1lZk8rslCce3F3McLis
 Xy0/FVIVLIGt3dEPJcornzSGs0vwxKdSbyHxB5PyAa5Yd0FciIDnuA48hqKqXAAQ2KBw
 FzslCWi6BN9dYHQ72qosPsoAizrL6RjKif8TrK2TwFRYy8vh9Awk+5Iyotn45H7Rifyt
 0+cNAF1cX5OcnrBci1L+/9B6wdl0FfBvMQgiJaRZzJgKGpetxHGzH0dSisMTdsquHDxh sA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rf40e182g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:12 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFkohs018965;
	Mon, 26 Jun 2023 16:14:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx3hqjg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io8kH5/B2CLaSohezjdtzzschtN95NSgj5CqWR7c+sxSqw11rXk1vFw2cbuXxkXidfMDwCwSgw3Ds3n0keQCm0bRUtYn3Xekt50+cwdGMmBx+vDqIiM/LO/G6yHhZ4VJI0gR6S8FYgmnYo4dUZ9DDN6MbRIP50Ti20+e+ta9rU28ddAwZ+OVKLcuYa98Xya91PH0RJOMiw82DV7DmsGzFHzKMcLKt1NvM8gX8uMO5XoVpDxV19XWLXIPCpEv/45pTsrmTsJBwemFMo9PJ0GsvIhqXu74+RLhMFitZFefqeTx8/ykAtETNYaGEOapb9mBcyIq1raNGi9I2m6F2zKoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=c0g0YTJHCIe9X+pWJJ/ikhBKof/wep8+5/zEvv8HXVfIoYWCYGPDa1Z1s2870BV2w1YV6q6Gj9J0xRBdeLeccOb+JY5HGagRLLUZrTwZsleKrb9hHq+eKTGKPFnQYuwf6xy+aTlyfkTYZ5sDE6cBVehoYoeRhmYk9z7pqSXIKaP9qMUaCPuR0lWx7uZDaErT9DrtPtbH+sY0jMH7D4DDmnZirYetQyWJa26CXE61OAzOYRPuAvPvvL1YXf+929fCTLHrr15Vb4QFiErab2F5pSIILqLjFQK7Bu4kpl2xeyeoONlv4qhI9Rvu824uBM6KewW+jOFboi/7gA+4wXhynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn3R/grqsaPCcCYwf07M9S5Z/0/TTWMljQwkxW1UH2I=;
 b=YYBkAGIFkmQ1JScr9SbB9nks5MI762GmDIYe7p/Xa700PBO5/RIlpNJJSs0JKTaenqB60yDNqyuvGSFo0HAmrWp4XZXvwb1Am3V10vzAFts/Z2ZqMINAhhCWcRgYXrjgAz3FnaX6eGzSnp8LOZdV9iOXS6+N4xAZ9vKfjipnZno=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:08 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:08 +0000
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
Subject: [PATCH v3 09/13] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:28 -0400
Message-Id: <20230626161332.183214-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:806:23::28) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f33f13-cc53-4d52-5149-08db76605eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WIPSGN1pLIBb+ZspmV/9mK2deJEqlv661kEv7zdimQ+yb4u50JIqXopxPTCtqRqjWDwp8tIUbwO9JHUdoXxsDINwl9+K6zpURZjjgpHYtHv0K+2Ad1vtXjUyZeVQliiQ9mS1Tu3p78T4CGuqWE0UIl/3p2Vk6uL1mNp+9Mhl8OBVVAN7lDiv4Q76JthtTBKkLITMxP8KN2NBxJvanLonqvZWu7Wd/UsUNONiufaPYujjn/PFJqw1S2fxheOUJ2vGMwDrzlQrjdMmoaeQFtAjynXfzriofFIr3L8Md6s6W0b8JrWJ4s1qoD7NUTLfFtZDQTCnSkWvGLeH42PS4xHQ3WuIyCP8bcqbmGE2Kc58O3jw5rYSpzvGZXv5V94rQfjw+Paxk+fYg1rcR5AQd8MmoiWSeQpq0OHdBHFJGAsclQA20CAeK9zlURl3L8vWGTDIIqMh1bR+G3vvm5p24HQXP68z1MPP9MuDLuieFjh5YAPU4xWGMXuvkHMJyEruRIPthgY0FvGeQdQ/ThAfDkOftsUCfAbpYP60h2qNhnBWpWKzu04dkNO0hrvY4UhoLaEUCcq60DCMYcgb3vCLeKKQvhoybnREtGCzLQXdzvS13ZM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(107886003)(38100700002)(6666004)(921005)(2616005)(83380400001)(6512007)(6506007)(1076003)(26005)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66946007)(4326008)(66476007)(66556008)(7406005)(7366002)(7416002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yzDf2f+gRw+yu3a+YPL51qGgpShTBSq71pbMCLRH7UKECvgMde935OHPXKbr?=
 =?us-ascii?Q?O8CkK0uvOUVKcttFruYk6V8QaEPpgPLX4Kw7lms64D9YY8VtaGXdYWNBzpzC?=
 =?us-ascii?Q?1mzLP+1XQJTsYdlPse/Ll6xlj2fdumxhC9Uzq5M8KqGhI515yRWoGQsC7PeI?=
 =?us-ascii?Q?jAiKJh/dDwI4FMTUlSvI1Xs0KK2rSRejMy+WVLjGDO5BKeV3J4XxDVcxYYyt?=
 =?us-ascii?Q?uCTjs/UmmNEmcUbUV5yx6V3qfibz8XRI5YZr40vwVUs05PiNJzC08a5VJGHa?=
 =?us-ascii?Q?dkOVt3oz+mgyoHLcNAk7fqxtv6H3kM6JaAjYM5Akj4ua+lrjP5UegJief4eq?=
 =?us-ascii?Q?AxCb26Z8Ox6BroDndb3EZRMq/bs/e8ynLnGGH66C45JK+HoCOOepw+ZyIiRr?=
 =?us-ascii?Q?cszezZFCdMcybahL9X6Vr70zDob7Wx84IjEyNmaVKt5OtDj95iPNvIO9hjgu?=
 =?us-ascii?Q?SGRSFcTX4NLFPuWDISaHAK8nAcaEgqrH1FzkTWKhvjWIpkF7qIdh0pvnrw1x?=
 =?us-ascii?Q?drBu7LONyQFPUjk19vxTnzEN6yOBtAmFJ/7OtceS9ynf4fxLLyxjvKWnnI0L?=
 =?us-ascii?Q?DjuFhz1c/xg9drqiurvQRWfZ9WLC/Pk+7NPA2ssWTa/HtkgrDfL4iGPqKkuS?=
 =?us-ascii?Q?ISmvrux7YqvruIRh6VrUtwemowI8GUB5zVo33BLxISy9qlzRN2UG7WBauoBR?=
 =?us-ascii?Q?L+OFFBTXfLzJlivG57HrQdwfPwuGSWjkXO9sl408p6xttvNsoOiWtMTSpitz?=
 =?us-ascii?Q?ICZNjd5NKJo3pSNYepR2IuhPf5ccoiuS83OlIbJS1JvSaoxZL+AgOTPqIlja?=
 =?us-ascii?Q?7HpACSANkuSuY5/8kCrS1aPKSOH7sD3vM784BiUucKdnOD2uB8KoT7gVfrqZ?=
 =?us-ascii?Q?iZboQX/RjGq9sbSt2ZNKWpUgJLCQmo7F7dtNCqdinqGt8cR0crFGAtotmokZ?=
 =?us-ascii?Q?W6icUNmo24fspgIVkWrctzsJKl85CO8uGox98Kf7iHdYYPi8Xs6Lf3yp2A7G?=
 =?us-ascii?Q?yJXcqurupjM2CZ76+yUwAS0JX2lExa+91/xgeYryhdrm8ANH0PHd98rYggK1?=
 =?us-ascii?Q?9FqbPGmEKEOCVbf1E47c9pQGYvfADEiw5y4ZoHrA1ueiazY8WB6wuyWBCj1m?=
 =?us-ascii?Q?BsLjUch5/t0UN4FPTc1413BfkgIu8ExR6/YMbf27cCJiqAOve+950npjvrZb?=
 =?us-ascii?Q?XuSTtOptcGhCuDo+7mZbTyEV60Ug20KVtceFaBbLcNG6T33pnnP1FRlA/2eu?=
 =?us-ascii?Q?LXwJp2UR0kHqp4z2zY56uPLtAs2PqKUrzyY/XPdhEPdhkS6O3Ydbk0AWsTt6?=
 =?us-ascii?Q?U810kuyEUbmixD2jtYzhZPX2zVO/3CP/37ehc/c5+Hd9ftSgVT8gbp7wNPld?=
 =?us-ascii?Q?2vhp2Fe1qANnZao0Kn6JoI4wn+FKBJnIG6JhoPyVPTNLLLzyMIo+Oum8micK?=
 =?us-ascii?Q?1tMVIiQXseY64G74vt/H/nBqL20wU+SllCtxp1hXadWXsf7xYpbuz1AX1aVV?=
 =?us-ascii?Q?juYiQ6sdQM6r0D4KS0ujWx/usIci8NBzznWzyMbx9Rpsklmuv7dQoWceppea?=
 =?us-ascii?Q?+UbWmd9s0J5oaGz5Et6CeDsNTxJPHAajs/oBxKpSPoCvHS7z397Im1gflQ5e?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?os4A8yYMPCOoUWfbrPqL1vhM7J5X0sKU7KmrW2OavrxMsKKlmgAkJRV1koJG?=
 =?us-ascii?Q?/5nlneesoTs/2JSSuwz678cFTyFEy8/CdjpM/qDN0kCz+Pew3pfwOkCt9iUc?=
 =?us-ascii?Q?Ea2pMPN3UBjNuu0uUlvimcRSoUfBCzzlrqcRsDZ8MFLAm1gu1mekB6lrAs7z?=
 =?us-ascii?Q?6rpfD5i3baS0vIxF2pW5Y1vBW+eXU7IsG6XSQpiobJLwx0vSfsU8dEIA1YTM?=
 =?us-ascii?Q?0cJmB7wlQDfIph7hmc43HyJPKwRTxku83SYYNkgzrjvcz3MR8FT2+LGuCy9O?=
 =?us-ascii?Q?mq07ps9NqdCYy4KiBSLsBKaUMvVRs4GBDHvWfGsgGiLHch7RrCi8P3n8ZuXi?=
 =?us-ascii?Q?8PD2y0SemrjFimGywEbU5wUuOIxka0sS4W3OtMOdDhx4mcks4AbEpJEaOJ4C?=
 =?us-ascii?Q?HRiFEfvfg9dL3/ajprB75qC+w+iNn7aX6M5QWZDvm+2esTb6v4opG02Z123Y?=
 =?us-ascii?Q?twiNTuwh7om/1Wdo5oN/txbsR26k9lnis5JD9AkE3a6adsIVxf1+s/t6IIT8?=
 =?us-ascii?Q?/GorRRucsXr8gY5bzwTGSjd7J4mcqrZrGSyGNz0DDobwPuvkqKZJOY8r8t4T?=
 =?us-ascii?Q?JT48jgIKgOKUuD0QHotUcRcLoLVoV5Mpkrl1NTyBmczQ8DurDt2SdXgGLII2?=
 =?us-ascii?Q?PMF1uJ+L0q521agv5JqC5iZT53Yb2sgNXVnuz0p6rteREl2E0Y7ax2mGcOV3?=
 =?us-ascii?Q?ExAk6qv2t/ysGSFc8846izYhMT9LiP/FxBIlPiPmngg6n0VE/pS1aRFNqbtL?=
 =?us-ascii?Q?VGtIwlUoDW6SnYgF4uY/5yWNm6z1xJPyey5lhn2nlAkntmRC+9achlMc6Dlm?=
 =?us-ascii?Q?t3m3CO25AxzYlDPsL+wYY5vPXhV9wi7RSUnVP1edpMnpog48LfEXZ4Qav26Z?=
 =?us-ascii?Q?8FShgT66UiK0YXFTLBwNeVGykXTSNtPIb4yFWDqDMjuDEYhhICOsg1M71grL?=
 =?us-ascii?Q?23YkTqap/ELqMgVE7kA2gWpppBM4/xHRWAWaxvRer4Nd4P/ekofbaH4zZg4r?=
 =?us-ascii?Q?Rol+7MsQzQQ0+72AulgpM+b2xQVHvSSIopcI3nNtp75Ue9C/dZLL2kF0FrZN?=
 =?us-ascii?Q?zRPr3iXnseJ2WSrvL+iUz1qA+3RE+HKxoieixbEHWZnMlg2HDh7b3pEWO+XG?=
 =?us-ascii?Q?WtBz2X+oX5OvggYAZB3p5A7YPGkE419v2IOK3TGQkYwcXQw4MdMJr/QTKmsQ?=
 =?us-ascii?Q?aOHhloWDy+XGbrjcTFw0HTcxrUXoq/VpNDnDtMedYMe2FUlydnmAqkyKCAX8?=
 =?us-ascii?Q?SIMXl2//T1i2Pnf8uO8/mSpNKPX9XawpucYMQhqevgtAFHWYadqieWq0b6Td?=
 =?us-ascii?Q?Op8p0Z3GI8sD3LgqjIMKUmtNDK9k6qMiGpUxtkU0NAte7XcWAb5wgSPnaxEc?=
 =?us-ascii?Q?w7J/IcocwF/lHJ5bERHMNwzt4YD/7+W1E1o+CTUmqvuNW9GnqKLQoeO7/3Ow?=
 =?us-ascii?Q?YQ9Wp7vJo9Y9GTfyPm+DBOaWtjzgv+HUQJbzxPIhW/WagknySUmoqLwhyugE?=
 =?us-ascii?Q?3l1g8E5jY+39fgkpkNOeJaaLequ2y/kndZb0ZBRbPjP/mCdScnj58DfAZj3g?=
 =?us-ascii?Q?tg7RL0x0uQybeWORKeZyIoYwwK8lW6e2Z0oq4gdSiFc/cAqy5N5o32JfQZuJ?=
 =?us-ascii?Q?K3BRxLTMQG+EF3RsHjp5FqNcQiH5Jkkgh7onIUoolE7q1UCL8SdYMCgZQxmd?=
 =?us-ascii?Q?3N0zlw4ZeLpJ/nsg3Thb3iubE1VuFxGmIssh3v93RF0p0MEUlH+rWb9oWtQ/?=
 =?us-ascii?Q?wJUL0tSPrgl/ZNMhvBipr3RIXa+KlodrbcgeiJs75DpybJAMXOILNoQWzzJe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	nffIwQdD0qTqeybK7SZkNQoRMpCXnNBGj+c8LnUDb86sTeBfZb+KVM1JH9UqoarZYIFUvbrvJzt/lUGvfTPcBriy7NwirK2LFJOtztdSDAqwPOW3GqssFayPpt7sBDh95sxVwbrBHG1AHjERUpbO/UmOb/7/Ftco+fEoGFJRDHgvaklvv7O1I28WuIIg6Cp58iZH7k3UA6rBS2Tdup2fFbpxVIUSIV+Wm6B4d+EiOTGZT4dKayvDE8GL0sJ8dCjpb90hF6CNsSlBBZiaM6b1LiVN9T+KtDDMeA70dEfhLvlXP+CdJo9sVY4SYv1sdAM6xjzSTKcddUOs72ORvjrvAwJv3da1ecqkEZZAmxoXdzjU16ZcK9A6C74daZF6biHemJie4JbHzYKmjAqXVu3dcOyvHLbTS4wBt2rv4uLUCVDh4MeEXCZc3mw7Abv1EdG2kyNX6f3pa+mksQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f33f13-cc53-4d52-5149-08db76605eb0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:08.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqzKGUKS22apxB1Ay9hqtR2eENzmX4akfQiGaEadlyl0BeRJPZf0GlKsbpo8fF6fEKjC/yKTp1eqTXr3V5QNF2bH/SEkPI5JD7IoUAdzMRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: WAFmLQWpmQNesZFg1SAs1RJB8-0k7oBJ
X-Proofpoint-ORIG-GUID: WAFmLQWpmQNesZFg1SAs1RJB8-0k7oBJ
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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
index 967bde65dd0e..8de24bc503aa 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -348,29 +348,17 @@ config NR_CPUS
 	default "4" if 64BIT
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


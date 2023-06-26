Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64973EF60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:39:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=K7VopIjw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mKnsdL63;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkp36Fcxz3bYt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=K7VopIjw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mKnsdL63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ104Yz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QBO28k012807;
	Mon, 26 Jun 2023 16:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=BP+nnpZ0VsUOy61AgGM4CuBFLx2zOriGSwFrVcTjWdM=;
 b=K7VopIjwUPNfvXGRbrlcCGXQwjssEoGDoYe2BmC4lWgTOUVgRZxKO2deogOywZGkgGrl
 /hoSKK2YbZDgTwuC+DDm1uYlNxdo7qDU0KHowkCSNnunSVB9gQRsHeSDdYATKVY6JERM
 lzaSaAhhKNTZYfUt+DlMDl1M1uJlFp5DYAoZmKDA8oJPj7XDMOdXSs9Epr0rLbkY2T4L
 c8Cobjp3FpkpGZ57iSdHxpaDPAeD85sxMTJObEA3jvKUmmCTlY13vG7OYm2UDersz1V9
 FRmLXWgcr5k6giggR6RYLezhB8O/kdkPOwWYBhPtYv/2xhl34SaU7xEksGaQ2gjeFFn6 MA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdpwdb2w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:49 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFGIIb005121;
	Mon, 26 Jun 2023 16:13:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx9a8sk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRTe/dt+8UN2kqMow0yxNB+DwKkCe6WsB2LCd0Y62Obprytvb1K5aL7mC1MPunAdJRx2OBabhWSf/27iS3FnSKuw8KEqat2JgUtj8LpHmThjp6k8HjtJJLlFjQDXJ0satPI42URTfBB4a+2GnP4Zjk231zzIAZ1HHuSccdMfKDcbhFPICvyZ/tuRMYQ8DkApAGO0ybUZ39xpNqRqs9gPSyMFXp58+1Polg7dy+IMkXuuuPf1Reb9diu3wP5LI6nA2S+NmL6cVjatF7laPRz0hZ7oEdLBarfP7+1ktOjWs3gxhcDLiGgFbqnFr9YmCRBr4QPsydlNK7zWRyX7tXbtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP+nnpZ0VsUOy61AgGM4CuBFLx2zOriGSwFrVcTjWdM=;
 b=MWi+FaUtqSZ6LCBgcwhMd+0C/8IblTlbrYYZTJ15ac63ZKvaATLy9+6HO0gPIb0sC6H7+Uu0A5cUXgpyzFMYw+CUD1CmIW7Zx4k+IlMkiswFm0WSgj9FC68+7IAsG/8YnGBGYzC7zbrnVjyHd3IFT99M3eF85fF3FB1xcCZ4ZvVHFQix7EUg+pLzVExRdGKSVPCiLaYLw0RvmWeNfCpV7xaEseukkmUjAbYyxLA06Lg8ElB6PmRuomDEhrbLEFqncNbeBtLqDex+fVPj5hr+IJpiPChl+oZtqHZALuG79p/ojDQIBOpPnnzvt+5eZI8k6tw7p06mSKs2MqvjOF0CmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP+nnpZ0VsUOy61AgGM4CuBFLx2zOriGSwFrVcTjWdM=;
 b=mKnsdL63OhX1FiNfFSbvQYHrZiTrWZaUZwFzEfiE5S0U9r+UEQfBDDc0ULee7tGhbEUhjQkn2+9DPQC1cMWvuLvJJpmMx4EWDWCSOw+F78X8s0IQmTIACzuSkFjwS6+Dt7K/z0xOZxoJGSVbnNDO/GLdLE0c6136JlPSdFvHpD4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS7PR10MB7178.namprd10.prod.outlook.com (2603:10b6:8:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:44 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:44 +0000
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
Subject: [PATCH v3 01/13] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:20 -0400
Message-Id: <20230626161332.183214-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:806:125::32) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS7PR10MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: a02534ed-3359-4c3e-f167-08db766050b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wDNFaSDm4IrEOpLtFHstYrEAxBUyKJxeO23JuCM4p4mdVbn9US4E2djBrOL6rKO+JNbamKZgRIk+1zN0a5NNwNqz+yVsUWs9GeE/3IFBsaf7KQQXWaiO0sDeO1Q0BnV8zMaWS2zZYGblOy2ZsFofoDUa4keiQ+HyIw/S+nZ5s2GkVtKjK03bgMygv0F4G1U45LwPPPI9PDaJnu5xsXhNeVC4yzbF7Q94IUaDBhOXr2ijxAEBjJZy2WoLI9y2G86W/W3WZ2KXHfcCBsocsS2pybAX9dWteDgDnD+LXGRvZVDZIgia8QSZkpCZxgjCOKyvc4vo0IOB/vFwOO8s/0PnWpr/DGlMK8Klz3UwKVspP/785dE8pkFMZkELy9IK36c9CftGfszUa8TqrM8V32fofmziRs5uPvz5rjkvBbjeXHguZ7yGVTCdOs0HCXPZvnp/Y7UdG4Mcq9kCpZRAmOgdKZgk1XPC/9tXQDNrz+k+6BapVmCsU5zCyN7CCofv806ypG9RNxXaCzox6bT90iDDie7kGpVVfjUigpket6h0oYtqzN6WcD2gHYWnOIByKKviFHJ1TDbycmeZSnsCMeWCh7AlUMEwnkhELwPsjJocl+4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199021)(107886003)(6486002)(478600001)(2616005)(83380400001)(6666004)(26005)(6512007)(1076003)(6506007)(186003)(2906002)(5660300002)(7406005)(7366002)(7416002)(36756003)(921005)(38100700002)(4326008)(66946007)(316002)(8936002)(8676002)(41300700001)(86362001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Lz+f34bqtwNsHDlG70GG/2w1/ffyRFsHIwCYaFsj+L9dGEJWWPgqok9f1zH9?=
 =?us-ascii?Q?RneYS7cGDqjcPLDu7yTtjLkAIurT7c3VUivIQrmIh2y4XDM3yWzXX/vgneFE?=
 =?us-ascii?Q?BtIHHGVKeDgwE6CiODa7HVi+jWMs/yNtE35rodB5fMFDwWuVUzo+opgs0G6H?=
 =?us-ascii?Q?bJl6SWfTQ4HVHOrtoi8/BRge4/Xtc0Wi0PJttCkjKb5xC6W1E0KQlJwOW1TN?=
 =?us-ascii?Q?3e98L8hcmDZPREYv1OD8YtE+JdEcve2eekks1KpdSJtQOKTTQllHvsc+1ZOZ?=
 =?us-ascii?Q?RdXTZAU4DKjaf7pWyGZBExJTrfHkZXqA5M8/QHBJOj2RkAQmWjFI4YKF8LLK?=
 =?us-ascii?Q?QqKeC869ENr0AErQws3fNNFABo8RMzciL3bL9fXADoAlS92Ez29efCwpcLFk?=
 =?us-ascii?Q?n1r//uFKzTezpgWuG0TanRPqMUsbXKi6/YvkAg7hR5sWhH7aTrZhGOHbV6xt?=
 =?us-ascii?Q?gqDhqFIBfK+W9IW0XyWYc73t59hWkVMLRq8f/ywBzyCzYpk7K/IF6vMiYoS4?=
 =?us-ascii?Q?9uV4dtXVYqQvheqHwU1FNYma3nsvyShXxnLo5A/PWKadiu+3UMA9/mspyOA1?=
 =?us-ascii?Q?MVgzYh+lOy3b+pbfGIbLC64xVtkXIvSJtMvmzSnSP01jjYOCH0N7hYslthqN?=
 =?us-ascii?Q?fVdNgEUx+Vp1CYq3kxMhuPiIjE/1xMgySq+ikz1Pj8UTtK31rwBX564yveJf?=
 =?us-ascii?Q?e5MYTSHOTAHC8Yta0sd0lJEG551YlIUECzA8ZUqPI75xOtUwgygdsFoDRMbN?=
 =?us-ascii?Q?g7S1hpTJKRGvJP4HeLQI9zu5Ar04gShH9H6dzutcU3QWGp9SugWgInIg0SRV?=
 =?us-ascii?Q?mJMeH1UJv3z81pTxgFSJpxhimj35Dug584IcTojMXaHIA6OfkCirX+mTxNMu?=
 =?us-ascii?Q?EatDNWBjiEofeUXX2QvjfL0Qn+YpKR9ZFZ/X3IIgS9aPAHeUWwcLQatkhq6y?=
 =?us-ascii?Q?ngQq9EVDN9NY2T3RxQYf+awRRWKN9UfEaFSTaCv8TLFzjDFU5VbOSWOlQsmu?=
 =?us-ascii?Q?sXV8zvGawMHu60VrCfMUe9yC/lLtlYC3wpdClU3XLbSbjr8X+MZmPIDEgiDP?=
 =?us-ascii?Q?S2YMTKTT8XOClzcxgekjLBJdBJDIypCJXbviz6CYCUx+xRJxOyFnc+PdqDv+?=
 =?us-ascii?Q?nhp+vWejSQ+L6oe4CcpDGUtzTkJ69oy3ZLBOhs15Wjg1lFBHSVzZzYnyi9fG?=
 =?us-ascii?Q?9Bz+nS3FIXaOK5aGjYKLClYvrn+7PufzUleqf0CCUVcZFpSwSNbHH20ahwYm?=
 =?us-ascii?Q?17ABAIzlRVYu/MY8/TE2f5ltXwaSSgMf0fecDVDBCce/vw9tEXZB3TtcFAI6?=
 =?us-ascii?Q?P2qcv6ndTJy+OTaFbOk0lThy1kZsbjroEGJ9wsluAHGzP+hzPz1QChvoOzJO?=
 =?us-ascii?Q?iBFpaDOHLRDbDOkl0022Me4zBRdAYxCLo4TNx54asJ4d5708wTOUXjTO7nEo?=
 =?us-ascii?Q?/yK6HAYzHBuFymawhfmDkII2HpBw123TRfGw/sSWYNnGbhC726NW5DPNQnGb?=
 =?us-ascii?Q?k6y9KwgEOrLXIx91KWKIa1Vyyqm300wjk3wkZJluS18FYs4cC0A/cv6HFqnK?=
 =?us-ascii?Q?nQNOSHBmUpQvPB/9cWyE6qeKmwrALazdUVAOwMTuNmM7fZQeay0qeeoqD+R1?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?RMIlaiI9fhlSjlBkCSUHSF9nqjsjv5+XlbxlfIqzzSOq/uPWmSQNFoQKrAXG?=
 =?us-ascii?Q?R+jJaGtTjUSvjYBlDF32B6QbXXknjG16Fvy1XxZvqNWlD1JVKoGZHc7faVgp?=
 =?us-ascii?Q?L87At7k3zZ8E0dIChZvHmUvt7XTA92toa75FGGFDeUb7+wEjByUQpesSUPuj?=
 =?us-ascii?Q?HPBlE3dKubWlSKWBYx3qGsg/2RajVnk6mdWuSnse7Q+9lVJJDn3vNHwcMq51?=
 =?us-ascii?Q?32S4v12tk39h22vbAlfe7zYsTVkTiN4s7Ne0Wnp19DhKs03+ufaJdS+sWLO5?=
 =?us-ascii?Q?EbSv53QHY6N1HbzQFb6qMTHFSSWTMShn2WjHCV0QosVOQ+D5lztnidt0NLpR?=
 =?us-ascii?Q?pT0RPKN5vSwDKB9QiuvB6KfFqUMoe6dOlxkXE4E56GdUqtiMeipZvoh0hX8i?=
 =?us-ascii?Q?SX8RBxi5T8EOmWOFHZOfhSHIS09AF8zMzBIVMBfQ8JbRckJechDOpeY4AlIz?=
 =?us-ascii?Q?VNpYuqA3mZKE8+8+1jA64leqYCmAo6vfiiEX6/ZNTL9ckdKCw7F6yDbdPfsM?=
 =?us-ascii?Q?M8ACjAXYx++60uA3dlDKa20x/En+FndMS3KhZYi2OFw8AmbXYtZ/mcwPnH7s?=
 =?us-ascii?Q?GEOIgLU3XsV1pYYQw6aB156fRBV4nrQ4xqlNEe1UbK4eY5MhjrUuPUQ9/kD9?=
 =?us-ascii?Q?oPGTwCtE0v/xyO+OBO9uMf/7Qoro1YLvLPVFzNdOwSn8dXmC1jFzXyU9nhYk?=
 =?us-ascii?Q?aSxgxbnfQYa4MVDt26qt42Z5Wz57MIO4BDjsJd5cAK190xxbjVRX1xsGNWpS?=
 =?us-ascii?Q?+tk4/3OTZQKJqrcwFuaC2c2JV4KXfvOMlo641kn/LxTnTPPh+FjwO+g5rhpV?=
 =?us-ascii?Q?XEz7QLY84YAkhZLVLxItbt+q81MDbKSG7tui4tNNYbr6MeNDwlhrqLuzzsIj?=
 =?us-ascii?Q?SG5vSIqYvEpW/9Nr+I0JhGnGSt+iFhuw59UgXYX9yrCPMMBhn+QKBqKeUYAM?=
 =?us-ascii?Q?OA6+MCQZl8J8ii/cSs/n5YfJtAtRk0C834TMvbq/MC30TQoumrObe/SHn81Y?=
 =?us-ascii?Q?/ue1uWYNJ4os5gJ0kvx1A/tCq/vmrQQepNpfLjvxFHUrYoV+fiJt6Ljw8RB6?=
 =?us-ascii?Q?DGRwzgSLPy1vEKpiSgLHofgOU/LIy+19Hg8BwjcFmXOCnbczOyQuh02Z5Au6?=
 =?us-ascii?Q?5Ca6AHdFB0XMt4w07ulAI92Gwqcrx063eWpYy4lN3SmbBl6eUZy9walA05tv?=
 =?us-ascii?Q?cdkw+ygH/GoS3OFeXP83SSpNwgmphkitfbbPmYwYJHcKY3nNZHq0P2QOoMBp?=
 =?us-ascii?Q?XECfngiXqkW6kNLMtYaAhFxa+T7+n0yHqwoA0AkgfrUHaivoY1JwgbtgzCwE?=
 =?us-ascii?Q?nBAssJAYpygRZrwYh0RnRpcCJFYaYsmjYXvKCYkrHzp1xQQOYSNCwOijMGd7?=
 =?us-ascii?Q?tXidKVQNShpssr3yqm+AsUBG8eoAtibXVeRI5lgwDn77NjMRgpT/wjwMtxXt?=
 =?us-ascii?Q?cNHj8ZavoCqZTeCpwRR01mDXdimIblqtAs0EYz8+ElyZaJ+2RyDSZQVD2DoT?=
 =?us-ascii?Q?h6kvaJNzMaJlyc3SdGezdsmHKVFfbrGtView9ltQo9lREBtJDPghUbwrBn71?=
 =?us-ascii?Q?1ixxbw8i8rivwJx5qvSS485DEAPWpcQDLZzVB/m/3kVYtDmpVOJ3Qj6UflZC?=
 =?us-ascii?Q?6bDE9oNyqkbBmtVoQz5rtg+ZapihIcpSwPJGlw8c2YxtfRHZ9TVIkFi7rtfL?=
 =?us-ascii?Q?wy+AI43heTTgFLgkt83UeVLQyN+sTwegay/F5aSINKigi7FmVkMiwUTDROAL?=
 =?us-ascii?Q?k5KWy20adQzJEsJ/uAFxXDbkXmuPGZqDtF6St1luxnF2E93up5qU+CV0ktYx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	v1g91gwDi2E2gFwrrykxvzrZ8x/vRJ+MSuxKDjkByC3kkIYVTLdPMiDmi2qrt7LS3puqipNaI5/gbBn57c4Aa4q4SMtPkcA20gGujqtuusevUB79/z536I6smgY+Yin1PeDZJkqJfEf9MzZHV5FWjERCluCeJpGoKWBvO9ZnxTHzjot/38V2mUl3hF6tCodgcmDmGInojNVdNMuYaBEsMCdKcJQjlXy3pBfd/H5jireeVvV6msSlC8+BdZFSwGuRQB/9E2TOKK/Xh5BGpJp+jy1FF05eTSgYCi8L2Q/3/KD3deANydOlJA5vxkghIro8T86OZpOJbBZDc66khriVh0Mc9KxYxU7vUfOGSGAz+xBMnNBjiQjuSICeih78Ua++2izTJb42NZ8fU0Yz0coi1fXLJXJ44LmL9o9WPxCev/9nNPXrUyERVJrYiwVpmsAfc0xqMoUy4+EseA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02534ed-3359-4c3e-f167-08db766050b3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:44.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2dnT+oDNwBrQdEOf3zttQQxGYvzLmgENeVZPt5SNmeXC/gGHkDLSO4NR4HhdiBhT+jWD9fdwyjAN3uKLbjxsAYKetOWO7rcZfjqeao8tNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: 9jSyXWvB-IJ2d6eaV4tl7MDKo4CRhxTQ
X-Proofpoint-ORIG-GUID: 9jSyXWvB-IJ2d6eaV4tl7MDKo4CRhxTQ
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

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling". All the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated in the new submenu.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_SUPPORTS_<option> config options.

Architectures can utilize the new ARCH_SELECTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 -----
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 110 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index 205fd23e0cad..a37730679730 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index 32c24950c4ce..4424447e23a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1917,6 +1917,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..5d576ddfd999
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_SUPPORTS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel. It is like a reboot
+	  but it is independent of the system firmware. And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you. As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_SUPPORTS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by kexec system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE
+	help
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image. The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_IMAGE_VERIFY_SIG
+	bool "Enable Image signature verification support"
+	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on EFI && SIGNED_PE_FILE_VERIFICATION
+	help
+	  Enable Image signature verification support.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on KEXEC && HIBERNATION
+	depends on ARCH_SUPPORTS_KEXEC_JUMP
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_SUPPORTS_CRASH_DUMP
+	select KEXEC_CORE
+	select CRASH_CORE
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1


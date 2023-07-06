Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572F74A76B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:08:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0bV/Fv1P;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VpsRGjYm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsdC2C4gz3cmr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:07:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0bV/Fv1P;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VpsRGjYm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbK59TRz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:17 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LMMgV031902;
	Thu, 6 Jul 2023 22:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=0bV/Fv1PPJRY5u+DyuowfemxM7F6dP5oZvPWlc5Hp8Q7NmHNYKe3aqYIqydVy+0TVAVd
 uQ1i3XQuKStYq3+JcLDN4/lncRIlz3UW9abj0zO2jkkry688sXtUuD/FCN/7s5S1Yn0q
 W/Uwc0j7g8ZVAW0WeiMCeyQDTOo/0icbC1fP+n2MWALPVIoZqPlrM6wAOptlIphfg515
 MDh4Op7995EqyqN//OfRsQFSzjnnj9YJnj9dOlD5lNguxRwxXYPy9sIL2038/xcFM4Ka
 XJTKkWq2HXvOE4wNBDyB6FuQD/I6cZNuRoP4UfNxuEVIMSvPgf2ApVHBShoGXOb4Q2lN fw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:01 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KXVNZ001674;
	Thu, 6 Jul 2023 22:21:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakdnham-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U66eBiIlSr8Vx9p2ikDgxBj02bKgNvj82BpaqdUs7iTxiB0WosdGokjEedbbvguXBB5eJXLSEPl5epfV6SLdKD0PuAeJwRFpbysp3KRXTjtTG1meac/igYbqVVwr2LQTYwAT9PDV8YxP0egIP65tVu+GpjKn2FxAL/gUDnSMS64mc5aR37Hc8O2e88q2pEUj8ROL58D55sgEDd3Z4t4WR/KA/fiEPkiCA0KBzDdHWODHTDAZioiouSpRamdehe2wSizlX5HR/vVy9yeu09lXr08mlDkVvyAR3JXSpCf5oWfBycRGYcaOmLdCX6ve8+/T7WWMPZzGw1LNKe/WxUHaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=X2c3Kj5ZyDPlBMmUUs43ikrNnbNHy6ip5yl4OxOZ8zwuaKlxTHFOYyo5bB7zPKGcIQoMMnjLZN14gyoYJv2INFybrlW4+LoH14hdRi2r/zwb7GKv2dhePdYRwUIlCBjC5AcCsmslvf6R+NlmT85IyJpjr1GVjrrQ1RjxaeoSwfqL5tMtd0NgLhMsIpNxAW/V5Y2IWZEvv3EB9bBCsLprkA1AcbI2yfBCT1E181XT34UrTKpI+P0PK3o3nwB/P4zPbG+CIj109RqHzbfo+6PFZm7sZFe53dDVEGnsFUSrk8pvOqunbdBj3igO8j9yvzzPAcrohoVxpTZGO0rTkyNNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=VpsRGjYmDTmDsIUS+M0Z79sDxxrPySmXlFQq+f/29+GGyv+jGN6nuie6noPFlUzV9vFcxHWMNaCrxrbVOsT9PNNZo6Y+liXrHYLHEmxI8D4drtJZWDusTSYG+wOW/IW5gm6GrBu9n8oFVjNify9tjxy6eHHWQs/ijnTXoG4G2no=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:58 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:58 +0000
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
Subject: [PATCH v5 06/13] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:20 -0400
Message-Id: <20230706222027.189117-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:806:f2::11) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 41404010-816f-4f81-fdba-08db7e6f45a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	92GgttIzCV6XqMJqprvsVbpi3vUs3dnshll01TmM48njFQq+TU9H+AjE1/C/k17FbpiNB0l3cpeTA1/K+6NYjxlyNHQa84Q8DbqNq8XRd5bo6rhKT4bFSgrj8Lxn635FZLotURO3R7I9zOJf/BrPNUd6LbYaAldxTpW86i4BwTSL/kS5+H63MoE3K7EJD7eSst5zny1qyQqnkCWQJWceC5AHFWcQYWLuJ08oXlMzPxUC7uyj8uj6QL6p3F8OIIXmywxzjt1G4N7HMUM6KdrSxzHrogqwcysqU7fintWbboedMZO9flxrRQBoSvsq/ElEYgb6d6aMFpgyihTQDHTY4G+9qPu/XZArE4M5ERgGe/0rD2Rp15vuQf0QJWsxdtNj9V1iWBRR+PJBEDtQP5AsMZMV+LC3zdDg/VpffUBgUEcX+ZNJDm+Rt5qmzK6U8UlJuHZgZtvUwb9SK21hsTT47EWpvR0WLRWOAVKNuh2Yca8m/BgV0R5mT0/Tlyu61WkaPr8Z/wQCzNLEaXv5rWxq1OT3+Z8+tCLg5N2cqUrQzyK7R7B6OlKbnSwDVKLngQD4gZ3GDPI0H9me/xhZcYlC9t8K8R5y/6tfYEmbn0DBKNE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ianUEhZIE/Ti5ip5EaHVCPWeX/IoVxlgxNSNfOTuUy95ZOKZneYdqFgNq5Vi?=
 =?us-ascii?Q?zYy39cMf8UTcJTJxiiBxAbztZYX6arpEusRxRc9SIBM151JvSyQWfxAzGi3m?=
 =?us-ascii?Q?0+uZEqQO4mVvGBFvilcYvJnqVDw2kFgdaAVAWgMKUPFHz+ODUdVG8rQYMtrv?=
 =?us-ascii?Q?liTFN/9Cxp/o4HKasbClOJFbq98Z+pE0qCd5Peh7pUSJ7nlYmnrErzId2Mx9?=
 =?us-ascii?Q?aUnrpPO+ww6b0eL9P4MkAyx9EhrndqiUIW93nP63PyJPwyQnvbi2oPNbfAJz?=
 =?us-ascii?Q?k5KuTQUwwDa6q1zzvwh8CiFIKKn8oiuUZ7XI9e/sCs1SC/X4C2LWPcBIyLCq?=
 =?us-ascii?Q?KkZeQOTn/uUusTGAV2dXYIlMN2Rhr2NWTrnZQmzb7YSOrqCi9PPsr4vBY5WV?=
 =?us-ascii?Q?gFF7O/ziCBPh9ylkzrzuUZsKdO0PZnhfc4zL2PAFabuDuNRXvkNpxHqgsTh2?=
 =?us-ascii?Q?lsUwzaDGSJYMk5vFFZRA+FRuwhXsPyQWmdFsyUj8qZ0mKpYHiNgUFNFuY1WC?=
 =?us-ascii?Q?aa4s9Ly8j5ZvxVWo7mG0n5Qe7I+AZEzL056czZOOow089UFhx5v6Hcl/Hkmo?=
 =?us-ascii?Q?aOeoRNT9PkcnkDfTEK8lLh/zVX6L0nnlUHa4JG3JQYf5ISv9byOelFYnnaNB?=
 =?us-ascii?Q?VJ8bNsRsJwB7T8my01aDwM2Fq3AMtXwUCIqPBA+kUwI/qDWhTspbQvNNcFdB?=
 =?us-ascii?Q?d4qUtDpSXgqkLYlBtlAbQ3B28PL/4SLLgwFqO85epVLDO+ie929a50mVsdyX?=
 =?us-ascii?Q?cQBmUdBMRDcEpcRAFmCbPC4VQs8Mgif3iO4XFfR5BxX4vK30/znXHj5ql1ps?=
 =?us-ascii?Q?CquJeEY9U0WHeccFw1au3YHAjH8NYLmkWt2Lmym2P7ye9LxWKp8SgACAYDKL?=
 =?us-ascii?Q?pH1Dj48/4xrvBZF8SN2hPCaqd4QXFVlXmosmLgzi1gLLfX/vDaGzgYZ400gI?=
 =?us-ascii?Q?UcAaKcTHikP99/63lu3uoYUwSIUL7ndvPDYNLDx0WztOjMg8sYbr/SpWMxnG?=
 =?us-ascii?Q?DE1dmcysEyWS4vyAT7Ms4VqQ8njhi/NWpj+D56NOf/1seWujgal8Ywexhxak?=
 =?us-ascii?Q?uBB0vZiZiohsayUujWe3aQKigc/15G1F86UYL85gqvIEkzE1jgk6CzoPnn2c?=
 =?us-ascii?Q?q48zmSFgkjzeNPDLDACwstco4iMwDChQCjwTiYOQG+Py8R+bDMXFT1tYzGUH?=
 =?us-ascii?Q?+gZ+2r/HG8y5macGzczUuCF95lFc3ZWrj4lfol5Zs7HxjXQWLxmhFVUU16vK?=
 =?us-ascii?Q?GvcEnX2GBsKLmoe0GbWnAwbbEbQ8neuAa8H1Iqlf9Ht+afbzQ4dHuOJuWj6X?=
 =?us-ascii?Q?oNxuBzNVApKJz7uTF+jh1Ig+U/GP2zSRdsEcKArhGH97JPV1GAFuO7WQkKXe?=
 =?us-ascii?Q?ENCTZcv7S53fEveUBTYceWlNFhJ6aVjDlPYtdj4qpYpHbmMqP74cpHlPmNaW?=
 =?us-ascii?Q?CydOC2nQsW8ZWNrT98FOvaDtVufmUymXnXXX3E7XOSLHZVvKGSxBA1FuvQEj?=
 =?us-ascii?Q?ErHyQEQlXUc9nlDv+EQiNNzpdHDyz0cX3ihDLdY0MkGJ/W2VRWS6g025TCk2?=
 =?us-ascii?Q?wGk5/v1RcpDxjm7yQ6sIl0KmR7/RWZlAYxKkIHHRGAfmPhdNi0ts2IkXWN5D?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ZwJL3EVw4SsV7Lo754Z4V3UHrWi9IwqURNjJxOArFTXBChJKdqrLJDDG/UpF?=
 =?us-ascii?Q?1kyaVg6SZrfv0IWQYAujN6d5dwHdPRJlJclKo/Vc0TYtXk1Agds2UniccxRh?=
 =?us-ascii?Q?P665oswmTbscnZ3GRoQ7nby/d2bi0ompBXptHufbziZGXR7TAYZw2GOmAnXE?=
 =?us-ascii?Q?n/S98dBmYlYRWsL/xg1hqRNHxD4Ik/ShfyJ1lHgrvUkpwB4xQcWgyKEZ1DFI?=
 =?us-ascii?Q?dbVNvSo/ozDVMitbdH8a6pMQ4BxRJLuYg3aZjh3O0qLg/Q87GpTysZs5ramq?=
 =?us-ascii?Q?O1ygHoh6ZFqAaTIwxnE7Brqd+Hwd1N8G5lnt3wmOes0WXbUiDJNBdgpNhJM8?=
 =?us-ascii?Q?qexxSz3sJLsFKPuj5WSpMIA5qJIKwOuSEnQiIcQRGztGzD7W47IWzR7yS7Gl?=
 =?us-ascii?Q?AR1YmuMYrlHAav1mogPgaR5cHI12cq62/Izxlfn+cBGEDAf5zmgle4hekkNV?=
 =?us-ascii?Q?/gkx8CZ4Pro0kZNfMVx6d1JXsyN9AiW4EO7wDnZzVAt2ZodblRdO4jYfpUHV?=
 =?us-ascii?Q?oDSIO4G0PPcvTnemcnS34aIawlpHl/fKuWsMrNimaFAFGJ0/Txl9YogUsBAl?=
 =?us-ascii?Q?/EbSaoiUlttjPKXgOg+JijXwoLpr+yV7Pl9hQJOCl85lrfkG7JhQmfWtwNbU?=
 =?us-ascii?Q?OwmKrNiumLVMp+i2Y4Y4u6SXR/eRLe+Gh8c8GbHWw30qz+WExJQdx3q3UwKj?=
 =?us-ascii?Q?3JvupJFUxaH9be7E2g95ghHBowpRWDj6cQtqB2sG5f5lMPO3tgqf8tvlyjSO?=
 =?us-ascii?Q?6W2x46YVhtYcovLUClcNORQVIZBYlI3YQR+WAlZO0U4fkgzvZTt51b1uSRul?=
 =?us-ascii?Q?GJ6A4eBepCdjyBuJCzD4eXKvYSMpzccaNBOsRcLRKtMCcxJxcXRa+VWZzStw?=
 =?us-ascii?Q?ZaiJMZPi/1HWQbKjNf6qm0yeSDL6OKPnwu25u/exs6ohRimKkpm6nwVxv5El?=
 =?us-ascii?Q?9h8HoE6ZZ7/PRcFqkhxzXkLcBYB8d82MpijooxDLzd7u0sG+mLCK0KEJqVZ3?=
 =?us-ascii?Q?7Mt0s/vFwUgBsoLan7Ja/uvu5uzZn1pn1zvkhciWZOSkxWsbsW8MGXl+N+4Q?=
 =?us-ascii?Q?yXTX6pO2Rh/Zrq2NepG0OG832da4YY1V3Ny7/yXaiA0kekPxPBZLo1aVigAM?=
 =?us-ascii?Q?d1X8T9e1hMSw5eL/4j9B2pJXOZpfa4ZdCmzxk5xS2ipl2SRHs+rwDIBh5hh7?=
 =?us-ascii?Q?Jhkuj1cYen37ExfUuLKFA7vXIQfdBuaOArsFHiohRjdYOJYGhh8C6UExqECP?=
 =?us-ascii?Q?lWetuXYAdkUuY3HBhgwyEpSb52vbQ1aY3rSDlkinOSaOZ73bmMKksW5uzhYx?=
 =?us-ascii?Q?AqrRMXH1OUWG97lURc117feKBilCqowiIkTEHD8UYi35kn2dRmmRZeKyxCq2?=
 =?us-ascii?Q?6zs0p1NBk4d/Zn2G4vxV2h1iunpGw6iZmtPtDObx9UPCuDTvTass/FY8GBoJ?=
 =?us-ascii?Q?0x7eXpFn/B8Msm2J3Qwg3+e4l50p7vOIDgAscOdeAdTwRelvCVJ64v6uHV+l?=
 =?us-ascii?Q?01gjSK7FjwcoQNTQ7OeewIIQAmGdKQ3B/MNavVHxkIqoYRBMKpI9CTG22XQ0?=
 =?us-ascii?Q?o7tOF9lC/mkHVlkDKLP6wfIMlvBPKe+EV7uCXRfIj8QQlDn0P91o5ff2hiLG?=
 =?us-ascii?Q?mClb2TBnsoMf5Bo3nL66K/U2Ta2d96YgDd0bxVyVQPaiRdnViqz6aD5X8S7A?=
 =?us-ascii?Q?+1qi6TUR/ZVECvYWKkaiA2uQ5FIuclULwxSqfXAMCwB90tOBbdssW1OiGZXa?=
 =?us-ascii?Q?Id1XCOqVkNR42hrz2gg+SaYzSWkUhj/EY2xofItg/Jw4/XTpoM3auMXkI9QY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	5xLuetYHjtgHhw6wJFL1wgsW5vhg9656Bx5BestKqwtKgcWm2Vmzq9MOg2CN3cyleZULiXg2+EgIqiv5P+rKhPkKe+GtH4loHogZWI0aEmoLFtd5zs3UJRcaXzzUaUGFYZqC5yTpSc3JZPiMU1U4eHyOToDlbs8hlPWTjkE7h4zI9ygV/W3oQPHltun+GNthfr2eab08F/v44woxdCkgweOBNYWp8/lLLHG3QKrM6gYORt5WIB8Y9GO0KjSPwhMV7LuZGVCQhMdXJoBCy6rMKXHfmswlnlU4R+MfVnCFKXxI7NGKcrAr6rs5wg2ZNMourALSgyRMM79DUn/RDTMX+XFtyGOEcvwTY9w9YcL5lPjciXOz2pDI10dA3wT4fcfOMckKPLR/1DwLrPInap7RSs7L/bT0w89b67wflqAZNdJA+pdp6/vXFKrHWk0N2Y7WlUSrzMiVO+FOVQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41404010-816f-4f81-fdba-08db7e6f45a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:57.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbNn24ZYEOjJ1CyMtkaEzixZNVQTOtB75nwynFKEmc0JSnVXUzhSvMIigEeufAiYlOuVUcqbjhJgamJ+6QeHfVj78/+U91/bPg/KMH/MQDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: f5ibslwxyUPVzGy_fgO_dt4gjRbMxQJj
X-Proofpoint-GUID: f5ibslwxyUPVzGy_fgO_dt4gjRbMxQJj
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
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e55511af4c77..397203e18800 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -537,28 +537,16 @@ config CPU_HAS_PREFETCH
 	bool
 	default y
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-- 
2.31.1


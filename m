Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE787490CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:06:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Vd1unrPD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=a6klWqJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDJm6grBz3cDj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Vd1unrPD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=a6klWqJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zQ2xk6z30fk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:48 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDfNo022565;
	Wed, 5 Jul 2023 14:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=Vd1unrPDNW5b8t40y2LIe0Zk88OvAECNvML6oFirv+2FpAfTvDd7TN0lUn2sIzkTEgAB
 KI/Tt/f+jx8Pn8OkRXA2XHKpKJFxEg2sMK9PyrIngyIXPC5/ISKGKskw2ekNXlO95ZcQ
 ANqFNsrWLcqPSV3MS7WhyQMUXIaLU9tBNppapz1WkoEEhiw/MSJNPcAW7UgslDEk/acU
 eAUKf3nAiPjc9mSj33sF2NJWLPTb568FLJwBk8+ki6bnjJiMqFTVXTatDzyVQPHK7ebb
 UtTOcZBi46oL8FCybC572hI9H262gk5VY3+WLIrzR98v2CzpsO2BnUXBNQ5sRinyvOb0 rw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rn9ybr1ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:32 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsUI033470;
	Wed, 5 Jul 2023 14:20:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5wkc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOBnqHTue32cRyp0fWc/2Z24bHJb43sdkaoUaVFO0as0bcDvUjpIa3+aCkkW05pkz+2ZMOUQYqPB5F39RrDDcnaRfk8564ymaLGlCRTo8Pwm8zFDPFE3EmHuWTRTOeQWuB+dYeDt15dlqw/Tbb9BW5RsJP08abZjUTEX+m9YTAMw3JgqKmRAeF9M1Bn63viwHQeOcHo6X8QTk4+YrtgRrtNRrxdmKOlKmo9gXhtvxTgbciLtma3CRPyQ129OysOJSRx90oQTYsXlibG0h8hPb4s8JgDg9y1YPvd4mQSzxru83ww7L46TkBhZXb+1VbLgKbJ9v/5QX9INQWWWC2hoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=JpuxevPe6xtt5C9o/PaxSSxdc63Uv5+9xQ+fthN/9DxAX8/mpLK+7qk06oLpFStHaeMpTCJVcOXF7EGboIQ5EqDx4SALFXeAljLXdjhR0kcC78KGQ2/ZR9zjEKVnFslv3MtCuHorQHrC+3jBiyMZmbCE9BCoDgIIxWhzHcYAkLp3sMFHdVj2kE7N4sMKyZ471DqBjSKXQ7A9iBJZKSQUSWcDuT9VqwfKQaGBuAyW68Fdp1kgYTCCNCHQ+X2zQ6s7YpfJLY7ZmX467WKGmiMzPDJp1ur9zWaIvIard2btjX9+AE4ukye07AzRutqtJOsGMAZ6dTDEc/xDEe1nETFcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kigNhnm74JXGxRnSJyT7nDFiqhK3cJdGcRD4UntLgA=;
 b=a6klWqJuMQus7uIbcSmuIieTmVNGAuVLMLxqJrmSSt3dgZKzrlfpTOLxbv7Nr7dCdz/92AqG+C0wCu8ZxPO41pfOam8UNFMNzKiYf3oiWRVqP+3jrIE4fzGM3S9IOSnsZAOe19Iu4q8Uh41QJ+qXHZVg0WvAb4bOaSIAgohUzkE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BL3PR10MB6258.namprd10.prod.outlook.com (2603:10b6:208:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:27 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:27 +0000
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
Subject: [PATCH v4 04/13] ia64/kexec: refactor for kernel/Kconfig.kexec
Date: Wed,  5 Jul 2023 10:19:55 -0400
Message-Id: <20230705142004.3605799-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230705142004.3605799-1-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BL3PR10MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: ea627ea9-88b5-4c24-1342-08db7d62faf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	G1unY+F8JGSBL96GqTmuEuzNUAiMQadr4oMDNECZeqNAbStPedPyHxDvfbrLE5sDrpAS+geZUV9LVo/vJx6SVR+xBtp/KkWKvp6/FfTJFx6eLwk+NYX6zeWmGjqQQtUjUmAnssuyHh0ZcQ/xf5XwJaGJDPjrQxhpc6l0VlHem0dw7ZGLQb/ilyrCMeIplt87/1n89HvIFHmXihTHEABGkJHNv9XNJhtQU/cLTZeDAfv5WegAPpX6y1azHGOEV+gJUIqKtyid1Mmjg1KYzFvkrzPyVKLjW+/GfvUUli0F6EEz0Wv5wxJOi6UTMuN46Jem5mD3cRdUUKXx7tHaBt32WVp9k8Fm76WhwvKxTqjwQQEswLPCASIGr1CNqGalqPUvvLpEBM0Be9ocK0vGYZdBzZnlCMrjvWwt03F+GUH0l43D0McIQFgWD6eLPEGSKEqJkU5YZnPbci3ZvddqObU2/av34cnXZQf+Q8CKhY+pbxkuFOWZXbL/bG2IgBUV0Vr1C+GZdthN+bO5E7kJj+ZxgOVzsRXQyVobNzUv6e7KnEn6Vf/Xw995BuQ/a+CbVe8dHpxbr3OshdrvmdrsuTYBgybygfhGmS4zGj/zd2xwJVY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(2616005)(2906002)(83380400001)(38100700002)(36756003)(86362001)(921005)(107886003)(7366002)(7406005)(5660300002)(1076003)(6506007)(7416002)(41300700001)(6486002)(8676002)(4326008)(8936002)(316002)(6666004)(66556008)(66476007)(6512007)(66946007)(478600001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Xw++OLoRWZrxVdwhqT1Wao+rirAOe1bC6fcGDUE6mzVD1FdVivj6hxveh1Zq?=
 =?us-ascii?Q?Wr/u0xYnCrcTbtCxeFV+trBFIQACt31uPLi3oIQkv6Cpyio7RAjtCLZ7RbfD?=
 =?us-ascii?Q?kSuXbh1dv0k/cp6aUF5oYhVZMN48Ucuy136xjmpdsp0/LX+PEXKaHH7HNwLN?=
 =?us-ascii?Q?RQyTbXQOmOhMBC/npjvP0ZINpBlSMloSchkRRKMKX1pOpgT7v+Bgnhq8YwSh?=
 =?us-ascii?Q?Q4OWllECkvjIDqjL1qeCBYp5onH09RxCW392xiKLgJRtv88Farlpq0aqxfJF?=
 =?us-ascii?Q?DijwVlOKq6ZZUkluIKtzVF7um2KXSuJkemJk1buA2xMzlXhNl+22tWg6fMoL?=
 =?us-ascii?Q?S3hs708Wpe74m+ZP5ODdBFHatglbBLUkpZbLCIcmWjG1AgyNdbloMr7gtuZU?=
 =?us-ascii?Q?IxHlurRpJl2+UumFwYjcQq0Yi4JmzPJi42bo6aCKmrKo/6c9kYEkDf+2sVtt?=
 =?us-ascii?Q?NwLhXtCQSXWv3oRneYNgJaulSPv5Eh4f4q3fllNT5ZmPVD6KVOpA39dufBZ3?=
 =?us-ascii?Q?udcfpzEaua2h6Ydu1mgxq7ugGdgGClknvyXof9H7IKpxNSoszbBLl8UjFs+V?=
 =?us-ascii?Q?Mef4mdcXWXLdJqGlgXjHZqg7bTkd6xpBHL97uCOcY+hjOYWIIa1qcMBRs4mL?=
 =?us-ascii?Q?G9lNq096aBcQbC5rYWbwk9Gyat9ZMPwmz8XZSSne4hiu1sk3WONZ5XtiTxll?=
 =?us-ascii?Q?k7dbnaVHNurbHSShv4dQSJBkjASHsyPmBA0QczeBWwUgG2AOGRHQ2yJV0hIX?=
 =?us-ascii?Q?IwTRUfrOwfcY08uXubR0wgtiBkkosLL2H4Bne87yUk8/x9eS3ecNQvF+tBSt?=
 =?us-ascii?Q?fsoafzCAlpMQIbtQWGuvSnh7wHfAUfDyOSk/1miERWhJWKSey1r5+nj41L2Y?=
 =?us-ascii?Q?zUJ041y/Gw6hx/LIiijnO1tiNhmqvtyP3GVuw57qpqDfK1zlEx+xgBoWjQoT?=
 =?us-ascii?Q?YZRzsAyhvZBzV1/3Km2waSR/+BjsbaW9a0CTG2t6+QDABpLZp07jagIoShu5?=
 =?us-ascii?Q?O1kxDVag9nkTK6IrwYlZ2XCiVseWjkDW81YRs6tr3G7EOjvgbZEO3CXw6Ix+?=
 =?us-ascii?Q?0dY413tffqI/8aHETwuiRmajGifTJobcijt4Kke7QWenfD5RwfIyzgFvs/Nm?=
 =?us-ascii?Q?5FM8TvCHMoGjHeSUvg2AUQf26/UtgseMFlAXTMahyCX5nZ2zhUIZVRl66CAB?=
 =?us-ascii?Q?amrxDUrbWJD6781RP58KoyJm3SmbBNRdx2zyG1O2vN/y2aT6mixgnQlhXyUf?=
 =?us-ascii?Q?bhCHn+X29MOKn2Rj+8a9pzqJr4PaVYaY1JYI/2SMnL5DYUlCUyXub0tJcEGu?=
 =?us-ascii?Q?mNmYXdDvE1Uf69sCJRxpKK0lEuAPB1Wl8f+ajFgGN/lITuMnVtKkvg2QtNry?=
 =?us-ascii?Q?kgcf1Rj5HW770/NNCqfX/rgiWs5emg6r2J0DGSOFqWwYk3iLUWlZ33ecVWv1?=
 =?us-ascii?Q?mn6VwJ+quK5GONiWl98BqS9MjoMK5bcr85x4Gn0CoAKOc9j5GVUEJkjj7abf?=
 =?us-ascii?Q?pVAFV2IelP3SGNM7ewxOZT8+XjJlySxUtBn04jfvfRn+p2ByNX8EDaKeWTLB?=
 =?us-ascii?Q?9UoNNC1K8uFInS74Ol3RcFkqcAl1Vi20MnCgcD25Rj3RpO4JlVeVCCw6WMo5?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?Tg1HN10c0jAvv028gwPkgTpSIa1iHmNcJI3pzqmuA4fWa/dpGLc69NsB0UYM?=
 =?us-ascii?Q?5XoArW9RuVHYHdbJBN7Jx8LJtFZhvkePuzPi28VST2cEnIFwfqoFvrOgFyMz?=
 =?us-ascii?Q?/6/uHP1kRdBJ5O93NFPtXl7flIoug0pgI1ktW3JHcsNJjA0+YvVC4unEj3q8?=
 =?us-ascii?Q?pvvxsZMZWKaCeHzIaCBlURw79RYbzrkn0nuI9BOWW5+kgQdA9KsePhFww54g?=
 =?us-ascii?Q?UOiqrtjdGJm2GozFtbeTQtYFnxeYf8ltlVgwi7Aml8qrvMHcbZJpAJKrDldS?=
 =?us-ascii?Q?bBrnW6u4cQ+FdkVZ5+YyE2OdbfABEYAFFGtZH0s50nFB0KyqkgCE4ZmVP77G?=
 =?us-ascii?Q?DW4bXzXIG6Aswel8KN0KoHKkEbcSpDVpiunVy4Q4zfqyNTFfsx+deDNIsR1I?=
 =?us-ascii?Q?AWTT2hDjHRmLzXii7EUAuz9cb5gmgt6/2gAUzCb1lVqL+OaPvxcmKCAVVqQw?=
 =?us-ascii?Q?AFUkkumoLMcsQ3jAYOhXr2JvzDxu0zjy/H/t6h2dm3Rq7R+zzwQaOB53Rh6a?=
 =?us-ascii?Q?xkq3KTFMKUVkW830ao+Xb0cn9+KFYIFC8HlOitFM1CG7UPw3Wi4y2ZnVYuRQ?=
 =?us-ascii?Q?RTMuK/jyeeVZuEDg5R48rSpzcjzBHsoUR2KAcWyyn+/hq5qo96W/nf/jQ+PJ?=
 =?us-ascii?Q?y0KVuLOZFS0N/64f1O2XIMEPYsmfdVg3HABmWqvFfGjDiNE5Mxxu4mXm0Aj+?=
 =?us-ascii?Q?sPwaUkQt6ZwcKBhxg7BLcLTZzLBhjoK9U0IPoTVgpkdxBQVCdq1Ge+gl/0Qg?=
 =?us-ascii?Q?kk9UkSBXVaAHucQls4pwUy3K5JnlysDUuSFyd2JTZ+uHXkoHTU9dlDoN2niz?=
 =?us-ascii?Q?F0hKWddQxtgg25ONzo3YqIRsJZtGiO0fseJ1gQFcCcaQOTwVUSeTI+PHUoJ6?=
 =?us-ascii?Q?tV39LXDcW1QJoQIcOOnRhlvqmTn+Geb89hRlTCwswwGVs5YZKcvAnohSKCNi?=
 =?us-ascii?Q?wZ1aMVqkjugvVVguHY28LrNiyCoFdrGp6GfUqhuzI02wfeon+XB1Meabhi9b?=
 =?us-ascii?Q?bsqfBoGRYs+SG4cvDbN0rWzTmr44RrauGwD50dVvA5jTs/RrPbZfpzccM9vN?=
 =?us-ascii?Q?7DxSfdIMZO9NjY+k66j0IkEFhZWOTiqjU6wZKcEV9C4vQfRgclZOAkT43Wa0?=
 =?us-ascii?Q?qb01L0zFDTAEOTmgpmB1BPa2DUIw0EJ4jJ8TphXCRSQyqHpE/pA/lGwTLqY/?=
 =?us-ascii?Q?TTh0ghjNXuRt9qndtvU0vap7Cb2AqLCPy3gn5rPViFye6QeZye4SqzzpIFKc?=
 =?us-ascii?Q?3RZNAW4dF4cdxwDwFIpElxaSy6hEULE9YmFuQYuKnmQKZZci0RErnWaAPRT2?=
 =?us-ascii?Q?0j8gsuS5scbIEGSp6FdKmTXr5MiUX9K3YSx23JNWcLrAhQ1ORwxfoqe/1mrD?=
 =?us-ascii?Q?gFuxF2nj1QtdUubrdNIMRhjqEbu9FVYWQdkiufdQzQe50WcJgtypy7NiVJMJ?=
 =?us-ascii?Q?8Wbs3GDqP6ndbqRVcjNGR9MLJVrMYR0nCNDtaUbeW13yWgTa63/XCYYiwj3J?=
 =?us-ascii?Q?xJ8uLY2JFkYAXjJ0WQHWi5zryny/gJCTpsqIvmY/olYaEEW/uEODSeTTnryA?=
 =?us-ascii?Q?86Rd+zAAeZxY8zBx1TpPEP0+kE5eosHKe85E98P+jjLtyQnmZ6eB0EG9ZC6r?=
 =?us-ascii?Q?oLbcrc18qwn3dOHWPxf7JGsJyRL8g+1fD6iKrb34AV/HiLdbguYycVygKnpp?=
 =?us-ascii?Q?e9cVwMllbcS3JHWb/7DZDdC8hFyIJstkSVem8Wkz8Spjr7kr5isuI5Y8N/wF?=
 =?us-ascii?Q?7ZbxuAutGzk/ofnFDxJlXZzcpCVu9Hk2h/FgDOceHdRLzGOUQ5i+1xNuEiYQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	IjKAaH11oh3c+IHQ1fxkAIAGHaByxdTiM4igVLmK8VFZuVTXyd84BiRZzny82g0GPQrOx5SWYKRyy6G7IQ8b0JBIjIXiUzV8Xur5wfv74DTMt05XbdGO3qo6M8OiPDQdOs98EUn7Rqhtb97ifO1cQQeZqxi2EiYknKnLloWgNmdpLibb0gDSzS7f0ZfTy7sTCA72v4/jWD9atnmrN3kmxava2higb5pg5/31zLWyUlxK6yVyUx9lczElvDm+cSLcLKZtB9g5wi1RxoAiQ+D7SP52cLkxpTvABEsylNoOm6dLT5tQ2ee0fpqgn8k5bbboeZU/AEO+MZovrG+vfIEU0bLBeBm0EIJeNGEjgNh3Yg1HnGb5c3LeJT7AvfbJBT77DG0z41qYdWsIcEOs4kmo8uuqnI53/ZTS/85F1KO9rWP8ubsgD1Ylm3XqQlYt5imIO21Yoy5YpnFQJw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea627ea9-88b5-4c24-1342-08db7d62faf9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:27.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jf9pvgnZRBoaJ+wMbD/FhtnLUxTlRVx++gU0HsHBUgR6WquWkmwyKmUCUqewnL9KxCPcfKzO6PQmnKNJ2/HkhZNGgwkTgoLXWgV8Pfofcec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050129
X-Proofpoint-GUID: vXN0LbPonQ4qQ2wZJstw1t2Eoe5b2SBh
X-Proofpoint-ORIG-GUID: vXN0LbPonQ4qQ2wZJstw1t2Eoe5b2SBh
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
 arch/ia64/Kconfig | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 2cd93e6bf0fe..88382f105301 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -361,31 +361,13 @@ config IA64_HP_AML_NFW
 	  the "force" module parameter, e.g., with the "aml_nfw.force"
 	  kernel command line option.
 
-config KEXEC
-	bool "kexec system call"
-	depends on !SMP || HOTPLUG_CPU
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
+endmenu
 
-config CRASH_DUMP
-	  bool "kernel crash dumps"
-	  depends on IA64_MCA_RECOVERY && (!SMP || HOTPLUG_CPU)
-	  help
-	    Generate crash dump after being started by kexec.
+config ARCH_SUPPORTS_KEXEC
+	def_bool !SMP || HOTPLUG_CPU
 
-endmenu
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool IA64_MCA_RECOVERY && (!SMP || HOTPLUG_CPU)
 
 menu "Power management and ACPI options"
 
-- 
2.31.1


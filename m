Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F9732148
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:05:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wyat3ELL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hg9v3eja;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhvv86JzZz3bpd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 07:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=wyat3ELL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Hg9v3eja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhnXn6S0vz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 02:18:48 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FEOKH1029534;
	Thu, 15 Jun 2023 16:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=egzuNSKSK+qIHfc8O9DXl7XhkqwOecL5pACkhjEBS4E=;
 b=wyat3ELL3fB6apGs5rSUcLjbgjrtm3A7Y+kudvrxf1vz8/iq/1gQ8v9U1v7T6+DB3qAp
 7Umi4OfQyRwjU6wCmJ0XgtG/CNL+xurQ+ugaFcJMAtNllYDTxptdX4EO0XbremYtDXSM
 wWiajxKWEiISCovzSFXQgQO7bBRMry497k9ksaF+suJ9LIXdrq7GOZqqBRIdnhyBSxSc
 YxRa27n5cipr39Ga2IWzRXHJB+eBzTeCL1aBoWAGJ7/2BHWz6d6KeU+ZiXWA1ErggyED
 4YLqtuMIcd0zdho3vkEwwnbfVwjKlf5sbwqVPom+Utnb/AUA6kAkvgcBkoV3k7wtZTiZ YQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3btj1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 16:18:25 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35FExxMJ011520;
	Thu, 15 Jun 2023 16:18:24 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm75xfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 16:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh6AvlrRzxMaOPgYyChM1lQMqHWVIBou3wlNIBps3TFKbnrc/VEh3Bb5TpbuYH0pNP2Sdg3sjeoXv8YoF2R6eTMLt5jY+YxcdVdYPWYr0d953ThSODF5/xzxUAytLjiT8Ca7D40X6yFqkOGlkgB3xcCgRg8b14zI5qQJuxn3SW89DGNHHkdqNT+kHbZBPnmk/4FP1JcE2DoocpXBPt7mWHwiqWkvhS+nR+ivbouqF5G6dctIlEl8RZiFvE4nAZ5omuXziK2UsN8oJm0Esg2MHbx1el+3suTKj6GjkhCeptvkHA7PQxTRPOPMvUuxBOpPMfnplUKWE8YjG7lMrvLN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egzuNSKSK+qIHfc8O9DXl7XhkqwOecL5pACkhjEBS4E=;
 b=jJzMQ4y3LluVbG0nqvt258rnhnM29wwlzpFeufZG66E7eBM8zzn+Ehx6kRskOHKgweJlHTgAAjQ+TWbiDx3Hb4jlNfNVRSwPdfemWEZCSxLPdkJxofiz/tFf6vT5t+EKlQPdSIq1xW7l1nQunM5q6+fwSYVvztSgaYQICnm53s/Nwu2Dv31jQ9UsoxWl7DtszWs52MmTBIZqEadyDK6iRTJuELpOg0IO1moas1Y2RRJ7vw977G8xOcEyXw70i/9Laqs1hxGOKjBK+kbZ5UGMW28zyYlqw/xZhq3ELKdPdhIzu8C7SoSXP9j8jSEtF/kJadr/cfMARPWtamxpEWPIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egzuNSKSK+qIHfc8O9DXl7XhkqwOecL5pACkhjEBS4E=;
 b=Hg9v3ejaKwec4+0T6E3LOY9ZjUiuQmCgUolacHbpnqRT4YBFiYcMXpLoQ2pTnnGXA4WBB//jJKd2cjXzgSyzLFBaXsbKoaiD8sjAl5xA72ajzZ83rx+L1mBa9Xh9IhFslRNcmEtw6+q4M70tDzaBWvR4E9Upq5zm5Yhi0J/rkrc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH7PR10MB7105.namprd10.prod.outlook.com (2603:10b6:510:27f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Thu, 15 Jun
 2023 16:17:54 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.025; Thu, 15 Jun 2023
 16:17:54 +0000
Message-ID: <aaddd54b-d1d6-d979-ba48-a2f89552a809@oracle.com>
Date: Thu, 15 Jun 2023 11:17:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 10/21] powerpc/kexec: refactor for kernel/Kconfig.kexec
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20230612172805.681179-1-eric.devolder@oracle.com>
 <20230612172805.681179-11-eric.devolder@oracle.com>
 <87fs6tflfi.fsf@mail.lhotse>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <87fs6tflfi.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH7PR10MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab6c3de-adbe-4ef5-553a-08db6dbc12c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DsLIy7lKv9Di/mt385Itvl/Ec+uFFbgpvOBVVueYZ+L1lKplDIzxCh4BltNluVr9YvOJGddDK9E4AzX7t1gqvsc33tF6eZY2efzFkYchT00k8WWEBJExqtlfbTgobdiGWT5y0vrcInkgfZ1B+UxRSFkf7Aae9kpyYWNoLkmC22/nHkvGgTURXYVdJw0oj7/tE0bvNI4lcmYSr9E8yLgpiDxiJSDqwrzW6o5p51/2+mh406k4IUeMI0ZIyebJIedviZfNV9dt5j1bUxen/IiAyE/SVL0lunLagWzfaNF7GfC+hB6H0rVXg3PWdqeDb1fD2evjk+pGY7iQaI7xUiMrXVRjZzq9YH1FQAgTl+nf9WoKjXbiCk4py5fQJTh9bCS1Vxn03n8Xw3Ed+1XEvbCj8GCRvoJ/BmzfEsirmOeqFHlmTMt4sMaruKKEvnJMlKyd9ElP8Q/WTZc8DJSH5cMSA8Ur3P0JV5gnLLMYYAAYj1+9GsEEMAkHRlI1GKtsXV08peqiRm3ncCKeTLsEdmVHTjmlra+e+PQXiCQUgpzANizye7LDaGQXKP8a1Ri9y0dxWIr2MSGk4s0hwvNZfZsm1oUw3MVqwyUx5zeN0J5XcmklIlJDBpGK2zDLe8uo1DbXlSBOIU3zSF5FGr3aAXuM+jJl8r+UWOiVrEj3kj9FqQs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(186003)(6666004)(478600001)(921005)(66946007)(41300700001)(8936002)(8676002)(4326008)(66476007)(316002)(38100700002)(2616005)(66556008)(107886003)(83380400001)(53546011)(6512007)(26005)(6486002)(6506007)(86362001)(7416002)(7406005)(5660300002)(2906002)(31696002)(7366002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RHowNUZjVnlva2VPaGMyRU9YWCt3WnU3V21tNVpSeEFBanA5Y0kxZk5nWFFD?=
 =?utf-8?B?L21RUU9zWjRoRXFmNnM4MlZkM3lINVkvaDh0RzY5Zmk2Y2k4QnVENHNwQkI4?=
 =?utf-8?B?RXpmdm5tUzJYZ2FjY2NhUzZwWHMySjhrcitQT2NkaXowaW1sZkxmajg3aVhU?=
 =?utf-8?B?by9Ma1RJM2dFYXBrVm01dENjNGtReGxrUXNFN04zR0JWL0FCbmR6U3MwZWIr?=
 =?utf-8?B?WER5eFBLUlZuV1lNcDVCUGtTRWorTHN2aENSYlpSMjlveUhxdjhSUE5sN0ZL?=
 =?utf-8?B?RGFzQnRNdjlNM01yL0F6ODFWSmQxS3ZPK3p3ejBIR0pOQzFiTExMRmxrU1F6?=
 =?utf-8?B?a2lGZWVEUUxKQ0VCbklJeTZPM0wzWDNRT05aRDMzaHYxd25PR3lIaWdDUjFk?=
 =?utf-8?B?TVZSTk5ubkdpcmhBRzU1RmI5cUlaSHZnc25uYWhHL2p6blRXZklvRjI2MFh3?=
 =?utf-8?B?TzlQRFNGYk9FbE5PajBpSWVmNWJsR3RIZ1A2dExYUTFmK1dsaW82RUdlUERV?=
 =?utf-8?B?c0dOWEYrcHozSkJzTXhJN0F4bW1HblJZV0UwaUdVMkp3RHlqK0d4VXlBSFFI?=
 =?utf-8?B?UkU2RFRXdmFSWk8rM2RqdHRrN0VQQmVIeFNxY2tpdHZvN01YZ2F6Ky9Ed3k0?=
 =?utf-8?B?SExxbC85OFJ5MTVSYjdGbjJ1Z0ZHQkpHREplMllvdmNkM3BWU29VK21WdWVP?=
 =?utf-8?B?WUZqdm5WazJyT1AydU9pZU5TcTZqWmZIVmJPalVpM3B1ZkUzakQ0cGdMQzh4?=
 =?utf-8?B?NU1JWTF1cEZPbDdGdEMvOU9ML0VUVXFmSHdBTmhNWFIwaWJuNGMzMU9wUDJN?=
 =?utf-8?B?dnhqb210VHBjYUNNcTBEUXNaUGpYMFc2Ly9ibUxST0lyTHpMcjBBU3RXNTJH?=
 =?utf-8?B?aXJiQkJ6VXVUT3FRSWtObXFZSzFId1pmS0JFQ3RTKzdycE9wMGVWWWtvNTVT?=
 =?utf-8?B?MWExOEZNdmRST2R2SVFVVENmamF2N0dha0RqTFB1S2ZNMkRVRkpSZVdVOG93?=
 =?utf-8?B?ekNQWWVXemhSSUpqdEJxbk5jUGFKcjhNN3RXNWF1K0lxSnQza0hSQ09VK2JX?=
 =?utf-8?B?RThWMWRoOXVaMVVwMGJiMkpRKzdBbzdvcUdwV1Zjd0xGWTVDUU1FcHQ5anFt?=
 =?utf-8?B?ZSt4WWFPcWp3MkNablFGdXU1Vi92STBSNWJ5NUFiazBoVy9Uek5SVmU5Z05x?=
 =?utf-8?B?dEZDM0RFTTJab0FocDFzY0wwcG5WdDJrQ3JjT2NCTWpBMW0xOXdOemJ0WHp1?=
 =?utf-8?B?aTBFUkNYVzNKa0kwVTYxaHJYcUZibWdkbldmV2d5Zm9uaFVuc3JZVi9aL1I3?=
 =?utf-8?B?UkhFV0xqTzNxbVN5RExTYTJzcFc4bnlkdExrV2huektRY2NGcmJlS1Vab0Jx?=
 =?utf-8?B?ZVBscEI2YmE2TlZmbURqbFVEbTI4Ty9rYVhBOHpGU1hWVG5UenVna0hvaS9V?=
 =?utf-8?B?amdmT3hqRDZuTStVNnN0NllaVlNlYWt5TWpad3hwNHUvZ0Nwa1MwVUZ1Qkta?=
 =?utf-8?B?YmdkRmRRaXBsWkVLOXJNZHZPdVI4NFBGeUJmRWdEbFM2VERhWFhyWnNiWkUv?=
 =?utf-8?B?WGhZeHZ0QU5SWnp6N080L1RKbE1vL2RIVXo1MzAyejZMTkJEVlZFeTZhMyth?=
 =?utf-8?B?cWpSRnV2T0tTVDNDWFRtS2RPNzlya29PeHpDcFlhNmMvSFhpOHRwZldlSFJk?=
 =?utf-8?B?Zis2YVhSSERJVlNjZldHU3E3bEpCMi9uUkNmWWt6S1drSEdLdzdQUHRoSVhL?=
 =?utf-8?B?Tmk4aDkyOXdVZmU4WWN3ckNWcnhKcSszS0hsRkdSaVVwaTlrTDBiQzFtNzdP?=
 =?utf-8?B?eG1vYVdzWHM3eVpBYk0zbWtXYk56dm9WNGptUDY5VkN5L3dKV29DWFZUaFkx?=
 =?utf-8?B?WGIzbDh5bHNUUjMxRTIzR2ZJTWEwaWM1R05FR00zWVdNUjFUUlV6RGVMRjdv?=
 =?utf-8?B?cW5mRnRUVjMvL25TRGJpNTE5RlQ0Sm1BK0xyZEVUenU1SWJPWDdjNlBVckdv?=
 =?utf-8?B?d2xDN3Nwc1EyRWFpSjBjekZQRitiaFgzZVl2cld3c0J4aFdTbFZZSzlmMUU4?=
 =?utf-8?B?WTVjV2pEMytMblFIUkxnUmtBMllJSkNRQ2tBaDJNWThMblVFMVZ0d3hkc2Fq?=
 =?utf-8?B?VUpIL1ozb0lsN3pOaU1QZEgrVlhLbFNYVUlFQ1JzK1FTWTNXS25TcktKQVRC?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?dTZvblZXNldaZmRaaUpHQmNxZy9CWmE5dXp5MWJuWTZCeVRjK1FzR1JlUDQ2?=
 =?utf-8?B?NWpobS84V3VrRElCeFo3Q3g2cWRsRllIWFBqaDNFVllMV1hkVnQ5a2JIMWhQ?=
 =?utf-8?B?Z09Pbm1VQm8xVzBVMUs1RWFGTDNqd2RuT2V3eDh5Rk8rRFhVaXlzOVdudnFj?=
 =?utf-8?B?RW5rYnRpRkVlSUZ4SlJBRXhkNDFwZ1BhSUpYZjZtTUdEVkpmaXBWN1MwMXRz?=
 =?utf-8?B?cUJpcjFQZ3NmZU9vTWhHaGcyRXl3S1dBSWRsNHFUS0pONVJEL3k5VGM4NmVL?=
 =?utf-8?B?allEUWk2bTVKSkw1d1UzL2o3aEY4NDRnSjN3dTlwclZLWldHclpaMkNadmFl?=
 =?utf-8?B?VHY3SjdUdjFGOHpsZ2ltU0RjK3hXTTJxVFJia2VMd0pyYzFYQTZaeHk3blR1?=
 =?utf-8?B?Q1Z0d1p1WHdlazBLdmZFN0oxNmorb3BCR3hpY3Jqd1BRdFJlYktNRUFCOUJU?=
 =?utf-8?B?MzVSMnhYeWhRaGk4cHVFZ3BXVnpveTNsWTZFVHhETnlIZ0JTeTEyZWlPeHN6?=
 =?utf-8?B?S2QrK3hTN3l1N0ltbmlQRWprYVg4bjhjckp3eW5YalVaTjJpdTB2YU9oWDY3?=
 =?utf-8?B?eG9zOEhVaHhOZ0xpNyt4aS9TZDZFRjNCUXM4NlNSTmlidk5mSG1ZdzhMcEs1?=
 =?utf-8?B?eE1VcDF1UmIyWmdYR2pXU1VzU2VaSE1IdkU5Rnd1b1ZxektBMFcvSElFcGw4?=
 =?utf-8?B?TG41OW5mekJ0RHZMU3k3OFUzOENJZDI2MVgwTXRCYzgyNG16YllWc3ZHSUlB?=
 =?utf-8?B?bVJlSDdRcUlpQ2NrZEZlU0pUS2c0Z1ZtaVJDVUN4alQ3YWlHYTZ1OE5zVldy?=
 =?utf-8?B?SzhQUUtJbFFJN0c2b2V3eW5BTzdjVTBYdkVKdVJXNm50SFJoSlo5SmxLOWRE?=
 =?utf-8?B?cG1YM2kzM1dTMFpWOHBSck93NHJqaUhrM1pQUmJUZ29EQ3h6WUJVVTNyaElF?=
 =?utf-8?B?Z0J2azNVYmZuNXphakZNQkNqVFk2S3ZhazFZNkN2WjZVR0FQRDA1aUFCQzZF?=
 =?utf-8?B?MHRsSHhvcHhFK3VGbzdoYUp3WjQ5L1R0MWlFMktzdmFwb1pKL1FZU2g3YlpM?=
 =?utf-8?B?QlFvNXRXWWVlUVNCekJkdzBtSkYyOUkvVEY1TTdmN2ZiVkNNUDhiUzZYclBV?=
 =?utf-8?B?Wit6dlIrYmw5K2RCSkUxZGhGZWNDWmZGWXlOWHNlajJMWkcvNFNrbnNnK0hp?=
 =?utf-8?B?QjBhUnVBdHZLNTA2ZmU4cXhZNG9IdG1LR2dWYWdkT0hZWTRuNWVubDl2RCtU?=
 =?utf-8?B?S3lSWFBMOTFGYVRRTmRRWUNiUzNGSThRNGNUeEIyVzY3QjN0M2ZOU2Z3VUx0?=
 =?utf-8?B?L3Bqa1JoU1U4a0V1YVJwK2cxRVhTa0JEQjFLTFl5YzBaWmtPN3JoNkJMLzFD?=
 =?utf-8?B?bG1Hd1kxc3pSZXNqbTVna3NqSE5oQ1licU5zSEhDWkluV0h6Rys0S3IzU3pT?=
 =?utf-8?B?bmlHOFdZaHcxN2thU1dBeisvTHVzaDd1dUdWRk9zUTM0N2hDUVZYQ2Racldq?=
 =?utf-8?B?UG1DRHVyTHFLTjFCSGlla0ZNTU5xc251d3I2bXFEUlE3WWsrM3RESVRtUHFY?=
 =?utf-8?B?U1RldGxqN1pLOUc1ZEhnUytGYzlQb3VhWEIxK2lhVU43RlVpV1FoZFRlc3NV?=
 =?utf-8?B?OWo1eXJtbUtWL1M4NGo3cWlOaHRPVEdpVHU1M0k5SU95TnJxenNMZDJWcDdI?=
 =?utf-8?B?REdNS0pvZkUrbGRsTk95TDhmSHRDRzRkTEw2RmhzNy8wY25TRlRaYmhPS011?=
 =?utf-8?B?Qm1mVkxtQ3RyOEpsVlBxaXRnWTV3d3BhQW9WWDV4aS9Wam9NOG5pOGZWL2kz?=
 =?utf-8?B?M2lJVzZBdDlWMWVxTUZpV1N4VWdCS1RCK2phZlQ0cEl3bkRqT2pZb2FpQmhP?=
 =?utf-8?B?ZnRYWXdyWWZvazFrUWNZVU5qOS9SSDVWdnNHOHlWT2ZmOEpWWC9Kc3hValUy?=
 =?utf-8?B?VThDc3MzOEtEdXpnNi92bWs5VlU3MzhXTEs2azk1MWwyejBUMTcwRGJkb1Ru?=
 =?utf-8?B?dG1XNlIxbldXVTdZU2YzU0RJMmM1a2FRWUpZdldFTms4MEp0L252Ymx3d2Jh?=
 =?utf-8?B?QlFsNm9XbEdXTG5XNEJuZE0raVdWbDB1Njk1TVlIUERDRjNkMmI2NlF2N0xs?=
 =?utf-8?B?V0Y3THBtWm1hMnMrSW9zTFp1bjZNNlloTXNPN2NmZmI2RlFwdmpVZGliNjhj?=
 =?utf-8?B?d2hrNGhPTTRmaE5lQzRhUFpnNW94SU40RFM3OUtBT25xZ2tISDBFZ3NsQnpQ?=
 =?utf-8?B?YUJWekpsYkk3WEs5eXgxY1NWS3VOa1NTVHpxZGk3blZNbFVtcy9kd2p1ZXNB?=
 =?utf-8?B?YjRhZnFveEVEQzJMa2p4bngvemh1SVdTYnZyZ0JKNmJwNDlicittWkpUVUdt?=
 =?utf-8?Q?bjG1MeNCPZFjMF3qmZ3sScw8qTN2j7XKCpx83udbqUfyj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	9ewZtt6tpEXmtGdDw6MiZ6y9IObPKFBG731Hh7KVRlVFmghrcap4gNDt0CKQ1jkORdo57HygL7gVC+GPckeVuhFv7XFCAJ5L2eqneKfYObh72aUv8HD7Ei7EHPr/ZPgLSXfMNj7MxRUTjO9mDfe78sbdIbl/KUKZeN+kI+D0ROR/xDHB3Lx8X8zZPxNTTFM17DqV/DgxSjPoOokpgUuZdt1J8hqbkTc15Zl4cJWOnC4pyKtnyLOU104u1i/Q4q+wfYQzPTHREdK734f6Djt4DXUsv+/GhegJ4S3GrsuqZ9Nt7bMWYRkLH//8X+tra07jpmYHIF12jpYCNUPvT3O2UXH5XO8Pg5wva44BNQvSuZLF8pv7sQl25MAVJjNqjX/TMHr8JeLZP09OFrFad2ulGUzvT5ANxgUucPiEz2HHLpwvYCrkOC4sRN0RbazuJHOx6xd+boMdWlW8mA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab6c3de-adbe-4ef5-553a-08db6dbc12c2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 16:17:54.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRuF9eTAuNV+EiNtCuzVOMF701zGEDD0NV6VZFdvSbQ0cKx4PCSCZQxG93GZVGOXCFFbu6qbifDx/UOnc0J8o0JuGOCLxrL3GhxzNkxxbig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7105
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_13,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150143
X-Proofpoint-ORIG-GUID: GIS-WB9q4G03piAM7RqkoUwRFWt3haOi
X-Proofpoint-GUID: GIS-WB9q4G03piAM7RqkoUwRFWt3haOi
X-Mailman-Approved-At: Fri, 16 Jun 2023 05:50:10 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/14/23 22:34, Michael Ellerman wrote:
> Eric DeVolder <eric.devolder@oracle.com> writes:
> 
>> The kexec and crash kernel options are provided in the common
>> kernel/Kconfig.kexec. Utilize the common options and provide
>> the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
>> equivalent set of KEXEC and CRASH options.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
>>   1 file changed, 17 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index bff5820b7cda..36f2fe0cc8a5 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -588,41 +588,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
>>   	default "y" if PPC_POWERNV
>>   	select ARCH_SUPPORTS_MEMORY_FAILURE
>>   
>> -config KEXEC
>> -	bool "kexec system call"
>> -	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
>> -	select KEXEC_CORE
>> -	help
>> -	  kexec is a system call that implements the ability to shutdown your
>> -	  current kernel, and to start another kernel.  It is like a reboot
>> -	  but it is independent of the system firmware.   And like a reboot
>> -	  you can start any kernel with it, not just Linux.
>> -
>> -	  The name comes from the similarity to the exec system call.
>> -
>> -	  It is an ongoing process to be certain the hardware in a machine
>> -	  is properly shutdown, so do not be surprised if this code does not
>> -	  initially work for you.  As of this writing the exact hardware
>> -	  interface is strongly in flux, so no good recommendation can be
>> -	  made.
>> -
>> -config KEXEC_FILE
>> -	bool "kexec file based system call"
>> -	select KEXEC_CORE
>> -	select HAVE_IMA_KEXEC if IMA
>> -	select KEXEC_ELF
>> -	depends on PPC64
>> -	depends on CRYPTO=y
>> -	depends on CRYPTO_SHA256=y
> ...
>> +
>> +config ARCH_HAS_KEXEC_FILE
>> +	def_bool PPC64 && CRYPTO && CRYPTO_SHA256
> 
> The =y's got lost here.
> 
> I think they were both meaningful, because both options are tristate. So
> this previously required them to be built-in (=y), whereas after your
> patch it will allow them to be modules.
> 
> I don't know for sure that those options need to be built-in, but that's
> what the code does now, so this patch shouldn't change it, at least
> without an explanation.
> 
> cheers
Thanks Michael, I've applied =y's. Good catch!
eric

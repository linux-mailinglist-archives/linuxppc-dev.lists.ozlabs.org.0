Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2275139C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:34:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aYAMExHj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=T4A/dGZM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XcH3J8Wz3dDW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aYAMExHj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=T4A/dGZM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCq5fQkz3c0n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:39 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiDer013191;
	Wed, 12 Jul 2023 16:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=aYAMExHjUsDFZPBfJ8CtmN91NY1i5Zrw7TYoNljOvhlGLUjKimMkomdrqe3cmowC0opf
 UqIqZRQzwrLtnPNQqCKpS1tWmJIdREi5Slp+HQWlbfSUNxbr174wXhFiSOtR8Vm/c849
 Tg2M4fyzncFvN3Pea4EiXtAzp9Bp9IblpZhOsQt2vTbjD5JAn0QpnMqOb5a7xbHat1RA
 JqLBLIFmpPhUP9x2ZKjqagLvSKiVCWvqecYtlQfgaKKwjiSdZTMk+FKQrfKx4FjudLcq
 DtJifADcJ1V3Mtxo9tJt9Q0tzHky6Scy/HWjbrFf/qQKotXZdQNBX2LQsR9jQdghmXv2 /g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rr8xup4f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:23 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEtM24000573;
	Wed, 12 Jul 2023 16:16:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rqd2b3s9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OONDA92H8Q3hEWE2ht3zV0pd/XQx5zkywf4gJ+NYkFnS22R6nE0ycmdICBUBkQL7G8qblg2NzR4IGfj1/AaaqnA7p9dTW0wFW6HmYLHT2v7P8UZ8mJjmn3sCdxH25PvxqH//MI1nH6IseZqsSdZmbir2dveB0tb85zkCjNVLRqeutmgLo9i5ey+rzGdH6Oga11uNC1LBoduXk/WoZ0pApCwhm2UgRK2xXBG/hnsvmRg3BeNKduzckwYf6sZP+TiMr5kwwTePov+bdcoOs1DMrYRI+PIJAR45OPcMIK0lm35yUx8Vs0DELrL6OfijQLwL5jBw8TwTIoTlWZf3OEMv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=VInEpu3vbYCIcDk4II/I05O5u3m0gtx6uc9K1XIQCaOZvA2MZvblUsj7aN4wuk/vO0Obm8bVJFpXwhdq2uqfNVf5jQIHv20dU06RBiUTNQeJAOMhw23E9Zh43KfuLXMqJwLC9czsNYEYTfjOkqNokvu6DNOoCoB61YYm7sdWnfxIDhb7gZYKvO/8v8pVOf86r+oFWIZMOXd4XfEonHXN5eked1qJsf3iv1iFRHbt0/tGHzJ/TgaGkyqK6j1NdEwcQSyrT21RQXK3ZYV8UYP1BrRIoEf3at7c0FbOQA7ZyE9tzYeS7mnDSzNj0ueviiCMtwNrV+kcK8KY6/zLj1EorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsniZZVFUCGDpdJvQRmkXqDA5GBQUL6Y1dievocbbtk=;
 b=T4A/dGZM6zJA9MSTeAsc9vttElS7E4+2OAz1sI7Uix6R5kWjs9iyQYviitDsauAOirwnt/A6qVQXbXODg8INZrwurC3B8BP3tXHQOW32u2ZHrmIKhB//RykFQbwiDOE06pe8jIbcjHGp0OlELXPImbwG0MZCWozcRh7G+pZsYKE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:19 +0000
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
Subject: [PATCH v6 09/14] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:40 -0400
Message-Id: <20230712161545.87870-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::22)
 To CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: f862422c-ed57-4958-5476-08db82f35369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qxfPKPIJWGUSTBn3CciQEZ/0tRbfyNhGAFUx09j0SDeV3IzzuOU0SfAxWDajjqu6EJlqLHvYwPqmxwy6ZljXBKTN0lKS2TbjrN/9wpfUj3tG7EuqmMhZCoCKsRDm4vYRUWdQBhh+U+QCVjGprVDTMH9OMDC74yu87dNQVvXKk4HvSROLgh/fmRfFZ3E0Tc881cjHc+Yg+UxgdfdFD17TUjPCt/21JMxXRljJoAjl7eQwzdbeZM1FynqiUD3Iw80P33tEZ6tYYO6ANvXm76rbF4IeLHT9ZanTJllVdJ5qL4TwxY0oZJCk4BRGihUcwqiwNEARqmowNlCxYK6fgClURXxe4zidOeNaKTckFqZux21LeM1u/MaobmlLzbqG/tVd5fS3zQS8gtV184hUht0tJKYTuPO550MTO6eceAAO9wkLcgsk3wjrEuBMzu3XohuPjXcQ8541xne5RJr11Z3ymlaS6yRiAFGVGKrwkwPb4+yL3RQwdRYsr2hwKEaQCpb9FnUNHXMEspc1tI1byZflvlC6N42T8wLBp3kACtN2D2elE5dwvU9cBfc4S2ZD6IDHo7dNWhaF8cMvcctHra/vybsDRrdOiOjU1D7KD6gDpXQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vFXxd4ZILCYuUEu31/zQmQY+m4QDNsacEA4O5R/mbB9IvyVt3XZjbECgpjIV?=
 =?us-ascii?Q?uPWUiAbMCd2krpuYzi6WR8v5r0m4OzlUh3xQiKcHqEt+NIlssaAAkJiaXIcP?=
 =?us-ascii?Q?+sMrWo8HXPkvyb8G5py0uTISU9hPzheM9wBm+1PtCXH7Lqm45+00841l6VCI?=
 =?us-ascii?Q?gfEklbGiAZUqwqzg87jKvv263SVyoUIy+H0C2LAvhWyHGedLVRYrZ5hvRlFS?=
 =?us-ascii?Q?ZPRxVm8jTJOwTwcuDYh7QXjF0rKeulHVDBU17jNzk1WeyDPhsizf4Xxj7dvp?=
 =?us-ascii?Q?bOw7sLJXTQmZcrpegrTpvzmCZBj4NPz+e+uRZnaB1DmmlJQU+Hh6EDnjytBB?=
 =?us-ascii?Q?2O8oOJBwvFvhpKsHkhIyWGWEWscSZW3wBh6yDO1vm+aIYLsronUhdy2RVq+K?=
 =?us-ascii?Q?KHZot7LAwVFAdlOccO+2EZvN63BN81YFI8ZUGYXhbpImU/UGyDOh+9gqQ6uc?=
 =?us-ascii?Q?C00rI/T6NsWzpVLsK2HbOBHxUQ5bmqbIG45R1w1ynA47Ajo7auA2z2zKxXie?=
 =?us-ascii?Q?4HMxhBW3kwBX0FYw1gJoyFgdQQa6AXqyu6WUTtsfsugZpQ56nHTkvPvrfwSX?=
 =?us-ascii?Q?w8yBf9zG+6jexxLuP29FCbkSmk7tVtNgnWchgvk996mz0Bpyj39FUeyLCjlK?=
 =?us-ascii?Q?gHlERdY46qFd0e/3MY3HieXuBhDww04LU+knn0efcXhsP6G7VBQ2q+7Tdcdn?=
 =?us-ascii?Q?AguMz5hpMYgkNF3Raxs7v8hX8eG5e+785/fKjwnsKx7z2b06FzD5hHeUtj3C?=
 =?us-ascii?Q?hDebgLG2WoDzOIkBI1udD4tCqwul2JsA5QipHWojh+BJiIdBe0gAxJFHL5oZ?=
 =?us-ascii?Q?9mX8CeB7R2aEfmd1G/y/GveBjguTttDnJRwdBeHhfD78sNNs7KrwGPA7hDt7?=
 =?us-ascii?Q?FzptLN9UHor0SPjdNXKfJo6dMUxuEe4w4k/M+CRh0dK/2L0ajABM53S13itz?=
 =?us-ascii?Q?DVtD6DmwO8Zwgo9bzfl6ftjRZ1XHDdhUEx2XIOKLPRKSEHM6dbP0xAMJIbfb?=
 =?us-ascii?Q?G3lvm4RjfeRXi3ih+mhcM3LijAZlf1WUXxAbqK7Vy4pW7gy44FWdcWRhF1Q5?=
 =?us-ascii?Q?UPD3WIjKZGDaoU1yXFDZaIyR7ng3I8ciJUA3MGCGBwgiCfpQjkhUw7v9PI+g?=
 =?us-ascii?Q?kK555FYe9RzAfgFbidhhhisq6DyITJlmN+Svn8iSdXiz2nTz9u3zJvFQwJHo?=
 =?us-ascii?Q?VaO39CbT1EmKCCiMetQnPEvefQkqqRndj6OdovMX4x1Vps7I2FbX/wQdMB42?=
 =?us-ascii?Q?JMIvvSKWpNQ+P75B7BBub0se19sa48rb7o3nO0PF9TpU6XbO2+9lwWi8GOPy?=
 =?us-ascii?Q?euYi4VfZW5TN/xB/0TfNABuwBLdYQGf8zrPxGfj5QzsrMQJ5jJ/cRjeTh6G2?=
 =?us-ascii?Q?mqAzF9gE74OaDCC284TfGwaDw3qgaObZ+1IwNjCti+LdogUrolBblOyJ68a8?=
 =?us-ascii?Q?tnYjP/UFDYCnvYyN550IhJcrhRn36kRIiXFPET0CaWXXwoEwxgfphUwZRZa7?=
 =?us-ascii?Q?Ke8RFwj0enooH+9O1MWkPoZ810y+dxvY7rKy0QyEf2Dil8a6yryHQLos4mhz?=
 =?us-ascii?Q?7oZuRp41CHTFDjct46oXqQWPspylzC45hTw1vmBc/pzmIRwHf7x9KRjsJPrL?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?+gCn6ZdF3r7Oi0CLPE5/6jAgXEIu/8N73Fw8ErEM3UqIfZ4IXS1ny68BznLy?=
 =?us-ascii?Q?Mycvs+Tyh7vtDRXpDPxfLS2hSgV00MUDubF4FvUGc+sMJF3TkPhQ7IWW7/4r?=
 =?us-ascii?Q?aEWqHZdYT4SzQbsTTTC4DnOBGFQ3quwAu90nXdsQBgrgSpGrXPUSIA4KM3GX?=
 =?us-ascii?Q?pYwRqBzFCuqTg7FFLHK0N1NRreisj2vtDiXzoQz1LO2brMmV0opoqPo1zXdZ?=
 =?us-ascii?Q?efPG5y35JhbbjYKKx16cNMN4UjoXFgHL879w3cucWgjhrVegpfRk7M4QlUJB?=
 =?us-ascii?Q?lIk+/pmRk9x8N0QJmyYEt5wz+4bCIOsRmx8Mf3JtGMdnSLLjacYLUvUdVGJ/?=
 =?us-ascii?Q?nc3UmHWs2mJ5Ea4eOY1tW+reLW5W/3vHqiKQzlpTeijZLDNwt2cwwFX/i6jX?=
 =?us-ascii?Q?qXT68BwDftpIGtm+e3uZ7wDKXasX3t9Y8IEIN2042XeFa8XDlJUTKC1Ugy6u?=
 =?us-ascii?Q?ozq3IeA2QBvjuZC6odbFTXeAlSpWYPvP5GYYtpPtX7J3VbgB6y+BcpFML7fE?=
 =?us-ascii?Q?AtcXi690bxAJSHPfihSODQueFOLXaco3O+VNbGdMBzUXTjReVlYX/4h/gHFx?=
 =?us-ascii?Q?4aNQIlQ2lKEcc0+APjNdcl4FXklV4Zk77G00rb+qQ/B/lF5M03RqFMZoibse?=
 =?us-ascii?Q?iunECHe6/Hs0JxDI9aUMNVPiqpqeTtLy06pKYC0mG7pdbXpRtyWr5l9k0yx2?=
 =?us-ascii?Q?WcQG1z6Cm8WcR4VTKRSN/BMQv4GOzHxuDnXPUGxS9wayM879ln6hJ+rWOMcu?=
 =?us-ascii?Q?IMY4UDeiZj8fow/0KBmTr8yIyOWuTtdu9V9BpIfZ0uq5lPapocaZkIuCbS9F?=
 =?us-ascii?Q?q/9fAX9hFhU7Turol7sB5G3so2HhBowfsitF9tVOMBT6CzGOcbBkcCXZHmF4?=
 =?us-ascii?Q?GBFQ+AS8H65vWdP9WAmSS7FwAWA21fw+vOaTsc8M4uf/l8IOCr6j7MCsJntV?=
 =?us-ascii?Q?QYCQcqTM0R1VJ0wCelrYw2lrYM/Pu1ESqKW435+39UW/RG+xGkh3sbeeg2K9?=
 =?us-ascii?Q?7/yHByCBEkn/7P1UqvKQZafvA6RNLz5rty7Yem0BrhAyPcBNMcb3i7D7Grfm?=
 =?us-ascii?Q?z2kyFzg+GoxWQLAlsrYtyc6MEkIS+GuTDRnCwUC1zmyMzo1JVQBCj6zS6oZU?=
 =?us-ascii?Q?PIjfXB0LUp6lLhKLGtlcGMhbARg3VuGu1fpbV2B2Wbf8YCp+eGLTuVfJmjxF?=
 =?us-ascii?Q?/Lz2Vgxg/m7wJfgJKLLHV57DnPOWATS3j4AHKMA5G3adtkBoKRt+DPtLEI98?=
 =?us-ascii?Q?xuDjarJvUEKYcRVF8KEMuZbVkXBkoCyToRJ7DnsZIP1BptBU9KCYofrzss9N?=
 =?us-ascii?Q?cvBeJfwsHVOL720Nh0VBjX4KmC5sgT19m0yn9dyGlLjy4lIcIRcFEL2cCBzn?=
 =?us-ascii?Q?MFsBH0cJJy9jYkH/bnb17ASOtkLidOj9k8vOYSXwCnOhhhDUeTGAin8eelO2?=
 =?us-ascii?Q?81mca8GcVgXyElsVjj8OsGzmLUG1i/EjAyQlO2mG5LmdJs9QvIPxcuX0DN1V?=
 =?us-ascii?Q?e2bDenqCj3Sl3t3ZFeqaqVaqFUYYjfjf8q+VKWaSB7bAbVK/KN+q2XHogxOY?=
 =?us-ascii?Q?DTvvrn0nNWiaEVxp8l5SYvX/HHcc5BBb0x6dlpN2+u6VI885TjajwZVwM/yI?=
 =?us-ascii?Q?59wqxIoIGtawjJkqQ03UTaJCNW+Bj+hdw+bjTNMgRvX3ldrAmHcQzerkDpxI?=
 =?us-ascii?Q?lcF6aAmfFbWpps3ciWLsd57ec9KVg+nzLFcYBH0x/PopgNdX1xpBtQKWsd7I?=
 =?us-ascii?Q?7UZT8kjDTmCPaoV4mXRri719H+iRL8+LT6mT30p/jKXt2it/GH7K4eKn9pZu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	ZUhYzArrDY7VIG7JOZMKEvjB4DQZ05CLyHz4U2c4ysDs/2K+wmP2ZTfmKXSBH5M89NZqd/4DzyjbV5LqyZjbjmhSgByxMLtSCStzYa44tfZ9lWcjys5oBwnvpf5x4G+ptixxAk8zc6YKztFFt4lOwOUpcAfVOjaeFEAKfnG2lprvF64Rf7Ii9d7dTwBQD2ZTUc701/rFyw2QX5uGan4vQFdk8bPJByL1Duw6mw8rfws+ki+ljX9Fi9FsoBYI4/2qVDqsPbXsXxi6wwJ1dUje8H4y/7oZ91E7kh2xjJYb25kRm2Fxb6jkELSGpyaa+XF40FgXmkM8L3OMLMz+GIflJXRLlG9dW1TG/apQj/fXAYBtxI96HGzWvUNcbIJ+IiUcpNmNwc5KXvZ372oVDLMAeBwIIRbfT+rdOmdGzkehSKgWUj/QQbO6MwqrSPKU2shdhJGaE/9YjhAg5w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f862422c-ed57-4958-5476-08db82f35369
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:19.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2VLEcFhTw/CyWscpR8st+KdGSNcNhORcL7BVT4yrDuUy+tR+s07zPNLoWkkz6B+suJAdm6pKkmXcYZZNRfDq/BNKfubr4V4ciKZ/6AqyeAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-GUID: zBE2sSzPBeXPUHDoBSY8yJt7aa45PJti
X-Proofpoint-ORIG-GUID: zBE2sSzPBeXPUHDoBSY8yJt7aa45PJti
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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


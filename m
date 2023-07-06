Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E374A76C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:08:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=mBcqWW5h;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pzeU2oqu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsfB5DKcz3cbm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=mBcqWW5h;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pzeU2oqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbM2m2lz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:19 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LMOKx031943;
	Thu, 6 Jul 2023 22:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=mBcqWW5hdHFMCVIEw2cc+nyFcvlI1YvHQGUj1eVQLx9qNiXkiPzUTCFJ5PhJ3Dqjq8qH
 cooaEknv7JMnCYGgw0w9KMk4eBKouZYcXkhUpZrOh9mN0fz8f+am9pEin66WF/G7q0pn
 FeD/+kZBSidcOeryJ30GeQyLXrDomdd62/w5FTmEgrcaZCiTx64jO0x0VlL6ZWgXUDwR
 wHqHjFW8YdLnlmck2iwhHjvlWxEqtMAkjblVScMmSxkmTK9s7iOBDE9O0tFEdHF4wjeY
 lFOvP1ivKvjJetWOzWOCBMLY+vk+HBlVGeVOsJ6iIMp+3jI2bPsoHmNx2HKOglsE0oFr ew== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy88y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:04 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KRDQQ010289;
	Thu, 6 Jul 2023 22:21:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7n79r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmTRGEWdUYtkliTf3p5XfP68UOOt5gdf0wuw97+4kytGNx2cXM1f7/HVVrIvfriUL/W+oPNO/feOVyngqE7TvkgD2S41tq4AzgpAZSby6ve7bGCQXnOmBTlHYd9lM0vgfjAlNb3LfgCUGehuXUjzUyOYFTErm+p1GQzw7ghK3O6xR3eXlLRqH6V646YxvMjERvf7hkqlZwdqRpUd/Rf+B9cuErZeSPZwy8cPNoSPuBKUUGjJ6x2kkz7M7qZ1v4UC7qg4nvyXd9QnVCCZtYHKGJo/MirhA1rhNasz97gpa7OZxhbpah/UgxkkTz5qFf0lt5zFXkbVNnBOIDjrBGP9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=PSTFLGqGawhRK2hdHZd+xA0GELQtvKwdULeBZuI8d/TIY6Ee7aM4IYG11kZzA00sp0gWHarjKZ9Be6ZE7hYQHyVvHEw2EIZYBx5/pSb2sej0Ie+OLMSrBtTkv6a+JZlQi/gCfpqYp3TsiMUiLs3CAfLzcF+kZ1xuOPK383sygzuXVsiozmhaqmuTCsRv14A9uA/x1tlnRlP7yTAuRFpwZfqA3VTF/Wbw8gRttzHjyM6HqiV6b/IukEpMibOI/I/iJ1Xc94aCIFici5otHaFFIDKqSorliR/hS6rVuW+8P6EiALP/q243YmabzQG+frRZ7xK9PrR0IWe+mq/7xZV2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xWNnvvjj/YpAAMILqrnZ04bBw4w3zxg616EDnQCP+c=;
 b=pzeU2oquFqIjgAYkDlDIZwa0qol8NnAdKqGLc+mDAWKsiugCPcNKhB7TDEh7X3wsa9PKRMeik01lFHickXW7FnLFlCBntu33i5quWZPaA0TZIOP0micAo8RD7DYjCsverm9mo1gLknPazIAskeQd0fupry9ZBFx74Wub60FqldY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:00 +0000
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
Subject: [PATCH v5 07/13] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:21 -0400
Message-Id: <20230706222027.189117-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:806:f2::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc31d8f-fdb3-44a8-224e-08db7e6f4766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LFEajr+qSUN2mP4HigD2EPieG9AlsXx9e3hmpNMaGG+A+yRIQsRP+kN+AkVERCnodXXh7H5hS9gX5XTms30anXAPAIe/sOkpjiemteoe7I9qGNXpEfyHop0E+hQMkC853IReyTRN5xt/ySb0+2eEpCUiqpmjvX11mjIPeH47e+/+KUDR+DHyKk443px/FvNRmYKIZ+gYX850hJGR0MdX3LMlA/vhCSBjVCTfeOlE8RZh9Uui4m1UOzlAgdTBQzRLFzdTPDDL8rJKuFLQMBsmXtxggzxp7LGPQm3nkBFyf0Wfet8RyiADb2/Xk/WWV63DgUSWPHKICQQuU9zhE9f6aG0PnAVHcbpGUleILa3Hg4xiR7v6B47XJgaTGZE7sMYiedXJ5mcVFJ9v87mF3r+hPqe80vYc1KqJK4xAEcA+zJFVJlFwgBYoKOIo92HJ37R3vD8HgswnbyZO7r/tFeLVNcIs66Emy+909wnR7aqs9VHxx95mD5nRAiKOTSJWGF3ihl3W+uTtuQJi/nrf5LMAc8GCReDud3JMf7oWj9Q2apHl45E2pt6Is9rhrz6VwfcW9xlMAlofumut3BXn6wA3njLik0mdk15rr25YGugYft8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dvE8QwU5Ls6cBBUd+iyplENHfIIPt43KWT9cZhOcjDCxI6jIRFMICG7ZBY6G?=
 =?us-ascii?Q?7VSskyhpAmOST1u6mSdDSGRaKT3ZI9Mb6NrQCe1NWgy5tUcS9hleeCt2wDZy?=
 =?us-ascii?Q?7VT18DozgHtw2bC7hyVL82424fvzFRKOWjjEFlEQQM0BGs0sHtlqTwC60TDi?=
 =?us-ascii?Q?5Bv/9vuR7Rlq25xYTBm5MBRocKFS2y/FnfAMYcT8O73JpxcTnhZIDySpdT4u?=
 =?us-ascii?Q?SsIPa2idQ6VbVVlrMTyEoRwkfTAVKy1VxyKNOnaPYPs8XKtqOUr2dWW3JwYK?=
 =?us-ascii?Q?b4zW9h1ItlQwujvcq++0ixKsLT3tlHKl2GgBWF25+AGn2XW4CgMbRJmtWnY3?=
 =?us-ascii?Q?luioiUIYyQl751lS23xO2jhgYDL0rKhlaXwYVxi6/QafRaHTR9l+HJFk+s1R?=
 =?us-ascii?Q?ipckvEQsw5qUVID1Xp8NJSzy061d9NMWRgLmlv9F0BlDwQRIaGt02BdXp+Nx?=
 =?us-ascii?Q?58PPIwc8Qh1votfnIFA1uwbsIXrPg72o+alfe1a1rYAu7+/Yt7Wx8M/l3+M6?=
 =?us-ascii?Q?YMfepOlNjjE3/cHefzHCj6xCFFpG/58rweH/0zCB7pM76B9mSJy+BUsPjoyC?=
 =?us-ascii?Q?5uIBY5sB+juvBwuFp5KMQ33avQ5gFye0IAOIt6qAmbifxvOjLnfB/Rq+sBEV?=
 =?us-ascii?Q?whmu0Zu0pyptX3DigzKYw29n6HR+2oHZrjePXyFsVIyFxarY4PuZqaj4aiT0?=
 =?us-ascii?Q?yQldR5e7BAt/T3/krOldxqb/1OJnw/kY7QyNfOUiZ3Agzd+OjyGy/k/7oztN?=
 =?us-ascii?Q?mODqBad+vd8CsidjwJ/81+LiN1r3mprJNowxaf7VUnF21buXqCvO1Wysrr8o?=
 =?us-ascii?Q?uS/47QvdeY8xhjJs20nhrglpvgxZakiUGSHDl+KOWIq3zCYp1Yv2mUwotPEG?=
 =?us-ascii?Q?d2dWaR0cN5vZWbR8io5Oai6RaNzP7721lCPO6ktfLd6SdDJnFhfcyS/twQCX?=
 =?us-ascii?Q?MBFdrqFxmCsY359UFyj+i5cOpbcjSLmawhzo1sUbMrVbPg4cmkpaTMRFrgD/?=
 =?us-ascii?Q?e7Iyd1JMD2mQ6b7rs/upwxx5DJRuDNp6n4Ukkjw04PbyAoNMF3K7eJ5IsaZI?=
 =?us-ascii?Q?mY/61fzGKbRTskuY8114O9EziQPCGyfURB1Pz//qj4BVhGQLslNkAexfPqKA?=
 =?us-ascii?Q?VSSKNzsa1SEDfoVHJX9dIP6O8OPLCwaDXwLFPe9lTPqvg8MIQy1TmRIENpEC?=
 =?us-ascii?Q?pZuKP/S5naEB0FJOANM8E/k7RHmwyEwaP903u8Bp+o9n80WxDJOFHdrnZl9a?=
 =?us-ascii?Q?3MSsk9h6BkTVBHxhQF7KUG+BKZ1GTQBjufZAYCtegMlrk/fjywXd5IKjIe1A?=
 =?us-ascii?Q?Vfo6LNEAyqh0MsYvBU9foh23zYnO1wXOdOVA6a82A2TKDBgImtdpeWRAdujW?=
 =?us-ascii?Q?RhtABCfIU/Ff5+gPaz0oaa3YSF5M0wWUHE6zyA9jMTR29yxIpLHNDZU5gpwd?=
 =?us-ascii?Q?0tjcNNtPzjgnUMLp1mn+LMCQckWgxYDsi8cv6Vlcla4E43aiD2PkcCkxaxA0?=
 =?us-ascii?Q?MhahqczePQsLhosYMZ+WMDrOrbtRs1QOL3pjh/4Nb4PNEZZZ7bMM/E3iKtNL?=
 =?us-ascii?Q?aQN3pKj6MeNX0B6RjLJLBMwW/9T16saFYM0vOhrQ6Uv3hzzTjbcqNSZLc3FT?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?7K7Z9sDAkWYJDvFZBodiYdKy9s4J37yS0AtyqelSSOjjXxIMINAjABRf4twb?=
 =?us-ascii?Q?TrwMhfSrCPqI3ijELc75qgJQWCy4iD1uDT9ioEP8QeduI0k7SN/wrTDita7l?=
 =?us-ascii?Q?UIeO6mQY8Ygfcg7sBnoIyu5tuL+aEtDPHaokpa3IJgh1rkeKeIeHYX8Jk/mU?=
 =?us-ascii?Q?qIGPtzvPBkCW8w4LUI50HJ+hZRSgZZOnn1gX+lfmXRVVgQ4viQNkuKpZJHa9?=
 =?us-ascii?Q?Gqk3hD7WuPFUqrPdtSgyYjQaGq05yvry7dt0rpDqIER0ghTgOphVEs9VwilU?=
 =?us-ascii?Q?UjO7P39lD2MFDc2yvuKGCzFJ8Dq7YKGLYRJmUz06d2OHfSATnyfiVatlHqtV?=
 =?us-ascii?Q?FNwy33LpnAI2m5nhOvdbimfyEt2yooOEgPQY/R23SVkX6eZ838KepbDh1Qmz?=
 =?us-ascii?Q?8TlBUr7Ug0acwxAu4X4GOqX4KywbfI1+EdueGkcXJo9JbBSlDYo/uH6OL1z2?=
 =?us-ascii?Q?9pLtOrPEFL2UBPwHMX/8Tey3H0IwAfBmbs6fzEaoe6dQF5+FFqVg3ZFq0GZ2?=
 =?us-ascii?Q?YyxurFJ6gqWn5BJwqP2+KT3BKxij9GiiWPUwwy050LymcmLMygDR0kyHh6ao?=
 =?us-ascii?Q?3Mc8aILf6CT4IzmhWVEOaZwuuWNKyf2Tppszdo9dOFMlqebqCNLA19xImq+t?=
 =?us-ascii?Q?fkqk+ttQfG5LqpiqZ8/GHpvi0inLfTSAaY+9GlgIPkVFbuNb6RV8cR9tyPtA?=
 =?us-ascii?Q?r8ArOTJnq8GfK4YmPHtlowq+ia63KqThra05KmCezleu25t6ZZ2vhwddF2Pr?=
 =?us-ascii?Q?2nIF6Pf4cWwf4q2RWTTSyjnNGm66qyG0vPEcXy7H+2xn3StSs0uEM4s10o39?=
 =?us-ascii?Q?Vkn/DTVXbxZ4KX7NzHg5II3jfiqp+m2h6ahdoaQYVUycJsRUfxck8H1qLYde?=
 =?us-ascii?Q?E0h1hXkkqVCnZ/ygddObnUVzpyZ/5Fco7VUzjFk5AJYsucFDap36pszmSZDy?=
 =?us-ascii?Q?kzKQxznIaari0DwnylRdjZU6XaDNpUL1jzmxw6EvYW6l9vVfwHLhP/o/+aAo?=
 =?us-ascii?Q?5obECRLSLM9s5CZDvhDQs/oWa43aY/PlnyCp919fszrdu5Yqq5xdyztoQcXq?=
 =?us-ascii?Q?FI0z/AavARS0UBqaJ0chgXP5aG3jTxjN1SALNynGZSL+Jlk3FmrRBe7DOnK5?=
 =?us-ascii?Q?ufl1YFMMWsv2jYLarioZwApFQYcY9imqTS7FNFZmk5mTTny0hfVsYtpJi/zT?=
 =?us-ascii?Q?1NGEiaNKRdcfy7ENopX5ynNW4uQCa4LszrMcYfhIVADJueG7CnCAGTmRTsI5?=
 =?us-ascii?Q?M6lbuHCSKcWWwTSzYlcxGW5hDXjMJ8RRVwtDRo91FqK04EXIq5PKg+vPOlex?=
 =?us-ascii?Q?WUJ/6mbWHrk6UxUh7sIygD4medUUsOX+9oaRjDm46aU6TmYJOd3/J2beowwb?=
 =?us-ascii?Q?3n0IK8pZ7qAN4L/sE2vfihxgiIVofNro4fnJ7uJTNsWEpvkDvFnDqXy4EWGK?=
 =?us-ascii?Q?JPV7xxWmHuuSWD00t5riyTVwm6NPHi0xV7Tq+gqrvwimAJDD7IbSzoHaVOnY?=
 =?us-ascii?Q?GxaBVMrYqZfo/JJL/gU2fszhYCQSnbAGk0D8BivCBOe4juAm9aGYUEaeua9z?=
 =?us-ascii?Q?Fwq//mOs0OfBUAK2uvm/Pp4YaTZkdKh4SaLvgOudoNQi8NeV65wY4zXWMO1G?=
 =?us-ascii?Q?yWpqFZsCurNuw8wKP1ZgkPtPVA/o2Er2Ozem2gy31IVjxLv7BTBw3EdsPnA6?=
 =?us-ascii?Q?Uj3rqSopdyc9UncoaWQWsLiROvOT/6pWE8Ral6qWy1elt1X3miZTTtuJuyzN?=
 =?us-ascii?Q?dvi2q6ywNTD5WGhnshmwkFtEPRmxMV8OTVX7gtqt6EzR3uFV3NlaDohOSzJI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	do9kmbg22wKa3cAfXWDLbYfblRxl2EjG+nQCGm69+wknvtXxG1gqOqX1QLbcNkp5z6p6vkHAvCUoo7q0xjLsRN8gwDu5WmLsO/p35DR23ffw3s9MiXFTi9syfGOAyqTPQHrNSFArmBJnju6xNNVhzzN2tYhaVacx7sOrNjrvATTzCt2LaL+FL+Hcai+OM4bu1oR6MLonakpgsbNSTbKYaIsXMOshFsrwKJg2InExn9Fo8w5AdQYOGWTy0ie+1mJ8zs0S1xqU5ALMidx8UALLKYr4rpiz4VcvafUrb4IHpmt6+CYG185f8Dgdn8uky7ExC6/HFcD5H6tPYbZK0ylol9hWyvNgOqg7L7Mb5yv8WvO7ppRc+1k9/I3qfm9Yua3wtNjJVlfpLi6gEeWHRcNNCE5igAPYdCwZslif+hTVEXkawTyTPD7uMmOXTKB605Qlga1kce/2ipwIBg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc31d8f-fdb3-44a8-224e-08db7e6f4766
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:00.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CyFDMfVh/pUwl8f7vl7RHMq8Nht0AcbmLpKJOL8o+k8VkshJ423jPkPlcfkTv/rDyUtIHcfDbL7dNHUVr9EJzQwoeK6IieKgUyzHeg7PfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: -MGJuRQeLIig-co6PfzXSyizISwjvDw1
X-Proofpoint-GUID: -MGJuRQeLIig-co6PfzXSyizISwjvDw1
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index dc792b321f1e..3e318bf9504c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -89,23 +89,8 @@ config MMU_SUN3
 	bool
 	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
-config KEXEC
-	bool "kexec system call"
-	depends on M68KCLASSIC && MMU
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1


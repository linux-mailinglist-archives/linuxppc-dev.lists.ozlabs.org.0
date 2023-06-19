Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86952736016
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:21:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cPM80eQS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HXwCzc06;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQkH34hMz3c96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cPM80eQS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HXwCzc06;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCb70sMwz30Xb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:14 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nEH5006337;
	Mon, 19 Jun 2023 14:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Rn/PjNE9XMX4vmFEnibVDmYwZDDcm5way9PJ7eR8fmk=;
 b=cPM80eQSgVDMQskfu+vD4xJDH0XdXzDi4aGK1qXD5V2no+udAGpTdXlWKFSDmj3AfRM2
 Nv0B8tObtpHCiiZxcXsmChN338A+iLwwi1WfOXoElKyuT9KzJ7q3Rya+P4Bno1E+XAWt
 pHzRDVSDQln21j5M55WlyqGOAZwXENp6CD+6qpko21JVb5LjUgQuMiArEMwcpv2we4qw
 JDBe6RAEEQDho/PbdgkwqZrYqEFv/+gibUV0B//4e2BpvjFcso4N/ZzursQbY8+Mfoik
 O3kBo0IegvXBGkk9j0gLq5gbwUnOL12o2VkdollZShqm468JH42iIt1iZeK0YUhHq6Jz 1A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r93m3jx6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:57 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEwpwJ008306;
	Mon, 19 Jun 2023 14:58:55 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393sphj-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLQ5B7LB+DfzQh08QZOSYDf8WE9S2Zo0S4ueEv81KdTBh/D4VWO1BXIyQil4B82NSz8wUym9bmIld0mL5otaMZCvg5EBVkE/fxPO1qrDbagM1mUoCzZKywbaD705RpTs6Qdsb+JgHLDHu6E8/zVNcw2OG5SEHw5kIuvt07iD1jhcyj9n/rj3UGOd1X73lqzS1Q79fOpea+BXmwY8GtAPx4avfoLekQuuyiNILzTzRP5k3SAuSCjl6P9kMRzfC2VwrvGImYzmVrA23QBInDYLeWiuiwKOhASwDOHy05Jd+akzEBxZIDf4xp3poxn1FAPV1w1g6tVO6yuBSB8vI5pqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn/PjNE9XMX4vmFEnibVDmYwZDDcm5way9PJ7eR8fmk=;
 b=aOWIMy2GvjATifnOli8kSTtsJEfgy2meAoe9q25uKXoE08v6Wb5UsGQJ+3C8QYwoZUHAHQg1BKElsrUx+uzwWTVFOqmnH5wdkR/ZtRkO6EEIMrkJaBQFF3wabt7/TVphsTJ/v5y7fKnq2TbI7G0zIpQR1UFL5m9kVeaJ3Fe5w2xDjky4rMiF2RGmrjk//+L2JMPIixOWOmU/rnoEfRRwXP5hsVIhddLAxwoxBBuQybV6/i+UrH/GG6r+fJRUF1SzzDmow0zSrODHFbH5BJ0X5kS/CrU2akwI+B2xzNTtFEYsdnunkooNt7owR1dvnwBoTzKjpKBZJfMN6itrxtqwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn/PjNE9XMX4vmFEnibVDmYwZDDcm5way9PJ7eR8fmk=;
 b=HXwCzc06l2qoa5ZFPhHIINyu/dfwW9W1mg0yC4XHjzgLX3lRwg/o80yGRk/8GnpxG73Hgpkoc+i9HmoeVTF9hE+YqJ65A0TgPjZF7f0YiStXgptE5o47+JIhOmCbKScuWdCbnzLCKMMR7xnhcMl9LfBB0yp+WK9Fzs1QmCjCjAM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:45 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:42 +0000
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
Subject: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:58:00 -0400
Message-Id: <20230619145801.1064716-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR06CA0042.namprd06.prod.outlook.com
 (2603:10b6:8:54::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f485176-6c4b-4349-e6cc-08db70d5ac59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6DCriHaA8pMhLXFmeacXKWpJYcEjr4vspjpG/VqsT3DtVRyTbqgGb26dLw41HM4KtoZ/j3hhL9GltwQ2PsVB2RQlep3K2kPvGfCd3KJpmgJDunZaDhcnaAn1oc2GzsXebTk2UUm9iuju6KkTnsqZJhbz3/IgTzMa1Wna8epHYItBJO2VXqUP7o4ditJ7Z5/Lurct/T7XUD2aYC2QSQa4N3X7gviubv3apBQpD3dDMMVzhXMl4SAb1yvSETJw6ZroWln1uqL4wBZDaMCLQMG9BeTCs0Addg9lLdswwwQE1tYcgmwHBSwkxnW3oSV3TqKjwt6EH3EthJUWuuMphELUafAnEbZ7AP5fz34RKydfHaoXPA2MAxkZsrx1KNEpiE91WIa/lBO9MwECUE4QRxbve4fHnVuA5udkVlJeW2kzkin2TsNy1rcdDXO3YGkYrfsscdPbb64YvMgQIUgmvTPPBb7XhciNVP43bfU7wIZ6fBl1qAHOCTVJDIaV5A7ht8Vehwmk31BOaSBrOX6YhvXrLWmqL5Uz/ydlj8YMg7R56O9ItMpespYVDKFUvLailBsK5NjU+Fz3h1/6ECsvKeJhHk6l+q3ARWrQC0LhU8diu/c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(66899021)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?O+icw1Ll9DZWtS+0zlWox0Hn87vXW+gdVbRFKWDzNTKilM4wLeS4TFHvXXxA?=
 =?us-ascii?Q?9a+qT8gTr1hgnlGh2TI5z0LaO5WDW8HiqfwLXh1N4H4cNvuA6QIwUw5HCYxS?=
 =?us-ascii?Q?Wr/wJf9ctm7KRF9j6GJsxNQdZM+N7lCFpx636ynDQ45TIzVfvy/jQwsuhcZy?=
 =?us-ascii?Q?LHcgUkT4wf2YW0OMV46G4zDcx3zMhloO1L3WobcRMmlMxvK8Mwk8rFzfQGPi?=
 =?us-ascii?Q?fWiCHS/ipLzxo5WFxh1iZ/cvh4boz19fMUW1md+RGcpTmcNRDTOUVk0uEYuv?=
 =?us-ascii?Q?2oi2WHvqLlcgbd3S3VLRZzo75hmrZRcs9pmhCQEwFcfQ0SM/n3dzB/B7AN5f?=
 =?us-ascii?Q?XJonmFALqM9RrOOz5/nnSFYFl/L7+L6LBKCfjpHgqRy0H7SuSfNpCFN6xSgL?=
 =?us-ascii?Q?uiTzDXcgMaG/Pzrq6UMEhNvyU72/oW8PZvXsC8nD+As/g+r9kLCf8sASs7Ip?=
 =?us-ascii?Q?PWncqSf9xigz/1NZI5LpDdr8P54FniJy+7a9N7WgWzO7d/3S2N7YZTRiQfAs?=
 =?us-ascii?Q?1YHlklq0yJXvUOw0mjjRXYhozG3pSJydNsSzTKQJGESyYGwefEQe7cNmwqpr?=
 =?us-ascii?Q?DZHi5h4KGaZEvFWY3DaLeGwggz3LdDQwas5kgbRU9lwL1/oYt3LmyCrko1bX?=
 =?us-ascii?Q?snlym7SexLHuvCA1YYqUM/LzZGHniRVhc1CBxRrIrn0lvJ8lYaov0NkqKVJB?=
 =?us-ascii?Q?B1+cA1vsLSTtEDm2Ia7+AQkE++XEyr+XVmHsZelLLVBgpFT/BoOpP+s7jmTN?=
 =?us-ascii?Q?wc5FFmQbJOfLPhHZ7KmIc78ZPTL0I9/O6VRFmzwOKv44LrtH4WhIZaRwHKZ8?=
 =?us-ascii?Q?gccb5re3pgVdV8lHiXYqzUIJZ083KqFII3XqKSpul/9QQmLHDwdFXI1xaYY9?=
 =?us-ascii?Q?Z36kgWIvONHhU9dJaIqcDSuAgcV7Fig77FxpecJgnisVAM23Xtg0Y3SKSyrM?=
 =?us-ascii?Q?5v27ilpnaJNmvFyOvVLRi0h7LbyKHds3AFy7yFoA8Kl/4fnImrHvugwu2LUk?=
 =?us-ascii?Q?D/x8JIU7ra43H+f5iLt06ILP7DFW8UOZjJ39Rp8NfeGxd7CSynKIz0T/s4jD?=
 =?us-ascii?Q?0mvgfONvZ2odbIxxK5V3veJRsrMcVoCUNkeZUSSLFleBwH8B5FEg4IAqgfe+?=
 =?us-ascii?Q?8YlkvTPnMKl+pk3aoq0Mi1qMTfsHek6Jg9me/A+BCC/vn+4YPYlc/++7eUyd?=
 =?us-ascii?Q?FXkeVfe7obt+NOPmSpdsp6iaTew9QFqMm0UC7Dey+Lihn2FfaFcE5VCL8Lbh?=
 =?us-ascii?Q?ml83cIAmo0dZ+M9am8sPJ7Xhq+1Z4RLAJuAhY9qBjtwKzN/9E2hQ+ZNaEATh?=
 =?us-ascii?Q?O8hK1ha5VkOJURVUMC/+1zsvyWEPWS9pYazRD5KoLqP2/FbwSek5FLv247fu?=
 =?us-ascii?Q?3QnU2Dc47llSu/04JRNhVsNVmpZcuN7diWB2VQ1/4wOzwXC6pipKEL1b/7EH?=
 =?us-ascii?Q?KkV0c0ValNkSAoHQL90dCyInbkLJuRMtpZfX3VrcvRJVOD/EsM58LJKDbLny?=
 =?us-ascii?Q?qnoWWoKqr4nCvuWIi7xA7YaTziifdMDge8FjTYKZBrgxekUaPsK8mujcgw+C?=
 =?us-ascii?Q?E4lsKx6+uUasOjJoCdYOgCT+vck6Hp4OV8UE+/H139xbgBQt6o+bbydmNbu5?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?/vNRcYh5sIKchvP1sUmEvY5wEvi3NAUpvzsDeXzgtF4HPlK0IViRpankVg+X?=
 =?us-ascii?Q?BdNNc5kTNpoVgmzlR8wmQe+r3ThEwMLkZ89IlCo1FQsA1FGHA5xZpNCOsTyI?=
 =?us-ascii?Q?FFgo4KtFsJuOlsMChANKsYdv41ATxxoX84WrTQzgv4ei7+ta0vuWY/vSs+Np?=
 =?us-ascii?Q?c2bjP/BphGC1up3k9q+S1P/hOipdYAf692IihcQYynStXk+Q9OzP5xQ3rzmv?=
 =?us-ascii?Q?TBmg/BbbbOx/CVc4S/IfDhCYzO1wSEh3ryXP3XI5zWdgYJrGAb+hmtU5vYlA?=
 =?us-ascii?Q?LDOh31lA1oWDtapAoc3F5z4X5B71V9wSIK4csBX3/In+WaIz+sQvi4b5xXKo?=
 =?us-ascii?Q?qIuSu8AQQLuE+jsLz3wkyl3N7Nj9mzPOO1O0D7rtaP1WJhYXtmILvb6g+hmn?=
 =?us-ascii?Q?lRl2oH10RXAGfAWd5JmHd2UnQfrzR/ATyXq5U1rssUnG/s+Vun5ofaDq1GDC?=
 =?us-ascii?Q?WPki/7WEE4/HBzpee73wRSAxs16C7mDbD2fekayxsPbes6zGEM3BynDYKzS+?=
 =?us-ascii?Q?ggdnQvlms/6cDPLVb+/6oJTFF9/8rFBCOw1vmfYxhAaR/jchcE2I1oQw+CIP?=
 =?us-ascii?Q?adoeIwHuybjVf+42ocilj7gl7PPl2BYbGUyqaW7DS8XWxxeStnon4BsEFY/7?=
 =?us-ascii?Q?gESXpw3Agc3letv9U097fyLjcSHbBRikCvbRhniAO+XIjLiMIq2Mej/ov/Bz?=
 =?us-ascii?Q?8NHzxj4Pf/VYIHuEzwxFyxugCF2YMGKtLU4R3LbKhk3hWz2YkOojXDKltZWd?=
 =?us-ascii?Q?LeHkt4VMrnKm0aMmR9zS1myqHR2miJsTmZkFTg29BVUJt+OsYo6K1GZ+BzAx?=
 =?us-ascii?Q?XRp0Xi6i6y4mdLm6/TjY8tB0FfVwj7vVWGmOFB8lPYKbRdNRY9532xQUeE7m?=
 =?us-ascii?Q?8ONaba44biQJYyLLIi9vuu8cnsoJR2GKcC8ZRd5UUN8EpZu1/0Qonz+d8Tct?=
 =?us-ascii?Q?XUU8SuakEWwQzYi4x56eU4KPJ5Fxltbv75irqUhMqw4e3MyUhwcp9JXXPrrz?=
 =?us-ascii?Q?n6MUfgqODehs1t265CRBEw22S3+rBNqkS4tBIIXOGjj7FhVd+K1WjSwsk6UL?=
 =?us-ascii?Q?E613ZTvqeFtaQ6VPxTvVuvMnt59vR37v//XCecBWiTlad2ZEZHXw4tQnGTrr?=
 =?us-ascii?Q?vNuntijL6t6KXWCIKSzQnq4g4p6P9o/xnz2V43HE6VG7JhqdybpNTHd8t0md?=
 =?us-ascii?Q?WxPGU8urSA+t/fG5ePFiR4SOxmG24XG9P12ID8H+ckwFbEodoRmd/sYR0D4J?=
 =?us-ascii?Q?X1AbgKZny/mynGWmuk+Rr9Sim9d08K5qgqEx6HIpIjRDcPmwfnU/CO64Yk4/?=
 =?us-ascii?Q?1NkKMqy7ehN81WfGjKXpPlU1IOVBC8nHBycrG//z74yQoey6cPE9+MYKZMAK?=
 =?us-ascii?Q?dtfF4cYaML4bE+pGiCcsOSzOv33jfG0VR9I4OpOiDuaVM4oTc/W1stSnsgCo?=
 =?us-ascii?Q?mGQSjr3V91I/sF+6FtI8VfEE6zwc0Z9VlX9nxYgkQ+38qPVxSaXt2WdyszCb?=
 =?us-ascii?Q?7vbkdD2CXtHagi0u781PHHa1RmRBWYhMLnHY3B7s31viv/qXO6w1tiTCLUev?=
 =?us-ascii?Q?M9VPg7N4TF/GINLVvY7ph59jz2Q5+KCfP4RwTbKXWLXyvy84P4mi1l4Wbe7L?=
 =?us-ascii?Q?gEPOPTwtlwU2eJQDhXU+U0Jqbj/f65hLu1Z+DENyeWj8eOU5gOCz8CZjnBub?=
 =?us-ascii?Q?LWxvZ+EcFBMI9VDANTXsLVMQ3wlFebQPVeDVTss17Jfz0xf/8vcCMi3Qr2jI?=
 =?us-ascii?Q?QgoEdarBwEmx7KQBA4wm6Y2jik43+km5XErgW82n/gctn6YCJ6hUywZbjloU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	b2OfSetH59Rhkx2FkW6LKhsVavtQvgA8Ygk2ch944u/PTCtZJxfX1XatYgFDEMTEhuVU3540DG/HCyg0MLwH14xbo3x4dm79JVvGxRRXGEU2ahyzfkAVnbnEWKf/5XNlm8uFIpM6/bfcPzsJH3Nh3VdKAWJqQ2vgGJrfHHUGihcTe6TsXRuVvV/FFnxJSwf3XMbIm9T4QccXzq9/kr2k8qdiCt3HPRgkkC7c/z66cTYx7PErKZGorJFbLPTuFGiUFpO3hzu8qXSepr/FyFgtRzBa7ISyH4xAbv+RoOjIa8UgWD4m9tj6dNwTDxzWuytmfK2XLBydp14Af1e25Qyx4mMiKGhV3XMsyje12Zq/FgCxRrta0F/gjKVkUC4z2VZkHCmpPkfxLm76TS2uVKN9e/rQj6VQG/aeVmluPwjSNTDdCebBUGHqhwdoAPPrvuHqvTodFX3Yqxrb1g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f485176-6c4b-4349-e6cc-08db70d5ac59
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:42.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7rSr8he2cxD3M5CPoV99gjcT2/jBivnIs2RrQbv5QW6WpuPU8urcHuUT7WWzKbhDweFbH0WjtVjnDB7QrGau98I2JWTMP3JSa+y5hZa9TM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: NkA30xMluglwYWyFFaQtggHyJo-_X-EI
X-Proofpoint-ORIG-GUID: NkA30xMluglwYWyFFaQtggHyJo-_X-EI
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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

NOTE: The original Kconfig has a KEXEC_SIG which depends on
MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
dependency (using the strategy outlined in this series, and other
techniques) results in 'error: recursive dependency detected'
on CRYPTO. This occurs due to any path through KEXEC_SIG
attempting to select CRYPTO is ultimately dependent upon CRYPTO:

 CRYPTO
  <- ARCH_SUPPORTS_KEXEC_FILE
     <- KEXEC_FILE
        <- KEXEC_SIG

Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
configured-in as the use of KEXEC_SIG is in step with the use of
SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.
Not ideal, but results in equivalent .config files for s390.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 6dab9c1be508..58dc124433ca 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -243,6 +243,25 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
+	help
+	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  This option also enables s390 zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
@@ -481,36 +500,6 @@ config SCHED_TOPOLOGY
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	def_bool y
-	select KEXEC_CORE
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	depends on CRYPTO
-	depends on CRYPTO_SHA256
-	depends on CRYPTO_SHA256_S390
-	help
-	  Enable the kexec file based system call. In contrast to the normal
-	  kexec system call this system call takes file descriptors for the
-	  kernel and initramfs as arguments.
-
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool y
-	depends on KEXEC_FILE
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
@@ -732,22 +721,6 @@ config VFIO_AP
 
 endmenu
 
-menu "Dump support"
-
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	select KEXEC
-	help
-	  Generate crash dump after being started by kexec.
-	  Crash dump kernels are loaded in the main kernel with kexec-tools
-	  into a specially reserved region and then later executed after
-	  a crash by kdump/kexec.
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
-	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
-
-endmenu
-
 config CCW
 	def_bool y
 
-- 
2.31.1


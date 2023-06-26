Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A073EF75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:49:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0rm4MvNv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=z4Lp7GdM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qql195nMlz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:49:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=0rm4MvNv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=z4Lp7GdM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwt2qybz30gP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:38 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QBlkC7019803;
	Mon, 26 Jun 2023 16:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=0rm4MvNvDxX0o4W+JCewTXwDKLqCBsGK0N3ZJuB5U/Gay2O4PDwpg2CKx4HIQAgEGuwQ
 lEqSfOpns4CHGSjieXZJQKSaDTPQn0x2X68FwTWHya52hZeFxWW511RpW0KBm4mdFqPp
 pJJJ+5Wik2Sjtq9LplkJ0z/rxgwJMU4skMcN+8Bof6DnNcXYb24M9ZMM6KspTMvA3VII
 gJeBdO0KUe8BePHLtZpO87abypawAv84vHKa1F0g3SalyHV0Zi632jYn9MS5mEl1t0u1
 EBe3f6Ozay4XjtCvizw75HEAnaYE28J0fVuY2VPzzkGDCI7oKHnnm1dOWYHPcYqgpDru Nw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdpwdb2xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:19 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QG8ZAq018841;
	Mon, 26 Jun 2023 16:14:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx3hqqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odFCqLT5mtmD5gsA+vsn8Bvtq97rAx8V2s/MeTZBhsT++SXrdmlxYtrcWdB5HYTIOnD134DuVfS4SXYvOOQYmB8iKyB9AX5TA5WL9pI79TDL6rkc4j+8t9v/i6/HnUjpl0AMNgppdujfHxTZH1FCPwWVa16VaqVKwTvi9WJQi+nhnfneVL4m3bU6IluGF8FP3nXucr7IiZAsKmepuwwuTLsC4AjDQNekF1VG3qLs1+CL0k7Ap3+N4s8pUunIywstKp+d79+CVjj//8nTPbHshlCsyplJ7LuqSJTt5ymdLRWdHVG4CrbgLJifzFkRHR8kZ8uQZtQzMQHBK9dD6hdtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=JRlhA8lyH/ATb7dZQo/eF8C6eImQabYeUEKu0dNcIJki0ph34va2yEvOvouJJNSOJitzaSoaf6m+UdNr76yV5vpeKj0+o1mb7zFrLG5h7Rsae8WaC2oZun57DaBjzVN86Pb7CeZZ4W8s9I9KhtAU+Odq4AW3Ni4Jmvl0uXPv20Y+5cF4SjfgGV17O9zC1LDnAQDCqHoH7Z27gxn8O+HFeKoEI2YROeNzXoJt39ZHKKxICWAM3rHvMIt1n1hg6lJWKkUeEUNWJKe49LWidxf/pbWmGmePmilXQBrP44h6kpWcU73dtlmkKo/fZz0Ev0HAIsH26xIsbms/TOVyOdKGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weTe/zj6qCcqr2n1pZp7KYmVv/5qNJe870g9rhdNFcw=;
 b=z4Lp7GdMC72uQCDSIGNF1APmUtQzeQ/OYD0PGfcd2oc/DzUkXg0U6B0IZc8FdIPG2LbgtWQPgHnlB24CvMuZeOodiQ9swQOIR7nXcjpqThLeO3Aehca9Z8lPWLh2gFUo7d2m2jjcJXsHtZ96E30iIAAzc8NetGFrvq9HIlchPqQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:13 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:13 +0000
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
Subject: [PATCH v3 11/13] riscv/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:30 -0400
Message-Id: <20230626161332.183214-12-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: c27f5a78-ddd3-4ac2-b518-08db766061e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XARxUnH7xELbLP44SN018Ba+dBhSaLapUQixJZ8xixFUNKh0iI33FY3kokmJyq2lk/EQiYbi2S5KTJqUi6nFtTX8H+fDqcZc9OZDVaHDs1OvGYrOeEe7ICpMRV2G9xFQvBvnwF0s0Sk1QhJxWWsn7HFGa02prQ8lzKM0k9PCr7QKkdfGxK6EAIu9/irBvEv23CtN69Y9Ba4lC8wjIYm63teW7mmsmaNhyx+XYAS1Cehxk6tDpJ88AV7FIUtodCNWNqn8pbWpyprGaqZ5V1rQMjeAoBQ3SrcAC1JhQW6XwUNE3rbHoQCzO/YMKeoIrp3Natu7CtnvUtjN/uPTvfE0CuA0PHRswb72hpIgkPBEt99+dPKhrx2HKgnI2f/ELI1zwtbfcWm18FFBiIcF29cgfk16WB3oyqCABHN8z06WoTPprv77bkblXeVaPvddvCj0BXe2T2BQwvug4Qdtm87n9HORf58BngBV8HRtpzra+EyGvd4VWKM/Tzo+2wW48fD/OXnNNBjr/Ot06vkOj9XL07tW9mUykbdJJuEfGH0x9I0sZd7OeiXp57VW3YayNW0fHODqnVHdmrDIAk9u+3udVw+nANeYmtuA+EzOdsxBad4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KrRD0eEBdZyDLdaKLsoDEa+cv/5kQqb6pM4tHhtOTLJhOXAc2Q4tGgBlSzKM?=
 =?us-ascii?Q?wfknpekS5M711Woho8+5zBh9NPIxZ3MF4mg6H8HZgE+yZN8H2Dqg+D8AQm9v?=
 =?us-ascii?Q?lt/64eiiMcFjN1Cn/UsqNTv0opSGV/NoWgkXXccZgkhNY6x268Anq8smki6p?=
 =?us-ascii?Q?kT2+qiwb5lADQHmuhQNLwrzTNIr8kBna0FA4EZMYmeFq5ytsSD49mWcW1NnQ?=
 =?us-ascii?Q?yUzMyZzfOXPv9VRjY9CCbnnmHeoD2AoCmTyPj19VITM8nl8lN9/d8MnKtdD4?=
 =?us-ascii?Q?rHlokPs/8grsRR9Jkx6V3CEaAIDj4lgHM5+j0Cfdwt6YKWeKcYJYu7IvEXO7?=
 =?us-ascii?Q?24sHgr6OBhkOHON0tGJDRJY55R0HLh/BokkUFyTRV5zaQpNJc9nZ6yxExHGC?=
 =?us-ascii?Q?SmRps3YnPYaxRiuW/V/9M/WP9V4NpbbcWMZv/i1gteIdx1ZOdXg9uPGW9yrm?=
 =?us-ascii?Q?OLuU37lO35KZ5B+U9aezCl8QtZETsBNXhJQyXZPg40DTaxf996q5RkEPi/sq?=
 =?us-ascii?Q?uc4RbBbX0nH7FABbJfgM54Ox7vtvAAMObfLCq4HkOsTitmSCZheKZmMhJKnE?=
 =?us-ascii?Q?wgqhYhj0a8zUa/D49Iof8uvX9ALOfzDv3hNcY5RMMJtSliIQuCHNpmHuHCFD?=
 =?us-ascii?Q?ZsWuoO3mUYuJC25aBXSAULF7WEYCwRMRhQaS0CCI9UVn3r3kKZBLTPUIONb3?=
 =?us-ascii?Q?YPg0H2BWGupfxZVOVSvbc8sGS+rTlNm48xzFjn24hWSoMvoRMbnpLXiaKY/D?=
 =?us-ascii?Q?n3NTsn85whnwGn5HDT8I3/h27bTrytLIDBfHcdYmbv4/tJ6NrWTT4UG7RDKn?=
 =?us-ascii?Q?g0k2u0EiBqXHlFG06MJVQLdj2ovZBF/A+XpSgXYBA1lygDhwPdMEOEj2aNUv?=
 =?us-ascii?Q?Msqy6fULzpCtkkyGKGgm14oXJx4briO253Jw3qR2F/NOj3Ssimm1BWcE2d9W?=
 =?us-ascii?Q?g5oyNtMA3TsCQYqZrkKnG+hlb+WnhOH0C4ssIgs5VvkFEG7e8rTBmdjw42yA?=
 =?us-ascii?Q?XvKsbtuQvDaMYeTKbJWvkL1V5Fnktf9/yUT9KXGB5Ox+VvqIgkp7l4p0eMDg?=
 =?us-ascii?Q?14bwxpGpqewsryYs6hdQLXANTmGo6z+R0w847AkuhqsshezLhP/XDbdy4YvG?=
 =?us-ascii?Q?V5WTpcWoIcrpWeO4TTpqtC4IyPlwwMMw7UyweNYRiBKEODg6Kq+lU+J1ASrM?=
 =?us-ascii?Q?Kd75qBlR3Ezs3Z6wZ7Aew8VIsCH0cjtQpuknIiBW1X4g2+WL+LlGhuVneCOA?=
 =?us-ascii?Q?nIJsOEijWXNdGXo1RUTBAL6SfBQGp6J0nLm4efEWcLx0gZ81PIRDm+Uk6IID?=
 =?us-ascii?Q?K2+nUsmrbMK5dxUtfh70VH5jCf9yX2aKsdSb6dr25gGH0MNUOul1D67q187f?=
 =?us-ascii?Q?tFtn91QXgX3tLbBcpvzeihxij59PT8R3jiBlvVlYZ4IBkThsnV679Hk/y4CW?=
 =?us-ascii?Q?9oLNrGFM+ejA/VwjhDTyOMAmYkZikzfjBOfuNqHUGyWMjVxXY+uf0nW0xhV9?=
 =?us-ascii?Q?i0JgTiHoW8IJZ07K/ne7jJCBbkADK9OQxRBvD2UTCF3/hzbKjVkJNRtnjBX2?=
 =?us-ascii?Q?O2rulX3m4vyGNBmPQLnviNpTYw9hyb8S+J3iev42vF5Jb5OIZmb5Re+WurYV?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?JI0ioEdQM9ECZeC0t5U58t+jVJ7ISeHm2qvFGRXD44amGnriOiU4wDOy5p8Y?=
 =?us-ascii?Q?zjAa7ODTW1/o6G6Fvj03wuudScrRaSqPjXhy+cgJUUVymaoO83BErDLjcsNB?=
 =?us-ascii?Q?luA9JHGSf0nxHBJQwfq3yWCtfQkuen19nFxUK3dcmGEOwQTosCV1a4AzlckN?=
 =?us-ascii?Q?XiKcLEpEkXJs0nFCOIZxurOWkrrGnqn6ueAgLfgtfSVYtTQv3vTkiLen+jjo?=
 =?us-ascii?Q?TLpONEdSIYB2nJk6mNeFIA5btVDpMXhEdna44hg4qwHoXrVY0M/lCqDyVe22?=
 =?us-ascii?Q?yei663sETzWb7jUvfAl8HmpLA2OqPpS+exNSQnAzMsUnBNGw/mU7L07HMZjU?=
 =?us-ascii?Q?P1JMzZFLuQKlrs9CXP8ZiGYp8AxDIlKE/PSmhZIMwBDz9WWynsQ3If2ebUBO?=
 =?us-ascii?Q?hCk2li1vuhLRKHTvAbGF72oAgi5C/NncZxUgqA09eoT0lkigbY2hM3xncT4f?=
 =?us-ascii?Q?5v5r5R6e5B/y8B9kh9mb3xzqq/ZQCSIOIMq9lVcx2Bth2YPh/RfQv8FcVMf+?=
 =?us-ascii?Q?R1fVaIpxpZwtzXo2zxe4BlN6Quwol1qPBXwlJp7Lnzka+VykT23aQ+PoEQCW?=
 =?us-ascii?Q?/W1ZJDug85scYIrBWkCiBCipd1Plf6JgrvAbQHxhSPk3G3Fj9Rm7Oqlaz6XC?=
 =?us-ascii?Q?tQaovjsvqPlHqfZxFKyXw1B2pCW9TP9TDXaWA9JN3yzpkOi2k8OxUOlFGAwg?=
 =?us-ascii?Q?xweAS0x9UEAa5QoK+G4a2PO3DNMpYGlnN5DllpMLjcg11YIqIQUgu3XPmWHH?=
 =?us-ascii?Q?HMkCwf2SeSUKfetTyDwBaXgKkH+/tdf9J8ev6bd4rK7WqYEF+krBsr2Lfq6s?=
 =?us-ascii?Q?7amuMOVVFicNqwgRnnLvUxodUJAkWt9BcgLSyXeC9nEgaHejfC9bm6ucbxyM?=
 =?us-ascii?Q?Eww+qoIFX3AJkbrD80Fv5HM1+zTGOV8cpAXZ5dx223juBimOR3lAA/foB7ys?=
 =?us-ascii?Q?gAlQ4gwQlgmNixULzO1JROgXozeZt+4JUQzWqTN/YEYMX4WbXrTWEiKGGVUR?=
 =?us-ascii?Q?dtrkiqFrHU/fDxvLusluwpL18nIiijL0Tival1BmOZKQ7mG3AeXSM1O0p8ce?=
 =?us-ascii?Q?LXYRfDEQv1h10xXhP2pP5nI2oo51Xn4ddY98Mj06uN8U4biZJCabBynx1WGZ?=
 =?us-ascii?Q?o7b5apXDG4OlSff4HAhfTe/CvHWR4HT54gwR0FaA/d2YNrKusIZjo58xeAMf?=
 =?us-ascii?Q?AiuYB7obIlizvWXd164enkGgcBAEZk+BLO7HLIy6pj+Tzf02ghnpYA40yi/J?=
 =?us-ascii?Q?z7b8S8K5hammOhY+uvMls+VjNbw01pbD8JH4treozEI1ZWVjrfZvkHzoIiVw?=
 =?us-ascii?Q?8l+MgtF+QFlQpUbPQdtuDzBwHwgwHlTDafYUz24T3xDKP2W9qtBCCf6DnrDY?=
 =?us-ascii?Q?XhSbEU2jDPFYV+HT+IhvMqtQrVlDYcisKgxsGv1s58Fxuu+VxZEQuyiiU+wp?=
 =?us-ascii?Q?2soEFeYO50XJIhVIdn9fHxj+QpBAzb5U7sSv5RrlP1MvsdVKUiKadlCXTbkl?=
 =?us-ascii?Q?s3IaqNGfrWzYaBCsD7tqJgvJ4xsV2lKijcCksrtqBp6UCuK6ZBKNPedU+Yr8?=
 =?us-ascii?Q?YxcIJbUEnObXEJmYOacdF11PCRi8r6/yAiwHPlabvzIa2s9T1do/KDVTBxyT?=
 =?us-ascii?Q?PgFHByzrQe4gxOIi3piD8MPIEZtwICSm3c9me91rHkSz1uRWhZU3z33wT6xm?=
 =?us-ascii?Q?iUE5zzAntegKYSqzwAHQiOCDIjVt3INXwwNgowyfZ4/eJH4zDVTHm4Wb1D6y?=
 =?us-ascii?Q?HB1zTMTgi3t9S6AtbKlMcq/EBudVQHR5KAL/+nhnfF1jeOHkQYv8MCMaDUIh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	SQqq/trc24wX9lOGOa4TS0y71aIn4PSC5lUj0B42ntq4XOdvpxemNFTqYZEMx7S2ONw+cU/nbu3FbwaBRT1eGJrnh8aDs8/A8yG/rZfONSobdQfehHNbvPEmPyzRc9uwt2Zi0dM4+Kx6tq+MZkcrx/e6SZZ7gt4YRLv48M+Kht/SRYhX4M1AMOfymr7/PJOZrjPzNX/SQLUmUAkIoDucYFt4bNMNFEzaHVyHfIyAWU+FRvM5gRojGmraBkA5XdNNhgPhgoZr+kye2NHM7hBvAvYa9tGjDMzEd9dx9N6rhGKgp8oIFYgKA+Ed10BPtER9pwZnmwejvB5jVSs2dYYyWgziV0qiNh6zXbE83UGeWgKV/yanV94u2cHwd8ihYhNtmJxUZtwMnxB11WxN276WdLl4Mc14hI9ZuUQjtR9S8A/jCaGJWyz4/JH1gKbpvrz8H+Ee0TDVUnyzpg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27f5a78-ddd3-4ac2-b518-08db766061e6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:13.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMG3FDiNzfAiVDGFs8pYlMhbOl/29k4/9iKuqu7yZkd7x/Nn9UCV7dG3oiQpQa7cP28bRfrXpUfBx/MVQKmUHy3J1mK+1Ve9vifwDdVoBXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: GT3aNeSmHfBmqXT5iPKM3IPN1Crvw4M_
X-Proofpoint-ORIG-GUID: GT3aNeSmHfBmqXT5iPKM3IPN1Crvw4M_
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
 arch/riscv/Kconfig | 48 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..c484abd9bbfd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -585,48 +585,28 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
-config KEXEC
-	bool "Kexec system call"
-	depends on MMU
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	depends on KEXEC
 	select HOTPLUG_CPU if SMP
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel. It is like a reboot
-	  but it is independent of the system firmware. And like a reboot
-	  you can start any kernel with it, not just Linux.
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool 64BIT && MMU && CRYPTO=y && CRYPTO_SHA256=y
 
-config KEXEC_FILE
-	bool "kexec file based systmem call"
-	depends on 64BIT && MMU
-	select HAVE_IMA_KEXEC if IMA
-	select KEXEC_CORE
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
 	select KEXEC_ELF
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-	  If you don't know what to do here, say Y.
+	select HAVE_IMA_KEXEC if IMA
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
-- 
2.31.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10B72D019
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:05:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cdXxOxRa;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L725e4j2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2jx3KPfz3bng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:05:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cdXxOxRa;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=L725e4j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0S10yRGz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:23:28 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHOIpg005020;
	Mon, 12 Jun 2023 17:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=UGNmgu6Feu5zO+hLBUXQoeQZ/l8g9fhmbOupKFbrY8w=;
 b=cdXxOxRaemSSGXOb2LsxAEOBpKJVRsIJQHbj3cE5V7DRbwG0sRTcSk2DsIDmJS1F74Co
 +5H6Pep/3xScdOZ+Nd6oO+yZro5JB8Idhn2oXq0Iv53gPy5+jCtgP5cOX1KOQgDNZSJP
 EQ1hNKu8qnE1lpzYgarTjKxSqYpcMJ5vzV8WZ/WvCu+STBGq98Ykin0SruTStyVnyQHf
 pGXtgErhcYSdpJ0D59W0R80YqjokTqdkSB2oCss+drmCHRXM1CYf7Lg4DgGaJrUriQfi
 paBBcd1NHzdPopPjR7Iny2rZTNMqZIhCn9rf1Dj988/8j9kHhF87rAboA9+c7sL0D+4e VA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3bkjp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:42 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdf016254;
	Mon, 12 Jun 2023 17:28:41 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeaSOJjoGh/X6Kwn9vDM3qcURf/sFEEWpRpkHo2Gk8fM/nSaX7DDDCAvzlFpbPRKd8oC942Q3D3lJQ3xpMn9iQKhzIfBQf5ntoj6VVC4hTuJNs4ek6RBseFnncv1K3oPkCn4dc6jYGLi2D670kz7r08HbFTrIUp4Bo+0B3mRzIIJ9lNNHoT/lsFutXzVrXkNo8Hpfh/NlNmyCTkIqM52oED2qa8FzYuLIJ2JfcQ0caGYtig6kwZ/skrEQgHz5xVPYVSpZjbBCUMJU9nXPeMAicaxg/f+vMaT1HXTxf/Y/z73ZfdZK+zQs4ZtZXxoRorwFOmBbugaT+ujGKFNLwZkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGNmgu6Feu5zO+hLBUXQoeQZ/l8g9fhmbOupKFbrY8w=;
 b=Q6LZgcT+Avzlb4lfsNvUFFheRwKszZy2Cydl+XzXokWHoUflwiXDlxSif15ELw3mZHuODEau3KoXUofk4S1k/FreS8A9AGvLznvWT4B1NlL/ec+wZEN+WgWAbG9jgh/Itm+5KveaS+r15W4smgCBJ4nwavm/m3etCgtopHlPne+KjHDKeVnP8xw7uPyRmR+TxgrAecDbCFkOlmWFOqtfyVOkUfCldZyg/62TI+yZ1idvZu+9OcTCVrriA8sRaVSMnzGqbXZipX9sclCEDx+jbHNc5N9Ew5v8hvewYjuUoZPjFaugJydzQ7z68vgW3dQ5cvsl3TdxDHWK3mqnUr6uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGNmgu6Feu5zO+hLBUXQoeQZ/l8g9fhmbOupKFbrY8w=;
 b=L725e4j2ZGXQyYX+fJLv2hcS+k7a1hRO1Kis0xyklXY9MiB91Zm/3PwPKYIBCjkXiW6k3mTC3T9K6F9Je0ofd5v+sd1YuUvxNa2ijBr+PTniGoG2KBfjAA9TG/T9/A4aFHZ3e68OrexyZQ4FPIpczSXLEb0Hss7WzFgkj4tFjiw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 04/21] ia64/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:56 -0400
Message-Id: <20230612172805.681179-5-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dad84c-780f-4276-b8bd-08db6b6a6e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oZMD+wWGyn+Tke5O2CFG5PKgM1mUKfgUpb3FDvtXbYUQXh8WFYuGRvSLR2BWpURdJizhgIGdGbjBzNFuPMXDLr9binCAGfv5/FFULTVBxHNXUh7uPbUFmWK/vmo1bwzm3NJmjYI+QGVZop869Ksm/6uBRKO+OS6TZgDSUjEY9VwPLef151qnmAnSpN3psggbc1DtfdEPH6lDwLEUt1ddJ7Rf1HBN/5YX2aCZcq5KAu2iqvQvXc+4rEeUIDLS3ttcbZBtdPGmjdhY8/Y3YCH+IWhUGi5F95dHb9JAhe440vysuOLoS5Qwsc9OgrxUk9As53w7ZrMOKyQqEzQllcaOPdtepZa4+ssbrsFvQRnm6HWK6mQB1Bd0BLQBg7cQPmGzD/rGk79dPJPv7W+juDDotpqM/lo5tgNkfQgowmmDfgLQksCTT6/Vkwh22tEYkmCetr2PHmT2NEKxLmGq3Hs09By3DCYqVNBhwFYKAs0/BvXs4J+d010XhDKL7lkPpKt6pK7yDIkZbR+dmAqe6Lvg08GlqDZb1wi+X3i5OtpPRux2+51ux7/uIbr2K7Xapt5Zcxy20LNO3s66HKoO0gtSPKndUYTo3d/6DcIhnoJX+gg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?G4edYiFTonMr5tJzKGW0O4IuS8uYvt7b2m7o9YK/tUnTnjCHRrjkB9GwhUiD?=
 =?us-ascii?Q?AVwS2bhsIbP/skYObyWBs6mvXJr/qzF4UoEOLyoIdPeTuwSYXCSCNP5OpNpP?=
 =?us-ascii?Q?hoxx+GOPW1HCVmDyt5Es3SP7qSjEkc6ATdSQTMKJikTyY2T8N4ae37Mpmslm?=
 =?us-ascii?Q?PCcJkUOGfSzFh8Z2Q/1q6pQ0gI2F4+haae8eTji0IDoH4dbg2Xxt9Xqoj6qG?=
 =?us-ascii?Q?rCw2x68Deo0OZXa9NzyTdOTc66L8x4InNeRCvfG5D4alWXLPsbTTnMlsjOiY?=
 =?us-ascii?Q?PrD/GHb6nECbT4Yd1jvsCb0jHmwgKyQ8Nzczsy12JpeWq9vlc4lWLKVTRYhP?=
 =?us-ascii?Q?rZOy4u+23lB1ZT1vRcCK6ta1meDmgltQ18dNzxzFqbUrWa4soVYGPuc6NQVV?=
 =?us-ascii?Q?Tb5lNUM/uyVUW6hYaQNYdE1o9RolBWtRG95rRG3OcmYq94ePyFerbek+NCJr?=
 =?us-ascii?Q?JKQXL9OpY1jxQ5Ia+RQ9yWe/ldvNciZs/xVuMXdOm5A2yMEiT3K3rWftGE2i?=
 =?us-ascii?Q?D2ba9w9zAmDFp3amZfZb0B+sOe4OzT21cifqrfGscgT8zZWzZfbROAc88NdM?=
 =?us-ascii?Q?QpKb9eTeQi/3H/lOt5D1dMRmk5h2qy39sit5QSJ5iAF59nR+FgBRluGz63ty?=
 =?us-ascii?Q?1ifIYUc5HBSJmwtZjxDDD2oSpoZHHY3o0lfe94wn1GNgHzL4D9gG4Mv4zCn7?=
 =?us-ascii?Q?KKAnpQAsNdZVX42RWbtC7eLk/kB4Mf0oMbB7quKVpFncbSlH/F2AjWRZMv18?=
 =?us-ascii?Q?NvVtbIdjAw5sUYI90qkbZ5MSWU6URGpMheB9ymiQXdUsmt9jZSdD0es9tukS?=
 =?us-ascii?Q?bSLzrJtBqyldJ37OBccVSauJ7mrSoIBlPAOC/yDUCYGRA5upvLoh3Gfh9Oe4?=
 =?us-ascii?Q?8a5mBLUwdFqJ4BQbvjvNs5nzmuebW9IY6EWBFwCHff4ceZLrhmJGsR74ERwq?=
 =?us-ascii?Q?ojAHB/tnPouXIwfJzBzBWZzNjvgy56QwJoORJCiSkdfazUBSZYyEAIAH3E3e?=
 =?us-ascii?Q?XOMlOfRO1ZVjeBHF0xcTOSVkkSrVnRhkRM2kQom6RG0aBgwbxtYDiifj8zRi?=
 =?us-ascii?Q?ZYkAP6Rl0L5/2fKQlGWb5cSRuWjWTLeAudgPFXThLACalsJ9RwLe+QhME/R7?=
 =?us-ascii?Q?NqluD2ybrknQ+0HaY/Pikgo7ot3k1akpRk6nJa6IjYN5fjEg5YfF/IyJZtrB?=
 =?us-ascii?Q?ATNQCrJrstUD2cuUrTm/1ZyMrcKMfeSit8f355IOVtwNUt2gJuCOvZspWSUB?=
 =?us-ascii?Q?LLVP3UeZMgsOL9uI+3fgEHVJiiMPNm6oi9a0Ci0OOYkbAtb9o9YVX+laqv6/?=
 =?us-ascii?Q?RWpNK5PbRE3MwjmQPmdsrsZZ3wABgl/Mj0/4JsJoknX1z/8/8VBUtALpkdwi?=
 =?us-ascii?Q?sz3U0OYUf+owJcHwJBJoJIRq5FIGniWWwqep7r/CL+aNMRxnVcuAQ7w5A4hs?=
 =?us-ascii?Q?fukAOZmUvUV+8JvxGe0sfJXHdCcnTE0A/8DQPgVKSMqz9e4durMf6Vx8F6g7?=
 =?us-ascii?Q?SBggWT7mBNaVj45qXh6+tI/UZPhrevhT/erHCWpoID56kJwYZ0yk9bQQhCft?=
 =?us-ascii?Q?s8guUUwYt5EkM2C7kTZelW/nVlmtiBjBh4ZL0UxFpJxfI32XXXu4ukWKbw8L?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?kZRLdQ+stxw5j0SMPrxYdy1aba5BoTvlmEuVW9blG/205AU36kBEjy2UdAwR?=
 =?us-ascii?Q?0CiwBkHFw6l1H7jh69malAogJCb7NZl3skckwb50+fv+CYEw0KSOZgNqB6Sb?=
 =?us-ascii?Q?M4O6OqBPtsZBVBcpH8cI0kuO0pqR73wvsvw0CCv+zMQTgZ/OcuSr0mctHVs2?=
 =?us-ascii?Q?FVnFeJuc3Ot0kR48WZ8IrXGc2xLBYO1Y5xcJuVywxXjkQFsvvWt0HfrYVf+W?=
 =?us-ascii?Q?MsqbiIoQBJpCvH8LRjK6nI2pImYQ13W4BKsFMaBQp0Y2p3nqdXgKAwaRGZng?=
 =?us-ascii?Q?p3c42DCkoubPZu//cMuHhZvBJ1A+hi4tFVjd8cqfnN2r63fchDT3jFFTF53+?=
 =?us-ascii?Q?3VbeC0IzuVmRpBovcZv21P4tmuHPhe3gtfd79JaCfl2rzQrv5TrFeh2gmjM0?=
 =?us-ascii?Q?AuRz67Wd4+Dl5Tpi0e2EtGUb2sWrzFJ6BVRQREYeLPo3gFtxH8F5m8z9rsJh?=
 =?us-ascii?Q?D4baSUJFDa/zLjzY13/JQVsuOvcfKm/Wo/2GsWSwyXj8s2VZ4jygksLhG7DZ?=
 =?us-ascii?Q?iHFtj5+WLVKbQACw1doHAz+dH1++a7RGQSKXvLh1rjq2VAN1qVi12hsiDyT9?=
 =?us-ascii?Q?aGWfzO78kP9XO7+u0cgIxmFVXYEY4yTlX1YAnMUw74CaBg//i5iqjNHlq1jr?=
 =?us-ascii?Q?IWiUm6xfsJKeYGWeyeIrIVO0VH9J/mWQny/auUZa4glN531B2JrM5Nuj7x5b?=
 =?us-ascii?Q?xxW9mNMOLIZa1jN+dJv/ByLj2BhHryE8wfToVQs78rXHnovnUOVBicjN1mSV?=
 =?us-ascii?Q?3W7YJL2gAFfFzravgsKyGQRad3RFqOrAeyGdc6e9xlrYPg8/quH9z2eUDZRZ?=
 =?us-ascii?Q?6r+1PIMwPJlpod5quRp386/pkoL6rQnTbYa6ffQRwu5a1snDpZhGNd/J01f4?=
 =?us-ascii?Q?vjaO0+M4LVC/Em30bae4SHcf9ZggumMW7xTcQa+Pz3FkOEGPbPQqkpGKImdh?=
 =?us-ascii?Q?NuELpaGLd6Uo+RJ73ZwBSUjdOv0vgfQHfmeOoA41LJN5h4kWu052Pk1nbYze?=
 =?us-ascii?Q?nrgVxMgb5njQsmsra40sBLWgDfVRftTavjw7YkjtSg+WA97ZiZiLs44iGrnJ?=
 =?us-ascii?Q?nQSnwzeAHWnFmpcJTZXn4nCrT10hwWfRt1R69NtngTOLgmdQtHu/DvxA5B5o?=
 =?us-ascii?Q?vG8id2ABCbFr8lb/15r2NJ06myD9XAS3hLnp2J810WXjFrsmMFQ25qVEOCQ4?=
 =?us-ascii?Q?QpVpXP7j+u7bwd681BpE62ertqk64HrrDY3a+C4wMXtdZq6zw7EMwGLsY74W?=
 =?us-ascii?Q?m6CA+t7R6oO9ZMoQ/9JSyJ82Q3bEezoFh0HUlB/UTKcXznR0/bgw6rPNKmIp?=
 =?us-ascii?Q?+7kHNhjjRgiYfNDUdVglYpq3F7LEWdvCMY3Q/Ko5t/0kMu7jZOWBOJiDHCr+?=
 =?us-ascii?Q?TctyexKn6xrBfXi0xrnLjkfI/p5KVn4uSiYTkMAjQnxcehQsPy2EYitx9lHB?=
 =?us-ascii?Q?gUiJPqQmWGrVN579jhj8mxAVRmzQWp4SxBRgsgS6A9i0zPWylqhoNcQThpNH?=
 =?us-ascii?Q?dxXj5AhR7HeT7UMUgTgiXmPq1TkZiZDYEDE2jtLfIEuyDtKQEPf1Q2AMGqvj?=
 =?us-ascii?Q?xTOGN/hMJT51UmBQI26RDo1j4pIztf9zmX57H3pIBgAndQe3+2PhdBTqA3EZ?=
 =?us-ascii?Q?Xfig7d7SNmb9sTG6lXn+KaSfi8PHkp8Kd4worQI99fq01BfuH9qJScsPXB7t?=
 =?us-ascii?Q?c9Gwbydd4gCyk3fDQmJWagCIU6YqQWA7lj2PWXySFPU4N0Lq3IRWMT/Vaswv?=
 =?us-ascii?Q?d9KrfpveZb44C9lg0+2V5OBQ6zwNavv9TQQhyi/GQ+VaMV6lVzIWr6OSws5p?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	7ZC+r3EVFVYYoG9OdqAg0An4nk/Te0g5v1YLnwtvzrLUmcRossKLYkF4QAbGe7hcc9rWQ9BVcJ8v4rwndsd/3SwxUU7Spa30Ho/4T+aWwpb1R/L2e6yafRqZeu2h/QoAmW5qHJZAnjzWHADpHI7nXuDoFdgi/lgQdx07RkA6JzJVQ5oEEY5bwbEDY+6vYPpLxv28fesAw2PTsGtbO55FgTTlpULleG1aqiaGZC1ZggN9Fz/6GkZWdKmzXzFt8RGnA9B+YPhpUq82a9lx6Fw7ed3UpQEV9Y+PArObJZPZ/SRSAMbs3wS6TsLjrKvw2HUI0Kp6N9WuoX60N9BcbdduMaM5W4plm9AJ/Tl3M5jRCTmvHvcHpLZY2SWcyktkEYJ/p65SGE/ECEiC96046B+3SC9PX9IPrz7o477HWMukKAT2mmO6TECID0fod2VPLjnZ3ZPyo9cXtG7CpQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dad84c-780f-4276-b8bd-08db6b6a6e1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:26.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I32enxPcPYKDQh4QPf7cTNFmmKXezNw+7B4wbxmzzR0GXjcjt8lQ/6oPM2a5dhUDPLplSvhGhiPTjdvSCPesemGu9lx+ZsAvqpsBtS9zroA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: d81URngymOxACvJEfNNuCWuuB3PmIix4
X-Proofpoint-GUID: d81URngymOxACvJEfNNuCWuuB3PmIix4
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/ia64/Kconfig | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 21fa63ce5ffc..dbef97452839 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -360,31 +360,13 @@ config IA64_HP_AML_NFW
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
+config ARCH_HAS_KEXEC
+	def_bool !SMP || HOTPLUG_CPU
 
-endmenu
+config ARCH_HAS_CRASH_DUMP
+	def_bool IA64_MCA_RECOVERY && (!SMP || HOTPLUG_CPU)
 
 menu "Power management and ACPI options"
 
-- 
2.31.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3D4905AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 11:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcndj1TP5z30NS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 21:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::618;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcnd64Gg2z2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 21:07:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCk4fy5/APxSx7+bZ5kbBZfpHdGAKtNmnPjlOqLMWH/tBS0Ar1VtI91qj8vsvLq6QN5oBpc6lzOECEm4/BLJZ30jfFngayn2jmPDXZWnh9olP0CDYk5YjpdUJytDEA1DXTrJ6WJiHBxwIECKdg/2fxtvedmA/ZebB5d80ojKk+4aozfKyTtOvPRWwW2zx3I64QyyE2rQSX3IOjuYwGavugmSBMlmgzJ8g0KqgrYOAvi/EZVDvOQfek2LDpiVVARUlRKjEvWVNyFbI6yd/FFz/+8q/GXtg9soL+WFsXZPn43hgV62iGJl9RnZCCd+18Wy66xde6cS6JC6ZaPxMd6NEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZChNNeWBMA/w9hnSGFwBn1OHXD4XBocmcjf/kIKBCp0=;
 b=PHOQeF2fCHWN5Mr6mF9bd7qEILzP+mfrHzUsDcmGgNOH42pKtn9pY3d0NtzM0ipxstkxMur8lV1CfmCIZS7+5ShfHKFVEbWfSTnaCjiHsajN6TNXUG8SfVg0JziDjhNxj8xhMlP1wH8ZjbFHfOeyg6id66qwznrcu12VqvmIRl3K1CziiZ7WzuQ5lXWPGOJx7YqY3qBVmbCzbCyjFGQ71iM6HMeTX9oxmvoJJkjghlAcUtvNqqXukylKyKRLlybEWDFUgwRKeQBaL56v2TCr5MD5GR2oRjy1oxVHsr04OXug79AZy7AWHm4sIr/MScQMdFw/IY9iPUGJ6HBqOQSjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB3625.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:146::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Mon, 17 Jan 2022 10:06:39 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 10:06:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32s: Enable STRICT_MODULE_RWX for the 603 core
Thread-Topic: [PATCH] powerpc/32s: Enable STRICT_MODULE_RWX for the 603 core
Thread-Index: AQHYC4nrAjqfbFaQXE6sowexREg9UA==
Date: Mon, 17 Jan 2022 10:06:39 +0000
Message-ID: <1e6162f334167e75f1140082932e3a354b16daba.1642413973.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b73ff81-ffde-4df0-ee38-08d9d9a10da4
x-ms-traffictypediagnostic: PR0P264MB3625:EE_
x-microsoft-antispam-prvs: <PR0P264MB3625722183EBA6224B30AA5DED579@PR0P264MB3625.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AC/WYSni0NoTfmKow3tOr/hTnFnXNTLL4JrXnTAsWgTGEnRTfws9tHuasMDDH2GdAlc5K+5PKrndnowk/ezhScjIHLdPOnI3Z/LBB2vC+SZXcZxaA9fverEKB4JpeCn6NvGXX0Q8PfCWQMgHOhz2fZ5o5HSiq6pmDmLGeeGLG177Z/8vDDBf7u75Watq0gaIzZyWHVEdZ0xBp5OrF2UL/yry0UzbHQQI9vTCYsdTuoaYJGp230mRPsw1x4LG9kyM/jzz+KpNILBJXXRnuxNydvdJf82GqJizu/yC76LEI7AKJPDTAZcPJDEOW6oBeKtXIvwNtrhyl2VP0pTbHg59mGL40R5DylET/yjXp/973hSMX7AbNKhMp4nQ541GTMXATsHVk0mUq2PD0TqVDB+9GD76o9fjtppZj+gyCEN0RqZ5JPAwNqsc3dwEf7o4hNzPndSOCXelXmEOb9B5dRoFdmS+Q68JeKPWwe9g4k10ciLlV3TkJk7SAA6rHjymXeCKZ4uRKGRK2uYwrgryI33MKIET0O7EQqWOxT4ctr7W3dXUvm4r7sqp5CmOibzMxD5qu/ki7efMlZSuYrptdyKapKmURG0W5jML+B9wbIZPB/BekhHPe70weplrIFEh46JZpUMsxCJ7JiJbVSVfeNKjBn5jR2xUXpJWB+XeYtf6j7YOGkbHuJrGbcUMYmbdu3Am6L47A+LMwDEe8Z8z7wvwZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(76116006)(186003)(71200400001)(66946007)(6506007)(6512007)(86362001)(2616005)(4326008)(44832011)(66556008)(508600001)(122000001)(64756008)(66446008)(8676002)(5660300002)(316002)(38070700005)(66476007)(38100700002)(36756003)(83380400001)(91956017)(6486002)(8936002)(2906002)(26005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MzpRRgqZp9vZnyHhx8uzP7wcuYg4Hz4RT8wF9iGpGvP8VdKaxp6m7Cg6Ym?=
 =?iso-8859-1?Q?OEMxo7S3W4ozm/0VKmfmGXwmXTXsV2dQN1DSey44ZjQVmSxKgHCAjEr3gt?=
 =?iso-8859-1?Q?39pW8TDPgLynx6SOrfMe8yuUvb4VTs+phxfDUI0y7YjlGSYHCsQ/rrbu63?=
 =?iso-8859-1?Q?5TMPZ5AyEegPW+TDLgCqY+IiJR11biRFXX6PHKA+C+hdI1zpkpUr/9VW0V?=
 =?iso-8859-1?Q?A/th3PAJulLX4GzrptURhM/vm1gSnUcrlT2Wsc99q+MdYZXOmIUjWZAKdo?=
 =?iso-8859-1?Q?uF7hTe+qUmQPAbcEZbs1/S8wYAgAhav1JoCyCVhQyugMes2LyD5z/AeCuf?=
 =?iso-8859-1?Q?qWu4VdKk6bPOXmECJEMF5tJpwnKqIF3JQFTOcNZYfhU9hl0bW7ZWOduPJ/?=
 =?iso-8859-1?Q?MSzlI3HThzfUI1VYFzGxWyRsz+NZ+pFntoqyNNuahnWRjAeRaX9k2ad8uh?=
 =?iso-8859-1?Q?VZ8t3nJSD8VJtkp2jIXgKwK7gGwR0m3xgUeHacaez05ntbNxnp/Ko8VzDL?=
 =?iso-8859-1?Q?vKwu7j9trTUvIak3t1Jt0Itx3kBiTPdCRxofDnzUQyeBAzbvJfzzBfhKqg?=
 =?iso-8859-1?Q?6dty362pHgLRqyaKa+stycZ6J1d6TozuwtzK2xfm1RS2S/RCXp9KvR8HKl?=
 =?iso-8859-1?Q?fOM9J3MrWlC7CJxgA1Dwa0Q3YxMgXprUBiKk9nni7pHQ4N8R0iRxurM25w?=
 =?iso-8859-1?Q?XEPaFUvQcGSMIyFAakCV4ofi+gpaIzYhS4e7uooiUz/UvqVbpymM6aViQZ?=
 =?iso-8859-1?Q?/PazBQUDnAlNOnqcry/ilh+LqCankmW+oZDKPwH69lk909ij/dE4FQ+V/b?=
 =?iso-8859-1?Q?A9dRXh8cmgc1ZM489LJOr39slxtthtv4hH53YDQ4d0gNQdyQCoiT3bqb25?=
 =?iso-8859-1?Q?28e+UFZ4rmRZWSs9mRCPjab08HwcZbX0Ao2hzYB3h4BKOJjUHiWFtf+7DM?=
 =?iso-8859-1?Q?N0EJJ7dNpYph9WK7bTJKi9GfagWL4E7IQ4YI6npJMKqTySBa54mb/c+Rdp?=
 =?iso-8859-1?Q?ZCrEyxxrIrPv1bpZx6RwmPr/NsTfVhIsROnAYqtZ/1ICG5JwSQ+fdysZwv?=
 =?iso-8859-1?Q?xLpll0+GYdqaOOvN/2hmAJihKBYinXNaQ54nJ6T07nNeV+lJMW2mRsmzx4?=
 =?iso-8859-1?Q?t6oOzCKG7Muqfp5Ea7F/7Kv3jKw7mjbdFGmnOBG4KgFhsNCdXkqgP6DCBb?=
 =?iso-8859-1?Q?HpKQK22U2GTBsG+gMe7CmpKpTsfFj8en8NRp2VJl3Ac5wFaLI6CxzAy55U?=
 =?iso-8859-1?Q?0CyP2EyQRQkPXk/zQogrWxTKE9mlWpWkoOdrhJU54RRxNiwQ7d90tNsQy6?=
 =?iso-8859-1?Q?NEf/Yu1vLhGe+qrAJIbcvUi325fv8ZFco20tZw7ppDBqW4whe89R2xDhs7?=
 =?iso-8859-1?Q?bn0CE5PtXxTiLea+EtsArV/pj792NoeiW6MCAajNhj3V17e/jWqdvLvY5X?=
 =?iso-8859-1?Q?ERHquyhY8okfryToX5ECbDNfFWnMq9bR0bbIl8UjH31ALxXmhydsm7uX0T?=
 =?iso-8859-1?Q?qh9GnyERB5e614DbwQD43bJAqfjLbcb7nkZKYvEtEjDFeI/ki47/Xd6YzE?=
 =?iso-8859-1?Q?sB0gQpdz02KT0zcLuxH2yAk7E6AVlHpGQmuktwDjuAp2addFGI81a0G670?=
 =?iso-8859-1?Q?FWJ6EekBFiBvIc3Nvl9F9Lkgcu/9TGocTFC6GttUd2vM0n6/eizJ452I8s?=
 =?iso-8859-1?Q?Zj+5kfYeKaDehnaPId2bKFfOS1DCocGbNm96mbJQKFqBkoR8sg6pISrOc8?=
 =?iso-8859-1?Q?raF+Kssi15QCsB2H9maD02X9E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b73ff81-ffde-4df0-ee38-08d9d9a10da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 10:06:39.1191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RrNWxdVyAWKRWwMBMXNxxYbhJhL+7+gJ0n85np/REmjo/4RLSMHkGj+jnrcay0QfXLYWEz8TIkQ77fV5R4nbmwUPLHElgC2MKWdxTlMbS2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3625
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The book3s/32 MMU doesn't support per page execution protection and
doesn't support RO protection for kernel pages.

However, on the 603 which implements software loaded TLBs, execution
protection is honored by the TLB Miss handler which doesn't load
Instruction TLB for non executable pages. And RO protection is
honored by clearing the C bit for RO pages, leading to DSI.

So on the 603, STRICT_MODULE_RWX is possible without much effort.
Don't disable STRICT_MODULE_RWX on book3s/32 and print a warning
in case STRICT_MODULE_RWX has been selected and the platform has
a Hardware HASH MMU.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig         | 2 +-
 arch/powerpc/mm/pgtable_32.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0631c9241af3..cabd26b2c103 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,7 +140,7 @@ config PPC
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !H=
IBERNATION
 	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && !HIBERNATION && !RANDOM=
IZE_BASE
-	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_B=
OOK3S_32
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index f71ededdc02a..a56ade39dc68 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -148,6 +148,9 @@ void mark_rodata_ro(void)
 {
 	unsigned long numpages;
=20
+	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX) && mmu_has_feature(MMU_FTR_HPTE_=
TABLE))
+		pr_warn("This platform has HASH MMU, STRICT_MODULE_RWX won't work\n");
+
 	if (v_block_mapped((unsigned long)_stext + 1)) {
 		mmu_mark_rodata_ro();
 		ptdump_check_wx();
--=20
2.33.1

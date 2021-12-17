Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CA4788CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlZ36ntcz3ckT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:28:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlY216jYz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMxZbEfypzPbtFeuUbtPzv5luCgATwjuBTfmKnDwwM4eUGZSWpMNS+WVzU0vSy2XABbZvP+MgRIoi3JFqPQgCudo3Omu2+IEybRqvtm27enndJHnvqMkde3JxGk170OrFXSDQMLr4fD+6Mqmd5RS5QE7vhVB48hxgn11QYdWXYJ0YN02DZGYLgQqOj9y1Ldc7r9qcEKCV5dPeZ7giKwUMXpgpPAWO5pw0DoOQdkGOzoCMf5IGBLsfGY5RVufl5wwnbw2TbG8rri9PLX++pjzM5NxdNKIAEf9genITGFCDjqrczIO0bL06kQQmiOa62ts4Cl/4je52CQ3WhtxAlXBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecWjS/2UZ0IgcjyZ1BNFW6PGMsjPsk8NnvtJJ1/fvs=;
 b=bU91vGVLNDC/cJIkU4aoC5YXIX9jaJc/9FZqJfNMya9YeeouS2dGu711uaiyEjBwmxQT3og0fIB14p5L5mitqqEPjC7uhrDw5zEev8HiALDfzYHlQochJNKn2wgX464GpEi1yvw8mI1sG+l1h34vd+K/K8L1rgRfczhNpxQduiU67fgZRem7vaGtuKGzs5jxjHCT+iQvncC4K43uh8d/qFw7HFZ7g4e9GiwSQOVk/YRrne56of1FRyy9Q4SfwbGXpaako0FA1Z/SEBSchVRESR+YW5UT2v8riA9twzVbvw0NCsmt3E8EZ/RsmpCAXENxjiZJ4fPtr+Q+XwriUd6G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 01/14] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Topic: [PATCH v6 01/14] mm: Allow arch specific arch_randomize_brk()
 with CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Index: AQHX8zCnim+p7d3b7kiUzSRQ/JQFWg==
Date: Fri, 17 Dec 2021 10:27:12 +0000
Message-ID: <961336afce7a10ecc4e68021246772ee239dbc84.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfd3f856-e459-4158-e969-08d9c147ca29
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB165075A48BBD0328A6ACBF43ED789@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u+LQySCTDHRNJeZjhfaPP4s9owXtB63M8KdYl01v0Y5D0Xdipu9ip/F14j0Pcc41VOskYw2KYkzNjROoVMrUGVsDTiU1DXA+l6ITl/o8lrcQGT5lvx3ZidTzGU5QQTbu7fNc3N0/qQLh2JUOmbVjq/QtkYhNJOu+B4kbru2AY3qEqJkHVwTYr3VokHTvsARmfd4EPYTL0Fi8H16GaYKgdnqN839lZDMX3k4Y/PnZkSRLmvveWZaco4754wiLvLr6MxYLH0v0zqabf2JzrHwy3BALN1qKX1z2Wp9CMoyrq/UCPe5+ApSjoKH+jgL3Rvhb/oPwjn3cSsccSw8LMon+u8SUxseq6yP5hd3ipCPEIRHrZSFGwWMk0SgbOoxeJvrccAmcQAErvuxloXTmPiEv+3wIOj2iYENRpGmpXZTRuh9B3/IZyZ5B6nsDLFXXEYOGiKjvC0W6dp2o1ZQ/gOHZ1+GaT9IdK6rsZEykhwUJVsnlJrmcmll3jytUD7/SUOzV1wNHKFzUMXSPsDBdHPIw5bgzQ3YfIm+bL8GgBbFe32wPlRPPIYwRzZ/V/9L+3sjVi8+km5kxZ1c74Ycr7icO3gcKBK7laZM3BSJvBHrU+RCP958+Abr3palCSTAjIHDtF1vgnEx/gP+fNYa+Fdrifciy36oi+ioBxs/UirTay4elEEeZQKWUkpCoT4LI+y1CAHF2IIt++EjqUrwXC+12/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(6512007)(8676002)(83380400001)(122000001)(36756003)(6506007)(186003)(86362001)(26005)(38070700005)(44832011)(76116006)(66476007)(64756008)(4744005)(66556008)(5660300002)(38100700002)(66446008)(2616005)(91956017)(66946007)(4326008)(508600001)(316002)(71200400001)(54906003)(7416002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CVQNfgrEK10QPVeKAs8up0j6Z96hI6RTenzMgnWmludv9hr2yLBRAB5Pii?=
 =?iso-8859-1?Q?7Tb9Swp6bmArg1tUJVgXeOYTzYXrSWQrIlbGE+OVa65fONCv4cN07NDAyI?=
 =?iso-8859-1?Q?3XzpaFVVCIXJv2RRAifwP7/EshNqkjYIDZpldi12ZQ9oQhgJUeInD9W1aB?=
 =?iso-8859-1?Q?JL6lMwih8sCn0sSc7XN1EVPTgbVF1eLKbjCmbibFguBHCLpjplL0kq+xev?=
 =?iso-8859-1?Q?LB0ObzHkmkL78YpmK7mQPl1MuGM3k2AKWHs1rhug4pCkJgXotZ6dxKpfgB?=
 =?iso-8859-1?Q?4xlzvfSS9aFzOWnwpZtKlnPPlsw7eBg5Y8WjTOF8wd0+5JG/jSPtSk5hhE?=
 =?iso-8859-1?Q?P3k/+jhxEEs+byC+bSgoETRtHeSJUdlufbw1S6OywOQa0EOGPaM0eqQaVR?=
 =?iso-8859-1?Q?J3sOGb8Kcn5yKVUlP0tlyo5SoJiHU9SAQdK+n2cvk8TffY5taaqFNUUdex?=
 =?iso-8859-1?Q?VGBR+7OzgQRs/XIObTQJZ9G0toEiAGoAQZI/riJPCca93YzRuW++VU3Gb3?=
 =?iso-8859-1?Q?xAwoKQOhb7lTn16WlJR+GgywHB2HqHVFWYSnw/uR2qMSy+SOb1gDkvveI1?=
 =?iso-8859-1?Q?08xaqiYRmeob/25tENEf3UdF2Nf0xPwQ3C/4zJKKWEHM8uujVVegiTFE+z?=
 =?iso-8859-1?Q?L/23pBEQojvc2Ilxa/r94/qybuK1AdndlizWORaVbAeqEmOXA0NeZdVLKf?=
 =?iso-8859-1?Q?vb/uM3Y+xtt/HYuyS3Vq/2O39enVU1AbZ+kgGaxAgzi0b1nZU0dSLxPKK3?=
 =?iso-8859-1?Q?eu6IbF2PZfPYzzbdhEPNUGzEvotRWQAVDAGtj2hYUXyBwr76PaBgwch8W5?=
 =?iso-8859-1?Q?u7hH49dNfdSN/5dx6nVxhF+9MH6FbezAU3p+EsL9EhymKi32IJb6ETp/wj?=
 =?iso-8859-1?Q?8c+5NFJrq3vdRyvFtlBtKZKsmbufMXTV4aiogykw891ZgNYAquDdM6eAJu?=
 =?iso-8859-1?Q?5xnZV7PgwAwbl9AcXfX6qARAI06Dd2U5IyheB20zxlzFo11UDA0tb+YGyt?=
 =?iso-8859-1?Q?SiSYTeyQfmfnzonIu4xScb4L27uAee1Cfnuybd6kvYL8ukhQJXZp1n6umW?=
 =?iso-8859-1?Q?oH34F4cO+9f6cVLV76PMZVTaqzXkV0O8Ssst7JYAoJKqBGmWB3/jxhDxQE?=
 =?iso-8859-1?Q?//za7Bvaup3GxCEjxcsvuSClSs08XiYCuXfjlmxY7xMgMl4FxvPassxGWu?=
 =?iso-8859-1?Q?hFTHqhS4JB3swnklXSK76YvpA3zfo9sER/t8uB/MYGDAkzUCqAY1RRGcbF?=
 =?iso-8859-1?Q?+Zyg+M2LbFd2E+WSAdhHio8qRm7IS2oDO7+/KjZcetDVfEG3q2jvPt5Hu9?=
 =?iso-8859-1?Q?ijaUt75Gmae0gI1ZsjJD2ZO6rm3R/V2FkWG4LrTL+Sqsjo5j89s8O2SKJD?=
 =?iso-8859-1?Q?0Sxp99W9OLOS0N8lx+xRIGnbn0Ys3fRDWxldpJeYrObS5jQSmXQg53/XHF?=
 =?iso-8859-1?Q?WHjhzGSzPZyiSNJaW/qugI3MdHPPt3T5K18opm/vD4NrjBR09XApIccKu2?=
 =?iso-8859-1?Q?Bt88Nu3rBqRTOvmqnX97lp+CVANsSeQbFo1aOdRiLdenX4aMMZ7cbcc2H5?=
 =?iso-8859-1?Q?qrlEyFNfKFh9pG7luU2+9GPa05p/ig19ogmFAXvWJV4jg1gueLEIRiOmKC?=
 =?iso-8859-1?Q?y9lqn0ktjel9awu46+8wUZbEVuOACRevzHNlNFBciSDIAxqIWgOoLaXgJf?=
 =?iso-8859-1?Q?VBjthEwTSG2QEOnaa4+17vR4GmI29az7kf3Xo4t5wWMX6XhV5GsR4hqwBv?=
 =?iso-8859-1?Q?IkiBbESjcQNcMLk4UCR+MZBdk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd3f856-e459-4158-e969-08d9c147ca29
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:12.7750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZsXb5ci4oq4wk8NdrZT7wUfX/Eu2tsN8zPzDBq1am8ZjXVlnBhFaJNvhR/kejEJ7J8G3a3fW50oO6zTIvAahcAfeJdT3o7dzG2gdoqdNLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e7142bf5d231 ("arm64, mm: make randomization selected by
generic topdown mmap layout") introduced a default version of
arch_randomize_brk() provided when
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.

powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
but needs to provide its own arch_randomize_brk().

In order to allow that, define generic version of arch_randomize_brk()
as a __weak symbol.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 741ba32a43ac..46d1a2dd7a32 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -344,7 +344,7 @@ unsigned long randomize_stack_top(unsigned long stack_t=
op)
 }
=20
 #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
-unsigned long arch_randomize_brk(struct mm_struct *mm)
+unsigned long __weak arch_randomize_brk(struct mm_struct *mm)
 {
 	/* Is the current task 32bit ? */
 	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
--=20
2.33.1

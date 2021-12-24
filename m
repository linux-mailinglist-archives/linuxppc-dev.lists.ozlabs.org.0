Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08547EE73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 12:08:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL46x4bftz3cCg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 22:08:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL46P1KVGz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 22:07:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fe8GIc+YjFF10mAegw2KHr1v062PWgv1uR7tNvS8JzMdCJGZHbbM2S+v98RMjZuRp9vmKY7VaYYqBLTrhErIux7ZucRPAyTSbgjfKxh9VY1hosZDzYpLSmm75o5pHQSzTunVTN4+y7d0X86clPTRAc0MAyIB8xTxmLb3kkviXYPqK8LGhuu9hH4bntym+On5CFFa0h7fgQQeG7K1/D2vZ0HL5I1GqbY5OqSzDCakP4W85OR4GDPtL0q8wcKhQ5R/8Pg8Ac1qa+B+aa5Y5wLCRMNxDU0BbOlzEG/bDtSjM8Dflf1+WhTx+tATIDelGYFzdS+Iqv73bDjL35fIBHvXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8SQB0l3rFQjDxDv4Y1goDNGhPMne+ApOmfRu3PcMDM=;
 b=RFSxSSRSZ6dBoLEuDgOlV/j+ss0UlOZp6QKyJoN2YLKTlveQZXVzBfSADLumWyb+tiq3Du4NMCehqyXBJ9oowdfsentT4s5evSLF8xPunu4aIjHxTJvG/oU4FuhJWWAyPzdhd11DRpF0xK0At19a2kSm+YmgRGtd3bSt1OlHfyeGnyOprT2PoWSP0Fj8d9K0bcFFWFf4YDiSwTAcRSw2GXYggNQ5PZmeI6hIq9hHbriw0fE4Q3cttVJQ/SnePEU3izcR06/lSihy2fqOKzu5ciQPDbc11rke9AGfz18W92pN8lVmD4jpLAuWM6SfiLHAdSLrQDWsuOmiZVdlSdxjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Fri, 24 Dec
 2021 11:07:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 11:07:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Topic: [PATCH v3 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Index: AQHX+LZz8qLd0m1ne0WotvwFO7oMmA==
Date: Fri, 24 Dec 2021 11:07:33 +0000
Message-ID: <43c3c76a1175ae6dc1a3d3b5c3f7ecb48f683eea.1640344012.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 473d59b2-c065-4008-4f91-08d9c6cd963a
x-ms-traffictypediagnostic: MRXP264MB0005:EE_
x-microsoft-antispam-prvs: <MRXP264MB00057E5843A3E68D386FD2F4ED7F9@MRXP264MB0005.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGLL1T/5KHF2ztVOBd2Y3HdBjYu1V6Hhw35rxyFQGXZJkRydSW3XpPKA0H8DedfHdRKMxNyuehKCMk3JxoBqO+D7Qxx/+MOhDJAF2BUmk3mF4oXIOVtKorpZVNsQMY02M5Rq8ppqQE1CDZ8hWBwQMIs8yk5Py84WG0ncAo4mQY3c8KknS+kkpxAOOP38r7/D2h8x/y+waZ5Y79Tem/uv0PMaVKto8f7esqBLobD7zJ0845an6W1ntcDy4DT5fCdcMPGJBSZxpWWlZcP/TJKymU2X5E7D9pmzFbEa50j2b1NSTlrv+fGaMIWy5p2EcNSGhzwAcyvnn9V+YujzLTJ48/mMqTv1UmAjRhvD/3P8eiteXvR9ABwd8EF4w/0p0WMlt3bo/WebXQQcDXcBL3q0EW/bXsSnVb693hrgqWcc6hN3jtRA+B6Bd2CQ7FCfrf9Bmo6bu2edVv2s6HqZ5efMRjq6pTu/LeVbHrlLbpWIkAJt6jkWsLCR+iFt/9X9UwkRsFHwAk1HrXJR9Hyc++LZFJM4xUl83DlryZkeIlE+kzT0HyeCvInz4c+Oc5H4K5iPQx7kWzxdofaK5NX7fSOS6C07hL6vZhsgTdFvH95FU3uxwHlyP1BdPXnxtMlN4P2w09K0Pw+LWxnqMQWLWltTmuPdo7WYz2eU87YGmiJVYVMZx9NKH7vABhZNf0zzqs73WSwaOAsb4oS0xIlduDYEfK9KJ3fOne1KXFDNMukRAJrceYiLjSr79iuLidwIX5uSP2XH4I2T/ja1rd3gkmHVAn4g2ffVobIpvKLQlkob7q0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(2906002)(4326008)(2616005)(44832011)(64756008)(508600001)(5660300002)(66556008)(66446008)(66476007)(6506007)(91956017)(76116006)(66946007)(8676002)(966005)(71200400001)(8936002)(26005)(38070700005)(316002)(186003)(36756003)(38100700002)(122000001)(83380400001)(6486002)(6512007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G/ONU0JNODi3vo9+B9E1vbWGwTtyb8Lxc7j5uhISNrsFs7aNrIc+9QDpj1?=
 =?iso-8859-1?Q?pwpd9QtGmAfbuhVdROwmHiTXZxAB07+2+7lJanZUVqBUjP84k0p2Rsd5ga?=
 =?iso-8859-1?Q?8IYEUbeRa+oaqaSyT5SfTgfBtqs0LclXeNdBMs70WWeISgbftsGmzWC9Cs?=
 =?iso-8859-1?Q?SIhSoP6xHKJL0TCy5CqetXoYH2oREUt3+g27cbxeGJr+pil/M28RDjQIqw?=
 =?iso-8859-1?Q?17vbqsMdqWUVNHIed5AJT/+uj45fgJ5bOpkWNDMktvBGOGlNaiDJ9R/hcn?=
 =?iso-8859-1?Q?tYjs8J1HR/dpUXyc/qQSE5hoInvLtXFluc/UtjABUEnB67qsCbrErVR8yS?=
 =?iso-8859-1?Q?ROns5U2vHgfgSIf1mQ3JMB7mcK06VVuOZItaBPw8++4RX1fGws23SdJx3f?=
 =?iso-8859-1?Q?fgg89JK/J1JRzUGuRlNq/DyqyBlsnZY9e1coVnQEFEtOOH2xRVS3KH1/r7?=
 =?iso-8859-1?Q?Jb5va5DtAFSDo9eHhOXKgaW1jp/g9usJS44vpztVsGylSXfQoWg8bCQNl4?=
 =?iso-8859-1?Q?uzbzrgQ2X/u760oiOXRrB0RYa56Yc8/qRb+vu5LwtRlFyc5O9hyITxPFHK?=
 =?iso-8859-1?Q?55b9tNRhs5hvFLeqO5k7tICnP7jFbnl8DHM3h7j2xe4POTzeEAlzjgWDls?=
 =?iso-8859-1?Q?P8CW/eQO78kG+U2OTNUbDV9RpupeGpVq5Kuxiny4cAGZinsvv9fK60B4hD?=
 =?iso-8859-1?Q?DoRCeqP/KC7QhtOq3XdJrtXhVBFr+X3Oh0uUdIsi3srtWwECBHEkEZPYWs?=
 =?iso-8859-1?Q?TdWhnXKJgDtv50kQel5L2i8NSfgYgFpsr53mIF7QEt4Ca+G/0+W+d6aXjp?=
 =?iso-8859-1?Q?6f08w7pnqlD05eTaz4Lv2ghYWcNQj8gaQVRUyoyteWfjXgB2WcmrRjP+SN?=
 =?iso-8859-1?Q?UyHiGaSEovBwuNO0UX7JPxbjT58RCcnSzqTK853QWiBPkW3Rla8z7E8eYy?=
 =?iso-8859-1?Q?S61lkmhLEvxeUO64mC7vzt0HtV6Gf4X0MZqQmkyyMQECKIEDtelUeuAKzf?=
 =?iso-8859-1?Q?+KDF5d4gBx9wSsP0CFETJ1tUBXsLQojpFM8TADUfFbw5Smb+fO1SuXMW8+?=
 =?iso-8859-1?Q?L71F2TQb4SH0YFkzOZryVleI4czA9z1Kdm59tIy+mIrDuZDsia/GNyIpbE?=
 =?iso-8859-1?Q?0BW9NLzB15beCQ2lu70P2V9yn6RgRMCtvFQeC46KAd3C3TDCRa6F3p6fql?=
 =?iso-8859-1?Q?lSGOvZ/9QPwRMm9doa12QQ/txREeWrM0qbmOTGCcPZFzY73ldRmSuxxgzR?=
 =?iso-8859-1?Q?5x46wr29k/zIbPOxXay7bVmXiayYaQwfPEdPCjxm1x88WFl19J6/NXQCJ9?=
 =?iso-8859-1?Q?f3wZpgnbOoUqymzcX+eB83P7pmWQEz1YwkKIfWiaGhAnI9kiga/Mo7kYMm?=
 =?iso-8859-1?Q?+p+cc1uOljwP3A47faPm+GvVD7BYbe5W2CSFwZOmQignUIaKPyCQNaSafg?=
 =?iso-8859-1?Q?zSV3MwUaPKk3lvfu2vV0MJljuAZ5GW8g7K2Wxhnu3WnTbjr772zESjMY4n?=
 =?iso-8859-1?Q?FgiXQyDc+bV87jnDedyhH55DHsV9k20GG+eUE/sUnM7UnRKwmNC2FePkI0?=
 =?iso-8859-1?Q?Ni7zWqMfbgsIv5ujYfAYNdEwio/GMLwF5BUiNM5PaEyXk7VMmwGUeLS7+P?=
 =?iso-8859-1?Q?1VlpRV+Kfon4dDFuhQMhNfoifBFEXJxDxj364NTqYBuZPYi3xLJvDsF8cL?=
 =?iso-8859-1?Q?qCp6enCZXMJ6tojDdxJdD/CHDNSi/AbrIBovNPJaAb9eK6iOKgRhO+qQ/u?=
 =?iso-8859-1?Q?JtHr2YwKpKbZsKEuuqLM9NVxs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 473d59b2-c065-4008-4f91-08d9c6cd963a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 11:07:33.9542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KirlBBPWKmCBXT04xO35KR51Bed1AhF0lbo5oOMYwtxczl/dBRjc8Gl7BDu4lP/i5qEgK5s1nu7gRVk4aDuRABtVvE8tCdAxvRBildEMrA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0005
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
Cc: Maxime Bizon <mbizon@freebox.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
included a spin_lock() to change_page_attr() in order to
safely perform the three step operations. But then
commit 9f7853d7609d ("powerpc/mm: Fix set_memory_*() against
concurrent accesses") modify it to use pte_update() and do
the operation safely against concurrent access.

In the meantime, Maxime reported some spinlock recursion.

[   15.351649] BUG: spinlock recursion on CPU#0, kworker/0:2/217
[   15.357540]  lock: init_mm+0x3c/0x420, .magic: dead4ead, .owner: kworker=
/0:2/217, .owner_cpu: 0
[   15.366563] CPU: 0 PID: 217 Comm: kworker/0:2 Not tainted 5.15.0+ #523
[   15.373350] Workqueue: events do_free_init
[   15.377615] Call Trace:
[   15.380232] [e4105ac0] [800946a4] do_raw_spin_lock+0xf8/0x120 (unreliabl=
e)
[   15.387340] [e4105ae0] [8001f4ec] change_page_attr+0x40/0x1d4
[   15.393413] [e4105b10] [801424e0] __apply_to_page_range+0x164/0x310
[   15.400009] [e4105b60] [80169620] free_pcp_prepare+0x1e4/0x4a0
[   15.406045] [e4105ba0] [8016c5a0] free_unref_page+0x40/0x2b8
[   15.411979] [e4105be0] [8018724c] kasan_depopulate_vmalloc_pte+0x6c/0x94
[   15.418989] [e4105c00] [801424e0] __apply_to_page_range+0x164/0x310
[   15.425451] [e4105c50] [80187834] kasan_release_vmalloc+0xbc/0x134
[   15.431898] [e4105c70] [8015f7a8] __purge_vmap_area_lazy+0x4e4/0xdd8
[   15.438560] [e4105d30] [80160d10] _vm_unmap_aliases.part.0+0x17c/0x24c
[   15.445283] [e4105d60] [801642d0] __vunmap+0x2f0/0x5c8
[   15.450684] [e4105db0] [800e32d0] do_free_init+0x68/0x94
[   15.456181] [e4105dd0] [8005d094] process_one_work+0x4bc/0x7b8
[   15.462283] [e4105e90] [8005d614] worker_thread+0x284/0x6e8
[   15.468227] [e4105f00] [8006aaec] kthread+0x1f0/0x210
[   15.473489] [e4105f40] [80017148] ret_from_kernel_thread+0x14/0x1c

Remove the read / modify / write sequence to make the operation atomic
and remove the spin_lock() in change_page_attr().

To do the operation atomically, we can't use pte modification helpers
anymore. Because all platforms have different combination of bits, it
is not easy to use those bits directly. But all have the
_PAGE_KERNEL_{RO/ROX/RW/RWX} set of flags. All we need it to compare
two sets to know which bits are set or cleared.

For instance, by comparing _PAGE_KERNEL_ROX and _PAGE_KERNEL_RO you
know which bit gets cleared and which bit get set when changing exec
permission.

Reported-by: Maxime Bizon <mbizon@freebox.fr>
Link: https://lore.kernel.org/all/20211212112152.GA27070@sakura/
Cc: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Use pte_update() directly instead of having a read / modify / write seq=
uence
---
 arch/powerpc/mm/pageattr.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index edea388e9d3f..8812454e70ff 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -15,12 +15,14 @@
 #include <asm/pgtable.h>
=20
=20
+static pte_basic_t pte_update_delta(pte_t *ptep, unsigned long addr,
+				    unsigned long old, unsigned long new)
+{
+	return pte_update(&init_mm, addr, ptep, old & ~new, new & ~old, 0);
+}
+
 /*
- * Updates the attributes of a page in three steps:
- *
- * 1. take the page_table_lock
- * 2. install the new entry with the updated attributes
- * 3. flush the TLB
+ * Updates the attributes of a page atomically.
  *
  * This sequence is safe against concurrent updates, and also allows updat=
ing the
  * attributes of a page currently being executed or accessed.
@@ -28,41 +30,33 @@
 static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 {
 	long action =3D (long)data;
-	pte_t pte;
-
-	spin_lock(&init_mm.page_table_lock);
-
-	pte =3D ptep_get(ptep);
=20
-	/* modify the PTE bits as desired, then apply */
+	/* modify the PTE bits as desired */
 	switch (action) {
 	case SET_MEMORY_RO:
-		pte =3D pte_wrprotect(pte);
+		/* Don't clear DIRTY bit */
+		pte_update_delta(ptep, addr, _PAGE_KERNEL_RW & ~_PAGE_DIRTY, _PAGE_KERNE=
L_RO);
 		break;
 	case SET_MEMORY_RW:
-		pte =3D pte_mkwrite(pte_mkdirty(pte));
+		pte_update_delta(ptep, addr, _PAGE_KERNEL_RO, _PAGE_KERNEL_RW);
 		break;
 	case SET_MEMORY_NX:
-		pte =3D pte_exprotect(pte);
+		pte_update_delta(ptep, addr, _PAGE_KERNEL_ROX, _PAGE_KERNEL_RO);
 		break;
 	case SET_MEMORY_X:
-		pte =3D pte_mkexec(pte);
+		pte_update_delta(ptep, addr, _PAGE_KERNEL_RO, _PAGE_KERNEL_ROX);
 		break;
 	default:
 		WARN_ON_ONCE(1);
 		break;
 	}
=20
-	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
-
 	/* See ptesync comment in radix__set_pte_at() */
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
=20
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
=20
-	spin_unlock(&init_mm.page_table_lock);
-
 	return 0;
 }
=20
--=20
2.33.1

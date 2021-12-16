Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D755477AF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 18:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFKN701Zcz3036
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 04:48:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFKMc31ckz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 04:47:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIZH/FnoDlsMslOXFtDB02ifnwZUkTD0xhCVNRfxsynmMJukj+lvo4D5mid5jrxHY+Wr39u7UhSvVKwjPRVll66c4mnwACYATLoeT+fygReFad0EbyIHkXmYscrIUJIlq6isiM+OFZdxiR7SLuMSuSjc+c7c9EabXJb1L3cA3/qT6UlR0/MOlOwNHSFGwfYaGm3BqP0e2bXIEWsZy7rzGI5p84FblIb23mB0ZtSTlmD3mp5QQ1RpmPX8l2RC6L3H8SBhxRO0A/37GCmJYCXG3Da/1SbpgP1m/khfMBQxL2CCUQDOE/bknmSjHCi/qejQ/C74CN+wfe177LdaeZV5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNCU92j9qgjTOOtwQjgdmBFdzmujqbrzEVNjgl8UNDk=;
 b=IjQIFC4Uf8cVgXpHff+34YEt0aVlwc0bL+vzbje+hxP+QIGnS9Lk7oiUoGmq55ldqROd6GZL5136j2pQI3A2E5ym9nugjovqLrW0ILEOHiekAq8QHvjW8/ot5t8XgOCgLyKF3LtwZ0fbkNpWzyW7c9lUtmfwlwezhDQyMlEYPTGZjGhFDm1PnfbmSfE1J6vabAhYX8IjPw3vDRYQeDOH8aXaGxHzww7SJSc5uubdilCZxqUlx75G6vM8isZp8wWhbX2YEDsLxPNtznhv4v+6W9OqFF0tlds+staNLq9OFEqOeKTA90uaIbQhtxZHm0MWhPDAGaIvLNnZH1Vtt5X4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRXP264MB0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:18::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Thu, 16 Dec 2021 17:47:33 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 17:47:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Topic: [PATCH v2 1/2] powerpc/set_memory: Avoid spinlock recursion in
 change_page_attr()
Thread-Index: AQHX8qUBgZlGk5AZtkeEGUMOS24Aew==
Date: Thu, 16 Dec 2021 17:47:33 +0000
Message-ID: <112b55c5fe019fefc284e3361772b00345fa0967.1639676816.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55fae6c4-bfab-4981-6ec5-08d9c0bc23d2
x-ms-traffictypediagnostic: MRXP264MB0040:EE_
x-microsoft-antispam-prvs: <MRXP264MB0040949889ED00A16D6726D1ED779@MRXP264MB0040.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XRTDJK6KpVIizi9xR1QnHiK4gRF4n04Y8XZyH7I4t2fp+OJNJ5QBGj4t9rT7Um7JL1o3IxUN7kT2j3xmzhebM3QYPAHhjC54iyKg7Mh1X2W+o6Rr6H+3T8le/bnBOx1jme5sDLLXnZ5RtSYc/vzgBHApvQvteTbVd6rvcmm5YOsINdId8aVtua4tERz5518l6SGZiYLIHSIMqBaVWcuTaiiWNmSU8mePTFyYuR/uMKI/AnB9ptMACQ7AHfVQ1phY6ZTI2f4JLxHgasXUoRncbPDKaUky1ORRfbqLrMawoTcMSEbvZ2W3aYyO4ZSOWbajLy47IcydU5Byda1apyjQYjTyyKytuH0gbatEMpHKxEO8VqoxsjbHFneM4B8SCEjHWkr5br0CmnvTyGU3HSI1zB1Lu3POX3kiDJqJrsucVuJt43qL/IVYcTQCtztyb1lr4Za5PKrNS3bYz0BK9lI+yN1gW6z0L3kWAXl8oR0OexjoqvnJBuRs9+0zhhRC4Hwr1+TrBwnBky7aNt+6U8+RH0yfEDtDjyOcwpHnDFsLmAub3DZGrcfn6/n90ehZsahTFRgNchmwlXXalRX7DVhjPVaq056p/+/YBuLu2eNLyPTmsh3wJcyk4LfsXU2A/qrk4ji2lpi8gJ2zxACnpiza7VgMvL/fe9vkfroT1aEWpNPqeN9mm4QHDndDnUwGTfpfwQU6UnYtlR+oWqHrOAVjdIxnXueWHI6/wu9vEzAl4w7JFnyiK6J3Nm2Zmk+hPkivIEvfHN7vy7SdStLVuGDjkuZCd7ZIV48zZ9sZ3ozYSdo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(66556008)(54906003)(26005)(508600001)(8936002)(36756003)(2616005)(316002)(66946007)(110136005)(5660300002)(8676002)(71200400001)(966005)(122000001)(6512007)(91956017)(83380400001)(2906002)(86362001)(66446008)(6506007)(64756008)(38070700005)(186003)(6486002)(76116006)(44832011)(66476007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?a6sg6mO/ePGeXAkw9MZSrr2wCrDKAlR4hK7XiU1I+/V1UtrygLWazg82x1?=
 =?iso-8859-1?Q?YnPqA2hHCpjmag8UcYX/0MSbUcXAONpZWSdKG4QgXoqNKBGDbx+8SyzIgy?=
 =?iso-8859-1?Q?7NG7uPA0H1vCTk+kAp6LjVFE42bmW7jWu9e7SoYAqrfLaNSrZ8h9Fwrofl?=
 =?iso-8859-1?Q?R8FAzVB0Y/4iXNB//yvBpksp2SZDGSzTErWcKCe4Rway9+sZoIl/56fzj/?=
 =?iso-8859-1?Q?jIHcuzpe1gvJ6wpDPVaQIGMCmEzB7JYVsQL7jKFgfuMJA0MpwNF9h9tDKh?=
 =?iso-8859-1?Q?p6HAdw2ERuZkDKUMfGDpL1SwHH8jjx14Zzsp1g/YPZv4riU1b2XuO3hTdi?=
 =?iso-8859-1?Q?NQKw1jkvhTQFiyiMGdihJbGFnY5DNTBA3/Qa49naQs7JYMUlSRIXb2svmw?=
 =?iso-8859-1?Q?mq0N0KooqgodYz0qUNNU8zaYJ9SZmzt+nqbby2WO92ZmYSqUG+n1zZEpjF?=
 =?iso-8859-1?Q?i2frUcL7fAJy6s0T73dONvg+HkG50Y+1UeNcQfr1C0S5MNtmbr2k7XXt7O?=
 =?iso-8859-1?Q?Zev8Dtyig8TKMZ0VDOzSRINQ1FJsyeDCkJpKmHqaqhG5hulhABfFDSSvvH?=
 =?iso-8859-1?Q?ZYmN33vLUOlalnkHrMcAjsE/P5swLIQJj8nXRf9dA4lJW4gRfNxO2qsBYy?=
 =?iso-8859-1?Q?95/Cb998GCsOiw82LCKibAg/EpjR1x7vIKvL/5EiysLQR9f09DQimuQFe6?=
 =?iso-8859-1?Q?f1wSVJogQpPA8KAA/zGEY2rWR3L0SuybvgrBKi5AuKrvsncZHnDEHUiQeK?=
 =?iso-8859-1?Q?FII1IqVfvrYL/oMvJZAzpyTlFsZCKBpw5vm72e9SJRjwGlqi2oa+q8+zsu?=
 =?iso-8859-1?Q?kJL6eUBMv/m5AMFuxIV+4kcgh0AhgXUSKSEbSNjE1RaNcZurmwkIEFixy7?=
 =?iso-8859-1?Q?1Pb/LGxZ4mfVPFmz+GTC4TEDDAYATGaIoOUcxRn3tH5m8HQQZyAolzcHe/?=
 =?iso-8859-1?Q?JO+WdD8B53RaLVC4iu/cJnKeuD6HWv47BcSlCJCmFW/TCXGbKKF6AYatnd?=
 =?iso-8859-1?Q?0lWQAxrhbuNglWYBFAeNZzmf3yAyX9gtUjPSXLM6Akgo9txdH2tAvMCdDj?=
 =?iso-8859-1?Q?5qbznNEpuah/ct2Y/FpKz6a/wwPiql1UKpox0nYMIhPIGGeiFGdMYxCjey?=
 =?iso-8859-1?Q?WVXmY2Iu0TUiZfTpP4Z7reShgjFDWKaY819pqjLiEbTgLH0nuwUOn/hqFk?=
 =?iso-8859-1?Q?lRy/aVwtLk0u7Av/ijZhAJjKWHTTKnMBuv08+aE8ry8xgwz3plMGhsfnG9?=
 =?iso-8859-1?Q?vwkULsaT+HjlqVYiZhGApNX5JOG7fojcJZ9kCASD0VigTmIsoz5/t+ZTE6?=
 =?iso-8859-1?Q?hOOrA0AMCjN7ePKfrHFMVW4hZtHaAzR5l30HlyB7WdsX+VnLvHrdDZFOu9?=
 =?iso-8859-1?Q?X7C29a+kZP2MSYy2hzi7k7jNLod484Vo/Uod+jrErkxtmyA54fnhIGJDz3?=
 =?iso-8859-1?Q?1tGkuzd2wIIPXTGmvkeBi0R3R9XxJ5f3WFE/6NkKP2ELioEgG0y7o7AF3n?=
 =?iso-8859-1?Q?2wJwn4xPxUvzmUS/pVEZ4Tm2rQ85uUYaSYKH9vJAHYKigRnkRvM5Dwelkh?=
 =?iso-8859-1?Q?Vbf4UGbEFyHFRhzNqveLA7JVXmHVNG5GGVYNJ5c8yQbHKIr8WmuI/Dc6Z1?=
 =?iso-8859-1?Q?UAUCUuUfKWTxUeI8eeUozdmFkdukx/NDSW8sqgm/O5/yqksEZwOZmfXwp+?=
 =?iso-8859-1?Q?p19LQCoAWOcs1e6U/mFD2pjUfsy4VreuKoODzDV9umOhZyIQcvOG1OiQ1A?=
 =?iso-8859-1?Q?Uvl1TuuixfGaMs2buHr6R/Pt0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fae6c4-bfab-4981-6ec5-08d9c0bc23d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 17:47:33.5978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tY3AdsZPbRoyG8OTMFdtb6TeKTvtEpxvevttWZO9GHejmzC9gd6CpsPH6ZKzviHnX1XQYPlQRrW39UQvi1W3aHcZq8UQs3cPbGshlIp4R8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0040
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
the operation atomically.

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

Remove the spin_lock() in change_page_attr().

Reported-by: Maxime Bizon <mbizon@freebox.fr>
Link: https://lore.kernel.org/all/20211212112152.GA27070@sakura/
Cc: Russell Currey <ruscur@russell.cc>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/pageattr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index edea388e9d3f..308adc51da9d 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -30,8 +30,6 @@ static int change_page_attr(pte_t *ptep, unsigned long ad=
dr, void *data)
 	long action =3D (long)data;
 	pte_t pte;
=20
-	spin_lock(&init_mm.page_table_lock);
-
 	pte =3D ptep_get(ptep);
=20
 	/* modify the PTE bits as desired, then apply */
@@ -61,8 +59,6 @@ static int change_page_attr(pte_t *ptep, unsigned long ad=
dr, void *data)
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

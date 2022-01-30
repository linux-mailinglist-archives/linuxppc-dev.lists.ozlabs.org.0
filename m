Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008384A3817
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 19:40:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn0P76gyLz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 05:40:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn0Nb4QNKz304w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 05:39:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8r2sEXIB2iWnaU9QtSwHvZPL+8v/P31k3Qo0JEzhN0BHwqALm7FXmzFZoWL4g+Rj+hPdOb0sBoVYXlFrUSCnWEwNAI4V6D7pXwPqgxeIxMjmlExVeZDyee6RWbzE95Znpp5z1ih4/1nKXKo+7tyXyoggYhH6jgnkSvx9aq/XJ9JZP1172vq+3XpZaXs1rQwNXBRlV0ZoV0sZr3YZt82OqG6VNtOvLDbPoH8SbO8xN0MBudr9nI7RYLHJibPsZWp91614j8rlGTIaQpHhZKNK4YV/Z5lxOvQUpqXxNxLvg3we+xfKXmbefEmC1njFFHtijrD8Sf7ySHpwHLrogguvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WAZ7AtoNrM0ysy6SKzdy9H1LuAFud7SD2Nuqv/cvLg=;
 b=niwzQCbwaDzirsiqzso7SMlkmDASH6XppAKBPe9VYHuwYpJXSUvO1W4yCjxLSuSeGjmfdScPk56yb6VBPQo8c2c2E/qJfqfxfjVVMJDHenzrtZs5EzYfIjORKKctPKK4RGs3zATJhQHJZQ9te2xWAzA++FWChPoKmhL9rI1+1IbqlauYA3mpsCe0edV+zZYLe/X498WbxrK0KcYLJ6VbAW2gp7y2z4bWma+784FWbW7/SwUR9YpiprsdyDpik1PVC3zsbs94nSlJxNoxyXuwHaIkVOdAlwBjoZV25B53b2xjnVafbKi+XHxOpp5EkAygVBb7e7XM6OMaQ5ouH6L+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3486.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Sun, 30 Jan
 2022 18:39:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 18:39:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/ptdump: Fix sparse warning in hashpagetable.c
Thread-Topic: [PATCH] powerpc/ptdump: Fix sparse warning in hashpagetable.c
Thread-Index: AQHYFgiwjP4NasC/wUmzoQdvzYRFMg==
Date: Sun, 30 Jan 2022 18:39:18 +0000
Message-ID: <bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4a247b1-56ab-4fe3-f46d-08d9e41fd34c
x-ms-traffictypediagnostic: PAYP264MB3486:EE_
x-microsoft-antispam-prvs: <PAYP264MB34862CEF4C518CF9EF3FADDDED249@PAYP264MB3486.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:93;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wAgeOhuXbBeVRCRwl/MlueIWOD9+hJXKl2Hi9ph8Hsobrpdu73CN5FCxeSB6Ofdz3+lXHQ4VHRA2PrGlJEURCJcOwU3QbAPudkXYO4KJ6Rg6plc+5wEG7eBP3f8eshEVmYBLUHmJMrmkNGKkZ0b4DZFPyPc0/+DlrgTLX4MqTMrK+cNDqwuxSJn8Gc7mqIXyvwi9Zkgfb2BmkIcet+s7w0X0ua+lkAtVtauZXDZtWfq3yA66tX3pD69X4g/wROf7aSBa3EPOe3BJy0rzrt/3R68s5ha7tnRS68J+8q/qDPFhko/cVtJ2dff6n15Z0tSxzBtSsnAmgWzBGqd988iMAYrkwLCIt8mok30IU5HIyQucKEcuWPcaHuigLv6WiFpHwxH60SRRdhsXmUHFFiKTyFcxbzs7km7hXk7zqDKLCk1OnZQv306fkbvcNRr05niGUjpR+8gje4sURCo/n/TDx2qBjjtQiFrgtFzvr3yKvHV9gruy33Jrq7YBWuSfQC0/Ak/FbosZ8iL+k5YZJ841kNZt21r6/YU05CpHvImo0iJi8Wc4dCyFCUM3HLqYgT/ut5APzLpesnerF6VS3lzT9UV9+YGz4R+B9c7r451PWSE4lyxfYIyXuGc0j5LvnXJLlZ4jTFq4Kopt3qMVVLoOqTQuuOWHyFAXDHZ49eYzB1HAdGM73xpWp1KW9GKA+BV2TtxgvUlU8v3nkmAV6Y7asg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(83380400001)(110136005)(316002)(54906003)(122000001)(5660300002)(64756008)(38070700005)(66446008)(8936002)(8676002)(186003)(26005)(38100700002)(86362001)(6512007)(44832011)(36756003)(66946007)(2906002)(6486002)(66476007)(66556008)(4326008)(2616005)(91956017)(76116006)(508600001)(6506007)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JUS2MiSvdiW9Jm84svyZglPq5s3jGWcrFMNy8sNns/z764PBPjw36u9XA/?=
 =?iso-8859-1?Q?/qmN71U9+7wajwEo0VRX8Jc9P54sXxrrjBvKafLEnqTfxu7RGgtDWgrOom?=
 =?iso-8859-1?Q?qSugtBdp/gwiRBbNhoAfe/fgPvh8v3bsblTD4btp2aWGI2eRhlo1jxYOuE?=
 =?iso-8859-1?Q?KSRb97dWRqRRNUzc7e50zQnLKZP/L5zpYKn+yJgbDRWvdivzrncFTVUsD8?=
 =?iso-8859-1?Q?k9+VpqfOK1zSbyBrrKmpYgfpHoOuZeXAP0SaDQpjR0KIJ0gv7uR3ZfOzpx?=
 =?iso-8859-1?Q?2r1Fo/OZzyxZb4PEaL6q3oT1wbl3i3JbNho0/OvrMJ6OvsfT6YPrDD9WU7?=
 =?iso-8859-1?Q?LCyK2ccLjOc4VSKXh+cf/HoweJQgQPizsWbFh9vD1aE479Kzywkp+QcsEX?=
 =?iso-8859-1?Q?6YlK4+y82x26VcI+kDj9uDGdf9uUvSXuqYjj/HKNGN4FsehJ2zk7D2EAPB?=
 =?iso-8859-1?Q?zLtdXSbMR+jVxu/XKP0ce0/kiPrZiFxMEQvOecY1eGP4D2eEOwWk0lYXtX?=
 =?iso-8859-1?Q?Ji4IMfdBopLIf9Swuvsnrq839RiZ9OiN8ml7wUb2GD+lj+oJNgcAY83ZHl?=
 =?iso-8859-1?Q?R+0hcFHDGlsefRAzNAVdGvi8C97ifGiFLJw4fSqte95E6ivE6RMjclkl6d?=
 =?iso-8859-1?Q?K+m/CzeTIKEXbbSwuG5WpO7gOLxx6k0h+9GhLRxq8WSR6kGMMocjYkZ0E/?=
 =?iso-8859-1?Q?5Y2EsWaMRS6uPHGRBr7QLesP3dmUVkcCc1z61sReBAAUTmhEygGrVYkN+j?=
 =?iso-8859-1?Q?RoIBBAf+5K+ZMiZvqW8L9PcYS/onQr8afbfSrajPZAMVKMcLMyKOQxgr1C?=
 =?iso-8859-1?Q?gatWabzWDW55B1a5psGKoAdxiKZdjhYNpFa2QtQR5eu84o0Fj+nKhLL230?=
 =?iso-8859-1?Q?V01aUIQm/hBHngi4kc23DRY6+77pBVkKwVYg6IxBRWl3rcWoDh2+uMwl6a?=
 =?iso-8859-1?Q?/k1F8u3Dxf1wi45MfiMZGuRqRi1fLSpYBBugYkQm6ZOdARnPrAAgL7/p03?=
 =?iso-8859-1?Q?UIXOZiTGs8kGmpozqSYrYM6PCZhsrGbtat5oFWkdPKDZxDobOpqZtzf7mD?=
 =?iso-8859-1?Q?aFXBV1ugrm4+kgcIqoxTzYDOiLgxYrrMgIHI0qd1JJXRQGCX0nP6DkE8GN?=
 =?iso-8859-1?Q?b736j1aKbdcopkys3b2ZV1ntf8PZDcbTjpM+hLvlgkGu+CchRNw/sNsTPr?=
 =?iso-8859-1?Q?X0jM7IP+8N4FGYf/Ux2wtXie2ffHMANsPlErUMDmbYVi/LzNFOy+Ry7OxN?=
 =?iso-8859-1?Q?d+izMVR8R8U5ZnE8sJIrqtUchIlUCK13fXmrTfz4oRvMRL+KqaoMtj4lz+?=
 =?iso-8859-1?Q?upPoOnDjjnrhmpE3CccN9jHPLUs2KUx38AYtPPNU8yJloNFCR/Jixw5/Ej?=
 =?iso-8859-1?Q?eREiX98uAMRlyuGATEgW7WJSEJxtD2JSCZ92jvrVv5kCeMURcuPExxLjCW?=
 =?iso-8859-1?Q?l9qo9vU9lQ0LTiDkzHfbLh3kX/E91RkGXMU7OfpFAVQoDjTOlpdcYrJg8/?=
 =?iso-8859-1?Q?Nf57wDJtB6Cn3mrs5VGxDt9JFmje8DxAI0MauGg5lPngP11Ts/6GhUGS7Q?=
 =?iso-8859-1?Q?xF1k96XN7VSW8i+olI8CdityRHymHTc7XcX/S03M6J/hqC15Qm8cvVEp3x?=
 =?iso-8859-1?Q?izlQdbX7Tdgi1oGAKWGqLaB4xvG0k7LgWj5IamHzr+AVXsweNa0/+I+qQ9?=
 =?iso-8859-1?Q?CAblO9ZDxwCFhveH1IZQz1CW8e+XLW6MphxubxKQEgVdBgxS55buO9Nvrx?=
 =?iso-8859-1?Q?j2PL6BziqCPwN15qfxIGCefjk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a247b1-56ab-4fe3-f46d-08d9e41fd34c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 18:39:18.8685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sd9dry6p6OCac64PtWwUxs+vuohF1Hcthv5P5e9Ndij4Xe7+yWBu8HuQGs4nr0vLwXXu8ATqRXXXWcE7510xUjFL2wawJ7a0u8SD+C+UWDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3486
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  arch/powerpc/mm/ptdump/hashpagetable.c:264:29: warning: restricted __be64=
 degrades to integer
  arch/powerpc/mm/ptdump/hashpagetable.c:265:49: warning: restricted __be64=
 degrades to integer
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36: warning: incorrect type in=
 assignment (different base types)
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    expected unsigned long =
long [usertype]
  arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    got restricted __be64 [=
usertype] v
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36: warning: incorrect type in=
 assignment (different base types)
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    expected unsigned long =
long [usertype]
  arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    got restricted __be64 [=
usertype] r

struct hash_pte fields have type __be64. Convert them to
regular long before using them.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdum=
p/hashpagetable.c
index c7f824d294b2..bf60ab1bedb9 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -261,11 +261,11 @@ static int pseries_find(unsigned long ea, int psize, =
bool primary, u64 *v, u64 *
 		if (lpar_rc)
 			continue;
 		for (j =3D 0; j < 4; j++) {
-			if (HPTE_V_COMPARE(ptes[j].v, want_v) &&
-					(ptes[j].v & HPTE_V_VALID)) {
+			if (HPTE_V_COMPARE(be64_to_cpu(ptes[j].v), want_v) &&
+			    (be64_to_cpu(ptes[j].v) & HPTE_V_VALID)) {
 				/* HPTE matches */
-				*v =3D ptes[j].v;
-				*r =3D ptes[j].r;
+				*v =3D be64_to_cpu(ptes[j].v);
+				*r =3D be64_to_cpu(ptes[j].r);
 				return 0;
 			}
 		}
--=20
2.33.1

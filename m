Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58147B157
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlgZ0F9jz3dcy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldc2j8zz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuqtrAq6Wtlc2rD/0LhRbz5/9myZJPOto4euONQeVO1JLbxVKqsOoy4qfJAi88YjNEmSfEFWmO59cx+YyE5nkXvueosAOX9WNLr9YetOn4Yb1ebXDwOzsNkEiKwtdQvNhoE5qFBRUf7nYB+fc2tapOqltjzo+hjHZ9vSVT9AFxqWnRWnjVd/yZhkLnVP1femWg5e9W63pnUS2AtszaSwJrNNSwGhrtRf5/n4OTEZ8GKqQRj5XGwFZSKkHd0/Bqxp/OpBwkoE9m+yZP1KvJJq0rkWBl8WBesqLYlnAarIOeGqPHzd4EYrog4IesOtaHkscF7CX/jn0nFFxOnRIvuT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjkLzccxBgRUBZrcs677amlRn+CXlywVi4YSlZ0Z6Bk=;
 b=RQSugFjHwPSP434xZTVF5Wn2JgkZ+cozfxrxear8imbq4kx7VxaGKVaBUYv93TvCF/6K23Q2l9DdRs8+Nm+27JEE0Of1lVoAEn0agCwJ1EK6YX+G8CqBlc1J9vyo96WIkwB+qj1QM+c26slfz5AZJQdqPHVOT9qo9FA+hWyxUVU/gTCp0/ADe16WTC+MYNjhortVB58BaPD8RzaDJXv5qlMCjVklFkEdGBMEkCUz8870fZjBV5pP5CmLy3E8Nf7IX+RRqKQZCNaTfz1wAhfgIm82yh3y9q+l+IoOAYHEbCwm/lhsdJmE5+xAnGNu7cK58YMpZuFw4k3CZ/+oPD1RpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 16:38:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 03/13] powerpc/module_32: Fix livepatching for RO modules
Thread-Topic: [PATCH v2 03/13] powerpc/module_32: Fix livepatching for RO
 modules
Thread-Index: AQHX9b/55CfsfkREwkW5lW2tFTV26g==
Date: Mon, 20 Dec 2021 16:38:09 +0000
Message-ID: <d5697157cb7dba3927e19aa17c915a83bc550bb2.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6484999f-1959-4747-8320-08d9c3d71b9b
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB21611D153BF2EF3C780E5C83ED7B9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 440SdqYZHu3Y98exsSrbVVTqc7r1xusAGUTHX5cl3UfQV3A7bJHh6dbvNqeWTIIJeI+l5ViGT0nr8gzKq2ZW3C0SEJa86kBXiyIXSAE3QMoPThY51hl44Myd4ixvbbCE9bmt1C1NCSPsLck3G0vXXKMtQwIkbB+zlF0OXD5WFzoS2wXQ4rN2UW89f17WFwJKrDTZyS8d1TmUvbg3i7feuA0ACwUN5xKLhypOsvS9eenDuQN8TuO6cUO8ddGu6BBM7696DEsHC+MSfhWC9q6DB7KaAsEXuEVLg5ilZtc9sQrBc+25Z6KmeMVehNSeetoYFapM9OJOI2GrOet8ncuGk19C1n0If4+Z0z205Rt9D4fYUE+k4uWGijw9WjjPOuy+8ZwELO1JO0xwme2qKINrm+cRhgM1FFjw9FAh3EPBUQiXUTEeZCNa7yYyxOwq32HHQuh8O7Ef1qNV3QKBuZcxwLM6eQDpbMp2qyKgd6W8AqBAzhgj9FDFEHHCphhSGcqIM/F+x6aZGlHnvFyH9WsgSOBadhxe8a3rnMUEL9aoI7L4xYIKA8gpZSxAgGIpzo8guYTEUsSRDylODAkR9dyWMjr/UxwHj4A3p51ocDhGdAiTqhDWXxLWGRUQdyS0rxGcuO9t+Ydc8vce32CGQmbAhmLlYwFlPuZ99muPFaClm6qX2H54mIBJvbN9+M0EW2WfzfT4BN6G1GUV3Cyf7IO5zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(26005)(316002)(110136005)(6486002)(186003)(54906003)(122000001)(8936002)(36756003)(64756008)(76116006)(7416002)(66556008)(66476007)(91956017)(38100700002)(2906002)(66946007)(66446008)(38070700005)(83380400001)(5660300002)(508600001)(6506007)(4326008)(6512007)(86362001)(2616005)(8676002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sG3rK+HFlesylhsqjaYVrVBujlPgBXZSrkp8JsfKNhEMprIMLMdxQho1Je?=
 =?iso-8859-1?Q?ofzHS4PmcnkMDLIKEFUgF8TNO1eYHeFwxXqE9rlWvKn4FCBKQZdbP2hP6I?=
 =?iso-8859-1?Q?sTCMDGCGIYVWn0B4kd02oGkd7fy4miho61ZZdMqQAG1HOkN6iecHPT9f8U?=
 =?iso-8859-1?Q?f8igSBL6Nba1usoZSIcUap8GWqsJnpnYAYYCFrnileK52oNrqqXKEvBMhm?=
 =?iso-8859-1?Q?EDFjEbHyOd9hwICWZUfnQCz2cL4HLkxDfsIiWYhKzeYpO9cjd5RSyogz5Q?=
 =?iso-8859-1?Q?9BKbmAVchV1c8nKRuNh1xipn19F0Scdl4O9NDGLB52LUwIWFMrh5mIC9bE?=
 =?iso-8859-1?Q?zS3JX/9UqZQyx0NrmsMwuxAgn57H5pEpnl0JMsJNZ7Jz/ow72zstoH+xkw?=
 =?iso-8859-1?Q?cIvq3Cj7Le86kNzvxwkRN5jI5zEdEKdfg1Kaz9oYhsZ8tfOvAqZMl96Pw0?=
 =?iso-8859-1?Q?YKbf6HhzOA/YgOwdA0KkNZ/BN05Tb9eCtir5s1sXuP8VJDpvL0yK5xr5TZ?=
 =?iso-8859-1?Q?BKpxMmv0jsAKMphDLQJX+ek5COa4UtmWQMGuHxbMN3XOV9bALbUV/H5i2r?=
 =?iso-8859-1?Q?QclyMQgnC7osJNz1//+cpSWhOGKFLqNs/OlymyqDgQFhWPSnrSiLvnwjcj?=
 =?iso-8859-1?Q?Omns4rQ696xpqx485AL64fLsGwOBeEmDeowLIwCohmaKnS55n+ag6AYrHv?=
 =?iso-8859-1?Q?Qpd64BU+Y+6NXle3Y9/wEBbhg/BVSZuZEWnCC5BI2425MUu+KayyvBCqPQ?=
 =?iso-8859-1?Q?t6GCYZcxp+gz9YHATgrlqIPavkmIixvs5vu7HFaNFoNnqUxzFIXq75PxXS?=
 =?iso-8859-1?Q?r2VXf/RzpJlGIhfXX5nWNzDtt7wCB3ZBRwXjuBYBnzP0KnJfQH3Mboa2aZ?=
 =?iso-8859-1?Q?8NVK+zK6YHfZ35h7nhUMdh/zzjxNeLniSs/LkoamLXR2D8I3Ad9EyPLciK?=
 =?iso-8859-1?Q?2Dl5bfhVuoOFx7uyzzhPzG9hg4naflI0Cbq8KdCPAvoMDHPU3scF1WSuZd?=
 =?iso-8859-1?Q?vxbfFnAf2Ypj5X/TC83xTgrOKFUBF/yYhuODebbxqjsTio0DFOvUJEz0UM?=
 =?iso-8859-1?Q?oOLuxKuduD0JxZsFn02PfTVoJ0pjK2rtgRCH5TdzKIY107Kj/qQ2ks9JsW?=
 =?iso-8859-1?Q?6GcpbFW6uTTAODVtQWe8caw575ArJZfsu/LaCpU6f/pt/d1SehEUuZqobj?=
 =?iso-8859-1?Q?hFbXbEnPmiLAgCv00jpyLAlvTHAqtATxZXXmOf9cgh8oZglyk/Gy9W/Ze0?=
 =?iso-8859-1?Q?5ujJQ6mnvBx+fcQyAODqNaGxfIYnp0Qt7cYYc74r5uWE7wKVLWDvcg9Scj?=
 =?iso-8859-1?Q?A/v59W8Y0cWP6XWxETc8Edkcj02dvUEWET1XyPKw/p4c1wHJbb6Nfbp2eF?=
 =?iso-8859-1?Q?0XB7DJmXbCw9Fho/g3RfFe6jnv9lDM7UPXuR/SIGUWmLZ3EiLlt8sKqvXZ?=
 =?iso-8859-1?Q?4AvE+TeS7V4/TMY+jiuf6VkS/+wMSChtG+pTzdJn1bNGX09ukEgqSFXgAf?=
 =?iso-8859-1?Q?St9AmhbJUDzMa+HRKYNAh/+ltuKqKq+zgD8ofBMW+NCmdCM+8T3dnyxYHU?=
 =?iso-8859-1?Q?5e46BaAFOn323JjU1vl4AKBFbpTr7lghbjrq+OlyhS1OEMTsCsURfB3r9I?=
 =?iso-8859-1?Q?l6D5sRY1HGdMr8oejXv4OBbwbpvGcrdnXhyELlQ2HYm93uuueGpWiEY4NG?=
 =?iso-8859-1?Q?JUb7BeT317zj8TpcwDCvEbYTW8qaDgl9vYoGDFMdiRicm2w8YN15QxGo8S?=
 =?iso-8859-1?Q?Og5zRtc2j/qySduheX+D/AV1w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6484999f-1959-4747-8320-08d9c3d71b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:09.7416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZHRbB1aDTXT1HxJdy/bGrJCSDMuaIcXXMixkTFZh2jx5D95+dnW4BhRrNxQqMot8ZDOYglbc0jXjxmyKRcbyxa7XncZHBAsA+KpN6oDxBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2161
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Livepatching a loaded module involves applying relocations through
apply_relocate_add(), which attempts to write to read-only memory when
CONFIG_STRICT_MODULE_RWX=3Dy.

R_PPC_ADDR16_LO, R_PPC_ADDR16_HI, R_PPC_ADDR16_HA and R_PPC_REL24 are
the types generated by the kpatch-build userspace tool or klp-convert
kernel tree observed applying a relocation to a post-init module.

Use patch_instruction() to patch those relocations.

Commit 8734b41b3efe ("powerpc/module_64: Fix livepatching for
RO modules") did similar change in module_64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/module_32.c | 44 ++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_3=
2.c
index a491ad481d85..a0432ef46967 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -18,6 +18,7 @@
 #include <linux/bug.h>
 #include <linux/sort.h>
 #include <asm/setup.h>
+#include <asm/code-patching.h>
=20
 /* Count how many different relocations (different symbol, different
    addend) */
@@ -174,15 +175,25 @@ static uint32_t do_plt_call(void *location,
 		entry++;
 	}
=20
-	entry->jump[0] =3D PPC_RAW_LIS(_R12, PPC_HA(val));
-	entry->jump[1] =3D PPC_RAW_ADDI(_R12, _R12, PPC_LO(val));
-	entry->jump[2] =3D PPC_RAW_MTCTR(_R12);
-	entry->jump[3] =3D PPC_RAW_BCTR();
+	if (patch_instruction(&entry->jump[0], ppc_inst(PPC_RAW_LIS(_R12, PPC_HA(=
val)))))
+		return 0;
+	if (patch_instruction(&entry->jump[1], ppc_inst(PPC_RAW_ADDI(_R12, _R12, =
PPC_LO(val)))))
+		return 0;
+	if (patch_instruction(&entry->jump[2], ppc_inst(PPC_RAW_MTCTR(_R12))))
+		return 0;
+	if (patch_instruction(&entry->jump[3], ppc_inst(PPC_RAW_BCTR())))
+		return 0;
=20
 	pr_debug("Initialized plt for 0x%x at %p\n", val, entry);
 	return (uint32_t)entry;
 }
=20
+static int patch_location_16(uint32_t *loc, u16 value)
+{
+	loc =3D PTR_ALIGN_DOWN(loc, sizeof(u32));
+	return patch_instruction(loc, ppc_inst((*loc & 0xffff0000) | value));
+}
+
 int apply_relocate_add(Elf32_Shdr *sechdrs,
 		       const char *strtab,
 		       unsigned int symindex,
@@ -216,37 +227,42 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
=20
 		case R_PPC_ADDR16_LO:
 			/* Low half of the symbol */
-			*(uint16_t *)location =3D value;
+			if (patch_location_16(location, PPC_LO(value)))
+				return -EFAULT;
 			break;
=20
 		case R_PPC_ADDR16_HI:
 			/* Higher half of the symbol */
-			*(uint16_t *)location =3D (value >> 16);
+			if (patch_location_16(location, PPC_HI(value)))
+				return -EFAULT;
 			break;
=20
 		case R_PPC_ADDR16_HA:
-			/* Sign-adjusted lower 16 bits: PPC ELF ABI says:
-			   (((x >> 16) + ((x & 0x8000) ? 1 : 0))) & 0xFFFF.
-			   This is the same, only sane.
-			 */
-			*(uint16_t *)location =3D (value + 0x8000) >> 16;
+			if (patch_location_16(location, PPC_HA(value)))
+				return -EFAULT;
 			break;
=20
 		case R_PPC_REL24:
 			if ((int)(value - (uint32_t)location) < -0x02000000
-			    || (int)(value - (uint32_t)location) >=3D 0x02000000)
+			    || (int)(value - (uint32_t)location) >=3D 0x02000000) {
 				value =3D do_plt_call(location, value,
 						    sechdrs, module);
+				if (!value)
+					return -EFAULT;
+			}
=20
 			/* Only replace bits 2 through 26 */
 			pr_debug("REL24 value =3D %08X. location =3D %08X\n",
 			       value, (uint32_t)location);
 			pr_debug("Location before: %08X.\n",
 			       *(uint32_t *)location);
-			*(uint32_t *)location
-				=3D (*(uint32_t *)location & ~0x03fffffc)
+			value =3D (*(uint32_t *)location & ~0x03fffffc)
 				| ((value - (uint32_t)location)
 				   & 0x03fffffc);
+
+			if (patch_instruction(location, ppc_inst(value)))
+				return -EFAULT;
+
 			pr_debug("Location after: %08X.\n",
 			       *(uint32_t *)location);
 			pr_debug("ie. jump to %08X+%08X =3D %08X\n",
--=20
2.33.1

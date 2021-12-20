Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302B47B14D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:39:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlfW61Cqz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHldX0hVQz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgqhQOoVNS+Hh+6JbQJuB268OeXxnx8/1nNWRpqOADxNA/070SF1r+4MYVAuzgV4C3+KMBSclH/IivfibXqaFUZFxBaiMPhjtWBB7EPgxvRfFoqHFmNq9IF/crM1lGPEZUjzNL1fvKin4jAfSIf5dl90HFk4vATns4OVGztckORiJQiwsUl3w2AEe1iw0XP+25HU7n3aaLa+6/pYodaK6IoOuoeNs3FxRH57vnFw109lCzhIWVYe0qD+gPOr1Ehd7tbJhW3imSGyEDJ0SeDok8y/Xk4dCoz6attOBgZB5iSTpQO6d/7bfnIXXoMld1t4y2tpnEIbGh1rR3QmdHqm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkUh5cAB9ieefmpRNEwRIXQXXThbpQl2IIoa6w/GYfk=;
 b=J0kjrA9ATrph3JYAG8ZDtIw/qsdjHgJcCjD7K754Z0N2WgFiAHzJ7c/I/Qw69k6SUqalNDuNeh9+5aKRbe88uMXjQrUMz++7uNywCbB1ulDrpQs92M8g7VIbFptMxsVR/NC1XK5yyN6WhfjHRZbUb3BxCjBkWy4xr4bW1cRLSR+k8PLAmOLJ9B2GZ+knaPXzq9H+8VaiaPY0Ak5+k+3l2fz1VOG61UESrmhvZ1PrBm8+ywRzpl8PVlTw39/4PfACnrPWlymNWmJXqOUqxQ9gMbkBg5UWI7L9pzQ6ByJnZoOhV96CtMsLYrULUe6+YLxUHqXZRCGrNFqkn+aSbLWnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 01/13] livepatch: Fix build failure on 32 bits processors
Thread-Topic: [PATCH v2 01/13] livepatch: Fix build failure on 32 bits
 processors
Thread-Index: AQHX9b/0+Iw0OmIoxEmsW571E1syqw==
Date: Mon, 20 Dec 2021 16:38:02 +0000
Message-ID: <5288e11b018a762ea3351cc8fb2d4f15093a4457.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88d957ed-fe96-421e-6758-08d9c3d7171b
x-ms-traffictypediagnostic: MR1P264MB1905:EE_
x-microsoft-antispam-prvs: <MR1P264MB1905CC5AA6119A2BF552D7F1ED7B9@MR1P264MB1905.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aOml25xck6WZuwquN6Ue6knh+0bGF8cp+XxKtFHtUqAgyILfxUpBXSWktx+Ae8OQip5mgRuexEoe5cEDBspaBoeOfyZi/l5nyabqnOPYQrU5xtYiheSn2xhsP2ibnpt/92hLFwSYOCWwJKrx+Co0NXZCb7s9UpQAm/KLradxH7OkvvrB/sq02mK5GVtytWI/beO+zFCVX7d0oGhBURbsSvv6CYkKag9l9jM+hAeWJu4MVl4NAEd+VqU3DncYgSv0lmcO+7ItXDp4fQH8pNsZz0IcJ+mKOHc1TLBYXoIJb9namB6ibgrfpBUHfVBrqp3A9tXdsgd6N/M+Wgg50xVdCegMwa/jqADRsMTH9RZzHYffeXIZzvrdWEtTmna/LXJch7aERYJpU7w3a+QWMV8vtyBZ+3ioo0AmYNxPx23HXsDa/xHDwlWecg17qXPd6rDO+VgRx5gC0QaCnE+Vrme7rfrSMFBLgKcfQHIN7k9xN2gxXyNewOwI1BFTC7O3YXlh1MKCXdh/OvZq8m0YKDqa6CKnp6kVbb6tBp94+YXAL7nH6BSEcAD6OMICaW6rGOQDdTn5iOUq0qWkhdGEQXXzTD5Hma9uL29w0XTIjEhQn8IOpCT3BGjxFGmhp473HzQ3HhcbvnpgKHlWKyPxRO+PKHBQfFZcjIBl+3uytopLpbYcTzmKPQvhmHXzX0r9PqEslB1Tgr7kB+23cywzP5vagw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(86362001)(36756003)(316002)(110136005)(6512007)(54906003)(71200400001)(6506007)(38070700005)(83380400001)(8936002)(2906002)(122000001)(6486002)(38100700002)(8676002)(44832011)(66446008)(5660300002)(66946007)(66556008)(26005)(76116006)(4326008)(91956017)(7416002)(2616005)(64756008)(186003)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uW9xKlSpuRI/Cr6O0WdpKhwRdDjUkportSE6zqyOQMA/Ij+laigZm3UpDJ?=
 =?iso-8859-1?Q?wmzOqYLcGG9joBAJCVxZQ8rJ5KO47/9qx4Yr6d/ZyYEbSpmkfgt3m+rqE4?=
 =?iso-8859-1?Q?/KdcfPKGUMXKhM41y1fwfjUYWHgwQLO5HYViw+hPreJErZFGz73R3tMDUq?=
 =?iso-8859-1?Q?Qr9ASUGpwljqSy59EFvQCA0MzQTpzBO6xAWHEe+Ubnq96rgzfsNWB1PmpH?=
 =?iso-8859-1?Q?BcBaBR6T17AueLtn+xTF7tvXY/mC7fBhkYMox6og1O2ts1RNFobrAL7sSP?=
 =?iso-8859-1?Q?hRi6hIeCp8tXviAdRHdiw6Ib1Yb5eB+tz+U5Kc/x1GOG89WaQpUVKk9gg8?=
 =?iso-8859-1?Q?veMm0Q9YfX6/4Acu7NaIzMx4I2Pp1UrYG8aVjEQNgPvu4Bugdg2hWoPY1Y?=
 =?iso-8859-1?Q?9s5VderCAUusRgpaWJAhPNe1wARHWzXduTbhj2v4V+NSSQNYOPjQQ+lRr6?=
 =?iso-8859-1?Q?ohwKFEKSM7n6yggI5pXgropwLJuCpa2Nh31SF0+wpqjANNyKbwS0QZb96Z?=
 =?iso-8859-1?Q?rksZbybCaWckPH01rZE4MDucYOGW25O9xQvKwJxZ+7LE1IRCdTLBklYdsw?=
 =?iso-8859-1?Q?Srysl2iOAqOKYH+57/JdAccpjXuuLUd/dd+dj+P9dXzcpzNmuoFS9OnCjl?=
 =?iso-8859-1?Q?UNjXtpNiP48BhwOTUxgtIE8ragtiUxm0ZzrZN/MFJML3AvqcfShueVlwkQ?=
 =?iso-8859-1?Q?SUCVbFraH+oIaIZ2dD5BG+8jclUZQaZlyDg6VEVp59OAGkkEca/ZXOrFkj?=
 =?iso-8859-1?Q?Lu9GXQPFD0oi1Kc+bJK8vvgoG1VAiB9hqAGytgXu3vxNRwhJimsZgi+dMn?=
 =?iso-8859-1?Q?5Jlg8QOEZ5fb0sx4j2gRBwZR1e9F9VvgW9WJtWGPjp9TSeOHoDSPLvq3mI?=
 =?iso-8859-1?Q?DemDZk7IysnO0zTk08kU+EzwenL1bToaiUCS4deTrqCKseiK9KSW2W4iMX?=
 =?iso-8859-1?Q?aBeAgxKpM9rZbZShSHcNghWh9spV/vvv9yKtbovzXj2huBYM8VBSLUkST6?=
 =?iso-8859-1?Q?9y2x1loVaIR0JiY7xdZIDY2LD99TimpvcUPdFm+qDpAQr2/ILdjHYPAK67?=
 =?iso-8859-1?Q?+KUZpJzVqr/unlr1AJRPa+2zT09Rgk/nbskgQNDtRDfVSGlwJ3qdJorK4N?=
 =?iso-8859-1?Q?WFyChSq1G0K0xyvLvuWdJkH0B+hj8viJ1kbwz4SkTJcsfg2zI4RLBV9+mt?=
 =?iso-8859-1?Q?OBEFz2qO7zTEDkUytfkmune2Cf2SWvFgerIsYmF7Sy2JUtjW0h9U7620Lx?=
 =?iso-8859-1?Q?5OkDUaFnfo2W0QlmxmK7NwKGUbqrkqSeNHfLjQtgUUowsLzlVp+CPo8M3d?=
 =?iso-8859-1?Q?1VL01phLRnR+RqvSch+N7ZUFBIrrEnPpzjH0SItZmMadbZww1QWwp9tjBF?=
 =?iso-8859-1?Q?Ps39gLZlbUnoqADSkffrYnuKDmgLrJT4DomFvtt/F7NpGpbN8SiLLZCwa0?=
 =?iso-8859-1?Q?gDbRNxublz9o7c+LxctMQ9t6MvsjVR7MgtAEuEnynPp3+EJKHSAT99lUmN?=
 =?iso-8859-1?Q?g0Bnk+SSSG6TZlE8YhoH2G+OjXSiK+xpOoxh1m7QQQ5+8izIxFy8ef3ziR?=
 =?iso-8859-1?Q?VkyPBynwmb5MwxIwdaSC9CcW/u0+F70sYCllYN7gFAov2ZJ37g2w6mSbpb?=
 =?iso-8859-1?Q?i+WeCCdbtlOTKua/9oe4vDrKWZH8Cf3D2pbnuLE3Th3xQEuZ4sCb3dfCY0?=
 =?iso-8859-1?Q?k/cLwaO1CVkBykbzLzldsolODIIV2UdZqAiPlpWEhSJs6dA/Sn733RlvCV?=
 =?iso-8859-1?Q?vyB9DvcQfCxjqdo6oAWKb89rY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d957ed-fe96-421e-6758-08d9c3d7171b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:02.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oavxn+I6YELkIYs5lDiiztH/nr4S5sbPte12T52ygDMf1ey5lzJ2Xvtjpy749hLi/YTCjRM4U5deE//YKjQijw1zqxb6A6obvR/J7Wa9cII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1905
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

Trying to build livepatch on powerpc/32 results in:

	kernel/livepatch/core.c: In function 'klp_resolve_symbols':
	kernel/livepatch/core.c:221:23: warning: cast to pointer from integer of d=
ifferent size [-Wint-to-pointer-cast]
	  221 |                 sym =3D (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF=
_R_SYM(relas[i].r_info);
	      |                       ^
	kernel/livepatch/core.c:221:21: error: assignment to 'Elf32_Sym *' {aka 's=
truct elf32_sym *'} from incompatible pointer type 'Elf64_Sym *' {aka 'stru=
ct elf64_sym *'} [-Werror=3Dincompatible-pointer-types]
	  221 |                 sym =3D (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF=
_R_SYM(relas[i].r_info);
	      |                     ^
	kernel/livepatch/core.c: In function 'klp_apply_section_relocs':
	kernel/livepatch/core.c:312:35: error: passing argument 1 of 'klp_resolve_=
symbols' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
	  312 |         ret =3D klp_resolve_symbols(sechdrs, strtab, symndx, sec, =
sec_objname);
	      |                                   ^~~~~~~
	      |                                   |
	      |                                   Elf32_Shdr * {aka struct elf32_s=
hdr *}
	kernel/livepatch/core.c:193:44: note: expected 'Elf64_Shdr *' {aka 'struct=
 elf64_shdr *'} but argument is of type 'Elf32_Shdr *' {aka 'struct elf32_s=
hdr *'}
	  193 | static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *st=
rtab,
	      |                                ~~~~~~~~~~~~^~~~~~~

Fix it by using the right types instead of forcing 64 bits types.

Fixes: 7c8e2bdd5f0d ("livepatch: Apply vmlinux-specific KLP relocations ear=
ly")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 335d988bd811..c0789383807b 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -190,7 +190,7 @@ static int klp_find_object_symbol(const char *objname, =
const char *name,
 	return -EINVAL;
 }
=20
-static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
+static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
 			       unsigned int symndx, Elf_Shdr *relasec,
 			       const char *sec_objname)
 {
@@ -218,7 +218,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, con=
st char *strtab,
 	relas =3D (Elf_Rela *) relasec->sh_addr;
 	/* For each rela in this klp relocation section */
 	for (i =3D 0; i < relasec->sh_size / sizeof(Elf_Rela); i++) {
-		sym =3D (Elf64_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info=
);
+		sym =3D (Elf_Sym *)sechdrs[symndx].sh_addr + ELF_R_SYM(relas[i].r_info);
 		if (sym->st_shndx !=3D SHN_LIVEPATCH) {
 			pr_err("symbol %s is not marked as a livepatch symbol\n",
 			       strtab + sym->st_name);
--=20
2.33.1

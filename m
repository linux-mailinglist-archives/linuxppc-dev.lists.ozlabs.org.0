Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E12489C38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 16:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXd7w6W2jz30Pf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 02:30:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXd795rwSz3bVc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 02:30:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMBv+myTPHcpzvKjRcCV0e0UfhlEIR0x+nnUIOtiyERJxOCB89JlJ/HhGeXAcymH6MebN6F0pyJr8wz66NqW7YyQyeDmPc715gRAIZtoL868hZEc4QZJnBvQtQQDcZQS56WZmsqjQOQwjnxBtLgmdzPxRPeYsTd8OORxb3y5OhZ5QBlmlUJPwE9wstbfxh4b5/mCXa98YyzhTBYwvcvsGVUYukj2FE0+SYgyXUUuK18bWUm16Bh7sU4r4r7OhzVnPA2EvEX51Or/AwSjSBJ2NtXlZ3I6Xs60M5DWhHoC+3UEZWyzzwj0lUlaiLrWyyKHS6iEiDs5yL7vxtLg7m79wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KtRDcD2aTPA8sxPinwezBK+TFKBW1vn4mrMNFICjhw=;
 b=BGPd44bBLVIWMowzENraNR4qgee4cxS7JYayCDpeFwViGmEEKjzgChryi6rf0U9Sitt2DeOMThwyHebrRPEmNoRXMwoVdD24jEztILML8qaGi7GcIA8Po7Bmczo5DR9FiTl+k1ayif6oP6jyks9gpdP5QdKmy7njWHgUmOmFhppq2nLiySPC+2jWWpQleun5YlmPkHHQ8Ey63iOPMG2ZNCPJfjJTFS4uJq6PYPg7S3z/9OnxCWH+KzjVQ447NEqBEbJv5Li7SJSEcnZ1bB/0Agq6nokYHAM0KL5ZNdEN2cVQzcryt0GImJyx/BKs+WU3Due5vmKPNN5f7QobK+kUBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1895.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Mon, 10 Jan 2022 15:29:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 15:29:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/time: Fix build failure due to do_hard_irq_enable()
 on PPC32
Thread-Topic: [PATCH] powerpc/time: Fix build failure due to
 do_hard_irq_enable() on PPC32
Thread-Index: AQHYBjbq+BEYUml/MkaeHEgz4YXd9w==
Date: Mon, 10 Jan 2022 15:29:53 +0000
Message-ID: <247e01e0e10f4dbc59b5ff89e81702eb1ee7641e.1641828571.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a807773-c28e-4ebb-92a4-08d9d44e0c8b
x-ms-traffictypediagnostic: MRZP264MB1895:EE_
x-microsoft-antispam-prvs: <MRZP264MB189578CFB3AEE1FE3342D27BED509@MRZP264MB1895.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DmBRszYatdDvlZY+7Zs9VzxguYIGAd/sNdhp2lM9gC9Dvqw30WIqH5D47qyYvApg0qDcC6O6YVdxkkepTHO5IJLNKrnJUpnBnTvxDYkBE1bvmcHpgIKp0v3jylJ9FMhfqkbT/1Mhdx3ZP7KT472/e4FNPifw4w9iW3B0wwfasDM6ZrGvOY/OgdI7rUIU8ZAZv9bADAuyPHuwYuSpHCIUgurKQ0MuYmfbWD6v/yr2KdoTCkRCOsl8n8UC6Vy4TQM88lfkhzTcn3BHuwfqxoxfp/tNpLVcIvNqv2aEhpuOAk7bMJi20dRCu0rsBa/0JSvGqYD8oZRYj6l/XNn8ZBIFXnefB+/ZpwLI0fpiIjSpxP066j89/sz1Lko/y8gE52xgDGekPVIOXCRAIiDfW+sci6HdWsw3QBx+LBLrIHV5oqWjayr8lqirqSod7YYwTM8YSFd34wKNZfi0QBfcNEqqPiX4xv3XWfpKVju2xECmzit+JJiA6VhLD9Q9GnbVAWvhnswarjc1myIjLtsObasVl2EWVb4a44C5uyYuBIG/C7aImf2NLf6P3dDFEj4M++oa5SvPRBDctocE6PcQprCu2UupirQEvaGRB1h10KAvu7/zvmbWwCY+CFG3bFjSIaBsYHRLSymS/Zt30XnCsUGoxUozh65xVrvLRQIQPMHUTY04N3YUcgJbuAo6xR9MCb+ZYJjYmDUaCUKo3zoNbB7g9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(316002)(5660300002)(8936002)(186003)(122000001)(38100700002)(6486002)(86362001)(26005)(110136005)(2906002)(508600001)(83380400001)(36756003)(6506007)(8676002)(71200400001)(66556008)(66446008)(64756008)(66946007)(4326008)(66476007)(91956017)(76116006)(6512007)(44832011)(2616005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QA9m4T4lmxlBXkkEkyBwKiRBUZKe7ZFiYc5dsx+sSqJH5D7m3HGw4yfzX4?=
 =?iso-8859-1?Q?pU+EJ0IZ0uXozcgjHy/zFJ2yAJb8/yE0ys4mnidhANwBpbhiws2hh8lbsV?=
 =?iso-8859-1?Q?DYbOC0zcY/O8zkmsEoOpmBrawjrMF5pARdP/ZlW77A6rX3xuNKp82+rS8m?=
 =?iso-8859-1?Q?M4kGDmyIPuScIkc7wojwLJitTVM4Cp3tlc1SDBaLMl98WBgvNm/DbuN+hn?=
 =?iso-8859-1?Q?qcTsg5TelwzwyVc80xAWoRs0YzrMtGrqMTVPL5+TWq56w3pJp4KvJ5KPk2?=
 =?iso-8859-1?Q?5nnqfOndtHfmvv14iCXQ3WPWHZtezeTDU96FHFD9Y4Y2yQdQPVsz5SmQuD?=
 =?iso-8859-1?Q?BVVZVAt2neDYdhzuRvFiSzpCXwo5yPhJF60bZSrrefFqtTGewqpTrWXUfL?=
 =?iso-8859-1?Q?wam/bvj5u9otmdzeYMqFrMOWwl41Iccp09mezXYTLLEatb1vkF+Gvv/LqS?=
 =?iso-8859-1?Q?QpGnX1CO9yeRtGx3bhQDfYvi+Y1oQ1z/DHLL1fED4afpww2aQs9gyF5z7j?=
 =?iso-8859-1?Q?Kp6z1nbz0nQKK72T/T/BHEe4b14KGZ1MaWggx6npDjoh3fMYTOVutYlQPT?=
 =?iso-8859-1?Q?lu3DoWoec5AYiXmyKnGlvTE9CMSvI3rsUw8i7HvhVCJ89WjzBlLj2kbrLZ?=
 =?iso-8859-1?Q?F9gABigqzWOlmEY9sAP/fAunSO9KCIdE+OqLebVLUmSksQLgd7mNadDFz8?=
 =?iso-8859-1?Q?GOhlaoa5pp0EuBgWEPXHM1rJ38vQRMx98SsR4nwFUlvKL8EFyEXCAaMlWG?=
 =?iso-8859-1?Q?EKRvj8ILQj86rFwBj2Ya9bjaIoEhoI2jmMLrPj/J1x6U4rAFIoJ7MOzqoC?=
 =?iso-8859-1?Q?QiYJw5idV0XFdpSyntJnHsZ78HIhRKxBkMOeNI7D8BoEUbQMJ9oA9oTuNb?=
 =?iso-8859-1?Q?9z/T/E5sZJZHBMMT1qdXkZcQvBwr7pE2SUs7oy8GrZLB8Dz96ZVRuiFtDK?=
 =?iso-8859-1?Q?0HDtFU6AeaF1n0VVF31FfVs3qdIf7lfC8EZRXtXdEPHR8SHclGEt7aPr6a?=
 =?iso-8859-1?Q?RJoIMfVea7GDd2cGfV8wPc1O/fSrceTARYSrY/0JLcD8QuN6N//V0aQzeh?=
 =?iso-8859-1?Q?osLh3XVDMJygDsH6AqpqQluGeiwgm1F/zPb0ZTBfn2b3QjSGhnnA9YZyjA?=
 =?iso-8859-1?Q?DBPhHuLuPOWYwRrqxVSMkZp1zWfn56U+/96Q4md7IUUUvpa04zvfcUh6r7?=
 =?iso-8859-1?Q?txTb77lfxdVioONuu+pK9CtLuC7t2X4qb9JdNIALrOxe8tXJXH/yhhC/sl?=
 =?iso-8859-1?Q?QYmxDadXOXKkQulaoZGdzvkbbYMPWmKPXHVj1sRIkdH9tWQxDWuo0eDeK+?=
 =?iso-8859-1?Q?UDvkSnxmKcoEbwDyvIinqpND49UWGOdxn4oGn84bf8V/m4bxHCifL7tuRh?=
 =?iso-8859-1?Q?MNrZtF+zgNDSUgfuMAuLhjJ9LclXxgpytZozgcOceh1YqRxiYzvuJ/pooH?=
 =?iso-8859-1?Q?+kHLzrVp2pXnPIyJkepS42bRpZKdvxmJrqL64iRlt0bxrQ+5VtQIRlQ4gf?=
 =?iso-8859-1?Q?dHWRhCbBBjTCZKV1tfiyqDV31ZYO9oGxb2xgYK9i+2ySPYrrW5IK2WWA/0?=
 =?iso-8859-1?Q?8zQTlLLEwfw+5WuIT2F/A4ZgBNSwEg3NrMti6TnH5NAzqwOr2bDB6EFjTU?=
 =?iso-8859-1?Q?IQsUCNUq+KHg67AF21vQaDz0pyyInsK8asJk3y2c2RWG2n/qixU/UvYWPv?=
 =?iso-8859-1?Q?3UuaQrCiBZzxnqtNIz08BntKotUBc1Z3BIkd47uSGoJ1D/Dtf8TDKehmq6?=
 =?iso-8859-1?Q?qWIT1U+ZpWumdq65ruUB2Xm4M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a807773-c28e-4ebb-92a4-08d9d44e0c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 15:29:53.2022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhwB3U76TCSm3XLOsdXIq//gVMIuLHwGKhThqJlOckA/8rBSQfUqh10kBo6yB50R9xdV22jQiX2UZ+Gttfln6xtbdyA7rK+tot1/5RHt0nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1895
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

	  CC      arch/powerpc/kernel/time.o
	In file included from <command-line>:
	./arch/powerpc/include/asm/hw_irq.h: In function 'do_hard_irq_enable':
	././include/linux/compiler_types.h:335:45: error: call to '__compiletime_a=
ssert_35' declared with attribute error: BUILD_BUG failed
	  335 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |                                             ^
	././include/linux/compiler_types.h:316:25: note: in definition of macro '_=
_compiletime_assert'
	  316 |                         prefix ## suffix();                       =
      \
	      |                         ^~~~~~
	././include/linux/compiler_types.h:335:9: note: in expansion of macro '_co=
mpiletime_assert'
	  335 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |         ^~~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
	   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), ms=
g)
	      |                                     ^~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_=
ON_MSG'
	   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
	      |                     ^~~~~~~~~~~~~~~~
	./arch/powerpc/include/asm/hw_irq.h:483:9: note: in expansion of macro 'BU=
ILD_BUG'
	  483 |         BUILD_BUG();
	      |         ^~~~~~~~~

should_hard_irq_enable() returns false on PPC32 so this BUILD_BUG() shouldn=
't trigger.

Force inlining of should_hard_irq_enable()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq ha=
ndlers unless perf is in use")
Cc: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/h=
w_irq.h
index a58fb4aa6c81..674e5aaafcbd 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -473,7 +473,7 @@ static inline bool arch_irq_disabled_regs(struct pt_reg=
s *regs)
 	return !(regs->msr & MSR_EE);
 }
=20
-static inline bool should_hard_irq_enable(void)
+static __always_inline bool should_hard_irq_enable(void)
 {
 	return false;
 }
--=20
2.33.1

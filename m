Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F464A3E1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 08:16:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnK9B1jvVz3bbS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 18:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnK8j3r9zz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 18:15:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUO1tXczrSNeJECLJHmtcWDF8wQ/nFHSMAozGvwpsGj7zdbGO5gJDrzmtsAL1EPw9wmXnXM203w2q2I96Z+aOGwzFr7Ll3mRoukB0jpBEOGzrlp5Fam5v5owPrAvXJsRj3sNo5ZCuAQVeYT67/1ms/7+/aIKOCEZIUcvP7b7Qv1DIwEWujQYeja3/HcDWCFb7uLKv4tK5Mq1CXHNgCk/qsgJ6amG5kBnSgVKxZ8GTzSKq9109J3lhHBebC0B8fh6WHfydZIIDSaIAXBZhAJSpOLvvPmPcBzhACTOlofrnL7Kdt7N31MJejti0n1lWO1xOnGVEigOL3R53juhGQoA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncunWZo1zlaP7DI8kZp9PROBhpSZplPQs/0cNakHQ5Y=;
 b=IxUiwsDyxI+3EQXqtkrw3UvWPfUL9wAmZsAZcyeoasbt9nOFxWh95zBdR4OWbJeIlARGsy4PwbwmjPIzmUSYJkm9s+ikrjBKvkp+mbYs1H0QK1+ddTRtXeBzPUSYDgRqj8mNZjV2DrO8GxE8kcXrd+NNFWtZGjZmnhJSuwI7MfGxB/80BuMTX8/HXp0aSyauVN/DjnPtLnPDmazURVXkz1r4+14M6f5TPxlhltH2NX53H4O8RtCiDPfOJpkJnZJOy6GgZvGDnUIm40qJwSDNDkyuZnAiuMQWpNq+6ikc8wEXH2sIHu6DKU+K9oq19+OVJeHGID5qBxwWjGTmqvi/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0405.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:17::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 07:15:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Mon, 31 Jan 2022
 07:15:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/603: Remove outdated comment
Thread-Topic: [PATCH] powerpc/603: Remove outdated comment
Thread-Index: AQHYFnJJstMpforeEU2l/M5eRfg0Ig==
Date: Mon, 31 Jan 2022 07:15:12 +0000
Message-ID: <38b1ffefd2146fa56bf8aa605d476ad9736bbb37.1643613296.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0444bd4-2b54-4c59-3689-08d9e4896c3e
x-ms-traffictypediagnostic: MRXP264MB0405:EE_
x-microsoft-antispam-prvs: <MRXP264MB0405FBCFF8D96A339B633BA3ED259@MRXP264MB0405.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YHBZHgl0J1vAArq8UiK6TZfRRlXGfkC9WVHXmiSB1EeomcStTHRS//VZUNOhRxOg4/KUWDc+rSYVzYt/x9V7YOph9/M31TJdf6kPpgWQR+VN/YAC3xP/KMzY4lRg3zk8BxeD3FQdUmsnmerQ2etLpPgf4goVM1O26btnLLnNcd0LnieUKPPl3mI+82sUKKowSuuXaXwFAQQReBDXaFeL4Q31DbtYRofUOlKKUn0RwyCzjVECn0QEGMrm1Ya/2hS8aLiey8hXGsDvSIRuP6bfmkDiWOm0Apb1hjfLYdou8Nb5qSISK3Ws6oAIxlqc/og6y2UZ9irBty02HYB1KT12MFd4G3Gv0PjSsa9nPbu2y8SsvDp9Yv9b8gslRbxmU0lT8urHrOVTJMS6BrLrdMpKKlCfcoS3UfEZcLD5PK7il/W85QgbsSVuE9msm37E3ZdBG5gpYY6K/+i4DM9W6hFxYOQqoVqfKGKEiiZHeUnPwATBre4hbZ3U9BaL373zttKZNQhyDnAtD8ZBiSlqQVlP2s1thbmWsbx5EZLzf78GUugq+M1lbPEFpetTjm5IEaLaAeTx0Cpa/WlCT8pYWA0+D60oZCzdlSIQsnJEyle1Sf0C+K19VJq6fBkzo2SiukTOkXOyeiBpHPyO6GMMJoMGj3ux3UhSfzGDJovO4EVODjKML3z5FRwPj/+dEuOmY0VoxfAc3fJQn2BhusOzBO+iOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(76116006)(83380400001)(8676002)(44832011)(64756008)(66446008)(66476007)(4326008)(71200400001)(66556008)(186003)(5660300002)(26005)(2616005)(2906002)(66946007)(8936002)(6506007)(6512007)(6486002)(110136005)(54906003)(122000001)(508600001)(38100700002)(86362001)(38070700005)(316002)(36756003)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pxJTGHiXJ9FCxqKJ409JoWcbc/E9FheKx/u0A4v3tlm+0V3d/xQb7odMpl?=
 =?iso-8859-1?Q?FlReRKC0j8nYMNHGepgSVz41mob4kkBeK6Ij8/53L8+7MYH6n1a66Z/z7A?=
 =?iso-8859-1?Q?xWVakEcBQray6KMQ706XdTYVbg31TJ1cDEHXqQ0uxG/zWX59Phx6qxiZRY?=
 =?iso-8859-1?Q?dMOio7mB+xhJYVFCcai8dXM/cNtgVr1UxccufgUIy73+iyglDSs5vmFFtb?=
 =?iso-8859-1?Q?MD6+WjiZljz37w9QZkRCDMo+gz6k6Uczuc/CE7F3izIt8b8lPzN8waIr+2?=
 =?iso-8859-1?Q?8LvjjzHhuudl/xOshT2AqvyJUxTzUSscoYYP9HdVbCFRWidEr47ZgexIZ3?=
 =?iso-8859-1?Q?KyMZXyf1OLHzxHY2/0GoB1EvLx+94H1EPEDTTV9Mf66ApLRlmBuphpaEFt?=
 =?iso-8859-1?Q?yaVu+7MYqAzTGiCK119f1svgrVw5aZ3MFSMaoN6TZIE0hxpUt7L85wKd+j?=
 =?iso-8859-1?Q?cweLmZw+tyG2GchufUm0eTyT26x74BjI1tDzXgbOQ5nSdRmIKEs9sqt1SU?=
 =?iso-8859-1?Q?0f6tDeFaEzROuYl//PP/4izqjPVzkbSXN1xdioM2YmMFinEYtpshBPyoH3?=
 =?iso-8859-1?Q?DD118hVmDuPm5puYyb51IdGyTAHq9SDfV1JuGANC+lqKmKfMy7uJH8Z/kj?=
 =?iso-8859-1?Q?37wRrVsrPpzarehyGQMpZzXSlAV0QFMrP+7qwsk/3e2nCXNrCkGmm+3kUL?=
 =?iso-8859-1?Q?0nnhry7I5Epav+7mimpSlqyqMEy6a51r+W50pBmkkjm24qsm2OEURmULYM?=
 =?iso-8859-1?Q?2KlpNA/dR7UjHsPMOgqtCrN/Wif9AacG2TzWiLsvdOpbFTndczV4B8z6iV?=
 =?iso-8859-1?Q?cbci27irvDnwuQG5jZS+Xkq40Vtsuu2OO7JopPcX9IdGGR02BzNrvJMqLf?=
 =?iso-8859-1?Q?buPITmUc4tWAUI03542j/Wd+9JjVaDOIg4MfOaVteBvhbX2dHLVhmzFxY0?=
 =?iso-8859-1?Q?3swQM/YlaACi6hA5LWXb9SAoqCk9yClo0JS/Ndh4CJB3j+cgblhZRmlJE8?=
 =?iso-8859-1?Q?38QE47r0d4A5hPAgHnBRTqGoMAmZbEW5ZhZufoRB7z+kJZ52miVBfb8uEk?=
 =?iso-8859-1?Q?U9Pan+w2tpd9Jx7IbL1Rgeqgefw0OQcTzX78HVqwDfznMM+KRk4WoWNL/o?=
 =?iso-8859-1?Q?xj2xduXr4tsQI9xjpVemhy9dUkTTRaO2MdGOBPGY+uF+gc+nC8hLT0gOPd?=
 =?iso-8859-1?Q?LbjKxsVbIhvkkvL8uZzwrmg58s2Y0b9XvnMJrkpAtaCq7HpeZ35svOmilo?=
 =?iso-8859-1?Q?8V5ZKD+ipvqOuc3Eidq54Ab3+xvYkmhaIuJC9YsG7v2bqpu/1EJ60RySPA?=
 =?iso-8859-1?Q?qRHO2WVCTbJh6B+dgLkzcwW5CUKOVFMaLzlhOS8cSIfTD8zGsN52TyChdB?=
 =?iso-8859-1?Q?Ah2Z0+RfnCAY8ZZ9BeB1D28AGt+/lmhNRpZ/5UubrimF0L/PuPzm6AS917?=
 =?iso-8859-1?Q?NTo8oKUg/Xl/kGMEVnzRrpCA7fZ1/qMy/VrBs9QN5BCbCyBaLCyOm7SoZz?=
 =?iso-8859-1?Q?G3pVliXBRxbbrcUT4RJt23k9fJkrnYj0ibw2ZoY3SZjbSMtRy2Kc+u4FPr?=
 =?iso-8859-1?Q?ZG3rNxtJmNdBGmNLgO0wpOgM1oQXeMP8DY93Q0qopNaU/7wh5/spVLm4Ra?=
 =?iso-8859-1?Q?+S4nlPKY8mUwIq1xrWoXWnU+Ni2QN61SUttwXayLQ6XVZFHt6/gTdN/sZn?=
 =?iso-8859-1?Q?oKxd1jbrRutPSbPYtjX6nBjYzj3TQ1zEN7QCZ5cx1GpwsanFpZueqie5lh?=
 =?iso-8859-1?Q?fEupLqwI9DjY2Sl5tbJg6g6vA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0444bd4-2b54-4c59-3689-08d9e4896c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:15:12.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4c/+JITCxdFgvrUtjJViTfYCh024MUVG26M31RUiooV7wNAP67LWUsrIkhlJSn+UCB4A0A4dozNWuT4k5S5LNdYxMxc8k1R2+aWmHSF988=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0405
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

Since commit 84de6ab0e904 ("powerpc/603: don't handle PAGE_ACCESSED
in TLB miss handlers.") page table is not updated anymore by
TLB miss handlers.

Remove the comment.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/hea=
d_book3s_32.S
index 937c79b8ad0f..6c739beb938c 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -501,10 +501,6 @@ DataLoadTLBMiss:
 	lwz	r0,0(r2)		/* get linux-style pte */
 	andc.	r1,r1,r0		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
-	/*
-	 * NOTE! We are assuming this is not an SMP system, otherwise
-	 * we would need to update the pte atomically with lwarx/stwcx.
-	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
 	rlwinm	r1,r0,32-9,30,30	/* _PAGE_RW -> PP msb */
 	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
@@ -585,10 +581,6 @@ DataStoreTLBMiss:
 	lwz	r0,0(r2)		/* get linux-style pte */
 	andc.	r1,r1,r0		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
-	/*
-	 * NOTE! We are assuming this is not an SMP system, otherwise
-	 * we would need to update the pte atomically with lwarx/stwcx.
-	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
 	rlwimi	r0,r0,32-2,31,31	/* _PAGE_USER -> PP lsb */
 	li	r1,0xe06		/* clear out reserved bits & PP msb */
--=20
2.33.1

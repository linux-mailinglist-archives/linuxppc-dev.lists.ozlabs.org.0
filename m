Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6804E495C2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCZS0tXyz3cXp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYX2xV4z2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hniHVEgINr/dW7UjgJNkJJ36yMXO8qMzy9HOJgUgDZixXwxn57ZVPb2SUs5kOjVYKbyXohKRZcjXxCNf6LGYraj8XUyKL9yLI3DpwQxLUTrq+Q+UYse3HWuYYE27yO9YMmhi/FvZaqW9xBrUKPqVJEbZ1wjczOLXNZ8jrRJG00OO8e7tPNE+HA9wUZSyeoV/INjuV+zxqsMbn2gsrZngu3eENNo3JQKukzWty2FdC8Q+Dp5WPYNEH0kTSjTZd4/MY9c44HEtW8g/g9kDWSecq2LutaujThy5LG4ueCWxnnx+Q77wmM6Mv66iPpjjhh8TfUcq3qkl8lonT6/vGRZZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecWjS/2UZ0IgcjyZ1BNFW6PGMsjPsk8NnvtJJ1/fvs=;
 b=G/Y51wIGbclaP6EFQD85MsAXiDiiOmaoaH/LRyBDcbqaIqHKmU61dHCBrada/z5IenThPqoQpbwxCGAgP1bXc1rjWssoMOqgMipYUHBJom/BHGaO4/ST630r5v1bmX/OyXXccm1To0Hcyhq+gbb81jJJCQIlzQrfH2xGN5vegfJNHFyU8AWS9ZqeZ+SKpHChmLddEHaOCeea2pmNidHfdCZmTdx1le/NK45OC2JLbaC5qUKolNFqgkoOZKvYTrrt46C94m+tVp61o8F+0ok14MXx5l02XqoGWaEQ02ZkisYy4rSyhp4+QtnbzCjgCIgFMpAv+Yx9euc4OS1HDq9F6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 08:42:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 01/14] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Topic: [PATCH v7 01/14] mm: Allow arch specific arch_randomize_brk()
 with CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Index: AQHYDqLG97pmfW9CEEqBlISb/pIgvQ==
Date: Fri, 21 Jan 2022 08:42:08 +0000
Message-ID: <da994d318af0602fe8facf770556e5fcb32a61ba.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36ccaa1b-d141-4529-0f6c-08d9dcb9e8b7
x-ms-traffictypediagnostic: PR1P264MB2206:EE_
x-microsoft-antispam-prvs: <PR1P264MB2206A375A6934D0842271845ED5B9@PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVhkSBl0XA/B0xhE4yNVc9wUgk2YaVU6HWqVItwUGjYilElnx55oovsmLEQ6LlBHGjyedubp2uOnov+hUMmD5sVUIADkz5VE22MLu5U0wi/4o8Sl2e0vW3iSuN4yic4Us1R3cy0M66B3Np/mqSEiPT31oDD/aC4VXwEgeTNMHZ54kAj7k2EOZ7c/te8JUOoQcThhrwb7Xj+f1LjcLbPxzY+y95fc+xOc8giy4/F3FUr/qI1Biy2EC7pXjxuLKHaGH+M5/iKrITSZb4t86TjWgbjMtGa6hasOdAAFQI2eupcbMiYhcRTWIgXVn7cdmH4xjAgrgSBhDL5nIhkUnHrtqmeNFmhsC2sEIK2hkQwNu8yJbV4iYpm0xzg2oqT2I6R0Hwy6krMkU/IXEYEIBr1G/YWLeoFkB9mCjY/PN4fg5Tetwswxrox8iqdUOjI1uzvj/Np30BvMR4+46HkDEzbFLFkG0P7T3kdCoro00rzwxDos5aCftyNc2diEk3+wRo57NGfOVC+1bc46Ko6vteGWdNmDWCf1Y2VkBhirSBd/O5mstiZ/ymsuXo4a+dMvyhwCmb5IJngCiD/McHDtiBjtoU6l81iqMYeNu1aqosYCVWWcZuOoHNiPX/Uz+jWPzYT6gZyV3/KH2Kz5fSZvwyvNCGJKH16SO1uPZm78OWFor9ulveQqUPDTy3obMEe+BA9euuLZkglkCovJAni6vwh/wQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(316002)(54906003)(38070700005)(2906002)(6512007)(8936002)(6486002)(86362001)(4744005)(186003)(2616005)(83380400001)(7416002)(110136005)(26005)(66476007)(66556008)(64756008)(91956017)(36756003)(66946007)(44832011)(76116006)(66446008)(38100700002)(508600001)(5660300002)(8676002)(4326008)(122000001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UJdXKOA9IhibxVi/SCjqTteGpdMoH+ru1bnugusxKD4Fs75sphrH0/CW/8?=
 =?iso-8859-1?Q?EdfgKaW+6DBIYLsrt7OiWKsPVOLtNhGOlsS/4lkYPPFOTwrrmjcy3K62gP?=
 =?iso-8859-1?Q?WkW14jOl8cKpaZUOz7Fwdy+JTZ6Oh7rO9zP1thuOvogWouptZLu9rjSGQ+?=
 =?iso-8859-1?Q?rhHGs3iDHLe8nKlux8GncTW/kjb0IrnrpYC+q3pXii3RK/FeJZJSMJQ/x5?=
 =?iso-8859-1?Q?Khf8qYX3Q/+DdRltrfIw+4QkblhS8RMOxeHXqqZ+afAowQA4m+ci8DBzWy?=
 =?iso-8859-1?Q?PGj6zMMddVUJSHk7er3LaBMwXB1syE41+G7FqhfbvRAn24556htWU2uvfg?=
 =?iso-8859-1?Q?gnJ13hjocvr6kx3MiQdM/uibjTd3ol/163HOl7jyp1xaETogsG2wk/V/BJ?=
 =?iso-8859-1?Q?VO9N3Xfl6y17zqvljq0m8NfYKc9mLQaWW25JiIOhjge4iKjrYO6uUwnlov?=
 =?iso-8859-1?Q?WVfpVqTY5+jgUJdtOITY6Qv4RpaHYDoReyrL93koK4FlJtKqtQo928TzuP?=
 =?iso-8859-1?Q?Ewkg5jmSHrkEEjSZC42kqAX6tfnTcBMU9tr9jZPGOf0/1wR1cjflD6qu1M?=
 =?iso-8859-1?Q?5G2CPA2rKwpKb2FNh991B5rwt23i76+QEzMwSwHUJ8tasWtHqVXwGyT3sx?=
 =?iso-8859-1?Q?pKuah7x+ekbot8F8wApQoWc9vZjoaKP2PGng9qyOHGvUY3I9R2b9kKt4xx?=
 =?iso-8859-1?Q?1RVBT0vbLiG47yLjTisWlnj2FDXOvQW2D3Vvep2f6kxv9JBnK48x9G76LB?=
 =?iso-8859-1?Q?R0lMVqd435awel/nLsHbFxx+2yNtFPV+JrDfuuTbaHm972xHIDHZKRRIx5?=
 =?iso-8859-1?Q?Dp3ekVPLGfspAGrPkQfcADlqnRPb3TEALoQSrL9zHfiPdIgpyXSwclYlEW?=
 =?iso-8859-1?Q?PAmulujGfYs4pZeqCjkClpf4hk6pye9KCh08THeyq8kuCvQPEiiUGxjc+h?=
 =?iso-8859-1?Q?WecoksmHC1dpv+tkR5hQSTWcE3s323ezEUWmZDJkmpVlLF5DvrewQjZv7u?=
 =?iso-8859-1?Q?Pknq0Lz7YbveKaq1UKGoQ3Vpa1TgiTP+6KYIpZLovz9N2J0eIPe1sTkIhG?=
 =?iso-8859-1?Q?TEUGlauQyBCcBTa2UUQyBPu0RneRZ5hPeeFCON2iFmoawFGt6WckqC3H1w?=
 =?iso-8859-1?Q?PxMGGk9CHJuqIT/iQGaUaSik6x7ikMT7gO7ZuBewpcInnhqu/TItcKYW5d?=
 =?iso-8859-1?Q?EEZJfZgAL4I1UO+YZwsK2jvw+O1Qj6BbfFbQSQl14KEoLi3fP/zCBynr0F?=
 =?iso-8859-1?Q?LhMbvot2gIu6CWXHK9HTU+fPmp4w4YHK9louDl2j2ik7VtcP9c1k5jM8dP?=
 =?iso-8859-1?Q?3EQ5ky6J/1DfSnQgdMwi6iYkaQa3sTNS40IFNIRxBTpbX2gNVne1yGF1Gc?=
 =?iso-8859-1?Q?GoWIIeGydPtqMmq8HSbJcA0rBTXaLqryWfHeORpoRma68z4rfsYtMz1yfM?=
 =?iso-8859-1?Q?JUJn2TdGc2KbwdHiqHJutjYinByOC95v/VbVg6N7OWxcExmmnuAydaXzg/?=
 =?iso-8859-1?Q?s2bbexgkuWK30RmSeNF4OqT0zTjI1nbIYXS2UuRDaAtuDAUzOxyyUwEIq4?=
 =?iso-8859-1?Q?fOkU/hRft25qnGyFcX7RPnWS5qx4FrUl9OqhWQ9f1BdAUkhhYxX+t1YLb0?=
 =?iso-8859-1?Q?z8HNqbK8UoSc8PtNVPhXj9Cv2HfmmpGqoe+KeyY7TxMy+eent6KF7c+zte?=
 =?iso-8859-1?Q?tIMZOkFukyTfi6+LPt5Z/AFL24TseyYY0uB++E+kWjXY/z/WNEQslQBMDW?=
 =?iso-8859-1?Q?PQQ0bR8fVgJmGhTMGELCn6JkE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ccaa1b-d141-4529-0f6c-08d9dcb9e8b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:08.0695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk8XOQq/H64TBm8jZ6Q1AWWvvBiwercDMiHAfyHsoKRuONmEvtoKe86ywh85aBq6BCM7WxnPbYqmVI3IBB8mAPnq4Ce7cBcXUFlZCtvxBis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2206
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

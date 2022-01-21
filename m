Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDB495C34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCcH5BcWz3cXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYl495Vz3c5g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1vS1iAAsesO8whdpnWr+llG5zc1fx76E1TN3tJtqJK+fMpX9dh7D0IQTlkmYIUO9ql3CHB+1GtGx8bYGUqjU57MbJ+lRqPu+KNmxrdJq4osXB+iNkwk3rIk5+P9uPh+7aOqul9my2K1nKN2J7jkqj+TzvOvRMbkUrmlEsstB0nklKxQgTDuCTzIbmTrfrO8NBSgH0VPxsIcZQFXv2TldJnC2LTrQ2bojKCniK7grX7SE/DeOA5IGzhJ8u2OCgfPlrWzd6INXW3r9/6qoAldlTt1VgOnK4EOCmHVds1bMU2qRz15Pf0Qcf6IbByDbH1WjrY107k2qi/hV1tHhVELQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiY1jWq5N+mnYEomtogvvA2McR4bD1uoV3qJr5FQods=;
 b=GcymXMlDT2qxp1Ob4jLzSTazGw1md/xULL/2iHk2+PRUoJwp19NNHzvVwSxQ280QO5iDjdMMdho9OY71J9vNWZZuXrVc4kEkuzl21i7WRfdWs9cK/sSz43Pm3enVEbt2YDGHIH91FUR/Tl4WnfqIjKdGC+6Xvy+qGZEiYQN3fgbpT1Lr8xHq4bkyGzqqDIQ37yOgvA3EC7T/l9ci0nYXME4GTbnpn8A9EbzE6+TDN1gQg2kTZQ/UgfvhXdBhCZLjTAoJ9T1+pG0PsNjbEMEwuT2ROCz634hsP+OeGtrTM4bPx1/IR+mdSHhHzzbvPSCjJw8KPx9rxTsyaX4dSjGTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 21 Jan
 2022 08:42:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 03/14] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Topic: [PATCH v7 03/14] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Index: AQHYDqLK5heG4KdaLUGB33l4dVbmMA==
Date: Fri, 21 Jan 2022 08:42:15 +0000
Message-ID: <0c8611ef3bcd758c4ff281b92015f447ab7f9b19.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff836e6-38c1-4786-5340-08d9dcb9ed5f
x-ms-traffictypediagnostic: PR0P264MB0201:EE_
x-microsoft-antispam-prvs: <PR0P264MB02012FFC625904C8280FDDD0ED5B9@PR0P264MB0201.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NayZfWn4N+X3Jc6lG+r+A2cS9vVPR7GFXSRlIRtnFG7AtD8iZ/Ung//abiRrlBGUTIc/QcKwX04QXPevJ3LHAFNxCOUYCehLlFTyaGMl8Iv8sKH8ixnz0t7mUMPlNbVATMAUbAop7ISeVecEFLfW6vUPrCtMZOAZImJGORL5hp/gLLeLW3P9CQXGIDHFM7pkl6FiL/P2sVBUXl6rpylryPKDKtPYhBi0Crs6E+LK8kA7AxS987R8qV2cR6FNwNm0ytCU3CR9mwibcOj2MhCUYflHnxKiFo5+/rg8bDW3WWZvYs7lOqllcL0JiKaKa3Ux8k0UbKl9l+EMYUUFdj+8DY+0bd3xeTChZFAZM5diCfgMwKXWNPP4UmV7Bq3nDrT7fV2jauoMskqRb9fjUpceIVtBqR7Pqogxx7YRtp/7ydPGTRO+BIQMZZj8z1L8D7F705ArGjtdtt8cvym0puT2ZqfOVw0BaIizQxi2o5/hzslzzY78X0A2v4JgvLu5YmdjXHs/xF1sc02WBerGUZzbuwkyAkO/nE3FdJ+IWWRx/XswyI/u0xmnRsfu0hioB0b5hQibeYJoGKJaOvF6t6q1vOUzbbStZOZ3uOGT21I8UABQwK0cYlExgXd2DllQbWtlP7kQUDIlyHUKYLvzceGIj4OIPg8OhwNY3L/seXEQqJf1J6bpsq53NUNLgSfVqlmzFHQZN17Nm96g5WJ0QLhzvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(36756003)(66476007)(2906002)(5660300002)(66946007)(8676002)(6512007)(122000001)(71200400001)(8936002)(83380400001)(66446008)(64756008)(4326008)(66556008)(86362001)(26005)(508600001)(6486002)(54906003)(2616005)(44832011)(38070700005)(6506007)(186003)(38100700002)(7416002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eY+tubdID9Xcakpow3klka+E1X4Mg0zUG6cJHGUOniWEbAWTYge4xJVkpN?=
 =?iso-8859-1?Q?V5cGHJpnA0TseSgm62MMRYo3hOIAP7uGCft4Y8ic27ll3HKAewSiM1c/Nu?=
 =?iso-8859-1?Q?m5fa9usvW+DIZIExrq0kiIv641TxkFdeT/uyjnH8NrvI3Ja8T+V/PcZndl?=
 =?iso-8859-1?Q?16sUOwdz9KYopR+MVleo+hXQ3sar6vhCULns+ipaIsWBnZ8cmWn9hmrg6t?=
 =?iso-8859-1?Q?mIvqDGk0EAtkilCtAuZfYR8+8jpf88iusuHvRLMioZxTqa0zBQi5Ym+Mat?=
 =?iso-8859-1?Q?2FnDSEKuPM9zOqVBL2Sk7LmK1mTthfu5TltR2OQjPmDQ60vfUehPZOvw4T?=
 =?iso-8859-1?Q?ZcJaPJczmV1uX4gyBwqr+Z4bxM4xV47VnY+jLDxNJuJ3hFcGbSQRh5VqIL?=
 =?iso-8859-1?Q?4ViPZJaQOsXBaNSvs1OJo4dqqt4rG1kiGRcxU8IK2QiaMXMfSzRYXcc5Ig?=
 =?iso-8859-1?Q?L0Q4kr/S+hHnGB2FPTL+l4Rmt4kz/P1nPMM+DRi1YN1CkEPERNOzhXA82T?=
 =?iso-8859-1?Q?K8aU4eHUGjrc1Z0D8s/LqSEW8i+6Wd89hohq9UeMq7bXffvyqs7VJkfQH4?=
 =?iso-8859-1?Q?AAVXMye+RG6O9qmL3E6vhQ/Pyvmj6haSpEGXaIiO51GDjOAfSFW5ZxwT0u?=
 =?iso-8859-1?Q?HXQ6KDzSWeI8sOmoewdt/yy9nxDk0AHgXWjSmg01EFAPwkH1eOIixBPZ+J?=
 =?iso-8859-1?Q?YQ0iahx34xmefvrhpnAXl4cP0LEoZEZjApXbDZ7nZ59P/q6gJ4wdTim/gI?=
 =?iso-8859-1?Q?DfH/mNMLOvurOLloTBK8sg//TmJ84X4BYHXKxXV+1eaeSRZ5+M8ySura3N?=
 =?iso-8859-1?Q?io11jkwpiIUfNDShE6gNn6aYska2Q4qp3JE30wdaUwBEy2+0GvJLcEccye?=
 =?iso-8859-1?Q?CRtL0I58D13vrtPjMU8gqw19awGP6JrO/aeKfSgtjFjYtxZpnxOKPBp9M3?=
 =?iso-8859-1?Q?Yu3GewEbiiBak2ILfajRLgu3F84r88KIUyWz/FPN5SZ5yUBJIyDYtGIGdE?=
 =?iso-8859-1?Q?yl8FygWCAd6FNLITPiTLE5B30TnFd08r5UXAr57LyeMgZmYEGB4DoDEbac?=
 =?iso-8859-1?Q?5jTAXT7Ler4wONfzlS2p+COnoWKncf8diahsP0e7bVyNDumSjLJKaZZIwa?=
 =?iso-8859-1?Q?F/7uZRVrrBQwAtXqOLknzrVl8/1fi2jQVBTJAerimoEtAdOMycC9rxLtFf?=
 =?iso-8859-1?Q?D9kzHKpYy9lUCUNPMQnLsDDEzfiZ6CgyBQ5v13Vf6beLMBjBCnLI6fM4ZH?=
 =?iso-8859-1?Q?1fyD6bWsZJ7W/zC/Dkm5Xzzecs0ClL/B2KRjCUcWaqipJ89QJ5jyDla3WA?=
 =?iso-8859-1?Q?ZDUu43WmfrV6MNizAUkmhKt//GhQt6DjtoguJT4jPzeNso+BFj8/uS6E+W?=
 =?iso-8859-1?Q?NQ9BQar0BGziUcR1Z7EC36Uky0c+jE6UCX/KdVt5ptgttqZZF2u0Cii0m8?=
 =?iso-8859-1?Q?ObMTKbT4hsHXZ2NrDMLqBSfAUvvhSprefB4xu3z8WDRzfOT1wg+D+yZwhp?=
 =?iso-8859-1?Q?cAN+91xU8g+flcyuq+IpIZ7FFb6Oawz0iyMniE6Fi9mrrs6kXsKkxgOgC2?=
 =?iso-8859-1?Q?0J419lR80+hkQVUcl4pyUlG3GVZ02+YTWTGcP8pZURpZKP+R0ifj4J5o6M?=
 =?iso-8859-1?Q?YDYNHRUvWh/abiOswTlGa+UlRoQuDev8h1ad63FJT1s3Pp8qvGjI21lofe?=
 =?iso-8859-1?Q?meI5UhNLpOq41G+26E5Cgwy+WLSeFchmqIsABxoBZNK7b2UcgeGqc02EOK?=
 =?iso-8859-1?Q?+9wkE9ti0Pzz8Fp1foH81P5sk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aff836e6-38c1-4786-5340-08d9dcb9ed5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:15.8831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Y9N0OkziZuTanFLWza800cxWCttcULPNkKkdzY3e6G33xM0NiCsAbRN7Z3d9jE309uneAtt+AC+j8zKMIu5jXHthixsapGU+svz0UZXuLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB0201
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
Cc: "will@kernel.org" <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc needs flags and len to make decision on arch_get_mmap_end().

So add them as parameters to arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/processor.h | 4 ++--
 mm/mmap.c                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/pr=
ocessor.h
index 6f41b65f9962..9ceec2bf4b93 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -91,8 +91,8 @@
 #endif /* CONFIG_COMPAT */
=20
 #ifndef CONFIG_ARM64_FORCE_52BIT
-#define arch_get_mmap_end(addr) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :=
\
-				DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags) \
+		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
=20
 #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
diff --git a/mm/mmap.c b/mm/mmap.c
index 7ac6a07ff382..ad48f7af7511 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2113,7 +2113,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_are=
a_info *info)
 }
=20
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
 #endif
=20
 #ifndef arch_get_mmap_base
@@ -2139,7 +2139,7 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end =3D arch_get_mmap_end(addr);
+	const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, flags);
=20
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;
@@ -2187,7 +2187,7 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm =3D current->mm;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end =3D arch_get_mmap_end(addr);
+	const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, flags);
=20
 	/* requested length too big for entire address space */
 	if (len > mmap_end - mmap_min_addr)
--=20
2.33.1

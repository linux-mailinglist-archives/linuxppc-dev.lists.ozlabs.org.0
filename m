Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E239C46D99A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8PCM6R8bz3f6X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:23:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5j2KbNz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiZE8ftOBXxsSnxDh+qS2PcHhjoXQopdzZnblcNLb9uKi5sQtvMffCsXmRUMSg/hTM3fKRrEQutm9HPZWc5xpBOHpbeiwxT2tY37qOs+C57S59xsSHr1NmrCzX/pM1k0zExlxhzRh8iCFG2ZYTroGOR2/WhwNgRjxXEBhs2BPtLTxUGSWpi7XD56AP+RH8AcTGqHzGCKWoS3BgwAyNskNhYsah7EdXhzmvZmyPVRtC/Dm7SshOIAp9fczUqc2VX/iWJR00rAzVRk9t1TQSYsCaoHt1RfyowNcYpA3nN7ypO0xKYFSzuvFHi5PxA4GulsbcJQZtSnzzGUUEd3HfyF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwyareCaN3ZlSh2+BwwdNQ1qMDia3Q7S45Cfyrw+tSI=;
 b=YF1ow86oKAgDqt+Jgs/jZ5/KaiB7AMFEyMPMQpsHLdwcwQzYx/fxL4LCfkI2xsljcEiagserEGjd+vSAaBVadFD1ERVDjrZnhxYq8s04D6dZjXCEG7xgywzMFXo5s9TIH0Y3y1wbHTsbO8WqxFyF8PuUSHsB0vpFfvlsC3cZTQnb2w2+VZMt1VqxRpDtnmmSYVZL0qDtJ83NcUMF/I2OTfMEAz/NlLAAJOHt3f6UCddMln4kcQwxt0Gret7akPFlCs7M0HSPjjVtLohafVAXMd/MUFlhNr7fIbd5PCmT2U4EndlMS9sMMOjEuRyut76Ee/DPD4vAaH6ucmM48+Gdzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 17:18:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 10/10] powerpc/mm: Properly randomise mmap with slices
Thread-Topic: [PATCH v4 10/10] powerpc/mm: Properly randomise mmap with slices
Thread-Index: AQHX7Fea0peO1pudxEe4GqD87shvlw==
Date: Wed, 8 Dec 2021 17:18:23 +0000
Message-ID: <4249d95311ec93b0a9d421ca56d69612fb1e5811.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25e52a4a-c6a3-4185-e955-08d9ba6ebd39
x-ms-traffictypediagnostic: MRXP264MB0823:EE_
x-microsoft-antispam-prvs: <MRXP264MB08236D4A263EDB844463DA2BED6F9@MRXP264MB0823.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lzZX7QebEXDdh9sbFiSLsMtViHHRZyuzmmraxPn14LX7E5/nwrCbd8mJ8PGk9p87L1P99dGLnZ1ksPCzqXSp/6Be2576RjnuQibka4fkV4FNFcSDbB0MU4PRj0hBGmMM2FpoUaytnYqjB7kRljJ3KOaZ5FeFgWSvfV6v7VJ6fG20QGVBziPgtKcyjQNR8JC8lf+eoolBiVmLoAZGTYYsoILhjLU3XifBKKBXxmtsR0qmgV+ta5A9rG2IL8Xqa2BQthbgQgsn1OZwNUGiMHCkmfSZlp0ExRS4mYn7A20ve+yRlS8WV5B9S3i+l4OsQzG/RE4WsBqP43afoNdG3Yt8ZiZfYsCkMNNyEG1dFSbAZxKJVjzmtjNY3S8CgCPcp4Tgc0M/kyOYUV8tugI+oulVfaIOoccdSPn+v3+u7QzLEr2m/3spFDopAak6/fp69Xl638KjlVaIpbPROfDKhsotoJHgLrzUR9M37jfkkp4GG7jYmhtr54Xuc6gqUagCNnQ7iYdc3uDq+amjJtPLHfw0D0nDgtgOA6yORm/imzYePiW64zxnq2EQFQY9JarGBQlRyIumujirAuc0TYVeFvYp8N2m0K0hUhiSUP5FYEI033fMWZPduY3R9WsnKRatTl4SrvvLCp2EEx4olQaI9/N3WTRuahDVn65tKl9WSD09gcuwwbLX7UYchkAEpr1Bv+kkvxK8F8ywmWzXKWp+KG1XvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(316002)(83380400001)(6486002)(2906002)(36756003)(26005)(110136005)(64756008)(91956017)(66946007)(8676002)(54906003)(86362001)(44832011)(76116006)(6506007)(66476007)(66556008)(6512007)(5660300002)(508600001)(38100700002)(2616005)(66446008)(71200400001)(122000001)(186003)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j56JBr4ekIZvDjBGiD8vnELwDxOgQ8KAn43eVuzSzeimAxdDIaiMWHiVSm?=
 =?iso-8859-1?Q?TWXs6kvr5Hp851I7ff8wq7Guu+H99+yTPOzv+iW3WqpZb89tpnaEyGexpw?=
 =?iso-8859-1?Q?ru+9sm1k0bR00qCpRx8IeQwk+nz4gXI3NbHhOHQe3YPGbnoihmiD/ml2fY?=
 =?iso-8859-1?Q?iTsWmQCDYeuFCFvhffTxtP2tYbKq4PfaM3c+nR8U5A0wzfXlHJZ0EewgHj?=
 =?iso-8859-1?Q?myXNbhWN+shOxVoUw2LVRtlVSWskMODR443E+HtlhKAa18pqFyulPQnRpl?=
 =?iso-8859-1?Q?3/f9UAJXqPqM9T7WdfOqV/hTaVC7IirlpipWdni5ou++Ax1jrRn48WeC2O?=
 =?iso-8859-1?Q?1ZOR8ObtV4onuUTcNqz/E+L4v7nprZmQQGq2KStKTi2sCnv8r/aNNMNBax?=
 =?iso-8859-1?Q?+1MTAdwZPWlVb7OiyDgzfVyAAU6cqIAuddgeS29OAR/H23pcfDzvokeF4m?=
 =?iso-8859-1?Q?W8aoPOsM5tSvxfuoJyVyCbrJS0umLytouJ90Zrulf690muIqydWqOhN2z5?=
 =?iso-8859-1?Q?mJ7bZTRmcgHfxpjfnFUbzD6+dyzeKLIgvQWjQhiOvBTeyZbqqNlfOX5w2E?=
 =?iso-8859-1?Q?a5QVqNuoN5Sjh/0nJnpgXsVkMEQUI7p/sfEAsrT6jnlijeWMSA08ROfXuj?=
 =?iso-8859-1?Q?+aE+PwWUYielOoYIOx4bQicENdHlOYfZL1WAuhA5nmHRR+AxfxvPJexbZD?=
 =?iso-8859-1?Q?oUW1pI4R8Qxxi2FxXRpzQSeeRHQ5P0SEFwT/M+zljPb59g2jnc1e5vRWX4?=
 =?iso-8859-1?Q?aDzFhv3gBHiWdEoO6xXxhg8e9gGVlYs40FVd1x9THqTQuaNwdmrMsqEqZC?=
 =?iso-8859-1?Q?duzAV5lMHMOHmFlxLS2mKkjuBQ0FNciAhy3J3S1HUgQtP48FAA6/mpjcCr?=
 =?iso-8859-1?Q?DEDf5Kwvn5znnt0AMMN1cvGnNg9BklMBDyKjOsAtKNozMpirKwWRb1wTjS?=
 =?iso-8859-1?Q?J+AkbE10wY4qCP1+8/A2MkHGpl7BBiotSWMvCD6HcabJnHu3l9gMtczmDj?=
 =?iso-8859-1?Q?QZs9aZugNrG1vA+sHJSQkDZOzC75RnGzehbEoFIii4VWGPXsDuRUKfazi8?=
 =?iso-8859-1?Q?eUOsH0xrzz1OVdCGdk9NRUsVfVDk+R9X9jhALtmnn1b9GZhJYnWWwwqitH?=
 =?iso-8859-1?Q?DfrFlpALfVfGpAMkRdT8E8uXRUyKO8Ioa21YoVPgypzvQbJzwIYj7YWxAo?=
 =?iso-8859-1?Q?6yTwNh9SP8HwZ7GGKgG+YvkwCxoUQCXJGUuiSTfTKxBwRWRGOfsYxBuJKY?=
 =?iso-8859-1?Q?XOK0UzQTCcv0+1z5zMjTixq02GtFn0SE0QtqbIxZU/tGnAgpYzNp43zYR3?=
 =?iso-8859-1?Q?lnhdMyFYuWW5G1dXal2mVzfn7k4HC1z+svwDgEMgn+lV2Uv4yWoXiWJ2Y5?=
 =?iso-8859-1?Q?iZ9OeeXOfwR/JNe41cn2qsrKhvb90A3ddEsorjILCwde+6RmG75XyPYmk5?=
 =?iso-8859-1?Q?VE2aPcDYrC2LHrZ2N1o1Y3WlcCoDe96S20CT1Ctk0FmEkRDEct38bZKqFV?=
 =?iso-8859-1?Q?Y3zDzaiZMZ5MiXmkp8Yy0hhwPHR/MlnJlFy1pNacyJhyQY6/7hKaIRDy6K?=
 =?iso-8859-1?Q?Li3HG7DMaUm5wUeAsR6jLv9YdZkT9nJ+3m9KC3SgrhydJqECDwdQINyGv4?=
 =?iso-8859-1?Q?Q7h1k3eCgnafZXgQx1Pc2PRFFk+lXZ2YI6OezH962Xgt73VK2dAL6en5Qv?=
 =?iso-8859-1?Q?OnqfjE7NFufxOnIqxZuT18sB2PA6dSepiWEohAgdSBY8DmILTSrGiTjkdO?=
 =?iso-8859-1?Q?x898TQ5/OguTnrDdq2Q2dZSOs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e52a4a-c6a3-4185-e955-08d9ba6ebd39
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:23.3045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrmZbvib/nPauh6MNCf5h/i6IV6TryjEpzQV2pNldufeprO/+fb686MLlSvw6xDNNo/artxugnM6xp+jzPsFcTgf9xzkcnDNbHZ+BKkLUis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0823
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that powerpc switched to default topdown mmap layout,
mm->mmap_base is properly randomised.  However
slice_find_area_bottomup() doesn't use mm->mmap_base but
uses the fixed TASK_UNMAPPED_BASE instead.

slice_find_area_bottomup() being used as a fallback to
slice_find_area_topdown(), it can't use mm->mmap_base
directly.

Instead of always using TASK_UNMAPPED_BASE as base address, leave
it to the caller. When called from slice_find_area_topdown()
TASK_UNMAPPED_BASE is used. Otherwise mm->mmap_base is used.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s64/slice.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/sl=
ice.c
index 03681042b807..c0b58afb9a47 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -276,20 +276,18 @@ static bool slice_scan_available(unsigned long addr,
 }
=20
 static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
-					      unsigned long len,
+					      unsigned long addr, unsigned long len,
 					      const struct slice_mask *available,
 					      int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, next_end;
+	unsigned long found, next_end;
 	struct vm_unmapped_area_info info;
=20
 	info.flags =3D 0;
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D TASK_UNMAPPED_BASE;
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -322,12 +320,12 @@ static unsigned long slice_find_area_bottomup(struct =
mm_struct *mm,
 }
=20
 static unsigned long slice_find_area_topdown(struct mm_struct *mm,
-					     unsigned long len,
+					     unsigned long addr, unsigned long len,
 					     const struct slice_mask *available,
 					     int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, prev;
+	unsigned long found, prev;
 	struct vm_unmapped_area_info info;
 	unsigned long min_addr =3D max(PAGE_SIZE, mmap_min_addr);
=20
@@ -335,8 +333,6 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D mm->mmap_base;
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
@@ -377,7 +373,7 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	 * can happen with large stack limits and large mmap()
 	 * allocations.
 	 */
-	return slice_find_area_bottomup(mm, len, available, psize, high_limit);
+	return slice_find_area_bottomup(mm, TASK_UNMAPPED_BASE, len, available, p=
size, high_limit);
 }
=20
=20
@@ -386,9 +382,9 @@ static unsigned long slice_find_area(struct mm_struct *=
mm, unsigned long len,
 				     int topdown, unsigned long high_limit)
 {
 	if (topdown)
-		return slice_find_area_topdown(mm, len, mask, psize, high_limit);
+		return slice_find_area_topdown(mm, mm->mmap_base, len, mask, psize, high=
_limit);
 	else
-		return slice_find_area_bottomup(mm, len, mask, psize, high_limit);
+		return slice_find_area_bottomup(mm, mm->mmap_base, len, mask, psize, hig=
h_limit);
 }
=20
 static inline void slice_copy_mask(struct slice_mask *dst,
--=20
2.33.1

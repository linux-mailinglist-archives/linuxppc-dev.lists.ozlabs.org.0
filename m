Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DA644FA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 00:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRcCJ1XPQz3bgZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 10:32:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=agDh224o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=agDh224o;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRcBL2Zw6z30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 10:31:37 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6MqERD015332;
	Tue, 6 Dec 2022 23:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=tjgUwssYbCa0AvQ2Wr9YLIeLSZrrBCFOKGkh0v79wbg=;
 b=agDh224oLnQwbeWXH61OS4uyzPlwr5ixFY7/atsyL0XncBK2THqsj55yt2NtntxuaVRP
 4QwzKkEQFlniSn2Pjp1pJLDvYrXbsk5+eEANGkOUoXZxPDMW+w+ecXgSs5Iz72XEvhNS
 pI6895kUwRdt+keMRbfZRSMET2b0WdczIUlqEfZVQeQAlmtcSgExzunWkXmiQQrAYmV9
 s3Xdpaf2DWrXMOuY56o/9ufYTD4x0nvqudEm/QQDv4faoKPbXCf5HlYcsXFoMrn0e2x/
 3pNmPjrLEOQ3Y8NocEF0u3ob2N8LPPz87L2udHdsgNEGZWlj/yr1wDED3HymTCjtIgkX EA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3maewe8sq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 23:31:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6D2vvM004862;
	Tue, 6 Dec 2022 23:31:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3m9pv9scp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 23:31:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B6NVN6f43319640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Dec 2022 23:31:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D45320040;
	Tue,  6 Dec 2022 23:31:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F90120043;
	Tue,  6 Dec 2022 23:31:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Dec 2022 23:31:22 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 60CF9600F0;
	Wed,  7 Dec 2022 10:31:20 +1100 (AEDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v5 2/5] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <87k034rx0z.fsf@mpe.ellerman.id.au>
Date: Wed, 7 Dec 2022 10:30:24 +1100
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6FCDD70-28C0-4304-9447-9424D6704FEB@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
 <20221118002146.25979-2-rmclure@linux.ibm.com>
 <87k034rx0z.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U3m8cHQvSIn70U75kJ1UT3RGu1mu1f_M
X-Proofpoint-GUID: U3m8cHQvSIn70U75kJ1UT3RGu1mu1f_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060195
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Great job spotting this. Somehow lost these throughout the revisions. =
Thanks.

> On 7 Dec 2022, at 9:24 am, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Rohan McLure <rmclure@linux.ibm.com> writes:
>> The check that a higher-level entry in multi-level pages contains a =
page
>> translation entry (pte) is performed by p{m,u,4}d_leaf stubs, which =
may
>> be specialised for each choice of mmu. In a prior commit, we replace
>> uses to the catch-all stubs, p{m,u,4}d_is_leaf with p{m,u,4}d_leaf.
>>=20
>> Replace the catch-all stub definitions for p{m,u,4}d_is_leaf with
>> definitions for p{m,u,4}d_leaf. A future patch will assume that
>> p{m,u,4}d_leaf is defined on all platforms.
>>=20
>> In particular, implement pud_leaf for Book3E-64, pmd_leaf for all =
Book3E
>> and Book3S-64 platforms, with a catch-all definition for p4d_leaf.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> v5: Split patch that replaces p{m,u,4}d_is_leaf into two patches, =
first
>> replacing callsites and afterward providing generic definition.
>> Remove ifndef-defines implementing p{m,u}d_leaf in favour of
>> implementing stubs in headers belonging to the particular platforms
>> needing them.
>> ---
>> arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
>> arch/powerpc/include/asm/book3s/64/pgtable.h |  8 ++-----
>> arch/powerpc/include/asm/nohash/64/pgtable.h |  5 +++++
>> arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
>> arch/powerpc/include/asm/pgtable.h           | 22 =
++------------------
>> 5 files changed, 18 insertions(+), 26 deletions(-)
>=20
> I needed the delta below to prevent the generic versions being defined
> and overriding our versions.
>=20
> cheers
>=20
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h =
b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 44703c8c590c..117135be8cc2 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -244,6 +244,7 @@ static inline void pmd_clear(pmd_t *pmdp)
> *pmdp =3D __pmd(0);
> }
>=20
> +#define pmd_leaf pmd_leaf
> static inline bool pmd_leaf(pmd_t pmd)
> {
> return false;
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 436632d04304..f00aa2d203c2 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1438,11 +1438,13 @@ static inline bool is_pte_rw_upgrade(unsigned =
long old_val, unsigned long new_va
> /*
>  * Like pmd_huge() and pmd_large(), but works regardless of config =
options
>  */
> +#define pmd_leaf pmd_leaf
> static inline bool pmd_leaf(pmd_t pmd)
> {
> return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> }
>=20
> +#define pud_leaf pud_leaf
> static inline bool pud_leaf(pud_t pud)
> {
> return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h =
b/arch/powerpc/include/asm/nohash/64/pgtable.h
> index 2488da8f0deb..d88b22c753d3 100644
> --- a/arch/powerpc/include/asm/nohash/64/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
> @@ -147,6 +147,7 @@ static inline void pud_clear(pud_t *pudp)
> *pudp =3D __pud(0);
> }
>=20
> +#define pud_leaf pud_leaf
> static inline bool pud_leaf(pud_t pud)
> {
> return false;
> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h =
b/arch/powerpc/include/asm/nohash/pgtable.h
> index 487804f5b1d1..dfae1dbb9c3b 100644
> --- a/arch/powerpc/include/asm/nohash/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
> @@ -60,6 +60,7 @@ static inline bool pte_hw_valid(pte_t pte)
> return pte_val(pte) & _PAGE_PRESENT;
> }
>=20
> +#define pmd_leaf pmd_leaf
> static inline bool pmd_leaf(pmd_t pmd)
> {
> return false;



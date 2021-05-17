Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C6382E01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLDf6LnZz2yyM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:52:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWvt0XHV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WWvt0XHV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLD74VXKz2yYK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:52:23 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HDWnFQ027049; Mon, 17 May 2021 09:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version : content-type
 : content-transfer-encoding; s=pp1;
 bh=kdXF6jEvBAmo3Lc0xsbbySEV8VmbYVv7BSCauJaZv1U=;
 b=WWvt0XHVNKEeNsriRa7WaDkqMGv1KdPzQ5g311mL2Uh8T91jXq6rLyYLljhx6/Lfxubd
 OPJ/hwe2cpyaajPqtPLifqLJWEmfiNXdwPRSLQaZHGRZwuvtjpOI2ruA9aRlj38G75P6
 lXSRQhxYrJNaUaLWOvANflh78dCr1pbvEj2uGLpJRHwx3sFRrvDOLjZGhAVAGdcfAIJR
 PXVD2PAfCXpadGcCgprDzIFp5u8u0t1G6XCxXli+O85dQqDiFE94sBI83TQb4nah4ZeK
 zaKusAbO2DurzL4xqLqvyd80lMQqfZu/NBRAOj0Dr5tpi45S8yRAeLrImZN1TR8lDpUN Kg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38krr7t6s3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:52:09 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HDmZ2J006816;
 Mon, 17 May 2021 13:52:08 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 38j5x9kcck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 13:52:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HDq7kC32833902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:52:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67C076E084;
 Mon, 17 May 2021 13:52:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF4F6E064;
 Mon, 17 May 2021 13:52:06 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.40.240])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 13:52:05 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in
 kernel mode, sig: 5 [#1]
In-Reply-To: <6fcdf4f2-9bed-4b0f-8ed8-74cb25484ea6@arm.com>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
 <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
 <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
 <6fcdf4f2-9bed-4b0f-8ed8-74cb25484ea6@arm.com>
Date: Mon, 17 May 2021 19:22:03 +0530
Message-ID: <87tun1qxh8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LVpzxbaxcmVLl_hiAI-dwiu8EeP4SwOd
X-Proofpoint-GUID: LVpzxbaxcmVLl_hiAI-dwiu8EeP4SwOd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_05:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170096
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual <anshuman.khandual@arm.com> writes:

> On 5/17/21 11:25 AM, Aneesh Kumar K.V wrote:
>> On 5/17/21 11:17 AM, Christophe Leroy wrote:
>>> +aneesh
>>> +linuxppc-dev list
>>>
>>> Le 17/05/2021 =C3=A0 07:44, Anshuman Khandual a =C3=A9crit=C2=A0:
>>>> Hello Christophe,
>>>>
>>>> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
>>>> aware about this. From the error log, it failed explicitly on 4K page
>>>> size hash config.
>>>>
>>>> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ------> Failed
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pmd;
>>>> }
>>>>
>>>> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (radix_enabled())
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return radix__pmd_mkhuge(pmd);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return hash__pmd_mkhu=
ge(pmd);
>>>> }
>>>>
>>>> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>>> {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pmdv;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmdv =3D (pfn << PAGE=
_SHIFT) & PTE_RPN_MASK;
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return __pmd_mkhuge(p=
md_set_protbits(__pmd(pmdv), pgprot));
>>>> }
>>>>
>>>> It seems like on powerpc, where pfn_pmd() makes a huge page but which
>>>> is not supported on 4K hash config thus triggering the BUG(). But all
>>>> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
>>>> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
>>>> not directly make a huge page on other platforms.
>>>>
>>>> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
>>>> THP helpers has BUG() or 0 which indicates THP might not be supported
>>>> on 4K page size hash config ?
>>>>
>>>> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
>>>> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
>>>> platforms which I assume includes 4K page size hash config as well.
>>>>
>>>> Is THP some how getting enabled on this 4K page size hash config where
>>>> it should not be (thus triggering the BUG) ? OR am I missing something
>>>> here.
>>>>
>>>
>>=20
>> We should put those=C2=A0 pfn_pmd()=C2=A0 and pfn_pud() after
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0if (!has_transparent_hugepage())
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>
> The following patch has been lightly tested on arm64 and x86 platforms.
> Could you please verify if this solves the problem on powerpc 4K hash
> config ? Thank you.

Tested the patch with the below additional change.

modified   mm/debug_vm_pgtable.c
@@ -186,12 +186,13 @@ static void __init pmd_advanced_tests(struct mm_struc=
t *mm,
 				      unsigned long pfn, unsigned long vaddr,
 				      pgprot_t prot, pgtable_t pgtable)
 {
-	pmd_t pmd =3D pfn_pmd(pfn, prot);
+	pmd_t pmd;
=20
 	if (!has_transparent_hugepage())
 		return;
=20
 	pr_debug("Validating PMD advanced\n");
+	pmd =3D pfn_pmd(pfn, prot);
 	/* Align the address wrt HPAGE_PMD_SIZE */
 	vaddr =3D (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
=20
@@ -334,12 +335,13 @@ static void __init pud_advanced_tests(struct mm_struc=
t *mm,
 				      unsigned long pfn, unsigned long vaddr,
 				      pgprot_t prot)
 {
-	pud_t pud =3D pfn_pud(pfn, prot);
+	pud_t pud;
=20
 	if (!has_transparent_hugepage())
 		return;
=20
 	pr_debug("Validating PUD advanced\n");
+	pud =3D pfn_pud(pfn, prot);
 	/* Align the address wrt HPAGE_PUD_SIZE */
 	vaddr =3D (vaddr & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE;
=20



-aneesh

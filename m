Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F917E401D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 14:35:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndwJHnCB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPq3N3Hytz3cQH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 00:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndwJHnCB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPq2S4h0Yz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 00:34:39 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A7DMfdV027040;
	Tue, 7 Nov 2023 13:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=v3QkukCicnhLUxBi0c5Ls5rlqn8O3DTToO3Z55A5kTg=;
 b=ndwJHnCByIlKDBCsND4tEU4L2U5WwVHFB46dqPkWGs/dZQxf8JE0vJSy+XstM71CbYF7
 ntaI6QZlrCLJAK31/Bt1WigP6C2yCRm/3UKWsYTd/LZ1SZE8rnQ/mlJjW73FSxzHjNLA
 c+oYrxpzrcfRGiW4MCMYUgnNOQ27FZH0BNe2aR4CpccN9SxiXiEK0LryeZ4TOhpWk7/r
 fNF6IucoiJh/MBQhjKYvoqtEqg2lcCILmeeWEH93yacnCbngBoFN1s9BTSLu4mMFHN1S
 WyTNuUONMoxKTdOjbf5DV7o/WHLrS3P6NWTQ2jfoF3Fp2pBAy4oytcd/ezrAq7cExpMS 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7p2k8aaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 13:34:29 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A7DNrkS030005;
	Tue, 7 Nov 2023 13:34:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u7p2k8a9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 13:34:28 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A7C1kbU012794;
	Tue, 7 Nov 2023 13:34:27 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u609ss3tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 13:34:27 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A7DYQpx21562090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Nov 2023 13:34:27 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A77945805C;
	Tue,  7 Nov 2023 13:34:26 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BBCC5805A;
	Tue,  7 Nov 2023 13:34:24 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.45.200])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Nov 2023 13:34:24 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 29/37] powerpc/nohash: Replace pte_user() by pte_read()
In-Reply-To: <02c4b724-f503-31ea-eb77-4b3cd6776fd8@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <72cbb5be595e9ef884140def73815ed0b0b37010.1695659959.git.christophe.leroy@csgroup.eu>
 <877cn39jyp.fsf@linux.ibm.com>
 <02c4b724-f503-31ea-eb77-4b3cd6776fd8@csgroup.eu>
Date: Tue, 07 Nov 2023 19:04:22 +0530
Message-ID: <87zfzpznz5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _yXYOuy1iDNyTTaHU1L3JHzj4hQSRrwv
X-Proofpoint-ORIG-GUID: Dw-1ecWryLezBGYYr4IUtTKLD0JgQSOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_04,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=526
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070112
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 31/10/2023 =C3=A0 11:15, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>=20
>>> pte_user() is now only used in pte_access_permitted() to check
>>> access on vmas. User flag is cleared to make a page unreadable.
>>>
>>> So rename it pte_read() and remove pte_user() which isn't used
>>> anymore.
>>>
>>> For the time being it checks _PAGE_USER but in the near futur
>>> all plateforms will be converted to _PAGE_READ so lets support
>>> both for now.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/nohash/32/pte-8xx.h |  7 -------
>>>   arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++++++------
>>>   arch/powerpc/mm/ioremap.c                    |  4 ----
>>>   3 files changed, 7 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerp=
c/include/asm/nohash/32/pte-8xx.h
>>> index 62c965a4511a..1ee38befd29a 100644
>>> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>>> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>>> @@ -112,13 +112,6 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>>>=20=20=20
>>>   #define pte_mkwrite_novma pte_mkwrite_novma
>>>=20=20=20
>>> -static inline bool pte_user(pte_t pte)
>>> -{
>>> -	return !(pte_val(pte) & _PAGE_SH);
>>> -}
>>> -
>>> -#define pte_user pte_user
>>> -
>>>   static inline pte_t pte_mkhuge(pte_t pte)
>>>   {
>>>   	return __pte(pte_val(pte) | _PAGE_SPS | _PAGE_HUGE);
>>> diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/i=
nclude/asm/nohash/pgtable.h
>>> index ee677162f9e6..aba56fe3b1c6 100644
>>> --- a/arch/powerpc/include/asm/nohash/pgtable.h
>>> +++ b/arch/powerpc/include/asm/nohash/pgtable.h
>>> @@ -160,9 +160,6 @@ static inline int pte_write(pte_t pte)
>>>   	return pte_val(pte) & _PAGE_WRITE;
>>>   }
>>>   #endif
>>> -#ifndef pte_read
>>> -static inline int pte_read(pte_t pte)		{ return 1; }
>>> -#endif
>>>   static inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE=
_DIRTY; }
>>>   static inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAG=
E_SPECIAL; }
>>>   static inline int pte_none(pte_t pte)		{ return (pte_val(pte) & ~_PTE=
_NONE_MASK) =3D=3D 0; }
>>> @@ -190,10 +187,14 @@ static inline int pte_young(pte_t pte)
>>>    * and PTE_64BIT, PAGE_KERNEL_X contains _PAGE_BAP_SR which is also in
>>>    * _PAGE_USER.  Need to explicitly match _PAGE_BAP_UR bit in that cas=
e too.
>>>    */
>>> -#ifndef pte_user
>>> -static inline bool pte_user(pte_t pte)
>>> +#ifndef pte_read
>>> +static inline bool pte_read(pte_t pte)
>>>   {
>>> +#ifdef _PAGE_READ
>>> +	return (pte_val(pte) & _PAGE_READ) =3D=3D _PAGE_READ;
>>> +#else
>>>   	return (pte_val(pte) & _PAGE_USER) =3D=3D _PAGE_USER;
>>> +#endif
>>>   }
>>>   #endif
>>>=20=20=20
>>> @@ -208,7 +209,7 @@ static inline bool pte_access_permitted(pte_t pte, =
bool write)
>>>   	 * A read-only access is controlled by _PAGE_USER bit.
>>>   	 * We have _PAGE_READ set for WRITE and EXECUTE
>>>   	 */
>>> -	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
>>> +	if (!pte_present(pte) || !pte_read(pte))
>>>   		return false;
>>>=20=20=20
>>>   	if (write && !pte_write(pte))
>>> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
>>> index 7823c38f09de..7b0afcabd89f 100644
>>> --- a/arch/powerpc/mm/ioremap.c
>>> +++ b/arch/powerpc/mm/ioremap.c
>>> @@ -50,10 +50,6 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t =
size, unsigned long flags)
>>>   	if (pte_write(pte))
>>>   		pte =3D pte_mkdirty(pte);
>>>=20=20=20
>>> -	/* we don't want to let _PAGE_USER leak out */
>>> -	if (WARN_ON(pte_user(pte)))
>>> -		return NULL;
>>>
>>=20
>> This check is still valid right? I understand that we want to remove
>> _PAGE_USER. But then loosing this check is ok?
>
> Well, we may have to think about it for book3s/64. For all others=20
> _PAGE_USER is gone and replaced by a check of addresses versus TASK_SIZE.
>
> As ioremap() will map into vmalloc space that address is necesserally=20
> correct.
>=20
>

We are adding the pte flags check not the map addr check there. Something l=
ike this?

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index 7c7de7b56df0..b053b86e0069 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1462,5 +1462,11 @@ static inline bool pud_is_leaf(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
=20
+#define arch_ioremap_valid_pte arch_ioremap_valid_pte
+static inline bool arch_ioremap_valid_pte(pte_t pte)
+{
+	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/in=
clude/asm/nohash/32/pte-8xx.h
index 137dc3c84e45..7b23d2543528 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -223,5 +223,11 @@ static inline pte_t ptep_get(pte_t *ptep)
=20
 #endif
=20
+#define arch_ioremap_valid_pte arch_ioremap_valid_pte
+static inline bool arch_ioremap_valid_pte(pte_t pte)
+{
+	return !!(pte_val(pte) & (_PAGE_SH))
+}
+
 #endif /* __KERNEL__ */
 #endif /*  _ASM_POWERPC_NOHASH_32_PTE_8xx_H */
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/incl=
ude/asm/nohash/pte-e500.h
index f516f0b5b7a8..d31274178aa6 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -105,6 +105,13 @@ static inline pte_t pte_mkexec(pte_t pte)
 }
 #define pte_mkexec pte_mkexec
=20
+#define arch_ioremap_valid_pte arch_ioremap_valid_pte
+static inline bool arch_ioremap_valid_pte(pte_t pte)
+{
+	return !(pte_val(pte) & (_PAGE_BAP_UR | _PAGE_BAP_UW | _PAGE_BAP_UX))
+}
+
+
 #endif /* __ASSEMBLY__ */
=20
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/=
pgtable.h
index 2bfb7dd3b49e..417abe5dcbd8 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -231,6 +231,13 @@ static inline bool arch_supports_memmap_on_memory(unsi=
gned long vmemmap_size)
=20
 #endif /* CONFIG_PPC64 */
=20
+#ifndef arch_ioremap_valid_pte
+static inline book arch_ioremap_valid_pte(pte_t pte)
+{
+	return true;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
=20
 #endif /* _ASM_POWERPC_PGTABLE_H */
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 7b0afcabd89f..1a39e698c3d4 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -50,6 +50,9 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size,=
 unsigned long flags)
 	if (pte_write(pte))
 		pte =3D pte_mkdirty(pte);
=20
+	if (WARN_ON(!arch_ioremap_valid_pte(pte)))
+		return NULL;
+
 	if (iowa_is_active())
 		return iowa_ioremap(addr, size, pte_pgprot(pte), caller);
 	return __ioremap_caller(addr, size, pte_pgprot(pte), caller);
=20

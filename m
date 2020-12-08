Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFB2D2D46
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:35:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr2lH480gzDqf6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:35:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K5lKDiik; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr2jj27JnzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:33:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8EXJEm028630; Tue, 8 Dec 2020 09:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zeRxfXzj5s28JCZUz/l58CCmDz7wNMg9k2XQnUu8edo=;
 b=K5lKDiikxbb4b3JmuZqCZbpz9sj2sSaMmoa9aOdhbHe9trnsBUzIYM7I4S+VZmhtUHoq
 Hy7mfCW1MMnUeNT//sGQKJ6Xx+YssCaXLKVR3qrgrxIMQEWIuiwPoI38dQzd5BJCme+R
 krk4MR45xbt30dsiI6+6GKXWrKPK7KSIYLHxD2wXouscmhNxNC/fFHt8rV8RC67pkFGx
 MzcsfbK2ib5YWqyG+QLoXinkfN61DbaK8i3OPfeoJY2iFYkXgimxiI2LHDwHqqFfx8dn
 Dhbd2Ait+PBt6o6gSRAfjr76Sy0TwiGRe6KN1zgYnQvtipPTB6xaVT+fs1N2crIK05X7 qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35a5td2dx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 09:33:29 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8EXOCX028959;
 Tue, 8 Dec 2020 09:33:24 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35a5td2da4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 09:33:24 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8EVetY004254;
 Tue, 8 Dec 2020 14:31:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3581u908qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 14:31:40 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8EVdbl14680904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 14:31:39 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB73AC064;
 Tue,  8 Dec 2020 14:31:39 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 461A6AC059;
 Tue,  8 Dec 2020 14:31:37 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.71.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 14:31:36 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com
Subject: Re: [PATCH v3 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
In-Reply-To: <d66f9706-9e36-5b92-5a87-90ebd05587e9@csgroup.eu>
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
 <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
 <0e25f03d-9f59-b963-312c-c3ae1d7953a2@linux.ibm.com>
 <d66f9706-9e36-5b92-5a87-90ebd05587e9@csgroup.eu>
Date: Tue, 08 Dec 2020 20:01:34 +0530
Message-ID: <87o8j4qshl.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080086
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 08/12/2020 =C3=A0 14:00, Aneesh Kumar K.V a =C3=A9crit=C2=A0:
>> On 12/8/20 2:07 PM, Christophe Leroy wrote:
>>> search_exception_tables() is an heavy operation, we have to avoid it.
>>> When KUAP is selected, we'll know the fault has been blocked by KUAP.
>>> Otherwise, it behaves just as if the address was already in the TLBs
>>> and no fault was generated.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>> v3: rebased
>>> v2: Squashed with the preceeding patch which was re-ordering tests that=
 get removed in this patch.
>>> ---
>>> =C2=A0 arch/powerpc/mm/fault.c | 23 +++++++----------------
>>> =C2=A0 1 file changed, 7 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>>> index 3fcd34c28e10..1770b41e4730 100644
>>> --- a/arch/powerpc/mm/fault.c
>>> +++ b/arch/powerpc/mm/fault.c
>>> @@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs=
, unsigned long error_code,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 if (!is_exec && address < TASK_SIZE && (error_code =
& (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !search_exception_tables(re=
gs->nip)) {
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_crit_ratelimited("Kernel=
 attempted to access user page (%lx) - exploit attempt? (uid:=20
>>> %d)\n",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 address,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from_kuid(&init_user_ns, curr=
ent_uid()));
>>> -=C2=A0=C2=A0=C2=A0 }
>>> -
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Kernel fault on kernel address is bad
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (address >=3D TASK_SIZE)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> -=C2=A0=C2=A0=C2=A0 // Fault on user outside of certain regions (eg. co=
py_tofrom_user()) is bad
>>> -=C2=A0=C2=A0=C2=A0 if (!search_exception_tables(regs->nip))
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 // Read/write fault in a valid region (the exceptio=
n table search passed
>>> -=C2=A0=C2=A0=C2=A0 // above), but blocked by KUAP is bad, it can never=
 succeed.
>>> -=C2=A0=C2=A0=C2=A0 if (bad_kuap_fault(regs, address, is_write))
>>> +=C2=A0=C2=A0=C2=A0 // Read/write fault blocked by KUAP is bad, it can =
never succeed.
>>> +=C2=A0=C2=A0=C2=A0 if (bad_kuap_fault(regs, address, is_write)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_crit_ratelimited("Kernel=
 attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is_write ? "write" : "read", =
address,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from_kuid(&init_user_ns, curr=
ent_uid()));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +=C2=A0=C2=A0=C2=A0 }
>>=20
>>=20
>> Should we update bad_kuap_fault to check for !is_kernel_addr() and error=
_code & (DSISIR_PROT_FAULT |=20
>> DSISIR_KEYFAULT). I am wondering whether we can take another fault w.r.t=
 kernel address/user address=20
>> and end up reporting that as KUAP fault?
>
> Just before this we do:
>
> 	if (address >=3D TASK_SIZE)
> 		return true;
>
> About the error code, I don't know. Can we take a fault that is not a DSI=
SR_PROT_FAULT |
>   DSISR_KEYFAULT and that is not a KUAP fault ?
>
> Previously (before this patch), the error code was taken into account for=
 the call to=20
> search_exception_tables(), but has never been for the bad_kuap_fault().
>

a KUAP fault on radix will result in PROTFAULT and on hash it will
generate KEYFAULT. ie, something like below

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/includ=
e/asm/book3s/32/kup.h
index 32fd4452e960..b18cd931e325 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -177,8 +177,8 @@ static inline void restore_user_access(unsigned long fl=
ags)
 		allow_user_access(to, to, end - addr, KUAP_READ_WRITE);
 }
=20
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long addr=
ess,
+				  bool is_write, unsigned long error_code)
 {
 	unsigned long begin =3D regs->kuap & 0xf0000000;
 	unsigned long end =3D regs->kuap << 28;
diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/includ=
e/asm/book3s/64/kup.h
index 91af50e9b09a..16bb6aee9fcd 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -392,14 +392,24 @@ static inline void set_kuap(unsigned long value)
 }
=20
 static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long addr=
ess,
-				  bool is_write)
+				  bool is_write, unsigned long error_code)
 {
+	unsigned long fault;
+
 	if (!mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		return false;
+
+	if (radix_enabled())
+		fault =3D DSISR_PROTFAULT;
+	else
+		fault =3D DSISR_KEYFAULT;
+
 	/*
 	 * For radix this will be a storage protection fault (DSISR_PROTFAULT).
 	 * For hash this will be a key fault (DSISR_KEYFAULT)
 	 */
+	if (!(error_code & fault))
+		return false;
 	/*
 	 * We do have exception table entry, but accessing the
 	 * userspace results in fault.  This could be because we
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 49fe4b4a9434..bdffa2664bf0 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -62,8 +62,8 @@ void setup_kuap(bool disabled);
 #else
 static inline void setup_kuap(bool disabled) { }
=20
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long addr=
ess,
+				  bool is_write, unsigned long error_code)
 {
 	return false;
 }
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/in=
clude/asm/nohash/32/kup-8xx.h
index 567cdc557402..7bdd9e5b63ed 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -60,8 +60,8 @@ static inline void restore_user_access(unsigned long flag=
s)
 	mtspr(SPRN_MD_AP, flags);
 }
=20
-static inline bool
-bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
+static inline bool bad_kuap_fault(struct pt_regs *regs, unsigned long addr=
ess,
+				  bool is_write, unsigned long error_code)
 {
 	return WARN(!((regs->kuap ^ MD_APG_KUAP) & 0xff000000),
 		    "Bug: fault blocked by AP register !");
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b12595102525..03c3414bdc79 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -218,7 +218,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsi=
gned long error_code,
 	}
=20
 	// Kernel fault on kernel address is bad
-	if (address >=3D TASK_SIZE)
+	if (is_kernel_addr(address))
 		return true;
=20
 	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is b=
ad
@@ -227,7 +227,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsi=
gned long error_code,
=20
 	// Read/write fault in a valid region (the exception table search passed
 	// above), but blocked by KUAP is bad, it can never succeed.
-	if (bad_kuap_fault(regs, address, is_write))
+	if (bad_kuap_fault(regs, address, is_write, error_code))
 		return true;
=20
 	// What's left? Kernel fault on user in well defined regions (extable


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566789DB0B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 15:49:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jQiUvI3/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDS4L5jcSz3vb3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 23:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jQiUvI3/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDS3d3g2hz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 23:48:44 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 439DZEUV015560;
	Tue, 9 Apr 2024 13:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=w+4+aHDOFjUlwgUSGZ8Dj/z48FMeWzzkUbo0wsSMTms=;
 b=jQiUvI3/CtLFluzQJXNSk2AgMGJb+2SeFyyY1TmIqzZrYFqhy7QSjtDuz5sGLbtIUhYg
 HzOrGBRDA1ogR4WpeArqkcgQFBxBkSgLkuEEyci/Ny6qcbS0eZcziY3DZpuov72I7Syh
 4XdxuajLyYUe+Quv6EfPonzsYEg3zv43neLgpGUxPNQ0rWr21DlvQHB1TWyph77n3rPg
 acC4HyzbpxZ1+3kIPfK/dN01uR40xqC4LeGMbkr/pKE52PI0xwEg3/iOBbs+gsq6k/cc
 9rZvImiUH6C0gkHFuBFrGN5dtB+17MuOfKLTv5AvNZp7mzmMjdMMJNxR0wrtkEN8osUO ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xd6pdr0yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 13:48:31 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 439DmU5d005577;
	Tue, 9 Apr 2024 13:48:30 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xd6pdr0yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 13:48:30 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 439BkiVM022573;
	Tue, 9 Apr 2024 13:48:29 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbhqnxg92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 13:48:29 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 439DmQte25887424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Apr 2024 13:48:28 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C082958064;
	Tue,  9 Apr 2024 13:48:26 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A84605805E;
	Tue,  9 Apr 2024 13:48:26 +0000 (GMT)
Received: from localhost (unknown [9.61.21.252])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Apr 2024 13:48:26 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Enforce hcall result buffer validity
 and size
In-Reply-To: <874jcac3xb.fsf@mail.lhotse>
References: <20240408-pseries-hvcall-retbuf-v1-1-ebc73d7253cf@linux.ibm.com>
 <874jcac3xb.fsf@mail.lhotse>
Date: Tue, 09 Apr 2024 08:48:26 -0500
Message-ID: <87cyqy7il1.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NoTfODECB2laQFflW_TpgAvDZ_IMSL3R
X-Proofpoint-ORIG-GUID: roxUpkK7_0LaeZP4wi4wfeUl2YEkh8PU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_09,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404090089
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
> writes:
>>
>> plpar_hcall(), plpar_hcall9(), and related functions expect callers to
>> provide valid result buffers of certain minimum size. Currently this
>> is communicated only through comments in the code and the compiler has
>> no idea.
>>
>> For example, if I write a bug like this:
>>
>>   long retbuf[PLPAR_HCALL_BUFSIZE]; // should be PLPAR_HCALL9_BUFSIZE
>>   plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, ...);
>>
>> This compiles with no diagnostics emitted, but likely results in stack
>> corruption at runtime when plpar_hcall9() stores results past the end
>> of the array. (To be clear this is a contrived example and I have not
>> found a real instance yet.)
>
> We did have some real stack corruption bugs in the past.
>
> I referred to them in my previous (much uglier) attempt at a fix:
>
>   https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1476780032-21643-2-git-send-email-mpe@ellerman.id.au/
>
> Annoyingly I didn't describe them in any detail, but at least one of them was:
>
>   24c65bc7037e ("hwrng: pseries - port to new read API and fix stack
>   corruption")

Thanks for this background.


> Will this catch a case like that? Where the too-small buffer is not
> declared locally but rather comes into the function as a pointer?

No, unfortunately. But here's a sketch that forces retbuf to be an
array, along with the necessary changes to make pseries-rng build:

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 39cd1ca4ccb9..4055e461dcfd 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -524,7 +524,11 @@ long plpar_hcall_norets_notrace(unsigned long opcode, ...);
  * Used for all but the craziest of phyp interfaces (see plpar_hcall9)
  */
 #define PLPAR_HCALL_BUFSIZE 4
-long plpar_hcall(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
+long _plpar_hcall(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
+#define plpar_hcall(opcode_, retbuf_, ...) ({				\
+			static_assert(ARRAY_SIZE(retbuf_) >= PLPAR_HCALL_BUFSIZE); \
+			_plpar_hcall(opcode_, retbuf_, ## __VA_ARGS__);	\
+		})
 
 /**
  * plpar_hcall_raw: - Make a hypervisor call without calculating hcall stats
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 2b0cac6fb61f..4570dc0648fc 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -147,7 +147,7 @@ plpar_hcall_norets_trace:
 	blr
 #endif
 
-_GLOBAL_TOC(plpar_hcall)
+_GLOBAL_TOC(_plpar_hcall)
 	HMT_MEDIUM
 
 	mfcr	r0
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 4e9916bb03d7..11738c40274c 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -54,7 +54,7 @@
 
 
 /* in hvCall.S */
-EXPORT_SYMBOL(plpar_hcall);
+EXPORT_SYMBOL(_plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
diff --git a/drivers/char/hw_random/pseries-rng.c b/drivers/char/hw_random/pseries-rng.c
index 62bdd5af1339..a8cc6b80cd76 100644
--- a/drivers/char/hw_random/pseries-rng.c
+++ b/drivers/char/hw_random/pseries-rng.c
@@ -15,10 +15,10 @@
 
 static int pseries_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 {
-	u64 buffer[PLPAR_HCALL_BUFSIZE];
+	unsigned long buffer[PLPAR_HCALL_BUFSIZE];
 	int rc;
 
-	rc = plpar_hcall(H_RANDOM, (unsigned long *)buffer);
+	rc = plpar_hcall(H_RANDOM, buffer);
 	if (rc != H_SUCCESS) {
 		pr_err_ratelimited("H_RANDOM call failed %d\n", rc);
 		return -EIO;


There may be other call sites to fix but this is enough for
ppc64le_defconfig.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F74376B02
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 22:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcLz84qblz308V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 06:05:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpC5RFZk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GpC5RFZk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcLyc5tK5z2yYD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 06:04:56 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147K2nEa080669; Fri, 7 May 2021 16:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : subject :
 from : to : cc : references : in-reply-to; s=pp1;
 bh=TQQlpVtOKlN8C1Bt7HJaAi2NsujWr/1T15UMuWjKOG4=;
 b=GpC5RFZku+uvKwCq4qbxquezmvoFjPeRyOt/kaEcyty0VmhBIAWore2SA9aLiZzcJGwp
 PJcNuJQb4VqhlI/G4wEh8DMQVREhibJBC2GS4vQnquCNWlKLOp4A66aQrUY8mIHgtjVx
 SOc3gm9yaaBE0rRydnVjXh1NJsZm0bf7rH1+UJ+HrHVB/ZYmhk+1STBS35nPyNm4Q6Zc
 X/6+3DPYV+fetn+pJ/frtAAwJSumJ3kRp7wtdwsJ8kDJaGO/A2KRhyOOu0gxudD4X3x3
 EJqhsch8JyGSEiiL2J3R+pIlX2xvKVnHKdZPfcDajd4czcp2VNtht6VDzZWgAoDikARY Yw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38d84bffyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 16:04:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 147K43qD014539;
 Fri, 7 May 2021 20:04:05 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 38csqnftg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 20:04:05 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 147K3s2Y22282536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 May 2021 20:03:54 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35118BE059;
 Fri,  7 May 2021 20:03:54 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E359BE04F;
 Fri,  7 May 2021 20:03:53 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.141.26])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Fri,  7 May 2021 20:03:53 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 220D6BC0D7B;
 Fri,  7 May 2021 15:03:51 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 May 2021 15:03:51 -0500
Message-Id: <CB7A6IWZTDUL.17HEAW6KQEYCD@oc8246131445.ibm.com>
Subject: Re: [RESEND PATCH v4 10/11] powerpc: Protect patching_mm with a lock
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Peter Zijlstra" <peterz@infradead.org>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-11-cmr@linux.ibm.com>
 <YJPKNSNVf34a39qC@hirez.programming.kicks-ass.net>
In-Reply-To: <YJPKNSNVf34a39qC@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IAfPKIgqzEtDXpl3GCYp0ZEkSYkOkS3q
X-Proofpoint-ORIG-GUID: IAfPKIgqzEtDXpl3GCYp0ZEkSYkOkS3q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_08:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=643
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105070131
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
Cc: tglx@linutronix.de, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hardening@vger.kernel.org, keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu May 6, 2021 at 5:51 AM CDT, Peter Zijlstra wrote:
> On Wed, May 05, 2021 at 11:34:51PM -0500, Christopher M. Riedl wrote:
> > Powerpc allows for multiple CPUs to patch concurrently. When patching
> > with STRICT_KERNEL_RWX a single patching_mm is allocated for use by all
> > CPUs for the few times that patching occurs. Use a spinlock to protect
> > the patching_mm from concurrent use.
> >=20
> > Modify patch_instruction() to acquire the lock, perform the patch op,
> > and then release the lock.
> >=20
> > Also introduce {lock,unlock}_patching() along with
> > patch_instruction_unlocked() to avoid per-iteration lock overhead when
> > patch_instruction() is called in a loop. A follow-up patch converts som=
e
> > uses of patch_instruction() to use patch_instruction_unlocked() instead=
.
>
> x86 uses text_mutex for all this, why not do the same?

I wasn't entirely sure if there is a problem with potentially going to
sleep in some of the places where patch_instruction() is called - the
spinlock avoids that (hypothetical) problem.

I just tried switching to text_mutex and at least on a P9 machine the
series boots w/ the Hash and Radix MMUs (with some lockdep errors). I
can rework this in the next version to use text_mutex if I don't find
any new problems with more extensive testing. It does mean more changes
to use patch_instruction_unlocked() in kprobe/optprobe/ftace in
arch/powerpc since iirc those are called with text_mutex already held.

Thanks!
Chris R.

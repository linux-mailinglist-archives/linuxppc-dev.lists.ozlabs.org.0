Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E642C6CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTz9b4Sl8z3bWB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 03:52:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Duzb+sln;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Duzb+sln; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTz8r0M0dz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 03:52:11 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DGHkHc010095; 
 Wed, 13 Oct 2021 12:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=5sACMFfzDtAUFaTMRsmigYNf2FvC/e0YhjfueZQDcDY=;
 b=Duzb+slnotpEJ3phN+qwXsiXIe42q1Naroo9HU1eqqItJCRS1qV9I/jFpkPpOv4D58qV
 XE/z4wYJ+x4b/1PPGPrmeSThrHGw6epsvOWeLxAd/A65KCr8vEXaNpKrgg+GZzHAXUVw
 1vpdIkogxtenlX/JUDlmalOfVgsH2ruaBaqgBamOkpScBeIv5DfNPcBeJBCtds8cuJ/1
 XN07h5QPqfU6B1jMUNrLPkKDobe1yhtWta8fGh8HHqvuGMFY4rrS8skBZXntgn8hMkQ+
 fxWfPtNZ2JacIKPu1D1VYc6qZUwNN+PtfgLd+BO3OvAbCNvCDrh1M3eOALWSThQEA/Gn gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnwb5gmgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 12:52:03 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19DGT3iL020520;
 Wed, 13 Oct 2021 12:52:03 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnwb5gmgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 12:52:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DGpck6023935;
 Wed, 13 Oct 2021 16:52:01 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 3bnm397qr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 16:52:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19DGq03736635090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 16:52:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92D727806B;
 Wed, 13 Oct 2021 16:52:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC687805F;
 Wed, 13 Oct 2021 16:51:59 +0000 (GMT)
Received: from localhost (unknown [9.211.73.118])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Oct 2021 16:51:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 02/52] powerpc/64s: guard optional TIDR SPR with CPU
 ftr test
In-Reply-To: <87k0ijm1ty.fsf@mpe.ellerman.id.au>
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-3-npiggin@gmail.com>
 <87v9235rl2.fsf@linux.ibm.com> <87k0ijm1ty.fsf@mpe.ellerman.id.au>
Date: Wed, 13 Oct 2021 13:51:57 -0300
Message-ID: <87zgrckguq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nVEXXV6283GjZCd5cWN6RoZ7IhhktV8H
X-Proofpoint-ORIG-GUID: ziC5t9dymdhUy6p_aRc2LKu1e9Zx0vJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_06,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130104
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Fabiano Rosas <farosas@linux.ibm.com> writes:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>
>>> The TIDR SPR only exists on POWER9. Avoid accessing it when the
>>> feature bit for it is not set.
>>
>> Not related to this patch, but how does this work with compat mode? A P9
>> compat mode guest would get an invalid instruction when trying to access
>> this SPR?
>
> Good question.
>
> I assume you're talking about P9 compat mode on P10.
>
> In general compat mode only applies to userspace, because it's
> implemented by setting the PCR which only (mostly?) applies to PR=3D1.
>
> I don't think there's any special casing in the ISA for the TIDR, so I
> think it just falls into the unimplemented SPR case for mt/fspr.
>
> That's documented in Book III section 5.4.4, in particular on page 1171
> it says:
>
>   Execution of this instruction specifying an SPR number
>   that is undefined for the implementation causes one of
>   the following.
>   =E2=80=A2 if spr[0]=3D0:
>     - if MSR[PR]=3D1: Hypervisor Emulation Assistance interrupt
>     - if MSR[PR]=3D0: Hypervisor Emulation Assistance interrupt for SPR
>       0,4,5, and 6, and no operation (i.e., the instruction is treated
>       as a no-op) when LPCR[EVIRT]=3D0 and Hypervisor Emulation Assistance
>       interrupt when LPCR[EVIRT]=3D1 for all other SPRs

I knew this must have been somewhere in there but had no idea how to
find it. Thanks.

> Linux doesn't set EVIRT, and I assume neither does phyp, so it behaves
> like a nop.
>
> We actually use that behaviour in xmon to detect that an SPR is not
> implemented, by noticing that the mfspr has no effect on the target
> register, see dump_one_spr().
>
> We should really write some docs on compat mode in the linuxppc wiki
> and/or Documentation ;)

Hmm I was not aware we had a wiki. I'll see if I can contribute
something. I need to go learn all this stuff first, though =3DD.

>
> cheers

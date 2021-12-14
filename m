Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DC473DFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 09:08:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCrbS2Z9rz3bvH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 19:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R7Q5QjZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R7Q5QjZA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCrZj2FHCz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 19:07:24 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BE7OGEd026971; 
 Tue, 14 Dec 2021 08:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=Rw/RSbaZ9R8PhgYkldknpdlNAwQ6MY5+0neDWly7nJM=;
 b=R7Q5QjZAAdUc5IA03RR/N8WbuoIRl6Yw4rPh8W9N6aZLz4xC58S10iekihkZ6pqocheL
 rtdkeVF2qNW0CHHI23ZvciSvPvGh+SMrgcZc7KPMhJ7vjqCB4INI9EIyPvyTYq8LP6Jh
 5NXj3Bsw7LxmCDko9t7rDD4wsJ3i1e1u20jgmhwdncVAOJhryCdHZYAmQ8Up0Tt7WWUP
 c8cP7jAyMP2CBs2qC1RI7Qk1m4wcaElDPnU7ZeyOTzLdagvu3IB9WMSbsBkTpSh+CIgJ
 ym68lmXmNUirytCnWcce6dd9zIfbL4nO4Xl1aL0ZRYVgpz8FBUYkmt2WKe37n2ktkhIi yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cx9ra441b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 08:07:16 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BE7tVx6029106;
 Tue, 14 Dec 2021 08:07:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cx9ra440m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 08:07:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BE7wAGZ007779;
 Tue, 14 Dec 2021 08:07:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3cvk8hv0ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 08:07:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BE87CLO43843902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Dec 2021 08:07:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 290234C04E;
 Tue, 14 Dec 2021 08:07:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1D274C044;
 Tue, 14 Dec 2021 08:07:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.34.55])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Dec 2021 08:07:10 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] KVM: PPC: Book3S HV P9: Use kvm_arch_vcpu_get_wait() to
 get rcuwait object
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211213174556.3871157-1-seanjc@google.com>
Date: Tue, 14 Dec 2021 13:37:09 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <6D5BB54E-442E-4097-932B-7E0AC949D47C@linux.vnet.ibm.com>
References: <20211213174556.3871157-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BGV6Wr3SFJP4GFYL8xA4dqnOBxrxuYeK
X-Proofpoint-ORIG-GUID: KrXLSQwq0bBiSCDVbdBAeqysPFUe4fEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_02,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112140046
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 13-Dec-2021, at 11:15 PM, Sean Christopherson <seanjc@google.com> =
wrote:
>=20
> Use kvm_arch_vcpu_get_wait() to get a vCPU's rcuwait object instead of
> using vcpu->wait directly in kvmhv_run_single_vcpu().  Functionally, =
this
> is a nop as vcpu->arch.waitp is guaranteed to point at vcpu->wait.  =
But
> that is not obvious at first glance, and a future change coming in via
> the KVM tree, commit 510958e99721 ("KVM: Force PPC to define its own
> rcuwait object"), will hide vcpu->wait from architectures that define
> __KVM_HAVE_ARCH_WQP to prevent generic KVM from attepting to wake a =
vCPU
> with the wrong rcuwait object.
>=20
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> =E2=80=94
>=20
Thanks for the patch.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>


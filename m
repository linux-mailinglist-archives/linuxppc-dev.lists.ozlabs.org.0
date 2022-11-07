Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D761FF5C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5jD52Td4z3f4Z
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 07:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oLSyj97T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oLSyj97T;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5fjW49MWz3cKX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 05:22:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7IBfhG003607;
	Mon, 7 Nov 2022 18:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=EzR8gIJXN5CxUQRbcB4MiNn9dtOoco2fyNz/1FbCYTs=;
 b=oLSyj97Tdsnk0VQOOelX0cMC03SHso5gNnzaHyD+AU0QdK4ObvkSGhKy5MB3Eu0X4nH3
 cwQlVJnBR+mHedqllHCGkozoyH6XI3rvXWzRd6B14keKEVzxvN6OwiPguQYiPjgoozr5
 CuCksG6s9mdmq7QLIUQJIca83ZvoD2XgDSxzv6A51X5fRtxNeiKKljGLcDn9w2C0oVaI
 lt4UbjIbWAu4ejWPW7Tu9j/0mFdDdf2RJQ//Gs+6w72ns70J8ekHGYyOg0A6bX47zuXl
 7JNyzQw/vMhVPkpKIf+E0zSFCsOlxjnE+4eVRtOOT/s/U0hkUCCpuH99DScbFKpRAn6z EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwfy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:19 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7Gap8F020063;
	Mon, 7 Nov 2022 18:22:18 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1uuwfxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:17 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7IL2nI028450;
	Mon, 7 Nov 2022 18:22:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma04dal.us.ibm.com with ESMTP id 3kngmswr5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 18:22:16 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7IMJ895243508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 18:22:19 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B096858062;
	Mon,  7 Nov 2022 18:22:14 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E657058052;
	Mon,  7 Nov 2022 18:22:11 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 18:22:11 +0000 (GMT)
Message-ID: <e2b21ebfec94bcc3d830a5c7f11837d6dedac652.camel@linux.ibm.com>
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
From: Eric Farman <farman@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen
 <chenhuacai@kernel.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Mon, 07 Nov 2022 13:22:11 -0500
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-26-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zz_sQx9dIUW7WUoiYMvv3aj8CVyX61yu
X-Proofpoint-ORIG-GUID: x0YF0w8yQ2jwBDgCwuGa40JfBxQPUq9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=598 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070144
X-Mailman-Approved-At: Tue, 08 Nov 2022 07:10:51 +1100
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Move the guts of kvm_arch_init() into a new helper,
> __kvm_s390_init(),
> and invoke the new helper directly from kvm_s390_init() instead of
> bouncing through kvm_init().=C2=A0 Invoking kvm_arch_init() is the very
> first action performed by kvm_init(), i.e. this is a glorified nop.
>=20
> Moving setup to __kvm_s390_init() will allow tagging more functions
> as
> __init, and emptying kvm_arch_init() will allow dropping the hook
> entirely once all architecture implementations are nops.
>=20
> No functional change intended.
>=20
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> =C2=A0arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
> =C2=A01 file changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>


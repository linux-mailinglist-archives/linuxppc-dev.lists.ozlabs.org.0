Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8D61FF39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5j7z50TFz3dvK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 07:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RmD9JtKv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=farman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RmD9JtKv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5f9N6FMyz3cHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 04:58:32 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7GwDic011947;
	Mon, 7 Nov 2022 17:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YihfQm6JRpW3FFMAWPS/MkEOkqiW/lbLXXaGSks5I5Y=;
 b=RmD9JtKvUg9mHfb6CMoDoiJwC4LwdRkwwMPnUP0+ML3lsvjLRm5m1SxYiMb3WRhYQFk0
 VVTpLv10dzML14PzTxA17a+meZi9SVZlmkNg/nNXWorX1oVwSU05SmVRYjq76jbrEwe7
 ix+v4arhKFwHnLT5ZzI7WGnJm5nL1eaZZIYSXxqgmKN3lhZIF5Aez2YyK2FLT2o3PvCa
 P4/4GWhyQ1jb6gNiyeSCtYeSAXD38BT8KoUps434p/v3mRFsfpmY4GruA8/z9GDigjvt
 JesjjGdkEkLL7eNvk3XJ78eYdrhitHcx3p7SiQxW6u1SuwPxBdPqwR1FSz3X1CM/pw/Z ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14xc29y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:25 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7GAU5a024872;
	Mon, 7 Nov 2022 17:57:24 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14xc296-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:24 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7Hotxo017059;
	Mon, 7 Nov 2022 17:57:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 3kngphwhp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:23 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7HvI5v35914384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 17:57:18 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38E3658062;
	Mon,  7 Nov 2022 17:57:21 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1971F58059;
	Mon,  7 Nov 2022 17:57:18 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 17:57:17 +0000 (GMT)
Message-ID: <1386ccd1ff60cb8e4af80fbb294160a8d7cc3b5b.camel@linux.ibm.com>
Subject: Re: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init()
 piece-by-piece() if a step fails
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
Date: Mon, 07 Nov 2022 12:57:17 -0500
In-Reply-To: <20221102231911.3107438-6-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-6-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x0CFSwe6XYz-Xhj4j-0SH7l6f0V92YqI
X-Proofpoint-GUID: 6DNbjcvPaQN4ZD-vbbGxEV1nmcCcrdiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070140
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
> In preparation for folding kvm_arch_hardware_setup() into
> kvm_arch_init(),
> unwind initialization one step at a time instead of simply calling
> kvm_arch_exit().=C2=A0 Using kvm_arch_exit() regardless of which
> initialization
> step failed relies on all affected state playing nice with being
> undone
> even if said state wasn't first setup.=C2=A0 That holds true for state
> that is
> currently configured by kvm_arch_init(), but not for state that's
> handled
> by kvm_arch_hardware_setup(), e.g. calling
> gmap_unregister_pte_notifier()
> without first registering a notifier would result in list corruption
> due
> to attempting to delete an entry that was never added to the list.
>=20
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> =C2=A0arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
> =C2=A01 file changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

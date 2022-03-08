Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1EA4D1A7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 15:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCd3f61ZYz3bSs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 01:28:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lk+f/x7v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lk+f/x7v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCd2v3vycz30FC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 01:27:50 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228CKVWP023228; 
 Tue, 8 Mar 2022 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SzuB/oix1bOrcb1DwVNc3/y8KKucPYC+QX9r/E+Lhh8=;
 b=Lk+f/x7v9Y9f/5isd9Gz4VJNGl9pCyOwIWh05ndtz4xJhx8v5CaXCXQbd3hEN27qFviI
 XkBnZbG9HWX2pDP8csP0/ZbF6/ca4SxjgPPO0ia/0z/7FVpf4VhdYqk6FqdqQgWL00zM
 fn8mRNBFEEc5zQRCyoB/tKca2Vw3DLtVohs9wOEmE/caMqYSG1oQLAEwi9vOxingo53Z
 8W+6H+ORyvzmyxFDJrzkXwhY8ht8q35pFaJ/tt/kXPC4OdE4kL/s2sFTwBztQgVgcjWC
 iPaMcJIYwQruNjkhLg7T8nkX1EqyTtAjPlhFhzrmzIpF+7prSQEqsv2V4IEZ+AkO0Kr2 FA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enx3m5d3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 14:27:40 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228ERMk4007404;
 Tue, 8 Mar 2022 14:27:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3ekyga2tvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 14:27:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228ERbtj33554708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 14:27:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52A13AC05E;
 Tue,  8 Mar 2022 14:27:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14974AC059;
 Tue,  8 Mar 2022 14:27:36 +0000 (GMT)
Received: from localhost (unknown [9.211.148.106])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Mar 2022 14:27:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] KVM: PPC: Book3S HV: Provide a more accurate
 MAX_VCPU_ID in P9
In-Reply-To: <f5ec9d55-bac3-b571-dfad-bd501cd364b3@csgroup.eu>
References: <20210412222656.3466987-1-farosas@linux.ibm.com>
 <20210412222656.3466987-3-farosas@linux.ibm.com>
 <f5ec9d55-bac3-b571-dfad-bd501cd364b3@csgroup.eu>
Date: Tue, 08 Mar 2022 11:27:32 -0300
Message-ID: <87lexka59n.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -Wlq7r_-9K9BG57Bfg19phKaE1tQTlgR
X-Proofpoint-GUID: -Wlq7r_-9K9BG57Bfg19phKaE1tQTlgR
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxlogscore=970 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080075
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 13/04/2021 =C3=A0 00:26, Fabiano Rosas a =C3=A9crit=C2=A0:
>> The KVM_CAP_MAX_VCPU_ID capability was added by commit 0b1b1dfd52a6
>> ("kvm: introduce KVM_MAX_VCPU_ID") to allow for vcpu ids larger than
>> KVM_MAX_VCPU in powerpc.
>>=20
>> For a P9 host we depend on the guest VSMT value to know what is the
>> maximum number of vcpu id we can support:
>>=20
>> kvmppc_core_vcpu_create_hv:
>>      (...)
>>      if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>> -->         if (id >=3D (KVM_MAX_VCPUS * kvm->arch.emul_smt_mode)) {
>>                      pr_devel("KVM: VCPU ID too high\n");
>>                      core =3D KVM_MAX_VCORES;
>>              } else {
>>                      BUG_ON(kvm->arch.smt_mode !=3D 1);
>>                      core =3D kvmppc_pack_vcpu_id(kvm, id);
>>              }
>>      } else {
>>              core =3D id / kvm->arch.smt_mode;
>>      }
>>=20
>> which means that the value being returned by the capability today for
>> a given guest is potentially way larger than what we actually support:
>>=20
>> \#define KVM_MAX_VCPU_ID (MAX_SMT_THREADS * KVM_MAX_VCORES)
>>=20
>> If the capability is queried before userspace enables the
>> KVM_CAP_PPC_SMT ioctl there is not much we can do, but if the emulated
>> smt mode is already known we could provide a more accurate value.
>>=20
>> The only practical effect of this change today is to make the
>> kvm_create_max_vcpus test pass for powerpc. The QEMU spapr machine has
>> a lower max vcpu than what KVM allows so even KVM_MAX_VCPU is not
>> reached.
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> This patch won't apply after commit a1c42ddedf35 ("kvm: rename=20
> KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS")
>
> Feel free to resubmit if still applicable.

Thanks for the reminder, Christophe.

I was focusing on enabling the rest of the kvm-selftests:
https://lore.kernel.org/r/20220120170109.948681-1-farosas@linux.ibm.com

I'm preparing a v2 for that series and will try to include these patches
as well.


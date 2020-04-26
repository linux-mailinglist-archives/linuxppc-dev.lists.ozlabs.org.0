Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 242121B9051
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 15:06:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4997Sm3jmGzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 23:06:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=thuth@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aMl/8ryP; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMl/8ryP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4997Kn3Dz6zDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 22:59:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587905985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=cS6N3dz+H92wTTUjeik0cWhJVJMk8JtsySToZ32DZB8=;
 b=aMl/8ryPi9d+jjVbN8PB6eKImZsR5rdDtWa1xfi1jNTVPlKpQ1lcMPMW4vw3f054jdCZWC
 kVC8uUDI86xGRwYWIOUnl0jkHZPq8425382RKqFWotQnVSCzpyG2cHlwoQsOw5VzF/9FuW
 8GdkB5ZGCuIKVIja7od18Emc9e0kEQ8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587905985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=cS6N3dz+H92wTTUjeik0cWhJVJMk8JtsySToZ32DZB8=;
 b=aMl/8ryPi9d+jjVbN8PB6eKImZsR5rdDtWa1xfi1jNTVPlKpQ1lcMPMW4vw3f054jdCZWC
 kVC8uUDI86xGRwYWIOUnl0jkHZPq8425382RKqFWotQnVSCzpyG2cHlwoQsOw5VzF/9FuW
 8GdkB5ZGCuIKVIja7od18Emc9e0kEQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-L1Gr5bIyNaSAU5A4TdMIqA-1; Sun, 26 Apr 2020 08:59:40 -0400
X-MC-Unique: L1Gr5bIyNaSAU5A4TdMIqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CAF545F;
 Sun, 26 Apr 2020 12:59:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26AC460C05;
 Sun, 26 Apr 2020 12:59:19 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20200422125810.34847-1-tianjia.zhang@linux.alibaba.com>
 <20200422125810.34847-2-tianjia.zhang@linux.alibaba.com>
 <20200422154543.2efba3dd.cohuck@redhat.com>
 <dc5e0fa3-558b-d606-bda9-ed281cf9e9ae@de.ibm.com>
 <20200422180403.03f60b0c.cohuck@redhat.com>
 <5e1e126d-f1b0-196c-594b-4289d0afb9a8@linux.alibaba.com>
 <20200423123901.72a4c6a4.cohuck@redhat.com>
 <71344f73-c34f-a373-49d1-5d839c6be5f6@linux.alibaba.com>
 <1d73b700-4a20-3d7a-66d1-29b5afa03f4d@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <73f6ecd0-ac47-eaad-0e4f-2d41c2b34450@redhat.com>
Date: Sun, 26 Apr 2020 14:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1d73b700-4a20-3d7a-66d1-29b5afa03f4d@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, peterx@redhat.com, linux-mips@vger.kernel.org,
 hpa@zytor.com, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, maz@kernel.org, joro@8bytes.org, x86@kernel.org,
 mingo@redhat.com, julien.thierry.kdev@gmail.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/04/2020 13.00, Christian Borntraeger wrote:
>=20
>=20
> On 23.04.20 12:58, Tianjia Zhang wrote:
>>
>>
>> On 2020/4/23 18:39, Cornelia Huck wrote:
>>> On Thu, 23 Apr 2020 11:01:43 +0800
>>> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
>>>
>>>> On 2020/4/23 0:04, Cornelia Huck wrote:
>>>>> On Wed, 22 Apr 2020 17:58:04 +0200
>>>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>>> =C2=A0=C2=A0
>>>>>> On 22.04.20 15:45, Cornelia Huck wrote:
>>>>>>> On Wed, 22 Apr 2020 20:58:04 +0800
>>>>>>> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>>>>>>> In the current kvm version, 'kvm_run' has been included in the '=
kvm_vcpu'
>>>>>>>> structure. Earlier than historical reasons, many kvm-related fun=
ction
>>>>>>>
>>>>>>> s/Earlier than/For/ ?
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>>>>>>>> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the=
 same time.
>>>>>>>> This patch does a unified cleanup of these remaining redundant p=
arameters.
>>>>>>>>
>>>>>>>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>>>>>>>> ---
>>>>>>>> =C2=A0=C2=A0 arch/s390/kvm/kvm-s390.c | 37 +++++++++++++++++++++=
+---------------
>>>>>>>> =C2=A0=C2=A0 1 file changed, 22 insertions(+), 15 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>>>>>>>> index e335a7e5ead7..d7bb2e7a07ff 100644
>>>>>>>> --- a/arch/s390/kvm/kvm-s390.c
>>>>>>>> +++ b/arch/s390/kvm/kvm-s390.c
>>>>>>>> @@ -4176,8 +4176,9 @@ static int __vcpu_run(struct kvm_vcpu *vcp=
u)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>>>>>>>> =C2=A0=C2=A0 }
>>>>>>>> =C2=A0=C2=A0 -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, =
struct kvm_run *kvm_run)
>>>>>>>> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>>>>>>>> =C2=A0=C2=A0 {
>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct kvm_run *kvm_run =3D vcpu->run;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct runtime_instr_cb *ri=
ccb;
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct gs_cb *gscb;
>>>>>>>> =C2=A0=C2=A0 @@ -4235,7 +4236,7 @@ static void sync_regs_fmt2(st=
ruct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(vcpu->arch.gs_enabled) {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 current->thread.gs_cb =3D (struct gs_cb *)
>>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &vcpu->run->s.regs.gscb;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &kvm_run->s.regs.gscb;
>>>>>>>
>>>>>>> Not sure if these changes (vcpu->run-> =3D> kvm_run->) are really=
 worth
>>>>>>> it. (It seems they amount to at least as much as the changes adve=
rtised
>>>>>>> in the patch description.)
>>>>>>>
>>>>>>> Other opinions?
>>>>>>
>>>>>> Agreed. It feels kind of random. Maybe just do the first line (mov=
e kvm_run from the
>>>>>> function parameter list into the variable declaration)? Not sure i=
f this is better.
>>>>>> =C2=A0=20
>>>>>
>>>>> There's more in this patch that I cut... but I think just moving
>>>>> kvm_run from the parameter list would be much less disruptive.
>>>>> =C2=A0=C2=A0=20
>>>>
>>>> I think there are two kinds of code(`vcpu->run->` and `kvm_run->`), =
but
>>>> there will be more disruptive, not less.
>>>
>>> I just fail to see the benefit; sure, kvm_run-> is convenient, but th=
e
>>> current code is just fine, and any rework should be balanced against
>>> the cost (e.g. cluttering git annotate).
>>>
>>
>> cluttering git annotate ? Does it mean Fix xxxx ("comment"). Is it pos=
sible to solve this problem by splitting this patch?
>=20
> No its about breaking git blame (and bugfix backports) for just a cosme=
tic improvement.

It could be slightly more than a cosmetic improvement (depending on the
smartness of the compiler): vcpu->run-> are two dereferences, while
kvm_run-> is only one dereference. So it could be slightly more compact
and faster code.

 Thomas


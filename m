Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998A228F70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:57:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNVp45YkzDqkR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBN424fXSzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XhBTf2Xl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBN4054f5z9sPB;
 Wed, 22 Jul 2020 14:37:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595392657;
 bh=fM9hNVHywyNvJcSx2b2kKXg/Co8o/eplCDBvPFYZHtQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XhBTf2XlQ0iKuM8F4btdqyKRiqoAh5JEXAa7jBHCsbdRy+4eTu6e1q8pe79E6XJki
 Q/TN5/ydocEu1m4EEoNgKUd9tAmOSQc4PPZwqW8+hv7gqp43NkdJyFTGCbS2Qr3I4c
 7EOxyaTD4uD64rfHgdlktQajoGg778+POQBDZx3Kt51EE5WFKL1m8RMWsk2At2aWRv
 8zdfQ68VjTdeSRmXrbleJrVQ+nQoCemYNme4b0WsUUz4wdTV7TvQLz0qCn9HjyeI01
 e32qYRMe6GOq9FEpD1zFcWKMxHXYgkgccgxJRnOxh+2UQQmU65uOxvbzpXLF+CoVgx
 UF9suj/wvmiYw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [v3 02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
In-Reply-To: <B83C440A-1AC4-4737-8AB1-EB9A6B8A474B@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1594996707-3727-3-git-send-email-atrajeev@linux.vnet.ibm.com>
 <20200721035420.GA3819606@thinks.paulus.ozlabs.org>
 <B83C440A-1AC4-4737-8AB1-EB9A6B8A474B@linux.vnet.ibm.com>
Date: Wed, 22 Jul 2020 14:37:35 +1000
Message-ID: <87y2ncqi5s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, Michael Neuling <mikey@neuling.org>,
 maddy@linux.vnet.ibm.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 svaidyan@in.ibm.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 21-Jul-2020, at 9:24 AM, Paul Mackerras <paulus@ozlabs.org> wrote:
>> On Fri, Jul 17, 2020 at 10:38:14AM -0400, Athira Rajeev wrote:
>>> Currently `kvm_vcpu_arch` stores all Monitor Mode Control registers
>>> in a flat array in order: mmcr0, mmcr1, mmcra, mmcr2, mmcrs
>>> Split this to give mmcra and mmcrs its own entries in vcpu and
>>> use a flat array for mmcr0 to mmcr2. This patch implements this
>>> cleanup to make code easier to read.
>>=20
>> Changing the way KVM stores these values internally is fine, but
>> changing the user ABI is not.  This part:
>>=20
>>> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include=
/uapi/asm/kvm.h
>>> index 264e266..e55d847 100644
>>> --- a/arch/powerpc/include/uapi/asm/kvm.h
>>> +++ b/arch/powerpc/include/uapi/asm/kvm.h
>>> @@ -510,8 +510,8 @@ struct kvm_ppc_cpu_char {
>>>=20
>>> #define KVM_REG_PPC_MMCR0	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x10)
>>> #define KVM_REG_PPC_MMCR1	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x11)
>>> -#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>>> -#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>>> +#define KVM_REG_PPC_MMCR2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x12)
>>> +#define KVM_REG_PPC_MMCRA	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0x13)
>>=20
>> means that existing userspace programs that used to work would now be
>> broken.  That is not acceptable (breaking the user ABI is only ever
>> acceptable with a very compelling reason).  So NAK to this part of the
>> patch.
>
> Hi Paul
>
> Thanks for checking the patch. I understood your point on user ABI breaka=
ge that this particular change can cause.
> I will retain original KVM_REG_PPC_MMCRA and KVM_REG_PPC_MMCR2 order in `=
kvm.h`
> And with that, additionally I will need below change ( on top of current =
patch ) for my clean up updates for kvm cpu MMCR to work,
> Because now mmcra and mmcrs will have its own entries in vcpu and is not =
part of the mmcr[] array
> Please suggest if this looks good

I did the same patch I think in my testing branch, it's here:

https://github.com/linuxppc/linux/commit/daea78154eff1b7e2f36be05a8f95feb5a=
588912


Can you please check that matches what you sent.

cheers

> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 3f90eee261fc..b10bb404f0d5 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1679,10 +1679,13 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu =
*vcpu, u64 id,
>         case KVM_REG_PPC_UAMOR:
>                 *val =3D get_reg_val(id, vcpu->arch.uamor);
>                 break;
> -       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
> +       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
>                 i =3D id - KVM_REG_PPC_MMCR0;
>                 *val =3D get_reg_val(id, vcpu->arch.mmcr[i]);
>                 break;
> +       case KVM_REG_PPC_MMCR2:
> +               *val =3D get_reg_val(id, vcpu->arch.mmcr[2]);
> +               break;
>         case KVM_REG_PPC_MMCRA:
>                 *val =3D get_reg_val(id, vcpu->arch.mmcra);
>                 break;
> @@ -1906,10 +1909,13 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu =
*vcpu, u64 id,
>         case KVM_REG_PPC_UAMOR:
>                 vcpu->arch.uamor =3D set_reg_val(id, *val);
>                 break;
> -       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR2:
> +       case KVM_REG_PPC_MMCR0 ... KVM_REG_PPC_MMCR1:
>                 i =3D id - KVM_REG_PPC_MMCR0;
>                 vcpu->arch.mmcr[i] =3D set_reg_val(id, *val);
>                 break;
> +       case KVM_REG_PPC_MMCR2:
> +               vcpu->arch.mmcr[2] =3D set_reg_val(id, *val);
> +               break;
>         case KVM_REG_PPC_MMCRA:
>                 vcpu->arch.mmcra =3D set_reg_val(id, *val);
>                 break;
> =E2=80=94
>
>
>>=20
>> Regards,
>> Paul.

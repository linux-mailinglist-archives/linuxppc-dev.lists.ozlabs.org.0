Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 884B72FC555
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 01:08:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL5Sp6WTgzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 11:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jdMFwPdl; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL5QB3hKczDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 11:05:34 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id s15so11494304plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 16:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EAdRD/xx+bAvooVg2g8XSDfPG9CYbvMEhwhjgESQ1qQ=;
 b=jdMFwPdlnyt0GrcsgV+KQE6Mg/B0XOZ3i6/2xOiFMps8/tfhaoWIHF2MqFGik2B+w4
 YHLWbPkjZ0s5se9AmCjkY8WME83/ZaKZrBFqgvJzh5uzNoZfr9/7Z1jQ/hhOCxG0eRiY
 qwmr/QPKCgJeBiGSA9QIPN/7sD8pxjPb3Dpz9XBkw26HV5hhHp6280PyFUHQcEtLwwtA
 HZwWehYoG6eOXl654rERnf/Tv0q4r7i82EhIbAntq7SpfA8d3lkohHRjpslF0gw6E4qv
 zAg1LMiN8cno1ee4ngFBv+wILAS997v1B+o2zcQeHXwI2Ypbz1JUa2j7rq3zUlO3ShjJ
 2nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EAdRD/xx+bAvooVg2g8XSDfPG9CYbvMEhwhjgESQ1qQ=;
 b=VF0YZuwc7ZOyVZbCZ91Sx6d1lgWKFaFs5mpVK9X6SdGNx+4XjPUgl1DrytNpeQvjDf
 /vqMToy2dN9aBWh14DnjTjXDTqsf9sNTj6ho+OlceAQ24OYm/JzNgS6S7vBciVkU2slm
 BSykAt6V4zj9KvlIsOJEdhCkuA7nirjx0er+aARMBbx3ab0EA7Lgb4sdvK2JX5U5sVF1
 W5jW/Z8OMwa95U0CcC/SaDj/g9D8T00VE3uaU5ZXDnK9qYmxiOaHyQERZXqObLYi0NC/
 1mCdAanc7xXzI//vTANCNVqNbQ2lke60boAtWJ/VmgIB6/WnXS5OgmcEFmfVMdReXLWC
 MGfA==
X-Gm-Message-State: AOAM533CSX3YuGn+Yx6jB/svJOZ87KWsoO9+he9uzbvfUp5gxw8auBsT
 ReE7lSngwvoodaYyAPJsR4Y=
X-Google-Smtp-Source: ABdhPJzD+c6uuZYhWBX2ucGwVR2Optt3mtSMiKgeLe5BvpvTWKTLnFou+/KA9464XWRs/6xKYsWD2w==
X-Received: by 2002:a17:90a:bd12:: with SMTP id
 y18mr2398382pjr.146.1611101127203; 
 Tue, 19 Jan 2021 16:05:27 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id j123sm238264pfg.36.2021.01.19.16.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 16:05:26 -0800 (PST)
Date: Wed, 20 Jan 2021 10:05:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV: Remove support for running HPT
 guest on RPT host without mixed mode support
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-2-npiggin@gmail.com> <87czy1bsvz.fsf@linux.ibm.com>
 <1611025782.s66bkxjtqz.astroid@bobo.none> <87a6t4bpp2.fsf@linux.ibm.com>
In-Reply-To: <87a6t4bpp2.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1611099866.a9bsenxeey.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of January 20, 2021 7:07 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Excerpts from Fabiano Rosas's message of January 19, 2021 11:46 am:
>>> Resending because the previous got spam-filtered:
>>>=20
>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>=20
>>>> This reverts much of commit c01015091a770 ("KVM: PPC: Book3S HV: Run H=
PT
>>>> guests on POWER9 radix hosts"), which was required to run HPT guests o=
n
>>>> RPT hosts on early POWER9 CPUs without support for "mixed mode", which
>>>> meant the host could not run with MMU on while guests were running.
>>>>
>>>> This code has some corner case bugs, e.g., when the guest hits a machi=
ne
>>>> check or HMI the primary locks up waiting for secondaries to switch LP=
CR
>>>> to host, which they never do. This could all be fixed in software, but
>>>> most CPUs in production have mixed mode support, and those that don't
>>>> are believed to be all in installations that don't use this capability=
.
>>>> So simplify things and remove support.
>>>=20
>>> With this patch in a DD2.1 machine + indep_threads_mode=3DN +
>>> disable_radix, QEMU aborts and dumps registers, is that intended?
>>
>> Yes. That configuration is hanging handling MCEs in the guest with some=20
>> threads waiting forever to synchronize. Paul suggested it was never a
>> supported configuration so we might just remove it.
>>
>=20
> OK, so:
>=20
> Tested-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20
>>> Could we use the 'no_mixing_hpt_and_radix' logic in check_extension to
>>> advertise only KVM_CAP_PPC_MMU_RADIX to the guest via OV5 so it doesn't
>>> try to run hash?
>>>=20
>>> For instance, if I hack QEMU's 'spapr_dt_ov5_platform_support' from
>>> OV5_MMU_BOTH to OV5_MMU_RADIX_300 then it boots succesfuly, but the
>>> guest turns into radix, due to this code in prom_init:
>>>=20
>>> prom_parse_mmu_model:
>>>=20
>>> case OV5_FEAT(OV5_MMU_RADIX): /* Only Radix */
>>> 	prom_debug("MMU - radix only\n");
>>> 	if (prom_radix_disable) {
>>> 		/*
>>> 		 * If we __have__ to do radix, we're better off ignoring
>>> 		 * the command line rather than not booting.
>>> 		 */
>>> 		prom_printf("WARNING: Ignoring cmdline option disable_radix\n");
>>> 	}
>>> 	support->radix_mmu =3D true;
>>> 	break;
>>>=20
>>> It seems we could explicitly say that the host does not support hash an=
d
>>> that would align with the above code.
>>
>> I'm not sure, sounds like you could, on the other hand these aborts seem=
=20
>> like the prefered failure mode for these kinds of configuration issues,=20
>> I don't know what the policy is, is reverting back to radix acceptable?
>>
>=20
> Yeah, I couldn't find documentation about why we're reverting back to
> radix. I personally dislike it, but there is already a precedent so I'm
> not sure. A radix guest on a hash host does the same transparent
> conversion AFAICT.
>=20
> But despite that, this patch removes support for hash MMU in this
> particular scenario. I don't see why continuing to tell the guest we
> support hash.
>=20
> Anyway, here's a patch if you decide to go that way (tested w/ DD2.1 &
> 2.3 machines):

Thanks, I don't mind it, have to see if the maintainer will take it :)

You could add a small changelog / SOB and I could putit after my patch?

>=20
> ---
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index 0a056c64c317b..53743555676d6 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -314,6 +314,7 @@ struct kvmppc_ops {
>  			      int size);
>  	int (*enable_svm)(struct kvm *kvm);
>  	int (*svm_off)(struct kvm *kvm);
> +	bool (*hash_possible)(void);
>  };
> =20
>  extern struct kvmppc_ops *kvmppc_hv_ops;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6f612d240392f..2d1e8aba22b85 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5599,6 +5599,15 @@ static int kvmhv_svm_off(struct kvm *kvm)
>  	return ret;
>  }
> =20
> +static bool kvmppc_hash_possible(void)
> +{
> +	if (radix_enabled() && no_mixing_hpt_and_radix)
> +		return false;
> +
> +	return cpu_has_feature(CPU_FTR_ARCH_300) &&
> +		cpu_has_feature(CPU_FTR_HVMODE);
> +}

Just be careful, it's hash_v3 specifically. Either make this return true=20
for arch < 300 add the ARCH_300 check in the ioctl, or rename to include
v3.

> +
>  static struct kvmppc_ops kvm_ops_hv =3D {
>  	.get_sregs =3D kvm_arch_vcpu_ioctl_get_sregs_hv,
>  	.set_sregs =3D kvm_arch_vcpu_ioctl_set_sregs_hv,
> @@ -5642,6 +5651,7 @@ static struct kvmppc_ops kvm_ops_hv =3D {
>  	.store_to_eaddr =3D kvmhv_store_to_eaddr,
>  	.enable_svm =3D kvmhv_enable_svm,
>  	.svm_off =3D kvmhv_svm_off,
> +	.hash_possible =3D kvmppc_hash_possible,
>  };
> =20

How about adding an op which can check extensions? It could return false
if it wasn't checked and so default to the generic checks in=20
kvm_vm_ioctl_check_extension, and take a pointer to 'r' to set.

>  static int kvm_init_subcore_bitmap(void)
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index cf52d26f49cd7..99ced6c570e74 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -611,8 +611,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		r =3D !!(hv_enabled && radix_enabled());
>  		break;
>  	case KVM_CAP_PPC_MMU_HASH_V3:
> -		r =3D !!(hv_enabled && cpu_has_feature(CPU_FTR_ARCH_300) &&
> -		       cpu_has_feature(CPU_FTR_HVMODE));
> +		r =3D !!(hv_enabled && kvmppc_hv_ops->hash_possible());
>  		break;
>  	case KVM_CAP_PPC_NESTED_HV:
>  		r =3D !!(hv_enabled && kvmppc_hv_ops->enable_nested &&

Thanks,
Nick

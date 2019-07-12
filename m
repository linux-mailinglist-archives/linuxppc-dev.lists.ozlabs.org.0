Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8676630B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 02:48:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lDnZ4d01zDqkf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 10:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4w1WDOM"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lDlf0MGGzDqjL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 10:47:09 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id q4so3715372pgj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 17:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=ApgH42BvCMHs6fla7nD/+LjDBy1laEf6HWPVLJtJAXM=;
 b=N4w1WDOM1vrYqEmziIFkSwhbKYR/6g6NZ03mFqRMAGOnMLRJDsE4vY/y9OTS8ViDL6
 +eIIwn8spYqthZGi2+6ZvnX5ReLK8hC2Ajo4alMAFikERGTNHNsBz0mWN1CBVLNtls1L
 Ue/xvpkT72Z264iMVZ+4/pXxbwQWeXnExCcNai0JJmOgwZa5EP8fknBteQ8m/3iWWr8A
 rIJUphYLWeI4YHqUxCSO8rXlTJS32tVuAe8du1iiGSsSinlNxFQ3xWEn9lfg8Y/pNc4m
 8svEvTnESb3tBC4RZuY1h9XPs0cu/TTRlrlQ733nGi612uiIb8sNpmo11evo/o4B6ebM
 09QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=ApgH42BvCMHs6fla7nD/+LjDBy1laEf6HWPVLJtJAXM=;
 b=UreAMEst1VtvXM6Bl2PQ0p+LlgdJUK7u1iPJeuR1l6j9bOAz/fPaui4xXchy9gnPTt
 6RhV4LG8v6I6q+S5Pn+JknM9hTu+Huo66E+o5hViA+kVrARzhtnqxm0TE6wwkG0neNyK
 3UV1z3gFSWeTRjJZWHRVigNxTiOVuXI+70yD87VNkWtlqZbZr8LKMwNyGyFvr6DXsGT0
 IjB8NZGi4XndQZ76z362cXV4u00ZZ+lC1xd3VulbYiUeJVjqkXtXImNoTz7s86kny51V
 0kt/9oCizwmmX5/27XVw8OkbhW2E8xWQVNbrHgGJ9E1Vdm7FWQwQ+N4q+BUV8KoNG3Cm
 FW9Q==
X-Gm-Message-State: APjAAAWLMDgx4ZpcMuMC22MPxOr84Ouxk8jrFkVYO/t3zHuTJzzDzH5m
 g5eS4yU4IBePeJw9uAFBIG0=
X-Google-Smtp-Source: APXvYqxvpVs+4QRWf/+RIEogKeK2XVevNETFgAR3ZNw5wZl1YoSjRagx9gIgkehB66VS3kxpHMPACw==
X-Received: by 2002:a17:90a:8c0c:: with SMTP id
 a12mr8081403pjo.67.1562892426408; 
 Thu, 11 Jul 2019 17:47:06 -0700 (PDT)
Received: from localhost ([220.240.228.224])
 by smtp.gmail.com with ESMTPSA id b37sm13568204pjc.15.2019.07.11.17.47.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 17:47:05 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:43:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/book3s/mm: Update Oops message to print the
 correct translation in use
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
References: <20190711145814.17970-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190711145814.17970-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562892218.adqan4059o.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on July 12, 2019 12:58 am:
> Avoids confusion when printing Oops message like below
>=20
>  Faulting instruction address: 0xc00000000008bdb4
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerN=
V
>=20
> This was because we never clear the MMU_FTR_HPTE_TABLE feature flag
> even if we run with radix translation. It was discussed that we should
> look at this feature flag as an indication of the capability to run
> hash translation and we should not clear the flag even if we run in
> radix translation. All the code paths check for radix_enabled() check and
> if found true consider we are running with radix translation. Follow the
> same sequence for finding the MMU translation string to be used in Oops
> message.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>=20
> Changes from V1:
> * Don't clear the HPTE feature flag.

Thanks,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>=20
>  arch/powerpc/kernel/traps.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 11caa0291254..b181d6860f28 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -250,15 +250,22 @@ static void oops_end(unsigned long flags, struct pt=
_regs *regs,
>  }
>  NOKPROBE_SYMBOL(oops_end);
> =20
> +static char *get_mmu_str(void)
> +{
> +	if (early_radix_enabled())
> +		return " MMU=3DRadix";
> +	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +		return " MMU=3DHash";
> +	return "";
> +}
> +
>  static int __die(const char *str, struct pt_regs *regs, long err)
>  {
>  	printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
> =20
> -	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s%s %s\n",
> +	printk("%s PAGE_SIZE=3D%luK%s%s%s%s%s%s %s\n",
>  	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
> -	       PAGE_SIZE / 1024,
> -	       early_radix_enabled() ? " MMU=3DRadix" : "",
> -	       early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ? " MMU=3DHash" : "",
> +	       PAGE_SIZE / 1024, get_mmu_str(),
>  	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=3D" __stringify(NR_CPUS)) : =
"",
> --=20
> 2.21.0
>=20
>=20
=

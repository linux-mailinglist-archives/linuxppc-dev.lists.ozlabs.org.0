Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC4572D86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 07:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjRNH3KsGz3c56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 15:42:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NzJ9LP27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NzJ9LP27;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjRMc6fcgz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 15:42:03 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id f11so8652510pgj.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=D1eyXWGfrtKoqcwpD4JBAVRvmr9oj1kno8BLB1a2R+0=;
        b=NzJ9LP27CPuZBTaLpLM6+buL+Ofdhmu/Z/74sx0DSVcMRirn8JRayXx8kvR02qpY8k
         Olx5U1lhvn/D05L4dD5D1ihGhTB/9vrX7Tp3EOnaOOx6miXeb8MmBqvrTltVAr4q+e/n
         8KSFXNssk1pku+5tWn9JFujkoVtsoAEB2KAz0QSAWRzFKh4x6T4vsh+/0Ao3nvLDxQ43
         51gqJ9Fwa9ysXWD9EMMx7Fx7/w8ULT6SRT+eLY/XVMTGoJNeIcX8utSM8YUlgGF1RWGW
         8JMExQjqqNmiuOmQN9qRSqnJubyi+OOm73/hOiBBBVBRlJ0s2E0ffbqehIRYlOVHgrSg
         +ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=D1eyXWGfrtKoqcwpD4JBAVRvmr9oj1kno8BLB1a2R+0=;
        b=qW5RfeCzjs36wv3xp6RYBZQ189KZxdgeD90zp1lh+w/6Jz8k/LGBzDgnvr8Burt1mf
         cdoDkkUh9l/s5Ofcp4oee+b4elldxvJCkKkXe7TY3YFsVOd3WmjCMNfMGnhEBLf66zuL
         kyo78gO/NS3Amj28kzSOTTl257o9NsDYomcZ2fHeIs+k205PNKJ5bClJh1uPPJ1C+1O+
         pMgxGOz744Ziv5pbNMOV1nlqnEwBEYj0CpvtHbvNmjWKT2ia26DQeoMgKb2cSXR97N0A
         1rfBrfv4MlhvuMffyt2Ohqx+jHCspfzcu1l//kQZmFpfgoTSviNIwXS6N64yahDAul9b
         t4Eg==
X-Gm-Message-State: AJIora8/OXQ0js4682wK7soCMR/issVk9d7cPnQKJ0pRn3oRU3B8XyUE
	ISedcvXzgysfIr9RvDhSRduSG6mYLjY=
X-Google-Smtp-Source: AGRyM1u/kcYZa+VlaJMGZutcbYSOnSI5NO6SSDa+SgKybG83yPTSNAJvYhC8gL5nO9TJ71MPJF8t9w==
X-Received: by 2002:a05:6a00:134c:b0:52a:c52f:b339 with SMTP id k12-20020a056a00134c00b0052ac52fb339mr1742576pfu.32.1657690920939;
        Tue, 12 Jul 2022 22:42:00 -0700 (PDT)
Received: from localhost (193-116-203-247.tpgi.com.au. [193.116.203.247])
        by smtp.gmail.com with ESMTPSA id md14-20020a17090b23ce00b001ef7bcb7e61sm597654pjb.47.2022.07.12.22.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:42:00 -0700 (PDT)
Date: Wed, 13 Jul 2022 15:41:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/kvm: Move pmu code in kvm folder to separate
 file for power9 and later platforms
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au
References: <20220711034927.213192-1-kjain@linux.ibm.com>
In-Reply-To: <20220711034927.213192-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1657690385.27p62dp0u2.astroid@bobo.none>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Kajol Jain's message of July 11, 2022 1:49 pm:
> File book3s_hv_p9_entry.c in powerpc/kvm folder consists of functions
> like freeze_pmu, switch_pmu_to_guest and switch_pmu_to_host which are
> specific to Performance Monitoring Unit(PMU) for power9 and later
> platforms.
>=20
> For better maintenance, moving pmu related code from
> book3s_hv_p9_entry.c to a new file called book3s_hv_p9_perf.c,
> without any logic change.
> Also make corresponding changes in the Makefile to include
> book3s_hv_p9_perf.c during compilation.


> +
> +	if (ppc_get_pmu_inuse()) {
> +		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
> +		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
> +		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
> +		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
> +		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
> +		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
> +		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
> +		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
> +		mtspr(SPRN_SDAR, host_os_sprs->sdar);
> +		mtspr(SPRN_SIAR, host_os_sprs->siar);
> +		mtspr(SPRN_SIER, host_os_sprs->sier1);
> +
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
> +			mtspr(SPRN_SIER2, host_os_sprs->sier2);
> +			mtspr(SPRN_SIER3, host_os_sprs->sier3);
> +		}
> +
> +		/* Set MMCRA then MMCR0 last */
> +		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
> +		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
> +		isync();
> +	}
> +}
> +EXPORT_SYMBOL_GPL(switch_pmu_to_host);
>=20

I'm still thinking these parts of the code in particular that do the=20
host PMU save/restore could be handled by calls into perf subsystem.  In=20
some cases it doesn't need to save SPRs because it can recreate them or=20
is not using them. Maybe it's not so simple.

Either way, I'm fine with this move to stat with.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

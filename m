Return-Path: <linuxppc-dev+bounces-5433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B0A176E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 06:20:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcbBh6qD6z2yNn;
	Tue, 21 Jan 2025 16:20:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737436828;
	cv=none; b=VnWUFc3WzTQzjORghJuNpkuo2xMdEpmoVR4EHxOBkS53i/AlhZIqn0mHley2K6xFxeDN4UXejk6u0zfvldZOG3qqYcC7sNBzAkHUxaiJgo9e4wUFaemEV+I50igjkKDHCGvNrmZOvf2zDg0MjcMyRxEWKELhZYjhkIObEr14P1dM3El6pLkNvJNBguUHY6Xea860NRMrfdRppVmSFc+9Q4jYKzVhsQmmGg043IHL9ycBi+1X8aj9i28hzZkWxT0RZmYXOifmx78DmgoyCOsUeJ+rfd/7aacPW1hJhAq8z7ODrb3nHIYZyofxKrLp7io3fHjtJJ5fmcfDu3X3bKCcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737436828; c=relaxed/relaxed;
	bh=IECYlM40D+zruDOMOUzD+1MoRjtsBCDwEaB3RwH3myQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FHzy5uIj1zKKibiUtMl1EpqAGsjTk7MFjZx7Lt0BbC7jqk9HRpFJsSVxUDp3VZ+Lre3KXeM3L4UbJUiBQctlwmo8Lszw2JJiXGNP/tYvpQ9vMzRmTRhkPx932JzyQ65lYb1/ttu/7AtJ9/m5sPiI0S4/xs9fVDwQSb10FDFo4YyWcQ8cRttkH5EjRHmLiKm3z7RT48cDOH8c8ZpLdayr1K/l5Q14qQ2TK32TZ3SB/ms/H4PZJs0XObArTFQTEKzetBElQE1qDgvAIwGb1f8hnFYotrq2ar3BdMCh4lVqUqYkPIBByGmB9CfNxypYjmlFHD5rFK2VPzfx6tziT9ctjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JImzJtp1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JImzJtp1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcbBg1ms5z2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 16:20:26 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so6962651a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 21:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737436824; x=1738041624; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECYlM40D+zruDOMOUzD+1MoRjtsBCDwEaB3RwH3myQ=;
        b=JImzJtp1IRaaa7PZETr1taW8M3UgVMe9JWjpCidV3hWGK4l5b6LYyAedWjEj4k2cVo
         tDQ54Um4SVU1eJgqs0hwWFvrx07L1e+0dAF61WB/vy5XnwfhqWeUu0t7ugV5PcdywUR8
         VLBEvGLz5AgnnNe2FKvTddsd6NOvF4qG3hyrh5yDwo4wQD3IVPtNP8B8FkJcXjSs9/fy
         YlaorEe7+P8P7ePzljLqVV/22ryv8SpG4Qh4UQJSCY2fz5b9OHmCs4Hb8QfwiR4enjiB
         CNi8GH8oXdV/ZJaWZniWVSZUyhyNH/XkoH//qfYOPZ5GKF1RxQuZAVsAHwJmfiC15O2y
         0SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737436824; x=1738041624;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IECYlM40D+zruDOMOUzD+1MoRjtsBCDwEaB3RwH3myQ=;
        b=eZv5WMDyGS43PYY2yTomZTc6gSQZ0vptObEOr8VClLovj67n4gyLdOLvGreh4GoUUj
         Stm1SUuq6v7CkQUvu8KACkgFcDwlK2Cvl+Z/1xg3NVOGoXJ+/HXWgJTmsH8URCwaPKOF
         aA47SRmkVDQMpNI7GLIJ4dRcOtfgziOM8co0Lpwg4dINjyMmQooDMqIoNT9NzoBjCJWf
         OBrh2DKVwrGgaqJRvCZzWmUDNvrhlP540O/K9nczCwaPKkPuJJ4eMiNhJ/a3OgcIVmd4
         IrLVvPuWcVJU/B6pmkc+43qzE5oBL859ulg95u8MWR7oU3wu6o4Hfff404Sws+KcjuOm
         6P4w==
X-Forwarded-Encrypted: i=1; AJvYcCX1TGumhBxXtGN5pbnR8PPCfh4XErmAGySdNs+lrX/xG84RcpAGDFaidyI1D3+gOOf0yKwX4ebi2YfYQD0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxVNLinFH8M/wWbDlyLD31xj+G8O2czsfsWU/78rHM8DckRYEF
	Kdr5wN9qzwlvt45UySiyjnhqEXGjuQv415ScgHl88YCBRUJ4TME9
X-Gm-Gg: ASbGncsQ2W/Kt7uzqRi7N4I83kzm4L86DT3mtYjs4FuB9qScK2ppXg5QcPMaK5YWc//
	J+CmzZ8IdkuNWwjFwEpingWbAmAmAE6bddczidHEmECEaY8uPHL33FXR4NEJaXjBuG93khYonoo
	hmnlxUL3p4W5hvQiiAZB457111Bh9JfYaZwMbmfsnNUOW5CZqj21aqMnbDfU57maYZ3D7PQDNEd
	wMvhbU6bi0ApZrany//0+Z215ckNOeLj0BOKhtulOfjb9R5w4UV75Ho6IX3zEuh
X-Google-Smtp-Source: AGHT+IGa3qnJZ7ymaxLp0C027bTDyMwNmCEpA39KybaLiQC4CMLlAIO95Bkd2Ge8d/PPw9qHJOVgMQ==
X-Received: by 2002:a17:90b:3503:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f782d7ff77mr21978137a91.29.1737436823682;
        Mon, 20 Jan 2025 21:20:23 -0800 (PST)
Received: from localhost ([138.44.251.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c2bb332sm13067266a91.36.2025.01.20.21.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 21:20:23 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 15:20:17 +1000
Message-Id: <D77HY793RN09.1HTCXBIUXFKSI@gmail.com>
Cc: <seanjc@google.com>, <linuxppc-dev@lists.ozlabs.org>,
 <regressions@lists.linux.dev>, "Christian Zigotzky"
 <chzigotzky@xenosoft.de>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/5] KVM: e500: always restore irqs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paolo Bonzini" <pbonzini@redhat.com>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>
X-Mailer: aerc 0.19.0
References: <20250112095527.434998-1-pbonzini@redhat.com>
 <20250112095527.434998-2-pbonzini@redhat.com>
In-Reply-To: <20250112095527.434998-2-pbonzini@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun Jan 12, 2025 at 7:55 PM AEST, Paolo Bonzini wrote:
> If find_linux_pte fails, IRQs will not be restored.  This is unlikely
> to happen in practice since it would have been reported as hanging
> hosts, but it should of course be fixed anyway.
>
> Cc: stable@vger.kernel.org
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu=
_host.c
> index e5a145b578a4..6824e8139801 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -479,7 +479,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmpp=
c_vcpu_e500 *vcpu_e500,
>  		if (pte_present(pte)) {
>  			wimg =3D (pte_val(pte) >> PTE_WIMGE_SHIFT) &
>  				MAS2_WIMGE_MASK;
> -			local_irq_restore(flags);
>  		} else {
>  			local_irq_restore(flags);
>  			pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
> @@ -488,8 +487,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmpp=
c_vcpu_e500 *vcpu_e500,
>  			goto out;
>  		}
>  	}
> +	local_irq_restore(flags);
> +
>  	writable =3D kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
> -
>  	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
>  				ref, gvaddr, stlbe);
> =20



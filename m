Return-Path: <linuxppc-dev+bounces-1669-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09A98896E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 19:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFcFF2BsGz3cGY;
	Sat, 28 Sep 2024 03:01:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727456497;
	cv=none; b=SnFSvLUKzuGVeFjdTmJ1+zicBWfPOKDSemkl4dYMHv8QJ5XFKFXteXObZTDky1PNq7snnQdXWR8BBBsZFG+PQea4OkTsGi40NGA6j/UyjR3P2oKDk2Nf5mYEbBiJ6f3md342369zK0rO0ig9UYdJQsrP6R39SvhwhbjF8HUAPYTR0Qo1ZkLHVeh5h0wN7g9DLMUvPHoAN1MX40GWCIcw3LfG1kJsuO2481RG4i+mvw8fJVyq2s6dKsmTtu8unAqisNc4kq2kj6zkDs3j0pUdeYo52F4ZLJmZj1+tc9AvXe/cwR4TuUa+40rzVIiaZZdAlpPD/ESfbwHpDLHN+B9u3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727456497; c=relaxed/relaxed;
	bh=0e/LXRDatzR1ko5dqutMPc7tTkgrpupuki1OBNWU17U=;
	h=From:To:Subject:In-Reply-To:Date:Message-ID:References; b=jtWfGp0lgNEK8RCw4LBgeQ+7kx+M8w0kCAx/Dbw42aPhV/kbI2Xr+ibpGnTxrxXQ8ELLAsui6YPialFSEQltkbXnqmooJRiabfn7ueKBu7OiNF/4kj1I6i/1+BQeOpX9vrMyEK8pBcooYx6NMCZrESlYRYMD8BqCitEn0RyGEdCqjOms02xDgE0Bwpu+zVgwdhP0cbcZBXlumn/8LvfRrAOn+iiOLXsbZpU5EeoU73mJMjgtrpQWRZ3jhFySBBGw8YIpWU3iJIO2969qOvoPTmSm9JsDx4Xb8VCeaxynaQ+ZAI4F6i/AklHxXG5ueZqEexRyGaEf+i7scBbBzAUWOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YjzEu17h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YjzEu17h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFcFD5KZzz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 03:01:36 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-718d606726cso1759802b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727456493; x=1728061293; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0e/LXRDatzR1ko5dqutMPc7tTkgrpupuki1OBNWU17U=;
        b=YjzEu17hENIniCgbaM5aogSiaRSnHEErY6cwvdF6fQdI67txFhGF/7zXY4un+wCeFD
         vGvy/aqMJnBR3NB4LvreH0vw7bxfcM2feQnxZSuJ8hRdTNer+ypUKu4u5WZPagSao6iv
         BpItYKpJm4K7px0wOIiIH5fEyqs+avBMR2G04+q+Uh7RaHFj4R3rxDFWKm/2WJTSgzgf
         atgq4O3RM4MI4x/4Fu5/nZrcO4veUGa5qbpuS/899/B41LeQY37VrgrkVZeJpjh6ZHcq
         FYX/F51x4IiYx6BYfJwc6JiTH0Yuc35FvcJ8Ppjo1agnpPkun6ct2bHURdAW6Ge9M/WS
         LF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727456493; x=1728061293;
        h=references:message-id:date:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e/LXRDatzR1ko5dqutMPc7tTkgrpupuki1OBNWU17U=;
        b=dpFQqcA1oqQeY0DlcNPNEj6se9AWFqpmJBsSE+PMteHmVCyzRnZAAeQCIj9ldgDjx4
         A7KrbT6zuuA91MiFguvTevUXtggPhMp8cN9vX3t+YrHzDGQ07SxSam8SD3mmLWLKH/Fh
         YhYQbygU+KmbGc+P5I9mgQPXDHQACe4MiutFqjEGQhVXdFicCXfKczOnxeAg6YHKVzP6
         YpvqdQT+3ZKuwyeSs98L6yLqDA+FDtauD4ZELIJ7aPaudDKUKoDNM/rwBQLkAKGM1Nh+
         xeB3txpaD308uJUeDYhjlT/9ozAigV7lJ/xdptdsAmcV68ipwADFgD+Kpdc7yvW74bxR
         /r7g==
X-Forwarded-Encrypted: i=1; AJvYcCVtVKMqE/Sn22GrFSlTArpuhzmYHdaica+C7zINuFqoQQ/SAAPRnW19XlFeoCoZTil1hFGzYFx/rDNj03Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa3nryJLLdsHqmTu7bgkweYqP2W168vnDiydq3vdaDdBOuS/O3
	n57OGGeYcyZ5mJqHp6ncVlJcSklmSDRM8F+LmUC3wRQXRp/HLt26
X-Google-Smtp-Source: AGHT+IG8JPYkmIGygGx7DzIdtslWIAQ+eYr4XQKWx2dNuwfUnD/ENoX2brDodsF7v6n1OqO5YT016A==
X-Received: by 2002:a05:6a00:2d11:b0:717:839c:6822 with SMTP id d2e1a72fcca58-71b2604d3dfmr6004694b3a.17.1727456493238;
        Fri, 27 Sep 2024 10:01:33 -0700 (PDT)
Received: from dw-tp ([171.76.86.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652bb5esm1878603b3a.175.2024.09.27.10.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 10:01:32 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Costa Shulyupin <costa.shul@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Costa Shulyupin <costa.shul@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/xive: Use cpumask_intersects()
In-Reply-To: <20240926092623.399577-2-costa.shul@redhat.com>
Date: Fri, 27 Sep 2024 22:14:54 +0530
Message-ID: <87ed55avw9.fsf@gmail.com>
References: <20240926092623.399577-2-costa.shul@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Costa Shulyupin <costa.shul@redhat.com> writes:

> Replace `cpumask_any_and(a, b) >= nr_cpu_ids`
> with the more readable `!cpumask_intersects(a, b)`.
>
> Comparison between cpumask_any_and() and cpumask_intersects()
>
> The cpumask_any_and() function expands using FIND_FIRST_BIT(),
> resulting in a loop that iterates through each bit of the bitmask:
>
> for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
> 	val = (FETCH);
> 	if (val) {
> 		sz = min(idx * BITS_PER_LONG + __ffs(MUNGE(val)), sz);
> 		break;
> 	}
> }
>
> The cpumask_intersects() function expands using __bitmap_intersects(),
> resulting in that the first loop iterates through each long word of the bitmask,
> and the second through each bit within a long word:
>
> unsigned int k, lim = bits/BITS_PER_LONG;
> for (k = 0; k < lim; ++k)
> 	if (bitmap1[k] & bitmap2[k])
> 		return true;
>
> if (bits % BITS_PER_LONG)
> 	if ((bitmap1[k] & bitmap2[k]) & BITMAP_LAST_WORD_MASK(bits))
> 		return true;
>
> Conclusion: cpumask_intersects() is at least as efficient as cpumask_any_and(),
> if not more so, as it typically performs fewer loops and comparisons.
>

I agree with the analysis in above. cpumask_any_and() has to get the
first set bit from the two cpumask for which it also does some
additional calculations like __ffs().

whereas cpumask_intersects() has to only check if any of the bits is set
hence does fewer operations.


Looks good to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.harjani@gmail.com>


> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
>
> ---
>
> v2: add comparison between cpumask_any_and() and cpumask_intersects()
>
> ---
>  arch/powerpc/sysdev/xive/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index fa01818c1972c..a6c388bdf5d08 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -726,7 +726,7 @@ static int xive_irq_set_affinity(struct irq_data *d,
>  	pr_debug("%s: irq %d/0x%x\n", __func__, d->irq, hw_irq);
>  
>  	/* Is this valid ? */
> -	if (cpumask_any_and(cpumask, cpu_online_mask) >= nr_cpu_ids)
> +	if (!cpumask_intersects(cpumask, cpu_online_mask))
>  		return -EINVAL;
>  
>  	/*
> -- 
> 2.45.0


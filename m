Return-Path: <linuxppc-dev+bounces-8630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BDABAABF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 16:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b062L4ZDmz2y8W;
	Sun, 18 May 2025 00:36:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747492570;
	cv=none; b=bKEBFv/n5T0P1be7zVS+55wU171bjDQefuum4PJhk/vAVTR8G4EgQia8lKEeLs1flHsiz+Do762qYH//pX9r9zq8Fk0kakC0P21ttGVcFLWj8KdaBCu/VXHc9LqvfZkQ1mL/xZlnlHaSv2QsCA0uysk2wAYRD1sh3UUD4PFzUo1jfCJIrUfLRlTqVqSLXnByddHb00BQGI8PPGaUR7n2e9Jd19V1lBtJFhMPTm83WggmIdOtWkWb1wlvz7ntHGKQWHmyXY+dJhFg+uMjPcUuxnV3mvgMrwjeHVL7mBnuAaX+JyzhNPH2G7HxzmET3wIWFumgKMNTQr7JtxoFOtmGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747492570; c=relaxed/relaxed;
	bh=qV/jfxSoj61KWz/2Bb//Agtf7zox03qaPOCEAGdJVD8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=HNbxaiTf67yNsQdcavAh608WnHtkhtFEJQGwNrtAuOJyUpn/7LA4UhOz1KrhT6udAFmmzYqFjZ8R5V/nc50N0eOnmlr0HhFAt/KQ7NxP8G7wrQ1ynawNlODMpKz3X47ViVBAyGuUx+dV0AoZdgexgPLums1e0TihC52IuaC1LN0vA/c5CraFWY4KhwEqRcHL1oBsGNhkh0PQ8qKfQajRUOa5926ahXs5dyRcGhIoX/hatd9EnFF6pg0Yx0pF1iJ3UrRUjlWlfcMxNt8zrFqUkmaf+SdEl8GxyaPI5F6DtvBGVNUSAenFy5DAzUs2B2hyqDiWW8BEl/xvN2UdHeqzGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kdfu7IIo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Kdfu7IIo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b062F13l6z2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 00:36:04 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30e8feb1886so1296902a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747492561; x=1748097361; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qV/jfxSoj61KWz/2Bb//Agtf7zox03qaPOCEAGdJVD8=;
        b=Kdfu7IIoX7bBxlXzGs2nBMN7LF8OrwxCCFRrm4D3+m6/pt5mqMscD0995kL9ghtBjo
         c5K2rKGUz0jdgxYBx5vEBSSjfmr6XV6gyMMbj1AukoKvTCxrgSELq04NGmq5cXmaE8r8
         tubfxUKMPQtiwQ7h6jTq3S5i+o6g6yYEiJ+xbGOOcMurghj+xidz70bzRBdWe63nyJ5q
         y/ZtlMyNh6ZsOateRHpamLWMLlmRvayDyA62kf203tES6fsczShekcW8UMasxLRly0t6
         MaKrjftyXq48QOWaEbtMuforzOMF4qsJhitzugUkJOiObEU6cGSsY8pOlwgB7jFZCkcJ
         tC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747492561; x=1748097361;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qV/jfxSoj61KWz/2Bb//Agtf7zox03qaPOCEAGdJVD8=;
        b=fD118c0It0wcKM8SLo6QJMK2YKSNWBFjP7m3e1F1wKZgP7VqsV793fW1uS9pqzqvmh
         KgHTT2ZaKO8OP6RTaru39lMNVSJ01ApB2FSKcnNp7WmUEwidunivfZnGD2+IFlMoLwrt
         d+NA6cmzqoEawCapfqY5tpGwxYgiYyWgAyusV/+V5ux1SN81sDhyRjXpjMYewgTXipPH
         eSxNjSYCmrogPFIX/76+6/hjwr1m9aQ2umbDIe1LS9K+7Erud/xQ1OJK66SbzOiRBYNq
         alHDvguurB2g+EDI7zgAfC7hPXC4jZwmxLhHd+PgKSEhxmByAGFX2OSI1RwPkxff3rhz
         1plQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0aUw2McrrtboChwOpArVRC+3ODynblPGaeVv3kmmwTvZ3uSxW82PWByMD1LOXN+r9ahqwHETVI6Cwjbs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjRGhTIZjLA8Hxf+LTS+PcYHOiu6kR6Oxi0He5EjleGmNRB393
	j8ve66NaqEauOZUDhJ/vXeTxNxRMduNauL+rT9lq6QlDuXnHVBZFm1iZ
X-Gm-Gg: ASbGncuvR47zHE+G/LlWMzC1cBTyCs/1PdCJmmsmcnRvzQfNcsvJ/zeubM6xHuEFPdv
	KECEjgUdr3V04vUEO4CiJC9QHogD0mOHIlhZd26UnsVUlOJmrBNW9RjeZGWaT2suZC69+KXM5qA
	r+v6W0RlpopYz4H/uYnAfrpH87Kphi7VQexoQmEchB+JQlQvWGeOxSc24lr8HV3nDw4H91f3vPJ
	tLk/gVayrANwt7IWhcpZdW1LTrKSneZvNQo1xNqojWQXwGLplEvGn4IthLy0yOAGS5pESfbjhqk
	o1UP5dP/ZijbjupSqUS3qDsnDocgURh80iHRmwHociM=
X-Google-Smtp-Source: AGHT+IFCb3hB4IltQOOTVX3h/Zp2WTvE+WkzHlCHvIBE65lixQQsd15bRFp9QEaVX6UHRy84bFqrNw==
X-Received: by 2002:a17:90b:4b0f:b0:2ee:c291:765a with SMTP id 98e67ed59e1d1-30e7d51ee10mr10484441a91.8.1747492561597;
        Sat, 17 May 2025 07:36:01 -0700 (PDT)
Received: from dw-tp ([171.76.82.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d4aa8a5sm3403372a91.26.2025.05.17.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 07:36:00 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Add H_VIRT mapping for tracing exits
In-Reply-To: <20250516121225.276466-1-gautam@linux.ibm.com>
Date: Sat, 17 May 2025 19:33:42 +0530
Message-ID: <87a57bwczl.fsf@gmail.com>
References: <20250516121225.276466-1-gautam@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> The macro kvm_trace_symbol_exit is used for providing the mappings
> for the trap vectors and their names. Add mapping for H_VIRT so that
> trap reason is displayed as string instead of a vector number when using
> the kvm_guest_exit tracepoint.
>

trace_kvm_guest_exit(vcpu) gets called on kvm exit and vcpu->arch.trap
carries the trap value whose values are defined in
arch/powerpc/include/asm/kvm_asm.h

i.e.
#define BOOK3S_INTERRUPT_H_VIRT		0xea0

kvm_trace_symbol_exit provides these mappings for book3s HV & PR.
The change looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/kvm/trace_book3s.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kvm/trace_book3s.h b/arch/powerpc/kvm/trace_book3s.h
> index 372a82fa2de3..9260ddbd557f 100644
> --- a/arch/powerpc/kvm/trace_book3s.h
> +++ b/arch/powerpc/kvm/trace_book3s.h
> @@ -25,6 +25,7 @@
>  	{0xe00, "H_DATA_STORAGE"}, \
>  	{0xe20, "H_INST_STORAGE"}, \
>  	{0xe40, "H_EMUL_ASSIST"}, \
> +	{0xea0, "H_VIRT"}, \
>  	{0xf00, "PERFMON"}, \
>  	{0xf20, "ALTIVEC"}, \
>  	{0xf40, "VSX"}
> --
> 2.49.0


Return-Path: <linuxppc-dev+bounces-13606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E10C22715
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 22:41:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyHcZ22wqz2yFy;
	Fri, 31 Oct 2025 08:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761860494;
	cv=none; b=QhlhC5V9N9rlhlRzp0wPajlxgdShnZoCRJ+BkXONo0al/oHAP7ptFD0gad37tIDv0Vw7xDOng39Sf8iUI7wNwGpYH4JlVDTSzWOcBEzLK+Tptdv7coTND/mMbzwzzsLhwMDZj8q0oAEk1JcgL86odFXoB4JcGfvq0RhRqq1aQ4vcy/Xfw2sOFbpQgFphPUqIse68lRmD93CHkofeka0S1ExWK7QnmgT99wb2SPe4QTWQHkDRyCyRriHKVJ4MtTD5+SPFno/E5z3loVYgN/0fugdGKsAWOyZl90UJFcaS6N1WTD+8RZP2XGvx0SXvpk3cxAkkyLPKsXkME6u9ERpR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761860494; c=relaxed/relaxed;
	bh=2XBvCSEn0ZeigCB7NPjyaiTdYT+8OHxru1xjOb5u250=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBXYJZwfL8sr5ji8IzXTHy3MK3XQlrG5/Pn0VVgThwqA656lns78A1zOHS1auK+Rn1yAz0rlBuXeDA2JNT8But6UkYUOGj+dUdWb1SAETFXa3t0lLR2td8S9aF+/zw7ccknuP1gf0ViD1w9YDhGtyiiywVcYhIkPQX5MuGWGPyCpwPpOpZp/4cg2T7Izf2Do+JUWI8VyonmH8M7nHE7PjhyeNkrE7vvHodmSopH4MNp5tCCZFB4qY9+ju0rI/lmmxbR6jjcghAeLLavad2s3EfMt3lxLPvckklcNUh+fjJ38j64EGRrXafA1wkHbk/9nB6G3oUKMBPbCduPHevtW+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAc4ve1G; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BAc4ve1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyHcX2StVz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 08:41:31 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4710665e7deso7554155e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860487; x=1762465287; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XBvCSEn0ZeigCB7NPjyaiTdYT+8OHxru1xjOb5u250=;
        b=BAc4ve1GWEiAh/MvB/hNUGIAr34txIhjn04TX3Cpctz6ovo/X4prf+HTLX5rkAd8VT
         07AB+FGh1W1EturlDuaaiOK7slRLZQXTjhvlVQPdOVp9oMP63rr1qj0DBywY1+tsB1su
         MKMAZwajneIOt8jtM2CB7OWYGITUAazn5WIZODnXIIAYJkNS4U7fdWccZJ/v83TypyLz
         GVCRaRXx7pqtzYWeGbnooY0J6LxHjA/0X+BX9Lw13SO4oW5IdGVGLAT9xx2yoKU2ximn
         LQfbO1d+A0TmxAVm41ACmfoUTVjcDQPnE9xTLNt+JHUzvuzw2JGw4AlzE/ci1UBC7FTo
         3ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860487; x=1762465287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XBvCSEn0ZeigCB7NPjyaiTdYT+8OHxru1xjOb5u250=;
        b=ly6atPzp5jP3dqaXwGSjRvLQ2aYVxEDcj8LSs0d1SMtWk6D7GfMnWIY5E0DxXTafFG
         beJoxm1quv2Ms+xDUWsx3kP7bswkHanIa7oT7v75BCJlO0l2ckC+Ga0DJ0mGZkVGkPus
         kUrmQeF3oAkXuIiqZSuYJi5FvnHLBzE5UjOo+n+1MwuVitvD+kMGSWOp9FM0WtlUZLBK
         D3jEX+dIPUr/UmtA+6e3o1Xt7hSAe8qGHxmHPyss3uTiIUNQuFd7bMfRUcIPhgo5IdMY
         SqN4WvoOOUYg+6YkXUAHXke2PnMhl6UscoOPT11vwB7v2btZ8gGUI+dbs4PtPc0viD0E
         5yuw==
X-Gm-Message-State: AOJu0Yxki4YuZ95zGS6ZsL3caCOc7LaxDlZjMwq4nBQ4xM4xGGUwJuXX
	dzgu0NG2LlNTz/hn0QGg9e8OmLWfEW7+OKAjY/kFtqtHXqhcussS5v1p
X-Gm-Gg: ASbGncuf9L9z/PesfzyNlCJ6IyWZSPqW5srVqJ/h/OTpinPvhTK7k/GLYSECSzXQimT
	zjNAoTjnjmYyiqVosRLKHFBym0hBC4wtrFtSaN/HrcrtFpn2LMuKJ8m7wibM3OBqkMQb4mdsMuo
	eKPVtnDDZPkk9qpHyqAY1B/PScexX24yBq+IPt2gy6b4WsLeD+M9Fw18i0p7ZNSoIJldShUaksb
	lRLlDR4YH4ut9HoVYYyNQmrh0PHH/6TbAIIR9p/qI5ERxrbJd+0AmI4DUvFq/7jt0MvLQzxZ/Px
	f14Bp92lSBgQW6btmbiVs/C6VSuhI14rHp11ItZDSMn1g+AyNnjN8CPaJA315YH0XwS3+6WIDCA
	gjfA384bnPFPVm6KNEuN8KsEuk1hyqv7G3kpvTfV9B5fgiKpsbsXC0ys3qi6Wfp4q7i/FVFraWy
	TJjDcQQGlCHMLgz8EDIE3SReFa0J5xzallwIarLUJI2A==
X-Google-Smtp-Source: AGHT+IF2+gC67dgVdnAW7HO5oobqLFRQy+U6kHEZPTDvGE8zU4sHMYcN9fuccg5Lwqg5j25NgQTe4w==
X-Received: by 2002:a05:600c:6215:b0:477:f1f:5c65 with SMTP id 5b1f17b1804b1-477308abf3dmr11142745e9.23.1761860486746;
        Thu, 30 Oct 2025 14:41:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm34210623f8f.4.2025.10.30.14.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:41:26 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:41:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Alexander Graf
 <agraf@suse.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment
 in kvmppc_kvm_pv()
Message-ID: <20251030214125.33379ed2@pumpkin>
In-Reply-To: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
References: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 30 Oct 2025 21:51:00 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Oct 2025 21:43:20 +0100
> Subject: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment in kvmppc_kvm_pv()
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/kvm/powerpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ba057171ebe..ae28447b3e04 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -216,8 +216,7 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
>  
>  			shared &= PAGE_MASK;
>  			shared |= vcpu->arch.magic_page_pa & 0xf000;
> -			new_shared = (void*)shared;
> -			memcpy(new_shared, old_shared, 0x1000);
> +			new_shared = memcpy(shared, old_shared, 0x1000);

Did you even try to compile this??

>  			vcpu->arch.shared = new_shared;
>  		}
>  #endif



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18F89B7A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 08:31:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rOGHk0mD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCfQ03QDCz3vYB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 16:31:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rOGHk0mD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCfPH4qMFz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 16:31:15 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516c403cc46so7203778e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Apr 2024 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712557871; x=1713162671; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FiTVZTYX0KeQgSiuUnwPMRri9NFK7ss97QqAH2vahM=;
        b=rOGHk0mDqh+sGCw4j0AliIF6ZhLfHeUAa7AJp4IVtIJbHKBlISIbKenq8CYeJVeieD
         GzQWxSPR2AbREz95PhtwtH5DB67rYfrL2CumfcYI330zyUe3g8EDBPAtHTSbC2gx27En
         ztw1m6KjsNjWvoM8yw+zAoCOoNbbQoGaiYgdsUtZmjiVwYhLKwDmVKD0YWtjPnWcBShe
         hsyFcn+r+/RKYZ5x4f5tWAWraZnTF3pFVfr7VYlP4csVvyJt6okqZmyzqtJRkFGH9H6U
         NtIZ1VSMeimzCDt4Z9MndvZrX9b+Ih5RQNl0btCmy+V0hbeGT8AJUBuuxWXiBSX9HoFr
         qXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557871; x=1713162671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FiTVZTYX0KeQgSiuUnwPMRri9NFK7ss97QqAH2vahM=;
        b=pKavkOq0d0zM7c+o46Np9tdaf5rRbbFAjn3Dfv7HezzehDXMfHN8Y7v8TEM8U+wFcK
         RRpdl2Q2uf+bYlwvcCw94+ed1zzDC4KKvZIYXFoluVb2EYwxN3h7KycWHuErGH7IFXE4
         T/jn8J/yVxyOv+V69Pg++njTr5Fnq2aIA7bg12SS/O/uXHMVPmH3i7vsk3dt8rIYFTcE
         cDXE3CO4dy8kxBjJvQhkKKr2b7/tK+XPYSwr7C4B+d0TDt+Eepi2qmmnhkcd655RqMCb
         eAuaDVbBCIiaUX+SSSO/jwtH9SzhJd8BX9TZ1pGGthqSnyMiG9tf5P4rajyAf4DQ9jnZ
         LITA==
X-Forwarded-Encrypted: i=1; AJvYcCX4JKP/C+YhhXq1te/4lbAlp3D0vl9EnFhsrkwPL3WxxCBpBEsy+xaliuYMtqFWHwsB9KsqA8bnas1hevIQXyg0jlI905uHluCZJLIHLA==
X-Gm-Message-State: AOJu0YzaTauUL6KHbTX4LN7duAoHpOB8sj3BWRDFm3c1R5pc1Cs4BK7Y
	VUxJEQdEL+jP2YMTEg4+Ke0dsrNiexDXB3UodDGBiNX/oJkNeW6glm//fOFpDrM=
X-Google-Smtp-Source: AGHT+IEA6kG/jLzxIs8qEGxEX4HFyMOSTK+qrw+cqbwmL3oOUtFSjPH+UfGHY26kn1STJDpLm0t9kA==
X-Received: by 2002:a05:6512:2387:b0:515:d176:dfd1 with SMTP id c7-20020a056512238700b00515d176dfd1mr8022020lfv.56.1712557871271;
        Sun, 07 Apr 2024 23:31:11 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id gs44-20020a1709072d2c00b00a46a27794f6sm3975527ejc.123.2024.04.07.23.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:31:10 -0700 (PDT)
Message-ID: <d1ad8803-16a9-4fd8-bc9c-8d38171a2554@linaro.org>
Date: Mon, 8 Apr 2024 08:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] KVM: remove unused argument of kvm_handle_hva_range()
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-3-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240405115815.3226315-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/4/24 13:58, Paolo Bonzini wrote:
> The only user was kvm_mmu_notifier_change_pte(), which is now gone.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   virt/kvm/kvm_main.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Return-Path: <linuxppc-dev+bounces-11458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A23B3B2C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 07:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCnfd5mBgz2xlQ;
	Fri, 29 Aug 2025 15:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756447193;
	cv=none; b=mJdTw3N2XecdnvqyZTD2Hex1V2QVsWgt3RZGYW8zX950Maa0xWr+wgVzeYOGRQjLmfeENnBIEZ/WbPFKfnc9sTtmwptxEpZ2u4uyZXFo3RE98WNlz2Lyh82MPavMP4N7fyItcftshcwNW2BX77i6FtjGp98SZ0TpW3m9BC5SleQJiXe+A4QfzRE4VFcgZ88QQukAqhOfEpH0j0Zm+XmxWwPd7jtcc6IsZf9+rO1Nztot5zeF+eFp4yo3rmECC2HOGKKeYzdD/p7T8ILe2bgCpqOd3WX9l1qWwRXXYcKTaLNGMPEWElRlC0WvhCwv1QS1S1sWOnU5F7WUcBjhG9dcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756447193; c=relaxed/relaxed;
	bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSuM3qwcxH4nNCKcpMrpK/jcu4YMYuVboWAxMVfsQboQ4viQ7otVGnEFeqK6hv+/QjWMikbaEJo41H/8f5MZ92N05H06BZbeKpfinMXpfAFvhBWPr5Dp8X2Ke7544J2oyb10GXMqortjPv8VraWsQju9HkHJiMDL/FI4fYfdnGKsp3LHnIBwNT2QyPPw2LqlCRpzreeBEsM1pLTim5O32i0zMeunhVda20hbKzfnxNl4hLGQCFTo17Eq1lK7Sve7d4NOteUYLlyX2S/flrVJM9dzSoQFNheEn7EoxM0kGCB6V+Yk8PZj8vgwHuhGv0w1ajfGZ3YiJSE652ZYHvJwPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GfXL+fD7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GfXL+fD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCnfc1cQnz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 15:59:51 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77201f3d389so1886700b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 22:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756447188; x=1757051988; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=GfXL+fD7myirxU1qOCom8e0DdHv43ZphptrIout1wkZ1DbvcYh/+CjYRUpj6TZ1ldr
         f6AKPVvm3DnN1OBJWs40xwZ6n99ald4O6Fh+p3w9I9TngudU9xsSKbg6rh6xoDKvez8l
         uSne9THFBhGvJwVb2ZkugBSa0V90QD/rvzNaOEwaq1hHv/xbGzZ1ZNcr3yM/mkNAaYb8
         tixa2Kl959YH98LSqJ5NGe6Na6cOk6mUdHCH6kdl+kXMFtoNW27uFgSV4mX3IajqdI/x
         4LKnEBDcoD1EnMRNsQOFXL7qqfvVtg8z/y3A5L2sgdRN6qzb1fvB4Ws2j2adTfBgPNia
         RdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756447188; x=1757051988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csp0y2UiuYBIoSGq3QglK9zewj1/hbg1F372AFvl94U=;
        b=kqMxHbkFr7eI5gXsxnEvW6mbGnI21T1/mDGjVL8b+oBF62fs26dHp2qexxfUv07BG+
         +3nXlYp6Kh0K5DFq5KM+3dBOvMVQZ6HMBXge4gvaJrVeNtUrRCjG2Jjb6SbvpGxM0hsc
         EyQOlX+WvxpoJ5OZrpB9/tz9T/BnAcaluiYE/YnJPqSJ3/szFhY/r42b528gR7RFZJPO
         W+/E1V0h529cn3wJkjc+caLb6TrfVwXw1BQV70DIlu8zVEECqaVo2IsSeyJeQDDtNYhS
         NjWw2FoP8ypWSgmljG5xSrqk4M727A2rcUficEViSvJY+h6YzfGtZ5x45J3wG5/M2dOd
         u00Q==
X-Forwarded-Encrypted: i=1; AJvYcCVH8En9BWlkS9XgFXzGtIg8oO5tPMNzzi+WnUrPlAo0703tPey++dAPEP1WL38XLzurAkaRSjmlyTk/TFk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEYXsOUp7nmvKPZSTf4dzSkym/uPwCVSylr+GwSjLaU/DsMBVV
	EOQzYGaZzVfmzSEGWWYsa9niHtAVMlnwc1xYDbrpEIsupgBSyxP4ohDlKSanSnsrInc=
X-Gm-Gg: ASbGncuXhsvJRWuJhN5l7CxhIZN9dy0ov8CHGW6VhXxNV4zlpEzZMHpMpUiHgIAFjth
	k9Vls1EVMVhLrbjsc+zdNqUNYzODQi360cihQ5dEs4AGNsoLn6bejN1uzjR0TI2JSYX7C2Ldbuk
	pFaWHIlIZVeW+r0ge9dSH9/APEYd8w2YbnCS1Q2/h4EqPdRVvLCyf2n0h24ROoCf2OrH88cqtcK
	jAsZqeqwPYwvAAuMrWnJP0O2Z+ZxJk8Xvk7B/PzYw2L7h3CspoSDP61igGmo/Afh+Oe511Cx4w8
	Knw5XfEbbkR/wmcjmrH+F7Zt5PfmsapKJ0/76LF432vstBuM61et0OnpoInCaO3u8mI9/fLBxhf
	TfirB2MHesc1Jp7jAxIUFtKTRXl+zm+/qdlQ=
X-Google-Smtp-Source: AGHT+IFsar3WOaSA9RKNM7TPFf9gG0iXTxdUF2CW8raU1SyelgEQswrlDbapLb2rA7PUFkb3M17NCQ==
X-Received: by 2002:a05:6a00:10d5:b0:772:2850:783d with SMTP id d2e1a72fcca58-772285079c4mr3285667b3a.22.1756447188084;
        Thu, 28 Aug 2025 22:59:48 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b14c1sm1263485b3a.31.2025.08.28.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:59:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:29:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827023202.10310-5-zhangzihuan@kylinos.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 27-08-25, 10:31, Zihuan Zhang wrote:
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh


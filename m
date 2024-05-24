Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id F1DDE8CE694
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 16:01:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R7PVz04a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm62y3RNSz797F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 23:54:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R7PVz04a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm62B6S5mz78JH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 23:53:22 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f693306b7cso3854402b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716558799; x=1717163599; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b0/TSFREZaBctG5vlYD0Hmuh0/DxJ4bPlmcsHcY/PdU=;
        b=R7PVz04aMbTtzXvK4AF8enjEt1/MWc7lziE6B3MxcOCHcPI/7ec05nCq6BLUb/ioeq
         sg0dvXj3YTQipZ+wlmsX9LIhFdK42eMdz1arfnM/IgnY0qzIK8pO5K39DFPpQGoIudip
         s25LiB5Nn80Xjs5DX92/NUJk93r84amLyw6+qRhMLOXrfhuOhnxjU+4MxxRPtj9FxoVX
         9ab6wXWH0+v8v1s1i+qgiE1uOos3dUyM1N6slhONMU2ooyxj/SRdLN6+lRfep6TqKfbi
         ZKKgbzMYt8Xsp5UrBhR/OSgjcpMryQCmF0L89ehL7RLLQblZishoqhhEhTLwcuyocp1U
         He4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716558799; x=1717163599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0/TSFREZaBctG5vlYD0Hmuh0/DxJ4bPlmcsHcY/PdU=;
        b=hysCgMCtSt3Rzm4tzbFt/29C/lLt8Mrkv1+skCcpRGhabnvzkDgXsH1CVY0cPD/pYN
         tqQKy1lKziRST33nOVbEk5GRjQPyoRgfyBbrW3/pywkHRAPbZirjCwdcPzKIL3clLWMt
         aUP6McWGw3UIrNWK/Rk+ivW+TZWxi23L9nyHjxbQ4ez2LGwdshbnE918TVDHdXPAJbh2
         Inhw4Lb5nlMRkSTEaDY3IUixzu6vXVjOv0NrbVigmSGjbK1uW7O7b4Kd7/eLR6iSRmTA
         wTe2hJNRl84A8N7ZF7gqvRSvjYZeqrJ+66XXgJDvPdX/kZ9SwaejofZfCT0Wjn25nP12
         mS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsaYQDUmo/wJd7gyd+3MiEpApsV018vNzV4TVcz0m73LQYKsEIUmE0xaR2n3sTIQf5VdBc14NX2HBnd3ArdCjtzRS90pN/Ix9MEwvFOw==
X-Gm-Message-State: AOJu0YwLkGHiPQMh8P/r6ncYh10LAo3UB05vwJzUVL+M+FY0BtqhArkT
	Zv1KzmM9HJwAaAKGVdRZGsuQ0LzZiPjJQjVKdTz0ZoB79M8TkOip
X-Google-Smtp-Source: AGHT+IH3aQaFlbwWMDNIYwkEtj6N6w858o4MAHD4uUjiZfFfdXxaGquXuXeOwr68wYrmKImdEsesTw==
X-Received: by 2002:a05:6a21:99a4:b0:1a9:c4ca:dc74 with SMTP id adf61e73a8af0-1b212ce1f54mr3260189637.5.1716558799320;
        Fri, 24 May 2024 06:53:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc057e52sm1127383b3a.57.2024.05.24.06.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 06:53:18 -0700 (PDT)
Message-ID: <91f8b384-9a6a-4435-9f9a-7a65a7c62bf2@roeck-us.net>
Date: Fri, 24 May 2024 06:53:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Deucher <alexdeucher@gmail.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
 <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
 <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/24 06:43, Guenter Roeck wrote:
> On 5/24/24 06:18, Alex Deucher wrote:
>> On Fri, May 24, 2024 at 9:17 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>>>
>>> On Fri, May 24, 2024 at 5:16 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
>>>>> Now that all previously-supported architectures select
>>>>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>>>>> of the existing list of architectures. It can also take advantage of the
>>>>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>>>>
>>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>>>
>>>> With this patch in the mainline kernel, I get the following build error
>>>> when trying to build powerpc:ppc32_allmodconfig.
>>>>
>>>> powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.o uses soft float
>>>> powerpc64-linux-ld: failed to merge target specific data of file drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>>>>
>>>> [ repeated many times ]
>>>>
>>>> The problem is no longer seen after reverting this patch.
>>>
>>> Should be fixed with this patch:
>>> https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b9433f842c879a20dc00f5b
>>> Will pull it into my -fixes branch.
>>>
>>
>> Nevermind, this is something else.
>>
> 
> Yes, CONFIG_DRM_AMD_DC_FP is enabled in that configuration.
> 

Also, the above patch does not apply upstream; the endif is already in
the correct place in the upstream kernel (though the commit introducing
it adds a blank line at the end of the file)

Guenter


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE750FD47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 14:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnhMV2sSbz3bd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 22:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GnbxG5lH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=bagasdotme@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GnbxG5lH; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnhLq6M15z2xm2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 22:40:49 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id b15so17855938pfm.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yD7e9mPWeNwo1vgL89bG3pSg2Dekc+TvmVsazxgc/xQ=;
 b=GnbxG5lHExJVNlDP+xzzDlUmG5m8kM2lnHSyteFhSHuHmpvLor+hykPvI88Ozca2bT
 VJsDsUomaDNoDRz/VtOzCjG/S91wN/bnLQU8ay8+PyylBsG0a0DoyukUNb3/ScorOh8E
 lvNdkOuaBkw48w94VH3S61M1BI0ruUpScv4/3bK0+55k1HhwfZC1sdGqEznzkYYu2e5y
 0TjpNn2RhmZKHJlDu4Qlc8ZprjifkOaqcCdteN9ZnRdKvkFtklPpU3i8p1syKgIU1bjB
 eVEDh8n9T3T8Fp8LX2Z/1S6VkrdAC9QTatPw6NZ/lXf2YVRUOwBrNp2flzFbpWTkFwgZ
 s7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yD7e9mPWeNwo1vgL89bG3pSg2Dekc+TvmVsazxgc/xQ=;
 b=ruVEBL7IDjEz31TjBHea6g9Pka0+eZR3leWYReAnPms41s49gFieF4b2ryAyCw/LtM
 fGt1+N0mGbpBgl1K6bxg6AeU84VS3TQ/3A5npqToSuJ4JXzTHhxpnrIyU53a7C5RSHgd
 41Yp1kcWE4WLCwCFJiOUYRsViq29kvKJF8yc7ZRAS3L+z03s40N5YnNEe+TjyoaKMoyf
 75TgDMPzHUOISHWGYw4FuyRxarU9Q3puD0N1PKLEtZuzOBmawLF3+qokrDfg8SxYqC/x
 BUG/LRu3EGWujWQtovJrE0Cu/97GYhB9gSSkU006/j0DF3eB7mh00FrWvEIbHzltbBew
 33ww==
X-Gm-Message-State: AOAM533SgbRfD1scghAzKlwU2GwKHoEnTPSYXZ0Mv7qtVKBtTf+nxtEY
 mdNLYqPwHfAOA6IFi0prqt0=
X-Google-Smtp-Source: ABdhPJxQpQBnfySbDernbtM/2zvLb6OSYK+avT5/SNEuSrqQE/7Jv9ZFk6Gy3eDnWfCPcZ391s1lEg==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id
 b5-20020a056a00114500b004f63ebca79bmr24461635pfm.41.1650976846536; 
 Tue, 26 Apr 2022 05:40:46 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-1.three.co.id.
 [180.214.232.1]) by smtp.gmail.com with ESMTPSA id
 w129-20020a628287000000b0050d4246fbedsm6798183pfd.187.2022.04.26.05.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 05:40:45 -0700 (PDT)
Message-ID: <9b428d55-322b-5685-b336-4bd71b52a73f@gmail.com>
Date: Tue, 26 Apr 2022 19:40:38 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] KVM: powerpc: remove extraneous asterisk from
 rm_host_ipi_action comment
Content-Language: en-US
To: linux-doc@vger.kernel.org
References: <20220426074750.71251-1-bagasdotme@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220426074750.71251-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Anders Roxell <anders.roxell@linaro.org>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, kvm@vger.kernel.org,
 Suresh Warrier <warrier@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/26/22 14:47, Bagas Sanjaya wrote:
> Link: https://lore.kernel.org/linux-doc/202204252334.Cd2IsiII-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Suresh Warrier <warrier@linux.vnet.ibm.com>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kvm@vger.kernel.org
> Cc: stable@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Oops, I forgot Fixes: 0c2a66062470cd ("KVM: PPC: Book3S HV: Host side kick VCPU when poked by real-mode KVM")
tag.

-- 
An old man doll... just what I always wanted! - Clara

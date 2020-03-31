Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC720199930
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:07:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCNy637vzDqLF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:07:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=dhGPwewu; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sBrJ0kS1zDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 01:42:38 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c21so9770464pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xcYSe7+W5XBsRVk1odBd6yYO30OBCGBeOkC3qcfJ1ws=;
 b=dhGPwewuQRSMAnqIV6kTDUrdfW5Sk7f9JU2o/igGLUfK4BghM6VjQJzHLtoCAoSyB7
 mAU9BOaoahXk6+UGvuVa5LAVtJOb4NhCgqMynAWtxX11uxrWfPJKJwWIvfsez+Bv5h5X
 EDJOh146C6KH+PMVyLUz74D4hOdiq0JFA9u1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xcYSe7+W5XBsRVk1odBd6yYO30OBCGBeOkC3qcfJ1ws=;
 b=XzKGuystg3xVrmVGoZILd1EzNRACBOgNA8xAGIilXjrssuKz6qd4eK1hJ2o0JFDPs+
 j0hICtMoPQlqaqKf8rMgCwnNBfanjMCl+pPbY/V+42m0Z0RaQuUFw4vOJPCG1PWD4AGx
 ja5ndYy5oWMUahxOHZmy5nf9gDIpQfx7G1IWje08LzOm5J0wIrLdCs/QViR068KZsUDR
 fetO5URQBDdmTxuF9jvPjQjidkkhF95hOinvvZ6/vKJyGB7CVhV0RnofDwZSCGUeEYVa
 D5DqnQE3Kl9pDmOx4dsc5DLBw+3ZZZEnqqUBCrDFlUWYOdX9n+SmWbbDjbWJmtD4nnSg
 5vfg==
X-Gm-Message-State: ANhLgQ3wSSeyqDWwrWZCUhzBPlF88ysLDsv8Z5I42luMO9nD6ngLRVpS
 61tASXwdiRBBVsHx3mSEOKIJedmJ0Mw=
X-Google-Smtp-Source: ADFU+vvFo0K715WJDvf8EpTyd0A6KVqGqaygop9ZkRGtQb9RlqEE1CvDKrsTNtWfNl+U5m+LhTFmzw==
X-Received: by 2002:a5d:9648:: with SMTP id d8mr7030743ios.115.1585665426753; 
 Tue, 31 Mar 2020 07:37:06 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id d70sm5972625ill.57.2020.03.31.07.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 07:37:06 -0700 (PDT)
Subject: Re: [PATCH 0/2] selftests: vm: Build fixes for powerpc64
To: Sandipan Das <sandipan@linux.ibm.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1580367152.git.sandipan@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4837525c-c078-0e33-614e-103514946ff9@linuxfoundation.org>
Date: Tue, 31 Mar 2020 08:37:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cover.1580367152.git.sandipan@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Shuah Khan <skhan@linuxfoundation.org>, kamalesh@linux.vnet.ibm.com,
 linux-mm@kvack.org, mhiramat@kernel.org, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/30/20 12:01 AM, Sandipan Das wrote:
> The second patch was already posted independently but because
> of the changes in the first patch, the second one now depends
> on it. Hence posting it now as a part of this series.
> 
> The last version (v2) of the second patch can be found at:
> https://patchwork.ozlabs.org/patch/1225969/
> 
> Sandipan Das (2):
>    selftests: vm: Do not override definition of ARCH
>    selftests: vm: Fix 64-bit test builds for powerpc64le
> 
>   tools/testing/selftests/vm/Makefile    | 4 ++--
>   tools/testing/selftests/vm/run_vmtests | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 

Michael,

I see your tested-by on these two patches. I will take these
through kselftest fixes.

Sorry for the delay. I assumed these will go through ppc64 or
vm.

thanks,
-- Shuah

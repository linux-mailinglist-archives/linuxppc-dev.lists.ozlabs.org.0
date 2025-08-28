Return-Path: <linuxppc-dev+bounces-11423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A5B39EFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 15:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCMlJ1K5pz2ym0;
	Thu, 28 Aug 2025 23:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756387948;
	cv=none; b=hbZEZuQaSNGBtoQupY0k2hHDUN5SJ3uClclBhg9e4SE/GZj7h76cXHk1gOClQrvy+ZmWdQwzTrbD9cxNW9II0tbvGFxd/i3ZoCbwpekbhtOZr9PtTPWRQDr8NUBF4TY/qY93sdDK7cmLBsOewGFKFixGFhh+tUC7FUj3yAzTgxkyEU8TokNjSBP48KDDDS6eeEvaTnnrmK6yhL2S94KzyMVldBSJg9CiHd1ydVdkQrS8D1rLNVYlJmy4pPTubIh0uHPU99hkZDtOejidNbeVDvgjzXYsRnqvR6iYeXQAITVhBWJxOzcNHv/rbBwzYUVC1wfrOy1CpUfN4YPMQtv5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756387948; c=relaxed/relaxed;
	bh=1gcQTBjZIOeAVv3+1MBRBTllVRRWkwC45vViKRladlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeentVx/0IA2nw+NFAYEpNlLKI2wtauwRHmByhNrlCQV0ixv5zXGKwggi3MVuPbli9Ktf6N9C5bPUfk2FM4gmqArADhCc24ueau7lxr1Rp/ru4JHHAfA7GDH6VbkgUNHXXLtmxum9RNEXwG09I1buCPeejELm8tTiO38ZxW8oZnHzLyMgczkQAHoE3/AkgG1IV5Y/0q0zxPXSMts74fnZpaCAHJt7tdfd+/xNdcG/miO24iFzQ87s2F+09hIVg7XRZmMwNNF4F1CcYEWPJygiqI0OvInOkBdd15dfG2M1mEiEFIw8oM1sMLPBDMRBbcZqoR20+vzQI+vXkz72JbM1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCJICE7W; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCJICE7W; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCJICE7W;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aCJICE7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCMlH2NBCz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:32:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756387943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gcQTBjZIOeAVv3+1MBRBTllVRRWkwC45vViKRladlo=;
	b=aCJICE7Wkc+8Ym1nzeGAuaNAvv6dAfbTluT+F4WfCjkEVxo21T/fYHLWpP6r0iXrShZssf
	uzwl1WQXf7xsbAUg2vRGsx/DivZAvBsSanRUoXUdp9e7PjSFu4H9r8fquH0Cwp/qWCNxIY
	LZZXUG3dAMmbaHgnzNR0MVUm1fea+A4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756387943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1gcQTBjZIOeAVv3+1MBRBTllVRRWkwC45vViKRladlo=;
	b=aCJICE7Wkc+8Ym1nzeGAuaNAvv6dAfbTluT+F4WfCjkEVxo21T/fYHLWpP6r0iXrShZssf
	uzwl1WQXf7xsbAUg2vRGsx/DivZAvBsSanRUoXUdp9e7PjSFu4H9r8fquH0Cwp/qWCNxIY
	LZZXUG3dAMmbaHgnzNR0MVUm1fea+A4=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-6N-hqNOKOl2dhW9jkRelog-1; Thu, 28 Aug 2025 09:32:21 -0400
X-MC-Unique: 6N-hqNOKOl2dhW9jkRelog-1
X-Mimecast-MFC-AGG-ID: 6N-hqNOKOl2dhW9jkRelog_1756387941
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-89247460de9so1128637241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 06:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387941; x=1756992741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gcQTBjZIOeAVv3+1MBRBTllVRRWkwC45vViKRladlo=;
        b=ELZfnDziavPpfnftVzCLKaiqJvZFfvBQeqQUYPDGoAq6RSxTnYjC2t4qa5HLE94Apc
         PNpVQCgYz60je34kOqOmhouTs8QAEcx++9ZcJqjB3QfG83szs3+j827gnoXYgWROc+s2
         FgNPqtIvVddZbqWhVUR52pRQmkH9wP6JhBC3BhhJNUjg7/dgAsKl2D6QODhP6RFyGuKU
         ZJU1JE4sG3fcUMCcimQoQIGz/uW+utvFBiB2rDiOGlyg/AcIR0oAWj/0nSQJSJ5ozoc9
         vHGBZJ2mkU+OBzC2bxVe7fqV4PCHFVRJ2+URvPBEdfAdSfWBORzlt0hG5FQQ3//SuMpn
         d2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOKMeOMGn6CqEDGrxQLDgCXNNkk0yGO1PvVndT1YG35BmzEIPJU9V+lw2AU6WDQOYg6+b4VU9Mo7kZmkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyi7hAOE5TPRpzTu972Oa06NgK9DMiksuqML7tL7NZEzbZgePXF
	1myQFKP1SqZ4oUYJLRs5N1UjZHKLjs3QEdNyTbVYKJfrzTN1vTEjpQlOkOUBHEEQMA381eI6cAO
	YMWdJfsJQCktzWUB7GUSFnVnn560bhXZoQy79dZCGtNxTTpo/ooD3kJLpm1r/q9HSd9c=
X-Gm-Gg: ASbGncv5c2CS56Z8+/xypO/ft7pVYwEAoATkSciUEfbbO+QOBVnw0qelOgFPWgN7/1+
	QCO8m9c2MRZw7ZmHOI9mdHvKQYu2bwwi33nHLy1XPBfHFMplyMO2Licc0Wg8KwA0kTxTMVsQCZB
	tonVq49kHp9XodWSAJATRCvm+ESna492wToerPlKad5iNwf01c70kS+dOgPc9fqQ1E2kE8lH1za
	xe0ZPm8H5NIIElsWtRnqhVvq4jPdNn1VWIHhWRjL0wygH0vyXlQAZNFVS4hwTLk1lrckEVuLrN6
	Ds2ZQpguDe9rc8KhUZl8AlSe7/yBzYe6BfcTbBM/piMOYEV9l9NHQuw4XG8O+Sp7d48rexfz/jD
	x8hqkXguv1nfolh2tu3g=
X-Received: by 2002:a05:6102:418f:b0:521:412d:94ea with SMTP id ada2fe7eead31-521412da0dfmr5367123137.34.1756387940653;
        Thu, 28 Aug 2025 06:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSUUdmKnWbgEPhXO4rx99S0UBIjQrOc1XfwS8UoeSDiP1UjihcSieOJOAuM8Elh6ok71rurw==
X-Received: by 2002:a05:6102:418f:b0:521:412d:94ea with SMTP id ada2fe7eead31-521412da0dfmr5367086137.34.1756387940118;
        Thu, 28 Aug 2025 06:32:20 -0700 (PDT)
Received: from [192.168.1.17] (pool-68-160-160-85.bstnma.fios.verizon.net. [68.160.160.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed8902c5sm1110656285a.22.2025.08.28.06.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:32:19 -0700 (PDT)
Message-ID: <0ab92ae3-674f-445e-883c-0e511add85d2@redhat.com>
Date: Thu, 28 Aug 2025 09:32:18 -0400
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/tools: drop `-o pipefail` in gcc check scripts
To: Jan Stancek <jstancek@redhat.com>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linux-kernel@vger.kernel.org
References: <e8c743dfb16c6c00fd793d7afa6eed33c49f895f.1756202009.git.jstancek@redhat.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Autocrypt: addr=joe.lawrence@redhat.com; keydata=
 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
 pNzsRQ==
In-Reply-To: <e8c743dfb16c6c00fd793d7afa6eed33c49f895f.1756202009.git.jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hlsVMnJ8QI34M90DpHYzf3OFzNbO2LJ68CrmUFtf0Rw_1756387941
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/26/25 5:54 AM, Jan Stancek wrote:
> We've been observing rare non-deterministic kconfig failures during
> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> disabled and with it number of other config options that depend on it.
> 
> The reason is that gcc-check-fpatchable-function-entry.sh can fail
> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> there is still someone writing on other side of pipe. `pipefail`
> propagates that error up to kconfig.
> 
> This can be seen for example with:
>   # (set -e; set -o pipefail; yes | grep -q y); echo $?
>   141
> 
> or by running the actual check script in loop extensively:
>   ----------------------------- 8< -------------------------------
>   function kconfig()
>   {
>     for i in `seq 1 100`; do
>       arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
>         ./scripts/dummy-tools/gcc -mlittle-endian \
>         || { echo "Oops"; exit 1; }
>     done
>   }
> 
>   for ((i=0; i<$(nproc); i++)); do kconfig & done
>   wait; echo "Done"
>   ----------------------------- >8 -------------------------------
> 
> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
>  arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> index 06706903503b..baed467a016b 100755
> --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> @@ -2,7 +2,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  set -e
> -set -o pipefail
>  
>  # To debug, uncomment the following line
>  # set -x
> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> index 73e331e7660e..6193b0ed0c77 100755
> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> @@ -2,7 +2,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  set -e
> -set -o pipefail
>  
>  # To debug, uncomment the following line
>  # set -x

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

This bug manifests when automated scripts expect to run a kernel build
after `make olddefconfig`.  I reported this to Jan when I found that
kpatch-build [1] instances were hanging (expecting to hear from a user
that would never answer :(

[1] https://github.com/dynup/kpatch/blob/master/kpatch-build/kpatch-build
-- 
Joe



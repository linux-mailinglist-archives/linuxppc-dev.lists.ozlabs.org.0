Return-Path: <linuxppc-dev+bounces-12290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF1B59BF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:21:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR5GJ2zZ9z30Pg;
	Wed, 17 Sep 2025 01:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758003515;
	cv=none; b=agY5F+B+0ytEABaws8hQO4DTwcgrP5GNOqBad6a7zxJhLBhULLimCtEr2Hf9thozOoNhhF/6LSZmTsDMlTq00ryzvCsv+VaIx/q5zMeEECE3JrFxianNLeyfBqgVOFhtFZIqNNV/BRo/lVE3fdDAnZhxqF4XPoHCUnxROsKaami4mY+s07q8QqSBfMGLd3Ydu67PhxeVqgpYau/1FPT7ykDil9t/CXSTTYvHTH1RfUPV+NuB+FXfcLLNBXy4H642bf6iFN8Wkpt4KrDB+OLP4VoZhcPiHrzorXWu939rGBJjM43Jsl61X2J/hO7huPqegKzu2FnOgmlX7YLangzALw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758003515; c=relaxed/relaxed;
	bh=yE36FkE2n6Nf6sdtAOUC4xWShp56TIuhQU2XNORUnm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmnYC7fFwp7DFNt+8EjJGhZOR5/c6mv13OkoMWyXnV67Bmw3UJM4gAi8b1lP8t7d0FLll8Fb2LdfBracXvQzS5ij7mvssDqD1PFp4lggEfnH4SzBQ7QDrmNToEF6RNOEbOpUf/scfIcYWZTEV/A+DKz3194989zDM8pCXqhDPdXgit5Xb7kbO6tGT8+qTwtaEL2YaDDA8U41F2hdy9gi9WvrRhNzxlOohQp94yel1JR7673zfxulxLZLcVtuQxGbM0755BKKroMc6F7MGl2MPpztpadELSnC265vMuqq6sH1HfWEez/jj7ZOOjb8Wnh8qdLBcFH1dfES9HQWL23rgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wpx2y5PX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wpx2y5PX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQsCt3hpBz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 16:18:33 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so35185325e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758003508; x=1758608308; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yE36FkE2n6Nf6sdtAOUC4xWShp56TIuhQU2XNORUnm0=;
        b=Wpx2y5PXB27BCiwKPJp9tiMlbqwWTHXAh2y1wKqM97+BubrVlk+UUzAlBd2Uw5jMA5
         rio/kAj9bHm3ilIoaIrICzH82zupzLIcvRtcZbBnmDv6bCB8Vy5BrxdksoyxEAFvT1Ta
         6Fwh5RZOBzSjly5ida/YdE0OQ0Lrxawf579KzIoZZlBQykBdXLOs/stNzGkgpsM/zZsW
         Mrb6U+5+1U88nLb6LV3R3HQM6aNyT2xsBjtQ/A/g2P6lOfUXSVFi3a2IhM7ORhF+BUb1
         6/Prp/kP/IS2+AkxOREf+1EefZTAEgBCD+SnkhKopQNDvz1TSX6r+nVE0EOPnMco21he
         pRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758003508; x=1758608308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yE36FkE2n6Nf6sdtAOUC4xWShp56TIuhQU2XNORUnm0=;
        b=wFtBpIqcf/Kl8aafZIXdSFrmECWBghS3bK6Xda99QDX1FTd3CshAlSvor1QHWDYBdi
         7HzaXAhNcJ7SJzDLk/BsBPMBYzFV8R0Qc6kAfld/IOs5YxE10IRedwwfiXM1T9WAd5vE
         t5BrMG/5Wx45rZjTVIVERBzgNjnPsJ/UO8aBhvI/YrAwxEs4aXiKvOHQkICHqMV2fA8X
         MpvvNn/vSE/miwUBB8kkMUA8z6QhZCeBXw+tOfyR7wMasr//mR/szxfZ76h26ROIRixC
         IH7NZPNsZuY0O9r9E3L1s60aVCa8epPso8E5xAyPYipjgXVMun9CC4U4f91Knc97ndyK
         R+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWa/yy2LXLJEv2zPcY2vgIm2owpb0w4WGgkFsIsf/XTfkroXWfMkthkE22WXE+uGqKPYuZMDg8TQ/wqoLE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzgfhyQkSKlgylYcZaHt3sN/VvvZOY2l1LTjtrpC41AbdSwGOv
	dkEzRXTCq/Ljf2Qdzm4/3HBVluUoLtdRy7XRk9eMQb7Wowp9nH1PtefxwY+S9hUrCSDktPBxwdr
	s/Hvg
X-Gm-Gg: ASbGncsrNKRQkXZxrOxvQrVamEMttyOssf2MwAwYYnRSftmPOuNJpbB2biBTyqmLmz1
	jJq6xiJ+FUS2EZLEa9tQ8GrD/lyZQVoB2dG07R1ngERjuCaYjWnJEJ9+WIxI79osFgrz2g7KWjY
	IoXxT208W4J2yvpE6WkS3ODg6Y8COz99TJ1yooIbSXHFStdhm/e1E3fxNp4dEsJzcH7J8YYNsCz
	/CDSvFJ6IpwOV+sUigRdPQJKodieF82PmF1yuXTe71zTg19kUcx/dowzKowIZwRK5N9NA0wqdUJ
	dROHA+F7On/SRk/nyVUQ4OwV4RBWTvPebn5MaXHU9+UizjQzTPfmZlAxJH5l/hIYGBTeBKXf1cx
	yJ/g8QkV1o4oez5BNit5qMfUpr7nJ8rjF
X-Google-Smtp-Source: AGHT+IGcaZaJsKjIbaiVHIrRn4D20wudJAA8cvj0MPlUEtXe2fB7JX4ecViL1+EV5ZvPuLWEqJHr3w==
X-Received: by 2002:a05:600c:4454:b0:45b:97d9:4127 with SMTP id 5b1f17b1804b1-45f211e53femr132015985e9.1.1758003508477;
        Mon, 15 Sep 2025 23:18:28 -0700 (PDT)
Received: from [192.168.68.105] ([91.116.119.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5cbcsm211728785e9.11.2025.09.15.23.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 23:18:28 -0700 (PDT)
Message-ID: <a6169ca9-51b5-4ac7-99c9-e8be695d831c@suse.com>
Date: Tue, 16 Sep 2025 08:18:26 +0200
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
Subject: Re: [PATCH 1/2] powerpc/boot: Add missing compression methods to
 usage
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250915153114.40578-1-antonio.feijoo@suse.com>
Content-Language: en-US
From: Antonio Feijoo <antonio.feijoo@suse.com>
In-Reply-To: <20250915153114.40578-1-antonio.feijoo@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Error on the subject, I'll resend the patch.

On 15/09/2025 17.31, Antonio Alvarez Feijoo wrote:
> lzma and lzo are also supported.
> 
> Signed-off-by: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
> ---
>  arch/powerpc/boot/wrapper | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 3d8dc822282a..50607bc47d05 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -21,7 +21,7 @@
>  #		(default ./arch/powerpc/boot)
>  # -W dir	specify working directory for temporary files (default .)
>  # -z		use gzip (legacy)
> -# -Z zsuffix    compression to use (gz, xz or none)
> +# -Z zsuffix    compression to use (gz, xz, lzma, lzo or none)
>  
>  # Stop execution if any command fails
>  set -e
> @@ -69,7 +69,7 @@ usage() {
>      echo 'Usage: wrapper [-o output] [-p platform] [-i initrd]' >&2
>      echo '       [-d devtree] [-s tree.dts] [-e esm_blob]' >&2
>      echo '       [-c] [-C cross-prefix] [-D datadir] [-W workingdir]' >&2
> -    echo '       [-Z (gz|xz|none)] [--no-compression] [vmlinux]' >&2
> +    echo '       [-Z (gz|xz|lzma|lzo|none)] [--no-compression] [vmlinux]' >&2
>      exit 1
>  }
>  

-- 
Antonio Álvarez Feijoo
System Boot and Init
SUSE


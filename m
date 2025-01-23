Return-Path: <linuxppc-dev+bounces-5523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F7A1A72C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 16:37:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf4nQ6jR7z2x9g;
	Fri, 24 Jan 2025 02:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737646634;
	cv=none; b=moaFQpocIWkI0gNuckwIxdf+UcrH1ozq7MFckJvhWsd5nrKqyg0HMK/HwJQrVckqdBgfmDuqE/G5Iq+UFdcLP8Lfl08UxW7jqVQ0Psh6vAgzCWZshziPVghYcIavHyElQu3OXHm9FU3Q1W/ZiztmDdTwwO6VfZdahb82kDm1Qx59N8dowdyeZiW/1UdZvUi8oJjAxuWkA7Hk7J3p/ZZk31F/50wlwh2XjHXN6Y831Blu3eGmaRXjOOqbN+pOdl2L/dkyjbRKK5YCZdnxgW5pS6wvI1KlpxcRGbVgamhvVUIOLSacnwggEart/MpkA7yOIBT8rQ1ipSJskdLzrnHIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737646634; c=relaxed/relaxed;
	bh=7daHCSAZnVQzRP+983s7ap8EHdLiIYE2KVKyVsz4xmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWsdNQdJQKy5hpMUNyGn1Lq+jDjRpJbLh+QvSW3ZLlozEgPXQapk2ZPTTlEXu1wzQitdJef/1aNtqseoWgZFKLn17Oo7HJ8+29DwOXMhLO8yQMRCllhzEV5yIzCMylqgLZBGaVP/QqJ965Wm5a48dQwMTGIunidPhHdXc3s8SQuADdxSknr5Dcqgcru6rr9QQrjnDii5W8QN+1grI4e/IEdCVmRdg71bIw3+Y8R4pjiotn2lsoezupxGEkmkrE0JJ4dyrcICtentpYZrPeXQ97vsJSu9FDgA8oLAxqVyk31V827ZLYczGX8u9fb5LUxNUjcD69O6JskL4JmcHu4SUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf4nJ4fcVz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 02:37:06 +1100 (AEDT)
Date: Thu, 23 Jan 2025 16:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737646599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7daHCSAZnVQzRP+983s7ap8EHdLiIYE2KVKyVsz4xmM=;
	b=RajfLYfSBFBSWc6mFyySZKDs5szeMKvPp68QvuBuich9RvwWiU/TPw5u4GCyHN1qDh1J2w
	RuwGLEDTJihJADhrHv1AyFrSodpLrhKTaeVCo6MkAq4qIKInk09/reGjTOPg8prtIaY4NU
	7bwcJ4hGN3mVOcxgkKzuPoaeQN18ibg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 13/18] run_tests: Do not probe for
 maximum number of VCPUs when using kvmtool
Message-ID: <20250123-1155fba5858c4ee31e647d8a@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-14-alexandru.elisei@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-14-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:11PM +0000, Alexandru Elisei wrote:
> The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
> VCPUs that the host supports. Qemu will exit with an error when creating a
> virtual machine if the number of VCPUs is exceeded.
> 
> kvmtool behaves differently: it will automatically limit the number of
> VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
> to achieve. When doing --probe-maxsmp with kvmtool, print a message
> explaining why it's redundant and don't do anything else.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 61480d0c05ed..acaaadbb879b 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -89,7 +89,15 @@ while [ $# -gt 0 ]; do
>              list_tests="yes"
>              ;;
>          --probe-maxsmp)
> -            probe_maxsmp
> +            case "$TARGET" in
> +            qemu)
> +                probe_maxsmp
> +                ;;
> +            kvmtool)
> +                echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +                echo "The 'smp' test parameter won't be modified"
> +                ;;
> +            esac
>              ;;
>          --)
>              ;;
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

but I hope we can do something with the associative array idea to
avoid all the TARGET case statements that are getting scattered
around. Here, we could rename probe_maxsmp to qemu_probe_maxmp and
then add kvmtool_probe_maxsmp which does this output and each
to their respective vmm[$vmm,probe_maxsmp] member.

Thanks,
drew


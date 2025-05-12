Return-Path: <linuxppc-dev+bounces-8522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF73AB4692
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 23:38:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxCfS5X4Hz2xjv;
	Tue, 13 May 2025 07:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747055827;
	cv=none; b=oAPxql+1zXbpZetZ0Hw5bQYE5ugfXEq29vGZEdm4XT5UpYMlx1BVj8q1W14VSFEt17i1h3806+BOESfRJdfMGEs7xVX4nYRaFDfIegiL6kEOH/vQrFlYnHP8ElLr9PDjO+3CyIDGXgxaHEHEwuzPnjwA1B1+OoIYS+aPtJsC8JoJETMqvKJnPzu/Erxhd6de/Lx6moAD3T++D53AgwBCi0mKlzPKvHUKgZaEq3X9EszYm4TgaMptzQ/FuDbHRPdSKUTUa3Tum7GZewzTYUSeBvaV8VwFVeRe+vAyIBX3QS+zleQwn2+I0/e0k/EOUN1O7xSB6YCwyRkl0YJs92LoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747055827; c=relaxed/relaxed;
	bh=haOrPHUuchDPkLi2v3yXHCKRYTqMznWY4qj2j2lSWl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXDkJFyPRYy3mz65nJCd/2L48jcGFlos95DuCFsGn5hAtu5B/vX+DCsHJKATu2qZDQi++9EoRcwIo7GaKnVp0Oqijv1+UEuwdMByaBkSIi3GNc4SGNo5PObS8pbbJccI1lRIA0EkoiJEOJQ9XGtG88yM45ePzDVBG2jaJpwvvMmPjZ7Har0j8DKlvvSouf/M+Fhw25dQQF7IdwhHEJjgp+RBgvC/M/Vk6eQD0JTJIQz5hIHamFbwL3hktqfbRVXfL3dLjn364EBrMCdTqUiuVKEutdd5vrp0ASR+m6IaGY6j77vK3f+fgYtV3xFRjNT/ltrAZBPcL2Dt9IJ3gRJ3wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOR0jkaI; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=jacek.lawrynowicz@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KOR0jkaI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=jacek.lawrynowicz@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Mon, 12 May 2025 23:17:04 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0WN5bkyz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:17:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747055825; x=1778591825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N+0LFGTtI6zB+BSNgrVSHcilV81hSz+0mu8K+VGrGKw=;
  b=KOR0jkaInErFHr6zqMr7sXrO52uytgKeUDdr3P43+hTe7WP5pKS/P7vH
   UGs/UbrCDbG3QY4+PbKp+GEYSLVBrZ85sdURFsyGAKCnHAFi9i2BBJ7aC
   n8PoT7h4fzBo9qZX9z3x+LZ29EK8Q7AjSIAo3Gvx7Pc+d9I7l4/wYzunt
   r1LpeninaJiGpQY2wLSE56+em/SARycpIwxX4xT+GJ4/YgHCCR/hQTs3G
   Vhv2nMfxRWq7bhAF4fzCmCn9RTiJMaI5GXzWEXqjdOeBsH6yHGrS9RMp6
   mV48VknGxeQrYd/DMW+gpcNZiqJsPvmtkAo8X+WimKF9o9V+hTwELt9xN
   g==;
X-CSE-ConnectionGUID: YO0PxY7TSwC7z423ji68ow==
X-CSE-MsgGUID: UTTQQTpuSaehKljYCLB6SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74243972"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="74243972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:15:57 -0700
X-CSE-ConnectionGUID: mF0Tr4TVTgSXs/DMLsD7rQ==
X-CSE-MsgGUID: /tqYRHGYSri+FGM+Rb+4MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="138329163"
Received: from tronach-mobl.ger.corp.intel.com (HELO [10.245.84.129]) ([10.245.84.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 06:15:51 -0700
Message-ID: <c26c38da-401e-4044-8b9e-cd5547e61677@linux.intel.com>
Date: Mon, 12 May 2025 15:15:49 +0200
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
Subject: Re: [PATCH v4 2/6] accel/ivpu: Use effective buffer size for zero
 terminator
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Nuno Sa <nuno.sa@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 Markus Burri <markus.burri@bbv.ch>
References: <20250508130612.82270-1-markus.burri@mt.com>
 <20250508130612.82270-3-markus.burri@mt.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250508130612.82270-3-markus.burri@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the fix, applied to drm-misc-fixes

On 5/8/2025 3:06 PM, Markus Burri wrote:
> Use the effective written size instead of original size as index for zero
> termination. If the input from user-space is to larger and the input is
> truncated, the original size is out-of-bound.
> Since there is an upfront size check here, the change is for consistency.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index f0dad0c9ce33..cd24ccd20ba6 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -455,7 +455,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
>  	if (ret < 0)
>  		return ret;
>  
> -	buf[size] = '\0';
> +	buf[ret] = '\0';
>  	ret = sscanf(buf, "%u %u %u %u", &band, &grace_period, &process_grace_period,
>  		     &process_quantum);
>  	if (ret != 4)



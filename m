Return-Path: <linuxppc-dev+bounces-15418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C1D029D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 13:26:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn40D4p49z2yGq;
	Thu, 08 Jan 2026 23:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767875212;
	cv=none; b=GVfbcGGHLeWVUx0zIW4NgB173TRsJu5EfChCJj3FhAM+UfDh7O1UCwzaQmtFHFTnuFZnjs8JNwP9eUPYkYHxRP+n/GbVi/T/IhSXgquTmGsyuLs/ynYFmK6hi8QPhZ6UYjO8fMLPwNWt9E9Vnf4JpRZ4vuJ9FXryHb4A8ohr92pnLIoEDQGh7rVJpW4mjCXRfjaIgtIAfnFwsWr65u8SPJgq2KZPQJXG3HM+XnUdEKf1+CpeMVnZ6P4kWk8/n+VUVIJfoDFbSCUbAhrMGN/iOCtiM4utECfwiDGxh4skYpwDOaTdHvUgcMQAJ49Qm70HtHW1raSSPak+KaBRYQQYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767875212; c=relaxed/relaxed;
	bh=oo2CFLtjsV6BAg50pc5av8wJo3LO0NyzTUT5/dN04BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elP4iYZJUuUwUD8nqm2y+3AVaRvCcne4XRynOZILWUDyYaur59Fcpz6Xxzc2mdGKHWxTyoEYJZXtZcY6m1tEOAgQWTqjTB4lT+mtsW2WyO7j7jERcquiDWhGzjAwgsmpnN6MEehMoiKQcATzs9WpCXBdBumijgFbGEAhbe7WNNM4nHiW/v8Q+9q7QDo7r0w/S+2GHjRYJrh8od1PMoHksJgT3n3Go4sgEQ57DMdlkXSbdvVst8gBacbD/HfFDtvvJl+B4ArY4eNI1Gx5gswWJTVEtzAaEDBGCNopeduEXSdhKq5lEQedwdC7DpoqJ9GnNHO+MxpM53m1x0kqieBcSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bT0Ih3zy; dkim-atps=neutral; spf=pass (client-ip=209.85.128.48; helo=mail-wm1-f48.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bT0Ih3zy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.48; helo=mail-wm1-f48.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn40B5sBfz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 23:26:49 +1100 (AEDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477563e28a3so14281425e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 04:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767875146; x=1768479946; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oo2CFLtjsV6BAg50pc5av8wJo3LO0NyzTUT5/dN04BQ=;
        b=bT0Ih3zydIuvZy68RoQn4w0Pl21mcOvrDL2kl0oM0f36+yInYt5m8lxsCZWNXHEDWL
         FJdariO+8khMGO9qSwe45p+uJRLuCZtcpMXy0Jh2Ahh1uerXckdRc6fsu6eNPlVkdxhb
         cC+Xc5IH6WRzR4fiO3OfjklewwPYVza0/oExJvArQfzWdSomOilD9NN6EGxVuUm+gz4q
         thVHd/bkp3pKgi1W/FDK8+UmnL0eP4iCVEGW8l5PbkPXAM0rwsubUjzKri4NLaBMth87
         2iYzMPjsMZYO61IOP1iMxSxOHS6X+Q/pv6AIkRCTt0Nssj+jeyu/SxJtPmVMBFHmfsbn
         BXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875146; x=1768479946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo2CFLtjsV6BAg50pc5av8wJo3LO0NyzTUT5/dN04BQ=;
        b=f5o4WSWOMuMJMBHFcm86pH130/Q9s1jYLqggH0pCleSj0hXOH6dJrQT2SJ4V8WxA7R
         /n6iFsd58m+WTPjbeNdF2WTsINf035idjyQ5o3HRmNmrPvOzi4CLYafjLSwYWdPVrw3Q
         p4DrBG9xsbJA1LPtQIld7uSMTGSB13ojIUzmivxcpixe/uV+kFzpuzKXfpl4DiB2VQPa
         wQ0UvhSeno3IO/rtnvAiiN98GEG656R5UQFe6nAkd+9WRlUaqNE+OHbMr69vmGBtxjpf
         3/x/dUCWYvxoIMRgntZOKOd6/paD5hsVijcw1/9mWkKW3U4f/f2OWtoDdHLM92ey9Jzr
         a1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCX1IyZqGxQwyDJ7G/xOlzIqqdqr3vwBrGkfEP4J+P14MVuoABa9wuG003kwmdPw5UZw0ZeMzdonIJzGY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznFj7pDjBD6cSVkN5kzMfocC5sOoIf5rVTJDhFjMJZtGnSo8KS
	NtBBfmrcx2fSuH12WYYdRnSYdGf8faqKTdBlZs90kqlFKzrviksRolcxp9V2cFfnhXg=
X-Gm-Gg: AY/fxX53zJfQ1pN8VdNaBW3P/k/sf/YC2pBYHEeUHhtTvYdT3Vfb74bDLMbK4oru+/6
	ESUEv7mESmqCAv4bddvp+dHhoY4DqmrDOXv5XZTJQKjuPz7Mqx3eAEPuPm+c6zQKH6W/1lRrcNV
	YRa0hNXmNZwr9X/Bp+VnwCZcUFN1lOrbW133QKBqFzeyGDpyKyCfwuo6YJQF6KS6dNMexSfiM1W
	3a2GeEd+7mzNjWuOgzWRD+FQdRL9/v1ibC5auv4qWRAIJz4OH+0sYggnKhl57/D/QBlfTdtIuWR
	LfwagO9cqEWRmmXKZuoab+pGOeciRYlTHZarBTFkHyShDHNoELtYdzBnXHU1VIp9XzHggIu5GWL
	64OIy1M7b3/zDWmPk5fopfkk0JuBjeJczQB8OT/2+XQCX5vwk2C34fpd7X2qZak9sRsze282r9x
	Icb3k6hQqdIuuqzw==
X-Google-Smtp-Source: AGHT+IHPOUU3VYG+LDdtS425ZuQtdVwqew0HnOk9sFOgT5yYaX5tS3MzGzSvSUidpw9ZUf5/ur53vg==
X-Received: by 2002:a05:600c:450a:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47d8483cc37mr64638865e9.3.1767875146300;
        Thu, 08 Jan 2026 04:25:46 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d86c6ff40sm78786105e9.2.2026.01.08.04.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:25:45 -0800 (PST)
Date: Thu, 8 Jan 2026 13:25:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nicholas Piggin <npiggin@gmail.com>, chleroy@kernel.org,
	lkp@intel.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/watchdog: add support for hardlockup_sys_info
 sysctl
Message-ID: <aV-iR87kfdZsSZT_@pathway.suse.cz>
References: <20251231080309.39642-1-feng.tang@linux.alibaba.com>
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
In-Reply-To: <20251231080309.39642-1-feng.tang@linux.alibaba.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed 2025-12-31 16:03:09, Feng Tang wrote:
> Commit a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info
> on system lockup") adds 'hardlock_sys_info' systcl knob for general
> kernel watchdog to control what kinds of system debug info to be dumped
> on hardlockup.
> 
> Add similar support in powerpc watchdog code to make the sysctl knob
> more general, which also fixes a compiling warning in general watchdog
> code reported by 0day bot.
> 
> Fixes: a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info on system lockup")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>

I haven't tested the patch. But it seems that it does what it says.
Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


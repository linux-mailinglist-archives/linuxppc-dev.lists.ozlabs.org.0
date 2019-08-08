Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A785DED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 11:12:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4642gy09mCzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 19:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::c43; helo=mail-yw1-xc43.google.com;
 envelope-from=leo.yan@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="QoAMv3De"; 
 dkim-atps=neutral
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4642cn4s6FzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 19:09:29 +1000 (AEST)
Received: by mail-yw1-xc43.google.com with SMTP id l124so33729993ywd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 02:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=30SazUA7Tq8vOLew/Q0ozPIJ6UITJfx6OSiQFokXt+o=;
 b=QoAMv3DejUjfnhb+6oRokGpixiiFkdSEwUMfIfWbE6OX7L2QqcKZDYpsVwpgwGt0Xk
 gznDPs2eCQSu+Ggc2KcoJCA0UdzunKgwi8hiTkLY+ZHSFkDOl1zUGU2gyauNO+35qNsp
 kOwUFaWA5dDE0XeEaTNpCZhgnTj2tFJ2LW3zQ8yymhoVryuAUaO6vk4vwuh8h+YQAoJi
 Owph5vWtqqGKlpcP8gxCftLVd4t68yaEHLI2r3anufZwM+CkEeaZRxVRjJcy6dqaTrRW
 n1JgFKH0jZOf0AvisfXH1BJw411XGuGYF7JGcYpFv4hjSmhazYegG1xn0LEBVT+LZNGq
 fPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=30SazUA7Tq8vOLew/Q0ozPIJ6UITJfx6OSiQFokXt+o=;
 b=qLJ6CnONUzqykOvAWcR/a8MKCJJ36Z2lLyhuGiRZFGXawZTU5DIqCH58tgHA5Xgm18
 9z4oPYFbeRR3lxSe3uBUiQ6cT1FHMHrqOSgTXtoGKEwzEoZvT813ajF8b7FSa+orA/33
 D3bWi6SsCKmWN+evjslpBzXkOV6Uz+JGWTWELQSk7fjvP66tEuRP99qN2SibyR5aT7pq
 qZx+73uBVfb8deD+bxYlrYG2wLnzEZ0L1vMTGpOrE87VEotey32KubYxGEHSroAi6K/4
 4yawd8z7pS7qailzkPFJpptzdZvkTdTEvHX8qheat2RK7aogg32P5pev3kuf4vXVsdk2
 /TEg==
X-Gm-Message-State: APjAAAVOzgUAgz9FPC5ZqaxvMZuhrRjIjjV65LRHM5bHx5+2yhWu/WHn
 B6rzoQXTTxc6yD47x6yfcaIgtw==
X-Google-Smtp-Source: APXvYqydeeI1ncc96UjZdrxAXhHgXZE1BP0vhmCGoDri//M4yZCIqo84HVJCeE6X+NfJt2l/kTMFsg==
X-Received: by 2002:a81:3646:: with SMTP id d67mr9291114ywa.77.1565255366232; 
 Thu, 08 Aug 2019 02:09:26 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1322-146.members.linode.com.
 [45.79.223.146])
 by smtp.gmail.com with ESMTPSA id z9sm21277603ywj.84.2019.08.08.02.09.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Aug 2019 02:09:25 -0700 (PDT)
Date: Thu, 8 Aug 2019 17:09:13 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/3] arm/arm64: Add support for function error injection
Message-ID: <20190808090913.GD8313@leoy-ThinkPad-X240s>
References: <20190806100015.11256-1-leo.yan@linaro.org>
 <20190807160703.pe4jxak7hs7ptvde@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807160703.pe4jxak7hs7ptvde@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-arch@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Yonghong Song <yhs@fb.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2019 at 05:07:03PM +0100, Will Deacon wrote:
> On Tue, Aug 06, 2019 at 06:00:12PM +0800, Leo Yan wrote:
> > This small patch set is to add support for function error injection;
> > this can be used to eanble more advanced debugging feature, e.g.
> > CONFIG_BPF_KPROBE_OVERRIDE.
> > 
> > The patch 01/03 is to consolidate the function definition which can be
> > suared cross architectures, patches 02,03/03 are used for enabling
> > function error injection on arm64 and arm architecture respectively.
> > 
> > I tested on arm64 platform Juno-r2 and one of my laptop with x86
> > architecture with below steps; I don't test for Arm architecture so
> > only pass compilation.
> 
> Thanks. I've queued the first two patches up here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/error-injection

Thank you, Will.

Leo.

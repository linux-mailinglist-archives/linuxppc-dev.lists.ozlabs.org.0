Return-Path: <linuxppc-dev+bounces-6316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F9A39DDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 14:46:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy15v1jGNz301N;
	Wed, 19 Feb 2025 00:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::341"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739869449;
	cv=none; b=dCq1mxtivsWzSwutLiXPGCJJORZjjAbcyH1ki+kGYmnUJdmn2ERfM8d6Pp2ugfFKgl7zH1UAGiZ9GC7lRhoVrQiy5aSEWXkWtMzdsKiWpqIdoRHtckZx77QiOMJdaVRKNXajWA1xnPm0Hax7yZHHI7MQpcxUDyAQRD4JZePYL1A0c4jR2f7wocSiH8m1vMtR8pWlf4vz3LDPxMnznVvGzEy0+WBi4eMQAddXAKGijET0xzvnqn6maXzLO7kDgYMvHswdm2RbnvLvaegdjLevblGw23tIxqmOxVjT3/mcIvAGuCimb/486l/CrWw3hy1n+6C6WqAz54cNSBSoBDIw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739869449; c=relaxed/relaxed;
	bh=OOuWtvfuWKTYVgnpUiEm2zwjY3WHke/k/7QdNEipwSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5cbUEgqJK8iafnoJLkFEeklfcShLOXYT4PIRRzGdOR3jVYyEhyIv43QY9XCITMGFXYC865ITZTAsuBWfAxH6P7KLlWqv+0ELumPKkXBEL3Jxe7cPyO8MM2q6tLbiuoRZpveXfugU9888VElCJS1xoGayOlcRC6cUZkzWevlZuWxsWYA1ttevmceWgjS0OJzMBJlhXgf33W8GD07dHkvAFJsAGm3MVJMzxm70xqr82MDk86t8AZ9S9eVKxF/+52WtMLzy8pap7MDj4s3nAwyeE07O41/mi4iOErlrpy7AoPCWX5cm0wy7SBwBmIMqiKkch/lsGzvV2Q4Jzz/jQZVZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eWqdKSw0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eWqdKSw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com; envelope-from=shung-hsi.yu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxtqr3bFvz301N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 20:04:07 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4397dff185fso19783445e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739869443; x=1740474243; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOuWtvfuWKTYVgnpUiEm2zwjY3WHke/k/7QdNEipwSg=;
        b=eWqdKSw0+PGX0wNqnc+H375nEBnxfHWiWKbSPfXZ9g3x+ncg7OWqFkrmF84ihug1ki
         AcaNVFFxDr9m/IzIifadOuYpfTBP2g2qoSItuOKA0O99ftuvcTKcZUrrUKVdw1CZeO4x
         048Jjhoy8cxHf3JigPXOgQBfKxH2mLxybRALtps5YgoYqQVSsYP+QI1bEiE2kONkMkOe
         SxUrV3KIT8bcz7Dfeir9k99+oIAZ/iA0OiHG1aiFeYmX1ObnuOmCN75acExlmnEvfVeu
         i/kEmWTKNTIRUqfHjGspCpyoxqMgOJogz6XFuHyWoNRdwaJuUcX55oBDw05PKGUgdibm
         kM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869443; x=1740474243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOuWtvfuWKTYVgnpUiEm2zwjY3WHke/k/7QdNEipwSg=;
        b=HQitmL6Df/VvP/tA1w3S8QAdadWGFeufKHGrCLKw8b2M1JcgxB/cRfXuAiB49acj7h
         pPNXbYGs3od7PlD/s5sjMPeXYF7RmvwRgc+jcQQxTvl0/iD3eczLf29PIoe50KJS4jFw
         8VkxhUYn0jldsriVl9mZFtclKmSIlQ6ax3mlnU+LxdJY0itrfrjaFCycebvo0AsVXzlF
         R2L3VG99aFdpXqcdxBGMcWEAvZC2TbYnxL0zMHl/8Sck08m/h5ThP1Fx20WHaZtmNTZJ
         QwfymUM5YSmtO6QPKMTY13Lg+Obqevpy2RK83PehwIzK2+WvyA5CZB0P4BrQ6Koo2Kxo
         8HkQ==
X-Gm-Message-State: AOJu0YwCQ/8uWpHLbarsd3WlSiy2auiBMyftOFYLj5lwuNI/kBvMp2Zb
	ijjzqzJdP7dF7UWOckmKwiR4l43LEgIUW3fFQkeaAL/9pMuSwIrUW2ylHOZmG3c=
X-Gm-Gg: ASbGncui7Y3cypsZNjoHSXFOZDTKb62mA02JHvKA2DGFAySxs2HfofmhdIMhvx7FrdF
	8N+uLbBbvhJMPwp4mLc5utZRO8oTbf/83sNec5bUOiOh0jULviS4lYGNtX4RjKChNIigppEDlTH
	zwAga14l6sqHI+YzoynzAqnfjS18CWQoAJ/1NfRQ8uEET3Jte2Bp5qq9Bevyt9iXI8WEJlHgx0z
	dTLDSKpylvYWezKLVTwEi2qtQPIXDDOjCkU+/O6a3Wzg2VNRO7j+UFxvZD9rNMewlKomS9ExW0o
	xpZEqVIM5g==
X-Google-Smtp-Source: AGHT+IG2nhkIDDAtinVM3Jx4QA/rzGqnaGj34iRwHF/a7XzoUFdDFjPd1BI+cElsZnPQNz0UhFlZUQ==
X-Received: by 2002:a05:6000:bc9:b0:38f:2c04:7a7b with SMTP id ffacd0b85a97d-38f33f27555mr9624706f8f.14.1739869443499;
        Tue, 18 Feb 2025 01:04:03 -0800 (PST)
Received: from u94a ([2401:e180:8d00:54ae:3b1e:ed6a:2e2:626a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm84435935ad.243.2025.02.18.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:04:03 -0800 (PST)
Date: Tue, 18 Feb 2025 17:03:20 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Segher Boessenkool <segher@kernel.crashing.org>, 
	Vitaly Chikunov <vt@altlinux.org>, Abhishek Dubey <dubeyabhishek777@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>
Subject: Re: [PATCH 1/1] powerpc: use __clang__ instead of CONFIG_CC_IS_CLANG
Message-ID: <lnq5canqlg62lga2bxzihu6ufelvytwwbrm4taihzewrpevfac@cncvdlbxc73r>
References: <20250218044802.17302-1-shung-hsi.yu@suse.com>
 <Z7Q8m4131_7K44qn@kitsune.suse.cz>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7Q8m4131_7K44qn@kitsune.suse.cz>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 08:54:03AM +0100, Michal Suchánek wrote:
> Hello,
> 
> how does this happen?
> 
> On Tue, Feb 18, 2025 at 12:48:01PM +0800, Shung-Hsi Yu wrote:
> > Due to include chain (below), powerpc's asm-compat.h is part of UAPI,
...
> >   include/uapi/linux/ptrace.h
> >   arch/powerpc/include/asm/ptrace.h
> 
> There is arch/powerpc/include/uapi/asm/ptrace.h
> 
> and if the installed header is used this is what should be included.
> 
> That does no include other asm headers.

Ah. Then asm-compat.h not, my bad.

I thought bcc[1] was pulling the kernel headers like a userspace
program, but it's actually pulling them in as if building a kernel
module, thus include path has arch/powerpc/include/asm/ptrace.h before
arch/powerpc/include/uapi/asm/ptrace.h[2].

> Thanks
> 
> Michal
...

1: https://github.com/iovisor/bcc
2: https://github.com/iovisor/bcc/blob/5bc97bb/src/cc/frontends/clang/kbuild_helper.cc#L81-L120


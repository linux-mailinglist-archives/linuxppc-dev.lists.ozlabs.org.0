Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E18B966E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 19:19:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZgRq6LfzzF3gn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 03:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tFxJYmQ3"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZgPp5PwXzF3gZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 03:17:16 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id r5so7485335wrm.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MAXIjagVVmgonNnmQANm0Oi+OX97y6W0ucvlA2vaghE=;
 b=tFxJYmQ32y4DTEt97iHGR9++ICIqv3KW/CKI7LmiTwcQ6/qjTSP24c00bj46Fcy2Vl
 o7taoK7cUXj3SYkmslBbg9k5qQbHg+oxXiSHDam/RIPjl9WRDnnoDU+G66dzMoiUdF+E
 lwlRJUZSgzW0LkcuYLql46Q14kA+y1Xn9VvmVQWGB8PKnNhXbdlzb1u9SWaIukOn4b4F
 oZsj1XodjzZDUNXdvzYmEz27pYij6m3V+nAOBTRcAiWv1JpmkALfu9jHlG9QqHMdqfJ8
 axi5puafr2RmYwi2+mJdnvuScnB+i+eBuTXNCd/JvLFGQA200MmQBS8k0pra4+6vObEr
 EHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MAXIjagVVmgonNnmQANm0Oi+OX97y6W0ucvlA2vaghE=;
 b=OptIKwgi+4vp0spmveSiU2siPIeHkhzXulccQIBhf3kdVCQicMd8BaPjcR4ZWxCp2+
 rzIER3ci93SbI8srEJ8hQUHKZtq8rPCek7bLJ3ownnAmCgrKV+VCqiqVZQYH45S6qaK9
 Yh/zVFxYhXH6QAS+sM7XtO9g3OjxPisSpN8wAX/ep/Tm00e021DMjF4rxEX5UAIO0oqy
 0XWGLeyE4/yLZhy7TyrE8J84rjVJrENmnmS1bpVhoxLnYXxYjdDHsNfI6rC/bm/bpeQV
 PvkchsJ/ecn0ekbSdotdqqrHk0XRaa9o4IwJS4OycPH2eDB7ydtjt40B4ENpEuKdpRIq
 YiDA==
X-Gm-Message-State: APjAAAUvzk7V6kW6GUY1KNz81ezaugPVtCBIy4vHnu3ZfwT0y53dr79u
 ucDJIMcuYIlCbocF/3cbiuE=
X-Google-Smtp-Source: APXvYqyTMc/SqdwOtLFlyZA4cvZxN7JuoJRP7q3xT8oWw3ACmPyLactbBCRMFaw57FTZc93VJHJiwA==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr7901983wrq.201.1568999831956; 
 Fri, 20 Sep 2019 10:17:11 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id i73sm2621906wmg.33.2019.09.20.10.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 10:17:11 -0700 (PDT)
Date: Fri, 20 Sep 2019 10:17:09 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Ilie Halip <ilie.halip@gmail.com>
Subject: Re: [PATCH] powerpc/pmac/smp: avoid unused-variable warnings
Message-ID: <20190920171709.GA58520@archlinux-threadripper>
References: <20190920153951.25762-1-ilie.halip@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920153951.25762-1-ilie.halip@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 06:39:51PM +0300, Ilie Halip wrote:
> When building with ppc64_defconfig, the compiler reports
> that these 2 variables are not used:
>     warning: unused variable 'core99_l2_cache' [-Wunused-variable]
>     warning: unused variable 'core99_l3_cache' [-Wunused-variable]
> 
> They are only used when CONFIG_PPC64 is not defined. Move
> them into a section which does the same macro check.
> 
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

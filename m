Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D768683ED3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 03:33:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463DXx5ykpzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 11:33:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=leo.yan@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="F4m9knoh"; 
 dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463DWG1rlJzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 11:31:53 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id j199so31492993ybg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 18:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T+sIdUCYVl9gdRoUkUG8PgRAt1MU+/JJSzC8cSPoyKI=;
 b=F4m9knohPlyqe6iRBIqFogCxSMnpxfTnrNWZCR9yxgbB7jxuwk5G49Fr3Yk/Xw8ml9
 BZedneP/R5GsmdKW1zaP8a4d6U9JK6r3soeGP9+77jQo83aNdUFu0Pg6auBFzgfb745n
 qZmIri2k5kirqo1rqRPqFtkeh+UaJ+gxE46qehbsLCBwyMGNAb4LzWNxxchylTugTGzF
 wLgGzWBtDpvrUKQxeBDO2XcdIgDVq4u0XiNjVcNspdW/kjB7dA7kKn81qOuPuEq5vT9D
 CCLS3aa+sHxb6m2tFFPS/rslez9LrTny5DfBMNa9fxii55Xz7IiwhaDAn2k/m6Tso2Db
 5r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T+sIdUCYVl9gdRoUkUG8PgRAt1MU+/JJSzC8cSPoyKI=;
 b=kopYo24pZBhXghaGtr5QSV6Lnupz0z5K5oud1gqrm3zZZ0mzuBoJqGaYrN1TbR4+f8
 Vm3IJOAqlFttF9IKo1Xq+13Jin52JAE2gYUJephdKsPQ9cV5d8TTDzN6JTwzo2pTFyhE
 E1YNfJQ8wtuIRHPOwCjosL/d5ZxFdqnPSeymLaf9h+Ne+LBc5pcpLBj+tQXEtnO6jxXx
 JYIpre/m8AUlmEbRuWjykDZ7nDHwysbfRKGo2j+MZ5TJ280tFiJBFvvXix0YKb3diHQ5
 y0627TyuFjIJJh2R/IQmf7vTvF0LYVP2zim6Lkuhj/smiOCM3HeauQUFzZ6xhwrsSGSJ
 KGeA==
X-Gm-Message-State: APjAAAVdQH9C2J4UrJNSV/TDzP/1cG6rzzK9IHfdyw4hzHyASffRkSmD
 c/pElcdEHtOawOxkQ2ys3+9iFw==
X-Google-Smtp-Source: APXvYqwBSZkykF5JBW3dZ2JAWQGnqKUHEgflynlYlJTG89ph5DdcJK1w1FbC6oyDXFDuWZCqly8qmQ==
X-Received: by 2002:a25:5986:: with SMTP id n128mr4697126ybb.301.1565141510026; 
 Tue, 06 Aug 2019 18:31:50 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (li1322-146.members.linode.com.
 [45.79.223.146])
 by smtp.gmail.com with ESMTPSA id k20sm20014855ywm.106.2019.08.06.18.31.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 18:31:49 -0700 (PDT)
Date: Wed, 7 Aug 2019 09:31:39 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 0/3] arm/arm64: Add support for function error injection
Message-ID: <20190807013139.GB6724@leoy-ThinkPad-X240s>
References: <20190806100015.11256-1-leo.yan@linaro.org>
 <20190807090811.1e50eb3e1d5a7b85743748e7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807090811.1e50eb3e1d5a7b85743748e7@kernel.org>
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
Cc: Song Liu <songliubraving@fb.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Yonghong Song <yhs@fb.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2019 at 09:08:11AM +0900, Masami Hiramatsu wrote:
> On Tue,  6 Aug 2019 18:00:12 +0800
> Leo Yan <leo.yan@linaro.org> wrote:
> 
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
> > 
> > - Enable kernel configuration:
> >   CONFIG_BPF_KPROBE_OVERRIDE
> >   CONFIG_BTRFS_FS
> >   CONFIG_BPF_EVENTS=y
> >   CONFIG_KPROBES=y
> >   CONFIG_KPROBE_EVENTS=y
> >   CONFIG_BPF_KPROBE_OVERRIDE=y
> > 
> > - Build samples/bpf on with Debian rootFS:
> >   # cd $kernel
> >   # make headers_install
> >   # make samples/bpf/ LLC=llc-7 CLANG=clang-7
> > 
> > - Run the sample tracex7:
> >   # dd if=/dev/zero of=testfile.img bs=1M seek=1000 count=1
> >   # DEVICE=$(losetup --show -f testfile.img)
> >   # mkfs.btrfs -f $DEVICE
> >   # ./tracex7 testfile.img
> >   [ 1975.211781] BTRFS error (device (efault)): open_ctree failed
> >   mount: /mnt/linux-kernel/linux-cs-dev/samples/bpf/tmpmnt: mount(2) system call failed: Cannot allocate memory.
> > 
> > Changes from v1:
> > * Consolidated the function definition into asm-generic header (Will);
> > * Used APIs to access pt_regs elements (Will);
> > * Fixed typos in the comments (Will).
> 
> This looks good to me.
> 
> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> 
> Thank you!

Thanks a lot for reviewing, Masami.

Leo.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F14101A1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 08:14:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HHBc63nCzDqFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 18:14:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=takahiro.akashi@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="nuNOMTdV"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HH8W60hfzDqBh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 18:12:43 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id p24so11708134pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 23:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SOkEaxvoeuRDKKO9iEeAXK3d8jDrm2+Y0YFp9RHvoAo=;
 b=nuNOMTdV6cqA5xhs04CNCftYPLjSdTjJ0ePCPMCc3uiZcs4YCBMy9ZamdEurSipKqb
 B7qbTtqSkuv+cFtd5XGfPFzEAOygMAUU6PfcUq9+XWmSNfghnDQd5F7MZO2RpEtgPBO4
 pY9GDSzO29EdOQ3rQOPPXttJfNyhL/qzEK/UbIBzD0EktqXFkIZukEz6uYOhqO/XpJSv
 CZVM33HewLSdQwXu5Sk//1CSz1ZkVkWtwDNAv2TM14cIkWzrIAXJHvymtQVGDfQtyKZ4
 Gy6ZtONETM6pOH2ZXJaQ3hbDHkgWZ1LaHoK8pE6aiIh13lYEHwfU8H2bnK85SCTR2yLA
 qJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=SOkEaxvoeuRDKKO9iEeAXK3d8jDrm2+Y0YFp9RHvoAo=;
 b=ih1Rd4ZMRSwsV2RWYZ8aQYNE0aR5rktV+RCMxsqx2/VlwL+gPP334yBj99ly75OWf0
 BJBVqxg/Y+zT7N0GMmTkCW8iVAD+t7meIGplullVVEjp9IhFrsmbe/W6SB2Paap55n1I
 +QfbXDIlAx7hi6xET0XLDMdg0sZoF6YEl3Ja0MN1fAaEPwqDq14aqgDPgm3KrF1olbtV
 a7UVD19u6dSQRmilUvYz8O3AEFszQ8rHLpgKqdxdhzUcgYeqkGWGIXuEDhfHgfUlmZsy
 5pf6iixuD3VuT2uHKT2Eke4phqhVFqvzd9rWnx4B7Low5W4slgBu7bgkqi57bqzwje+p
 vN1w==
X-Gm-Message-State: APjAAAVeS9DCdENSVjcv1KfHSQkSARmrQHlhXBYrcT9zrlIE452l71DG
 gDEiuQDcVQvIdjfeutrRKvFdNQ==
X-Google-Smtp-Source: APXvYqwFnemtfhSeFTtXNTKp5S2y3O1/8DNvV3VlNu9ve+aPwic4dTdlBLzDttqWkR7TRM8xvN2dTQ==
X-Received: by 2002:a63:68c3:: with SMTP id d186mr3516436pgc.301.1574147559580; 
 Mon, 18 Nov 2019 23:12:39 -0800 (PST)
Received: from linaro.org ([121.95.100.191])
 by smtp.googlemail.com with ESMTPSA id j7sm1931994pjz.12.2019.11.18.23.12.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 23:12:38 -0800 (PST)
Date: Tue, 19 Nov 2019 16:13:42 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Prabhakar Kushwaha <prabhakar.pkin@gmail.com>
Subject: Re: [PATCH v4 0/3] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
Message-ID: <20191119071341.GW22427@linaro.org>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Prabhakar Kushwaha <prabhakar.pkin@gmail.com>,
 Bhupesh Sharma <bhsharma@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, James Morse <james.morse@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Anderson <anderson@redhat.com>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 kexec mailing list <kexec@lists.infradead.org>
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
 <20191113063858.GE22427@linaro.org>
 <CACi5LpP54d9DKW63G5W6X4euBjAm2NwkHOiM01dB7g8d60s=4w@mail.gmail.com>
 <20191115015959.GI22427@linaro.org>
 <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ2QiJJOSspLKRh+jRB_o0o9nmeAsiFKzxGJ8R0pYPRM4iptmw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Bhupesh Sharma <bhsharma@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Boris Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Prabhakar,

On Tue, Nov 19, 2019 at 12:02:46PM +0530, Prabhakar Kushwaha wrote:
> Hi Akashi,
> 
> On Fri, Nov 15, 2019 at 7:29 AM AKASHI Takahiro
> <takahiro.akashi@linaro.org> wrote:
> >
> > Bhupesh,
> >
> > On Fri, Nov 15, 2019 at 01:24:17AM +0530, Bhupesh Sharma wrote:
> > > Hi Akashi,
> > >
> > > On Wed, Nov 13, 2019 at 12:11 PM AKASHI Takahiro
> > > <takahiro.akashi@linaro.org> wrote:
> > > >
> > > > Hi Bhupesh,
> > > >
> > > > Do you have a corresponding patch for userspace tools,
> > > > including crash util and/or makedumpfile?
> > > > Otherwise, we can't verify that a generated core file is
> > > > correctly handled.
> > >
> > > Sure. I am still working on the crash-utility related changes, but you
> > > can find the makedumpfile changes I posted a couple of days ago here
> > > (see [0]) and the github link for the makedumpfile changes can be seen
> > > via [1].
> > >
> > > I will post the crash-util changes shortly as well.
> > > Thanks for having a look at the same.
> >
> > Thank you.
> > I have tested my kdump patch with a hacked version of crash
> > where VA_BITS_ACTUAL is calculated from tcr_el1_t1sz in vmcoreinfo.
> >
> 
> I also did hack to calculate VA_BITS_ACTUAL is calculated from
> tcr_el1_t1sz in vmcoreinfo. Now i am getting error same as mentioned
> by you in other thread last month.
> https://www.mail-archive.com/crash-utility@redhat.com/msg07385.html
> 
> how this error was overcome?
> 
> I am using
>  - crashkernel: https://github.com/crash-utility/crash.git  commit:
> babd7ae62d4e8fd6f93fd30b88040d9376522aa3
> and
>  - Linux: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> commit: af42d3466bdc8f39806b26f593604fdc54140bcb

# I am rather reluctant to cross-post non-kernel patch to lkml/lakml,

The only change I made to crash utility was:
===8<===
diff --git a/arm64.c b/arm64.c
index 5ee5f1a29a41..84e40aeb561b 100644
--- a/arm64.c
+++ b/arm64.c
@@ -3857,8 +3857,8 @@ arm64_calc_VA_BITS(void)
 		} else if (ACTIVE())
 			error(FATAL, "cannot determine VA_BITS_ACTUAL: please use /proc/kcore\n");
 		else {
-			if ((string = pc->read_vmcoreinfo("NUMBER(VA_BITS_ACTUAL)"))) {
-				value = atol(string);
+			if ((string = pc->read_vmcoreinfo("NUMBER(tcr_el1_t1sz)"))) {
+				value = 64 - strtoll(string, NULL, 0);
 				free(string);
 				machdep->machspec->VA_BITS_ACTUAL = value;
 				machdep->machspec->VA_BITS = value;
===>8===

Thanks,
-Takahiro Akashi

> --pk

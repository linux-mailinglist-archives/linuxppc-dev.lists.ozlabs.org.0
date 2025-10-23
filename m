Return-Path: <linuxppc-dev+bounces-13196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5EC0026A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 11:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csgL51Z2zz3bd0;
	Thu, 23 Oct 2025 20:13:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761210781;
	cv=none; b=d0z8x94n9mo5jd3nXUPsgqPPxKOZ3iU1uLmHvpRthUbqPPYhyi3Z+ep+BU9oZ3Dkc/UOEtrHyaaym3MyPj9IJ5W0qTc9UcmHvFvav3o/7UXntFTNGEaoNdHI/+ZaEPlEIQbpYsDoqF+4SNzfU8IrM+WND6j0KW+gRsONB2OC+S7Z5LXpz4DmYM6OSR9v9tP0KXMUZpdL///vfKAG4nYLMY7t+i314heJm79VkSSlNgyILTmUDDw9ihb8t7U3VYNHR2Vodak8IHXjVm+MFrIcrSH3qu6KHCKa7awQSikXQMa9dp98aC4kZKW1Olp/tk5vFuUakvSvoS+fBh+u6Z9Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761210781; c=relaxed/relaxed;
	bh=m4YBI/EqtZ3J00PcXn67Kjmze22CptNisRya2F4tlEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncNyML6O2p/8y5HE+XvsVdw8H5RpGYeW8E+I/Pw9YdkeZ9DApC+fgl15Z+eRiRYML5EUs2/gVoaHpVW+6Mkr5zhezy+JQ+QQIHFioM2RFuCuZUuTb6613SdK2cU4+kcz/CBOVhMlg7+Rj1LPFU0wtrnvYJXH29xyvWUhzm22nQogjJtnBzvHdJeGpNdyYLxR6DmcajVdPgGo26UfhbacVDr89zYwnlKOVTHjhEvRAmwLqM27EuzXsdNQ4JBqJwrWH9lecp/1UoP7TERe4JlAr+S8VmgzGIom9PqWxmfzWJmS/0VySmjkaSoDiHM0JGoK7Xx6dGTLjHOBcWB0KSEX+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KUog9T+c; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KUog9T+c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csgL34Zv4z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 20:12:58 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47118259fd8so3420045e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761210775; x=1761815575; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4YBI/EqtZ3J00PcXn67Kjmze22CptNisRya2F4tlEU=;
        b=KUog9T+czsBS5NSh7v7YxtfwvhyEHB0b5MbXM6yeExHXK07I3kvxpaQHAVWXWmjQn2
         nsezt8SYnqgWikGtO65BeQEKw0u4xFXUqOj0UNyPu/PKZeuZtlxTXRyfTY2f2LK7jEkl
         J2Q5rXFeo8KUdPyifOOQohW4mLyKW6Tc4QyuULZj5JyDRYdVeFlxEEpHbFTCn2RWrQwx
         knUxnWn+UdVLbl5rpgtQXQpj51jRuRlK00DornfB21nbt20aN3Fr5DTuobysa0HC+f2I
         T1+LlDxQBlsPeh6iX6qEtmIXg7rgJR4blp1wwFI/GueyyQVfalwAu/L0ErbKVvMYzTRn
         NIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210775; x=1761815575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4YBI/EqtZ3J00PcXn67Kjmze22CptNisRya2F4tlEU=;
        b=IIiV3NyoaHDKfjbSMl0D/jOo1HGn/LUMl8VCoXR5i8KKqv1ggGrulM52YoTry2ZMLS
         3G6wrEsLjEKS+h6OfzYADw3eNivUGPaoViY+711FtlOCa23uqOELtZXmW8BhXuzPfzHo
         ge7m2HPDbXf2lEi4d3vR842UiXri18p7ajCxzNSbRQt/gXSBztgh9qTZj4P7eWBsOhFK
         38Ki31dwIpF+04u7O0VzS/xw/QKhHActLIAVYvDaiDWpAeBia+UhPic7b4qs9aDt4LlI
         GuZ3M22QcPZZ6RJSHPTiTpNWm5swIFEpovYBGEv7IW5kE4a5oFOESy1JS3DLhu3f6lv2
         b15A==
X-Forwarded-Encrypted: i=1; AJvYcCX/DpeN2jEv48Mf2mpdWx/edvH24StkCT2nRy7J7wARAXN3dFFZ5693vATTijLTs9h0rnZD6Dk+I/m0A+A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqGJxOm1epPmQf0LR8H/B39C/7C6uNaV6FQH5PBWS70pkoPDDO
	exRIsOgLVWJcwhUNR95aU61vALHeQMb56sgmEmMhO9+tg0tjzuwjVAEQ49GDcjaxVQo=
X-Gm-Gg: ASbGncsKqFyU+OEpd0gxz+FD4fvwbjXbLdnd65apCHjOYeVQ/Qiv91GHmWo/orcL1iA
	ye7rUqKiQzXi5MhuezQwckSf18LU0h1CfFoW7Ff+tC1cGklQGzybPVTn8xmjz7UOUTgd/x8jPwE
	mKUVYxnjfby5APSvcK01IQie8QoF6t2R3iTjhTC/0olC/veebGfQpt80pfeBHeDSWHKpJ8/ijE/
	+uwaUsNha2+ZyrP7ZBn5qQ1dnqRBtka7Rl0lA6GfWPV2Oqxe1W1SRsyt9JZFdo08IYlVjiwCxa+
	0pGvnCK++xcabeuS9r+PyoCyhfsa0gofYt9Jwk6/Pf5cpu/frKlcbWZd8H1Q45gLoMmNKGv2WBk
	+0FqbenkMyimbb1xzfkMj7eByOQraDeiUeAwOpuN71coV77vt9Z9NNVGIcn1Lt3XxKf4cN3h+1a
	Oi1c28OxlmzekrTO3twQ==
X-Google-Smtp-Source: AGHT+IG89jvdKxuLQ4STXYciOZm7sh9+DpSTyapJXa8dA1Qq3pMQ8PymDcsITN5Fq2o+BBm71Hcnuw==
X-Received: by 2002:a05:600c:3512:b0:471:12c2:201f with SMTP id 5b1f17b1804b1-471179134f0mr202907375e9.32.1761210774820;
        Thu, 23 Oct 2025 02:12:54 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342946sm85046525e9.10.2025.10.23.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:12:54 -0700 (PDT)
Date: Thu, 23 Oct 2025 11:12:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>, joe.lawrence@redhat.com,
	Naveen N Rao <naveen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, jpoimboe@kernel.org
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
Message-ID: <aPnxlEkV1rL0hWOm@pathway.suse.cz>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
 <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
 <aPjW3P2AU7L71S-s@pathway.suse.cz>
 <ee9aaeec-23bf-42ac-8a8d-4ba899cfdd13@linux.ibm.com>
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
In-Reply-To: <ee9aaeec-23bf-42ac-8a8d-4ba899cfdd13@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed 2025-10-22 19:56:45, Venkat Rao Bagalkote wrote:
> 
> On 22/10/25 6:36 pm, Petr Mladek wrote:
> > On Wed 2025-10-22 17:36:18, Venkat Rao Bagalkote wrote:
> > > On 22/10/25 1:52 pm, Venkat Rao Bagalkote wrote:
> > > > Greetings!!!
> > > > 
> > > > 
> > > > IBM CI has reported kernel boot warnings with next-20251022 kernel. I
> > > > see there are couple of warnings hit and eventually system boots to
> > > > emergency mode.
> > > > 
> > > > 
> > > With the identified first bad commit, is casuing the kernel to boot to
> > > emergency mode. I reverted the bad commit and built the kernel, then kernel
> > > is booting fine, but with boot warnings.
> > I guess that it is the same problem which should get fixed by the patch
> > https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org
> 
> 
> Thank you Petr, for pointing to the fix patch. It fixes the kernel booting
> to emergency mode.

Great.

> But boot warning still persists.

I looks like another problem. I would expect that it is in
the ftrace code, either in the generic or arch-specific part.

I would suggest to add people proposed by:

$> ./scripts/get_maintainer.pl arch/powerpc/kernel/trace/ftrace.c
Steven Rostedt <rostedt@goodmis.org> (maintainer:FUNCTION HOOKS (FTRACE))
Masami Hiramatsu <mhiramat@kernel.org> (maintainer:FUNCTION HOOKS (FTRACE))
Mark Rutland <mark.rutland@arm.com> (reviewer:FUNCTION HOOKS (FTRACE))
Madhavan Srinivasan <maddy@linux.ibm.com> (maintainer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Michael Ellerman <mpe@ellerman.id.au> (maintainer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Nicholas Piggin <npiggin@gmail.com> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Christophe Leroy <christophe.leroy@csgroup.eu> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
linux-kernel@vger.kernel.org (open list:FUNCTION HOOKS (FTRACE))
linux-trace-kernel@vger.kernel.org (open list:FUNCTION HOOKS (FTRACE))
linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
LINUX FOR POWERPC (32-BIT AND 64-BIT) status: Supported

into the original message with the backtrace. Or maybe, send it
once again and mention just the WARNING. The boot to the emergency
mode has been already solved...

Best Regards,
Petr


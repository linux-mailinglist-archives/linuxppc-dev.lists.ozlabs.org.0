Return-Path: <linuxppc-dev+bounces-13759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7AC32907
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:12:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GlF60p0z3bf8;
	Wed,  5 Nov 2025 05:12:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279961;
	cv=none; b=bC6Eq+H55/wPuPYtQ99yHhQQB7iRjuiHONSq//feiRHAPEozyUuVaSQE7QHLzpYmBXeD1tvUaY9oFka0lGc8krM2kwNj5mo3NMLS3f+8kpoPqoyEl4D+j9APOF7u1rhu/BlCQoXwPA8XBm6/I66oq/vZvst8hZbeV/jJGmr+YDNaZOq/v4SGutg4L0KP52IGg3FMdsc7SfeU9NQ8L6S+LRxs6/U+GALjzOzRVA8HYtDEoeqpwWbCPU0dgVI0c+voyc/4MgHeM6S0lUx7dJ+7zwKtYEI4uosjt6Hk1X+gRem8eXnECYRoPiEa/wvnj6Brr7ZiH5PkkD2D7/SejBp0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279961; c=relaxed/relaxed;
	bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PR9sHxTwOgl0i6AtXpwBZRYTNS0vnvqhKqBOw0vdo4yr/wwa0p4T3KDDY8tBLfFobpM/lz860BawsDo00AD6yaHxOrTshJEofWeUasUd8krGbHZ/zFxoczt4/v9cquVJeHZrZPT4nkFbMhgoJ8cCM/5GhqbIC86WmX0OTGUM4ZQAFr+FelGBA0PHkP26auv9UW+06zlDg4M9eQ4twytGddSFVaZgLeL5dOTPACQxarYgr/WIblF0LcKACozHjS+U4fdvZfJMcXQ5scrGVGsI0l57USH6h2W1FXTyf0NNOK6r03tSBw3GtNyM7RUuFLkp4xzZL95MFiTU1a6LXlIrGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WnoVkx62; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WnoVkx62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1GlD3BPHz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:12:40 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b8f70154354so885857a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762279958; x=1762884758; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=WnoVkx62tnUf/RW9sWYnwYI8zNGWmibBXzVY1PeK0+xdke/FjJZCu/TUoDASyK/bTx
         NZZZuuhLu4SqYGb0TGV+vVyjtHU7HcHAetgo1QshIn3nXvtPP4gSKecGo/83MyBIKHai
         LugGJOHdzP+xWQrI8l+67TMj/ukIcGTUMDqLASpTcxI64VAH6ZeXcypt3NN8w2acPQM/
         EMsXHAg7a4QIs/IQvYs3J3jgb2JOnqjP0J66p9Ac1iqL44a5x8IHv4Nnr4EhhAYCu5Eg
         0EgDAbhbQXoxt6yRlKiuimCBdVeYmNsNdwEhkNWS45LKDd5ehw9dGbp9UYLwM1ZWyHB4
         Uf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279958; x=1762884758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=svPn1DDb2KGArVxerVZr7EZC+Ui/Ap7SuP0uP2hrwJ2CkBwdvfLUDK6M9Qp2oxtJlZ
         gMgq5R0Qs+hrcIwaJwNkaYb29kcYVE/JDectqaKfl0M0sDu7LtZjlI/V2n/ibRsTO5Hl
         pDJIGYmh8FqnEHD9jRuuTP4g0Wr/gp7sXqtBzJXraZJxjKUXzb73mZ5/kdjD+v7D/rt1
         pumMcTGwlM0kWpG3EEEuOkYCK75Nm2CIrKB3CmnfKiICotne5YLiCbI+CEzH3EZr158i
         sj+qnaOfXkkT4smvfy8PKocBuS0YHSOHXBaFZ+I8dfgbNqFnuBIlTgpFMtDqh+zi5vJL
         k8JA==
X-Forwarded-Encrypted: i=1; AJvYcCXRWGBxwot4kVRsQNcK7wqzCVOvPoBDK3S9Dw5NP620RZ0lyiwxTFI1Z+VPUgJxrnQalTsu8L0B4rVIGO8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz4HJP6ag/blb5Qn2r9bcJfeTM60UgDq7vBMcQHnMwNfycsow0P
	ZMdagRLGq07LKbicWfSZVIO4dzEgXZ2qrUiDpAc9GxrXld+a+9g8WBObMAK1Ge8KdiE=
X-Gm-Gg: ASbGncuE/CYdacpVLv4P/DIfCua7jwbx6rzR+8szYat3ODEVwUaPOhuE/fxUyOqzUK1
	F2oB5dh/fVSYHDSrmLMVcDgF4Oq4j8faR3CJmwwDnzywI6IXgr6VDZ5nIJWfRsBs+u/FFo1kCME
	qaY5o7fkiBTpYgzJyRdVBtQ1CdoyE+kJssJc4AoGrOuVhHhm8wmF8L/9BhwrsBRNwIRaDBNVg51
	WC8aBWofvForJC3gGqgHqqQROPGiyInBXgJ2hL+JfN5APzg48RypRMQY1S29DVcJXtwIDifqXqp
	zVTEVA2B6DuWMy59sJiZPe4n4LhiMd90XQBajxuZxzsHk/90AiDsF0G0UJnATrnQzA++wGimqZ9
	ZbIzbYS/d/O9E+TP8iNqmFS2BwPzxJvU8VlZ3+IxH6RC7EO7JP5o84yzqhA==
X-Google-Smtp-Source: AGHT+IEfMevdEiMdqDvcfkgPhov93sowDZtb/5DAGljcPm4WdOYVS1DF54t90hQB/DDdvYdf8wD0vg==
X-Received: by 2002:a05:6a20:12c3:b0:342:8c38:ed0 with SMTP id adf61e73a8af0-34f87106a7cmr92855637.8.1762279958021;
        Tue, 04 Nov 2025 10:12:38 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::5:5bc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f87a6155sm3008088a12.29.2025.11.04.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:12:37 -0800 (PST)
Date: Tue, 4 Nov 2025 10:12:35 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-kbuild@vger.kernel.org, nathan@kernel.org,
	dimitri.ledkov@surgut.co.uk
Cc: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQpCE_XTU-bZHFbk@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> 
> On 04/11/25 4:47 pm, Samir M wrote:
> > Hello,
> > 
> > 
> > I am observing below error while running the make modules_install
> > command on latest mainline kernel on IBM Power11 server.
> > 
> > 
> > Error:
> > DEPMOD  /lib/modules/6.18.0-rc4 depmod: ERROR: kmod_builtin_iter_next:
> > unexpected string without modname prefix
> > 
> 
> IBM CI has also reported this error.
> 
> 
> Error:
> 
> 
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
>   INSTALL /boot
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> 
> 
> Git bisect is pointing to below commit as first bad commit.
> 
> 
> d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> commit d50f21091358b2b29dc06c2061106cdb0f030d03
> Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> Date:   Sun Oct 26 20:21:00 2025 +0000
> 
>     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
> 
>     Previously linker scripts would always generate vmlinuz that has
> sections
>     aligned. And thus padded (correct Authenticode calculation) and unpadded
>     calculation would be same. As in https://github.com/rhboot/pesign
> userspace
>     tool would produce the same authenticode digest for both of the
> following
>     commands:
> 
>         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
>         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> 
>     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>     vmlinux.unstripped") added .modinfo section of variable length.
> Depending
>     on kernel configuration it may or may not be aligned.
> 
>     All userspace signing tooling correctly pads such section to calculation
>     spec compliant authenticode digest.
> 
>     However, if bzImage is not further processed and is attempted to be
> loaded
>     directly by EDK2 firmware, it calculates unpadded Authenticode digest
> and
>     fails to correct accept/reject such kernel builds even when propoer
>     Authenticode values are enrolled in db/dbx. One can say EDK2 requires
>     aligned/padded kernels in Secureboot.
> 
>     Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespective
> of
>     modinfo contents can be loaded by all existing EDK2 firmware builds.
> 
>     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
>     Link:
> https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
for some configurations, which confused drgn until I added a workaround
(https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
So there's some funkiness in this area.

Thanks,
Omar


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97B43DAF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 08:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfvzP73DSz3cD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:00:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1iu/fP5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=salvatore.bonaccorso@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a1iu/fP5; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfsGr50VBz2xCh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 14:58:10 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id s19so8280723ljj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 20:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rd6zCtdbs2Rh9eLyPdLWC7QfjiBZneX2Pqf4p8XquB4=;
 b=a1iu/fP5TzuYTFr++xaSjuv7mLYIpvIUVBZDRjlHZlOzxUsN707HqC5FDhk0OodcZE
 F/XsII69uyg7tO3/kalMXCbRv0TbJpKo0YseDHSn1yZn62m5fZJjFJBX5RnlOCqMquJf
 07q3e1Ypq8n6CuqFgQdhMRa30oYO1W75wiOGTkE/rLiHoSPngE17V6JkWgXhnpMnRUZd
 +HQiKDKUo580k8iqy4jh7UyfS7qglWurwDFz6MT4sS6k7YgZMjQOhcsIodiiZYhka1zn
 z48AeHxhtIJLm5JBln9aZclXOeaEVaOD3juzI/xEjUANJcFrUITHbMaUk29JDHkHT5hx
 f3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Rd6zCtdbs2Rh9eLyPdLWC7QfjiBZneX2Pqf4p8XquB4=;
 b=AgFGDFX5CQKTPemMVd4t3yww15docBW7nnxZF4lIlZsD8fWuxJRkIqKHf/Caix2m6o
 mwVGa7Eznl3ZKMeIPLSY137xVFPzvicDGa+wDGe0l/8N9f5G81b1imtNvk5KrJQgronX
 v8PKTVoX/XptbuvUXAwxCde0kqBbqorwkqEpkIDVdFHyp0eFyKBnpVlKTmKUzGU6tU1g
 Mgn6Lcp8+/qSXtukeux7XYzJlGPSKcoD3oEQc4/lDiOsGzceCVvs8NtdL/xxrGl0mNhP
 vfhCV+2ConCDzG3drDVuF8PjvUMqmBiQRrV2AZK3WJhfe2jD7dp1g23n985Hmep8RMw0
 EkMQ==
X-Gm-Message-State: AOAM530L+wBRLFIInEsghFqffQmvO6pFkARlgTapUAItSUbSqeIhLNue
 bbImg8SxsnWws+HUd6aeSRo=
X-Google-Smtp-Source: ABdhPJws+hi+VGk4x9F3GsElqwOzk1Tf9/PmXVzVvbGPqLyjMn0UCHa/LfOj0e4muFxGG+LIRvWXzw==
X-Received: by 2002:a2e:a78e:: with SMTP id c14mr2101680ljf.208.1635393487069; 
 Wed, 27 Oct 2021 20:58:07 -0700 (PDT)
Received: from elende (elende.valinor.li. [2a01:4f9:6a:1c47::2])
 by smtp.gmail.com with ESMTPSA id s16sm4939lfr.29.2021.10.27.20.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 20:58:06 -0700 (PDT)
Date: Thu, 28 Oct 2021 05:58:05 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [oss-security] Linux kernel: powerpc: KVM guest can trigger host
 crash on Power8
Message-ID: <YXofzUCGm3N7lfNf@elende.valinor.li>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
X-Mailman-Approved-At: Thu, 28 Oct 2021 16:58:51 +1100
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
Cc: oss-security@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Oct 25, 2021 at 10:18:54PM +1100, Michael Ellerman wrote:
> The Linux kernel for powerpc since v5.2 has a bug which allows a
> malicious KVM guest to crash the host, when the host is running on
> Power8.
> 
> Only machines using Linux as the hypervisor, aka. KVM, powernv or bare
> metal, are affected by the bug. Machines running PowerVM are not
> affected.
> 
> The bug was introduced in:
> 
>     10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
> 
> Which was first released in v5.2.
> 
> The upstream fix is:
> 
>   cdeb5d7d890e ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
> 
> Which will be included in the v5.16 release.
> 
> Note to backporters, the following commits are required:
> 
>   73287caa9210ded6066833195f4335f7f688a46b
>   ("powerpc64/idle: Fix SP offsets when saving GPRs")
> 
>   9b4416c5095c20e110c82ae602c254099b83b72f
>   ("KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()")
> 
>   cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
>   ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest")
> 
>   496c5fe25c377ddb7815c4ce8ecfb676f051e9b6
>   ("powerpc/idle: Don't corrupt back chain when going idle")
> 
> 
> I have a test case to trigger the bug, which I can share privately with
> anyone who would like to test the fix.

The issue has been assigned CVE-2021-43056.

Regards,
Salvatore

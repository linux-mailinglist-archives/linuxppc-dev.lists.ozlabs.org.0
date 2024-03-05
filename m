Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD1871EB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:13:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BwBJkcBH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpvbd13Jjz3h05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 23:13:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BwBJkcBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpvZp6f2gz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 23:12:32 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d26227d508so64898591fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Mar 2024 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709640745; x=1710245545; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5m7gYDKto0sFQCZ782GSun8unKW9cIcfeVFfoYHYElE=;
        b=BwBJkcBH8bpDjwbMmf+ZlXmUWLuhfgMMXPF5+iM3jerY3lgQan75MyFyaISjJa2eXL
         yhVmgOM/jGZMP/UH255rBfUUVzPBr8606GcFyBKVuBKSGaRLS7oYb9BvZ9HKJq+ym+WC
         hnwJGTsoFRyiMzCSgkcdu/ggVENlh6OAJ0xuukTN8Q+lnLD5Fv9rDrXDX7bIJTkKwF+J
         UCO9SjW/X1YnvxTr69UYl0JjVhNZ4EMqqTS6yp3ExSdyHwJw2MHjGmsGVZCd5nMLXOrf
         mKS07B14ncF/x/QIG+X9Vkz65z9wpd1cOEu+Jp9IdTeO0WYl37DKlOx+AjzSJ/pvzUBl
         VUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640745; x=1710245545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5m7gYDKto0sFQCZ782GSun8unKW9cIcfeVFfoYHYElE=;
        b=IhRO4MHDJMl9nVq2hPw1Ns97mgQA8AvcPL7Hw6658pgmxU8XxXzvg2TMEtISZi7/2R
         UsIoYIC+4layWUzeSjkt1GNhVw4bN7KWbOMo8LNPA+Wy9tj5i8enXZaCvMHL05eNav6A
         H1QZTUry1oB/WLoNbWdw8aEHoFRD1s8VKGJ3NxjjrwrCZQN/ZosxwfkGsYTOmgHsKgXc
         xiVY+0Etmu9JJis+AMAG6sLuBwdC2MymFwH8+BOUzESDqjb1gK1w1T99CR6JHuZ4uGx3
         yQOS/atT+vX4KSTvRUAS4pSEz8IFX8aaBQv4KAgVKz15iBKKiLZ81/7YXISEqWh2kP13
         emCw==
X-Forwarded-Encrypted: i=1; AJvYcCUKQC7vT+4iFqZ3iucoWzNObE0v9D/KylXRgSeD89JbokJoNbPNiVS58AaBgWXk8ldsAhsRuz216/g6mSFVGjtrNaKx0zVlLlKlLSdrSQ==
X-Gm-Message-State: AOJu0YxcVmcKvud3iS0NoU9Xi7Plo5CYEgMvFH5QTgbb42vMcy1rytJ4
	kUK12ADHIBM3dqiZ+iFTzxX9VnIXPZGVADMe9px5mrAdxDb48Ox7EcNgPSAPE/Q=
X-Google-Smtp-Source: AGHT+IGD7Z2QBwGwn4YryjUN6znpGI3JV/UOun2bVjCoidWV/1/p0sKcqoMZxU2kw7bIWMzf+PXSuw==
X-Received: by 2002:a2e:300d:0:b0:2d2:9b77:6e38 with SMTP id w13-20020a2e300d000000b002d29b776e38mr1074386ljw.27.1709640745431;
        Tue, 05 Mar 2024 04:12:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v29-20020a50a45d000000b005649f17558bsm6021422edb.42.2024.03.05.04.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 04:12:25 -0800 (PST)
Date: Tue, 5 Mar 2024 13:12:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
Message-ID: <20240305-7ef885812bb2490a8110f301@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <CZLGGDYWE8P0.VKR8WWH6B6LM@wheely>
 <542716d5-2db2-4bba-9c58-f5fa32b22d52@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <542716d5-2db2-4bba-9c58-f5fa32b22d52@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 07:26:18AM +0100, Thomas Huth wrote:
> On 05/03/2024 03.19, Nicholas Piggin wrote:
> > On Fri Mar 1, 2024 at 10:41 PM AEST, Thomas Huth wrote:
> > > On 26/02/2024 11.12, Nicholas Piggin wrote:
> > > > Add basic testing of various kinds of interrupts, machine check,
> > > > page fault, illegal, decrementer, trace, syscall, etc.
> > > > 
> > > > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > > > can be incorrectly set to 0.
> > > 
> > > Two questions out of curiosity:
> > > 
> > > Any chance that this could be fixed easily in QEMU?
> > 
> > Yes I have a fix on the mailing list. It should get into 9.0 and
> > probably stable.
> 
> Ok, then it's IMHO not worth the effort to make the k-u-t work around this
> bug in older QEMU versions.
> 
> > > Or is there a way to detect TCG from within the test? (for example, we have
> > > a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
> > > tests that are known to fail on TCG there)
> > 
> > I do have a half-done patch which adds exactly this.
> > 
> > One (minor) annoyance is that it doesn't seem possible to detect QEMU
> > version to add workarounds. E.g., we would like to test the fixed
> > functionality, but older qemu should not. Maybe that's going too much
> > into a rabbit hole. We *could* put a QEMU version into device tree
> > to deal with this though...
> 
> No, let's better not do this - hardwired version checks are often a bad
> idea, e.g. when a bug is in QEMU 8.0.0 and 8.1.0, it could be fixed in 8.0.1
> and then it could get really messy with the version checks...
>

We've tried to address this type of issue (but for KVM, so kernel versions
instead of QEMU versions) in the past by inventing the errata framework,
which is based on environment variables. Instead of checking for versions,
we check for a hash (which is just the commit hash of the fix). While we
do guess that the fix is present by version number, it can always be
manually set as present as well. In any case, the test is simply skipped
when the errata environment variable isn't present, so in the worst case
we lose some coverage we could have had, but the rest of the tests still
complete and we don't get the same failures over and over. An example of
its use is in arm/psci.c. Look for the ERRATA() calls.

We could extend the errata framework for QEMU/TCG. We just need to add
another bit of data to the errata.txt file for it to know it should
check QEMU versions instead of kernel versions for those errata. We can
also ignore the errata framework and just create the errata environment
variable which would by 'n' by default now and later, after distros have
fixes, it could be changed to 'y'.

Thanks,
drew

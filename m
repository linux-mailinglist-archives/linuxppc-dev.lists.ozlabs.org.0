Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2391620905
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 06:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5xrG5bS7z3cKV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 16:44:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNdeC13p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNdeC13p;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5xqM3wSDz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 16:43:57 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id v17so13254950plo.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 21:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UicMHRBXNKZ6klzBYtNlGfdpT3ipHtBcp9O7LuoFbE=;
        b=XNdeC13pb4LjOBaRWcKMBNqFRJ+RgsbfVoNw18z5L+vfkg1SZceZjUxbLhiIy1qySy
         Y4hI02da8j9ev8qt2sUsGeUiOSLlDAUgz5JUplPGm8kAk4jLtNdmDFZCCStM1EGIelNU
         pjjtL4FSGAVwgisQucoSj4vLVpkgLqzZdzX9wYytiy3sfYNB3aYKj8S/Nug5gaKAa8gA
         /5oDb+KCNmSa3bC/jNyCQmeij+quPN3cyVSSr1ovXCPVJxrqYAAydTsm3Q4bRt6yNhxm
         6FVSyKTuVZN23UWZkdV6Uc7djgZpboRwjQPImKvKrchYImM3eB6pVBMtJk1jJ8Nfk6ob
         kIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UicMHRBXNKZ6klzBYtNlGfdpT3ipHtBcp9O7LuoFbE=;
        b=S2CmnEPxXvCEcbzHhTRN23lLhCg76X8qXN/3Y5F0RKYRxbb26uWqEiQ0/6xSXWkbeX
         Q+qVYzMdFUhC9Pfhvlcmzgb0UJwpHAoKIRZNoUIN9r4Ty0h1opF5t8dvy7cvu8hCYlwm
         9KTCf9yVPM5Dg1KVlMqWA/2tMfXHA084nZIvteREvq+lMgO4CSBZtCKX8YBlN6ok1fUn
         sbUJ3Mg8O3doTnwNdREUzk59zFTKbrMnrGw751xBKI0sCe3xZFnFrwPNxPdcvraqPuga
         UkvYGW1jYU+OvanHIgQNKlD1n5RQxVdejY2/s5aemKrFFMwvGBb58Hs87UGDWr2HwdPZ
         LODQ==
X-Gm-Message-State: ACrzQf3d+6hIjF2Wa/oSzO6vOL6qal+5RcvvOY9ER3mw2a0TgWbOcDn7
	26NDpuxPrzEZmfN43FuT5hM=
X-Google-Smtp-Source: AMsMyM6Ssf7qu6Zt1cmqzeY+6ksfJF4jyx1t2euaZBhwzvq5JPVY+8zsaODdG48vWXQYQDWTdtSyvw==
X-Received: by 2002:a17:90b:4a04:b0:213:587b:204e with SMTP id kk4-20020a17090b4a0400b00213587b204emr55088612pjb.98.1667886235549;
        Mon, 07 Nov 2022 21:43:55 -0800 (PST)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id k21-20020a628415000000b0056bb06ce1cfsm5614872pfd.97.2022.11.07.21.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 21:43:55 -0800 (PST)
Date: Mon, 7 Nov 2022 21:43:54 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <20221108054354.GA1708572@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
 <20221107214634.GE1063309@ls.amr.corp.intel.com>
 <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>
 , "Yao, Yuan" <yuan.yao@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "Christopherson,, Sean" <seanjc@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 08, 2022 at 01:09:27AM +0000,
"Huang, Kai" <kai.huang@intel.com> wrote:

> On Mon, 2022-11-07 at 13:46 -0800, Isaku Yamahata wrote:
> > > On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > > > Thanks for the patch series. I the rebased TDX KVM patch series and it
> > > > worked.
> > > > Since cpu offline needs to be rejected in some cases(To keep at least one
> > > > cpu
> > > > on a package), arch hook for cpu offline is needed.
> > > 
> > > I hate to bring this up because I doubt there's a real use case for SUSPEND
> > > with
> > > TDX, but the CPU offline path isn't just for true offlining of CPUs.  When
> > > the
> > > system enters SUSPEND, only the initiating CPU goes through
> > > kvm_suspend()+kvm_resume(),
> > > all responding CPUs go through CPU offline+online.  I.e. disallowing all
> > > CPUs from
> > > going "offline" will prevent suspending the system.
> > 
> > The current TDX KVM implementation disallows CPU package from offline only
> > when
> > TDs are running.  If no TD is running, CPU offline is allowed.  So before
> > SUSPEND, TDs need to be killed via systemd or something.  After killing TDs,
> > the
> > system can enter into SUSPEND state.
> 
> This seems not correct.  You need one cpu for each to be online in order to
> create TD as well, as TDH.MNG.KEY.CONFIG needs to be called on all packages,
> correct?

That's correct. In such case, the creation of TD fails.  TD creation checks if
at least one cpu is online on all CPU packages.  If no, error.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC662016C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 22:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5lFb6rFcz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 08:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GL+2Bxv6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GL+2Bxv6;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5lDd4Jbqz3c1x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 08:46:39 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id l2so12318461pld.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 13:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9On9UDwN9+FMOJXKCMZYipbKJoIjLKP2XZ3U7kBuoB0=;
        b=GL+2Bxv6ry2q2tVdZRODeD97j7WTZ0CqlPqVG3cOZfSQ2lPpNfGbSsDDWxIi7pHIp0
         4gPpC/0UyTeXngfMw/90jVGCYvfydu4VVDIBdRhsclgKtmxCEiA9BP4R87XQG30smBdC
         1/LRsqd/o2s4hFf8dQGeyUXxQVNajfdobkSuQnz0LYFbUg3nN2WjiofwzLBJS7P0QSlq
         3E2aD8E0qfRqk/z6hwmiW9lLNW6MmCIaXMhDFh5+LVoso6k/SENsDAmWDZa1hpQYz//Q
         JF3KaJnULb3SlFFzyr0MclyB75dQs6HtyFHyOI25a5zATM3F+OUwHUTUTEkKDNPpwCyo
         BpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9On9UDwN9+FMOJXKCMZYipbKJoIjLKP2XZ3U7kBuoB0=;
        b=Hi9h4pwWpEEZ6j8KczKgYB67ePjag+94/2uzoi8ieKSarADHESe13ty7ICNV8lOgdq
         Fegj88snYYE6qyI+/zDdDwpxgsiYWjPtnqNN4iw/bSC4dyA2QYgCQkx7CD5mwHXOGXVA
         x5JUI3vZ/xS/cnna4j392v2vYFGocMvvMD3NitJfhA0/7vdISn3rabeepNkFcdsgfFXI
         RhtW/bZMePrpLeIqJw2MmO3gJ1TPIMQWgGdr+36Nq+8E+VfI6qPPjAJxWSnz6SDIatud
         72pcJlwYXVQQ8V6l6cejxBRO7CQ0Nqa3ZbNvLoHBjwmOTAwZ1VqbsJhqFpHRnj0tRxnh
         9XAw==
X-Gm-Message-State: ACrzQf0pwSe65mdz5FbhPAYWx6Q8rz8/jMaX26skqPqmorH74XtcFx9o
	O8EN/Bec+KCUdz8e17EJLcc=
X-Google-Smtp-Source: AMsMyM5nI4bmuY9lD4XinO2gz+Xc6KHSLBRiOXpXoSFa21NNV37M1qdfO6ImmoOBa63VChvhPC/Cjg==
X-Received: by 2002:a17:90b:1d12:b0:20c:8edd:59a3 with SMTP id on18-20020a17090b1d1200b0020c8edd59a3mr52739175pjb.222.1667857596321;
        Mon, 07 Nov 2022 13:46:36 -0800 (PST)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b0056c0b98617esm4981650pfc.0.2022.11.07.13.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:46:35 -0800 (PST)
Date: Mon, 7 Nov 2022 13:46:34 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <20221107214634.GE1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2V1oslbw24/2Opd@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel
 .com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 04, 2022 at 08:27:14PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> > Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> > on a package), arch hook for cpu offline is needed.
> 
> I hate to bring this up because I doubt there's a real use case for SUSPEND with
> TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
> system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
> all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
> going "offline" will prevent suspending the system.

The current TDX KVM implementation disallows CPU package from offline only when
TDs are running.  If no TD is running, CPU offline is allowed.  So before
SUSPEND, TDs need to be killed via systemd or something.  After killing TDs, the
system can enter into SUSPEND state.


> I don't see anything in the TDX series or the specs that suggests suspend+resume
> is disallowed when TDX is enabled, so blocking that seems just as wrong as
> preventing software from soft-offlining CPUs.

When it comes to SUSPEND, it means suspend-to-idle, ACPI S1, S3, or S4.
suspend-to-idle doesn't require CPU offline.

Although CPU related spec doesn't mention about S3, the ACPI spec says

  7.4.2.2 System _S1 State (Sleeping with Processor Context Maintained)
  The processor-complex context is maintained.

  7.4.2.4 System _S3 State or 7.4.2.5 System _S4 State
  The processor-complex context is not maintained.

It's safe to say the processor context related to TDX is complex, I think.
Let me summarize the situation. What do you think?

- While no TD running:
  No additional limitation on CPU offline.

- On TD creation:
  If any of whole cpu package is software offlined, TD creation fails.
  Alternative: forcibly online necessary CPUs, create TD, and offline CPUs

- TD running:
  Although it's not required to keep all CPU packages online, keep CPU package
  from offlining for TD destruction.

- TD destruction:
  If any of whole cpu package is software offlined, TD destruction fails.
  The current implementation prevents any cpu package from offlinining during
  TD running.
  Alternative:
  - forcibly online necessary CPUs, destruct TD, and offline CPUs again and
    allow CPU package to offline
  - Stash TDX resources somewhere. When cpu packages are onlined, free those
    release.

- On SUSPEND:
  TODO: Allow CPU offline if S1 is requested.
  - suspend-to-idle: nothing to do because cpu offline isn't required
  - ACPI S1: Need to allow offline CPUs.  This can be implemented by referencing
    suspend_state_t pm_suspend_target_state is PM_SUSPEND_TO_STANBY.
  - ACPI S3/S4: refuse cpu offline.  The system needs to kill all TDs before
    starting SUSPEND process. This is what is implemented.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

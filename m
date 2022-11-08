Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF305621B07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6FtB4YZKz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 04:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ftWxPl3+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ftWxPl3+;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6FsG0yndz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 04:46:40 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d20so13758275plr.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Nov 2022 09:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cjSjC5m99kmUUHYC704oOlI8KJi6LTudhKVnFW3q+Mo=;
        b=ftWxPl3+8IfelsK/irLrvblaLrX6dvTk43ZU1RGb7E7QhEuhpuFGQnZUs1B/6eqA8Y
         9uQybJjBJrLcnswih9ZuqdP/IGzw5N1LHsBYZwMjKm4pxbrW1ieLuxCyIbeQvnPHGIX9
         KlKI+02Y2PtkvzGrkUCj7EVO4k0DJZDFtOtuUtFMvCioPX+FiFS160StdFwaRhG4AwZY
         /X/0r60JYMQEe4UtsauftLe+islfrGWTT7n2RWyEhP6x94J5Vb4QTPr7DjEYHP04yepW
         KF97tjKStfZxjB8uLonmnyGRloE774fNFuZ/STi6vuLRLYYB1EDXjhtfDOqD4TBoTzbU
         ZVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjSjC5m99kmUUHYC704oOlI8KJi6LTudhKVnFW3q+Mo=;
        b=H03ktnF7w2TgtFv0jPk22f+MUQNV9FBcTEEfZiZTQ4iVhj6nwt3lxN6LLGqJlrJC73
         ILEkHoMCFyu3gVtn5Ev5hQ7imohqV51d0myNDB3isRa3EBUUXMlfoV8AjbC0FpGh6l0o
         C1iccdT96mwKqMwfYDItTO1ofmq9x17VNgM5D/0KZtFu47Ci21kpqgcTYCqpAtZUXEki
         h80UeofAzouQhD1m8+QsLp3b7pA5iohjgjs2VEMxbZ2+1Z3YRsj2Gv/g4x0um5QL2Sab
         2TWgjXTrekH7imoEYvXG0TxFm3qQBQ9WjEOUbpv1hzRaMZT6MvwoFVy4d6BfjBzDYriQ
         YzDg==
X-Gm-Message-State: ACrzQf1QWxMiQt6xxqMBXis3olnKL6GjSewHRsTuOZ+5EICMXp3rfy4K
	LGPq5xPyM+/D0dKGhZWfsV2tYg==
X-Google-Smtp-Source: AMsMyM6IejjlUU0y+myBNmX6xdBJY00CqsdAF2QTJKOsZh5WixYj1ODA6TQRcmab3f8JPfGm8K7ciQ==
X-Received: by 2002:a17:902:ea04:b0:187:4923:56f4 with SMTP id s4-20020a170902ea0400b00187492356f4mr35142106plg.97.1667929596484;
        Tue, 08 Nov 2022 09:46:36 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902d50900b00185402cfedesm7283578plg.246.2022.11.08.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 09:46:35 -0800 (PST)
Date: Tue, 8 Nov 2022 17:46:32 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <Y2qV+IGKyKQItMj2@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
 <Y2V1oslbw24/2Opd@google.com>
 <20221107214634.GE1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107214634.GE1063309@ls.amr.corp.intel.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 07, 2022, Isaku Yamahata wrote:
> On Fri, Nov 04, 2022 at 08:27:14PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> > > Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> > > Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> > > on a package), arch hook for cpu offline is needed.
> > 
> > I hate to bring this up because I doubt there's a real use case for SUSPEND with
> > TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
> > system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
> > all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
> > going "offline" will prevent suspending the system.
> 
> The current TDX KVM implementation disallows CPU package from offline only when
> TDs are running.  If no TD is running, CPU offline is allowed.  So before
> SUSPEND, TDs need to be killed via systemd or something.  After killing TDs, the
> system can enter into SUSPEND state.

Ah, I assumed offlining was disallowed if TDX was enabled.

> > I don't see anything in the TDX series or the specs that suggests suspend+resume
> > is disallowed when TDX is enabled, so blocking that seems just as wrong as
> > preventing software from soft-offlining CPUs.
> 
> When it comes to SUSPEND, it means suspend-to-idle, ACPI S1, S3, or S4.
> suspend-to-idle doesn't require CPU offline.
> 
> Although CPU related spec doesn't mention about S3, the ACPI spec says
> 
>   7.4.2.2 System _S1 State (Sleeping with Processor Context Maintained)
>   The processor-complex context is maintained.
> 
>   7.4.2.4 System _S3 State or 7.4.2.5 System _S4 State
>   The processor-complex context is not maintained.
> 
> It's safe to say the processor context related to TDX is complex, I think.
> Let me summarize the situation. What do you think?
> 
> - While no TD running:
>   No additional limitation on CPU offline.
> 
> - On TD creation:
>   If any of whole cpu package is software offlined, TD creation fails.
>   Alternative: forcibly online necessary CPUs, create TD, and offline CPUs

The alternative isn't really viable because there's no way the kernel can guarantee
a CPU can be onlined, i.e. the kernel would need to fallback of disallowing TD
creation anyways.

> - TD running:
>   Although it's not required to keep all CPU packages online, keep CPU package
>   from offlining for TD destruction.
> 
> - TD destruction:
>   If any of whole cpu package is software offlined, TD destruction fails.
>   The current implementation prevents any cpu package from offlinining during
>   TD running.
>   Alternative:
>   - forcibly online necessary CPUs, destruct TD, and offline CPUs again and
>     allow CPU package to offline
>   - Stash TDX resources somewhere. When cpu packages are onlined, free those
>     release.
> 
> - On SUSPEND:
>   TODO: Allow CPU offline if S1 is requested.

Is this actually a TODO?  I assume the kernel doesn't actually try to offline
CPUs in this case, i.e. it Just Works.

>   - suspend-to-idle: nothing to do because cpu offline isn't required
>   - ACPI S1: Need to allow offline CPUs.  This can be implemented by referencing
>     suspend_state_t pm_suspend_target_state is PM_SUSPEND_TO_STANBY.
>   - ACPI S3/S4: refuse cpu offline.  The system needs to kill all TDs before
>     starting SUSPEND process. This is what is implemented.

Looks good, disallowing SUSPEND with active TDs is a reasonable tradeoff.  As
above, I highly doubt anyone actually cares.

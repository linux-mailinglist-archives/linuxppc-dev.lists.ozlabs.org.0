Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73D62C30F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 16:53:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC6yq2n2Gz3cfX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 02:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Axl8RQ6K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Axl8RQ6K;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC6xw3bQ0z3cGV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 02:52:35 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id p12so16796981plq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=coErVjWyqhzO9EuKB5XSmlh7IJj5NvKWNvG7xdrbhC4=;
        b=Axl8RQ6KDdRrT9Z9C/Q7WDP07ILGsJIsXvmq6hEH7xYRxr1KYM7WfFS4wN+lhhZ4fX
         c4Jtlogr7Ros9vXyyEFv/zFAE8+4peFtT7kH9mbNBRnzYJ/2b8sYrYCafzb/t5b9hh4H
         MzZxnel8UMmtPU7lGv2FYN+iMfYeZiXKTt6kJLjx0bmpPltUoJ0RtRfd1Ec/nG1HLpUR
         NvlX1cr6oDpawENjKiQcMRdisM4zgyG2koLhhizlhvLd74nRufWrbXHhbtX0zrVof0Oh
         3EiecDo5X1cIJiERj7KVmypmulB3/lI1LWoLIDeuu1zT2CC/G2udJFJRosnSOWJ19zuG
         AhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coErVjWyqhzO9EuKB5XSmlh7IJj5NvKWNvG7xdrbhC4=;
        b=p1Lh4WjEmrM7ORzBtpURUoW58kD7w1QRmvoNiJr9ji6cGkbDFOFZqs6GzDW46RpSMH
         i6PhxZL2kYchUkZTbJeJeIU6jyMlg/jYJgC5a8Nq6rCPwUAxDExVdBPMFaHo3X+2GFVR
         ByQQ2RdakmDRGEzqO3c9tjz8zUIgCM3dydiPjkc8G+sAZcSdXvCHVRBu3DcUkHQTrYTX
         pM56uxx5OuobfxR1EUg9m6aFBcv03tZHHfD4JlVBDZrhinG1QrWYugGFAERjVczjfKr6
         AIbfuYECSC977xam0cTfg/a+91B+68J7JYP8/6qjoCvreru6GpjJlkn7slFxNPo3c2rH
         i3vA==
X-Gm-Message-State: ANoB5pk786l3u6/H0H4yxjQEMDNI1m6nw5+U050ldj7XEzm9czmt2Maf
	/uPks/lpNPs1BaJgozoFrb2p/w==
X-Google-Smtp-Source: AA0mqf7dFwkFbcATwoaCt8aciY1qylOnTaB4gr/nPlKa0OFTmbzR8xQHyljgxnYchchnXSvQiHP/Xg==
X-Received: by 2002:a17:902:6944:b0:188:640f:f401 with SMTP id k4-20020a170902694400b00188640ff401mr9754670plt.44.1668613950911;
        Wed, 16 Nov 2022 07:52:30 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902650e00b00177e5d83d3esm12341507plk.88.2022.11.16.07.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 07:52:30 -0800 (PST)
Date: Wed, 16 Nov 2022 15:52:26 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
Message-ID: <Y3UHOg7E0iRFpjml@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-14-seanjc@google.com>
 <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux
 .dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> > Acquire a new mutex, vendor_module_lock, in kvm_x86_vendor_init() while
> > doing hardware setup to ensure that concurrent calls are fully serialized.
> > KVM rejects attempts to load vendor modules if a different module has
> > already been loaded, but doesn't handle the case where multiple vendor
> > modules are loaded at the same time, and module_init() doesn't run under
> > the global module_mutex.
> > 
> > Note, in practice, this is likely a benign bug as no platform exists that
> > supports both SVM and VMX, i.e. barring a weird VM setup, one of the
> > vendor modules is guaranteed to fail a support check before modifying
> > common KVM state.
> > 
> > Alternatively, KVM could perform an atomic CMPXCHG on .hardware_enable,
> > but that comes with its own ugliness as it would require setting
> > .hardware_enable before success is guaranteed, e.g. attempting to load
> > the "wrong" could result in spurious failure to load the "right" module.
> > 
> > Introduce a new mutex as using kvm_lock is extremely deadlock prone due
> > to kvm_lock being taken under cpus_write_lock(), and in the future, under
> > under cpus_read_lock().  Any operation that takes cpus_read_lock() while
> > holding kvm_lock would potentially deadlock, e.g. kvm_timer_init() takes
> > cpus_read_lock() to register a callback.  In theory, KVM could avoid
> > such problematic paths, i.e. do less setup under kvm_lock, but avoiding
> > all calls to cpus_read_lock() is subtly difficult and thus fragile.  E.g.
> > updating static calls also acquires cpus_read_lock().
> > 
> > Inverting the lock ordering, i.e. always taking kvm_lock outside
> > cpus_read_lock(), is not a viable option, e.g. kvm_online_cpu() takes
> > kvm_lock and is called under cpus_write_lock().
> 
> "kvm_online_cpu() takes kvm_lock and is called under cpus_write_lock()" hasn't
> happened yet.

Doh, right.  Thanks!

> > The lockdep splat below is dependent on future patches to take
> > cpus_read_lock() in hardware_enable_all(), but as above, deadlock is
> > already is already possible.
> 
> IIUC kvm_lock by design is supposed to protect vm_list, thus IMHO naturally it
> doesn't fit to protect multiple vendor module loading.

A different way to look at it is that kvm_lock protects anything that is global to
all of KVM, and it just so happens that lists and counters of VMs are the only
such resources (lumping in the usage in vm_uevent_notify_change() and the future
usage to protect kvm_usage_count).

> Looks above argument is good enough.  I am not sure  whether we need additional
> justification which comes from future patches. :)

To try to prevent someone from trying to eliminate the "extra" lock, like this
series does for kvm_count_lock.  Hopefully future someones that want to clean up
the code do a git blame to understand why the lock was introduced and don't waste
their time running into the same issues (or worse, don't run into the issues and
break KVM).

> Also, do you also want to update Documentation/virt/kvm/locking.rst" in this
> patch?

Hmm, yeah.  That'd also be a good place to document why kvm_lock isn't used.

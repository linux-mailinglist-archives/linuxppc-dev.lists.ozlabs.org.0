Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAE640A4A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:09:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNyYQ3lv7z2xH9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 03:08:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kw0qyCOM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kw0qyCOM;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNyXX2Vypz3bfd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 03:08:12 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id c7so1922100pfc.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Dec 2022 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMdFvNSIKdTJxppFI5JflU3ZXHxkZjSJ4fG5U4tk7Tk=;
        b=kw0qyCOMp2u+ojev0wrASw/lF7r9rOnRJHqLy08FIIr+f+qpPtSFohe59bJmaOi/rJ
         xcGzBwmHctfDCuY/HsZstsw01nTTKqB9D0ItsIVCZBuDkF6U4LFd8/XxyiMZ9HQQBawu
         5Br6kbHRMEkmhVdkrdlpAnXBg7aXr8x1ngEkT987D0vDq9wJ1LYSA7pyGWl0PB6S36YX
         Ye0BXjX/JFQwCFB0idj1kNjBh1WOFf2yIueArh18nn+f3Kk6RhG95XRHvHGlIJTCnyAw
         T+Hf0HOA9lpO63L3167YfTmLHua9wbiTHz1XwCqkS0us3SdkuoK9a/bX1aNd1tZdIG9m
         GSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMdFvNSIKdTJxppFI5JflU3ZXHxkZjSJ4fG5U4tk7Tk=;
        b=SYZ+x6ZJKqzmn3uPWxFfZWBo+o/bpoENlFzWclxltVrt0yIDaw4vSvTaEeAiPtXcWT
         +/zVWK0oFvcCsRwn0WYweD3CAPd2iiYYJAh98RQ0BMcBtWa45WCFJcn5o7G27VOIhcnj
         cQ6oRXxdMmwiHlvBUJ/96paly1cVJudZwcemDDDzLyWnqZm6S9Kfzpsz451uBKEPc+K7
         QWi+xMvx5BKInMez3DDEEueBnVrq6sE9vuzloOPX8it0sFRwcIwf27Jekp8eOk47VsSV
         1xt4BaFFRJRBGewO10vb6SXvZGdoeuulrabKA5EJAKHdjxmEsDnvLeHknQDjzh/1UYFD
         terQ==
X-Gm-Message-State: ANoB5pkd3nHxDk0blsWIsAqdZv4iCQMmagKFOMHQhYaVJ6z50TieSPO/
	Qf6d0aSnjNHMcjiHILRIED0B3g==
X-Google-Smtp-Source: AA0mqf5a5KU+HXt1yCJ0zhlFtswkW2r0VasQIXpEBIwwE2hKQw/T3gXBywz5nj+1M/Ux52wSBF1P1g==
X-Received: by 2002:a63:495e:0:b0:470:75a1:c6d7 with SMTP id y30-20020a63495e000000b0047075a1c6d7mr47336241pgk.120.1669997286584;
        Fri, 02 Dec 2022 08:08:06 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709026f1700b00189667acf19sm5714233plk.95.2022.12.02.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:08:06 -0800 (PST)
Date: Fri, 2 Dec 2022 16:08:02 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Subject: Re: [PATCH v2 41/50] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Message-ID: <Y4oi4oRk7jsCqYJO@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-42-seanjc@google.com>
 <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "paul@xen.org" <paul@xen.org>, "Yao, Yuan" <yuan.yao@intel.com>, "david@redhat.com" <david@redhat.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "kvm
 @vger.kernel.org" <kvm@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 02, 2022, Huang, Kai wrote:
> On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> > From: Chao Gao <chao.gao@intel.com>
> > 
> ...
> 
> > 
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Chao Gao <chao.gao@intel.com>
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Perhaps I am wrong, but I have memory that if someone has SoB but isn't the
> original author should also have a Co-developed-by?

This is the case where a patched is passed along as-is, e.g. same as when
maintainers apply a patch.  Isaku posted Chao's patch, and then I came along and
grabbed the patch that Isaku posted.  I could go back and grab Chao's patch
directly, but Yuan's review was provided for the version Isaku posted, so I
grabbed that version.

> > Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> > [sean: drop WARN that IRQs are disabled]
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

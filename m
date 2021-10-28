Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614C43E118
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:40:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg4sn00fKz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 23:40:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AX9Vw8LX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AX9Vw8LX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AX9Vw8LX; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AX9Vw8LX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg4s31lvLz2xYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:40:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635424801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BilMP89d5ejwGExRisJLsaqgEV5K1hYN/wwdRA5k/bw=;
 b=AX9Vw8LX7atLr3QjzuVpfzeVUtjav32uDSMWbvzOTmhkRJ+1tx4kyF5hLW1IV5wQiu2A7z
 dS70CO5q3kNx/PxqAF5WyQc5pDIfsYHTTXtwk1O5x2D72HxnFYgpQTl1B54WeDYfLn62R3
 ym0zGWHN1SUebHnqFGAY//+1aw3aZro=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635424801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BilMP89d5ejwGExRisJLsaqgEV5K1hYN/wwdRA5k/bw=;
 b=AX9Vw8LX7atLr3QjzuVpfzeVUtjav32uDSMWbvzOTmhkRJ+1tx4kyF5hLW1IV5wQiu2A7z
 dS70CO5q3kNx/PxqAF5WyQc5pDIfsYHTTXtwk1O5x2D72HxnFYgpQTl1B54WeDYfLn62R3
 ym0zGWHN1SUebHnqFGAY//+1aw3aZro=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-yOyhxR2eNCmF6pao28URVQ-1; Thu, 28 Oct 2021 08:39:59 -0400
X-MC-Unique: yOyhxR2eNCmF6pao28URVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso2599927wml.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 05:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BilMP89d5ejwGExRisJLsaqgEV5K1hYN/wwdRA5k/bw=;
 b=ZwCAORZM5/ThSw0d4fzJyll/x4WrqRifVi4Q1gak8duRsxHrPG/mBYL3nfiZhzUtQI
 SwFjUHfF09QZNAQrJ5mi0PsjEms74E8EHnhLqm6NmXTXsrvKdrLbz6PIF2fIbtjZFogz
 Sv+vLV00/oIVv2W0a22EGmIRpppfLrHHzEXB3QHMmHqHoATn60ZzG5lILz3y6ajmF+I+
 F3GRNWzShq7BkiAFP1oJJXpT/Gf0quPB6jHS4faKa6mGoS/Wjarg9lGXYJHpddz/JhZS
 z23VuygDS7BRBlk1VrGXqZn9nrY49Du6E7tcG7iUfTMiNkOe7DvH2ZAsubFvMjuNej09
 LSGg==
X-Gm-Message-State: AOAM533a2OdlKBwDappozQsx7jxbEwW+aLN2XRDrQ7Pv2Yh6xKZJejF0
 JeYJGNbSMPlLfvZExEgztN+K72Vj9MZ0CE8VN2WIaPPNt94WVneDB2dexrI/QEzvoraC7v+jbdj
 lcOBpbkvgjVFfiNlSdcUB/wvhAQ==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr4091575wme.186.1635424798268; 
 Thu, 28 Oct 2021 05:39:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpBmS3oMhxO4yW4Qb9VQGEeYaL6u24h46UykydIOpW7bcXe3uHXi4ooalXiK9fBVtsvOBkuw==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr4091549wme.186.1635424798001; 
 Thu, 28 Oct 2021 05:39:58 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id h14sm6603444wmq.34.2021.10.28.05.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 05:39:57 -0700 (PDT)
Message-ID: <641e823b-ed22-1e3f-6ce5-eeb09e8f947f@redhat.com>
Date: Thu, 28 Oct 2021 14:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] KVM: PPC: Tick accounting should defer vtime
 accounting 'til after IRQ handling
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211027142150.3711582-1-npiggin@gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211027142150.3711582-1-npiggin@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/10/2021 16:21, Nicholas Piggin wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> Commit 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest
> context before enabling irqs") moved guest_exit() into the interrupt
> protected area to avoid wrong context warning (or worse). The problem is
> that tick-based time accounting has not yet been updated at this point
> (because it depends on the timer interrupt firing), so the guest time
> gets incorrectly accounted to system time.
> 
> To fix the problem, follow the x86 fix in commit 160457140187 ("Defer
> vtime accounting 'til after IRQ handling"), and allow host IRQs to run
> before accounting the guest exit time.
> 
> In the case vtime accounting is enabled, this is not required because TB
> is used directly for accounting.
> 
> Before this patch, with CONFIG_TICK_CPU_ACCOUNTING=y in the host and a
> guest running a kernel compile, the 'guest' fields of /proc/stat are
> stuck at zero. With the patch they can be observed increasing roughly as
> expected.
> 
> Fixes: e233d54d4d97 ("KVM: booke: use __kvm_guest_exit")
> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
> Cc: <stable@vger.kernel.org> # 5.12
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> [np: only required for tick accounting, add Book3E fix, tweak changelog]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v2:
> - I took over the patch with Laurent's blessing.
> - Changed to avoid processing IRQs if we do have vtime accounting
>    enabled.
> - Changed so in either case the accounting is called with irqs disabled.
> - Added similar Book3E fix.
> - Rebased on upstream, tested, observed bug and confirmed fix.
> 
>   arch/powerpc/kvm/book3s_hv.c | 30 ++++++++++++++++++++++++++++--
>   arch/powerpc/kvm/booke.c     | 16 +++++++++++++++-
>   2 files changed, 43 insertions(+), 3 deletions(-)
> 

Tested-by: Laurent Vivier <lvivier@redhat.com>

Checked with mpstat that time is accounted to %guest while a stress-ng test is running in 
the guest. Checked there is no warning in the host kernellogs.

Thanks,
Laurent


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAB29EDA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 14:53:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMRjk6dhczDqMB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 00:53:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RWL8KRDN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RWL8KRDN; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMRcM1Pz2zDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 00:48:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603979328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+6ALnmfHcbX2Kh97Sk3d/ZU9yuOlfGICNtafCoGnYo=;
 b=RWL8KRDN0YA6cAdUr3Zvqm52bMQDO01X2zpI0GLgtXALg7VDXd6OkJDsTqE12ARdEIvTrN
 hIDPp8LxMzlTyWs/zvaLLfnsUqYAc+HUNzFnBR2ITRSvbPQE4kKZXVqgPAnY9FZfgR0uex
 ujRcmReuhzjtZs7KQPFil41+3LTLYq4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603979328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+6ALnmfHcbX2Kh97Sk3d/ZU9yuOlfGICNtafCoGnYo=;
 b=RWL8KRDN0YA6cAdUr3Zvqm52bMQDO01X2zpI0GLgtXALg7VDXd6OkJDsTqE12ARdEIvTrN
 hIDPp8LxMzlTyWs/zvaLLfnsUqYAc+HUNzFnBR2ITRSvbPQE4kKZXVqgPAnY9FZfgR0uex
 ujRcmReuhzjtZs7KQPFil41+3LTLYq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-RccU4qHMN-6y7QVzvonbrQ-1; Thu, 29 Oct 2020 09:48:40 -0400
X-MC-Unique: RccU4qHMN-6y7QVzvonbrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E23A1902EA4;
 Thu, 29 Oct 2020 13:48:38 +0000 (UTC)
Received: from ovpn-66-212.rdu2.redhat.com (ovpn-66-212.rdu2.redhat.com
 [10.10.66.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1705560C17;
 Thu, 29 Oct 2020 13:48:37 +0000 (UTC)
Message-ID: <50aea6567bbdf89e03d50820c19cfb16bb764338.camel@redhat.com>
Subject: Re: [PATCH] powerpc/smp: Move rcu_cpu_starting() earlier
From: Qian Cai <cai@redhat.com>
To: paulmck@kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 29 Oct 2020 09:48:36 -0400
In-Reply-To: <20201029003127.GJ3249@paulmck-ThinkPad-P72>
References: <20201028182334.13466-1-cai@redhat.com>
 <87lffpx598.fsf@mpe.ellerman.id.au>
 <20201029003127.GJ3249@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-10-28 at 17:31 -0700, Paul E. McKenney wrote:
> On Thu, Oct 29, 2020 at 11:09:07AM +1100, Michael Ellerman wrote:
> > Qian Cai <cai@redhat.com> writes:
> > > The call to rcu_cpu_starting() in start_secondary() is not early enough
> > > in the CPU-hotplug onlining process, which results in lockdep splats as
> > > follows:
> > 
> > Since when?
> > What kernel version?
> > 
> > I haven't seen this running CPU hotplug tests with PROVE_LOCKING=y on
> > v5.10-rc1. Am I missing a CONFIG?
> 
> My guess would be that adding CONFIG_PROVE_RAW_LOCK_NESTING=y will
> get you some splats.

Well, I don't have that set, so it should be CONFIG_PROVE_RCU_LIST=y. Anyway,
this is .config to reproduce on Power9 NV:

https://cailca.coding.net/public/linux/mm/git/files/master/powerpc.config


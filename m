Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3F3940C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 12:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs0wL0Jzhz30CX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 20:16:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7BA7+z8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7BA7+z8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=X7BA7+z8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=X7BA7+z8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs0vs5LBJz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 20:16:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622196981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/MeyHq86FYDiQmED7OBAcxclfCXwOV7n7cri6A9SGbY=;
 b=X7BA7+z8QgdxdzcGc9AhmE6QzTJU/EN+quHxOYpPYwDucX8aTlNWrjQjGzmP+T+3IPtFw5
 9oIRDIJLy41acRa7crFdl6pAoIGuFLOywesapKU6HHM+gVRXam5hcL9haUndNHEmPrl4C0
 yPGSjI50jSQjzHEn+y2wgwBYrkluDU0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622196981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/MeyHq86FYDiQmED7OBAcxclfCXwOV7n7cri6A9SGbY=;
 b=X7BA7+z8QgdxdzcGc9AhmE6QzTJU/EN+quHxOYpPYwDucX8aTlNWrjQjGzmP+T+3IPtFw5
 9oIRDIJLy41acRa7crFdl6pAoIGuFLOywesapKU6HHM+gVRXam5hcL9haUndNHEmPrl4C0
 yPGSjI50jSQjzHEn+y2wgwBYrkluDU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-jVuwpz2AP6aXM8xrP8ldEQ-1; Fri, 28 May 2021 06:16:19 -0400
X-MC-Unique: jVuwpz2AP6aXM8xrP8ldEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72687801817;
 Fri, 28 May 2021 10:16:17 +0000 (UTC)
Received: from krava (unknown [10.40.192.177])
 by smtp.corp.redhat.com (Postfix) with SMTP id 9709250450;
 Fri, 28 May 2021 10:16:12 +0000 (UTC)
Date: Fri, 28 May 2021 12:16:11 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
Message-ID: <YLDC6zQUtoITdX4s@krava>
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <4fee8c12-194f-3f85-e28b-f7f24ab03c91@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fee8c12-194f-3f85-e28b-f7f24ab03c91@iogearbox.net>
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 netdev@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, andrii.nakryiko@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 11:56:02AM +0200, Daniel Borkmann wrote:

SNIP

> 
> Ondrej / Paul / Jiri: at least for the BPF tracing case specifically (I haven't looked
> at the rest but it's also kind of independent), the attached fix should address both
> reported issues, please take a look & test.
> 
> Thanks a lot,
> Daniel

> From 5893ad528dc0a0a68933b8f2a81b18d3f539660d Mon Sep 17 00:00:00 2001
> From: Daniel Borkmann <daniel@iogearbox.net>
> Date: Fri, 28 May 2021 09:16:31 +0000
> Subject: [PATCH bpf] bpf, audit, lockdown: Fix bogus SELinux lockdown permission checks
> 
> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> added an implementation of the locked_down LSM hook to SELinux, with the aim
> to restrict which domains are allowed to perform operations that would breach
> lockdown. This is indirectly also getting audit subsystem involved to report
> events. The latter is problematic, as reported by Ondrej and Serhei, since it
> can bring down the whole system via audit:
> 
>   i) The audit events that are triggered due to calls to security_locked_down()
>      can OOM kill a machine, see below details [0].
> 
>  ii) It seems to be causing a deadlock via slow_avc_audit() -> audit_log_end()
>      when presumingly trying to wake up kauditd [1].
> 
> Fix both at the same time by taking a completely different approach, that is,
> move the check into the program verification phase where we actually retrieve
> the func proto. This also reliably gets the task (current) that is trying to
> install the tracing program, e.g. bpftrace/bcc/perf/systemtap/etc, and it also
> fixes the OOM since we're moving this out of the BPF helpers which can be called
> millions of times per second.

nice idea.. I'll try to reproduce and test

jirka


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB9739268A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 06:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrFVZ55gSz301m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 14:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=namei.org
 (client-ip=65.99.196.166; helo=mail.namei.org; envelope-from=jmorris@namei.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 401 seconds by postgrey-1.36 at boromir;
 Thu, 27 May 2021 14:40:00 AEST
Received: from mail.namei.org (namei.org [65.99.196.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrFV80mmnz2yY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 14:39:59 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.namei.org (Postfix) with ESMTPS id E7A544A2;
 Thu, 27 May 2021 04:28:11 +0000 (UTC)
Date: Thu, 27 May 2021 14:28:11 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
In-Reply-To: <CAFqZXNtUvrGxT6UMy81WfMsfZsydGN5k-VGFBq8yjDWN5ARAWw@mail.gmail.com>
Message-ID: <3ad4fb7f-99f3-fa71-fdb2-59db751c7e2b@namei.org>
References: <20210517092006.803332-1-omosnace@redhat.com>
 <87o8d9k4ln.fsf@mpe.ellerman.id.au>
 <CAFqZXNtUvrGxT6UMy81WfMsfZsydGN5k-VGFBq8yjDWN5ARAWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Paul Moore <paul@paul-moore.com>, SElinux list <selinux@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, network dev <netdev@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021, Ondrej Mosnacek wrote:

> Thanks, Michael!
> 
> James/Paul, is there anything blocking this patch from being merged?
> Especially the BPF case is causing real trouble for people and the
> only workaround is to broadly allow lockdown::confidentiality in the
> policy.

It would be good to see more signoffs/reviews, especially from Paul, but 
he is busy with the io_uring stuff.

Let's see if anyone else can look at this in the next couple of days.

-- 
James Morris
<jmorris@namei.org>


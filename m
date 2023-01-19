Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C0673D86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:32:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyRSs6C6kz3fFg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:32:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SjmLa/qL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SjmLa/qL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pauld@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SjmLa/qL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SjmLa/qL;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyRRy5xj9z3fB9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:31:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674142283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyecrqHkLk/PkFUatvRgjW9EozPNMXCVVPb055VprZQ=;
	b=SjmLa/qLwciaXVGCuvmF51HaOC2m70Lf2otCm/SaK8Kl+Y5IPKpQ/UyUWqc8c2OwQJKysT
	RbEAPu6O9ATob/Hg/+b6MOff5//mbZb90LoRLUctIYcEDyyh7Gd8AYpZ5oU07GTIflgMRm
	CDs5gE6+EtT4JBgvZgF6BX1NfN8LDXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674142283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyecrqHkLk/PkFUatvRgjW9EozPNMXCVVPb055VprZQ=;
	b=SjmLa/qLwciaXVGCuvmF51HaOC2m70Lf2otCm/SaK8Kl+Y5IPKpQ/UyUWqc8c2OwQJKysT
	RbEAPu6O9ATob/Hg/+b6MOff5//mbZb90LoRLUctIYcEDyyh7Gd8AYpZ5oU07GTIflgMRm
	CDs5gE6+EtT4JBgvZgF6BX1NfN8LDXc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-1xVW1Lw0O0u_uKWjSMixlA-1; Thu, 19 Jan 2023 10:31:20 -0500
X-MC-Unique: 1xVW1Lw0O0u_uKWjSMixlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3C32181E3EE;
	Thu, 19 Jan 2023 15:31:19 +0000 (UTC)
Received: from lorien.usersys.redhat.com (unknown [10.22.34.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71B4C2026D68;
	Thu, 19 Jan 2023 15:31:19 +0000 (UTC)
Date: Thu, 19 Jan 2023 10:31:18 -0500
From: Phil Auld <pauld@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: sched/debug: CPU hotplug operation suffers in a large cpu systems
Message-ID: <Y8liRrYL8WpKt+up@lorien.usersys.redhat.com>
References: <Y06ISBWhJflnV+NI@kroah.com>
 <Y1jVjX9FUuUilcjA@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y1jbhCYfktL51zNB@kroah.com>
 <Y1j5cqbyZCDlyaTn@hirez.programming.kicks-ass.net>
 <Y2oozs/YgqqRV5hq@li-05afa54c-330e-11b2-a85c-e3f3aa0db1e9.ibm.com>
 <Y2pKh3H0Ukvmfuco@kroah.com>
 <Y5d+ZqdxeJD2eIHL@lorien.usersys.redhat.com>
 <Y5gaerSL8pXZcIjR@kroah.com>
 <Y5h8sqHD9/RWNeYS@lorien.usersys.redhat.com>
 <Y5iMql1nKBkukjJK@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5iMql1nKBkukjJK@kroah.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: ritesh.list@gmail.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, Peter Zijlstra <peterz@infradead.org>, aneesh.kumar@linux.ibm.com, Vishal Chourasia <vishalc@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sshegde@linux.ibm.com, mingo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg, et alia,

On Tue, Dec 13, 2022 at 03:31:06PM +0100 Greg Kroah-Hartman wrote:
> On Tue, Dec 13, 2022 at 08:22:58AM -0500, Phil Auld wrote:

> > > 
> > > The idea seems good, the implementation might need a bit of work :)
> > 
> > More than the one comment below? Let me know.
> 
> No idea, resubmit a working patch and I'll review it properly :)
> 

I finally got this posted, twice :(. Sorry for the delay, I ran into
what turned out to be an unrelated issue while testing it, plus end of
the year holidays and what not. 

https://lore.kernel.org/lkml/20230119150758.880189-1-pauld@redhat.com/T/#u


Cheers,
Phil

-- 


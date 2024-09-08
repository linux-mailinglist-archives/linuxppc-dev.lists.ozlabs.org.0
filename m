Return-Path: <linuxppc-dev+bounces-1149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC597069C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 12:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1mTB25MNz2xYr;
	Sun,  8 Sep 2024 20:30:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725791454;
	cv=none; b=WGRux6WBgUQLVHfXUxb1g8fvd1OoUJ+CVft4UFeV80ksne5DGBmmpZkKCgbF5NFmtx8ulHkM5IhRPQkrP/s/WlY0DbqBpirmbH2X76M99ND5GjHrr2iTLebMNNGB6Q2eOJwTEjuk5wsNwniphIRleT4ggfyMRF/GLrlhbIOH+ir7vH1QAV9kiVfxjLtkNhF+GkJY8o4CJW3qUHM0wBREovsNISpoKKXPoDOoAZcxRsi9MR7nKbfla/cFKidTRoVaWn/IDOFlQ7QV2PTTLzhL2ouWin/iERY+FjCiB+vwERKTmVXGwzxAqi/OMvQKFPNeclQc3IUS9a+SmofmTts6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725791454; c=relaxed/relaxed;
	bh=i5OMd23lOq0TQ1xex/NXYk3jY8jVWK0MlC2mTgfKJm8=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=dRxjph1Tu7a2fPD9ZidbHWn+s2XSHoiAD1cIYfJQ6VWNm23+V9WAe7txMWfxsv+G7lZhz+ABh68ixhsY+FJ6A/WWTBFOgz9B0rFrpu9nYl5h9CzAlF5K2U59QuqudknPLEomH7UjwIMnparHXEgrkTOaXavO9EU8nDD4x4Jvb44zovpmjB5kiBlDxXJzButEa0NtPCM+zBYjnPjjsQqlg2Qfqgst7ZPy/GijVVQTrccLt89hka12AZuIUhLSI9oBWEGotE4xkBE/6vJE48k3kzPyA1noieLbQlDDrJGqPHiMvPSlJ5RYHuYhuLn4mT9CpMzBYk+y2PCvnjggcEf2hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6cN6j5x; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GyRBvpfs; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6cN6j5x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GyRBvpfs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1mT95d7Xz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 20:30:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725791448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5OMd23lOq0TQ1xex/NXYk3jY8jVWK0MlC2mTgfKJm8=;
	b=Q6cN6j5xe/dca4pANw0S8LnMrOme0Sl8EWEMqCecrMKe66vc0mLcsbFGCAeKnAAoPWpagF
	6E/LbQeL1DjiZtn70+ZpZxE8A/HOb9YxqdsTevpcwACrgHUY0cDUVyGsnP5sK6ZVlgncSG
	FkBCJCQ7svaF0wP56R2g2QniLNsV9y4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725791449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5OMd23lOq0TQ1xex/NXYk3jY8jVWK0MlC2mTgfKJm8=;
	b=GyRBvpfsmoHa6WE0+wtc51yRAUaIv0dihYy9buZU59aH08tkFK0Jxp0eZfZ+5UQACHwGtS
	fLLFfBBJkDLxqICY0V65+UPUTLLRKMh+UthULQ9FkMnCadfIhZn3fF+s69e00Gjpg2Yuvo
	dFN/CrOF5jU8AkBuSmCTaIuQvSojF50=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-3_IErx1HNZWPkhjP_PcxIQ-1; Sun,
 08 Sep 2024 06:30:43 -0400
X-MC-Unique: 3_IErx1HNZWPkhjP_PcxIQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76F5F19560B5;
	Sun,  8 Sep 2024 10:30:41 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91F211956056;
	Sun,  8 Sep 2024 10:30:39 +0000 (UTC)
Date: Sun, 8 Sep 2024 18:30:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
Message-ID: <Zt18yUCWRK8178uv@MiWiFi-R3L-srv>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
 <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
 <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
 <ZtGqTSMvx6Ljf5Xi@MiWiFi-R3L-srv>
 <0dd94920-b13f-4da7-9ea6-4f008af1f4b3@linux.ibm.com>
 <ZtkkIoUIu8shp/ut@MiWiFi-R3L-srv>
 <c6f30e31-69fe-4ece-b251-c49f1ab59a04@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6f30e31-69fe-4ece-b251-c49f1ab59a04@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/05/24 at 02:07pm, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 05/09/24 08:53, Baoquan He wrote:
> > On 09/04/24 at 02:55pm, Sourabh Jain wrote:
> > > Hello Baoquan,
> > > 
> > > On 30/08/24 16:47, Baoquan He wrote:
> > > > On 08/20/24 at 12:10pm, Sourabh Jain wrote:
> > > > > Hello Baoquan,
> > > > > 
> > ......snip...
> > > > > 2. A patch to return early from the `crash_handle_hotplug_event()` function
> > > > > if `kexec_in_progress` is
> > > > >      set to True. This is essentially my original patch.
> > > > There's a race gap between the kexec_in_progress checking and the
> > > > setting it to true which Michael has mentioned.
> > > The window where kernel is holding kexec_lock to do kexec boot
> > > but kexec_in_progress is yet not set to True.
> > > 
> > > If kernel needs to handle crash hotplug event, the function
> > > crash_handle_hotplug_event()  will not get the kexec_lock and
> > > error out by printing error message about not able to update
> > > kdump image.
> > But you wanted to avoid the erroring out if it's being in
> > kernel_kexec().  Now you are seeing at least one the noising
> > message, aren't you?
> 
> Yes, but it is very rare to encounter.
> 
> My comments on your updated code are inline below.
> 
> > 
> > > I think it should be fine. Given that lock is already taken for
> > > kexec kernel boot.
> > > 
> > > Am I missing something major?
> > > 
> > > > That's why I think
> > > > maybe checking kexec_in_progress after failing to retriving
> > > > __kexec_lock is a little better, not very sure.
> > > Try for kexec lock before kexec_in_progress check will not solve
> > > the original problem this patch trying to solve.
> > > 
> > > You proposed the below changes earlier:
> > > 
> > > -	if (!kexec_trylock()) {
> > > +	if (!kexec_trylock() && kexec_in_progress) {
> > >   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> > >   		crash_hotplug_unlock();
> > Ah, I meant as below, but wrote it mistakenly.
> > 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index 63cf89393c6e..e7c7aa761f46 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
> >   	crash_hotplug_lock();
> >   	/* Obtain lock while reading crash information */
> > -	if (!kexec_trylock()) {
> > +	if (!kexec_trylock() && !kexec_in_progress) {
> >   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> >   		crash_hotplug_unlock();
> >   		return 0;
> > 
> > 
> > > 
> > > Once the kexec_in_progress is set to True there is no way one can get
> > > kexec_lock. So kexec_trylock() before kexec_in_progress is not helpful
> > > for the problem I am trying to solve.
> > With your patch, you could still get the error message if the race gap
> > exist. With above change, you won't get it. Please correct me if I am
> > wrong.
> 
> The above code will print an error message during the race gap. Here's why:
> 
> Let’s say the kexec lock is acquired in the kernel_kexec() function,
> but kexec_in_progress is not yet set to True. In this scenario, the code
> will print
> an error message.
> 
> There is another issue I see with the above code:
> 
> Consider that the system is on the kexec kernel boot path, and
> kexec_in_progress
> is set to True. If crash_hotplug_unlock() is called, the kernel will not
> only update
> the kdump image without acquiring the kexec lock, but it will also release
> the
> kexec lock in the out label. I believe this is incorrect.
> 
> Please share your thoughts.

How about this?

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 63cf89393c6e..8ba7b1da0ded 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -505,7 +505,8 @@ int crash_check_hotplug_support(void)
 	crash_hotplug_lock();
 	/* Obtain lock while reading crash information */
 	if (!kexec_trylock()) {
-		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
+		if (!kexec_in_progress)
+			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
 		crash_hotplug_unlock();
 		return 0;
 	}
@@ -540,7 +541,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 	crash_hotplug_lock();
 	/* Obtain lock while changing crash information */
 	if (!kexec_trylock()) {
-		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
+		if (!kexec_in_progress)
+			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
 		crash_hotplug_unlock();
 		return;
 	}



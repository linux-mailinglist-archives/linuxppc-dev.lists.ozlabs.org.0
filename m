Return-Path: <linuxppc-dev+bounces-804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAD796606D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:17:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwFxZ3LqFz307f;
	Fri, 30 Aug 2024 21:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725016674;
	cv=none; b=bsFkf+dXcMYK1/yi/IWNRoObA4WC6eIRq3s0kW+BPLb5N7vufVA/g5nqXWFbHakkcKlLm6U79wdNGFs7bL52KWBHUQDCfHLXPh3vdabUmQrYpaN/GBHyc3mGFc/Kl8W20kFdqr/fmSK/tvV8I2ng5JNgCh8XCRzKU4QxfEPoxV/PUtJ9fnX0SExED2z3KnfaL20ugG2OorcUnOIkwBFCKJA7gqk8Syba6Cz53WwANlXD9JEHquE5/lWBL6XOWtsfhJv7tVM9H4GfC86jZxvpUVMdiQqOvrasg5BGKJPbmw6SHsm8AkcwEmaPARB+zju4AEIJoVr7v7ecB0fwCNSZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725016674; c=relaxed/relaxed;
	bh=pUb4QrzT7qCuzKr20VTbfQnlpedFsYgESJIJB+0lq8k=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Scanned-By; b=EH266Zm0eR5/U4NiE5M5hVhhP9+27MLYtbD/rs8icgHAz+LGVssyQBNXV4M1aWIoHWXIZW6Q49AkhT3wKlxVvMJj9kTTKSK0zee7EA4uZRtolE4aoBsrF3jg4EhprTq+7XSeGk79TjGxHKUWd0SRCWgJIbptg+uInFLjhxupQ+9NGYyu0BjRtKGjpRJ0/OW3isdWFiLCi8gZMtMnVenYs1AT3Cj1MJPkTm5oZUNx+PbyNukxBq58U2i9171ep1hLc2FxKF9AEN4WjNEC5XPclcxgXtoLtxe+aC36vloTwtk+1/s0wWQKqrm5Lz1MFsmik+EbpOiBv4hmZIfzRNOS6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JvhkxaC4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JvhkxaC4; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JvhkxaC4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JvhkxaC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwFxY6TYzz306G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:17:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725016665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUb4QrzT7qCuzKr20VTbfQnlpedFsYgESJIJB+0lq8k=;
	b=JvhkxaC4uUy3VF0/Sze0UrYKGDsrxNVzk4SBdw6nCNuWIlQ81qB87w8SSDlVDwtxUStKXQ
	wJsWtvXwAL5tvmXxZp1R2iDLZeG9B/1XT8+8U1WPzoz2v5gvqOzFSS7PPc5VdvjJwatHs0
	rZvUWO4DUumZ2kQShGu7ecWMLWDm9oI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725016665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUb4QrzT7qCuzKr20VTbfQnlpedFsYgESJIJB+0lq8k=;
	b=JvhkxaC4uUy3VF0/Sze0UrYKGDsrxNVzk4SBdw6nCNuWIlQ81qB87w8SSDlVDwtxUStKXQ
	wJsWtvXwAL5tvmXxZp1R2iDLZeG9B/1XT8+8U1WPzoz2v5gvqOzFSS7PPc5VdvjJwatHs0
	rZvUWO4DUumZ2kQShGu7ecWMLWDm9oI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-Y6QDg5daOvCkiKXeP_nKMg-1; Fri,
 30 Aug 2024 07:17:41 -0400
X-MC-Unique: Y6QDg5daOvCkiKXeP_nKMg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44DF11955BF2;
	Fri, 30 Aug 2024 11:17:39 +0000 (UTC)
Received: from localhost (unknown [10.72.112.42])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87A6019560AA;
	Fri, 30 Aug 2024 11:17:36 +0000 (UTC)
Date: Fri, 30 Aug 2024 19:17:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
Message-ID: <ZtGqTSMvx6Ljf5Xi@MiWiFi-R3L-srv>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
 <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
 <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 08/20/24 at 12:10pm, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 19/08/24 11:45, Baoquan He wrote:
> > On 08/19/24 at 09:45am, Sourabh Jain wrote:
> > > Hello Michael and Boaquan
> > > 
> > > On 01/08/24 12:21, Sourabh Jain wrote:
> > > > Hello Michael,
> > > > 
> > > > On 01/08/24 08:04, Michael Ellerman wrote:
> > > > > Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> > > > > > The following errors are observed when kexec is done with SMT=off on
> > > > > > powerpc.
> > > > > > 
> > > > > > [  358.458385] Removing IBM Power 842 compression device
> > > > > > [  374.795734] kexec_core: Starting new kernel
> > > > > > [  374.795748] kexec: Waking offline cpu 1.
> > > > > > [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > > > be inaccurate
> > > > > > [  374.935833] kexec: Waking offline cpu 2.
> > > > > > [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > > > be inaccurate
> > > > > > snip..
> > > > > > [  375.515823] kexec: Waking offline cpu 6.
> > > > > > [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > > > be inaccurate
> > > > > > [  375.695836] kexec: Waking offline cpu 7.
> > > > > Are they actually errors though? Do they block the actual kexec from
> > > > > happening? Or are they just warnings in dmesg?
> > > > The kexec kernel boots fine.
> > > > 
> > > > This warning appears regardless of whether the kdump kernel is loaded.
> > > > 
> > > > However, when the kdump kernel is loaded, we will not be able to update
> > > > the kdump image (FDT).
> > > > I think this should be fine given that kexec is in progress.
> > > > 
> > > > Please let me know your opinion.
> > > > 
> > > > > Because the fix looks like it could be racy.
> > > > It seems like it is racy, but given that kexec takes the lock first and
> > > > then
> > > > brings the CPU up, which triggers the kdump image, which always fails to
> > > > update the kdump image because it could not take the same lock.
> > > > 
> > > > Note: the kexec lock is not released unless kexec boot fails.
> > > Any comments or suggestions on this fix?
> > Is this a little better?
> > 
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index 63cf89393c6e..0355ffb712f4 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
> >   	crash_hotplug_lock();
> >   	/* Obtain lock while reading crash information */
> > -	if (!kexec_trylock()) {
> > +	if (!kexec_trylock() && kexec_in_progress) {
> >   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> >   		crash_hotplug_unlock();
> >   		return 0;
> > @@ -539,7 +539,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
> >   	crash_hotplug_lock();
> >   	/* Obtain lock while changing crash information */
> > -	if (!kexec_trylock()) {
> > +	if (!kexec_trylock() && kexec_in_progress) {
> >   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> >   		crash_hotplug_unlock();
> >   		return;
> 
> Ideally, when `kexec_in_progress` is True, there should be no way to acquire
> the kexec lock.
> Therefore, calling `kexec_trylock()` before checking `kexec_in_progress` is
> not helpful.
> The kernel will print the error message "kexec_trylock() failed, elfcorehdr
> may be inaccurate."
> So, with the above changes, the original problem remains unsolved.
> 
> However, after closely inspecting the `kernel/kexec_core.c:kernel_kexec()`
> function, I discovered
> an exceptional case where my patch needs an update. The issue arises when
> the system returns
> from the `machine_kexec()` function, which indicates that kexec has failed.
> 
> In this scenario, the kexec lock is released, but `kexec_in_progress`
> remains True.
> 
> I am unsure why `kexec_in_progress` is NOT set to False when kexec fails.
> Was this by design,
> or was it an oversight because returning from the `machine_kexec()` function
> is highly unlikely?
> 
> Here is my proposal to address the original problem along with the
> exceptional case I described
> above.
> 
> Let's implement two patches:
> 
> 1. A patch that sets `kexec_in_progress` to False if the system returns from
> `machine_kexec()` before

I don't think we have chance to return from machine_kexec() after
triggering kexec/kdump jumping. The KEXEC_JUMP could return, but I'v
never heard people using it.

>    unlocking the kexec lock in the `kernel_kexec()` function.
> 
>    ```
>    diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
>    index c0caa14880c3..b41277183455 100644
>    --- a/kernel/kexec_core.c
>    +++ b/kernel/kexec_core.c
>    @@ -1069,6 +1069,7 @@ int kernel_kexec(void)
>    #endif
> 
>     Unlock:
>    +      kexec_in_progress = false;
>            kexec_unlock();
>            return error;
>     ```
> 
> 2. A patch to return early from the `crash_handle_hotplug_event()` function
> if `kexec_in_progress` is
>    set to True. This is essentially my original patch.

There's a race gap between the kexec_in_progress checking and the
setting it to true which Michael has mentioned. That's why I think
maybe checking kexec_in_progress after failing to retriving
__kexec_lock is a little better, not very sure.

> 
> Please share your comments on the new approach.
> 
> Thank you for review.
> 
> - Sourabh Jain
> 



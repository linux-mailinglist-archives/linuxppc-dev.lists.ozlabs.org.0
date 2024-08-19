Return-Path: <linuxppc-dev+bounces-164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78E956385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 08:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnMmf4z7vz2xst;
	Mon, 19 Aug 2024 16:16:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S8qMOYg0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O2QhXG02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnMmd6fY1z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 16:16:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724048167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcJLl/Fp3h6jQcz16e/hG76KVnOut/BqwVl6XHyRN6I=;
	b=S8qMOYg0HBvRx+RIYcfrFDnho82Q5aQXjBL50aNuQSkcKkH1M1fvTltBZCioHdy7lYUMJD
	fcti/5+yqctW1QQx+z/1IB0PJM+7mFf6IJQGx29U7wx3XBAIF0e/8fuKIqN3n8nzZoxvhu
	3u/b7N9F+T5ABtzMup0p1+S/LFYrihE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724048168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcJLl/Fp3h6jQcz16e/hG76KVnOut/BqwVl6XHyRN6I=;
	b=O2QhXG02A7Bl+IeE9SyXmJ9Xs8/L5mOnBSTIShNCRB16o2LArQpjmU5n+6tvtk+Ot2G1HK
	fp/OKDRva8xOlc/gqcu+q7JehNVIVUOABL1gBbgmPIJUMYD7q0Y2TpORF/5SUhJl8Or7G0
	AgxQ50bK7CkChxTrYTzqbhsySTnvfm8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-UEOZI0jQNFyoDul8YmFjXw-1; Mon,
 19 Aug 2024 02:16:01 -0400
X-MC-Unique: UEOZI0jQNFyoDul8YmFjXw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13E011955EA6;
	Mon, 19 Aug 2024 06:15:59 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB58419773E0;
	Mon, 19 Aug 2024 06:15:56 +0000 (UTC)
Date: Mon, 19 Aug 2024 14:15:52 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
Message-ID: <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
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
In-Reply-To: <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 08/19/24 at 09:45am, Sourabh Jain wrote:
> Hello Michael and Boaquan
> 
> On 01/08/24 12:21, Sourabh Jain wrote:
> > Hello Michael,
> > 
> > On 01/08/24 08:04, Michael Ellerman wrote:
> > > Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> > > > The following errors are observed when kexec is done with SMT=off on
> > > > powerpc.
> > > > 
> > > > [  358.458385] Removing IBM Power 842 compression device
> > > > [  374.795734] kexec_core: Starting new kernel
> > > > [  374.795748] kexec: Waking offline cpu 1.
> > > > [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > be inaccurate
> > > > [  374.935833] kexec: Waking offline cpu 2.
> > > > [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > be inaccurate
> > > > snip..
> > > > [  375.515823] kexec: Waking offline cpu 6.
> > > > [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may
> > > > be inaccurate
> > > > [  375.695836] kexec: Waking offline cpu 7.
> > > Are they actually errors though? Do they block the actual kexec from
> > > happening? Or are they just warnings in dmesg?
> > 
> > The kexec kernel boots fine.
> > 
> > This warning appears regardless of whether the kdump kernel is loaded.
> > 
> > However, when the kdump kernel is loaded, we will not be able to update
> > the kdump image (FDT).
> > I think this should be fine given that kexec is in progress.
> > 
> > Please let me know your opinion.
> > 
> > > Because the fix looks like it could be racy.
> > 
> > It seems like it is racy, but given that kexec takes the lock first and
> > then
> > brings the CPU up, which triggers the kdump image, which always fails to
> > update the kdump image because it could not take the same lock.
> > 
> > Note: the kexec lock is not released unless kexec boot fails.
> 
> Any comments or suggestions on this fix?

Is this a little better?

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 63cf89393c6e..0355ffb712f4 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
 
 	crash_hotplug_lock();
 	/* Obtain lock while reading crash information */
-	if (!kexec_trylock()) {
+	if (!kexec_trylock() && kexec_in_progress) {
 		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
 		crash_hotplug_unlock();
 		return 0;
@@ -539,7 +539,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 
 	crash_hotplug_lock();
 	/* Obtain lock while changing crash information */
-	if (!kexec_trylock()) {
+	if (!kexec_trylock() && kexec_in_progress) {
 		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
 		crash_hotplug_unlock();
 		return;



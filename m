Return-Path: <linuxppc-dev+bounces-1029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626C96CD2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 05:23:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzl7Y6sTzz2yDT;
	Thu,  5 Sep 2024 13:23:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725506617;
	cv=none; b=AUIU22JN0j2BXH+WmWXcSDNgtL8sEfQDzGUW5kqnhkAQl6VMUMsx7P9E1q1GxfhhijG1I/jL6DUdHlvMPQamMpCpGCKDAL/jnBbDoakCX2jHt7zw+TYB02rWyzbYWifiqKZzLUpfx62uQVNCiNbMskIEVrF79G96bkTwzxXgki25FvL4u3RYD8bblTdcwrR+Ln+RGvS87KAV/5nNqTCKLIFFTMLiWkuZ9HX+JidHF2PfEt+2/eV4gaTs369JVV8/WSgXl8KM2dveCc96GNT1y4HWPA2EErDXPhPEJ8YdESp3zhLKaMNsnJAyeDEV4DPXI3ddkh8DigNL6dHi8FlXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725506617; c=relaxed/relaxed;
	bh=HTNSGL25zCLG+PtyocxhqR9poI911nBZG+X7qZt1q6o=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=W+qu36B24yCbPIjeesN5ehKUuCi7i9eLEQQzyaYqcQ5fuoxHWv2wTP7sk4JXiaq9hnt+JA+A4swMvYzcT89rf5Gm8hTdnMkmTxA2pzrpeeqKpPDWkHLkVQkS9Ft0cGDj3ARUqypjyYHquA2tmud2AbZ7v+2ByD25i45Z4GrOr915LmvH6D+EyosHsdouUWWCSRKQrJRcTZmcp6t8m8bXvhj85Uiazm2P5lzyp1f7wGxAeBQAvC/XWo1/xEb7Qd19a6GdYQ8SG9NCozNFstTOMChXGx4Ychk8TWgDJAxV2IXqIBBl0rNQSAjK8cSDkTznnPkQErz4gNojiDU8ZtzQaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJ/BKCqh; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJ/BKCqh; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJ/BKCqh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJ/BKCqh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzl7Y0RSsz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 13:23:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725506611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTNSGL25zCLG+PtyocxhqR9poI911nBZG+X7qZt1q6o=;
	b=MJ/BKCqhoOoyNM6ZaxyW93gOQNoxtk0KPpT1iPCf/uG2ZKSDGhqoIwi7mAwZ5v/vCSGfaQ
	PBkw8I5FgoywxqYJ6w03/1IfBmOeUJELxWF+8VKPPNx32xEXVwYF9f4FmtR9FLu/luDb72
	Zl/D8se25GQy/f4RQSFtk1AEtd+9D/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725506611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HTNSGL25zCLG+PtyocxhqR9poI911nBZG+X7qZt1q6o=;
	b=MJ/BKCqhoOoyNM6ZaxyW93gOQNoxtk0KPpT1iPCf/uG2ZKSDGhqoIwi7mAwZ5v/vCSGfaQ
	PBkw8I5FgoywxqYJ6w03/1IfBmOeUJELxWF+8VKPPNx32xEXVwYF9f4FmtR9FLu/luDb72
	Zl/D8se25GQy/f4RQSFtk1AEtd+9D/U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-xc-9i_YyNRWBh0VIswKbpA-1; Wed,
 04 Sep 2024 23:23:25 -0400
X-MC-Unique: xc-9i_YyNRWBh0VIswKbpA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 884571977021;
	Thu,  5 Sep 2024 03:23:21 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C7A41955D53;
	Thu,  5 Sep 2024 03:23:18 +0000 (UTC)
Date: Thu, 5 Sep 2024 11:23:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
Message-ID: <ZtkkIoUIu8shp/ut@MiWiFi-R3L-srv>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
 <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
 <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
 <ZtGqTSMvx6Ljf5Xi@MiWiFi-R3L-srv>
 <0dd94920-b13f-4da7-9ea6-4f008af1f4b3@linux.ibm.com>
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
In-Reply-To: <0dd94920-b13f-4da7-9ea6-4f008af1f4b3@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 09/04/24 at 02:55pm, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 30/08/24 16:47, Baoquan He wrote:
> > On 08/20/24 at 12:10pm, Sourabh Jain wrote:
> > > Hello Baoquan,
> > > 
......snip... 
> > > 2. A patch to return early from the `crash_handle_hotplug_event()` function
> > > if `kexec_in_progress` is
> > >     set to True. This is essentially my original patch.
> > There's a race gap between the kexec_in_progress checking and the
> > setting it to true which Michael has mentioned.
> 
> The window where kernel is holding kexec_lock to do kexec boot
> but kexec_in_progress is yet not set to True.
> 
> If kernel needs to handle crash hotplug event, the function
> crash_handle_hotplug_event()  will not get the kexec_lock and
> error out by printing error message about not able to update
> kdump image.

But you wanted to avoid the erroring out if it's being in
kernel_kexec().  Now you are seeing at least one the noising 
message, aren't you?

> 
> I think it should be fine. Given that lock is already taken for
> kexec kernel boot.
> 
> Am I missing something major?
> 
> > That's why I think
> > maybe checking kexec_in_progress after failing to retriving
> > __kexec_lock is a little better, not very sure.
> 
> Try for kexec lock before kexec_in_progress check will not solve
> the original problem this patch trying to solve.
> 
> You proposed the below changes earlier:
> 
> -	if (!kexec_trylock()) {
> +	if (!kexec_trylock() && kexec_in_progress) {
>  		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>  		crash_hotplug_unlock();

Ah, I meant as below, but wrote it mistakenly.

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 63cf89393c6e..e7c7aa761f46 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
 
 	crash_hotplug_lock();
 	/* Obtain lock while reading crash information */
-	if (!kexec_trylock()) {
+	if (!kexec_trylock() && !kexec_in_progress) {
 		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
 		crash_hotplug_unlock();
 		return 0;


> 
> 
> Once the kexec_in_progress is set to True there is no way one can get
> kexec_lock. So kexec_trylock() before kexec_in_progress is not helpful
> for the problem I am trying to solve.

With your patch, you could still get the error message if the race gap
exist. With above change, you won't get it. Please correct me if I am
wrong.



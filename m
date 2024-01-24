Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B783AC1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 15:39:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibTk9I7w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibTk9I7w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKmnY2v9Kz3cSy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 01:39:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibTk9I7w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ibTk9I7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKmmj6bfFz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 01:39:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706107138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls80tWWITZqF3iJAPsDuzCkVtKDTZBr/hmM0JE5RG5g=;
	b=ibTk9I7woTM7wBzQRTX7VtTmhOJVD9e/h2qaATl5Ae9m9iPe3m+HRD/UR2VFGmUr0cNqRA
	sfkppHLgKuNMQNe3NPEDyZ6ge7B4fOHTCrvfhEvz1d89OE2xlpdPMHM6/dzhSXO6X8wa+q
	SEfaQbK5Mb9vICs3jryfHojn5RtQ5vI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706107138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls80tWWITZqF3iJAPsDuzCkVtKDTZBr/hmM0JE5RG5g=;
	b=ibTk9I7woTM7wBzQRTX7VtTmhOJVD9e/h2qaATl5Ae9m9iPe3m+HRD/UR2VFGmUr0cNqRA
	sfkppHLgKuNMQNe3NPEDyZ6ge7B4fOHTCrvfhEvz1d89OE2xlpdPMHM6/dzhSXO6X8wa+q
	SEfaQbK5Mb9vICs3jryfHojn5RtQ5vI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-hw5KzothNAWkK-1bR3SVuw-1; Wed,
 24 Jan 2024 09:38:53 -0500
X-MC-Unique: hw5KzothNAWkK-1bR3SVuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254953806622;
	Wed, 24 Jan 2024 14:38:53 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B49AC03;
	Wed, 24 Jan 2024 14:38:51 +0000 (UTC)
Date: Wed, 24 Jan 2024 22:38:49 +0800
From: Baoquan He <bhe@redhat.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH linux-next v3 10/14] sh, crash: wrap crash dumping code
 into crash related ifdefs
Message-ID: <ZbEg+aoWKPww71gW@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-11-bhe@redhat.com>
 <27d8aa3a9e604a7e45c87b7fbc5b1ec2a63f03e3.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27d8aa3a9e604a7e45c87b7fbc5b1ec2a63f03e3.camel@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/24/24 at 09:13am, John Paul Adrian Glaubitz wrote:
> Hello Baoquan,
> 
> On Wed, 2024-01-24 at 13:12 +0800, Baoquan He wrote:
> > Now crash codes under kernel/ folder has been split out from kexec
> > code, crash dumping can be separated from kexec reboot in config
> > items on SuperH with some adjustments.
> > 
> > wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery, and
> > use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
> > in the crashkernel reservation code.
> 
> Comparing this to the patches, it seems you missed the first word
> "Here". Either amend that or write the word "wrap" capitalized.
> 
> I would omit "Here" as it's not necessary and just start the
> sentence with "Wrap".

You are right, thanks for careful checking. I will see if I need repost
to include this update.

> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 


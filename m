Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171086C331
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:12:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J4DaNmzG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlkTW5p2Cz3vX5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J4DaNmzG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlkSk2S8Gz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:11:18 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TlkSk202Gz4wyj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:11:18 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TlkSk1wbvz4wp0; Thu, 29 Feb 2024 19:11:18 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J4DaNmzG;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TlkSj5HgRz4wyq
	for <linuxppc-dev@ozlabs.org>; Thu, 29 Feb 2024 19:11:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709194275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KKgPV4KlmoWInRghtoexaD0eJgXp81WWMaJOZh2q7qI=;
	b=J4DaNmzGb75ZNF/dkZ372ZtiTpDnQz6Totpy7L1DeEZkZ3u9R7auFxr1uei62aoe5TePxV
	dq0LGVqKbGa2zK0NoGVkdpmRavVX061VLeJVhDouyk3qyJQiXNpApWOMgq0PY40oM9pGFK
	bNChCcBmVtebIYDgwBMl36Jpheski8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-RSprWW3hOl-Jg7EwQH2YYw-1; Thu, 29 Feb 2024 03:11:09 -0500
X-MC-Unique: RSprWW3hOl-Jg7EwQH2YYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A411C106D102;
	Thu, 29 Feb 2024 08:11:08 +0000 (UTC)
Received: from localhost (unknown [10.72.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93616112C5;
	Thu, 29 Feb 2024 08:11:06 +0000 (UTC)
Date: Thu, 29 Feb 2024 16:11:02 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v17 3/6] powerpc/kexec: move *_memory_ranges functions to
 ranges.c
Message-ID: <ZeA8Fl7xVHly4Ma+@MiWiFi-R3L-srv>
References: <20240226084118.16310-1-sourabhjain@linux.ibm.com>
 <20240226084118.16310-4-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20240226084118.16310-4-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/26/24 at 02:11pm, Sourabh Jain wrote:
> Move the following functions form kexec/{file_load_64.c => ranges.c} and
> make them public so that components other KEXEC_FILE can also use these
                                           ^
                                          'than' missed?
> functions.
> 1. get_exclude_memory_ranges
> 2. get_reserved_memory_ranges
> 3. get_crash_memory_ranges
> 4. get_usable_memory_ranges
> 
> Later in the series get_crash_memory_ranges function is utilized for
> in-kernel updates to kdump image during CPU/Memory hotplug or
> online/offline events for both kexec_load and kexec_file_load syscalls.
> 
> Since the above functions are moved to ranges.c, some of the helper
> functions in ranges.c are no longer required to be public. Mark them as
> static and removed them from kexec_ranges.h header file.
> 
> Finally, remove the CONFIG_KEXEC_FILE build dependency for range.c
> because it is required for other config, such as CONFIG_CRASH_DUMP.
> 
> No functional changes are intended.
......snip


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5673C306
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 23:42:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vxj+7cSK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnrLH0tgzz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 07:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vxj+7cSK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::25; helo=out-37.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 360 seconds by postgrey-1.37 at boromir; Sat, 24 Jun 2023 00:52:42 AEST
Received: from out-37.mta1.migadu.com (out-37.mta1.migadu.com [IPv6:2001:41d0:203:375::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QngFk5tdkz3bYF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 00:52:41 +1000 (AEST)
Date: Fri, 23 Jun 2023 16:46:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687531587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wHvvf/bDESVtRUHz9Yj9cOg9EwzScFCVrw08rHloHBY=;
	b=Vxj+7cSKO04fpdl6eqxWrE7iDKjWn2sWylHPJa2DN6YBsj9wQbNZcLhuL0tsbSuKBUs1re
	/YiTAKWGAO50nhu+EIyJLBofsa9V5htBaDHIA6AZJvd45tOJGfXPV+sbLem1G9OBV7pgYg
	qM82k6vx+F6Qlr2uiFv6J5WNoM2OWkE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 0/2] Rework LDFLAGS and link with
 noexecstack
Message-ID: <20230623-7e80827ee6c29678c4da2c3f@orel>
References: <20230623125416.481755-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623125416.481755-1-thuth@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 24 Jun 2023 07:40:38 +1000
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico =?utf-8?B?QsO2aHI=?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 23, 2023 at 02:54:14PM +0200, Thomas Huth wrote:
> I noticed that the latest version of ld (in Fedora rawhide) emits
> a warning on x86 and s390x, complaining about missing .note.GNU-stack
> section that implies an executable stack. It can be silenced by
> linking with "-z noexecstack".
> 
> While trying to add this switch globally to the kvm-unit-tests, I
> had to discover that the common LDFLAGS are hardly used anywhere,
> so the first patch cleans up that problem first before adding the
> new flag in the second patch.
> 
> Thomas Huth (2):
>   Rework the common LDFLAGS to become more useful again
>   Link with "-z noexecstack" to avoid warning from newer versions of ld
> 
>  Makefile                | 2 +-
>  arm/Makefile.common     | 2 +-
>  powerpc/Makefile.common | 2 +-
>  s390x/Makefile          | 2 +-
>  x86/Makefile.common     | 4 ++--
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> 2.39.3
>

For the series

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

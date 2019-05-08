Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15916E45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 02:31:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zHTt4qzrzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 10:31:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="gRIeqvWj"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zHSR5RkWzDqFm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 10:30:31 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id i8so7043057oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 17:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
 b=gRIeqvWjXvHVuVEemJNJK8AS0nBpMXjQNbmZV9qOtFksOrHCfrqeuX/vrn0nS6wwxy
 kLfpormJ8YBe4ZEF9hNxd/IFXkViwzDXyjJ7SWlHab5fqkWfEG9z/QESkM0GYa14N37c
 lpNEiivZk/k4qPe6YXKCt/Usic/XxFC7BwQxcRPqPZt9yKca0JFbo8LULWWrbneDHmq+
 K8a2yddzszAkKsKQ3kY36HSo7YkWplePB3l48/W53IN9tPwuJM2Yv7wbC95njLsaoego
 6jh4lLkkJ43Um5WDoj3cd+7cCVtFpC4h2yUMlngnDEfXLG3iM/uPEArsgoY53kR9Wc3H
 DUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNugRNfI1NASCVQQotBkfUx3cjwsiA1TzUpe8ibe7ac=;
 b=RudkWIKvQsF99/gHwCsybdGeHof9pFDMolrvCGT6rMVySAhCJqDKVu/OtGtIjdtwpX
 f18zzWFpguOlSQyro/MZDwYm9buitjqvb4WE0Bvjsm75Z2kzgiSKSMXem7WNLTYLtTOF
 AkQ9i3JQAh32yXV4goAhq+3Op8lb3C4vHc6RWuR/B62Qxlaj2pAmU0Y1OaatSlK355zN
 S2Va+TBmn+nIRAo6TPIeKckDAPP3+rkAqNetwsbUrgAl2u9a+GKZCzhSy6HVxgzQOQux
 cDf1PU48v0ey2VuRmIDwBkpG/5Zxho/gJIvCM5W8zx/w2l0oSDFW2hEmmk6g+rqBy7Fx
 au9g==
X-Gm-Message-State: APjAAAXJJLWJ2bpdg+mIwzQk/usJ7jNjRcFBsAYGl7sqVbZJ8qV9zkxZ
 EeVu3n3e2ePSd8KBNd6G8vsJDQjm+mDyQ3+YpEeSig==
X-Google-Smtp-Source: APXvYqwnFUcfnqP6BFgjGKomJPr5yaMMCBD85pEk3++fjkl68hk/raq4PqQ7V3ysBstXCoK7LDo9wO4kaWYzTHhnX6M=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr22059155oti.229.1557275426847; 
 Tue, 07 May 2019 17:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-9-david@redhat.com>
In-Reply-To: <20190507183804.5512-9-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 17:30:15 -0700
Message-ID: <CAPcyv4hzpuApmKHhC6mHnE-RmiZ8Aspiv5wfd+Fs4QmaDsCJVw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm/memory_hotplug: Remove "zone" parameter from
 sparse_remove_one_section
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Linux-sh <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 11:39 AM David Hildenbrand <david@redhat.com> wrote:
>
> Unused, and memory unplug path should never care about zones. This is
> the job of memory offlining. ZONE_DEVICE might require special care -
> the caller of arch_remove_memory() should handle this.

The ZONE_DEVICE usage does not require special care so you can drop
that comment. The only place it's used in the subsection patches is to
lookup the node-id, but it turns out that the resulting node-id is
then never used.

With the ZONE_DEVICE mention dropped out of changelog you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

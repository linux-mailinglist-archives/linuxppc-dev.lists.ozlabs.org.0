Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E251C0C88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:22:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CyHZ029lzDr4Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=sweettea@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EZFHzxDs; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EZFHzxDs; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CxJR3xBjzDr8r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 12:38:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=EZFHzxDs+yFX1DPcPibDZVjrHw/dqrkXSg1amJCKUbOH9jTROVWtue2AFjemYSRx0Tij/X
 UQi5sPrPgyloKwH3JkN7Sduy5nVqtcI8STPKaIHixoVUAHFqcAsj7ta3zHGeCk4qhSCaQG
 nnocvaMwW3j1md8RnBpGDOlfF8Orbb4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=EZFHzxDs+yFX1DPcPibDZVjrHw/dqrkXSg1amJCKUbOH9jTROVWtue2AFjemYSRx0Tij/X
 UQi5sPrPgyloKwH3JkN7Sduy5nVqtcI8STPKaIHixoVUAHFqcAsj7ta3zHGeCk4qhSCaQG
 nnocvaMwW3j1md8RnBpGDOlfF8Orbb4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Z6tXzWRhNmSaJyJhzf1EhQ-1; Thu, 30 Apr 2020 22:38:22 -0400
X-MC-Unique: Z6tXzWRhNmSaJyJhzf1EhQ-1
Received: by mail-ua1-f69.google.com with SMTP id z20so3649902uag.19
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 19:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=PckBchnxqSRRMERHpD7Vlz59ptCSR/kPa1mOpWQLfwaRKzjHKtVJT1OpEtGFTM4Mxx
 6LoVNaG9ydZb/eficqF/oS+4RUVeVoCHK25sCY3FXj4Kb983SEGdz/gJ7qtpl6fii5aB
 gf2dDb5Mh2VnWxo5nINVXkeCwoCwaWFbps5hg0hYc9/yhXNJzXCQ+mr93FrIBnJSinQZ
 KG70KOL9Ap32CMf3Lvj1qRXXzgR36qeladEAgv1Nu2jDlTdV4NO0w+smutwWJY5YQqg5
 e8wAlbfz8vp7SBv7cRy8YgQp+jipi+ksEx4mgguBm715oGt72hhOiw3FE4lYwA7JVgXG
 MttA==
X-Gm-Message-State: AGi0PuYDVvMqcMa2wvG1l4bioe3LZEjHBYty76IFwHRmHaIVCIELY/Am
 wJyd391k5jxnedEI8x38MD4G9mjIJMBarFCY5bsxDFXu1ILzmlg+a+kpu8VT2dWgo68Qc1IQz+1
 dYhN7zl7HzFTTJPoGqIaE23Yv6q1WsWlFWrsW3HmmIQ==
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848899vsp.198.1588300701719; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKu6ClZ61atP80MD4lQJkn2FtP3gZkiC+YuTXU2rwKV21SshkG1nW93zQxISm3Y7jRVOl6JpuyIYF8Yu55j3FA=
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848869vsp.198.1588300701546; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
 <20200414151344.zgt2pnq7cjq2bgv6@debian>
 <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
In-Reply-To: <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 30 Apr 2020 22:38:10 -0400
Message-ID: <CAMeeMh_9N0ORhPM8EmkGeeuiDoQY3+QoAPX5QBuK7=gsC5ONng@mail.gmail.com>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
To: Wei Liu <wei.liu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 01 May 2020 13:16:54 +1000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Peter Zijlstra <peterz@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
>> > The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
>> > it.

Greetings;

I recently noticed this change via the linux-next tree.

It may not be possible to edit at this late date, but the change
description refers to PROT_KERNEL, which is a symbol which does not
appear to exist; perhaps PAGE_KERNEL was meant? The mismatch caused me
and a couple other folks some confusion briefly until we decided it
was supposed to be PAGE_KERNEL; if it's not too late, editing the
description to clarify so would be nice.

Many thanks.

John Dorminy


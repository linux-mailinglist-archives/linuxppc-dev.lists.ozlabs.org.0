Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC71BA7B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 17:18:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499pLd4X5dzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 01:18:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ixjl1U9Z; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=C1t0lWdR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499pHw5qMxzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 01:15:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588000536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSpYzJ8vruskzw1ixWuPTFKODIOCb1DdC0Y5Ypx1fB0=;
 b=Ixjl1U9ZxAd7CT3hUfVBj4OC3cNpxodUZOfnDT/R+PiEaqt/AILrKzUj5Eo/rzHioy9Oln
 cvJLzIAKJ6wHxC5CCF4L4yKtPq/EaBFl8TJ9vWTotACZe3HuIK/3lALMrWYOMCjppl2WFY
 7T3/PCaVB0U3AZ/R1FovAdsEF10h418=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588000537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSpYzJ8vruskzw1ixWuPTFKODIOCb1DdC0Y5Ypx1fB0=;
 b=C1t0lWdRGCeEyE/zkw5T0M547DL4lmRko57KvL5UpPSx/C1PdizICZDblecVXdwVvyf5o9
 2axUU8XKTVR8Zfho2kRLCJOkZmYdnmPhCCDGpEMr6+m79FEJ3EQ06rVoINOvEYUuBWFa6Q
 968t8uvr1Ys6orN8ybSG3hBcKN0Z1CI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-9nmBXQDwNAidcCBKCYK7vg-1; Mon, 27 Apr 2020 11:15:34 -0400
X-MC-Unique: 9nmBXQDwNAidcCBKCYK7vg-1
Received: by mail-wr1-f69.google.com with SMTP id r11so10657529wrx.21
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSpYzJ8vruskzw1ixWuPTFKODIOCb1DdC0Y5Ypx1fB0=;
 b=uDdIIWXXqS4fYqCJ7+fk6ofKKJVfpz1ONHbFlP7E4Iadczy4hsDOH0f9gg5GqGlYM9
 dnvGjRNLDeGFZFRd5ov4O8Cfxy8EBmgJhkruaWRRn/SgAdI++okwVH4xD9bHAJPDhjcB
 vwARnJQUfiiKgJN9RqTWeftk/ck+vHYUS/2TBenD8w3brBN01EEhVcMcjmzExUlWfy3I
 SYaCoa1q01WrMNYtHiMFzUDKp76ESh7MKgmlL30aA+ft9a7QYzk7MYFx7P8U09rw3hFQ
 YA5GBmjTOGVvnRFPs42EBr9+tBYX6ncE1z8c6kyrb/+RpAlfrHMupHfKGkrbAi8vv36S
 GNrQ==
X-Gm-Message-State: AGi0Puaovtu9YJCDDtM1QPoxrIIKGG7XzEJB1mq4d2oNl4bi2qPa5Duu
 oFc9wUwwZfv+ky2DNF0itxrevWcq1VMGx0F+ar15FmnZ5U4F+QQ9h9ggjoVPV+e+CZylbaAkvkZ
 QkO22c5P/7pVVsggCQm7kKk6kXQ==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr29924481wru.29.1588000533364; 
 Mon, 27 Apr 2020 08:15:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypK+T+6Aj+dLlxq4HhKDwXzdqmOqUdriVVov3jgAPiPujwYcHZ4fNtTJwlwzd9NWqPh44afp5Q==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr29924444wru.29.1588000533150; 
 Mon, 27 Apr 2020 08:15:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac19:d1fb:3f5f:d54f?
 ([2001:b07:6468:f312:ac19:d1fb:3f5f:d54f])
 by smtp.gmail.com with ESMTPSA id n6sm23226378wrs.81.2020.04.27.08.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 08:15:32 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] debugfs: switch to simplefs inode creation API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-fsdevel@vger.kernel.org
References: <20200421135119.30007-1-eesposit@redhat.com>
 <20200421135741.30657-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <167ebece-2e50-5186-3a42-2fa491fcb8a5@redhat.com>
Date: Mon, 27 Apr 2020 17:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200421135741.30657-4-eesposit@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/04/20 15:57, Emanuele Giuseppe Esposito wrote:
> -	inode = debugfs_get_inode(dentry->d_sb);

You're not removing debugfs_get_inode so I think you're going to get a
warning (same in tracefs)?

You can wait a few more days for reviews and/or Acked-bys (especially
for patches 6 and 7) and then post v3.

Since the touch-everything patch (#2) has already been reviewed, and
it's mechanical and not introducing any semantic change, you can
probably reduce the To/Cc list to filesystem, debugfs and tracefs
maintainers.

Thanks,

Paolo


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 969AC4BFA7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 15:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K31Ly754jz3bcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 01:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Av4MWnqz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Av4MWnqz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Av4MWnqz; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Av4MWnqz; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K31LD6Vm0z2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:11:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645539070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnCQY82//h+7hOXmxejXJs5Zu5Mwgiv01JTXqpBbWA8=;
 b=Av4MWnqztM+zzm9YV5ZHp0PAKRWvR50Rr6fRI6qanqOCMuJZHX0rbBDqbVpMGLPJ4yWYNn
 acsudXEQisSbAg1vW8A1TDRoir5biYgY2vmHkoHiYe0aXn498NTHkKNOcFB8bL/7uv9rne
 eatspIU5PkozTeg+W7/vsMlmJ5n+qhU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645539070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnCQY82//h+7hOXmxejXJs5Zu5Mwgiv01JTXqpBbWA8=;
 b=Av4MWnqztM+zzm9YV5ZHp0PAKRWvR50Rr6fRI6qanqOCMuJZHX0rbBDqbVpMGLPJ4yWYNn
 acsudXEQisSbAg1vW8A1TDRoir5biYgY2vmHkoHiYe0aXn498NTHkKNOcFB8bL/7uv9rne
 eatspIU5PkozTeg+W7/vsMlmJ5n+qhU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-XJHZVZxJNme9oTcpLavdRw-1; Tue, 22 Feb 2022 09:11:08 -0500
X-MC-Unique: XJHZVZxJNme9oTcpLavdRw-1
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso12015640edh.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 06:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lnCQY82//h+7hOXmxejXJs5Zu5Mwgiv01JTXqpBbWA8=;
 b=d1f3gD+ocIsJBuuYc9P+J8Pf2Y277vWYRqUVUmhqfXL5J2gbITSlQWn1hUmdYLLfBU
 2Se/m0coQskw/erjsgnSZUfyb1g3oONadgseUNhZ/8ioBFo6N8oSK1P9poH8nL6NHsWt
 fO3rTw82p8kGdf+YIlbPAlI6ronmt+LX7JRqQCYgJ3+P5jKw37pxBVspc0VdHAgWoTQo
 hj6r3TeBf+DhMxpZaTLmNFWoxFQCm6kFvxEkQ4DEa2kqC2LznRLO4y3IPHlJAvGJkzzu
 CjXZjHmb4yO1e5KKJMVb4sgtFfx3wt9fdG/+7SkaEAly9Q8G5aFCbF81tmSWiq/iNnBW
 ux6A==
X-Gm-Message-State: AOAM531VUv3grWYQR1GKFmM5lMIs2tU1MwSwCkPPzqyTI/wgH0elFpBU
 VkRmh8nnRtjEv6kBxBLyQBKzKyR3lTl4NdZNLp9+KnO27mAw0eRq47WmQPPYpI55PsfIrYeifOW
 CBeTpUa0rim7r8uPEu/0/LbF1Xg==
X-Received: by 2002:a05:6402:17d9:b0:410:aaaf:6467 with SMTP id
 s25-20020a05640217d900b00410aaaf6467mr27476727edy.38.1645539067517; 
 Tue, 22 Feb 2022 06:11:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLmmut1NqVLLa4YqtgbhxFtdrQeMpDiZdJ2gg+2/N4SxmRmGgIj4l8Z/ZjKKNWQQifTNO7gg==
X-Received: by 2002:a05:6402:17d9:b0:410:aaaf:6467 with SMTP id
 s25-20020a05640217d900b00410aaaf6467mr27476692edy.38.1645539067212; 
 Tue, 22 Feb 2022 06:11:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 16sm6283189eji.94.2022.02.22.06.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 06:11:06 -0800 (PST)
Message-ID: <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
Date: Tue, 22 Feb 2022 15:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220222064727.2314380-1-npiggin@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220222064727.2314380-1-npiggin@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/22/22 07:47, Nicholas Piggin wrote:
> Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
> happy with it (link in changelog) just waiting on KVM upstreaming. Do
> you have objections to the series going to ppc/kvm tree first, or
> another option is you could take patch 3 alone first (it's relatively
> independent of the other 2) and ppc/kvm gets it from you?

Hi Nick,

I have pushed a topic branch kvm-cap-ppc-210 to kvm.git with just the 
definition and documentation of the capability.  ppc/kvm can apply your 
patch based on it (and drop the relevant parts of patch 3).  I'll send 
it to Linus this week.

Paolo


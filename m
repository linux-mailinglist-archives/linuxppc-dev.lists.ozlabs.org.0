Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88F1E5124
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 00:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XQMm1lJpzDqMn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 08:23:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=dsahern@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s2T8fMW9; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XQL514StzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 08:22:01 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id h9so10457808qtj.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 15:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O0EZFokD4VETW8hilHGvqiWo+AY18MjoTOCmb0j2QP0=;
 b=s2T8fMW9uZpIMjWGcD1ZLd6JVhc9lKb0qUFORy1p1/+usP51vVfE7imxKLhJ4zBXJL
 X0mKKqb2aJCwjf5JmHRE1iXQ5HDbob9tUqqLNARkQ4SclF98OdsiSN0H9L7Jk7a0uncw
 hkkYgpvz1WcPKKAIE5+ZaRlyLjX6J5dcqyx6Jy/iaBSWUW4u7GmrcX5FGeEQ7HFP7/to
 Y3/evqAvP8745WekeffD2AUo5xLwINjsmVd9GSXBQoU8+b3mUNz7Y2lZUf15r70X16G7
 pzzvqB9L/QSRoPPhm2dplOLBsn3NmgGCi0h/ITu1v08iISeTVI8BH0uIZYxV4HlMnPo9
 yrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O0EZFokD4VETW8hilHGvqiWo+AY18MjoTOCmb0j2QP0=;
 b=aL2UEiy+EhwZSEKkiZl3BaFm2Qoz9UeKHIVrhA4fMLWXbs70RXxEVrhXC8dbrpKfwI
 ZYcbdBUNV8AE78OG1qpR4uSrDJKoZLveLZe6YOX1rIXlvpxBGonUWrBp3Cs6fWtBR+h4
 YMaSbpjF9dBoM1QjajpkvgGVVEZAKXh2PQHl8XkHFshmp+JTski2KOb9dOrCkBwlFBrA
 0PoryxNPwcdpp48xvZcqxlwaaKCjxfw3BDqv6uFzo/hJXF9tHXZkb4hKedRb941fpoJl
 iOJgy5UuiQFIK2WV2wbxKL0Zb4Li7OljtPDhneAa8PBkqYuVLNzleC2nCGFdcovkifk1
 Slaw==
X-Gm-Message-State: AOAM530I7K/NaCCGGvpCJu5eMcmNrNU+BVAylFEa/5YhcO1aOGD//p7Z
 u+i2Oyy1pnpYWonSOpRS1ik=
X-Google-Smtp-Source: ABdhPJyOgdLDKEz0HQkCQmvOCQBIMuQEJnT24eYzL6cb96knhDKVZ2UOmt/SMnmijP1sKg5MpJ9iCQ==
X-Received: by 2002:ac8:6cf:: with SMTP id j15mr107653qth.143.1590618118847;
 Wed, 27 May 2020 15:21:58 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:2840:9137:669d:d1e7?
 ([2601:282:803:7700:2840:9137:669d:d1e7])
 by smtp.googlemail.com with ESMTPSA id v14sm3909630qtj.31.2020.05.27.15.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 15:21:58 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To: Paolo Bonzini <pbonzini@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <b6fa4439-c6b8-63a4-84fd-fbac3d4f10fd@gmail.com>
Date: Wed, 27 May 2020 16:21:55 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Lunn <andrew@lunn.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/20 3:07 PM, Paolo Bonzini wrote:
> I see what you meant now.  statsfs can also be used to enumerate objects
> if one is so inclined (with the prototype in patch 7, for example, each
> network interface becomes a directory).

there are many use cases that have 100's to 1000's have network devices.
Having a sysfs entry per device already bloats memory usage for these
use cases; another filesystem with an entry per device makes that worse.
Really the wrong direction for large scale systems.

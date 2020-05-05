Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A31C6526
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 02:39:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GyQS4LX1zDqc5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 10:39:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=jmattson@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=p0OmBMiN; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gm5z0lp9zDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 02:54:08 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id 19so2661659ioz.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQPV38VFHq5jUdj3xuK872aLx1CmmM995oAhTR/zeg4=;
 b=p0OmBMiNRcbZeEVttRyrUydpDTEXD+loILZwadE01yiYrZMAefBa5lEnkCd8IE/f1C
 wqtNt3itnutwU9SNyU/Y0fQOnPrSFTEoDV1obS+naK5wdvSAbwcozgcVIGkY/Otjnd9p
 51XhOstTUsx5ISmBzOTD1jNv/oS5q27DmqmWhYSeqm+5U94xAJaIyLgweW34StzfEErI
 3dfM/v0XMGcRAFe9bPtoLVFLg5ACcy1j8Rnan0JmxmJvsltfDo9KWXkcjYgZK/TvXSRC
 Oh/P44Cii0cxHTkyJ4tN2a3504hNbCU0BEhwsSTKenaJXoMTLVbgu3JdVv36Y/5fs6vB
 BO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQPV38VFHq5jUdj3xuK872aLx1CmmM995oAhTR/zeg4=;
 b=sn2TzhZxKl/m6yBWF2gCUiTHJBRtrYXT2FvvLPOG1rvlPeFnuhwasoVKIB5/Vt+/xh
 qUyKyfX0IvvqeDZ1kATTHIG1hhLlthkqAcSX4yZPasiY7RCEgcpNod//9zIGUuFpWtgU
 ExuJ6bJsmZQYQyAtn6feZI0UsIN4oVHYc/XqGeikDS1skxuu2Q115tEcln00wW7oM+/Z
 w3R6Xat//GSDKOwRabtYAUVdRdOcyrmmhIysmMqbbHwotDOZr/59hIPxO0zIxbhUMQ37
 ITkxhqeVCPUNHSQi2Iuv2cVGSJwIafWBMsumpf8uj5ZedoENT7USEKOHo2urlu3/inF7
 Bs6w==
X-Gm-Message-State: AGi0PuanG35/MiMbm5mMjWRnSXnKNQ+Zd9bTiiJ4+9GiITnHp7PVnwfq
 I50/DIqklCzsYJPwbLg5vPEqfO0CTift2gWOjrJ7ag==
X-Google-Smtp-Source: APiQypIh87tWtIMtuteWC1af3Q4H+FkjslZ8xyNvCG2aA394n3dc+bOaNgbwVm/hpp4CR/gsTCwAOETr4pzr5lry2Mw=
X-Received: by 2002:a02:a004:: with SMTP id a4mr3700717jah.18.1588697644142;
 Tue, 05 May 2020 09:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200504110344.17560-1-eesposit@redhat.com>
 <alpine.DEB.2.22.394.2005041429210.224786@chino.kir.corp.google.com>
 <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
In-Reply-To: <f2654143-b8e5-5a1f-8bd0-0cb0df2cd638@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 5 May 2020 09:53:53 -0700
Message-ID: <CALMp9eQYcLr_REzDC1kWTHX4SJWt7x+Zd1KwNvS1YGd5TVM1xA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 May 2020 10:35:08 +1000
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
Cc: linux-s390@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Rientjes <rientjes@google.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 5, 2020 at 2:18 AM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
>
>
>
> On 5/4/20 11:37 PM, David Rientjes wrote:
> > Since this is becoming a generic API (good!!), maybe we can discuss
> > possible ways to optimize gathering of stats in mass?
>
> Sure, the idea of a binary format was considered from the beginning in
> [1], and it can be done either together with the current filesystem, or
> as a replacement via different mount options.

ASCII stats are not scalable. A binary format is definitely the way to go.

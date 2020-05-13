Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CB1D0655
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 07:19:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MNJ55xGWzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gFpn58/z; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MNG36zxFzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 15:17:15 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id c64so16150660qkf.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=kuNAvbqiOq9VWIGuyjkC9WGSpZO1oJmYNzCCBwUSpwk=;
 b=gFpn58/zD4GPNaUUWwT8ECKmCRTGvN+48akn7IqlEJsbO9P9acoKe60CZdlE5BOJSH
 UPFkmNqajJwfcr94aXrzanMfeQiaCRf67Cn/jAWhsviyRsPMQmRQ4Se1NYDsYldwCNdx
 SRtDNGrCWzQgX2EMPinCEG7uPhzJ7lnSOJqiuZxn5xdfU8mjAmcxLYYIvcBTnQewvmJr
 H8jBV7OTYFpJD0UZnKp00al4aM+NXxzdT64XbPQR5VxKUIehikETK325PNgvFyG3hgIt
 yD16uh1Ic23W9w/6uQ0C6LMQyQsZAP+7juubWkATRhDe06tGbuXT9aFo+91o4eKlX5y9
 BrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kuNAvbqiOq9VWIGuyjkC9WGSpZO1oJmYNzCCBwUSpwk=;
 b=h/K43UPfvvsY9NG4ccAM17bXJccLQQdfOmuN3KLx7iDuxG7OvB5xag3ZBoPE1oSdlQ
 Akbqa0puKPiFIo1+rkn02qAjUmlJf46ldlIF+ZROHmVuiWuQB0eYNgJPhgBfEqeAjd+D
 F+/t4o3hSt2AxC7tovw8e3cZEGavogDtwbasOLyGcCAoEkmdXi8cedvwWJwhROhBTw2D
 AGQbtnzTltlBn2wRYQJqFzqDl8BYjCLe99elVLEh3+y/NFvyWCOwve6c1YEd3kbc1yu8
 rPXnpYoiZWvxhJxVbxhq/eSdOvsitxBHU/WV6vS1ztiihOmHmsS2ym7g/LOr2Hb04ka6
 E5Tg==
X-Gm-Message-State: AGi0Puaz3+IP9xFvvSOR+mnPBjDmu2lf+3HojSPf3Ec8XxATUsm0b7Ho
 VBNwGWfTv1B10sPIHTA9oSo=
X-Google-Smtp-Source: APiQypKDv7ceqF305L4FOrbWAafwKOMG/xyyQf0plZG6F6kRUgAbBfuOsLBF2qrXfqiCQbobXqsLKQ==
X-Received: by 2002:a37:6506:: with SMTP id z6mr24966820qkb.246.1589347031619; 
 Tue, 12 May 2020 22:17:11 -0700 (PDT)
Received: from LeoBras (179-125-143-209.dynamic.desktop.com.br.
 [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id 10sm15859166qtp.4.2020.05.12.22.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 22:17:10 -0700 (PDT)
Message-ID: <fdf3ad3282febe0451cb52c960d954988e87d531.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/crash: Use NMI context for printk when
 starting to crash
From: Leonardo Bras <leobras.c@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras
 <alexios.zavras@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt
 <info@metux.net>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 13 May 2020 02:16:58 -0300
In-Reply-To: <1589344247.2akwhmzwhg.astroid@bobo.none>
References: <20200512214533.93878-1-leobras.c@gmail.com>
 <1589344247.2akwhmzwhg.astroid@bobo.none>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nick, thanks for your feedback.
Comments inline:

On Wed, 2020-05-13 at 14:36 +1000, Nicholas Piggin wrote:
> Excerpts from Leonardo Bras's message of May 13, 2020 7:45 am:
> > Currently, if printk lock (logbuf_lock) is held by other thread during
> > crash, there is a chance of deadlocking the crash on next printk, and
> > blocking a possibly desired kdump.
> > 
> > At the start of default_machine_crash_shutdown, make printk enter
> > NMI context, as it will use per-cpu buffers to store the message,
> > and avoid locking logbuf_lock.
> 
> printk_nmi_enter is used in one other place outside nmi_enter.
> 
> Is there a different/better way to handle this? What do other 
> architectures do?

To be honest, I was unaware of nmi_enter() and I have yet to study what
other architectures do here.

> Other subsystems get put into an nmi-mode when we call nmi_enter
> (lockdep, ftrace, rcu etc). It seems like those would be useful for 
> similar reasons, so at least explaining why that is not used in a 
> comment would be good.

My reasoning for using printk_nmi_enter() here was only to keep it from
using printk regular buffer (and locking logbuf_lock) at this point of
the crash.

I have yet to see how nmi_enter() extra functions would happen to
interfere with the crash at this point. 

(In a quick look at x86, (native_machine_crash_shutdown) I could not
see it using any printk, so it may not be necessary).

> Aside from that, I welcome any effort to make our crashes more reliable
> so thanks for working on this stuff.
> 
> Thanks,
> Nick

Thank you, it means a lot.

Leonardo Bras


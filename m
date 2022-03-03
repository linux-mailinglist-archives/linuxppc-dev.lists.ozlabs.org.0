Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864A4CB7BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 08:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Myl0gHKz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 18:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FXSRJXcZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=xiam0nd.tong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FXSRJXcZ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8My53DPDz30Kt;
 Thu,  3 Mar 2022 18:27:23 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso3596570pjb.0; 
 Wed, 02 Mar 2022 23:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=FXSRJXcZ2cyaSSh+RFzgN891/0EsPjQQYnYlHyt7Q6au+u55Yhw9CQjtuc/Xh+IxeA
 jmfOE8xDuyw6aNjCCweSWK23ooxkZ+FDp1vmELSXGe87/BlE9lQAJ5VCHRxCoJXheQ6e
 z0ZjBk6ntNVuChDJjKVkipnrg4PFzEOabNhKEpFBHr+LTEWxBydNvmRMp4x1CJuZdUwr
 yIPtetuwCR4pZCzLE6nNdjkyjeKTi+kDUarqoW7jVGs3qBeY6IJUgMC1jfObzr57dlqg
 9D3LdaczFYPoymDULVGPmDhvRiVgHdjXQ/LS1xahv5fAEYKipZZ05ntIAVBo2UMKI5ki
 Sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=Pcakno5ErKHudptixKAcwtwbBRdHaTDRo3kip6f4aPtIrbBiDZTVtp1BTH8zANLEf7
 YPgAtvrlSUArBxZ7KG/aoAaCZaiJ8SGQqRArFGLxseJTFhoBO7IuPi55CTtLtNiK0+HK
 yutC0PUAv06XUiq7dRRNhvy8TwT5amU4YGbYTx+lvy0a0Jwu9+s9JutD2q8k8HbeM24l
 NFoWjeNBXRSobhqoLQRDdkGfNgB1S3FiFUbuxz18nB8XBpKJQKQUfnE5tgucsUCBxDpD
 Gy6+rXwrDXcEDIW0imRLVWOfWb2NSYo2WcwI6BHP+2FMJczLb0cU/UzBlI7H+ZjpY1mq
 Bo2g==
X-Gm-Message-State: AOAM532H2+/BP4fKK0lUB1ei+3KfbGwIn/aL2gljNX9iItCXa17lAfJz
 ICPuHMloEPxj6DpN5IIkHUM=
X-Google-Smtp-Source: ABdhPJxXZq8uo59Ohm7FMpyCTbKfTT1earKguyYxXh9VkI02LjxK1/LHoatHqlibGa3Ordge+YwobQ==
X-Received: by 2002:a17:902:9687:b0:151:7b31:9a57 with SMTP id
 n7-20020a170902968700b001517b319a57mr13723244plp.146.1646292442145; 
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 nu18-20020a17090b1b1200b001bbef4d9049sm1302089pjb.23.2022.03.02.23.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 23:27:21 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 15:26:57 +0800
Message-Id: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 xiam0nd.tong@gmail.com, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 3 Mar 2022 04:58:23 +0000, David Laight wrote:
> on 3 Mar 2022 10:27:29 +0800, Xiaomeng Tong wrote:
> > The problem is the mis-use of iterator outside the loop on exit, and
> > the iterator will be the HEAD's container_of pointer which pointers
> > to a type-confused struct. Sidenote: The *mis-use* here refers to
> > mistakely access to other members of the struct, instead of the
> > list_head member which acutally is the valid HEAD.
>
> The problem is that the HEAD's container_of pointer should never
> be calculated at all.
> This is what is fundamentally broken about the current definition.

Yes, the rule is "the HEAD's container_of pointer should never be
calculated at all outside the loop", but how do you make sure everyone
follows this rule?
Everyone makes mistakes, but we can eliminate them all from the beginning
with the help of compiler which can catch such use-after-loop things.

> > IOW, you would dereference a (NULL + offset_of_member) address here.
>
>Where?

In the case where a developer do not follows the above rule, and mistakely
access a non-list-head member of the HEAD's container_of pointer outside
the loop. For example:
    struct req{
      int a;
      struct list_head h;
    }
    struct req *r;
    list_for_each_entry(r, HEAD, h) {
      if (r->a == 0x10)
        break;
    }
    // the developer made a mistake: he didn't take this situation into
    // account where all entries in the list are *r->a != 0x10*, and now
    // the r is the HEAD's container_of pointer. 
    r->a = 0x20;
Thus the "r->a = 0x20" would dereference a (NULL + offset_of_member)
address here.

> > Please remind me if i missed something, thanks.
> >
> > Can you share your "alternative definitions" details? thanks!
>
> The loop should probably use as extra variable that points
> to the 'list node' in the next structure.
> Something like:
> 	for (xxx *iter = head->next;
> 		iter == &head ? ((item = NULL),0) : ((item = list_item(iter),1));
> 		iter = item->member->next) {
> 	   ...
> With a bit of casting you can use 'item' to hold 'iter'.

you still can not make sure everyone follows this rule: 
"do not use iterator outside the loop" without the help of compiler,
because item is declared outside the loop.

BTW, to avoid ambiguity，the "alternative definitions" here i asked is
something from you in this context:
"OTOH there may be alternative definitions that can be used to get
the compiler (or other compiler-like tools) to detect broken code.
Even if the definition can't possibly generate a working kerrnel."

> > 
> > > OTOH there may be alternative definitions that can be used to get
> > > the compiler (or other compiler-like tools) to detect broken code.
> > > Even if the definition can't possibly generate a working kerrnel.
> > 
> > The "list_for_each_entry_inside(pos, type, head, member)" way makes
> > the iterator invisiable outside the loop, and would be catched by
> > compiler if use-after-loop things happened.

> It is also a compete PITA for anything doing a search.

You mean it would be a burden on search? can you show me some examples?

Or you mean it is too long the list_for_each_entry_inside* string to live
in one single line, and should spilt into two line? If it is the case, there
are 2 way to mitigate it.
1. pass a shorter t as struct type to the macro
2. after all list_for_each_entry macros be replaced with
list_for_each_entry_inside, remove the list_for_each_entry implementations
and rename all list_for_each_entry_inside use back to the origin
list_for_each_entry in a single patch.

For me, it is acceptable and not a such big problem.

--
Xiaomeng Tong

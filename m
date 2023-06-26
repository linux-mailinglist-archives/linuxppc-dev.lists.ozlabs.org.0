Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BC73E245
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 16:37:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmFOWR1w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmFOWR1w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqVn04w23z3bWs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 00:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmFOWR1w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmFOWR1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqVm01XDJz30PN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 00:36:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687790202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvcSqXCnz9zVXylEiOugaJe8PBAXaMauU+4YTqF2Kks=;
	b=hmFOWR1w1vEzx1NUfljvU5gj+8P5DOxTrnG2iHwNCq5P8JU56VrDzwJ1oqff9npkfRkhs1
	Hf7QJNDRhjtGECBJUGn6PdsC15rXpPSQcYD+gkMt1MpRbqUpLAd4tYYSS8UmxqunMEuk6R
	rd3poyWVmiR6rlhqULyNdBIroMrD1Ms=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687790202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tvcSqXCnz9zVXylEiOugaJe8PBAXaMauU+4YTqF2Kks=;
	b=hmFOWR1w1vEzx1NUfljvU5gj+8P5DOxTrnG2iHwNCq5P8JU56VrDzwJ1oqff9npkfRkhs1
	Hf7QJNDRhjtGECBJUGn6PdsC15rXpPSQcYD+gkMt1MpRbqUpLAd4tYYSS8UmxqunMEuk6R
	rd3poyWVmiR6rlhqULyNdBIroMrD1Ms=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-So1x6OjLMB-2UratiX8SBw-1; Mon, 26 Jun 2023 10:36:38 -0400
X-MC-Unique: So1x6OjLMB-2UratiX8SBw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7659d103147so158333685a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 07:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790198; x=1690382198;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvcSqXCnz9zVXylEiOugaJe8PBAXaMauU+4YTqF2Kks=;
        b=RmM3JZ9sXUBARVMtRuo3FM7nhov5ZVjKxRO1ECnR3ZN5tGRKU5FSunmv1ooPwxbOaW
         r13b64ydi4KKVivXicP2FcbadeTcFPKBv9+XiTtDoxN1Dku3IvkR+H3VrrvacbKqKiOe
         spKXRAnS4HLuhqr2dWbRT8BYE9iwjP69mcAP26tN5+EfaXy3NFgSkR8rKRIkjYckdMlQ
         eiXBwnlzPTY/kEGJ68UQ/zfs12E4VmOoFvUfao30MqQu1YNTLbaah31kmFyyeMBfK5AP
         qsbhZh22ChgWyWtiygCHpxOg4AOa+qmde+vcxwKQrQ+3tEbN1iLv8s/1mlIXhADMUCZQ
         pePA==
X-Gm-Message-State: AC+VfDzypv1tnKDQfYw6VzrvlPkpoCOBaH/i5OnkVYY1lmR+w1EMKwkQ
	ZnuqGxaT5akMnNwNPcC1T9fBWMhtlS/BSp+TQdt3DY91i42KHYPkaoeuYTPhDpuE204Lzuy84N6
	cLj0IMN9bVEYWQ6dKl4qoTENAQg==
X-Received: by 2002:a05:620a:2b88:b0:762:5179:5d97 with SMTP id dz8-20020a05620a2b8800b0076251795d97mr26896728qkb.12.1687790197724;
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79/JfP3Hny6V9tnqkHShvsxIy9E8rAkOfBtz9lcAvMdQVNdzhuBr1C3eS+Bxuk3VP5Pg8PBg==
X-Received: by 2002:a05:620a:2b88:b0:762:5179:5d97 with SMTP id dz8-20020a05620a2b8800b0076251795d97mr26896682qkb.12.1687790197466;
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
Received: from ypodemsk.tlv.csb (IGLD-84-229-250-192.inter.net.il. [84.229.250.192])
        by smtp.gmail.com with ESMTPSA id pe34-20020a05620a852200b00765a71e399bsm1204141qkn.55.2023.06.26.07.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:36:37 -0700 (PDT)
Message-ID: <cccb5351e48b11e6c657bcfa28632f49cb9cc800.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync
 IPI only to MM CPUs
From: ypodemsk@redhat.com
To: Dave Hansen <dave.hansen@intel.com>, mtosatti@redhat.com, 
 ppandit@redhat.com, david@redhat.com, linux@armlinux.org.uk,
 mpe@ellerman.id.au,  npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com,  gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,  svens@linux.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com,  bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, keescook@chromium.org, 
 paulmck@kernel.org, frederic@kernel.org, will@kernel.org,
 peterz@infradead.org,  ardb@kernel.org, samitolvanen@google.com,
 juerg.haefliger@canonical.com,  arnd@arndb.de, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be,  linus.walleij@linaro.org,
 akpm@linux-foundation.org,  sebastian.reichel@collabora.com,
 rppt@kernel.org, aneesh.kumar@linux.ibm.com,  x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org,  sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 26 Jun 2023 17:36:28 +0300
In-Reply-To: <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
	 <20230620144618.125703-3-ypodemsk@redhat.com>
	 <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
	 <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
	 <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8)
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-06-22 at 06:37 -0700, Dave Hansen wrote:
> On 6/22/23 06:14, ypodemsk@redhat.com wrote:
> > I will send a new version with the local variable as you suggested
> > soon.
> > As for the config name, what about CONFIG_ARCH_HAS_MM_CPUMASK?
> 
> The confusing part about that name is that mm_cpumask() and
> mm->cpu_bitmap[] are defined unconditionally.  So, they're *around*
> unconditionally but just aren't updated.
> 
I think your right about the config name,
How about the
CONFIG_ARCH_USE_MM_CPUMASK?
This has the right semantic as these archs use the cpumask field of the
mm struct.

> BTW, it would also be nice to have _some_ kind of data behind this
> patch.
> 
> Fewer IPIs are better I guess, but it would still be nice if you
> could say:
> 
> 	Before this patch, /proc/interrupts showed 123 IPIs/hour for an
> 	isolated CPU.  After the approach here, it was 0.
> 
> ... or something.

This is part of an ongoing effort to remove IPIs and this one was found
via code inspection.



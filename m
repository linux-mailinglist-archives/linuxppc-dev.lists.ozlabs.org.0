Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 296237080E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 14:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMTQ10dtZz3fCp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 22:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=f1WIjix4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=f1WIjix4;
	dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMTP903Cbz3f8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 22:12:10 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-623921866bfso2407266d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=f1WIjix4LVO2qoUadyymiNEwWX8LVYnKjiZJmHZsA00vpgp8OzN7fLeOXwmxyAsNjQ
         sHOCKYtaHjUeBnmA70xUS7m11Y8GXRs0HF7i7PVSFcwvUzQVx0yAXlGLYQrw7yq7y3KH
         MBoMqwZGJTzwuItitFkcFv88cqBCrBWri+DUGp8Fc0eAqXpc1sD7lY1vf9Zu0c1UnHTi
         g1NSzolGSvoeoheQrwHIwMvc3Rso4DvQpoRRtvFDk7J6iY3SLf6NCCF8S9IRrkOXhhUV
         HRuCy/CUe+KQ4Lk9dlGX7GSjHNglFJk4MTFkm4joUr1QsJe7so9IrOlgfq/tmei89LyY
         B2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=STJhosFCCzcgFVBKjsqR5VoN7o94us44estu80/4ct0piDMynOW4j932naQWYRSmXD
         LCC0picJXhY7zmoI+rFVqGtpFz5XLi6Jb8XkjdhWg+hhfvVwLCzHsFj3PX0icSlGOZJl
         dh7t/iKiVmqf7GN+hTAyvwRZ+L5rpvr9bsUjDB/Bxijk2rE5SlgOZJGROXcQhDUzwm9x
         kTHy9TdL4+XwKJC9na4ZPo13+RBTOrtyI3rTLOjT6QzbV3+lQC0iu58YBkKOaLBuagFO
         2kbqpQajCMpfqUDRP1wI0M8Y9hAJHQxPxA7kyBqSjlUEQLctDPAm+jl5ACm0zw4nIgFE
         wJyg==
X-Gm-Message-State: AC+VfDwCAgu8qPPVOZiAeOpdAm+1TXXLb8XdRM+VIB7pUvKVnlbT8nHP
	tLfEOOxKnugY7OrSQ2GsvsA8ow==
X-Google-Smtp-Source: ACHHUZ7wZ7lgCFFjWmWBQuc0tx+WGJVC/VREvoop6Vbqh2gPTjnAeer0zQN00cudqqAWi4mVPLtPKg==
X-Received: by 2002:a05:6214:2486:b0:5fd:7701:88c5 with SMTP id gi6-20020a056214248600b005fd770188c5mr5974330qvb.6.1684411925806;
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id w8-20020a0562140b2800b006215c5bb2e9sm476635qvj.70.2023.05.18.05.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1pzcUG-0055VE-PF;
	Thu, 18 May 2023 09:12:04 -0300
Date: Thu, 18 May 2023 09:12:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v2 00/34] Split ptdesc from struct page
Message-ID: <ZGYWFIfyDtdpeWg1@ziepe.ca>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Richard Wei
 nberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 01, 2023 at 12:27:55PM -0700, Vishal Moola (Oracle) wrote:
> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.

Lightly related food for future thought - based on some discussions at
LSF/MM it would be really nice if an end result of this was that a
rcu_head was always available in the ptdesc so we don't need to
allocate memory to free a page table.

Jason

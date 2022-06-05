Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423453DA5D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 08:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LG5ky2gX4z3bxC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jun 2022 16:07:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UNdwgXBq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=shorne@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UNdwgXBq;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LG5kJ3Zbwz3bk4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jun 2022 16:07:18 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id g205so10287243pfb.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Jun 2022 23:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ntiAGYWvOui4xB3cbO1kuW43WbW64QLsxlfvqLjsP00=;
        b=UNdwgXBqNRzek8pEr5Qw32/XwVITDA54mg7Kzlts/3Dok86B2ZXU7Lqr1Wdv51FkOu
         D+DjiX7VwRrTKbDe9kWrgm/TbkjVysKd4l5D7wVPorYtHyYfdyRppXHf4MZfzJ7QRI0G
         EC3BWN8KlO2/z7rWQ5i+BIzMbh+leiVDSOc8qAYViWptCWWG4Owq+H4XBnLjjs1xCcOz
         A8JCjb5m0d0MotydVY6eHW9GrrnezCP2hIrGtTB7iBJQaS8HSmbaubLLvbOEwEFd1AwU
         Y4nKLkkmEYL9atMXbUbAZFFBIXckKQRQLkBUUHtnrU17dM/sv/B9E0r1k5EpKBBHQfIF
         cZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ntiAGYWvOui4xB3cbO1kuW43WbW64QLsxlfvqLjsP00=;
        b=JX5qyNuAIy5tbJlh2/704PsB8i7x4oqaEGfLlej43l8aDPAcFiNLcHe6FpJBnRP9yj
         c8czBMI7WtIf+AkW4q6YK4P1PRscH33UagXty4dzMmwlf6AFAU9+rAcoZ7RjlimtRJsM
         x0KpCyXVIu4sTO2TjcrE1HSBQs4N9FKtLib+v5f51ViQpWyEaFZqNRsqkDlSvkiMjSLg
         oN3N/ITDLSgb/yPCFpCn7eiOEmP23f8JxcLvb9nvWtdfcDZkwv5PWjI53i6hyzt1LVPn
         wDzie4IhwG6146T1x7+DSpbV+CP0bJFKWbV/gUXhsIifRY6h0KYBC2pLIztI8/0tdLaL
         uFdQ==
X-Gm-Message-State: AOAM531wKYdVOptzYmx2dJ3j4IBHw3puCapWnr9IyPfwcsOQE8r3/lRW
	UdYj1e98BCzVAeJnE/8IFFg=
X-Google-Smtp-Source: ABdhPJyA1lhiKwlzudDECY/g6A/17Ban2AXmzmlCM0DNLWnaso1OtO7XN2+wdSLdJ6SJvCSQi3abLQ==
X-Received: by 2002:a05:6a00:1594:b0:51b:f4ec:4c02 with SMTP id u20-20020a056a00159400b0051bf4ec4c02mr5896399pfk.27.1654409235449;
        Sat, 04 Jun 2022 23:07:15 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709026e0100b0015e8d4eb231sm8153260plk.123.2022.06.04.23.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 23:07:14 -0700 (PDT)
Date: Sun, 5 Jun 2022 15:07:12 +0900
From: Stafford Horne <shorne@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 6/6] openrisc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YpxIENWD3gOkFiG2@antec>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-7-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603101411.488970-7-anshuman.khandual@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, openrisc@lists.librecores.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 03, 2022 at 03:44:11PM +0530, Anshuman Khandual wrote:
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed.
> 
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: openrisc@lists.librecores.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Is it possible to retract my Acked-by?  I was following the discussion of this
new function actually being sub optimal.  So as far as I am concerned all these
architecture patches should be nak'ed.

-Stafford

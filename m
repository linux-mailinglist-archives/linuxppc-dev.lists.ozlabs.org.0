Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B747F19D488
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:02:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twTM4sbhzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:3201:214:fdff:fe10:1be6;
 helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=E5eRBn79; 
 dkim-atps=neutral
X-Greylist: delayed 570 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 20:59:48 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48twQX05QRzDrgK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:59:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mERVbWXgGi4i/wuevc+zUCb4nOivC5xbEXqj6SvWGr4=; b=E5eRBn79mJ7fTgiP2teaXafDb
 RAKv538vZCZLteLw30abHzEH/yft7gf9K7ZSeh24jcoAzEUbCQokp9j9QFMeyGdkwroVEzCBsgmVY
 ijU1BqeC+tndqnnU+7WWBPOCLJbe3E9xWd3sk6yrsW3/BJ/GPLw8sI05luByMW+mDMa+Z8v+oRnut
 RAn016iE6nkR0wXWfNK393fJU1zAP2LmIYauI6rQSQs+QQv32xNseuDKdqybpbsCl7zXt6tBK8vud
 ijpc8R1vt1W7/8J3ApF3F2yjJc3n89bRD7aWnUlAQBRWfHyX44+X+AbIX/JkTInol19yUP+hs0z/E
 BQzd4T6vA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:33414)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jKIxO-0008N6-8A; Fri, 03 Apr 2020 10:49:46 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jKIxI-0002Zq-D6; Fri, 03 Apr 2020 10:49:40 +0100
Date: Fri, 3 Apr 2020 10:49:40 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <20200403094940.GA25745@shell.armlinux.org.uk>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk>
 <202004021132.813F8E88@keescook>
 <20200403005831.GI23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403005831.GI23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, airlied@linux.ie,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, daniel@ffwll.ch, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 01:58:31AM +0100, Al Viro wrote:
> On Thu, Apr 02, 2020 at 11:35:57AM -0700, Kees Cook wrote:
> 
> > Yup, I think it's a weakness of the ARM implementation and I'd like to
> > not extend it further. AFAIK we should never nest, but I would not be
> > surprised at all if we did.
> > 
> > If we were looking at a design goal for all architectures, I'd like
> > to be doing what the public PaX patchset did for their memory access
> > switching, which is to alarm if calling into "enable" found the access
> > already enabled, etc. Such a condition would show an unexpected nesting
> > (like we've seen with similar constructs with set_fs() not getting reset
> > during an exception handler, etc etc).
> 
> FWIW, maybe I'm misreading the ARM uaccess logics, but... it smells like
> KERNEL_DS is somewhat more dangerous there than on e.g. x86.
> 
> Look: with CONFIG_CPU_DOMAINS, set_fs(KERNEL_DS) tells MMU to ignore
> per-page permission bits in DOMAIN_KERNEL (i.e. for kernel address
> ranges), allowing them even if they would normally be denied.  We need
> that for actual uaccess loads/stores, since those use insns that pretend
> to be done in user mode and we want them to access the kernel pages.
> But that affects the normal loads/stores as well; unless I'm misreading
> that code, it will ignore (supervisor) r/o on a page.  And that's not
> just for the code inside the uaccess blocks; *everything* done under
> KERNEL_DS is subject to that.
> 
> Why do we do that (modify_domain(), that is) inside set_fs() and not
> in uaccess_enable() et.al.?

First, CONFIG_CPU_DOMAINS is used on older ARMs, not ARMv7. Second,
the kernel image itself is not RO-protected on any ARM32 platform.

If we get rid of CONFIG_CPU_DOMAINS, we will use the ARMv7 method of
user access, which is to use normal load/stores for the user accessors
and every access must check against the address limit, even the
__-accessors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up

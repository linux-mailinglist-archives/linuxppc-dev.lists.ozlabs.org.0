Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33119DCC4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 19:29:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v6PD6sWLzF0c5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 04:29:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2002:c35c:fd02::1;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v6MH2pgbzF0RC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 04:27:39 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jKQ5j-009k01-D3; Fri, 03 Apr 2020 17:26:51 +0000
Date: Fri, 3 Apr 2020 18:26:51 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <20200403172651.GJ23230@ZenIV.linux.org.uk>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk>
 <202004021132.813F8E88@keescook>
 <20200403005831.GI23230@ZenIV.linux.org.uk>
 <20200403112609.GB26633@mbp>
 <20200403133719.GC25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403133719.GC25745@shell.armlinux.org.uk>
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
 Catalin Marinas <catalin.marinas@arm.com>, hpa@zytor.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, daniel@ffwll.ch, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 03, 2020 at 02:37:19PM +0100, Russell King - ARM Linux admin wrote:

> > I think uaccess_enable() could indeed switch the kernel domain if
> > KERNEL_DS is set and move this out of set_fs(). It would reduce the
> > window the kernel domain permissions are overridden. Anyway,
> > uaccess_enable() appeared much later on arm when Russell introduced PAN
> > (SMAP) like support by switching the user domain.
> 
> Yes, that would be a possibility.  Another possibility would be to
> eliminate as much usage of KERNEL_DS as possible

That's definitely worth doing, but that's another long-term project ;-/

> - I've just found
> one instance in sys_oabi-compat.c that can be eliminated (epoll_ctl)
> but there's several there that can't with the current code structure,
> and re-coding the contents of some fs/* functions to work around that
> is a very bad idea.  If there's some scope for rejigging some of the
> fs/* code, it may be possible to elimate some other cases in there.

Well, your do_locks() definitely can be converted.  epoll_wait()...
not sure, need to look into that.  Is that about the layout mismatch
between struct oabi_epoll_event and struct epoll_event?  In case of
semtimedop...  Hell knows, I would probably consider moving that thing
into ipc/sem.c under ifdef...

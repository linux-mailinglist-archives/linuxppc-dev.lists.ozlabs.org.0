Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689820C9D1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 21:09:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49w0Y21TfCzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 05:09:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ktwj=aj=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49w0WP5WKtzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 05:08:01 +1000 (AEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 669E0204EA;
 Sun, 28 Jun 2020 19:07:57 +0000 (UTC)
Date: Sun, 28 Jun 2020 15:07:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Message-ID: <20200628150755.523fbb2c@oasis.local.home>
In-Reply-To: <20200628015041.1000002-1-masahiroy@kernel.org>
References: <20200628015041.1000002-1-masahiroy@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kbuild@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Sami Tolvanen <samitolvanen@google.com>, Rich Felker <dalias@libc.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 28 Jun 2020 10:50:41 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> convenient way to filter out flags for every object in a directory.
> 
> Add ccflags-remove-y and asflags-remove-y to make it easily.
> 
> Use ccflags-remove-y to clean up some Makefiles.
> 
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Nice feature!

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57663173899
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 14:44:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TW3Y1m6FzDrP4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 00:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TW193jTkzDrMS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 00:42:03 +1100 (AEDT)
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1j7fts-0002rn-Jc; Fri, 28 Feb 2020 13:41:56 +0000
Date: Fri, 28 Feb 2020 14:41:55 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Christian Kellner <christian@kellner.me>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] selftests: pidfd: Add pidfd_fdinfo_test in .gitignore
Message-ID: <20200228134155.2rzxeqwrlofmtre4@wittgenstein>
References: <966567c7dbaa26a06730d796354f8a086c0ee288.1582847778.git.christophe.leroy@c-s.fr>
 <DB631DFB-DF8B-4B95-AC50-74F1ED733CAE@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DB631DFB-DF8B-4B95-AC50-74F1ED733CAE@ubuntu.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 01:18:44AM +0100, Christian Brauner wrote:
> On February 28, 2020 1:00:08 AM GMT+01:00, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> >The commit identified below added pidfd_fdinfo_test
> >but failed to add it to .gitignore
> >
> >Fixes: 2def297ec7fb ("pidfd: add tests for NSpid info in fdinfo")
> >Cc: stable@vger.kernel.org
> >Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >---
> > tools/testing/selftests/pidfd/.gitignore | 1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/tools/testing/selftests/pidfd/.gitignore
> >b/tools/testing/selftests/pidfd/.gitignore
> >index 3a779c084d96..39559d723c41 100644
> >--- a/tools/testing/selftests/pidfd/.gitignore
> >+++ b/tools/testing/selftests/pidfd/.gitignore
> >@@ -2,4 +2,5 @@ pidfd_open_test
> > pidfd_poll_test
> > pidfd_test
> > pidfd_wait
> >+pidfd_fdinfo_test
> > pidfd_getfd_test
> 
> Thanks for spotting this.
> I'll pick this up along with other fixes I have waiting.
> 
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Applied, thanks!
Christian

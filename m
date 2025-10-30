Return-Path: <linuxppc-dev+bounces-13546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22C4C1E16D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 03:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxnYK3sMLz30V1;
	Thu, 30 Oct 2025 13:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761790021;
	cv=none; b=OrDq4xSxzBURssEewO/TOl3MlV6yeNeXwQ6ghhzUlMJhzae43JsSWsZm7CblF7/hgL4ie3Q2iVXPLXkorzUnE1vUECzEWhWXs+0pYaS/zgNDJZ2nn4qgb9SjGZv+ZbbnIpWs3/5v6cithCRgdj6hEO4KmcXE4Xa/6OegbG0/jh+YRYNvNE9CwaoC0xSFHXrjFpnPmQgVaW9wX9CXjQBrlCW4qOdtAjFU6amAzbbntUPd4woGZumbLQBSOX5hrNlgGDMaNVrmc5WFgONoOsU09uCjCcc6EVLEd0SaiPSCU4iF6uhPPba0qTq8Xygj7C+LiG7fa8HFWdpvXYuPChdvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761790021; c=relaxed/relaxed;
	bh=LV0l3z7s5gwWzj5KKxIgtC9jun1cTdUQO0+44wJVEBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laIvLr/FO3rIZr5DRkIf/gtdHqXtZJ8a52Z89zL4wjPnkc7O+2GE9lHOoGG+2niX3TYQdEJmrZgasu8wbMH3ncaSSJcf9L2fd3M76rXa/tpw3szUikYBhNYn+S9mtIf2HoDxMZkoztqiHX2+kjz8uJYkQHcK30GfudI++eW7hVEUVx/0XYgIeCUHrqY4g2/8qEfPuOSYFGgpQ4y6pJzji+ChEf+OChZkXk6dfZfa6boHEyMs4sVYgvoPpNuVjBu388jElaBQXs20vBikz/Zwb+FquDdwXIYMyjAN+EShtNMz623iSVS+z1HtAxn3MfnrpFxJ+nTyomcHc0zJEuTwyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TC57vMus; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TC57vMus;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxnYJ3p5wz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:07:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F33C43FBE;
	Thu, 30 Oct 2025 02:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BDAC4CEF7;
	Thu, 30 Oct 2025 02:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761790017;
	bh=Rthz/4IIRmvVhdfDJd8kZo8uxHxwQpuo8eBON/C4eSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TC57vMusi/aa3zEGk8ikQxQbM5lhu/4aKDrAguw13/YM74145hdH63XJD8xhU2lgv
	 Mm2o7ORJ5xmS7JLLTMvNhZD5mIMJNfFKjOJvYlMEax4l3aIWWSOmjZ01rKZgRCPnC/
	 PTaOA7hIBBLNghUT595paP7Glm6whnrlpOXoHfPP4iQeDPkGUrHu/YE+5QTTomWWzv
	 8DN5p5myDHyA4ME4/Rqr3gNwmEF3Ednhj0GJxFCst1cwroQwUUc0dBNe13gbjvdZtC
	 tL+YBe4/wDXeKRTCvoSpDmCqqILGj+vvgBpJ4gADkcPwkb0MOCq1OrzNEcXJ8eWgGE
	 GlqPheTTEyliw==
Date: Wed, 29 Oct 2025 19:06:54 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Petr Mladek <pmladek@suse.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, joe.lawrence@redhat.com, Naveen N Rao <naveen@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
Message-ID: <wxqithrj3vvgbefr7d7afv5vcnuu2ssuzrw6fqtmdjtq3ete3j@pfsgyacqjama>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
 <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
 <aPjW3P2AU7L71S-s@pathway.suse.cz>
 <ee9aaeec-23bf-42ac-8a8d-4ba899cfdd13@linux.ibm.com>
 <aPnxlEkV1rL0hWOm@pathway.suse.cz>
 <875b21ae-c30f-4dff-bef2-e41965013416@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875b21ae-c30f-4dff-bef2-e41965013416@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 11:42:54PM +0530, Hari Bathini wrote:
> Hi Petr,
> On 23/10/25 2:42 pm, Petr Mladek wrote:
> > On Wed 2025-10-22 19:56:45, Venkat Rao Bagalkote wrote:
> > > 
> > > On 22/10/25 6:36 pm, Petr Mladek wrote:
> > > > On Wed 2025-10-22 17:36:18, Venkat Rao Bagalkote wrote:
> > > > > On 22/10/25 1:52 pm, Venkat Rao Bagalkote wrote:
> > > > > > Greetings!!!
> > > > > > 
> > > > > > 
> > > > > > IBM CI has reported kernel boot warnings with next-20251022 kernel. I
> > > > > > see there are couple of warnings hit and eventually system boots to
> > > > > > emergency mode.
> > > > > > 
> > > > > > 
> > > > > With the identified first bad commit, is casuing the kernel to boot to
> > > > > emergency mode. I reverted the bad commit and built the kernel, then kernel
> > > > > is booting fine, but with boot warnings.
> > > > I guess that it is the same problem which should get fixed by the patch
> > > > https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org
> > > 
> > > 
> > > Thank you Petr, for pointing to the fix patch. It fixes the kernel booting
> > > to emergency mode.
> > 
> > Great.
> > 
> > > But boot warning still persists.
> > 
> > I looks like another problem. I would expect that it is in
> > the ftrace code, either in the generic or arch-specific part.
> Yeah. This is part of arch-specific code that does init of ftrace
> out line stubs. The problem seems to be since commit 1ba9f8979426
> ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros").
> Before this commit, .text.startup section was featured in INIT_TEXT
> but now it seems to feature in TEXT. Is this change right/intentional?
> If yes, I can post a fix patch in ftrace arch-specific code accordingly.

Ah, I wasn't aware of .text.startup.  Apparently it's used by KASAN,
KCSCAN and GCOV for a significant amount of constructor code, which is
only called during boot.  So we should try to keep it in .init.text.

Venkat, does this fix it?

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 5facbc9946344..9de1d900fa154 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -88,13 +88,29 @@
 
 /*
  * Support -ffunction-sections by matching .text and .text.*,
- * but exclude '.text..*'.
+ * but exclude '.text..*', .text.startup[.*], and .text.exit[.*].
  *
- * Special .text.* sections that are typically grouped separately, such as
+ * .text.startup and .text.startup.* are matched later by INIT_TEXT.
+ * .text.exit and .text.exit.* are matched later by EXIT_TEXT.
+ *
+ * Other .text.* sections that are typically grouped separately, such as
  * .text.unlikely or .text.hot, must be matched explicitly before using
  * TEXT_MAIN.
  */
-#define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
+#define TEXT_MAIN							\
+	.text								\
+	.text.[_0-9A-Za-df-rt-z]*					\
+	.text.s[_0-9A-Za-su-z]*						\
+	.text.st[_0-9A-Zb-z]*						\
+	.text.sta[_0-9A-Za-qs-z]*					\
+	.text.star[_0-9A-Za-su-z]*					\
+	.text.start[_0-9A-Za-tv-z]*					\
+	.text.startu[_0-9A-Za-oq-z]*					\
+	.text.startup[_0-9A-Za-z]*					\
+	.text.e[_0-9A-Za-wy-z]*						\
+	.text.ex[_0-9A-Za-hj-z]*					\
+	.text.exi[_0-9A-Za-su-z]*					\
+	.text.exit[_0-9A-Za-z]*
 
 /*
  * Support -fdata-sections by matching .data, .data.*, and others,
@@ -713,16 +729,16 @@
 
 #define INIT_TEXT							\
 	*(.init.text .init.text.*)					\
-	*(.text.startup)
+	*(.text.startup .text.startup.*)
 
 #define EXIT_DATA							\
 	*(.exit.data .exit.data.*)					\
 	*(.fini_array .fini_array.*)					\
-	*(.dtors .dtors.*)						\
+	*(.dtors .dtors.*)
 
 #define EXIT_TEXT							\
 	*(.exit.text)							\
-	*(.text.exit)							\
+	*(.text.exit .text.exit.*)
 
 #define EXIT_CALL							\
 	*(.exitcall.exit)


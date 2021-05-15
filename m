Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627B381692
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 09:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhxnq2lWSz3bsL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 17:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.33; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Received: from smtprelay.hostedemail.com (smtprelay0033.hostedemail.com
 [216.40.44.33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhxnS4vfKz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 17:27:55 +1000 (AEST)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 6060118026A05;
 Sat, 15 May 2021 07:27:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id B36F22448B4; 
 Sat, 15 May 2021 07:27:46 +0000 (UTC)
Message-ID: <acff710e1cde66db686273d430a0798c4ea4f41e.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From: Joe Perches <joe@perches.com>
To: Pavel Machek <pavel@ucw.cz>, Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 May 2021 00:27:45 -0700
In-Reply-To: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <20210515071410.GA27201@amd>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.60
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: B36F22448B4
X-Stat-Signature: sk6bp1su8mgpmhdudeekd6zmd57nm8uk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18VobztuKx5cPb+cCAmoDLIOZAXmsA6C+8=
X-HE-Tag: 1621063666-295586
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2021-05-15 at 09:14 +0200, Pavel Machek wrote:
> On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> > The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> > GCC 5.1.
> 
> Please don't. I'm still on 4.9 on machine I can't easily update,

Why is that?  Later compiler versions are available.
http://cdn.kernel.org/pub/tools/crosstool/

Is there some other reason your machine can not have the compiler
version updated?



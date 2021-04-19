Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51505363A20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:10:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtf11yVRz3ft0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVr04Pgz3cTd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:34 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVd24ZHz9vHP; Mon, 19 Apr 2021 14:04:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210301153019.362742-1-masahiroy@kernel.org>
References: <20210301153019.362742-1-masahiroy@kernel.org>
Subject: Re: [PATCH 1/2] powerpc: syscalls: switch to generic syscalltbl.sh
Message-Id: <161880479712.1398509.4808432527378753490.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Christopherson <seanjc@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ben Gardon <bgardon@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Mar 2021 00:30:18 +0900, Masahiro Yamada wrote:
> Many architectures duplicate similar shell scripts.
> 
> This commit converts powerpc to use scripts/syscalltbl.sh. This also
> unifies syscall_table_32.h and syscall_table_c32.h.

Applied to powerpc/next.

[1/2] powerpc: syscalls: switch to generic syscalltbl.sh
      https://git.kernel.org/powerpc/c/14b3c9d24a7a5c274a9df27d245516f466d3bc5f
[2/2] powerpc: syscalls: switch to generic syscallhdr.sh
      https://git.kernel.org/powerpc/c/672bff581e19d5d7bef993f910ed385c4054cbbc

cheers

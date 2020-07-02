Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE9212B06
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 19:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yPrF0CDYzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=2vkx=an=arm.com=catalin.marinas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yPpB2T8rzDqww
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 03:14:10 +1000 (AEST)
Received: from localhost.localdomain (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC32F21534;
 Thu,  2 Jul 2020 17:14:03 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
Date: Thu,  2 Jul 2020 18:14:02 +0100
Message-Id: <159370984726.27923.4874334372278158979.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Amit Kachhap <amit.kachhap@arm.com>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, John Donnelly <john.p.donnelly@oracle.com>,
 scott.branden@broadcom.com, Boris Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, bhupesh.linux@gmail.com,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Dave Anderson <anderson@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 May 2020 00:22:35 +0530, Bhupesh Sharma wrote:
> Apologies for the delayed update. Its been quite some time since I
> posted the last version (v5), but I have been really caught up in some
> other critical issues.
> 
> Changes since v5:
> ----------------
> - v5 can be viewed here:
>   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> - Addressed review comments from James Morse and Boris.
> - Added Tested-by received from John on v5 patchset.
> - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
>   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
>   applied.
> 
> [...]

Applied to arm64 (for-next/vmcoreinfo), thanks!

[1/2] crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
      https://git.kernel.org/arm64/c/1d50e5d0c505
[2/2] arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
      https://git.kernel.org/arm64/c/bbdbc11804ff

-- 
Catalin


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8F47E154
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKR7l2Qr5z3056
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 21:21:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wa2LpEvo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Wa2LpEvo; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKR744wdHz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 21:21:18 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v138so14969172ybb.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=KsIOojEX08aWCewXg//rXmzHnn7mySZCYR+v7sS+FY4=;
 b=Wa2LpEvof2ondCIqXxDyABniFVWbQVENcZwSGEP8lok7abdGSB2qfjYwbtpF42Ea/v
 TrlJALAgRvrAeNSkgHpisCZeSUQUzM0Lyfp3RGwPprOm29/BDMM2oEQCTGDfoDPjoTI4
 9OhOXA2cx5BAbgYO/GAgRBJHB0gtJ+pLmc5gpJv5MsEZ1eSCMkAJ3XnC8rwqMRTPFcNH
 4i3VElIXcZdVGpJwrd/Ucj/Y7ONIR8rPYdgxqePGH+qRMcBEVC8X4wuNrnTWy4z41pxv
 k/PzRvPHFj8MK8IEs1IaYDBqPF+8kIavD+YA3gsrtGR4TOnepPUxKXG+4otjWrXCRkwf
 uxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=KsIOojEX08aWCewXg//rXmzHnn7mySZCYR+v7sS+FY4=;
 b=5cOUsO8f1pV6L+Ijseth8oA+cdeq8eh4GDxnKnIRewnf/yybiNkzA0r1D8S7ep52RX
 70JIu5c/1EWR/MKzZCpKggMhkCJA3XDAkh2RBvtwk3m4pF4Cx2qgi5l1sDQZl9Ju3DRT
 9b/CNQQNyau12YP9buhaODgXHOYuJCihWoeo80dG0CrMlc6s65WSqQ1ln0GM2qwFP3lZ
 ukl+oUAy4dZspZWgvAkNNbUZcWI5y0rC7GUNtRgjkvJXqG0bQn7p+ce/ey29vlKvwStd
 3jdGDrLx/hATLDKKPOBToANclxX71Ka1bykMUlgQ0shw5hMGV1UcVJecd1nZsgaGtgHf
 GP6A==
X-Gm-Message-State: AOAM531F67mh8jsHcbIo4mW81EVcvgrshp4cuOQ4s4xpyI+fR2IlDDrP
 9gLXXke2NAP0G/dVbkfNDF2bugsd4yCgMTE0vHU=
X-Google-Smtp-Source: ABdhPJwXP0cYtdT8YXvq84jv2kX03nIHs5jmPaQNQMbpX3WzXkgAWIGsBTcOhtCkpjUSaZCq7wGhyXpac3FTXMMywAE=
X-Received: by 2002:a25:cad5:: with SMTP id a204mr2537986ybg.234.1640254873841; 
 Thu, 23 Dec 2021 02:21:13 -0800 (PST)
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 23 Dec 2021 11:21:03 +0100
Message-ID: <CAKXUXMxa6zuTncNjTVHeU7nJ9uvv3KqMtSDocMC7P5hxfrkakQ@mail.gmail.com>
Subject: code conditional on non-existing PPC_EARLY_DEBUG_MICROWATT.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Benjamin, dear Paul, dear Michael,

with commit 48b545b8018d ("powerpc/microwatt: Use standard 16550 UART
for console"), you have some code in arch/powerpc/kernel/udbg_16550.c,
conditional on the Kconfig symbol PPC_EARLY_DEBUG_MICROWATT. However,
since then, the definition of this Kconfig symbol was never introduced
to the mainline repository or current linux-next, nor am I finding any
pending patch for that.

Are you going to add this config definition soon? Or did you identify
that this setup code in udbg_16550.c is not actually needed and can we
simply drop this code again?

This issue was identified with the script ./scripts/checkkconfigsymbols.py.


Best regards,

Lukas

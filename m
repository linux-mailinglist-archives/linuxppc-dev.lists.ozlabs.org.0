Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCF2E9CED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 19:21:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8kTs2c2HzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 05:21:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ieqh=gh=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TJ/P9NLk; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8kRt0smKzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 05:19:37 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E30E62075E;
 Mon,  4 Jan 2021 18:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609784374;
 bh=ukt7xqDhEg4NPsqEIeqnYcJ4ZsYfKDlQcDv8APTbPPs=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=TJ/P9NLkiyCMcNQ8Fbb24X3VwvH0lcuNOd/RqtQowt4CzPPOSF0SLw2P54RuwXuuw
 FI2GesZHuSLY2ySNk5vfYi74AaAm2TH8297OtRgSf5uh1xE5AcQKcaVedGvL5KuCGr
 fAndVP6EkS+hh2S/kpebHt8QTkmLNhaN+A/L0mrNQX9rpG5azTGX30Q+1N+jp3co1b
 eY9Nk/iazgr5Zw01/MJK0O9X3slK1R03JfHSzcM39LZQ5S9ikh4CVnC4vKeG7KGMam
 ZVynrSvn6JT9A4dlaSMN5+AOtSBa+PGO6wuh0qgkaLe7slSFTPqLVGlYhWdhGITRku
 eRi5JE4YDTlKg==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 80F3A3522F46; Mon,  4 Jan 2021 10:19:34 -0800 (PST)
Date: Mon, 4 Jan 2021 10:19:34 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] Fix kprobes issue by moving RCU-tasks initialization
 earlier
Message-ID: <20210104181934.GA16612@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, urezki@gmail.com,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello, Linus,

This fix is for a regression in the v5.10 merge window, but it was
reported quite late in the v5.10 process, plus generating and testing
the fix took some time.

The regression is due to 36dadef23fcc ("kprobes: Init kprobes in
early_initcall") which on powerpc can use RCU Tasks before initialization,
resulting in boot failures.  The fix is straightforward, simply moving
initialization of RCU Tasks before the early_initcall()s.  The fix has
been exposed to -next and kbuild test robot testing, and has been
tested by the PowerPC guys.

The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/urgent

for you to fetch changes up to 1b04fa9900263b4e217ca2509fd778b32c2b4eb2:

  rcu-tasks: Move RCU-tasks initialization to before early_initcall() (2020-12-14 15:31:13 -0800)

----------------------------------------------------------------
Uladzislau Rezki (Sony) (1):
      rcu-tasks: Move RCU-tasks initialization to before early_initcall()

 include/linux/rcupdate.h |  6 ++++++
 init/main.c              |  1 +
 kernel/rcu/tasks.h       | 25 +++++++++++++++++++++----
 3 files changed, 28 insertions(+), 4 deletions(-)

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A537F28D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:24:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwSgrfyt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZJq2218yz3vlT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwSgrfyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZJnr3wjnz3dWZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 20:23:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D1A261751;
	Tue, 21 Nov 2023 09:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508DAC433C9;
	Tue, 21 Nov 2023 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700558583;
	bh=2JJEl9qZRNXTp7V/aOBIfQzLTFERSRdjiQ6fUrNoPtw=;
	h=From:To:Cc:Subject:Date:From;
	b=iwSgrfytuw8hnUaoDVzv7qtXXWU4WyVhfAxblRHJchTAK2tSuyagK2rZEAi4gBIQJ
	 JdocksuBYkgUph7bj/c+wEoFOHcc3mx5yv0ulIMutaTqvd69qDJ3ls8ETbky0PqU0E
	 27lnClMCcoXqMRGdTmqr4DFb3ohg3WPkH6aRY6j8dwwx2B9S6AnrQROeGShCw+RJLR
	 w55DkZMcZvy3rNVUXblSJBJX8OSJQ2yYlqaOtr9ZzqAQ5LmSVsO/3Vpw2l8IpAxzOc
	 2qy0KjAcwBxe+38uvGAZom6klSDhE7z+KWs85WHzIboLzUobKTeQsMSkOkMehbqfmj
	 0+91yF/EkPigg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 00/17] tty: small cleanups and fixes
Date: Tue, 21 Nov 2023 10:22:41 +0100
Message-ID: <20231121092258.9334-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-serial@vger.kernel.org, Jan Kara <jack@suse.com>, Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a series to fix/clean up some obvious issues I revealed during
u8+size_t conversions (to be posted later).

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jan Kara <jack@suse.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-alpha@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>
Cc: netdev@vger.kernel.org
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>

Jiri Slaby (SUSE) (17):
  tty: deprecate tty_write_message()
  tty: remove unneeded mbz from tiocsti()
  tty: fix tty_operations types in documentation
  tty: move locking docs out of Returns for functions in tty.h
  tty: amiserial: return from receive_chars() without goto
  tty: amiserial: use bool and rename overrun flag in receive_chars()
  tty: ehv_bytecha: use memcpy_and_pad() in local_ev_byte_channel_send()
  tty: goldfish: drop unneeded temporary variables
  tty: hso: don't emit load/unload info to the log
  tty: hso: don't initialize global serial_table
  tty: hvc_console: use flexible array for outbuf
  tty: nozomi: remove unused debugging DUMP()
  tty: srmcons: use 'buf' directly in srmcons_do_write()
  tty: srmcons: use 'count' directly in srmcons_do_write()
  tty: srmcons: make srmcons_do_write() return void
  tty: srmcons: switch need_cr to bool
  tty: srmcons: make 'str_cr' const and non-array

 arch/alpha/kernel/srmcons.c   | 29 +++++++++++++----------------
 drivers/net/usb/hso.c         | 11 -----------
 drivers/tty/amiserial.c       | 10 ++++------
 drivers/tty/ehv_bytechan.c    |  7 +++++--
 drivers/tty/goldfish.c        |  7 ++-----
 drivers/tty/hvc/hvc_console.c |  4 +---
 drivers/tty/hvc/hvc_console.h |  2 +-
 drivers/tty/nozomi.c          | 18 ------------------
 drivers/tty/tty_io.c          |  8 ++++++--
 include/linux/tty.h           | 12 +++++++-----
 include/linux/tty_driver.h    |  5 ++---
 11 files changed, 41 insertions(+), 72 deletions(-)

-- 
2.42.1


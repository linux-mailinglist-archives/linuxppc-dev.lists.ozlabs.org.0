Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76974797307
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 16:22:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhLzQ2JJgz3cGW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 00:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhLyw61Ybz3bZr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 00:21:42 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4RhLyj3MrZz4x7fS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 16:21:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
	by laurent.telenet-ops.be with bizsmtp
	id j2MX2A00R2mGBSJ012MXeZ; Thu, 07 Sep 2023 16:21:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qeFsi-002mG7-Eb;
	Thu, 07 Sep 2023 16:21:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qeFsx-00CNC6-LL;
	Thu, 07 Sep 2023 16:21:31 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 0/2] m68k/powerpc: Kill references to non-existent README.legal
Date: Thu,  7 Sep 2023 16:21:28 +0200
Message-Id: <cover.1694095086.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

	Hi all,

Several source files contain license boilerplate that refers to the file
"README.legal", which never existed in upstream Linux.  This is a relic
from the early port of Linux to the m68k processor family, before it was
merged in v1.3.94.  Later, copies of this boilerplate ended up in the
PowerPC port.

The "README.legal" file (from e.g. [1]) read:

---8<-----------------------------------------------------------------
Legal information about the Linux/68k software package

All files contained in this archive are copyrighted by one or more
person.  They are not in the public domain.

Most of the files are copyrighted by Linus Torvalds, the original
writer of Linux for IBM PC clone systems.  Some parts are copyrighted
by other IBM PC linux developers.  Other parts are copyrighted by
Linux/68k developers.

This package is subject to the terms and conditions of the GNU General
Public License.  A copy of this license may be found in the file named
"COPYING" which should be in the same directory as this file.  If the
file has been omitted, you may obtain it by writing to the Free
Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
----------------------------------------------------------------->8---

Note that the "COPYING" file at that time corresponded to the version
from upstream Linux v0.99.11 until v2.1.104, and thus predated the
addition of the "only valid GPL version is v2" clause in v2.4.0-test8.

This patch series gets rid of the references to README.legal by
replacing the boilerplate with SPDX license identifiers.

Thanks for your comments!

[1] https://www.ibiblio.org/pub/historic-linux/ftp-archives/tsx-11.mit.edu/Oct-07-1996/680x0/v0.9/linux-0.9.tar.gz

Geert Uytterhoeven (2):
  m68k: Replace GPL 2.0+ README.legal boilerplate by SPDX
  powerpc: Replace GPL 2.0+ README.legal boilerplate by SPDX

 arch/m68k/68000/entry.S             | 7 ++-----
 arch/m68k/bvme6000/config.c         | 5 +----
 arch/m68k/coldfire/entry.S          | 7 ++-----
 arch/m68k/ifpsp060/Makefile         | 6 ++----
 arch/m68k/kernel/entry.S            | 7 ++-----
 arch/m68k/kernel/head.S             | 8 ++------
 arch/m68k/mvme147/config.c          | 5 +----
 arch/m68k/mvme16x/config.c          | 5 +----
 arch/m68k/q40/config.c              | 5 +----
 arch/powerpc/kernel/ptrace/ptrace.c | 5 +----
 arch/powerpc/kernel/signal.c        | 5 +----
 arch/powerpc/kernel/signal.h        | 7 ++-----
 12 files changed, 18 insertions(+), 54 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

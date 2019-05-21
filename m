Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBEC25A4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 00:26:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457r2J4W5RzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 08:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.109; helo=emh03.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
X-Greylist: delayed 347 seconds by postgrey-1.36 at bilbo;
 Wed, 22 May 2019 08:24:56 AEST
Received: from emh03.mail.saunalahti.fi (emh03.mail.saunalahti.fi
 [62.142.5.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457r1447sHzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 08:24:56 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi
 [85.76.4.80])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id E6C364004B;
 Wed, 22 May 2019 01:18:59 +0300 (EEST)
Date: Wed, 22 May 2019 01:18:59 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Subject: [BISECTED] kexec regression on PowerBook G4
Message-ID: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I was trying to upgrade from v5.0 -> v5.1 on PowerBook G4, but when trying
to kexec a kernel the system gets stuck (no errors seen on the console).

Bisected to: 93c4a162b014 ("powerpc/6xx: Store PGDIR physical address
in a SPRG"). This commit doesn't revert cleanly anymore but I tested
that the one before works OK.

With current Linus HEAD (9c7db5004280), it gets a bit further but still
doesn't work: now I get an error on the console after kexec "Starting
new kernel! ... Bye!":

	kernel tried to execute exec-protected page (...) - exploit attempt?

A.

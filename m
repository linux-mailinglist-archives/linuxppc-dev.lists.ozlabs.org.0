Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855519E727
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 20:43:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vm0Y560SzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 04:43:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu
 (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mit.edu
X-Greylist: delayed 202 seconds by postgrey-1.36 at bilbo;
 Sun, 05 Apr 2020 04:40:57 AEST
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vlxP5MS1zDrVM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 04:40:57 +1000 (AEST)
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 034Ib7GU017545
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 4 Apr 2020 14:37:08 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 80DC1420021; Sat,  4 Apr 2020 14:37:07 -0400 (EDT)
Date: Sat, 4 Apr 2020 14:37:07 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: syzbot <syzbot+67e4f16db666b1c8253c@syzkaller.appspotmail.com>
Subject: Re: WARNING in ext4_da_update_reserve_space
Message-ID: <20200404183707.GK45598@mit.edu>
References: <0000000000008c5a4605a24cbb16@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000008c5a4605a24cbb16@google.com>
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
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de, muriloo@linux.ibm.com,
 a@unstable.cc, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 b.a.t.m.a.n@diktynna.open-mesh.org, netdev@vger.kernel.org,
 adilger.kernel@dilger.ca, paulus@samba.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev

I'm curious why this is only showing up as failing on next-next.
Let's see if it fails on the ext4.git tree.

From the bisect logs syzbot is able to repro on all of v5.x and
v4.20.0.  However, I'm not able to repro it using kvm with either
v5.6-rc4 or the tip of the ext4 git tree.  So let's see what syzbot
can do with the tip of the dev tree.

						- Ted
